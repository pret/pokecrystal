PYTHON := python

.SUFFIXES:
.SUFFIXES: .asm .tx .o .gbc .png .2bpp .1bpp .lz .pal .bin .blk .tilemap
.PHONY: all clean crystal pngs
.SECONDEXPANSION:

POKEMONTOOLS := extras/pokemontools
GFX          := $(PYTHON) $(POKEMONTOOLS)/gfx.py
INCLUDES     := $(PYTHON) $(POKEMONTOOLS)/scan_includes.py
PREPROCESS   := $(PYTHON) prequeue.py

TEXTQUEUE :=

CRYSTAL_OBJS := \
wram.o \
main.o \
lib/mobile/main.o \
home.o \
audio.o \
maps_crystal.o \
engine/events.o \
engine/scripting_crystal.o \
engine/events_2.o \
engine/credits_crystal.o \
data/egg_moves_crystal.o \
data/evos_attacks_crystal.o \
data/pokedex/entries_crystal.o \
misc/crystal_misc.o \
gfx/pics.o

OBJS := $(CRYSTAL_OBJS)

ROMS := pokecrystal.gbc

# object dependencies
$(shell $(foreach obj, $(OBJS), $(eval $(obj:.o=)_DEPENDENCIES := $(shell $(INCLUDES) $(obj:.o=.asm)))))

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
	@$(PREPROCESS) $(TEXTQUEUE)
	$(eval TEXTQUEUE :=)
	rgbasm -o $@ $*.tx

pokecrystal.gbc: $(CRYSTAL_OBJS)
	rgblink -n $*.sym -m $*.map -o $@ $^
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@


pngs:
	find . -iname "*.lz"      -exec $(GFX) unlz {} +
	find . -iname "*.[12]bpp" -exec $(GFX) png  {} +
	find . -iname "*.[12]bpp" -exec touch {} +
	find . -iname "*.lz"      -exec touch {} +

%.2bpp: %.png ; $(GFX) 2bpp $<
%.1bpp: %.png ; $(GFX) 1bpp $<
%.lz:   %     ; $(GFX) lz   $<

%.pal: ;
%.bin: ;
%.blk: ;
%.tilemap: ;

