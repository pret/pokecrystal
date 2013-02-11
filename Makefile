.SUFFIXES: .asm .tx .o .gbc .png .2bpp .lz

TEXTFILES =	text/sweethoney.tx \
		text/phone/bill.tx \
		text/phone/elm.tx \
		text/phone/mom.tx \
		text/phone/trainers1.tx \
		main.tx

VERTGFX =	gfx/pics/%.png \
		gfx/trainers/%.png

HORIZGFX =	$(filter-out gfx/%.png, $(VERTGFX))


# uncomment this build target to enable png import:

#all: lzs

# the recompressed graphics may be larger than the originals,
# so take care to reorganize accordingly

all: pokecrystal.gbc

clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}


pokecrystal.o: pokecrystal.asm constants.asm wram.asm ${TEXTFILES}
	rgbasm -o pokecrystal.o pokecrystal.asm
	
.asm.tx:
	python preprocessor.py < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@
	cmp baserom.gbc $@


@lzs: ${VERTGFX} ${HORIZGFX}

@pngs:
	cd extras; python gfx.py mass-decompress; python gfx.py dump-pngs


@front.png: tiles.png
	cd extras; python gfx.py png-to-lz --front $@ $(OBJECT_DIRECTORY)/tiles.2bpp
@tiles.png:
	cd extras; python gfx.py png-to-2bpp $@
@.png: ${VERTGFX}
	cd extras; python gfx.py png-to-lz --vert $@
@.png: ${HORIZGFX}
	cd extras; python gfx.py png-to-lz $@

