DrawKrisPackGFX: ; 48e81
	ld hl, PackFGFXPointers
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, VTiles2 tile $50
	lb bc, BANK(PackFGFX), 15
	call Request2bpp
	ret

PackFGFXPointers: ; 48e93
	dw PackFGFX + (15 tiles) * 1
	dw PackFGFX + (15 tiles) * 3
	dw PackFGFX + (15 tiles) * 0
	dw PackFGFX + (15 tiles) * 2

PackFGFX: ; 48e9b
INCBIN "gfx/pack/pack_f.2bpp"
