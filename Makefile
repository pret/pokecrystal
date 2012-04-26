.SUFFIXES: .asm .tx .o .gbc

TEXTFILES =	

all: pokecrystal.gbc

pokecrystal.o: pokecrystal.asm main.tx constants.asm wram.asm ${TEXTFILES}
	rgbasm -o pokecrystal.o pokecrystal.asm
	
.asm.tx:
	python preprocessor.py < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	cmp baserom.gbc $@

clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}
