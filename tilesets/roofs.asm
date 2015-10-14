
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
	ld de, VTiles2 tile $0a
	ld bc, $90
	call CopyBytes
	ret
; 1c021

MapGroupRoofs: ; 1c021i
	db -1 ; group 1
	db  3 ; group 2
	db  2 ; group 3
	db -1 ; group 4
	db  1 ; group 5
	db  2 ; group 6
	db -1 ; group 7
	db -1 ; group 8
	db  2 ; group 9
	db  2 ; group 10
	db  1 ; group 11
	db  4 ; group 12
	db -1 ; group 13
	db -1 ; group 14
	db -1 ; group 15
	db -1 ; group 16
	db -1 ; group 17
	db -1 ; group 18
	db -1 ; group 19
	db  0 ; group 20
	db -1 ; group 21
	db -1 ; group 22
	db  3 ; group 23
	db -1 ; group 24
	db  0 ; group 25
	db -1 ; group 26
	db  0 ; group 27
; 1c03c

Roofs: ; 1c03c
INCBIN "gfx/tilesets/roofs/0.2bpp"
INCBIN "gfx/tilesets/roofs/1.2bpp"
INCBIN "gfx/tilesets/roofs/2.2bpp"
INCBIN "gfx/tilesets/roofs/3.2bpp"
INCBIN "gfx/tilesets/roofs/4.2bpp"
; 1c30c
