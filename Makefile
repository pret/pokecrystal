MD5 := md5sum -c --quiet

.SUFFIXES:
.PHONY: all clean tools crystal crystal11
.SECONDEXPANSION:
.PRECIOUS: %.2bpp %.1bpp %.pal.bin



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


roms := pokecrystal.gbc

all: $(roms)
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc

clean:
	rm -f $(roms) $(crystal_obj) $(crystal11_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokecrystal.gbc pokecrystal11.gbc
	@$(MD5) roms.md5

tools: tools/lzcomp tools/png_dimensions tools/scan_includes tools/palette tools/pokemon_animation tools/pokemon_animation_graphics

tools/%: tools/%.c
	$(CC) -o $@ $<

%.asm: ;

%11.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
%11.o: %.asm $$(dep)
	rgbasm -D CRYSTAL11 -o $@ $<

%.o: dep = $(shell tools/scan_includes $(@D)/$*.asm)
%.o: %.asm $$(dep)
	rgbasm -o $@ $<

pokecrystal11.gbc: $(crystal11_obj)
	rgblink -n pokecrystal11.sym -m pokecrystal11.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PM_CRYSTAL $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n pokecrystal.sym -m pokecrystal.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@

%.bin: ;
%.blk: ;

%.2bpp: %.png
	rgbgfx -o $@ $<
%.1bpp: %.png
	rgbgfx -d1 -o $@ $<
%.lz: %
	tools/lzcomp $< $@

%.dimensions: %.png
	tools/png_dimensions $< $@
%.tilemap: %.png
	rgbgfx -t $@ $<
%.pal: %.pal.bin
	tools/palette $< > $@
%.pal.bin: %.png
	rgbgfx -p $@ $<

gfx/pics/%/normal.pal: gfx/pics/%/normal.pal.bin
	tools/palette -p $< > $@
gfx/pics/%/normal.pal.bin: gfx/pics/%/front.png
	rgbgfx -p $@ $<
gfx/pics/%/back.2bpp: gfx/pics/%/back.png
	rgbgfx -h -o $@ $<
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
#	rgbgfx -o $@ $<
gfx/pics/%/front.2bpp.lz: gfx/pics/%/front.animated.2bpp
	tools/lzcomp $< $@

gfx/shrink1.2bpp: gfx/shrink1.png
	rgbgfx -h -o $@ $<
gfx/shrink2.2bpp: gfx/shrink2.png
	rgbgfx -h -o $@ $<

gfx/trainers/%.2bpp: gfx/trainers/%.png
	rgbgfx -h -o $@ $<
