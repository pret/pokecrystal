BlankScreen: ; 8000
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, TileMapEnd - TileMap
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, AttrMapEnd - AttrMap
	ld a, $7
	call ByteFill
	call WaitBGMap2
	call SetPalettes
	ret

SpawnPlayer: ; 8029
	ld a, -1
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ld a, $0
	ld hl, PlayerObjectTemplate
	call CopyPlayerObjectTemplate
	ld b, $0
	call PlayerSpawn_ConvertCoords
	ld a, $0
	call GetMapObject
	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ln e, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a
	jr nz, .ok
	ld a, [PlayerGender]
	bit 0, a
	jr z, .ok
	ln e, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT

.ok
	ld [hl], e
	ld a, $0
	ld [hMapObjectIndexBuffer], a
	ld bc, MapObjects
	ld a, $0
	ld [hObjectStructIndexBuffer], a
	ld de, ObjectStructs
	call CopyMapObjectToObjectStruct
	ld a, PLAYER
	ld [wCenteredObject], a
	ret

PlayerObjectTemplate: ; 8071
; A dummy map object used to initialize the player object.
; Shorter than the actual amount copied by two bytes.
; Said bytes seem to be unused.
	person_event SPRITE_CHRIS, -4, -4, SPRITEMOVEDATA_PLAYER, 15, 15, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1

CopyDECoordsToMapObject:: ; 807e
	push de
	ld a, b
	call GetMapObject
	pop de
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld [hl], d
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hl], e
	ret

PlayerSpawn_ConvertCoords: ; 808f
	push bc
	ld a, [XCoord]
	add 4
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	pop bc
	call CopyDECoordsToMapObject
	ret

WritePersonXY:: ; 80a1
	ld a, b
	call CheckObjectVisibility
	ret c

	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [hMapObjectIndexBuffer]
	ld b, a
	call CopyDECoordsToMapObject
	and a
	ret

RefreshPlayerCoords: ; 80b8
	ld a, [XCoord]
	add 4
	ld d, a
	ld hl, PlayerStandingMapX
	sub [hl]
	ld [hl], d
	ld hl, MapObjects + MAPOBJECT_X_COORD
	ld [hl], d
	ld hl, PlayerLastMapX
	ld [hl], d
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	ld hl, PlayerStandingMapY
	sub [hl]
	ld [hl], e
	ld hl, MapObjects + MAPOBJECT_Y_COORD
	ld [hl], e
	ld hl, PlayerLastMapY
	ld [hl], e
	ld e, a
	ld a, [wObjectFollow_Leader]
	cp $0
	ret nz ; wtf
	ret

CopyObjectStruct:: ; 80e7
	call CheckObjectMask
	and a
	ret nz ; masked

	ld hl, ObjectStructs + OBJECT_STRUCT_LENGTH * 1
	ld a, 1
	ld de, OBJECT_STRUCT_LENGTH
.loop
	ld [hObjectStructIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .done
	add hl, de
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	scf
	ret ; overflow

.done
	ld d, h
	ld e, l
	call CopyMapObjectToObjectStruct
	ld hl, VramState
	bit 7, [hl]
	ret z

	ld hl, OBJECT_FLAGS2
	add hl, de
	set 5, [hl]
	ret

CopyMapObjectToObjectStruct: ; 8116
	call .CopyMapObjectToTempObject
	call CopyTempObjectToObjectStruct
	ret

.CopyMapObjectToTempObject: ; 811d
	ld a, [hObjectStructIndexBuffer]
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld [hl], a

	ld a, [hMapObjectIndexBuffer]
	ld [wTempObjectCopyMapObjectIndex], a

	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopySprite], a

	call GetSpriteVTile
	ld [wTempObjectCopySpriteVTile], a

	ld a, [hl]
	call GetSpritePalette
	ld [wTempObjectCopyPalette], a

	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .skip_color_override
	swap a
	and $7 ; OAM_PALETTE
	ld [wTempObjectCopyPalette], a

.skip_color_override
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyMovement], a

	ld hl, MAPOBJECT_RANGE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRange], a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyX], a

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyY], a

	ld hl, MAPOBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRadius], a
	ret

InitializeVisibleSprites: ; 8177
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next

	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next

	ld a, [XCoord]
	ld d, a
	ld a, [YCoord]
	ld e, a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next

	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next

	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next

	push bc
	call CopyObjectStruct
	pop bc
	jp c, .ret

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

.ret ; 81c9
	ret

CheckObjectEnteringVisibleRange:: ; 81ca
	nop
	ld a, [wPlayerStepDirection]
	cp STANDING
	ret z
	ld hl, .dw
	rst JumpTable
	ret

.dw ; 81d6
	dw .Down
	dw .Up
	dw .Left
	dw .Right

.Up: ; 81de
	ld a, [YCoord]
	sub 1
	jr .Vertical

.Down: ; 81e5
	ld a, [YCoord]
	add 9
.Vertical: ; 81ea
	ld d, a
	ld a, [XCoord]
	ld e, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop_v
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_v
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .next_v
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next_v
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next_v
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next_v
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next_v
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop_v
	ret

.Left: ; 8232
	ld a, [XCoord]
	sub 1
	jr .Horizontal

.Right: ; 8239
	ld a, [XCoord]
	add 10
.Horizontal: ; 823e
	ld e, a
	ld a, [YCoord]
	ld d, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop_h
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next_h
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, e
	cp [hl]
	jr nz, .next_h
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next_h
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next_h
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next_h
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next_h
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop_h
	ret

