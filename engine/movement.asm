MovementPointers: ; 5075
	dw Movement_turn_head_down        ; 00
	dw Movement_turn_head_up          ; 01
	dw Movement_turn_head_left        ; 02
	dw Movement_turn_head_right       ; 03
	dw Movement_turn_step_down        ; 04
	dw Movement_turn_step_up          ; 05
	dw Movement_turn_step_left        ; 06
	dw Movement_turn_step_right       ; 07
	dw Movement_slow_step_down        ; 08
	dw Movement_slow_step_up          ; 09
	dw Movement_slow_step_left        ; 0a
	dw Movement_slow_step_right       ; 0b
	dw Movement_step_down             ; 0c
	dw Movement_step_up               ; 0d
	dw Movement_step_left             ; 0e
	dw Movement_step_right            ; 0f
	dw Movement_big_step_down         ; 10
	dw Movement_big_step_up           ; 11
	dw Movement_big_step_left         ; 12
	dw Movement_big_step_right        ; 13
	dw Movement_slow_slide_step_down  ; 14
	dw Movement_slow_slide_step_up    ; 15
	dw Movement_slow_slide_step_left  ; 16
	dw Movement_slow_slide_step_right ; 17
	dw Movement_slide_step_down       ; 18
	dw Movement_slide_step_up         ; 19
	dw Movement_slide_step_left       ; 1a
	dw Movement_slide_step_right      ; 1b
	dw Movement_fast_slide_step_down  ; 1c
	dw Movement_fast_slide_step_up    ; 1d
	dw Movement_fast_slide_step_left  ; 1e
	dw Movement_fast_slide_step_right ; 1f
	dw Movement_turn_away_down        ; 20
	dw Movement_turn_away_up          ; 21
	dw Movement_turn_away_left        ; 22
	dw Movement_turn_away_right       ; 23
	dw Movement_turn_in_down          ; 24
	dw Movement_turn_in_up            ; 25
	dw Movement_turn_in_left          ; 26
	dw Movement_turn_in_right         ; 27
	dw Movement_turn_waterfall_down   ; 28
	dw Movement_turn_waterfall_up     ; 29
	dw Movement_turn_waterfall_left   ; 2a
	dw Movement_turn_waterfall_right  ; 2b
	dw Movement_slow_jump_step_down   ; 2c
	dw Movement_slow_jump_step_up     ; 2d
	dw Movement_slow_jump_step_left   ; 2e
	dw Movement_slow_jump_step_right  ; 2f
	dw Movement_jump_step_down        ; 30
	dw Movement_jump_step_up          ; 31
	dw Movement_jump_step_left        ; 32
	dw Movement_jump_step_right       ; 33
	dw Movement_fast_jump_step_down   ; 34
	dw Movement_fast_jump_step_up     ; 35
	dw Movement_fast_jump_step_left   ; 36
	dw Movement_fast_jump_step_right  ; 37
	dw Movement_remove_sliding        ; 38
	dw Movement_set_sliding           ; 39
	dw Movement_remove_fixed_facing   ; 3a
	dw Movement_fix_facing            ; 3b
	dw Movement_show_person           ; 3c
	dw Movement_hide_person           ; 3d
	dw Movement_step_sleep_1          ; 3e
	dw Movement_step_sleep_2          ; 3f
	dw Movement_step_sleep_3          ; 40
	dw Movement_step_sleep_4          ; 41
	dw Movement_step_sleep_5          ; 42
	dw Movement_step_sleep_6          ; 43
	dw Movement_step_sleep_7          ; 44
	dw Movement_step_sleep_8          ; 45
	dw Movement_step_sleep            ; 46
	dw Movement_step_end              ; 47
	dw Movement_48                    ; 48
	dw Movement_remove_person         ; 49
	dw Movement_step_loop             ; 4a
	dw Movement_4b                    ; 4b
	dw Movement_teleport_from         ; 4c
	dw Movement_teleport_to           ; 4d
	dw Movement_skyfall               ; 4e
	dw Movement_step_dig              ; 4f
	dw Movement_step_bump             ; 50
	dw Movement_fish_got_bite         ; 51
	dw Movement_fish_cast_rod         ; 52
	dw Movement_hide_emote            ; 53
	dw Movement_show_emote            ; 54
	dw Movement_step_shake            ; 55
	dw Movement_tree_shake            ; 56
	dw Movement_rock_smash            ; 57
	dw Movement_return_dig            ; 58
	dw Movement_skyfall_top           ; 59
