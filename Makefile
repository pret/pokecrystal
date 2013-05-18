.SUFFIXES: .asm .tx .o .gbc .png .2bpp .lz

TEXTFILES = \
		text/sweethoney.tx \
		text/phone/bill.tx \
		text/phone/elm.tx \
		text/phone/mom.tx \
		text/phone/trainers1.tx \
		text/common.tx \
		text/common_2.tx \
		text/common_3.tx \
		main.tx

PNG_PICS = $(shell find gfx/pics/ -type f -name 'front.png')
PNG_ANIMS = $(shell find gfx/pics/ -type f -name 'tiles.png')
PNG_TRAINERS = gfx/trainers/*.png
PNG_GFX = $(PNG_PICS) $(PNG_ANIMS) $(PNG_TRAINERS), $(filter-out $(shell find gfx/ -type f -name '*.png'))

LZ_PICS = $(shell find gfx/pics/ -type f -name 'front.lz')
LZ_ANIMS = $(shell find gfx/pics/ -type f -name 'tiles.lz')
LZ_TRAINERS = gfx/trainers/*.lz
LZ_GFX = $(filter-out $(LZ_PICS) $(LZ_ANIMS) $(LZ_TRAINERS), $(shell find gfx/ -type f -name '*.lz'))


all: pokecrystal.gbc
	cmp baserom.gbc $<

win: pokecrystal.gbc
	fc baserom.gbc $<

clean:
	rm -f main.tx pokecrystal.o pokecrystal.gbc ${TEXTFILES}

winclean:
	del main.tx pokecrystal.o pokecrystal.gbc .\text\sweethoney.tx .\text\phone\bill.tx .\text\phone\elm.tx .\text\phone\mom.tx .\text\phone\trainers1.tx .\text\common.tx .\text\common_2.tx .\text\common_3.tx

pokecrystal.o: pokecrystal.asm constants.asm wram.asm ${TEXTFILES} lzs
	rgbasm -o pokecrystal.o pokecrystal.asm

.asm.tx:
	python preprocessor.py < $< > $@

pokecrystal.gbc: pokecrystal.o
	rgblink -o $@ $<
	rgbfix -Cjv -i BYTE -k 01 -l 0x33 -m 0x10 -p 0 -r 3 -t PM_CRYSTAL $@

pngs:
	cd extras && python gfx.py mass-decompress && python gfx.py dump-pngs

lzs: $(LZ_PICS) $(LZ_ANIMS) $(LZ_TRAINERS) $(LZ_GFX)

gfx/pics/%/front.lz: gfx/pics/%/front.png gfx/pics/%/tiles.2bpp
	python extras/gfx.py png-to-lz --front $< $(@D)/tiles.2bpp
gfx/pics/%/tiles.2bpp:
	python extras/gfx.py png-to-2bpp $<
gfx/pics/%/back.lz: gfx/pics/%/back.png
	python extras/gfx.py png-to-lz --vert $<
gfx/trainers/%.lz: gfx/trainers/%.png
	python extras/gfx.py png-to-lz --vert $<
.png.lz:
	python extras/gfx.py png-to-lz $<

