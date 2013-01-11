.SUFFIXES: .asm .tx .o .gbc

TEXTFILES =	text/sweethoney.tx \
		text/phone/bill.tx \
		text/phone/elm.tx \
		text/phone/mom.tx \
		text/phone/trainers1.tx \
		main.tx

all: pokecrystal.gbc

pokecrystal.o: pokecrystal.asm constants.asm wram.asm ${TEXTFILES}
	rgbasm -o pokecrystal.o pokecrystal.asm
	
.asm.tx:
	python preprocessor.py < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@

clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}
