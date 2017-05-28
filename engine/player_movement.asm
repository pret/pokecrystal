DoPlayerMovement:: ; 80000

	call .GetDPad
	ld a, movement_step_sleep
	ld [MovementAnimation], a
	xor a
	ld [wd041], a
	call .TranslateIntoMovement
	ld c, a
	ld a, [MovementAnimation]
	ld [wPlayerNextMovement], a
	ret

.GetDPad:

	ld a, [hJoyDown]
	ld [CurInput], a

; Standing downhill instead moves down.

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	ret z

	ld c, a
	and D_PAD
	ret nz

	ld a, c
	or D_DOWN
	ld [CurInput], a
	ret
; 8002d

.TranslateIntoMovement:
	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_SLIP
	jr z, .Ice

.Normal:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	jr .NotMoving

.Surf:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TrySurf
	ret c
	jr .NotMoving

.Ice:
	call .CheckForced
	call .GetAction
	call .CheckTile
	ret c
	call .CheckTurning
	ret c
	call .TryStep
	ret c
	call .TryJump
	ret c
	call .CheckWarp
	ret c
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .HitWall
	call .BumpSound
.HitWall:
	call .StandInPlace
	xor a
	ret

.NotMoving:
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [EngineBuffer4]
	and a
	jr nz, .CantMove
	call .BumpSound
.CantMove:
	call ._WalkInPlace
	xor a
	ret

.Standing:
	call .StandInPlace
	xor a
	ret
; 800b7

.CheckTile: ; 800b7
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [PlayerStandingTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .not_whirlpool
	ld a, 3
	scf
	ret

.not_whirlpool
	and $f0
	cp $30 ; moving water
	jr z, .water
	cp $40 ; moving land 1
	jr z, .land1
	cp $50 ; moving land 2
	jr z, .land2
	cp $70 ; warps
	jr z, .warps
	jr .no_walk

.water
	ld a, c
	and 3
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [WalkingDirection], a
	jr .continue_walk

.water_table
	db RIGHT
	db LEFT
	db UP
	db DOWN

.land1
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [WalkingDirection], a
	jr .continue_walk

.land1_table
	db STANDING
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING

.land2
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .no_walk
	ld [WalkingDirection], a
	jr .continue_walk

.land2_table
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING
	db STANDING

.warps
	ld a, c
	cp $71 ; door
	jr z, .down
	cp $79
	jr z, .down
	cp $7a ; stairs
	jr z, .down
	cp $7b ; cave
	jr nz, .no_walk

.down
	ld a, DOWN
	ld [WalkingDirection], a
	jr .continue_walk

.no_walk
	xor a
	ret

.continue_walk
	ld a, STEP_WALK
	call .DoStep
	ld a, 5
	scf
	ret
; 80147

.CheckTurning: ; 80147
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wPlayerTurningDirection]
	cp 0
	jr nz, .not_turning
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .not_turning

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr z, .not_turning

	ld a, STEP_TURN
	call .DoStep
	ld a, 2
	scf
	ret

.not_turning
	xor a
	ret
; 8016b

.TryStep: ; 8016b

; Surfing actually calls .TrySurf directly instead of passing through here.
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .TrySurf
	cp PLAYER_SURF_PIKA
	jr z, .TrySurf

	call .CheckLandPerms
	jr c, .bump

	call .CheckNPC
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [PlayerStandingTile]
	call CheckIceTile
	jr nc, .ice

; Downhill riding is slower when not moving down.
	call .BikeCheck
	jr nz, .walk

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	jr z, .fast

	ld a, [WalkingDirection]
	cp DOWN
	jr z, .fast

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.fast
	ld a, STEP_BIKE
	call .DoStep
	scf
	ret

.walk
	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ice
	ld a, STEP_ICE
	call .DoStep
	scf
	ret

; unused?
	xor a
	ret

.bump
	xor a
	ret
; 801c0

.TrySurf: ; 801c0

	call .CheckSurfPerms
	ld [wd040], a
	jr c, .surf_bump

	call .CheckNPC
	ld [wd03f], a
	and a
	jr z, .surf_bump
	cp 2
	jr z, .surf_bump

	ld a, [wd040]
	and a
	jr nz, .ExitWater

	ld a, STEP_WALK
	call .DoStep
	scf
	ret

.ExitWater:
	call .GetOutOfWater
	call PlayMapMusic
	ld a, STEP_WALK
	call .DoStep
	ld a, 6
	scf
	ret

.surf_bump
	xor a
	ret
; 801f3

