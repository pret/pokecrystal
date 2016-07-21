Function6ec1: ; 6ec1

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 5, [hl]
	jr z, .not_bit_5

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 4, [hl] ; lost
	push hl
	push bc
	call Function6f2c
	pop bc
	pop hl
	ret c
	jr .resume

.not_bit_5
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 4, [hl]
	jr nz, .resume
	push hl
	push bc
	call Function6f07
	pop bc
	pop hl
	ret c

.resume
	bit 6, [hl]
	jr nz, .bit_6

	push hl
	push bc
	call WillPersonBumpIntoSomeoneElse
	pop bc
	pop hl
	ret c

.bit_6
	bit 5, [hl]
	jr nz, .bit_5
	push hl
	call HasPersonReachedMovementLimit
	pop hl
	ret c

	push hl
	call IsPersonMovingOffEdgeOfScreen
	pop hl
	ret c

.bit_5
	and a
	ret
; 6f07


Function6f07: ; 6f07
	call Function6f5f
	ret c
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 7, [hl]
	jp nz, Function6fa1
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld d, a
	call GetTileCollision
	and a
	jr z, Function6f3e
	scf
	ret
; 6f2c

Function6f2c: ; 6f2c
	call Function6f5f
	ret c
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call GetTileCollision
	cp $1
	jr z, Function6f3e
	scf
	ret
; 6f3e

Function6f3e: ; 6f3e
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call Function6f7f
	ret nc
	push af
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and 3
	ld e, a
	ld d, 0
	ld hl, .data_6f5b
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret
; 6f5b

.data_6f5b
	db 1 << DOWN, 1 << UP, 1 << RIGHT, 1 << LEFT
; 6f5f

Function6f5f: ; 6f5f
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	call Function6f7f
	ret nc
	push af
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	and 3
	ld e, a
	ld d, 0
	ld hl, .data_6f7b
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret
; 6f7b

.data_6f7b
	db 1 << UP, 1 << DOWN, 1 << LEFT, 1 << RIGHT
; 6f7f

Function6f7f: ; 6f7f
	ld d, a
	and $f0
	cp $b0
	jr z, .done
	cp $c0
	jr z, .done
	xor a
	ret

.done
	ld a, d
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_6f99
	add hl, de
	ld a, [hl]
	scf
	ret
; 6f99

.data_6f99
	db  8, 4, 1, 2
	db 10, 6, 9, 5
; 6fa1

Function6fa1: ; 6fa1
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and 3
	jr z, .asm_6fb2
	dec a
	jr z, .asm_6fb7
	dec a
	jr z, .asm_6fbb
	jr .asm_6fbf

.asm_6fb2
	inc e
	push de
	inc d
	jr .asm_6fc2

.asm_6fb7
	push de
	inc d
	jr .asm_6fc2

.asm_6fbb
	push de
	inc e
	jr .asm_6fc2

.asm_6fbf
	inc d
	push de
	inc e

.asm_6fc2
	call GetCoordTile
	call GetTileCollision
	pop de
	and a
	jr nz, .asm_6fd7
	call GetCoordTile
	call GetTileCollision
	and a
	jr nz, .asm_6fd7
	xor a
	ret

.asm_6fd7
	scf
	ret
; 6fd9



CheckFacingObject:: ; 6fd9

	call GetFacingTileCoord

; Double the distance for counter tiles.
	call CheckCounterTile
	jr nz, .asm_6ff1

	ld a, [PlayerStandingMapX]
	sub d
	cpl
	inc a
	add d
	ld d, a

	ld a, [PlayerStandingMapY]
	sub e
	cpl
	inc a
	add e
	ld e, a

.asm_6ff1
	ld bc, ObjectStructs ; redundant
	ld a, 0
	ld [hMapObjectIndexBuffer], a
	call IsNPCAtCoord
	ret nc
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	xor a
	ret

.standing
	scf
	ret
; 7009


WillPersonBumpIntoSomeoneElse: ; 7009
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	jr IsNPCAtCoord
; 7015

Function7015: ; unreferenced
	ld a, [hMapObjectIndexBuffer]
	call GetObjectStruct
	call .CheckWillBeFacingNPC
	call IsNPCAtCoord
	ret

.CheckWillBeFacingNPC: ; 7021
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetSpriteDirection
	and a
	jr z, .down
	cp OW_UP
	jr z, .up
	cp OW_LEFT
	jr z, .left
	inc d
	ret

.down
	inc e
	ret

.up
	dec e
	ret

.left
	dec d
	ret
; 7041

IsNPCAtCoord: ; 7041
	ld bc, ObjectStructs
	xor a
.loop
	ld [hObjectStructIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .next

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 7, [hl]
	jr nz, .next

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 7, [hl]
	jr z, .got

	call Function7171
	jr nc, .ok
	jr .ok2

.got
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .ok
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .ok

.ok2
	ld a, [hMapObjectIndexBuffer]
	ld l, a
	ld a, [hObjectStructIndexBuffer]
	cp l
	jr nz, .setcarry

.ok
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ld a, [hMapObjectIndexBuffer]
	ld l, a
	ld a, [hObjectStructIndexBuffer]
	cp l
	jr nz, .setcarry

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	and a
	ret

.setcarry
	scf
	ret
; 70a4

HasPersonReachedMovementLimit: ; 70a4
	ld hl, OBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nope
	and $f
	jr z, .check_y
	ld e, a
	ld d, a
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .yes
	cp e
	jr z, .yes

.check_y
	ld hl, OBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	jr z, .nope
	ld e, a
	ld d, a
	ld hl, OBJECT_INIT_Y
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .yes
	cp e
	jr z, .yes

.nope
	xor a
	ret

.yes
	scf
	ret
; 70ed

IsPersonMovingOffEdgeOfScreen: ; 70ed
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [XCoord]
	cp [hl]
	jr z, .check_y
	jr nc, .yes
	add $9
	cp [hl]
	jr c, .yes

.check_y
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [YCoord]
	cp [hl]
	jr z, .nope
	jr nc, .yes
	add $8
	cp [hl]
	jr c, .yes

.nope
	and a
	ret

.yes
	scf
	ret
; 7113

Function7113: ; unreferenced
	ld a, [PlayerStandingMapX]
	ld d, a
	ld a, [PlayerStandingMapY]
	ld e, a
	ld bc, ObjectStructs
	xor a
.loop
	ld [hObjectStructIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld a, [hl]
	cp SPRITEMOVEDATA_SNORLAX
	jr nz, .not_snorlax
	call Function7171
	jr c, .yes
	jr .next

.not_snorlax
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .check_current_coords
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .check_current_coords
	ld a, [hObjectStructIndexBuffer]
	cp $0
	jr z, .next
	jr .yes

.check_current_coords
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	jr .yes

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	xor a
	ret

.yes
	scf
	ret
; 7171


Function7171: ; 7171
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	jr c, .nope
	cp $2
	jr nc, .nope
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, e
	sub [hl]
	jr c, .nope
	cp $2
	jr nc, .nope
	scf
	ret

.nope
	and a
	ret
; 718d
