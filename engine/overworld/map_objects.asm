INCLUDE "data/sprites/facings.asm"

INCLUDE "data/sprites/map_objects.asm"

DeleteMapObject::
	push bc
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	push af
	ld h, b
	ld l, c
	ld bc, OBJECT_STRUCT_LENGTH
	xor a
	call ByteFill
	pop af
	cp -1
	jr z, .ok
	bit 7, a
	jr nz, .ok
	call GetMapObject
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld [hl], -1
.ok
	pop bc
	ret

Function437b:
	call .CheckObjectStillVisible
	ret c
	call .HandleStepType
	call .HandleObjectAction
	ret

.CheckObjectStillVisible:
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_6, [hl]
	ld a, [wXCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok
	ld a, [wYCoord]
	ld e, a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .ok
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .ok
	jr .yes

.ok
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set OBJ_FLAGS2_6, [hl]
	ld a, [wXCoord]
	ld e, a
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .ok2
	ld a, [wYCoord]
	ld e, a
	ld hl, OBJECT_INIT_Y
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .ok2
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .ok2
.yes
	and a
	ret

.ok2
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit WONT_DELETE_F, [hl]
	jr nz, .yes2
	call DeleteMapObject
	scf
	ret

.yes2
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set OBJ_FLAGS2_6, [hl]
	and a
	ret

.HandleStepType:
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .zero
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJ_FLAGS2_5, [hl]
	jr nz, .bit5
	cp STEP_TYPE_SLEEP
	jr z, .one
	jr .ok3

.zero
	call ObjectMovementReset
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJ_FLAGS2_5, [hl]
	jr nz, .bit5
.one
	call MapObjectMovementPattern
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld a, [hl]
	and a
	ret z
	cp STEP_TYPE_SLEEP
	ret z
.ok3
	ld hl, StepTypesJumptable
	rst JumpTable
	ret

.bit5
	ret

.HandleObjectAction:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE_F, [hl]
	jr nz, SetFacingStanding
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJ_FLAGS2_6, [hl]
	jr nz, SetFacingStanding
	bit OBJ_FLAGS2_5, [hl]
	jr nz, asm_4448
	ld de, ObjectActionPairPointers ; use first column
	jr _HandleObjectAction

Function4440:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit INVISIBLE_F, [hl]
	jr nz, SetFacingStanding
asm_4448:
	ld de, ObjectActionPairPointers + 2 ; use second column
	jr _HandleObjectAction

_HandleObjectAction:
; call [4 * wObjectStructs[ObjInd, OBJECT_ACTION] + de]
	ld hl, OBJECT_ACTION
	add hl, bc
	ld a, [hl]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call _hl_
	ret

INCLUDE "engine/overworld/map_object_action.asm"

CopyNextCoordsTileToStandingCoordsTile:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld [hl], a
	call SetTallGrassFlags
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret

Function462a:
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ret

UpdateTallGrassFlags:
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OVERHEAD_F, [hl]
	jr z, .ok
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call SetTallGrassFlags
.ok
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret c ; never happens
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	call UselessAndA
	ret

SetTallGrassFlags:
	call CheckSuperTallGrassTile
	jr z, .set
	call CheckGrassTile
	jr c, .reset
.set
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set OVERHEAD_F, [hl]
	ret

.reset
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD_F, [hl]
	ret

UselessAndA:
	and a
	ret

EndSpriteMovement:
	xor a
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a ; OBJECT_1E
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

InitStep:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit FIXED_FACING_F, [hl]
	jr nz, GetNextTile
	add a
	add a
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
GetNextTile:
	call GetStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld a, d
	call GetStepVectorSign
	ld hl, OBJECT_MAP_X
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, e
	call GetStepVectorSign
	ld hl, OBJECT_MAP_Y
	add hl, bc
	add [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld [hl], a
	ld e, a
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	ret

AddStepVector:
	call GetStepVector
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
	ret

GetStepVector:
; Return (x, y, duration, speed) in (d, e, a, h).
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00001111
	add a
	add a
	ld l, a
	ld h, 0
	ld de, StepVectors
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ret

StepVectors:
; x,  y, duration, speed
	; slow
	db  0,  1, 16, 1
	db  0, -1, 16, 1
	db -1,  0, 16, 1
	db  1,  0, 16, 1
	; normal
	db  0,  2,  8, 2
	db  0, -2,  8, 2
	db -2,  0,  8, 2
	db  2,  0,  8, 2
	; fast
	db  0,  4,  4, 4
	db  0, -4,  4, 4
	db -4,  0,  4, 4
	db  4,  0,  4, 4

GetStepVectorSign:
	add a
	ret z  ; 0 or 128
	ld a, 1
	ret nc ; 1 - 127
	ld a, -1
	ret    ; 129 - 255

UpdatePlayerStep:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00000011
	ld [wPlayerStepDirection], a
	call AddStepVector
	ld a, [wPlayerStepVectorX]
	add d
	ld [wPlayerStepVectorX], a
	ld a, [wPlayerStepVectorY]
	add e
	ld [wPlayerStepVectorY], a
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_CONTINUE_F, [hl]
	ret

Unreferenced_Function4759:
	push bc
	ld e, a
	ld d, 0
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	call GetMapObject
	add hl, de
	ld a, [hl]
	pop bc
	ret

RestoreDefaultMovement:
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jr z, .ok
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ret

.ok
	ld a, SPRITEMOVEFN_STANDING
	ret

ClearObjectMovementByteIndex:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], 0
	ret

IncrementObjectMovementByteIndex:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	inc [hl]
	ret

DecrementObjectMovementByteIndex:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	dec [hl]
	ret

MovementAnonymousJumptable:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

ClearObjectStructField1c:
	ld hl, OBJECT_1C
	add hl, bc
	ld [hl], 0
	ret

IncrementObjectStructField1c:
	ld hl, OBJECT_1C
	add hl, bc
	inc [hl]
	ret

Field1cAnonymousJumptable:
	ld hl, OBJECT_1C
	add hl, bc
	ld a, [hl]
	pop hl
	rst JumpTable
	ret

GetValueObjectStructField1c:
	ld hl, OBJECT_1C
	add hl, bc
	ld a, [hl]
	ret

SetValueObjectStructField1c:
	ld hl, OBJECT_1C
	add hl, bc
	ld [hl], a
	ret

ObjectMovementReset:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	push bc
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	call CopyNextCoordsTileToStandingCoordsTile
	call EndSpriteMovement
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

MapObjectMovementPattern:
	call ClearObjectStructField1c
	call GetSpriteMovementFunction
	ld a, [hl]
	ld hl, .Pointers
	rst JumpTable
	ret

.Pointers:
; entries correspond to SPRITEMOVEFN_* constants
	dw .Null_00 ; 00
	dw .RandomWalkY ; 01
	dw .RandomWalkX ; 02
	dw .RandomWalkXY ; 03
	dw .RandomSpin1 ; 04
	dw .RandomSpin2 ; 05
	dw .Standing ; 06
	dw .ObeyDPad ; 07
	dw .Movement08 ; 08
	dw .Movement09 ; 09
	dw .Movement0a ; 0a
	dw .Movement0b ; 0b
	dw .Movement0c ; 0c
	dw .Movement0d ; 0d
	dw .Movement0e ; 0e
	dw .Follow ; 0f
	dw .Script ; 10
	dw .Strength ; 11
	dw .FollowNotExact ; 12
	dw .MovementShadow ; 13
	dw .MovementEmote ; 14
	dw .MovementBigStanding ; 15
	dw .MovementBouncing ; 16
	dw .MovementScreenShake ; 17
	dw .MovementSpinClockwise ; 18
	dw .MovementSpinCounterclockwise ; 19
	dw .MovementBoulderDust ; 1a
	dw .MovementShakingGrass ; 1b

.Null_00:
	ret

.RandomWalkY:
	call Random
	ldh a, [hRandomAdd]
	and %00000001
	jp .RandomWalkContinue

.RandomWalkX:
	call Random
	ldh a, [hRandomAdd]
	and %00000001
	or  %00000010
	jp .RandomWalkContinue

.RandomWalkXY:
	call Random
	ldh a, [hRandomAdd]
	and %00000011
	jp .RandomWalkContinue

.RandomSpin1:
	call Random
	ldh a, [hRandomAdd]
	and %00001100
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	jp RandomStepDuration_Slow

.RandomSpin2:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	ld d, a
	call Random
	ldh a, [hRandomAdd]
	and %00001100
	cp d
	jr nz, .keep
	xor %00001100
.keep
	ld [hl], a
	jp RandomStepDuration_Fast

.Standing:
	call Function462a
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_05
	ret

.ObeyDPad:
	ld hl, Function5000
	jp HandleMovementData

.Movement08:
	ld hl, Function5015
	jp HandleMovementData

.Movement09:
	ld hl, Function5026
	jp HandleMovementData

.Movement0a:
	jp _GetMovementObject

.Movement0b:
	jp _GetMovementObject

.Movement0c:
	jp _GetMovementObject

.Movement0d:
	ld hl, Function5000
	jp HandleMovementData

.Movement0e:
	jp _GetMovementObject

.Follow:
	ld hl, GetFollowerNextMovementByte
	jp HandleMovementData

.Script:
	ld hl, GetMovementByte
	jp HandleMovementData

.Strength:
	call MovementAnonymousJumptable
	dw .Strength_Start
	dw .Strength_Stop

.Strength_Start:
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call CheckPitTile
	jr z, .on_pit
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit OBJ_FLAGS2_2, [hl]
	res OBJ_FLAGS2_2, [hl]
	jr z, .ok
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %00000011
	or 0
	call InitStep
	call CanObjectMoveInDirection
	jr c, .ok2
	ld de, SFX_STRENGTH
	call PlaySFX
	call SpawnStrengthBoulderDust
	call UpdateTallGrassFlags
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_0F
	ret

.ok2
	call Function462a
.ok
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.on_pit
	call IncrementObjectMovementByteIndex
.Strength_Stop:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

.FollowNotExact:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .equal
	jr c, .less
	ld a, 3
	jr .done

.less
	ld a, 2
	jr .done

.equal
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr z, .standing
	jr c, .less2
	ld a, 0
	jr .done

.less2
	ld a, 1
.done
	ld d, a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and %00001100
	or d
	pop bc
	jp NormalStep

.standing
	pop bc
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	ret

.MovementBigStanding:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_BIG_DOLL_SYM
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementBouncing:
	call EndSpriteMovement
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_BOUNCE
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04
	ret

.MovementSpinCounterclockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnLeft

.MovementSpinClockwise:
	call MovementAnonymousJumptable
	dw .MovementSpinInit
	dw .MovementSpinRepeat
	dw .MovementSpinTurnRight

.MovementSpinInit:
	call EndSpriteMovement
	call IncrementObjectMovementByteIndex
.MovementSpinRepeat:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	ld a, $10
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	call IncrementObjectMovementByteIndex
	ret

.MovementSpinTurnLeft:
	ld de, .DirectionData_Counterclockwise
	call .MovementSpinNextFacing
	jr .MovementSpinCounterclockwise

.DirectionData_Counterclockwise:
	db OW_RIGHT, OW_LEFT, OW_DOWN, OW_UP

.MovementSpinTurnRight:
	ld de, .DirectionData_Clockwise
	call .MovementSpinNextFacing
	jr .MovementSpinClockwise

.DirectionData_Clockwise:
	db OW_LEFT, OW_RIGHT, OW_UP, OW_DOWN

.MovementSpinNextFacing:
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	and %00001100
	rrca
	rrca
	push hl
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	call DecrementObjectMovementByteIndex
	ret

.MovementShadow:
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SHADOW
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	add 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	maskbits NUM_DIRECTIONS
	ld d, 1 * 8 + 6
	cp DOWN
	jr z, .ok_13
	cp UP
	jr z, .ok_13
	ld d, 1 * 8 + 4
.ok_13
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementEmote:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_EMOTE
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], -2 * 8
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.MovementBoulderDust:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_BOULDER_DUST
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	inc a
	add a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, de
	ld a, [hl]
	and %00000011
	ld e, a
	ld d, 0
	ld hl, .data_4a81
	add hl, de
	add hl, de
	ld d, [hl]
	inc hl
	ld e, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld [hl], d
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

