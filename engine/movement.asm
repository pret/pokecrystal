MovementPointers: ; 5075
	dw Movement_turn_head_down        ; 00
	dw Movement_turn_head_up          ; 01
	dw Movement_turn_head_left        ; 02
	dw Movement_turn_head_right       ; 03
	dw Movement_half_step_down        ; 04
	dw Movement_half_step_up          ; 05
	dw Movement_half_step_left        ; 06
	dw Movement_half_step_right       ; 07
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
	dw Movement_38                    ; 38
	dw Movement_39                    ; 39
	dw Movement_remove_fixed_facing   ; 3a
	dw Movement_fix_facing            ; 3b
	dw Movement_3c                    ; 3c
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
	dw Movement_step_wait5            ; 4f
	dw Movement_50                    ; 50
	dw Movement_fish_got_bite         ; 51
	dw Movement_fish_cast_rod         ; 52
	dw Movement_hide_emote            ; 53
	dw Movement_show_emote            ; 54
	dw Movement_step_shake            ; 55
	dw Movement_56                    ; 56
	dw Movement_rock_smash            ; 57
	dw Movement_58                    ; 58
	dw Movement_59                    ; 59
; 5129


Movement_teleport_from: ; 5129
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $c
	ret
; 5130

Movement_teleport_to: ; 5130
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $d
	ret
; 5137

Movement_skyfall: ; 5137
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $e
	ret
; 513e

Movement_59: ; 513e
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $19
	ret
; 5145

Movement_step_wait5: ; 5145
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_12
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $4
	call GetMovementByte
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $3
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 516a

Movement_58: ; 516a
	call GetSpriteDirection
	rlca
	rlca
	ld hl, OBJECT_12
	add hl, bc
	ld [hl], a
	call GetMovementByte
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $12
	ret
; 5189

Movement_fish_got_bite: ; 5189
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $6
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $10
	ret
; 5196

Movement_rock_smash: ; 5196
	call GetMovementByte
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $1
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $11
	ret
; 51ab

Movement_fish_cast_rod: ; 51ab
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $6
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $1
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

	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $1
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

	call GetMovementByte
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $3

	ld hl, VramState
	res 7, [hl]
	ret
; 51fd

Movement_remove_person: ; 51fd
	call Function4357
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
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $1

	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $4

	ld hl, VramState
	res 7, [hl]
	ret
; 5222

Movement_step_sleep_1: ; 5222
	ld a, $1
	jr Function5247

Movement_step_sleep_2: ; 5226
	ld a, $2
	jr Function5247

Movement_step_sleep_3: ; 522a
	ld a, $3
	jr Function5247

Movement_step_sleep_4: ; 522e
	ld a, $4
	jr Function5247

Movement_step_sleep_5: ; 5232
	ld a, $5
	jr Function5247

Movement_step_sleep_6: ; 5236
	ld a, $6
	jr Function5247

Movement_step_sleep_7: ; 523a
	ld a, $7
	jr Function5247

Movement_step_sleep_8: ; 523e
	ld a, $8
	jr Function5247

Movement_step_sleep: ; 5242
; parameters:
;	duration (DecimalParam)

	call GetMovementByte
	jr Function5247

Function5247: ; 5247
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a

	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $3

	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $1

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 525f

Movement_50: ; 525f
	ld a, $1
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $b
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $3
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5279

Movement_56: ; 5279
	ld a, $18
	ld hl, OBJECT_STEP_DURATION
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $3
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $b
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld [hl], STANDING
	ret
; 5293

Movement_38: ; 5293
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res 3, [hl]
	jp ContinueReadingMovement
; 529c

Movement_39: ; 529c
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set 3, [hl]
	jp ContinueReadingMovement
; 52a5

Movement_remove_fixed_facing: ; 52a5
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res 2, [hl]
	jp ContinueReadingMovement
; 52ae

Movement_fix_facing: ; 52ae
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set 2, [hl]
	jp ContinueReadingMovement
; 52b7

Movement_3c: ; 52b7
	ld hl, OBJECT_FLAGS1
	add hl, bc
	res 0, [hl]
	jp ContinueReadingMovement
; 52c0

Movement_hide_person: ; 52c0
	ld hl, OBJECT_FLAGS1
	add hl, bc
	set 0, [hl]
	jp ContinueReadingMovement
; 52c9

Movement_hide_emote: ; 52c9
	call Function5579
	jp ContinueReadingMovement
; 52cf

Movement_show_emote: ; 52cf
	call Function5547
	jp ContinueReadingMovement
; 52d5

Movement_step_shake: ; 52d5
; parameters:
;	displacement (DecimalParam)

	call GetMovementByte
	call Function5565
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
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $1
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


Movement_half_step_down: ; 53f0
	ld a, OW_DOWN
	jr HalfStep

Movement_half_step_up: ; 53f4
	ld a, OW_UP
	jr HalfStep

Movement_half_step_left: ; 53f8
	ld a, OW_LEFT
	jr HalfStep

Movement_half_step_right: ; 53fc
	ld a, OW_RIGHT
	jr HalfStep

HalfStep: ; 5400
	ld hl, OBJECT_29
	add hl, bc
	ld [hl], a
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $2
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $a
	ret
; 5412

NormalStep: ; 5412
	call Function4690
	call Function463f
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $2
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	call CheckSuperTallGrassTile
	jr z, .asm_542d

	call Function1875
	jr c, .asm_5430

.asm_542d
	call Function5556

.asm_5430
	ld hl, wd4cf
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_543f

	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $2
	ret

.asm_543f
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $6
	ret
; 5446

TurningStep: ; 5446
	call Function4690
	call Function463f
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $4
	ld hl, wd4cf
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_5461
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $2
	ret

.asm_5461
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $6
	ret
; 5468


SlideStep: ; 5468
	call Function4690
	call Function463f
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $1
	ld hl, wd4cf
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_5483
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $2
	ret

.asm_5483
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $6
	ret
; 548a


JumpStep: ; 548a
	call Function4690
	ld hl, OBJECT_31
	add hl, bc
	ld [hl], $0
	ld hl, OBJECT_FLAGS2
	add hl, bc
	res 3, [hl]
	ld hl, OBJECT_11
	add hl, bc
	ld [hl], $2
	call Function5529
	ld hl, wd4cf
	ld a, [hMapObjectIndexBuffer]
	cp [hl]
	jr z, .asm_54b1
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $8
	ret

.asm_54b1
	ld hl, OBJECT_09
	add hl, bc
	ld [hl], $9
	ret
; 54b8
