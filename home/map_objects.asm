; Functions handling map objects.

GetSpritePalette::
	push hl
	push de
	push bc
	ld c, a

	farcall _GetSpritePalette

	ld a, c
	pop bc
	pop de
	pop hl
	ret

GetSpriteVTile::
	push hl
	push bc
	ld hl, wUsedSprites + 2
	ld c, SPRITE_GFX_LIST_CAPACITY - 1
	ld b, a
	ldh a, [hMapObjectIndexBuffer]
	cp 0
	jr z, .nope
	ld a, b
.loop
	cp [hl]
	jr z, .found
	inc hl
	inc hl
	dec c
	jr nz, .loop
	ld a, [wUsedSprites + 1]
	scf
	jr .done

.nope
	ld a, [wUsedSprites + 1]
	jr .done

.found
	inc hl
	xor a
	ld a, [hl]

.done
	pop bc
	pop hl
	ret

DoesSpriteHaveFacings::
	push de
	push hl

	ld b, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(_DoesSpriteHaveFacings)
	rst Bankswitch

	ld a, b
	call _DoesSpriteHaveFacings
	ld c, a

	pop de
	ld a, d
	rst Bankswitch

	pop hl
	pop de
	ret

GetPlayerStandingTile::
	ld a, [wPlayerStandingTile]
	call GetTileCollision
	ld b, a
	ret

CheckOnWater::
	ld a, [wPlayerStandingTile]
	call GetTileCollision
	sub WATER_TILE
	ret z
	and a
	ret

GetTileCollision::
; Get the collision type of tile a.

	push de
	push hl

	ld hl, TileCollisionTable
	ld e, a
	ld d, 0
	add hl, de

	ldh a, [hROMBank]
	push af
	ld a, BANK(TileCollisionTable)
	rst Bankswitch
	ld e, [hl]
	pop af
	rst Bankswitch

	ld a, e
	and $f ; lo nybble only

	pop hl
	pop de
	ret

CheckGrassTile::
	ld d, a
	and $f0
	cp HI_NYBBLE_TALL_GRASS
	jr z, .grass
	cp HI_NYBBLE_WATER
	jr z, .water
	scf
	ret

.grass
	ld a, d
	and LO_NYBBLE_GRASS
	ret z
	scf
	ret
; For some reason, the above code is duplicated down here.
.water
	ld a, d
	and LO_NYBBLE_GRASS
	ret z
	scf
	ret

CheckSuperTallGrassTile::
	cp COLL_LONG_GRASS
	ret z
	cp COLL_LONG_GRASS_1C
	ret

CheckCutTreeTile::
	cp COLL_CUT_TREE
	ret z
	cp COLL_CUT_TREE_1A
	ret

CheckHeadbuttTreeTile::
	cp COLL_HEADBUTT_TREE
	ret z
	cp COLL_HEADBUTT_TREE_1D
	ret

CheckCounterTile::
	cp COLL_COUNTER
	ret z
	cp COLL_COUNTER_98
	ret

CheckPitTile::
	cp COLL_PIT
	ret z
	cp COLL_PIT_68
	ret

CheckIceTile::
	cp COLL_ICE
	ret z
	cp COLL_ICE_2B
	ret z
	scf
	ret

CheckWhirlpoolTile::
	nop
	cp COLL_WHIRLPOOL
	ret z
	cp COLL_WHIRLPOOL_2C
	ret z
	scf
	ret

CheckWaterfallTile::
	cp COLL_WATERFALL
	ret z
	cp COLL_CURRENT_DOWN
	ret

CheckStandingOnEntrance::
	ld a, [wPlayerStandingTile]
	cp COLL_DOOR
	ret z
	cp COLL_DOOR_79
	ret z
	cp COLL_STAIRCASE
	ret z
	cp COLL_CAVE
	ret

GetMapObject::
; Return the location of map object a in bc.
	ld hl, wMapObjects
	ld bc, MAPOBJECT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ret