.data_4a81
	;   x,  y
	db  0, -4
	db  0,  8
	db  6,  2
	db -6,  2

.MovementShakingGrass:
	call EndSpriteMovement
	call ._MovementShadow_Grass_Emote_BoulderDust
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_GRASS_SHAKE
	ld hl, OBJECT_STEP_DURATION
	add hl, de
	ld a, [hl]
	add -1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TRACKING_OBJECT
	ret

._MovementShadow_Grass_Emote_BoulderDust:
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	push bc
	call GetObjectStruct
	ld d, b
	ld e, c
	pop bc
	ld hl, OBJECT_1D
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ret

.MovementScreenShake:
	call EndSpriteMovement
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_00
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	call ._MovementScreenShake
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], e
	ld hl, OBJECT_1E
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_15
	ret

._MovementScreenShake:
	ld d, a
	and %00111111
	ld e, a
	ld a, d
	rlca
	rlca
	and %00000011
	ld d, a
	inc d
	ld a, 1
.loop
	dec d
	ret z
	add a
	jr .loop

.RandomWalkContinue:
	call InitStep
	call CanObjectMoveInDirection ; check whether the object can move in that direction
	jr c, .NewDuration
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP
	ld hl, wCenteredObject
	ldh a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_07
	ret

.load_6
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret

