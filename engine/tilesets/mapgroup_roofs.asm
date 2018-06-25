LoadMapGroupRoof::
	ld a, [wMapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofs
	add hl, de
	ld a, [hl]
	cp -1
	ret z
	ld hl, Roofs
	ld bc, 9 tiles
	call AddNTimes
	ld de, vTiles2 tile $0a
	ld bc, 9 tiles
	call CopyBytes
	ret

INCLUDE "data/maps/roofs.asm"