; 5129


Movement_teleport_from: ; 5129
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TELEPORT_FROM
	ret
; 5130

Movement_teleport_to: ; 5130
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_TELEPORT_TO
	ret
; 5137

Movement_skyfall: ; 5137
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SKYFALL
	ret
; 513e

Movement_skyfall_top: ; 513e
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SKYFALL_TOP
	ret
; 5145

Movement_step_dig: ; 5145
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 516a

Movement_return_dig: ; 516a
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld [hl], a
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_RETURN_DIG
	ret
; 5189

Movement_fish_got_bite: ; 5189
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_FISHING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_GOT_BITE
	ret
; 5196

Movement_rock_smash: ; 5196
	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_ROCK_SMASH
	ret
; 51ab

Movement_fish_cast_rod: ; 51ab
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_FISHING
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 51b8

Movement_step_loop: ; 51b8
	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], $0
	jp ContinueReadingMovement
; 51c1

Movement_step_end: ; 51c1
	call RestoreDefaultMovement
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], $0

	ld hl, VramState
	res 7, [hl]

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_SLEEP
	ret
; 51db

Movement_48: ; 51db
	call RestoreDefaultMovement
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_MOVEMENT_BYTE_INDEX
	add hl, bc
	ld [hl], $0

	call JumpMovementPointer
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, VramState
	res 7, [hl]
	ret
; 51fd

Movement_remove_person: ; 51fd
	call DeleteMapObject
	ld hl, wObjectFollow_Leader
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr nz, .not_leading
	ld [hl], -1

.not_leading
	ld hl, VramState
	res 7, [hl]
	ret
; 5210

Movement_4b: ; 5210
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_04

	ld hl, VramState
	res 7, [hl]
	ret
; 5222

Movement_step_sleep_1: ; 5222
	ld a, 1
	jr Movement_step_sleep_common

Movement_step_sleep_2: ; 5226
	ld a, 2
	jr Movement_step_sleep_common

Movement_step_sleep_3: ; 522a
	ld a, 3
	jr Movement_step_sleep_common

Movement_step_sleep_4: ; 522e
	ld a, 4
	jr Movement_step_sleep_common

Movement_step_sleep_5: ; 5232
	ld a, 5
	jr Movement_step_sleep_common

Movement_step_sleep_6: ; 5236
	ld a, 6
	jr Movement_step_sleep_common

Movement_step_sleep_7: ; 523a
	ld a, 7
	jr Movement_step_sleep_common

Movement_step_sleep_8: ; 523e
	ld a, 8
	jr Movement_step_sleep_common

Movement_step_sleep: ; 5242
; parameters:
;	duration (DecimalParam)

	call JumpMovementPointer
	jr Movement_step_sleep_common

Movement_step_sleep_common: ; 5247
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 525f

Movement_step_bump: ; 525f
	ld a, 1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_BUMP

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_BUMP

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5279

Movement_tree_shake: ; 5279
	ld a, 24
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_03

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_WEIRD_TREE

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5293

Movement_remove_sliding: ; 5293
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res SLIDING, [hl]
	jp ContinueReadingMovement
; 529c

Movement_set_sliding: ; 529c
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set SLIDING, [hl]
	jp ContinueReadingMovement
; 52a5

Movement_remove_fixed_facing: ; 52a5
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res FIXED_FACING, [hl]
	jp ContinueReadingMovement
; 52ae

Movement_fix_facing: ; 52ae
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set FIXED_FACING, [hl]
	jp ContinueReadingMovement
; 52b7

Movement_show_person: ; 52b7
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res INVISIBLE, [hl]
	jp ContinueReadingMovement
; 52c0

Movement_hide_person: ; 52c0
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set INVISIBLE, [hl]
	jp ContinueReadingMovement
; 52c9

Movement_hide_emote: ; 52c9
	call DespawnEmote
	jp ContinueReadingMovement
; 52cf

Movement_show_emote: ; 52cf
	call SpawnEmote
	jp ContinueReadingMovement
; 52d5

Movement_step_shake: ; 52d5
; parameters:
;	displacement (DecimalParam)

	call JumpMovementPointer
	call ShakeScreen
	jp ContinueReadingMovement