.NewDuration:
	call EndSpriteMovement
	call Function462a
RandomStepDuration_Slow:
	call Random
	ldh a, [hRandomAdd]
	and %01111111
	jr SetRandomStepDuration

RandomStepDuration_Fast:
	call Random
	ldh a, [hRandomAdd]
	and %00011111
SetRandomStepDuration:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	ret

StepTypesJumptable:
; entries correspond to STEP_TYPE_* constants
	dw ObjectMovementReset ; 00
	dw MapObjectMovementPattern ; 01
	dw NPCStep ; 02
	dw StepType03 ; 03
	dw StepType04 ; 04
	dw StepType05 ; 05
	dw PlayerStep ; 06
	dw StepType07 ; 07
	dw NPCJump ; 08
	dw PlayerJump ; 09
	dw PlayerOrNPCTurnStep ; 0a
	dw StepTypeBump ; 0b
	dw TeleportFrom ; 0c
	dw TeleportTo ; 0d
	dw Skyfall ; 0e
	dw StepType0f ; 0f
	dw GotBiteStep ; 10
	dw RockSmashStep ; 11
	dw ReturnDigStep ; 12
	dw StepTypeTrackingObject ; 13
	dw StepType14 ; 14
	dw StepType15 ; 15
	dw StepType16 ; 16
	dw StepType17 ; 17
	dw StepType18 ; 18
	dw SkyfallTop ; 19

WaitStep_InPlace:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

NPCJump:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Jump
	dw .Land

.Jump:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	call GetNextTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD_F, [hl]
	call IncrementObjectStructField1c
	ret

.Land:
	call AddStepVector
	call UpdateJumpPosition
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

PlayerJump:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .initjump
	dw .stepjump
	dw .initland
	dw .stepland

.initjump
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_START_F, [hl]
	call IncrementObjectStructField1c
.stepjump
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD_F, [hl]
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_STOP_F, [hl]
	set PLAYERSTEP_MIDAIR_F, [hl]
	call IncrementObjectStructField1c
	ret

.initland
	call GetNextTile
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_START_F, [hl]
	call IncrementObjectStructField1c
