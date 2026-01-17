roms := \
	pokecrystal.gbc \
	pokecrystal11.gbc \
	pokecrystal_au.gbc \
	pokecrystal_debug.gbc \
	pokecrystal11_debug.gbc
patches := pokecrystal11.patch

# Keep intermediate build products out of the source tree.
BUILDDIR := build
OBJDIR := $(BUILDDIR)/obj

rom_obj := \
	audio.o \
	home.o \
	main.o \
	ram.o \
	data/text/common.o \
	data/maps/map_data.o \
	data/pokemon/dex_entries.o \
	data/pokemon/egg_moves.o \
	data/pokemon/evos_attacks.o \
	engine/movie/credits.o \
	engine/overworld/events.o \
	gfx/misc.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o \
	lib/mobile/main.o \
	lib/mobile/mail.o

pokecrystal_obj         := $(addprefix $(OBJDIR)/,$(rom_obj:.o=.o))
pokecrystal11_obj       := $(addprefix $(OBJDIR)/,$(rom_obj:.o=11.o))
pokecrystal_au_obj      := $(addprefix $(OBJDIR)/,$(rom_obj:.o=_au.o))
pokecrystal_debug_obj   := $(addprefix $(OBJDIR)/,$(rom_obj:.o=_debug.o))
pokecrystal11_debug_obj := $(addprefix $(OBJDIR)/,$(rom_obj:.o=11_debug.o))
pokecrystal11_vc_obj    := $(addprefix $(OBJDIR)/,$(rom_obj:.o=11_vc.o))


### Build tools

ifeq (,$(shell command -v sha1sum 2>/dev/null))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink

RGBASMFLAGS  ?= -Weverything -Wtruncation=1
RGBLINKFLAGS ?= -Weverything -Wtruncation=1
RGBFIXFLAGS  ?= -Weverything
RGBGFXFLAGS  ?= -Weverything


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: \
	all \
	crystal \
	crystal11 \
	crystal_au \
	crystal_debug \
	crystal11_debug \
	crystal11_vc \
	clean \
	tidy \
	compare \
	tools

all: crystal
crystal:         pokecrystal.gbc
crystal11:       pokecrystal11.gbc
crystal_au:      pokecrystal_au.gbc
crystal_debug:   pokecrystal_debug.gbc
crystal11_debug: pokecrystal11_debug.gbc
crystal11_vc:    pokecrystal11.patch

clean: tidy
	$(RM) -r $(BUILDDIR)
	find gfx \
	     \( -name "*.[12]bpp" \
	        -o -name "*.lz" \
	        -o -name "*.gbcpal" \
	        -o -name "*.sgb.tilemap" \) \
	     -delete
	find gfx/pokemon -mindepth 1 \
	     ! -path "gfx/pokemon/unown/*" \
	     \( -name "bitmask.asm" \
	        -o -name "frames.asm" \
	        -o -name "front.animated.tilemap" \
	        -o -name "front.dimensions" \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gbc=.sym) \
	      $(roms:.gbc=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gbc) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(pokecrystal_obj) \
	      $(pokecrystal11_obj) \
	      $(pokecrystal11_vc_obj) \
	      $(pokecrystal_au_obj) \
	      $(pokecrystal_debug_obj) \
	      $(pokecrystal11_debug_obj) \
	      $(OBJDIR)/rgbdscheck.o
	$(RM) -r $(BUILDDIR)
	$(MAKE) clean -C tools/

compare: $(roms) $(patches)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS += -Q8 -P includes.asm
RGBASMFLAGS += -i $(BUILDDIR)
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokecrystal_obj):         RGBASMFLAGS +=
$(pokecrystal11_obj):       RGBASMFLAGS += -D _CRYSTAL11
$(pokecrystal_au_obj):      RGBASMFLAGS += -D _CRYSTAL11 -D _CRYSTAL_AU
$(pokecrystal_debug_obj):   RGBASMFLAGS += -D _DEBUG
$(pokecrystal11_debug_obj): RGBASMFLAGS += -D _CRYSTAL11 -D _DEBUG
$(pokecrystal11_vc_obj):    RGBASMFLAGS += -D _CRYSTAL11 -D _CRYSTAL11_VC