; 52de

Movement_turn_head_down: ; 52de
	ld a, OW_DOWN
	jr TurnHead

Movement_turn_head_up: ; 52e2
	ld a, OW_UP
	jr TurnHead

Movement_turn_head_left: ; 52e6
	ld a, OW_LEFT
	jr TurnHead

Movement_turn_head_right: ; 52ea
	ld a, OW_RIGHT
	jr TurnHead

TurnHead: ; 52ee
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5300

Movement_slow_step_down: ; 5300
	ld a, STEP_SLOW << 2 | DOWN
	jp NormalStep
; 5305

Movement_slow_step_up: ; 5305
	ld a, STEP_SLOW << 2 | UP
	jp NormalStep
; 530a

Movement_slow_step_left: ; 530a
	ld a, STEP_SLOW << 2 | LEFT
	jp NormalStep
; 530f

Movement_slow_step_right: ; 530f
	ld a, STEP_SLOW << 2 | RIGHT
	jp NormalStep
; 5314

Movement_step_down: ; 5314
	ld a, STEP_WALK << 2 | DOWN
	jp NormalStep
; 5319

Movement_step_up: ; 5319
	ld a, STEP_WALK << 2 | UP
	jp NormalStep
; 531e

Movement_step_left: ; 531e
	ld a, STEP_WALK << 2 | LEFT
	jp NormalStep
; 5323

Movement_step_right: ; 5323
	ld a, STEP_WALK << 2 | RIGHT
	jp NormalStep
; 5328

Movement_big_step_down: ; 5328
	ld a, STEP_BIKE << 2 | DOWN
	jp NormalStep
; 532d

Movement_big_step_up: ; 532d
	ld a, STEP_BIKE << 2 | UP
	jp NormalStep
; 5332

Movement_big_step_left: ; 5332
	ld a, STEP_BIKE << 2 | LEFT
	jp NormalStep
; 5337

Movement_big_step_right: ; 5337
	ld a, STEP_BIKE << 2 | RIGHT
	jp NormalStep
; 533c


Movement_turn_away_down: ; 533c
	ld a, STEP_SLOW << 2 | DOWN
	jp TurningStep
; 5341

Movement_turn_away_up: ; 5341
	ld a, STEP_SLOW << 2 | UP
	jp TurningStep
; 5346

Movement_turn_away_left: ; 5346
	ld a, STEP_SLOW << 2 | LEFT
	jp TurningStep
; 534b

Movement_turn_away_right: ; 534b
	ld a, STEP_SLOW << 2 | RIGHT
	jp TurningStep
; 5350

Movement_turn_in_down: ; 5350
	ld a, STEP_WALK << 2 | DOWN
	jp TurningStep
; 5355

Movement_turn_in_up: ; 5355
	ld a, STEP_WALK << 2 | UP
	jp TurningStep
; 535a

Movement_turn_in_left: ; 535a
	ld a, STEP_WALK << 2 | LEFT
	jp TurningStep
; 535f

Movement_turn_in_right: ; 535f
	ld a, STEP_WALK << 2 | RIGHT
	jp TurningStep
; 5364

Movement_turn_waterfall_down: ; 5364
	ld a, STEP_BIKE << 2 | DOWN
	jp TurningStep
; 5369

Movement_turn_waterfall_up: ; 5369
	ld a, STEP_BIKE << 2 | UP
	jp TurningStep
; 536e

Movement_turn_waterfall_left: ; 536e
	ld a, STEP_BIKE << 2 | LEFT
	jp TurningStep
; 5373

Movement_turn_waterfall_right: ; 5373
	ld a, STEP_BIKE << 2 | RIGHT
	jp TurningStep
; 5378


Movement_slow_slide_step_down: ; 5378
	ld a, STEP_SLOW << 2 | DOWN
	jp SlideStep
; 537d

Movement_slow_slide_step_up: ; 537d
	ld a, STEP_SLOW << 2 | UP
	jp SlideStep
; 5382

Movement_slow_slide_step_left: ; 5382
	ld a, STEP_SLOW << 2 | LEFT
	jp SlideStep
; 5387

Movement_slow_slide_step_right: ; 5387
	ld a, STEP_SLOW << 2 | RIGHT
	jp SlideStep
; 538c

