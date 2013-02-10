.SUFFIXES: .asm .tx .o .gbc .png .2bpp .lz

TEXTFILES =	text/sweethoney.tx \
		text/phone/bill.tx \
		text/phone/elm.tx \
		text/phone/mom.tx \
		text/phone/trainers1.tx \
		main.tx

VERTFILES =	gfx/pics/%.png \
		gfx/trainers/%.png

HORIZFILES =	$(filter-out gfx/%.png, $(VERTFILES))

IMGFILES =	${VERTFILES} ${HORIZFILES}

LZFILES =	gfx/%.lz

all: pokecrystal.gbc


pokecrystal.o: pokecrystal.asm constants.asm wram.asm ${TEXTFILES}
	rgbasm -o pokecrystal.o pokecrystal.asm
	
.asm.tx:
	python preprocessor.py < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@


pngs:
	python gfx.py dump-pngs


front.png: tiles.png
	python gfx.py png-to-lz --front $@ $(OBJECT_DIRECTORY)/tiles.2bpp

tiles.png:
	python gfx.py png-to-2bpp $@

.png: ${VERTFILES}
	python gfx.py png-to-lz --vert $@

.png: ${HORIZFILES}
	python gfx.py png-to-lz $@


clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}

