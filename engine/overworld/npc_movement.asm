CanObjectMoveInDirection:
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit SWIMMING_F, [hl]
	jr z, .not_swimming

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit NOCLIP_TILES_F, [hl]
	jr nz, .noclip_tiles
	push hl
	push bc
	call WillObjectBumpIntoLand
	pop bc
	pop hl
	ret c
	jr .continue

.not_swimming
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit NOCLIP_TILES_F, [hl]
	jr nz, .noclip_tiles
	push hl
	push bc
	call WillObjectBumpIntoWater
	pop bc
	pop hl
	ret c

.noclip_tiles
.continue
	bit NOCLIP_OBJS_F, [hl]
	jr nz, .noclip_objs

	push hl
	push bc
	call WillObjectBumpIntoSomeoneElse
	pop bc
	pop hl
	ret c

.noclip_objs
	bit MOVE_ANYWHERE_F, [hl]
	jr nz, .move_anywhere
	push hl
	call HasObjectReachedMovementLimit
	pop hl
	ret c

	push hl
	call IsObjectMovingOffEdgeOfScreen
	pop hl
	ret c

.move_anywhere
	and a
	ret

WillObjectBumpIntoWater:
	call CanObjectLeaveTile
	ret c
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit OAM_PRIORITY, [hl]
	jp nz, WillObjectRemainOnWater
	ld hl, OBJECT_TILE
	add hl, bc
	ld a, [hl]
	ld d, a
	call GetTileCollision
	and a ; LAND_TILE
	jr z, WillObjectBumpIntoTile
	scf
	ret

WillObjectBumpIntoLand:
	call CanObjectLeaveTile
	ret c
	ld hl, OBJECT_TILE
	add hl, bc
	ld a, [hl]
	call GetTileCollision
	cp WATER_TILE
	jr z, WillObjectBumpIntoTile
	scf
	ret

WillObjectBumpIntoTile:
	ld hl, OBJECT_TILE
	add hl, bc
	ld a, [hl]
	call GetSideWallDirectionMask
	ret nc
	push af
	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .dir_masks
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret

.dir_masks
	db DOWN_MASK  ; DOWN
	db UP_MASK    ; UP
	db RIGHT_MASK ; LEFT
	db LEFT_MASK  ; RIGHT

CanObjectLeaveTile:
	ld hl, OBJECT_LAST_TILE
	add hl, bc
	ld a, [hl]
	call GetSideWallDirectionMask
	ret nc
	push af
	ld hl, OBJECT_WALKING
	add hl, bc
	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .dir_masks
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret

.dir_masks
	db UP_MASK    ; DOWN
	db DOWN_MASK  ; UP
	db LEFT_MASK  ; LEFT
	db RIGHT_MASK ; RIGHT

GetSideWallDirectionMask:
	ld d, a
	and $f0
	cp HI_NYBBLE_SIDE_WALLS
	jr z, .continue
	cp HI_NYBBLE_SIDE_BUOYS
	jr z, .continue
	xor a
	ret

.continue
	ld a, d
	and $7
	ld e, a
	ld d, 0
	ld hl, .side_wall_masks
	add hl, de
	ld a, [hl]
	scf
	ret

.side_wall_masks
	db RIGHT_MASK             ; COLL_RIGHT_WALL/BUOY
	db LEFT_MASK              ; COLL_LEFT_WALL/BUOY
	db DOWN_MASK              ; COLL_UP_WALL/BUOY
	db UP_MASK                ; COLL_DOWN_WALL/BUOY
	db UP_MASK | RIGHT_MASK   ; COLL_DOWN_RIGHT_WALL/BUOY
	db UP_MASK | LEFT_MASK    ; COLL_DOWN_LEFT_WALL/BUOY
	db DOWN_MASK | RIGHT_MASK ; COLL_UP_RIGHT_WALL/BUOY
	db DOWN_MASK | LEFT_MASK  ; COLL_UP_LEFT_WALL/BUOY

WillObjectRemainOnWater:
	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	maskbits NUM_DIRECTIONS
	jr z, .down
	dec a
	jr z, .up
	dec a
	jr z, .left
	jr .right