Movement_slide_step_down: ; 538c
	ld a, STEP_WALK << 2 | DOWN
	jp SlideStep
; 5391

Movement_slide_step_up: ; 5391
	ld a, STEP_WALK << 2 | UP
	jp SlideStep
; 5396

Movement_slide_step_left: ; 5396
	ld a, STEP_WALK << 2 | LEFT
	jp SlideStep
; 539b

Movement_slide_step_right: ; 539b
	ld a, STEP_WALK << 2 | RIGHT
	jp SlideStep
; 53a0

Movement_fast_slide_step_down: ; 53a0
	ld a, STEP_BIKE << 2 | DOWN
	jp SlideStep
; 53a5

Movement_fast_slide_step_up: ; 53a5
	ld a, STEP_BIKE << 2 | UP
	jp SlideStep
; 53aa

Movement_fast_slide_step_left: ; 53aa
	ld a, STEP_BIKE << 2 | LEFT
	jp SlideStep
; 53af

Movement_fast_slide_step_right: ; 53af
	ld a, STEP_BIKE << 2 | RIGHT
	jp SlideStep
; 53b4


Movement_slow_jump_step_down: ; 53b4
	ld a, STEP_SLOW << 2 | DOWN
	jp JumpStep
; 53b9

Movement_slow_jump_step_up: ; 53b9
	ld a, STEP_SLOW << 2 | UP
	jp JumpStep
; 53be

Movement_slow_jump_step_left: ; 53be
	ld a, STEP_SLOW << 2 | LEFT
	jp JumpStep
; 53c3

Movement_slow_jump_step_right: ; 53c3
	ld a, STEP_SLOW << 2 | RIGHT
	jp JumpStep
; 53c8

Movement_jump_step_down: ; 53c8
	ld a, STEP_WALK << 2 | DOWN
	jp JumpStep
; 53cd

Movement_jump_step_up: ; 53cd
	ld a, STEP_WALK << 2 | UP
	jp JumpStep
; 53d2

Movement_jump_step_left: ; 53d2
	ld a, STEP_WALK << 2 | LEFT
	jp JumpStep
; 53d7

Movement_jump_step_right: ; 53d7
	ld a, STEP_WALK << 2 | RIGHT
	jp JumpStep
; 53dc

Movement_fast_jump_step_down: ; 53dc
	ld a, STEP_BIKE << 2 | DOWN
	jp JumpStep
; 53e1

Movement_fast_jump_step_up: ; 53e1
	ld a, STEP_BIKE << 2 | UP
	jp JumpStep
; 53e6

Movement_fast_jump_step_left: ; 53e6
	ld a, STEP_BIKE << 2 | LEFT
	jp JumpStep
; 53eb

Movement_fast_jump_step_right: ; 53eb
	ld a, STEP_BIKE << 2 | RIGHT
	jp JumpStep
; 53f0


Movement_turn_step_down: ; 53f0
	ld a, OW_DOWN
	jr TurnStep

Movement_turn_step_up: ; 53f4
	ld a, OW_UP
	jr TurnStep

Movement_turn_step_left: ; 53f8
	ld a, OW_LEFT
	jr TurnStep

Movement_turn_step_right: ; 53fc
	ld a, OW_RIGHT
	jr TurnStep

TurnStep: ; 5400
	ld hl, OBJECT_29 ; new facing
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_HALF_STEP
	ret
; 5412

NormalStep: ; 5412
	call InitStep
	call UpdateTallGrassFlags
	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP

	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call CheckSuperTallGrassTile
	jr z, .shake_grass

	call CheckGrassTile
	jr c, .skip_grass

.shake_grass
	call ShakeGrass

.skip_grass
	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 5446

TurningStep: ; 5446
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_SPIN

	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 5468


SlideStep: ; 5468
	call InitStep
	call UpdateTallGrassFlags

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STAND

	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_WALK
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_WALK
	ret
; 548a


JumpStep: ; 548a
	call InitStep
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $0

	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]

	ld hl, OBJECT_ACTION
	add hl, bc
	ld [hl], PERSON_ACTION_STEP

	call SpawnShadow

	ld hl, wCenteredObject
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .player

	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_NPC_JUMP
	ret

.player
	ld hl, OBJECT_STEP_TYPE
	add hl, bc
	ld [hl], STEP_TYPE_PLAYER_JUMP
	ret
; 54b8
