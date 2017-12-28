LoadMapGroupRoof:: ; 1c000
	ld a, [MapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld hl, Roofs
	ld bc, $90
	call AddNTimes
	ld de, vTiles2 tile $0a
	ld bc, $90
	call CopyBytes
	ret
; 1c021


INCLUDE "data/maps/roofs.asm"