.stepland
	call UpdateJumpPosition
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_STOP_F, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

TeleportFrom:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .InitSpin
	dw .DoSpin
	dw .InitSpinRise
	dw .DoSpinRise

.InitSpin:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
.DoSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField1c
	ret

.InitSpinRise:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_1F
	add hl, bc
	ld [hl], $10
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OVERHEAD_F, [hl]
	call IncrementObjectStructField1c
.DoSpinRise:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	ld hl, OBJECT_1F
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

TeleportTo:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .InitWait
	dw .DoWait
	dw .InitDescent
	dw .DoDescent
	dw .InitFinalSpin
	dw .DoFinalSpin
	dw .FinishStep

.InitWait:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
	ret

.DoWait:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField1c
.InitDescent:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_1F
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
	ret

.DoDescent:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	ld hl, OBJECT_1F
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField1c
.InitFinalSpin:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
	ret

.DoFinalSpin:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SPIN
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
.FinishStep:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

Skyfall:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Init
	dw .Step
	dw .Fall
	dw .Finish

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_00
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
.Step:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_STEP
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_1F
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c
.Fall:
	ld hl, OBJECT_1F
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld d, $60
	call Sine
	ld a, h
	sub $60
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField1c
.Finish:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

GotBiteStep:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 8
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	call IncrementObjectStructField1c
.Run:
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	xor 1
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

RockSmashStep:
	call .Step
	jp WaitStep_InPlace

.Step:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, OBJECT_ACTION_STAND
	jr z, .yes
	ld a, OBJECT_ACTION_00
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	ret

ReturnDigStep:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and %00000001
	ld a, OBJECT_ACTION_SPIN
	jr z, .yes
	ld a, OBJECT_ACTION_SPIN_FLICKER
.yes
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], a
	jp WaitStep_InPlace

StepType03:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepType18:
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	jp DeleteMapObject

StepTypeBump:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepType05:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Reset
	dw StepType04

.Reset:
	call RestoreDefaultMovement
	call GetInitialFacing
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField1c
StepType04:
	call Stubbed_Function4fb2
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret

NPCStep:
	call Stubbed_Function4fb2
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepType07:
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call CopyNextCoordsTileToStandingCoordsTile
	jp RandomStepDuration_Slow

PlayerStep:
; AnimateStep?
	call Field1cAnonymousJumptable
; anonymous dw
	dw .init
	dw .step

.init
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_START_F, [hl]
	call IncrementObjectStructField1c
.step
	call UpdatePlayerStep
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, wPlayerStepFlags
	set PLAYERSTEP_STOP_F, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

PlayerOrNPCTurnStep:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .init1
	dw .step1
	dw .init2
	dw .step2

.init1
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	ld [hl], 2
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 2
	call IncrementObjectStructField1c
.step1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	call IncrementObjectStructField1c
.init2
	ld hl, OBJECT_1D ; new facing
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 2
	call IncrementObjectStructField1c
.step2
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepType0f:
	call AddStepVector
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld b, a
	farcall CopyDECoordsToMapObject
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_2, [hl]
	call CopyNextCoordsTileToStandingCoordsTile
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

StepTypeTrackingObject:
	ld hl, OBJECT_1D
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .nope
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret nz
.nope
	jp DeleteMapObject

StepType14:
StepType15:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	xor a
	ld hl, OBJECT_1D
	add hl, bc
	ld [hl], a
	call IncrementObjectStructField1c
.Run:
	ld hl, OBJECT_1D
	add hl, bc
	ld d, [hl]
	ld a, [wPlayerStepVectorY]
	sub d
	ld [wPlayerStepVectorY], a
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	jr z, .ok
	ld a, [hl]
	call .GetSign
	ld hl, OBJECT_1D
	add hl, bc
	ld [hl], a
	ld d, a
	ld a, [wPlayerStepVectorY]
	add d
	ld [wPlayerStepVectorY], a
	ret

.ok
	call DeleteMapObject
	ret

.GetSign:
	ld hl, OBJECT_1E
	add hl, bc
	and 1
	ld a, [hl]
	ret z
	cpl
	inc a
	ret

StepType16:
	call Field1cAnonymousJumptable ; ????
StepType17:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .null
	dw .null
	dw .null
.null

SkyfallTop:
	call Field1cAnonymousJumptable
; anonymous dw
	dw .Init
	dw .Run

.Init:
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], OBJECT_ACTION_SKYFALL
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], 16
	call IncrementObjectStructField1c

.Run:
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	dec [hl]
	ret nz
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], $60
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], 0
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret

Stubbed_Function4fb2:
	ret
	ld hl, OBJECT_1D
	add hl, bc
	inc [hl]
	ld a, [hl]
	srl a
	srl a
	and %00000111
	ld l, a
	ld h, 0
	ld de, .y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.y
	db 0, -1, -2, -3, -4, -3, -2, -1
UpdateJumpPosition:
	call GetStepVector
	ld a, h
	ld hl, OBJECT_1F
	add hl, bc
	ld e, [hl]
	add e
	ld [hl], a
	nop
	srl e
	ld d, 0
	ld hl, .y
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld [hl], a
	ret

.y
	db  -4,  -6,  -8, -10, -11, -12, -12, -12
	db -11, -10,  -9,  -8,  -6,  -4,   0,   0