CheckObjectVisibility::
; Sets carry if the object is not visible on the screen.
	ldh [hMapObjectIndexBuffer], a
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .not_visible
	ldh [hObjectStructIndexBuffer], a
	call GetObjectStruct
	and a
	ret

.not_visible
	scf
	ret

CheckObjectTime::
	ld hl, MAPOBJECT_HOUR
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .check_hour
	ld hl, MAPOBJECT_TIMEOFDAY
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .timeofday_always
	ld hl, .TimeOfDayValues_191e
	ld a, [wTimeOfDay]
	add l
	ld l, a
	jr nc, .ok
	inc h

.ok
	ld a, [hl]
	ld hl, MAPOBJECT_TIMEOFDAY
	add hl, bc
	and [hl]
	jr nz, .timeofday_always
	scf
	ret

.timeofday_always
	and a
	ret

.TimeOfDayValues_191e:
; entries correspond to TimeOfDay values
	db MORN
	db DAY
	db NITE

.check_hour
	ld hl, MAPOBJECT_HOUR
	add hl, bc
	ld d, [hl]
	ld hl, MAPOBJECT_TIMEOFDAY
	add hl, bc
	ld e, [hl]
	ld hl, hHours
	ld a, d
	cp e
	jr z, .yes
	jr c, .check_timeofday
	ld a, [hl]
	cp d
	jr nc, .yes
	cp e
	jr c, .yes
	jr z, .yes
	jr .no

.check_timeofday
	ld a, e
	cp [hl]
	jr c, .no
	ld a, [hl]
	cp d
	jr nc, .yes
	jr .no

.yes
	and a
	ret

.no
	scf
	ret

; unused
	ldh [hMapObjectIndexBuffer], a
	call GetMapObject
	call CopyObjectStruct
	ret

_CopyObjectStruct::
	ldh [hMapObjectIndexBuffer], a
	call UnmaskObject
	ldh a, [hMapObjectIndexBuffer]
	call GetMapObject
	farcall CopyObjectStruct
	ret

ApplyDeletionToMapObject::
	ldh [hMapObjectIndexBuffer], a
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	ret z ; already hidden
	ld [hl], -1
	push af
	call .CheckStopFollow
	pop af
	call GetObjectStruct
	farcall DeleteMapObject
	ret

.CheckStopFollow:
	ld hl, wObjectFollow_Leader
	cp [hl]
	jr z, .ok
	ld hl, wObjectFollow_Follower
	cp [hl]
	ret nz
.ok
	farcall StopFollow
	ld a, -1
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ret

DeleteObjectStruct::
	call ApplyDeletionToMapObject
	call MaskObject
	ret

CopyPlayerObjectTemplate::
	push hl
	call GetMapObject
	ld d, b
	ld e, c
	ld a, -1
	ld [de], a
	inc de
	pop hl
	ld bc, MAPOBJECT_LENGTH - 1
	call CopyBytes
	ret

Unreferenced_Function19b8:
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	push af
	ld [hl], -1
	inc hl
	ld bc, MAPOBJECT_LENGTH - 1
	xor a
	call ByteFill
	pop af
	cp -1
	ret z
	cp $d
	ret nc
	ld b, a
	ld a, [wObjectFollow_Leader]
	cp b
	jr nz, .ok
	ld a, -1
	ld [wObjectFollow_Leader], a

.ok
	ld a, b
	call GetObjectStruct
	farcall DeleteMapObject
	ret

LoadMovementDataPointer::
; Load the movement data pointer for object a.
	ld [wMovementObject], a
	ldh a, [hROMBank]
	ld [wMovementDataBank], a
	ld a, l
	ld [wMovementDataAddress], a
	ld a, h
	ld [wMovementDataAddress + 1], a
	ld a, [wMovementObject]
	call CheckObjectVisibility
	ret c

	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], SPRITEMOVEDATA_SCRIPTED

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00

	ld hl, wVramState
	set 7, [hl]
	and a
	ret

FindFirstEmptyObjectStruct::
; Returns the index of the first empty object struct in A and its address in HL, then sets carry.
; If all object structs are occupied, A = 0 and Z is set.
; Preserves BC and DE.
	push bc
	push de
	ld hl, wObjectStructs
	ld de, OBJECT_LENGTH
	ld c, NUM_OBJECT_STRUCTS
