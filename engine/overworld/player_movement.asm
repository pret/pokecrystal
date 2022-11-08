DoPlayerMovement::
	call .GetDPad
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ld [wWalkingIntoEdgeWarp], a
	call .TranslateIntoMovement
	ld c, a
	ld a, [wMovementAnimation]
	ld [wPlayerNextMovement], a
	ret

.GetDPad:
	ldh a, [hJoyDown]
	ld [wCurInput], a

; Standing downhill instead moves down.

	ld hl, wBikeFlags
	bit BIKEFLAGS_DOWNHILL_F, [hl]
	ret z

	ld c, a
	and D_PAD
	ret nz

	ld a, c
	or D_DOWN
	ld [wCurInput], a
	ret

.TranslateIntoMovement:
	ld a, [wPlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_SKATE
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
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .HitWall
	call .BumpSound
.HitWall:
	call .StandInPlace
	xor a
	ret

.NotMoving:
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [wWalkingIntoEdgeWarp]
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

.CheckTile:
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [wPlayerTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .not_whirlpool
	ld a, PLAYERMOVEMENT_FORCE_TURN
	scf
	ret

.not_whirlpool
	and $f0
	cp HI_NYBBLE_CURRENT
	jr z, .water
	cp HI_NYBBLE_WALK
	jr z, .land1
	cp HI_NYBBLE_WALK_ALT
	jr z, .land2
	cp HI_NYBBLE_WARPS
	jr z, .warps
	jr .no_walk

.water
	ld a, c
	maskbits NUM_DIRECTIONS
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [wWalkingDirection], a
	jr .continue_walk

.water_table
	db RIGHT ; COLL_WATERFALL_RIGHT
	db LEFT  ; COLL_WATERFALL_LEFT
	db UP    ; COLL_WATERFALL_UP
	db DOWN  ; COLL_WATERFALL

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
	ld [wWalkingDirection], a
	jr .continue_walk

.land1_table
	db STANDING ; COLL_BRAKE
	db RIGHT    ; COLL_WALK_RIGHT
	db LEFT     ; COLL_WALK_LEFT
	db UP       ; COLL_WALK_UP
	db DOWN     ; COLL_WALK_DOWN
	db STANDING ; COLL_BRAKE_45
	db STANDING ; COLL_BRAKE_46
	db STANDING ; COLL_BRAKE_47

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
	ld [wWalkingDirection], a
	jr .continue_walk

.land2_table
	db RIGHT    ; COLL_WALK_RIGHT_ALT
	db LEFT     ; COLL_WALK_LEFT_ALT
	db UP       ; COLL_WALK_UP_ALT
	db DOWN     ; COLL_WALK_DOWN_ALT
	db STANDING ; COLL_BRAKE_ALT
	db STANDING ; COLL_BRAKE_55
	db STANDING ; COLL_BRAKE_56
	db STANDING ; COLL_BRAKE_57

.warps
	ld a, c
	cp COLL_DOOR
	jr z, .down
	cp COLL_DOOR_79
	jr z, .down
	cp COLL_STAIRCASE
	jr z, .down
	cp COLL_CAVE
	jr nz, .no_walk

.down
	ld a, DOWN
	ld [wWalkingDirection], a
	jr .continue_walk

.no_walk
	xor a
	ret

.continue_walk
	ld a, STEP_WALK
	call .DoStep
	ld a, PLAYERMOVEMENT_CONTINUE
	scf
	ret

.CheckTurning:
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wPlayerTurningDirection]
	cp 0
	jr nz, .not_turning
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_turning

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr z, .not_turning

	ld a, STEP_TURN
	call .DoStep
	ld a, PLAYERMOVEMENT_TURN
	scf
	ret

.not_turning
	xor a
	ret

.TryStep:
; Surfing actually calls .TrySurf directly instead of passing through here.
	ld a, [wPlayerState]
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

	ld a, [wPlayerTile]
	call CheckIceTile
	jr nc, .ice

; Downhill riding is slower when not moving down.
	call .BikeCheck
	jr nz, .walk

	ld hl, wBikeFlags
	bit BIKEFLAGS_DOWNHILL_F, [hl]
	jr z, .fast

	ld a, [wWalkingDirection]
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

.unused ; unreferenced
	xor a
	ret

.bump
	xor a
	ret

.TrySurf:
	call .CheckSurfPerms
	ld [wWalkingIntoLand], a
	jr c, .surf_bump

	call .CheckNPC
	ld [wWalkingIntoNPC], a
	and a
	jr z, .surf_bump
	cp 2
	jr z, .surf_bump

	ld a, [wWalkingIntoLand]
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
	ld a, PLAYERMOVEMENT_EXIT_WATER
	scf
	ret

.surf_bump
	xor a
	ret

.TryJump:
	ld a, [wPlayerTile]
	ld e, a
	and $f0
	cp HI_NYBBLE_LEDGES
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .ledge_table
	add hl, de
	ld a, [wFacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call .DoStep
	ld a, PLAYERMOVEMENT_JUMP
	scf
	ret

.DontJump:
	xor a
	ret

.ledge_table
	db FACE_RIGHT             ; COLL_HOP_RIGHT
	db FACE_LEFT              ; COLL_HOP_LEFT
	db FACE_UP                ; COLL_HOP_UP
	db FACE_DOWN              ; COLL_HOP_DOWN
	db FACE_RIGHT | FACE_DOWN ; COLL_HOP_DOWN_RIGHT
	db FACE_DOWN | FACE_LEFT  ; COLL_HOP_DOWN_LEFT
	db FACE_UP | FACE_RIGHT   ; COLL_HOP_UP_RIGHT
	db FACE_UP | FACE_LEFT    ; COLL_HOP_UP_LEFT

.CheckWarp:
; BUG: No bump noise if standing on tile $3E (see docs/bugs_and_glitches.md)

	ld a, [wWalkingDirection]
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [wPlayerTile]
	cp [hl]
	jr nz, .not_warp

	ld a, TRUE
	ld [wWalkingIntoEdgeWarp], a
	ld a, [wWalkingDirection]
	cp STANDING
	jr z, .not_warp

	ld e, a
	ld a, [wPlayerDirection]
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	cp e
	jr nz, .not_warp
	call WarpCheck
	jr nc, .not_warp

	call .StandInPlace
	scf
	ld a, PLAYERMOVEMENT_WARP
	ret

.not_warp
	xor a ; PLAYERMOVEMENT_NORMAL
	ret

.EdgeWarps:
	db COLL_WARP_CARPET_DOWN
	db COLL_WARP_CARPET_UP
	db COLL_WARP_CARPET_LEFT
	db COLL_WARP_CARPET_RIGHT

.DoStep:
	ld e, a
	ld d, 0
	ld hl, .Steps
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [wWalkingDirection]
	ld e, a
	cp STANDING
	jp z, .StandInPlace

	add hl, de
	ld a, [hl]
	ld [wMovementAnimation], a

	ld hl, .FinishFacing
	add hl, de
	ld a, [hl]
	ld [wPlayerTurningDirection], a

	ld a, PLAYERMOVEMENT_FINISH
	ret

.Steps:
; entries correspond to STEP_* constants (see constants/map_object_constants.asm)
	table_width 2, DoPlayerMovement.Steps
	dw .SlowStep
	dw .NormalStep
	dw .FastStep
	dw .JumpStep
	dw .SlideStep
	dw .TurningStep
	dw .BackJumpStep
	dw .FinishFacing
	assert_table_length NUM_STEPS

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
	db $80 | DOWN
	db $80 | UP
	db $80 | LEFT
	db $80 | RIGHT

.StandInPlace:
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_sleep
	ld [wMovementAnimation], a
	xor a
	ret

._WalkInPlace:
	ld a, 0
	ld [wPlayerTurningDirection], a
	ld a, movement_step_bump
	ld [wMovementAnimation], a
	xor a
	ret

.CheckForced:
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wPlayerTurningDirection]
	cp 0
	ret z

	maskbits NUM_DIRECTIONS
	ld e, a
	ld d, 0
	ld hl, .forced_dpad
	add hl, de
	ld a, [wCurInput]
	and BUTTONS
	or [hl]
	ld [wCurInput], a
	ret

.forced_dpad
	db D_DOWN, D_UP, D_LEFT, D_RIGHT

.GetAction:
; Poll player input and update movement info.

	ld hl, .action_table
	ld de, .action_table_1_end - .action_table_1
	ld a, [wCurInput]
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

.d_down
	add hl, de
.d_up
	add hl, de
.d_left
	add hl, de
.d_right
	add hl, de
.update
	ld a, [hli]
	ld [wWalkingDirection], a
	ld a, [hli]
	ld [wFacingDirection], a
	ld a, [hli]
	ld [wWalkingX], a
	ld a, [hli]
	ld [wWalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [wWalkingTile], a
	ret

MACRO player_action
; walk direction, facing, x movement, y movement, tile collision pointer
	db \1, \2, \3, \4
	dw \5
ENDM

.action_table:
.action_table_1
	player_action STANDING, FACE_CURRENT, 0,  0, wPlayerTile
.action_table_1_end
	player_action RIGHT,    FACE_RIGHT,   1,  0, wTileRight
	player_action LEFT,     FACE_LEFT,   -1,  0, wTileLeft
	player_action UP,       FACE_UP,      0, -1, wTileUp
	player_action DOWN,     FACE_DOWN,    0,  1, wTileDown

.CheckNPC:
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front. The game actually treats
; this the same as an NPC in front (bump).
	ld a, 0
	ldh [hMapObjectIndex], a
; Load the next X coordinate into d
	ld a, [wPlayerMapX]
	ld d, a
	ld a, [wWalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [wPlayerMapY]
	ld e, a
	ld a, [wWalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, wObjectStructs ; redundant
	farcall IsNPCAtCoord
	jr nc, .no_npc
	call .CheckStrengthBoulder
	jr c, .no_bump

	xor a ; bump
	ret

.no_npc
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret

.CheckStrengthBoulder:
	ld hl, wBikeFlags
	bit BIKEFLAGS_STRENGTH_ACTIVE_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .not_boulder

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit STRENGTH_BOULDER_F, [hl]
	jr z, .not_boulder

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [wWalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and %11111100
	or d
	ld [hl], a

	scf
	ret

.not_boulder
	xor a
	ret

.CheckLandPerms:
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [wWalkingTile]
	call .CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable:
	scf
	ret

.CheckSurfPerms:
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [wTilePermissions]
	ld d, a
	ld a, [wFacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [wWalkingTile]
	call .CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable:
	scf
	ret

.BikeCheck:
	ld a, [wPlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SKATE
	ret

.CheckWalkable:
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; LAND_TILE
	ret z
	scf
	ret

.CheckSurfable:
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp WATER_TILE
	jr z, .Water

; Can walk back onto land from water.
	and a ; LAND_TILE
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

.BumpSound:
	call CheckSFX
	ret c
	ld de, SFX_BUMP
	call PlaySFX
	ret

.GetOutOfWater:
	push bc
	ld a, PLAYER_NORMAL
	ld [wPlayerState], a
	call UpdatePlayerSprite ; UpdateSprites
	pop bc
	ret

CheckStandingOnIce::
	ld a, [wPlayerTurningDirection]
	cp 0
	jr z, .not_ice
	cp $f0
	jr z, .not_ice
	ld a, [wPlayerTile]
	call CheckIceTile
	jr nc, .yep
	ld a, [wPlayerState]
	cp PLAYER_SKATE
	jr nz, .not_ice

.yep
	scf
	ret

.not_ice
	and a
	ret

StopPlayerForEvent::
	ld hl, wPlayerNextMovement
	ld a, movement_step_sleep
	cp [hl]
	ret z

	ld [hl], a
	ld a, 0
	ld [wPlayerTurningDirection], a
	ret
