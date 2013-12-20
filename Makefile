PYTHON := python
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


ALL_DEPENDENCIES :=
# generate a list of dependencies for each object file
$(shell $(foreach obj, $(OBJS), \
	$(eval $(obj:.o=)_DEPENDENCIES := $(shell $(PYTHON) extras/pokemontools/scan_includes.py $(obj:.o=.asm) | sed s/globals.asm//g)) \
))
$(shell $(foreach obj, $(OBJS), \
	$(eval ALL_DEPENDENCIES += $($(obj:.o=)_DEPENDENCIES)) \
))


all: $(ROMS)

crystal: pokecrystal.gbc

clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	rm -f globals.asm
	find -iname '*.tx' -exec rm {} +

baserom.gbc: ;
	@echo "Wait! Need baserom.gbc first. Check README and INSTALL for details." && false


%.asm: ;
.asm.tx:
	$(eval TEXTQUEUE := $(TEXTQUEUE) $<)
	@rm -f $@

globals.asm: $(ALL_DEPENDENCIES:.asm=.tx) $(OBJS:.o=.tx)
	@touch $@
	@$(PYTHON) prequeue.py $(TEXTQUEUE)
globals.tx: globals.asm
	@cp $< $@

$(OBJS): $$*.tx $$(patsubst %.asm, %.tx, $$($$*_DEPENDENCIES))
	rgbasm -o $@ $*.tx

pokecrystal.gbc: globals.tx $(CRYSTAL_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $(CRYSTAL_OBJS)
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@


pngs:
	$(PYTHON) extras/pokemontools/gfx.py mass-decompress
	$(PYTHON) extras/pokemontools/gfx.py dump-pngs

gfx/pics/%/front.lz: gfx/pics/%/tiles.2bpp gfx/pics/%/front.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --front $^
gfx/pics/%/tiles.2bpp: gfx/pics/%/tiles.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-2bpp $<
gfx/pics/%/back.lz: gfx/pics/%/back.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --vert $<
gfx/trainers/%.lz: gfx/trainers/%.png
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz --vert $<
.png.lz:
	$(PYTHON) extras/pokemontools/gfx.py png-to-lz $<
.png.2bpp:
	$(PYTHON) extras/pokemontools/gfx.py png-to-2bpp $<
.png.1bpp:
	$(PYTHON) extras/pokemontools/gfx.py png-to-1bpp $<
%.pal: ;
%.bin: ;