%.patch: %_vc.gbc %.gbc vc/%.patch.template
# Ignore the checksums added by tools/stadium at the end of the ROM
	tools/make_patch --ignore 0x1ffde0:0x220 $*_vc.sym $^ $@

$(OBJDIR)/rgbdscheck.o: rgbdscheck.asm
	@mkdir -p $(dir $@)
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.

# Redirect dependencies that are generated as part of the build into $(BUILDDIR)/.
generated_deps_patterns := \
	%.1bpp \
	%.2bpp \
	%.lz \
	%.gbcpal \
	%.dimensions \
	%.animated.tilemap \
	%.sgb.tilemap \
	gfx/pokemon/%/bitmask.asm \
	gfx/pokemon/%/frames.asm

# These Pokemon animation files are committed and should not be treated as generated.
generated_deps_exceptions := \
	gfx/pokemon/unown/bitmask.asm \
	gfx/pokemon/unown/frames.asm

define map_build_deps
$(strip \
	$(filter-out $(generated_deps_patterns),$1) \
	$(addprefix $(BUILDDIR)/,$(filter $(generated_deps_patterns),$(filter-out $(generated_deps_exceptions),$1))) \
	$(filter $(generated_deps_exceptions),$1) \
)
endef

preinclude_deps := includes.asm $(call map_build_deps,$(shell tools/scan_includes includes.asm))
define DEP
$1: $2 $$(call map_build_deps,$$(shell tools/scan_includes $2)) $(preinclude_deps) | $(OBJDIR)/rgbdscheck.o
	@mkdir -p $$(dir $$@)
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for shared objects objects
$(foreach obj, $(pokecrystal_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:.o=.asm)))))
$(foreach obj, $(pokecrystal11_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:11.o=.asm)))))
$(foreach obj, $(pokecrystal_au_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:_au.o=.asm)))))
$(foreach obj, $(pokecrystal_debug_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:_debug.o=.asm)))))
$(foreach obj, $(pokecrystal11_debug_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:11_debug.o=.asm)))))
$(foreach obj, $(pokecrystal11_vc_obj), $(eval $(call DEP,$(obj),$(patsubst $(OBJDIR)/%,%,$(obj:11_vc.o=.asm)))))

endif


RGBFIXFLAGS += -Cjv -t PM_CRYSTAL -k 01 -l 0x33 -m MBC3+TIMER+RAM+BATTERY -r 3 -p 0
pokecrystal.gbc:         RGBFIXFLAGS += -i BYTE -n 0
pokecrystal11.gbc:       RGBFIXFLAGS += -i BYTE -n 1
pokecrystal_au.gbc:      RGBFIXFLAGS += -i BYTU -n 0
pokecrystal_debug.gbc:   RGBFIXFLAGS += -i BYTE -n 0
pokecrystal11_debug.gbc: RGBFIXFLAGS += -i BYTE -n 1
pokecrystal11_vc.gbc:    RGBFIXFLAGS += -i BYTE -n 1

%.gbc: $$(%_obj) layout.link
	$(RGBLINK) $(RGBLINKFLAGS) -l layout.link -n $*.sym -m $*.map -o $@ $(filter %.o,$^)
	$(RGBFIX) $(RGBFIXFLAGS) $@
	tools/stadium $@


### LZ compression rules

# Delete this line if you don't care about matching and just want optimal compression.
include gfx/lz.mk


$(BUILDDIR)/%.tilemap.lz: %.tilemap
	@mkdir -p $(dir $@)
	tools/lzcomp $(LZFLAGS) -- $< $@