Function5000: ; unscripted?
; copy [wPlayerNextMovement] to [wPlayerMovement]
	ld a, [wPlayerNextMovement]
	ld hl, wPlayerMovement
	ld [hl], a
; load [wPlayerNextMovement] with movement_step_sleep
	ld a, movement_step_sleep
	ld [wPlayerNextMovement], a
; recover the previous value of [wPlayerNextMovement]
	ld a, [hl]
	ret

GetMovementByte:
	ld hl, wMovementDataBank
	call _GetMovementByte
	ret

Function5015:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, wc2e2
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	ret

Function5026:
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld e, [hl]
	inc [hl]
	ld d, 0
	ld hl, wc2e6
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld a, [hl]
	ret

_GetMovementObject:
	ld hl, GetMovementObject
	jp HandleMovementData

GetMovementObject:
	ld a, [wMovementObject]
	ret

HandleMovementData:
	call .StorePointer
.loop
	xor a
	ld [wMovementByteWasControlSwitch], a
	call JumpMovementPointer
	call DoMovementFunction
	ld a, [wMovementByteWasControlSwitch]
	and a
	jr nz, .loop
	ret

.StorePointer:
	ld a, l
	ld [wMovementPointer], a
	ld a, h
	ld [wMovementPointer + 1], a
	ret

JumpMovementPointer:
	ld hl, wMovementPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

ContinueReadingMovement:
	ld a, 1
	ld [wMovementByteWasControlSwitch], a
	ret

DoMovementFunction:
	push af
	call ApplyMovementToFollower
	pop af
	ld hl, MovementPointers
	rst JumpTable
	ret

INCLUDE "engine/overworld/movement.asm"

ApplyMovementToFollower:
	ld e, a
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	ld a, [wObjectFollow_Leader]
	ld d, a
	ldh a, [hMapObjectIndexBuffer]
	cp d
	ret nz
	ld a, e
	cp movement_step_sleep
	ret z
	cp movement_step_end
	ret z
	cp movement_step_4b
	ret z
	cp movement_step_bump
	ret z
	cp movement_slow_step
	ret c
	push af
	ld hl, wFollowerMovementQueueLength
	inc [hl]
	ld e, [hl]
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	pop af
	ld [hl], a
	ret

GetFollowerNextMovementByte:
	ld hl, wFollowerMovementQueueLength
	ld a, [hl]
	and a
	jr z, .done
	cp -1
	jr z, .done
	dec [hl]
	ld e, a
	ld d, 0
	ld hl, wFollowMovementQueue
	add hl, de
	inc e
	ld a, -1
.loop
	ld d, [hl]
	ld [hld], a
	ld a, d
	dec e
	jr nz, .loop
	ret

.done
	call .CancelFollowIfLeaderMissing
	ret c
	ld a, movement_step_sleep
	ret

.CancelFollowIfLeaderMissing:
	ld a, [wObjectFollow_Leader]
	cp -1
	jr z, .nope
	push bc
	call GetObjectStruct
	ld hl, OBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	pop bc
	and a
	jr z, .nope
	and a
	ret

.nope
	ld a, -1
	ld [wObjectFollow_Follower], a
	ld a, movement_step_end
	scf
	ret

SpawnShadow:
	push bc
	ld de, .ShadowObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.ShadowObject:
	; vtile, palette, movement
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_SHADOW

SpawnStrengthBoulderDust:
	push bc
	ld de, .BoulderDustObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.BoulderDustObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_BOULDERDUST

SpawnEmote:
	push bc
	ld de, .EmoteObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.EmoteObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_EMOTE

ShakeGrass:
	push bc
	ld de, .GrassObject
	call CopyTempObjectData
	call InitTempObject
	pop bc
	ret

.GrassObject
	db $00, PAL_OW_TREE, SPRITEMOVEDATA_GRASS

ShakeScreen:
	push bc
	push af
	ld de, .ScreenShakeObject
	call CopyTempObjectData
	pop af
	ld [wTempObjectCopyRange], a
	call InitTempObject
	pop bc
	ret

.ScreenShakeObject:
	db $00, PAL_OW_SILVER, SPRITEMOVEDATA_SCREENSHAKE

DespawnEmote:
	push bc
	ldh a, [hMapObjectIndexBuffer]
	ld c, a
	call .DeleteEmote
	pop bc
	ret

.DeleteEmote:
	ld de, wObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	ld hl, OBJECT_FLAGS1
	add hl, de
	bit EMOTE_OBJECT_F, [hl]
	jr z, .next
	ld hl, OBJECT_SPRITE
	add hl, de
	ld a, [hl]
	and a
	jr z, .next
	push bc
	xor a
	ld bc, OBJECT_STRUCT_LENGTH
	call ByteFill
	pop bc
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, de
	ld d, h
	ld e, l
	pop af
	dec a
	jr nz, .loop
	ret

InitTempObject:
	call FindFirstEmptyObjectStruct
	ret nc
	ld d, h
	ld e, l
	farcall CopyTempObjectToObjectStruct
	ret

