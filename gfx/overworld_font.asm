LoadOverworldFont:: ; 106594
	ld de, .font
	ld hl, VTiles1
	lb bc, BANK(.font), $80
	call Get2bpp
	ld de, .space
	ld hl, VTiles2 tile $7f
	lb bc, BANK(.space), 1
	call Get2bpp
	ret
; 1065ad

.font
INCBIN "gfx/font/overworld.2bpp"

.space
INCBIN "gfx/font/space.2bpp"