$(BUILDDIR)/%.attrmap.lz: %.attrmap
	@mkdir -p $(dir $@)
	tools/lzcomp $(LZFLAGS) -- $< $@


$(BUILDDIR)/%.lz: $(BUILDDIR)/%
	@mkdir -p $(dir $@)
	tools/lzcomp $(LZFLAGS) -- $< $@


### Pokemon pic animation rules

$(BUILDDIR)/gfx/pokemon/%/front.animated.2bpp: $(BUILDDIR)/gfx/pokemon/%/front.2bpp $(BUILDDIR)/gfx/pokemon/%/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation_graphics -o $@ $^
$(BUILDDIR)/gfx/pokemon/%/front.animated.tilemap: $(BUILDDIR)/gfx/pokemon/%/front.2bpp $(BUILDDIR)/gfx/pokemon/%/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation_graphics -t $@ $^
$(BUILDDIR)/gfx/pokemon/%/bitmask.asm: $(BUILDDIR)/gfx/pokemon/%/front.animated.tilemap $(BUILDDIR)/gfx/pokemon/%/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation -b $^ > $@
$(BUILDDIR)/gfx/pokemon/%/frames.asm: $(BUILDDIR)/gfx/pokemon/%/front.animated.tilemap $(BUILDDIR)/gfx/pokemon/%/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation -f $^ > $@


### Terrible hacks to match animations. Delete these rules if you don't care about matching.

# Dewgong has an unused tile id in its last frame. The tile itself is missing.
$(BUILDDIR)/gfx/pokemon/dewgong/frames.asm: $(BUILDDIR)/gfx/pokemon/dewgong/front.animated.tilemap $(BUILDDIR)/gfx/pokemon/dewgong/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$4d" >> $@

# Lugia has two unused tile ids in its last frame. The tiles themselves are missing.
$(BUILDDIR)/gfx/pokemon/lugia/frames.asm: $(BUILDDIR)/gfx/pokemon/lugia/front.animated.tilemap $(BUILDDIR)/gfx/pokemon/lugia/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation -f $^ > $@
	echo "	db \$$5e, \$$59" >> $@

# Girafarig has a redundant tile after the end. It is used in two frames, so it must be injected into the generated graphics.
# This is more involved, so it's hacked into pokemon_animation_graphics.
$(BUILDDIR)/gfx/pokemon/girafarig/front.animated.2bpp: $(BUILDDIR)/gfx/pokemon/girafarig/front.2bpp $(BUILDDIR)/gfx/pokemon/girafarig/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation_graphics --girafarig -o $@ $^
$(BUILDDIR)/gfx/pokemon/girafarig/front.animated.tilemap: $(BUILDDIR)/gfx/pokemon/girafarig/front.2bpp $(BUILDDIR)/gfx/pokemon/girafarig/front.dimensions
	@mkdir -p $(dir $@)
	tools/pokemon_animation_graphics --girafarig -t $@ $^


### Pokemon and trainer sprite rules

$(BUILDDIR)/gfx/pokemon/%/back.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/pokemon/%/back.2bpp: gfx/pokemon/%/back.png $(BUILDDIR)/gfx/pokemon/%/normal.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) $(RGBGFXFLAGS) --colors gbc:$(word 2,$^) -o $@ $<
$(BUILDDIR)/gfx/pokemon/%/front.2bpp: gfx/pokemon/%/front.png $(BUILDDIR)/gfx/pokemon/%/normal.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) $(RGBGFXFLAGS) --colors gbc:$(word 2,$^) -o $@ $<
$(BUILDDIR)/gfx/pokemon/%/normal.gbcpal: $(BUILDDIR)/gfx/pokemon/%/front.gbcpal $(BUILDDIR)/gfx/pokemon/%/back.gbcpal
	@mkdir -p $(dir $@)
	tools/gbcpal $(tools/gbcpal) $@ $^