CopyTempObjectToObjectStruct: ; 8286
	ld a, [wTempObjectCopyMapObjectIndex]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopyMovement]
	call CopySpriteMovementData

	ld a, [wTempObjectCopyPalette]
	ld hl, OBJECT_PALETTE
	add hl, de
	or [hl]
	ld [hl], a

	ld a, [wTempObjectCopyY]
	call .InitYCoord

	ld a, [wTempObjectCopyX]
	call .InitXCoord

	ld a, [wTempObjectCopySprite]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopySpriteVTile]
	ld hl, OBJECT_SPRITE_TILE
	add hl, de
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00

	ld hl, OBJECT_FACING_STEP
	add hl, de
	ld [hl], STANDING

	ld a, [wTempObjectCopyRadius]
	call .InitRadius

	ld a, [wTempObjectCopyRange]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a

	and a
	ret

.InitYCoord: ; 82d5
	ld hl, OBJECT_INIT_Y
	add hl, de
	ld [hl], a

	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], a

	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetY
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ret

.InitXCoord: ; 82f1
	ld hl, OBJECT_INIT_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], a
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetX
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ret

.InitRadius: ; 830d
	ld h, a
	inc a
	and $f
	ld l, a
	ld a, h
	add $10
	and $f0
	or l
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], a
	ret

TrainerWalkToPlayer: ; 831e
	ld a, [hLastTalked]
	call InitMovementBuffer
	ld a, movement_step_sleep
	call AppendToMovementBuffer
	ld a, [wd03f]
	dec a
	jr z, .TerminateStep
	ld a, [hLastTalked]
	ld b, a
	ld c, PLAYER
	ld d, 1
	call .GetPathToPlayer
	call DecrementMovementBufferCount

.TerminateStep:
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret

.GetPathToPlayer: ; 8341
	push de
	push bc
; get player object struct, load to de
	ld a, c
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld d, b
	ld e, c

; get last talked object struct, load to bc
	pop bc
	ld a, b
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct

; get last talked coords, load to bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

; get player coords, load to de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld e, [hl]
	ld d, a

	pop af
	call ComputePathToWalkToPlayer
	ret

Special_SurfStartStep: ; 8379
	call InitMovementBuffer
	call .GetMovementData
	call AppendToMovementBuffer
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret

.GetMovementData: ; 8388
	ld a, [PlayerDirection]
	srl a
	srl a
	and 3
	ld e, a
	ld d, 0
	ld hl, .movement_data
	add hl, de
	ld a, [hl]
	ret

.movement_data
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT

FollowNotExact:: ; 839e
	push bc
	ld a, c
	call CheckObjectVisibility
	ld d, b
	ld e, c
	pop bc
	ret c

	ld a, b
	call CheckObjectVisibility
	ret c

; Person 2 is now in bc, person 1 is now in de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	cp b
	jr z, .same_x
	jr c, .to_the_left
	inc b
	jr .continue

.to_the_left
	dec b
	jr .continue

.same_x
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld a, [hl]
	cp c
	jr z, .continue
	jr c, .below
	inc c
	jr .continue

.below
	dec c

.continue
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], b
	ld a, b
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetX
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wPlayerBGMapOffsetY
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ld a, [hObjectStructIndexBuffer]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld [hl], SPRITEMOVEDATA_FOLLOWNOTEXACT
	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00
	ret

GetRelativeFacing:: ; 8417
; Determines which way map object e would have to turn to face map object d.  Returns carry if it's impossible for whatever reason.
	ld a, d
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld d, a
	ld a, e
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld e, a
	call .GetFacing_e_relativeto_d
	ret

.carry
	scf
	ret

.GetFacing_e_relativeto_d: ; 8439
; Determines which way object e would have to turn to face object d.  Returns carry if it's impossible.
; load the coordinates of object d into bc
	ld a, d
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a
	push bc
; load the coordinates of object e into de
	ld a, e
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop bc
; |x1 - x2|
	ld a, b
	sub d
	jr z, .same_x_1
	jr nc, .b_right_of_d_1
	cpl
	inc a

.b_right_of_d_1
; |y1 - y2|
	ld h, a
	ld a, c
	sub e
	jr z, .same_y_1
	jr nc, .c_below_e_1
	cpl
	inc a

.c_below_e_1
; |y1 - y2| - |x1 - x2|
	sub h
	jr c, .same_y_1

.same_x_1
; compare the y coordinates
	ld a, c
	cp e
	jr z, .same_x_and_y
	jr c, .c_directly_below_e
; c directly above e
	ld d, DOWN
	and a
	ret

.c_directly_below_e
	ld d, UP
	and a
	ret

.same_y_1
	ld a, b
	cp d
	jr z, .same_x_and_y
	jr c, .b_directly_right_of_d
; b directly left of d
	ld d, RIGHT
	and a
	ret

.b_directly_right_of_d
	ld d, LEFT
	and a
	ret

.same_x_and_y
	scf
	ret

QueueFollowerFirstStep: ; 848a
	call .QueueFirstStep
	jr c, .same
	ld [wFollowMovementQueue], a
	xor a
	ld [wFollowerMovementQueueLength], a
	ret

.same
	ld a, -1
	ld [wFollowerMovementQueueLength], a
	ret

.QueueFirstStep:
	ld a, [wObjectFollow_Leader]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [wObjectFollow_Follower]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr z, .check_y
	jr c, .left
	and a
	ld a, movement_step + RIGHT
	ret

.left
	and a
	ld a, movement_step + LEFT
	ret

.check_y
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, e
	cp [hl]
	jr z, .same_xy
	jr c, .up
	and a
	ld a, movement_step + DOWN
	ret

.up
	and a
	ld a, movement_step + UP
	ret

.same_xy
	scf
	ret
