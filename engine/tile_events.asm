CheckWarpCollision:: ; 1499a
; Is this tile a warp?
	ld a, [PlayerStandingTile]
	cp $60
	jr z, .warp
	cp $68
	jr z, .warp
	and $f0
	cp $70
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
	ld a, [PlayerStandingTile]
	cp $70 ; Warp on down
	jr z, .directional
	cp $76 ; Warp on left
	jr z, .directional
	cp $78 ; Warp on up
	jr z, .directional
	cp $7e ; Warp on right
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
	ld a, [PlayerStandingTile]
	call IsInArray
	ret
; 149d3

.blocks ; 149d3
	db $71 ; door
	db $79
	db $7a ; stairs
	db $73
	db $7b ; cave entrance
	db $74
	db $7c ; warp pad
	db $75
	db $7d
	db -1
; 149dd

CheckGrassCollision:: ; 149dd
	ld a, [PlayerStandingTile]
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret
; 149ea

.blocks ; 149ea
	db $08
	db $18 ; tall grass
	db $14 ; tall grass
	db $28
	db $29
	db $48
	db $49
	db $4a
	db $4b
	db $4c
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
	db $12 ; cut tree
	db $1a ; cut tree
	db $10 ; tall grass
	db $18 ; tall grass
	db $14 ; tall grass
	db $1c ; tall grass
	db -1
; 14a07

Function14a07:: ; 14a07
	ld a, [PlayerStandingTile]
	ld de, $1f
	cp $71 ; door
	ret z
	ld de, $13
	cp $7c ; warp pad
	ret z
	ld de, $23
	ret
; 14a1a