CopyTempObjectData:
; load into wTempObjectCopy:
; -1, -1, [de], [de + 1], [de + 2], [hMapObjectIndexBuffer], [NextMapX], [NextMapY], -1
; This spawns the object at the same place as whichever object is loaded into bc.
	ld hl, wTempObjectCopyMapObjectIndex
	ld [hl], -1
	inc hl
	ld [hl], -1
	inc hl
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ldh a, [hMapObjectIndexBuffer]
	ld [hli], a
	push hl
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop hl
	ld [hl], d
	inc hl
	ld [hl], e
	inc hl
	ld [hl], -1
	ret

Function55e0::
	ld a, [wVramState]
	bit 0, a
	ret z
	ld bc, wObjectStructs
	xor a
.loop
	ldh [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .ok
	call Function565c
.ok
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

Function5602:
; called at battle start
	call Function5645 ; clear sprites
	ld a, PLAYER
	call Function5629 ; respawn player
	ld a, [wBattleScriptFlags]
	bit 7, a
	jr z, .ok
	ldh a, [hLastTalked]
	and a
	jr z, .ok
	call Function5629 ; respawn opponent
.ok
	call _UpdateSprites
	ret

Function561d:
	call Function5645 ; clear sprites
	ld a, PLAYER
	call Function5629 ; respawn player
	call _UpdateSprites
	ret

Function5629:
	cp NUM_OBJECTS
	ret nc
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	ret z
	cp NUM_OBJECT_STRUCTS
	ret nc
	call GetObjectStruct
	call DoesObjectHaveASprite
	ret z
	call Function5673
	ret

Function5645:
	xor a
	ld bc, wObjectStructs
.loop
	ldh [hMapObjectIndexBuffer], a
	call SetFacing_Standing
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

Function565c:
	push bc
	call Function56cd
	pop bc
	jr c, SetFacing_Standing
	call Function56a3
	jr c, SetFacing_Standing
	call Function5688
	farcall Function4440
	xor a
	ret

Function5673:
	call Function56a3
	jr c, SetFacing_Standing
	farcall Function4440 ; no need to farcall
	xor a
	ret

SetFacing_Standing:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], STANDING
	scf
	ret

Function5688:
	push bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetCoordTile
	pop bc
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld [hl], a
	farcall UpdateTallGrassFlags ; no need to farcall
	ret

Function56a3:
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	inc d
	inc e
	ld a, [wXCoord]
	cp d
	jr z, .equal_x
	jr nc, .nope
	add MAPOBJECT_SCREEN_WIDTH - 1
	cp d
	jr c, .nope
.equal_x
	ld a, [wYCoord]
	cp e
	jr z, .equal_y
	jr nc, .nope
	add MAPOBJECT_SCREEN_HEIGHT - 1
	cp e
	jr c, .nope
.equal_y
	xor a
	ret

.nope
	scf
	ret

Function56cd:
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	add [hl]
	add d
	cp $f0
	jr nc, .ok1
	cp $a0
	jp nc, .nope
.ok1
	and %00000111
	ld d, 2
	cp 4
	jr c, .ok2
	ld d, 3
.ok2
	ld a, [hl]
	srl a
	srl a
	srl a
	cp SCREEN_WIDTH
	jr c, .ok3
	sub BG_MAP_WIDTH
.ok3
	ldh [hUsedSpriteIndex], a
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	add [hl]
	add e
	cp $f0
	jr nc, .ok4
	cp $90
	jr nc, .nope
.ok4
	and %00000111
	ld e, 2
	cp 4
	jr c, .ok5
	ld e, 3
.ok5
	ld a, [hl]
	srl a
	srl a
	srl a
	cp SCREEN_HEIGHT
	jr c, .ok6
	sub BG_MAP_HEIGHT
.ok6
	ldh [hUsedSpriteTile], a
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit BIG_OBJECT_F, [hl]
	jr z, .ok7
	ld a, d
	add 2
	ld d, a
	ld a, e
	add 2
	ld e, a
.ok7
	ld a, d
	ldh [hFFBF], a
.loop
	ldh a, [hFFBF]
	ld d, a
	ldh a, [hUsedSpriteTile]
	add e
	dec a
	cp SCREEN_HEIGHT
	jr nc, .ok9
	ld b, a
.next
	ldh a, [hUsedSpriteIndex]
	add d
	dec a
	cp SCREEN_WIDTH
	jr nc, .ok8
	ld c, a
	push bc
	call Coord2Tile
	pop bc
; NPCs disappear if standing on tile $60-$7f (or $e0-$ff),
; since those IDs are for text characters and textbox frames.
	ld a, [hl]
	cp FIRST_REGULAR_TEXT_CHAR
	jr nc, .nope
.ok8
	dec d
	jr nz, .next
.ok9
	dec e
	jr nz, .loop
	and a
	ret

.nope
	scf
	ret

HandleNPCStep::
	call .ResetStepVector
	call .DoStepsForAllObjects
	ret

.ResetStepVector:
	xor a
	ld [wPlayerStepVectorX], a
	ld [wPlayerStepVectorY], a
	ld [wPlayerStepFlags], a
	ld a, STANDING
	ld [wPlayerStepDirection], a
	ret

.DoStepsForAllObjects:
	ld bc, wObjectStructs
	xor a
.loop
	ldh [hMapObjectIndexBuffer], a
	call DoesObjectHaveASprite
	jr z, .next
	call Function437b
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ldh a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