$(BUILDDIR)/gfx/trainers/%.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/trainers/%.2bpp: gfx/trainers/%.png $(BUILDDIR)/gfx/trainers/%.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) $(RGBGFXFLAGS) --colors gbc:$(word 2,$^) -o $@ $<

# Egg does not have a back sprite, so it only uses front.gbcpal
$(BUILDDIR)/gfx/pokemon/egg/front.2bpp: gfx/pokemon/egg/front.png $(BUILDDIR)/gfx/pokemon/egg/front.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) $(RGBGFXFLAGS) --colors gbc:$(word 2,$^) -o $@ $<

# Unown letters share one normal.gbcpal
unown_pngs := $(wildcard gfx/pokemon/unown_*/front.png) $(wildcard gfx/pokemon/unown_*/back.png)
$(BUILDDIR)/gfx/pokemon/unown_%/back.2bpp: RGBGFXFLAGS += --colors gbc:$(word 2,$^)
$(BUILDDIR)/gfx/pokemon/unown_%/front.2bpp: RGBGFXFLAGS += --colors gbc:$(word 2,$^)
$(BUILDDIR)/gfx/pokemon/unown_%/back.2bpp: gfx/pokemon/unown_%/back.png $(BUILDDIR)/gfx/pokemon/unown/normal.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) -o $@ $<
$(BUILDDIR)/gfx/pokemon/unown_%/front.2bpp: gfx/pokemon/unown_%/front.png $(BUILDDIR)/gfx/pokemon/unown/normal.gbcpal
	@mkdir -p $(dir $@)
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) -o $@ $<
$(BUILDDIR)/gfx/pokemon/unown/normal.gbcpal: $(addprefix $(BUILDDIR)/,$(subst .png,.gbcpal,$(unown_pngs)))
	@mkdir -p $(dir $@)
	tools/gbcpal $(tools/gbcpal) $@ $^


### Misc file-specific graphics rules

$(BUILDDIR)/gfx/pokemon/egg/unused_front.2bpp: RGBGFXFLAGS += --columns

$(BUILDDIR)/gfx/pokemon/spearow/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/fearow/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/farfetch_d/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/hitmonlee/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/scyther/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/jynx/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/porygon/normal.gbcpal: tools/gbcpal += --reverse
$(BUILDDIR)/gfx/pokemon/porygon2/normal.gbcpal: tools/gbcpal += --reverse

$(BUILDDIR)/gfx/trainers/swimmer_m.gbcpal: tools/gbcpal += --reverse

$(BUILDDIR)/gfx/new_game/shrink1.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/new_game/shrink2.2bpp: RGBGFXFLAGS += --columns

$(BUILDDIR)/gfx/mail/dragonite.1bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/mail/large_note.1bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/mail/surf_mail_border.1bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/mail/flower_mail_border.1bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/mail/litebluemail_border.1bpp: tools/gfx += --remove-whitespace

$(BUILDDIR)/gfx/pokedex/pokedex.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/pokedex/pokedex_sgb.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/pokedex/question_mark.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/pokedex/slowpoke.2bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/pokegear/pokegear.2bpp: RGBGFXFLAGS += --trim-end 2
$(BUILDDIR)/gfx/pokegear/pokegear_sprites.2bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/mystery_gift/mystery_gift.2bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/title/crystal.2bpp: tools/gfx += --interleave --png=$<
$(BUILDDIR)/gfx/title/old_fg.2bpp: tools/gfx += --interleave --png=$<
$(BUILDDIR)/gfx/title/logo.2bpp: RGBGFXFLAGS += --trim-end 4

$(BUILDDIR)/gfx/trade/ball.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates --preserve=0x23,0x27
$(BUILDDIR)/gfx/trade/game_boy_cable.2bpp: $(BUILDDIR)/gfx/trade/game_boy.2bpp $(BUILDDIR)/gfx/trade/link_cable.2bpp
	@mkdir -p $(dir $@)
	cat $^ > $@