.down
	inc e
	push de
	inc d
	jr .continue

.up
	push de
	inc d
	jr .continue

.left
	push de
	inc e
	jr .continue

.right
	inc d
	push de
	inc e

.continue
	call GetCoordTile
	call GetTileCollision
	pop de
	and a ; LAND_TILE
	jr nz, .not_land
	call GetCoordTile
	call GetTileCollision
	and a ; LAND_TILE
	jr nz, .not_land
	xor a
	ret

.not_land
	scf
	ret

CheckFacingObject::
	call GetFacingTileCoord

; Double the distance for counter tiles.
	call CheckCounterTile
	jr nz, .not_counter

	ld a, [wPlayerMapX]
	sub d
	cpl
	inc a
	add d
	ld d, a

	ld a, [wPlayerMapY]
	sub e
	cpl
	inc a
	add e
	ld e, a

.not_counter
	ld bc, wObjectStructs ; redundant
	ld a, 0
	ldh [hMapObjectIndex], a
	call IsNPCAtCoord
	ret nc
	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	xor a
	ret

.standing
	scf
	ret

WillObjectBumpIntoSomeoneElse:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	jr IsNPCAtCoord

IsObjectFacingSomeoneElse: ; unreferenced
	ldh a, [hMapObjectIndex]
	call GetObjectStruct
	call .GetFacingCoords
	call IsNPCAtCoord
	ret

.GetFacingCoords:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetSpriteDirection
	and a ; OW_DOWN?
	jr z, .down
	cp OW_UP
	jr z, .up
	cp OW_LEFT
	jr z, .left
	; OW_RIGHT
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

IsNPCAtCoord:
	ld bc, wObjectStructs
	xor a
.loop
	ldh [hObjectStructIndex], a
	call DoesObjectHaveASprite
	jr z, .next

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 7, [hl]
	jr nz, .next

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit BIG_OBJECT_F, [hl]
	jr z, .not_big
	call WillObjectIntersectBigObject
	jr nc, .check_current_coords
	jr .continue

.not_big
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .check_current_coords
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .check_current_coords

.continue
	ldh a, [hMapObjectIndex]
	ld l, a
	ldh a, [hObjectStructIndex]
	cp l
	jr nz, .yes

.check_current_coords
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	ld hl, OBJECT_LAST_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ldh a, [hMapObjectIndex]
	ld l, a
	ldh a, [hObjectStructIndex]
	cp l
	jr nz, .yes

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hObjectStructIndex]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	and a
	ret

.yes
	scf
	ret

HasObjectReachedMovementLimit:
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
	ld hl, OBJECT_MAP_X
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
	ld hl, OBJECT_MAP_Y
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

IsObjectMovingOffEdgeOfScreen:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [wXCoord]
	cp [hl]
	jr z, .check_y
	jr nc, .yes
	add $9
	cp [hl]
	jr c, .yes

.check_y
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [wYCoord]
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

IsNPCAtPlayerCoord: ; unreferenced
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wPlayerMapY]
	ld e, a
	ld bc, wObjectStructs
	xor a
.loop
	ldh [hObjectStructIndex], a
	call DoesObjectHaveASprite
	jr z, .next

	ld hl, OBJECT_MOVEMENT_TYPE
	add hl, bc
	ld a, [hl]
	cp SPRITEMOVEDATA_BIGDOLLSYM
	jr nz, .not_big
	call WillObjectIntersectBigObject
	jr c, .yes
	jr .next

.not_big
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .check_current_coords
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .check_current_coords
	ldh a, [hObjectStructIndex]
	cp PLAYER_OBJECT
	jr z, .next
	jr .yes

.check_current_coords
	ld hl, OBJECT_LAST_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ld hl, OBJECT_LAST_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	jr .yes

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hObjectStructIndex]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	xor a
	ret

.yes
	scf
	ret

WillObjectIntersectBigObject:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	jr c, .nope
	cp 2 ; big doll width
	jr nc, .nope
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, e
	sub [hl]
	jr c, .nope
	cp 2 ; big doll height
	jr nc, .nope
	scf
	ret

.nope
	and a
	ret
