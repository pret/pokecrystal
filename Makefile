PYTHON := python
MD5 := md5sum -c --quiet

.SUFFIXES:
.SUFFIXES: .2bpp
.PHONY: all clean crystal crystal11
.SECONDEXPANSION:

poketools := extras/pokemontools
gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) $(poketools)/scan_includes.py


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

$(foreach obj, $(crystal_obj:.o=), \
	$(eval $(obj)_dep := $(shell $(includes) $(obj).asm)) \
)


roms := pokecrystal.gbc

all: $(roms)
crystal: pokecrystal.gbc
crystal11: pokecrystal11.gbc

clean:
	rm -f $(roms) $(crystal_obj) $(crystal11_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokecrystal.gbc pokecrystal11.gbc
	@$(MD5) roms.md5

%.asm: ;
$(crystal11_obj): %11.o: %.asm $$(%_dep)
	rgbasm -D CRYSTAL11 -o $@ $<
$(crystal_obj): %.o: %.asm $$(%_dep)
	rgbasm -o $@ $<

pokecrystal11.gbc: $(crystal11_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PM_CRYSTAL $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@


%.png: ;
%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

