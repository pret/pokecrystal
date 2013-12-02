PYTHON := python
.SUFFIXES: .asm .tx .o .gbc .png .2bpp .lz
.PHONY: all clean pngs gfx
.SECONDEXPANSION:

TEXTFILES := $(shell find ./ -type f -name '*.asm' | grep -v globals.asm)
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

all: baserom.gbc globals.asm $(ROMS)
	cmp baserom.gbc pokecrystal.gbc
clean:
	rm -f $(ROMS)
	rm -f $(OBJS)
	rm -f globals.asm globals.tx
	@echo 'Removing preprocessed .tx files...'
	@rm -f $(TEXTFILES:.asm=.tx)

baserom.gbc: ;
	@echo "Wait! Need baserom.gbc first. Check README and INSTALL for details." && false

PNGS   := $(shell find gfx/ -type f -name '*.png')
LZS    := $(shell find gfx/ -type f -name '*.lz')
_2BPPS := $(shell find gfx/ -type f -name '*.2bpp')
_1BPPS := $(shell find gfx/ -type f -name '*.1bpp')

# generate a list of dependencies for each object file
$(shell \
	$(foreach obj, $(OBJS), \
		$(eval OBJ_$(obj:.o=) := \
		$(shell $(PYTHON) scan_includes.py $(obj:.o=.asm) | sed s/globals.asm//g)) \
	) \
)

.asm.tx:
	$(eval TEXTQUEUE := $(TEXTQUEUE) $<)
	@rm -f $@

%.asm: ;

globals.asm: $(TEXTFILES:.asm=.tx)
	@echo "Creating globals.asm..."
	@touch globals.asm
	@echo "Preprocessing .asm to .tx..."
	@$(PYTHON) prequeue.py $(TEXTQUEUE) globals.asm

$(OBJS): $$(patsubst %.o,%.tx,$$@) $$(patsubst %.asm,%.tx,$$(OBJ_$$(patsubst %.o,%,$$@)))
	rgbasm -o $@ $(@:.o=.tx)

pokecrystal.gbc: $(CRYSTAL_OBJS)
	rgblink -n pokecrystal.sym -m pokecrystal.map -o pokecrystal.gbc $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@

pngs:
	$(PYTHON) extras/pokemontools/gfx.py mass-decompress
	$(PYTHON) extras/pokemontools/gfx.py dump-pngs

gfx: $(LZS) $(_2BPPS) $(_1BPPS)
	@:

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
%.2bpp:
	@:
%.1bpp:
	@:
%.pal: ;

%.bin: ;

