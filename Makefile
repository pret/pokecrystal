#gawk sort order
export LC_CTYPE=C

.SUFFIXES: .asm .tx .o .gbc

TEXTFILES =	

all: pokecrystal.gbc

pokecrystal.o: pokecrystal.asm main.tx constants.asm ${TEXTFILES}
	rgbasm -o pokecrystal.o pokecrystal.asm
	
.asm.tx:
	awk -f textpre.awk < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	cmp baserom.gbc $@

clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}
