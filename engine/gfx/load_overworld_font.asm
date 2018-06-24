LoadOverworldFont::
	ld de, .OverworldFontGFX
	ld hl, vTiles1
	lb bc, BANK(.OverworldFontGFX), $80
	call Get2bpp
	ld de, .OverworldFontSpaceGFX
	ld hl, vTiles2 tile " "
	lb bc, BANK(.OverworldFontSpaceGFX), 1
	call Get2bpp
	ret

.OverworldFontGFX:
INCBIN "gfx/font/overworld.2bpp"

.OverworldFontSpaceGFX:
INCBIN "gfx/font/overworld_space.2bpp"