RefreshPlayerSprite:
	ld a, movement_step_sleep
	ld [wPlayerNextMovement], a
	ld [wPlayerMovement], a
	xor a
	ld [wPlayerTurningDirection], a
	ld [wPlayerObjectStepFrame], a
	call .TryResetPlayerAction
	farcall CheckWarpFacingDown
	call c, SpawnInFacingDown
	call .SpawnInCustomFacing
	ret

.TryResetPlayerAction:
	ld hl, wPlayerSpriteSetupFlags
	bit PLAYERSPRITESETUP_RESET_ACTION_F, [hl]
	jr nz, .ok
	ret

.ok
	ld a, OBJECT_ACTION_00
	ld [wPlayerAction], a
	ret

.SpawnInCustomFacing:
	ld hl, wPlayerSpriteSetupFlags
	bit PLAYERSPRITESETUP_CUSTOM_FACING_F, [hl]
	ret z
	ld a, [wPlayerSpriteSetupFlags]
	and PLAYERSPRITESETUP_FACING_MASK
	add a
	add a
	jr ContinueSpawnFacing

SpawnInFacingDown:
	ld a, 0
ContinueSpawnFacing:
	ld bc, wPlayerStruct
	call SetSpriteDirection
	ret

_SetPlayerPalette:
	ld a, d
	and 1 << 7
	ret z
	ld bc, 0 ; debug?
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	or d
	ld [hl], a
	ld a, d
	swap a
	and PALETTE_MASK
	ld d, a
	ld bc, wPlayerStruct
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld a, [hl]
	and $ff ^ PALETTE_MASK
	or d
	ld [hl], a
	ret

StartFollow::
	push bc
	ld a, b
	call SetLeaderIfVisible
	pop bc
	ret c
	ld a, c
	call SetFollowerIfVisible
	farcall QueueFollowerFirstStep
	ret

SetLeaderIfVisible:
	call CheckObjectVisibility
	ret c
	ldh a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Leader], a
	ret

StopFollow::
	call ResetLeader
	call ResetFollower
	ret

ResetLeader:
	ld a, -1
	ld [wObjectFollow_Leader], a
	ret

SetFollowerIfVisible:
	push af
	call ResetFollower
	pop af
	call CheckObjectVisibility
	ret c
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], SPRITEMOVEDATA_FOLLOWING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ldh a, [hObjectStructIndexBuffer]
	ld [wObjectFollow_Follower], a
	ret

ResetFollower:
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	farcall Function58e3 ; no need to bankswitch
	ld a, -1
	ld [wObjectFollow_Follower], a
	ret

SetFlagsForMovement_1::
	ld a, c
	call CheckObjectVisibility
	ret c
	push bc
	call Function587a
	pop bc
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_5, [hl]
	xor a
	ret

Function586e:
	call CheckObjectVisibility
	ret c
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set OBJ_FLAGS2_5, [hl]
	xor a
	ret

Function587a:
	ld bc, wObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	set OBJ_FLAGS2_5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

_SetFlagsForMovement_2::
	ld a, [wObjectFollow_Leader]
	cp -1
	ret z
	push bc
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	pop bc
	cp c
	ret nz
	ld a, [wObjectFollow_Follower]
	cp -1
	ret z
	call GetObjectStruct
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_5, [hl]
	ret

Function58b9::
	push bc
	ld bc, wObjectStructs
	xor a
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .next
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_5, [hl]
.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	pop bc
	ret

Function58d8:
	call CheckObjectVisibility
	ret c
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res OBJ_FLAGS2_5, [hl]
	ret

Function58e3:
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	cp -1
	jp z, Function5903 ; a jr would have been appropriate here
	push bc
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	pop bc
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret

Function5903:
	call GetSpriteDirection
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .standing_movefns
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_00
	ret

.standing_movefns
	db SPRITEMOVEDATA_STANDING_DOWN
	db SPRITEMOVEDATA_STANDING_UP
	db SPRITEMOVEDATA_STANDING_LEFT
	db SPRITEMOVEDATA_STANDING_RIGHT

_UpdateSprites::
	ld a, [wVramState]
	bit 0, a
	ret z
	xor a
	ldh [hUsedSpriteIndex], a
	ldh a, [hOAMUpdate]
	push af
	ld a, 1
	ldh [hOAMUpdate], a
	call InitSprites
	call .fill
	pop af
	ldh [hOAMUpdate], a
	ret

.fill
	ld a, [wVramState]
	bit 1, a
	ld b, LOW(wVirtualOAMEnd)
	jr z, .ok
	ld b, 28 * SPRITEOAMSTRUCT_LENGTH
.ok
	ldh a, [hUsedSpriteIndex]
	cp b
	ret nc
	ld l, a
	ld h, HIGH(wVirtualOAM)
	ld de, SPRITEOAMSTRUCT_LENGTH
	ld a, b
	ld c, SCREEN_HEIGHT_PX + 2 * TILE_WIDTH
.loop
	ld [hl], c ; y
	add hl, de
	cp l
	jr nz, .loop
	ret

ApplyBGMapAnchorToObjects:
	push hl
	push de
	push bc
	ld a, [wPlayerBGMapOffsetX]
	ld d, a
	ld a, [wPlayerBGMapOffsetY]
	ld e, a
	ld bc, wObjectStructs
	ld a, NUM_OBJECT_STRUCTS
