CheckWarpCollision:: ; 1499a
; Is this tile a warp?
	ld a, [wPlayerStandingTile]
	cp COLL_PIT
	jr z, .warp
	cp COLL_PIT_68
	jr z, .warp
	and $f0
	cp HI_NYBBLE_WARPS
	jr z, .warp
	and a
	ret

.warp
	scf
	ret
; 149af

CheckDirectionalWarp:: ; 149af
; If this is a directional warp, clear carry (press the designated button to warp).
; Else, set carry (immediate warp).
	ld a, [wPlayerStandingTile]
	cp COLL_WARP_CARPET_DOWN
	jr z, .directional
	cp COLL_WARP_CARPET_LEFT
	jr z, .directional
	cp COLL_WARP_CARPET_UP
	jr z, .directional
	cp COLL_WARP_CARPET_RIGHT
	jr z, .directional
	scf
	ret

.directional
	xor a
	ret
; 149c6

CheckWarpFacingDown: ; 149c6
	ld de, 1
	ld hl, .blocks
	ld a, [wPlayerStandingTile]
	call IsInArray
	ret
; 149d3

.blocks ; 149d3
	db COLL_DOOR
	db COLL_DOOR_79
	db COLL_STAIRCASE
	db COLL_STAIRCASE_73
	db COLL_CAVE
	db COLL_CAVE_74
	db COLL_WARP_PANEL
	db COLL_DOOR_75
	db COLL_DOOR_7D
	db -1
; 149dd

CheckGrassCollision:: ; 149dd
	ld a, [wPlayerStandingTile]
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret
; 149ea

.blocks ; 149ea
	db COLL_CUT_08
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_CUT_28
	db COLL_WATER
	db COLL_GRASS_48
	db COLL_GRASS_49
	db COLL_GRASS_4A
	db COLL_GRASS_4B
	db COLL_GRASS_4C
	db -1
; 149f5

CheckCutCollision: ; 149f5
	ld a, c
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret
; 14a00

.blocks ; 14a00
	db COLL_CUT_TREE
	db COLL_CUT_TREE_1A
	db COLL_TALL_GRASS_10
	db COLL_TALL_GRASS
	db COLL_LONG_GRASS
	db COLL_LONG_GRASS_1C
	db -1
; 14a07

GetWarpSFX:: ; 14a07
	ld a, [wPlayerStandingTile]
	ld de, SFX_ENTER_DOOR
	cp COLL_DOOR
	ret z
	ld de, SFX_WARP_TO
	cp COLL_WARP_PANEL
	ret z
	ld de, SFX_EXIT_BUILDING
	ret
; 14a1a
