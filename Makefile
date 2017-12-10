ifeq (,$(shell which sha1sum))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBASM := rgbasm
RGBFIX := rgbfix
RGBGFX := rgbgfx
RGBLINK := rgblink

.SUFFIXES:
.PHONY: all clean tools compare crystal crystal11
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:


crystal_obj := \
wram.o \
main.o \
lib/mobile/main.o \
home.o \
audio.o \
maps.o \
engine/events.o \
engine/credits.o \
data/egg_moves.o \
data/evos_attacks.o \
data/pokedex/entries.o \
misc/crystal_misc.o \
text/common_text.o \
gfx/pics.o

crystal11_obj := $(crystal_obj:.o=11.o)


roms := pokecrystal.gbc pokecrystal11.gbc

all: crystal
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc

clean:
	rm -f $(roms) $(crystal_obj) $(crystal11_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


$(crystal11_obj): RGBASMFLAGS = -D CRYSTAL11

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
define DEP
$1: $2 $$(shell tools/scan_includes $2)
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

$(foreach obj, $(crystal11_obj), $(eval $(call DEP,$(obj),$(obj:11.o=.asm))))
$(foreach obj, $(crystal_obj), $(eval $(call DEP,$(obj),$(obj:.o=.asm))))

endif


pokecrystal11.gbc: $(crystal11_obj) pokecrystal.link
	$(RGBLINK) -n pokecrystal11.sym -m pokecrystal11.map -l pokecrystal.link -o $@ $(crystal11_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PM_CRYSTAL $@
	sort pokecrystal11.sym -o pokecrystal11.sym

pokecrystal.gbc: $(crystal_obj) pokecrystal.link
	$(RGBLINK) -n pokecrystal.sym -m pokecrystal.map -l pokecrystal.link -o $@ $(crystal_obj)
	$(RGBFIX) -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	sort pokecrystal.sym -o pokecrystal.sym


# For files that the compressor can't match, there will be a .lz file suffixed with the md5 hash of the correct uncompressed file.
# If the hash of the uncompressed file matches, use this .lz instead.
# This allows pngs to be used for compressed graphics and still match.

%.lz: hash = $(shell tools/md5 $(*D)/$(*F) | sed "s/\(.\{8\}\).*/\1/")
%.lz: %
	$(eval filename := $@.$(hash))
	$(if $(wildcard $(filename)),\
		cp $(filename) $@,\
		tools/lzcomp $< $@)


### Terrible hacks to match animations. Delete these rules if you don't care about matching.

# Dewgong has an unused tile id in its last frame. The tile itself is missing.
gfx/pics/dewgong/frames.asm: gfx/pics/dewgong/front.animated.tilemap gfx/pics/dewgong/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$4d" >> $@

# Lugia has two unused tile ids in its last frame. The tiles themselves are missing.
gfx/pics/lugia/frames.asm: gfx/pics/lugia/front.animated.tilemap gfx/pics/lugia/front.dimensions
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$5e, \$$59" >> $@

# Girafarig has a redundant tile after the end. It is used in two frames, so it must be injected into the generated graphics.
# This is more involved, so it's hacked into pokemon_animation_graphics.
gfx/pics/girafarig/front.animated.2bpp: gfx/pics/girafarig/front.2bpp gfx/pics/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -o $@ $^
gfx/pics/girafarig/front.animated.tilemap: gfx/pics/girafarig/front.2bpp gfx/pics/girafarig/front.dimensions
	tools/pokemon_animation_graphics --girafarig -t $@ $^


### Pokemon pic graphics rules

gfx/pics/%/normal.gbcpal: gfx/pics/%/front.png
	$(RGBGFX) -p $@ $<
gfx/pics/%/normal.pal: gfx/pics/%/normal.gbcpal
	tools/palette -p $< > $@
gfx/pics/%/back.2bpp: gfx/pics/%/back.png
	$(RGBGFX) -h -o $@ $<
gfx/pics/%/bitmask.asm: gfx/pics/%/front.animated.tilemap gfx/pics/%/front.dimensions
	tools/pokemon_animation -b $^ > $@
gfx/pics/%/frames.asm: gfx/pics/%/front.animated.tilemap gfx/pics/%/front.dimensions
	tools/pokemon_animation -f $^ > $@
gfx/pics/%/front.animated.2bpp: gfx/pics/%/front.2bpp gfx/pics/%/front.dimensions
	tools/pokemon_animation_graphics -o $@ $^
gfx/pics/%/front.animated.tilemap: gfx/pics/%/front.2bpp gfx/pics/%/front.dimensions
	tools/pokemon_animation_graphics -t $@ $^
# Don't use -h, pokemon_animation_graphics takes care of it
#gfx/pics/%/front.2bpp: gfx/pics/%/front.png
#	$(RGBGFX) -o $@ $<


### Misc file-specific graphics rules

gfx/shrink1.2bpp: rgbgfx += -h
gfx/shrink2.2bpp: rgbgfx += -h

gfx/trainers/%.2bpp: rgbgfx += -h
gfx/trainers/%.pal: gfx/trainers/%.gbcpal
	tools/palette -p $< > $@

gfx/mail/0b9b46.1bpp: tools/gfx += --remove-whitespace
gfx/mail/0b9d46.1bpp: tools/gfx += --remove-whitespace
gfx/mail/0b9d86.1bpp: tools/gfx += --remove-whitespace
gfx/mail/0b9dc6.1bpp: tools/gfx += --remove-whitespace
gfx/mail/0b9cfe.1bpp: tools/gfx += --remove-whitespace

gfx/pokedex/%.2bpp: tools/gfx += --trim-whitespace

gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
gfx/title/logo.2bpp: rgbgfx += -x 4

gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
gfx/trade/game_boy_n64.2bpp: tools/gfx += --trim-whitespace

gfx/slots_2.2bpp: tools/gfx += --interleave --png=$<
gfx/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip
gfx/slots_3a.2bpp: tools/gfx += --interleave --png=$<
gfx/slots_3b.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

gfx/fx/angels.2bpp: tools/gfx += --trim-whitespace
gfx/fx/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
gfx/fx/bubble.2bpp: tools/gfx += --trim-whitespace
gfx/fx/charge.2bpp: tools/gfx += --trim-whitespace
gfx/fx/egg.2bpp: tools/gfx += --remove-whitespace
gfx/fx/explosion.2bpp: tools/gfx += --remove-whitespace
gfx/fx/hit.2bpp: tools/gfx += --remove-whitespace
gfx/fx/horn.2bpp: tools/gfx += --remove-whitespace
gfx/fx/lightning.2bpp: tools/gfx += --remove-whitespace
gfx/fx/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/fx/noise.2bpp: tools/gfx += --remove-whitespace
gfx/fx/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
gfx/fx/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
gfx/fx/reflect.2bpp: tools/gfx += --remove-whitespace
gfx/fx/rocks.2bpp: tools/gfx += --remove-whitespace
gfx/fx/skyattack.2bpp: tools/gfx += --remove-whitespace
gfx/fx/status.2bpp: tools/gfx += --remove-whitespace

gfx/misc/chris.2bpp: rgbgfx += -h
gfx/misc/chris_card.2bpp: rgbgfx += -h
gfx/misc/kris.2bpp: rgbgfx += -h
gfx/misc/kris_card.2bpp: rgbgfx += -h
gfx/misc/kris_back.2bpp: rgbgfx += -h
gfx/misc/dude.2bpp: rgbgfx += -h
gfx/misc/unknown_egg.2bpp: rgbgfx += -h
gfx/misc/player.2bpp: rgbgfx += -h
gfx/misc/pokegear.2bpp: rgbgfx += -x2
gfx/misc/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

gfx/unknown/0e0ea8.2bpp: tools/gfx += --remove-whitespace
gfx/unknown/0f8f34.1bpp: tools/gfx += --trim-whitespace
gfx/unknown/16c173.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/unknown/170d16.2bpp: tools/gfx += --trim-whitespace
gfx/unknown/1715a4.2bpp: tools/gfx += --trim-whitespace
gfx/unknown/1715a4_nonmatching.2bpp: tools/gfx += --remove-duplicates --remove-xflip
gfx/unknown/171db1.2bpp: tools/gfx += --trim-whitespace


%.bin: ;
%.blk: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.tilemap: %.png
	$(RGBGFX) -t $@ $<
%.gbcpal: %.png
	$(RGBGFX) -p $@ $<
%.pal: %.gbcpal
	tools/palette $< > $@
%.dimensions: %.png
	tools/png_dimensions $< $@