.TryJump: ; 801f3
	ld a, [PlayerStandingTile]
	ld e, a
	and $f0
	cp $a0 ; ledge
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_8021e
	add hl, de
	ld a, [FacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, 7
	scf
	ret

.DontJump:
	xor a
	ret

.data_8021e
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT
; 80226

.CheckWarp: ; 80226

; Bug: Since no case is made for STANDING here, it will check
; [.edgewarps + $ff]. This resolves to $3e at $8035a.
; This causes wd041 to be nonzero when standing on tile $3e,
; making bumps silent.

	ld a, [WalkingDirection]
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [PlayerStandingTile]
	cp [hl]
	jr nz, .not_warp

	ld a, 1
	ld [wd041], a
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .not_warp

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr nz, .not_warp
	call WarpCheck
	jr nc, .not_warp

	call .StandInPlace
	scf
	ld a, 1
	ret

.not_warp
	xor a
	ret

.EdgeWarps:
	db $70, $78, $76, $7e
; 8025f

.DoStep:
	ld e, a
	ld d, 0
	ld hl, .Steps
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [WalkingDirection]
	ld e, a
	cp STANDING
	jp z, .StandInPlace

	add hl, de
	ld a, [hl]
	ld [MovementAnimation], a

	ld hl, .FinishFacing
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a

	ld a, 4
	ret

.Steps:
	dw .SlowStep
	dw .NormalStep
	dw .FastStep
	dw .JumpStep
	dw .SlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .FinishFacing

.SlowStep:
	slow_step DOWN
	slow_step UP
	slow_step LEFT
	slow_step RIGHT
.NormalStep:
	step DOWN
	step UP
	step LEFT
	step RIGHT
.FastStep:
	big_step DOWN
	big_step UP
	big_step LEFT
	big_step RIGHT
.JumpStep:
	jump_step DOWN
	jump_step UP
	jump_step LEFT
	jump_step RIGHT
.SlideStep:
	fast_slide_step DOWN
	fast_slide_step UP
	fast_slide_step LEFT
	fast_slide_step RIGHT
.BackJumpStep:
	jump_step UP
	jump_step DOWN
	jump_step RIGHT
	jump_step LEFT
.TurningStep:
	turn_step DOWN
	turn_step UP
	turn_step LEFT
	turn_step RIGHT
.FinishFacing:
	db $80 + DOWN
	db $80 + UP
	db $80 + LEFT
	db $80 + RIGHT
; 802b3

.StandInPlace: ; 802b3
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_sleep
	ld [MovementAnimation], a
	xor a
	ret
; 802bf

._WalkInPlace: ; 802bf
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_bump
	ld [MovementAnimation], a
	xor a
	ret
; 802cb

.CheckForced: ; 802cb
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wPlayerTurningDirection]
	cp 0
	ret z

	and 3
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [CurInput]
	and BUTTONS
	or [hl]
	ld [CurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT
; 802ec

.GetAction: ; 802ec
; Poll player input and update movement info.

	ld hl, .table
	ld de, .table2 - .table1
	ld a, [CurInput]
	bit D_DOWN_F, a
	jr nz, .d_down
	bit D_UP_F, a
	jr nz, .d_up
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_RIGHT_F, a
	jr nz, .d_right
; Standing
	jr .update

.d_down 	add hl, de
.d_up   	add hl, de
.d_left 	add hl, de
.d_right	add hl, de

.update
	ld a, [hli]
	ld [WalkingDirection], a
	ld a, [hli]
	ld [FacingDirection], a
	ld a, [hli]
	ld [WalkingX], a
	ld a, [hli]
	ld [WalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [WalkingTile], a
	ret

.table
; struct:
;	walk direction
;	facing
;	x movement
;	y movement
;	tile collision pointer
.table1
	db STANDING, FACE_CURRENT, 0, 0
	dw PlayerStandingTile
.table2
	db RIGHT, FACE_RIGHT,  1,  0
	dw TileRight
	db LEFT,  FACE_LEFT,  -1,  0
	dw TileLeft
	db UP,    FACE_UP,     0, -1
	dw TileUp
	db DOWN,  FACE_DOWN,   0,  1
	dw TileDown
; 80341

.CheckNPC: ; 80341
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front
	ld a, 0
	ld [hMapObjectIndexBuffer], a
; Load the next X coordinate into d
	ld a, [PlayerStandingMapX]
	ld d, a
	ld a, [WalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [PlayerStandingMapY]
	ld e, a
	ld a, [WalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, ObjectStructs ; redundant
	callba IsNPCAtCoord
	jr nc, .is_npc
	call .CheckStrengthBoulder
	jr c, .no_bump

	xor a
	ret

.is_npc
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret
; 8036f

.CheckStrengthBoulder: ; 8036f

	ld hl, BikeFlags
	bit 0, [hl] ; using strength
	jr z, .not_boulder

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .not_boulder

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 6, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [WalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and $fc
	or d
	ld [hl], a

	scf
	ret

.not_boulder
	xor a
	ret
; 8039e

.CheckLandPerms: ; 8039e
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [WalkingTile]
	call .CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable:
	scf
	ret
; 803b4

.CheckSurfPerms: ; 803b4
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [WalkingTile]
	call .CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable:
	scf
	ret
; 803ca

.BikeCheck: ; 803ca

	ld a, [PlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SLIP
	ret
; 803d3

.CheckWalkable: ; 803d3
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; land
	ret z
	scf
	ret
; 803da

.CheckSurfable: ; 803da
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp 1
	jr z, .Water

; Can walk back onto land from water.
	and a
	jr z, .Land

	jr .Neither

.Water:
	xor a
	ret

.Land:
	ld a, 1
	and a
	ret

.Neither:
	scf
	ret
; 803ee

.BumpSound: ; 803ee

	call CheckSFX
	ret c
	ld de, SFX_BUMP
	call PlaySFX
	ret
; 803f9

.GetOutOfWater: ; 803f9
	push bc
	ld a, PLAYER_NORMAL
	ld [PlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ret
; 80404

CheckStandingOnIce:: ; 80404
	ld a, [wPlayerTurningDirection]
	cp 0
	jr z, .not_ice
	cp $f0
	jr z, .not_ice
	ld a, [PlayerStandingTile]
	call CheckIceTile
	jr nc, .yep
	ld a, [PlayerState]
	cp PLAYER_SLIP
	jr nz, .not_ice

.yep
	scf
	ret

.not_ice
	and a
	ret
; 80422

StopPlayerForEvent:: ; 80422
	ld hl, wPlayerNextMovement
	ld a, movement_step_sleep
	cp [hl]
	ret z

	ld [hl], a
	ld a, 0
	ld [wPlayerTurningDirection], a
	ret
; 80430
