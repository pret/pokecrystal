PYTHON := python
MD5 := md5sum -c --quiet

.SUFFIXES: .asm .o .gbc .png .2bpp .1bpp .lz .pal .bin .blk .tilemap
.PHONY: all clean crystal crystal11 pngs
.SECONDEXPANSION:

poketools := extras/pokemontools
gfx       := $(PYTHON) gfx.py
includes  := $(PYTHON) $(poketools)/scan_includes.py


crystal11_obj := \
wram11.o \
main11.o \
lib/mobile/main.o \
home.o \
audio.o \
maps_crystal.o \
engine/events_crystal.o \
engine/credits_crystal.o \
data/egg_moves_crystal.o \
data/evos_attacks_crystal.o \
data/pokedex/entries_crystal.o \
misc/crystal_misc.o \
text/common_text.o \
gfx/pics.o

crystal_obj := \
wram.o \
main.o \
lib/mobile/main.o \
home.o \
audio.o \
maps_crystal.o \
engine/events_crystal.o \
engine/credits_crystal.o \
data/egg_moves_crystal.o \
data/evos_attacks_crystal.o \
data/pokedex/entries_crystal.o \
misc/crystal_misc.o \
text/common_text.o \
gfx/pics.o

all_obj := $(crystal_obj) main11.o wram11.o

# object dependencies
$(foreach obj, $(crystal_obj), \
	$(eval $(obj:.o=)_dep := $(shell $(includes) $(obj:.o=.asm))) \
)


roms := pokecrystal.gbc

all: $(roms)
crystal: pokecrystal.gbc

crystal11: pokecrystal11.gbc

clean:
	rm -f $(roms) $(all_obj) $(roms:.gbc=.map) $(roms:.gbc=.sym)

compare: pokecrystal.gbc pokecrystal11.gbc
	@$(MD5) roms.md5

%.asm: ;
%11.o: %.asm $$(%_dep)
	rgbasm -D CRYSTAL11 -o $@ $<
%.o: %.asm $$(%_dep)
	rgbasm -o $@ $<

pokecrystal11.gbc: $(crystal11_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -n 1 -p 0 -r 3 -t PM_CRYSTAL $@

pokecrystal.gbc: $(crystal_obj)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@


pngs:
	find . -iname "*.lz"      -exec $(gfx) unlz {} +
	find . -iname "*.[12]bpp" -exec $(gfx) png  {} +
	find . -iname "*.[12]bpp" -exec touch {} \;
	find . -iname "*.lz"      -exec touch {} \;

%.2bpp: %.png ; $(gfx) 2bpp $<
%.1bpp: %.png ; $(gfx) 1bpp $<
%.lz:   %     ; $(gfx) lz $<


%.pal: %.2bpp ;
gfx/pics/%/normal.pal gfx/pics/%/bitmask.asm gfx/pics/%/frames.asm: gfx/pics/%/front.2bpp ;
%.bin: ;
%.blk: ;
%.tilemap: ;