.loop
	push af
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	add d
	ld [hl], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	add e
	ld [hl], a
.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	dec a
	jr nz, .loop
	xor a
	ld [wPlayerBGMapOffsetX], a
	ld [wPlayerBGMapOffsetY], a
	pop bc
	pop de
	pop hl
	ret

PRIORITY_LOW  EQU $10
PRIORITY_NORM EQU $20
PRIORITY_HIGH EQU $30

InitSprites:
	call .DeterminePriorities
	ld c, PRIORITY_HIGH
	call .InitSpritesByPriority
	ld c, PRIORITY_NORM
	call .InitSpritesByPriority
	ld c, PRIORITY_LOW
	call .InitSpritesByPriority
	ret

.DeterminePriorities:
	xor a
	ld hl, wMovementPointer
	ld bc, NUM_OBJECT_STRUCTS
	call ByteFill
	ld d, 0
	ld bc, wObjectStructs
	ld hl, wMovementPointer
.loop
	push hl
	call DoesObjectHaveASprite
	jr z, .skip
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .skip
; Define the sprite priority.
	ld e, PRIORITY_LOW
	ld hl, OBJECT_FLAGS2
	add hl, bc
	bit LOW_PRIORITY_F, [hl]
	jr nz, .add
	ld e, PRIORITY_NORM
	bit HIGH_PRIORITY_F, [hl]
	jr z, .add
	ld e, PRIORITY_HIGH
	jr .add

.skip
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .next

.add
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ld a, d
	or e
	ld [hli], a
.next
	inc d
	ld a, d
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	ret

.InitSpritesByPriority:
	ld hl, wMovementPointer
.next_sprite
	ld a, [hli]
	ld d, a
	and $f0
	ret z
	cp c
	jr nz, .next_sprite
	push bc
	push hl
	ld a, d
	and $f
	call .GetObjectStructPointer
	call .InitSprite
	pop hl
	pop bc
	jr .next_sprite

.InitSprite:
	ld hl, OBJECT_SPRITE_TILE
	add hl, bc
	ld a, [hl]
	and $ff ^ (1 << 7)
	ldh [hFFC1], a
	xor a
	bit 7, [hl]
	jr nz, .skip1
	or VRAM_BANK_1
.skip1
	ld hl, OBJECT_FLAGS2
	add hl, bc
	ld e, [hl]
	bit OBJ_FLAGS2_7, e
	jr z, .skip2
	or PRIORITY
.skip2
	bit USE_OBP1_F, e
	jr z, .skip3
	or OBP_NUM
.skip3
	ld hl, OBJECT_PALETTE
	add hl, bc
	ld d, a
	ld a, [hl]
	and PALETTE_MASK
	or d
	ld d, a
	xor a
	bit OVERHEAD_F, e
	jr z, .skip4
	or PRIORITY
.skip4
	ldh [hFFC2], a
	ld hl, OBJECT_SPRITE_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_X_OFFSET
	add hl, bc
	add [hl]
	add 8
	ld e, a
	ld a, [wPlayerBGMapOffsetX]
	add e
	ldh [hFFBF], a
	ld hl, OBJECT_SPRITE_Y
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_SPRITE_Y_OFFSET
	add hl, bc
	add [hl]
	add 12
	ld e, a
	ld a, [wPlayerBGMapOffsetY]
	add e
	ldh [hFFC0], a
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	cp STANDING
	jp z, .done
	cp NUM_FACINGS
	jp nc, .done
	ld l, a
	ld h, 0
	add hl, hl
	ld bc, Facings
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ldh a, [hUsedSpriteIndex]
	ld c, a
	ld b, HIGH(wVirtualOAM)
	ld a, [hli]
	ldh [hUsedSpriteTile], a
	add c
	cp LOW(wVirtualOAMEnd)
	jr nc, .full
.addsprite
	ldh a, [hFFC0]
	add [hl]
	inc hl
	ld [bc], a ; y
	inc c
	ldh a, [hFFBF]
	add [hl]
	inc hl
	ld [bc], a ; x
	inc c
	ld e, [hl]
	inc hl
	ldh a, [hFFC1]
	bit ABSOLUTE_TILE_ID_F, e
	jr z, .nope1
	xor a
.nope1
	add [hl]
	inc hl
	ld [bc], a ; tile id
	inc c
	ld a, e
	bit RELATIVE_ATTRIBUTES_F, a
	jr z, .nope2
	ldh a, [hFFC2]
	or e
.nope2
	and OBP_NUM | X_FLIP | Y_FLIP | PRIORITY
	or d
	ld [bc], a ; attributes
	inc c
	ldh a, [hUsedSpriteTile]
	dec a
	ldh [hUsedSpriteTile], a
	jr nz, .addsprite
	ld a, c
	ldh [hUsedSpriteIndex], a
.done
	xor a
	ret

.full
	scf
	ret

.GetObjectStructPointer:
	ld c, a
	ld b, 0
	ld hl, .Addresses
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

.Addresses:
	dw wPlayerStruct
	dw wObject1Struct
	dw wObject2Struct
	dw wObject3Struct
	dw wObject4Struct
	dw wObject5Struct
	dw wObject6Struct
	dw wObject7Struct
	dw wObject8Struct
	dw wObject9Struct
	dw wObject10Struct
	dw wObject11Struct
	dw wObject12Struct