.loop
	ld a, [hl]
	and a
	jr z, .break
	add hl, de
	dec c
	jr nz, .loop
	xor a
	jr .done

.break
	ld a, NUM_OBJECT_STRUCTS
	sub c
	scf

.done
	pop de
	pop bc
	ret

GetSpriteMovementFunction::
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld a, [hl]
	cp NUM_SPRITEMOVEDATA
	jr c, .ok
	xor a

.ok
	ld hl, SpriteMovementData + SPRITEMOVEATTR_MOVEMENT
	ld e, a
	ld d, 0
rept NUM_SPRITEMOVEDATA_FIELDS
	add hl, de
endr
	ld a, [hl]
	ret

GetInitialFacing::
	push bc
	push de
	ld e, a
	ld d, 0
	ld hl, SpriteMovementData + SPRITEMOVEATTR_FACING
rept NUM_SPRITEMOVEDATA_FIELDS
	add hl, de
endr
	ld a, BANK(SpriteMovementData)
	call GetFarByte
	add a
	add a
	maskbits NUM_DIRECTIONS, 2
	pop de
	pop bc
	ret

CopySpriteMovementData::
	ld l, a
	ldh a, [hROMBank]
	push af
	ld a, BANK(SpriteMovementData)
	rst Bankswitch
	ld a, l
	push bc

	call .CopyData

	pop bc
	pop af
	rst Bankswitch

	ret

.CopyData:
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld [hl], a

	push de
	ld e, a
	ld d, 0
	ld hl, SpriteMovementData + SPRITEMOVEATTR_FACING
rept NUM_SPRITEMOVEDATA_FIELDS
	add hl, de
endr
	ld b, h
	ld c, l
	pop de

	ld a, [bc]
	inc bc
	rlca
	rlca
	maskbits NUM_DIRECTIONS, 2
	ld hl, OBJECT_FACING
	add hl, de
	ld [hl], a

	ld a, [bc]
	inc bc
	ld hl, OBJECT_ACTION
	add hl, de
	ld [hl], a

	ld a, [bc]
	inc bc
	ld hl, OBJECT_FLAGS1
	add hl, de
	ld [hl], a

	ld a, [bc]
	inc bc
	ld hl, OBJECT_FLAGS2
	add hl, de
	ld [hl], a

	ld a, [bc]
	inc bc
	ld hl, OBJECT_PALETTE
	add hl, de
	ld [hl], a
	ret

_GetMovementByte::
; Switch to the movement data bank
	ldh a, [hROMBank]
	push af
	ld a, [hli]
	rst Bankswitch
; Load the current script byte as given by OBJECT_MOVEMENT_BYTE_INDEX, and increment OBJECT_MOVEMENT_BYTE_INDEX
	ld a, [hli]
	ld d, [hl]
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	add [hl]
	ld e, a
	ld a, d
	adc 0
	ld d, a
	inc [hl]
	ld a, [de]
	ld h, a
	pop af
	rst Bankswitch

	ld a, h
	ret

UnreferencedSetVramState_Bit0::
	ld hl, wVramState
	set 0, [hl]
	ret

UnreferencedResetVramState_Bit0::
	ld hl, wVramState
	res 0, [hl]
	ret

UpdateSprites::
	ld a, [wVramState]
	bit 0, a
	ret z

	farcall Function55e0
	farcall _UpdateSprites
	ret

GetObjectStruct::
	ld bc, OBJECT_LENGTH
	ld hl, wObjectStructs
	call AddNTimes
	ld b, h
	ld c, l
	ret

DoesObjectHaveASprite::
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	ret

SetSpriteDirection::
	; preserves other flags
	push af
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %11110011
	ld e, a
	pop af
	maskbits NUM_DIRECTIONS, 2
	or e
	ld [hl], a
	ret

GetSpriteDirection::
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	maskbits NUM_DIRECTIONS, 2
	ret
