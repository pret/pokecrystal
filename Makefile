PYTHON := python
POKEMONTOOLS := extras/pokemontools
.SUFFIXES: .asm .tx .o .gbc .png .2bpp .1bpp .lz .pal .bin
.PHONY: all clean crystal pngs
.SECONDEXPANSION:

TEXTQUEUE :=

CRYSTAL_OBJS := \
wram.o \
main.o \
home.o \
audio.o \
maps_crystal.o \
engine/events.o \
engine/scripting_crystal.o \
engine/events_2.o \
engine/credits_crystal.o \
stats/egg_moves_crystal.o \
stats/evos_attacks_crystal.o \
stats/pokedex/entries_crystal.o \
misc/crystal_misc.o \
gfx/pics.o

OBJS := $(CRYSTAL_OBJS)

ROMS := pokecrystal.gbc


# generate a list of dependencies for each object file
$(shell $(foreach obj, $(OBJS), \
	$(eval $(obj:.o=)_DEPENDENCIES := $(shell $(PYTHON) $(POKEMONTOOLS)/scan_includes.py $(obj:.o=.asm))) \
))


all: $(ROMS)

crystal: pokecrystal.gbc

clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	find -iname '*.tx' -exec rm {} +

baserom.gbc: ;
	@echo "Wait! Need baserom.gbc first. Check README and INSTALL for details." && false


%.asm: ;
.asm.tx:
	$(eval TEXTQUEUE += $<)
	@rm -f $@

$(OBJS): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_DEPENDENCIES))
	@$(PYTHON) prequeue.py $(TEXTQUEUE)
	$(eval TEXTQUEUE :=)
	rgbasm -o $@ $*.tx

pokecrystal.gbc: $(CRYSTAL_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@


pngs:
	$(PYTHON) $(POKEMONTOOLS)/gfx.py mass-decompress
	$(PYTHON) $(POKEMONTOOLS)/gfx.py dump-pngs

gfx/pics/%/front.lz:: gfx/pics/%/tiles.2bpp gfx/pics/%/front.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-lz --front $^
gfx/pics/%/front.2bpp:: gfx/pics/%/front.lz
	$(PYTHON) $(POKEMONTOOLS)/gfx.py front-to-2bpp $<
gfx/pics/%/front.png:: gfx/pics/%/front.2bpp
	$(PYTHON) $(POKEMONTOOLS)/gfx.py 2bpp-to-png $<
gfx/pics/%/tiles.2bpp:: gfx/pics/%/front.lz
	$(PYTHON) $(POKEMONTOOLS)/gfx.py anim-from-front $<

gfx/pics/%/tiles.2bpp:: gfx/pics/%/tiles.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-2bpp $<
gfx/pics/%/tiles.png:: gfx/pics/%/tiles.2bpp
	$(PYTHON) $(POKEMONTOOLS)/gfx.py 2bpp-to-png $<

gfx/pics/%/back.lz:: gfx/pics/%/back.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-lz --vert $<
gfx/pics/%/back.png:: gfx/pics/%/back.lz
	$(PYTHON) $(POKEMONTOOLS)/gfx.py lz-to-png --vert $<

gfx/trainers/%.lz:: gfx/trainers/%.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-lz --vert $<
gfx/trainers/%.png:: gfx/trainers/%.lz
	$(PYTHON) $(POKEMONTOOLS)/gfx.py lz-to-png --vert $<


%.lz:: %.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-lz $<
%.png:: %.lz
	$(PYTHON) $(POKEMONTOOLS)/gfx.py lz-to-png $<

%.2bpp:: %.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-2bpp $<
%.png:: %.2bpp
	$(PYTHON) $(POKEMONTOOLS)/gfx.py 2bpp-to-png $<

%.1bpp:: %.png
	$(PYTHON) $(POKEMONTOOLS)/gfx.py png-to-1bpp $<
%.png:: %.1bpp
	$(PYTHON) $(POKEMONTOOLS)/gfx.py 1bpp-to-png $<

%.pal: ;
%.bin: ;