$(BUILDDIR)/gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/slots/slots_2.2bpp: tools/gfx += --interleave --png=$<
$(BUILDDIR)/gfx/slots/slots_3.2bpp: tools/gfx += --interleave --png=$< --remove-duplicates --keep-whitespace --remove-xflip

$(BUILDDIR)/gfx/card_flip/card_flip_1.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/card_flip/card_flip_2.2bpp: tools/gfx += --remove-whitespace

$(BUILDDIR)/gfx/battle_anims/angels.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/battle_anims/beam.2bpp: tools/gfx += --remove-xflip --remove-yflip --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/bubble.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/battle_anims/charge.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/battle_anims/egg.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/explosion.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/hit.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/horn.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/lightning.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/misc.2bpp: tools/gfx += --remove-duplicates --remove-xflip
$(BUILDDIR)/gfx/battle_anims/noise.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/objects.2bpp: tools/gfx += --remove-whitespace --remove-xflip
$(BUILDDIR)/gfx/battle_anims/pokeball.2bpp: tools/gfx += --remove-xflip --keep-whitespace
$(BUILDDIR)/gfx/battle_anims/reflect.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/rocks.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/skyattack.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/battle_anims/status.2bpp: tools/gfx += --remove-whitespace

$(BUILDDIR)/gfx/player/chris.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/player/chris_back.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/player/kris.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/player/kris_back.2bpp: RGBGFXFLAGS += --columns

$(BUILDDIR)/gfx/trainer_card/chris_card.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/trainer_card/kris_card.2bpp: RGBGFXFLAGS += --columns
$(BUILDDIR)/gfx/trainer_card/leaders.2bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/overworld/chris_fish.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/overworld/kris_fish.2bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/sprites/big_onix.2bpp: tools/gfx += --remove-whitespace --remove-xflip

$(BUILDDIR)/gfx/battle/dude.2bpp: RGBGFXFLAGS += --columns

$(BUILDDIR)/gfx/font/unused_bold_font.1bpp: tools/gfx += --trim-whitespace

$(BUILDDIR)/gfx/sgb/sgb_border.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/sgb/sgb_border.sgb.tilemap: gfx/sgb/sgb_border.bin
	@mkdir -p $(dir $@)
	tr < $< -d '\000' > $@

$(BUILDDIR)/gfx/mobile/ascii_font.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/dialpad.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/dialpad_cursor.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/electro_ball.2bpp: tools/gfx += --remove-duplicates --remove-xflip --preserve=0x39
$(BUILDDIR)/gfx/mobile/mobile_splash.2bpp: tools/gfx += --remove-duplicates --remove-xflip
$(BUILDDIR)/gfx/mobile/card.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/card_2.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/card_folder.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/phone_tiles.2bpp: tools/gfx += --remove-whitespace
$(BUILDDIR)/gfx/mobile/pichu_animated.2bpp: tools/gfx += --trim-whitespace
$(BUILDDIR)/gfx/mobile/stadium2_n64.2bpp: tools/gfx += --trim-whitespace


### Catch-all graphics rules

$(BUILDDIR)/%.2bpp: %.png
	@mkdir -p $(dir $@)
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@ || $$($(RM) $@ && false))

$(BUILDDIR)/%.1bpp: %.png
	@mkdir -p $(dir $@)
	$(RGBGFX) --colors dmg $(RGBGFXFLAGS) --depth 1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) --depth 1 -o $@ $@ || $$($(RM) $@ && false))

$(BUILDDIR)/%.gbcpal: %.png
	@mkdir -p $(dir $@)
	$(RGBGFX) -p $@ $<
	tools/gbcpal $(tools/gbcpal) $@ $@ || $$($(RM) $@ && false)

$(BUILDDIR)/%.dimensions: %.png
	@mkdir -p $(dir $@)
	tools/png_dimensions $< $@


### File extensions that are never generated and should be manually created

%.inc: ;
%.pal: ;
%.bin: ;
%.blk: ;
%.rle: ;
