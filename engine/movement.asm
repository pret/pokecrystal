MovementPointers: ; 5075
	dw Movement_turn_head_down
	dw Movement_turn_head_up
	dw Movement_turn_head_left
	dw Movement_turn_head_right
	dw Movement_half_step_down
	dw Movement_half_step_up
	dw Movement_half_step_left
	dw Movement_half_step_right
	dw Movement_slow_step_down
	dw Movement_slow_step_up
	dw Movement_slow_step_left
	dw Movement_slow_step_right
	dw Movement_step_down
	dw Movement_step_up
	dw Movement_step_left
	dw Movement_step_right
	dw Movement_big_step_down
	dw Movement_big_step_up
	dw Movement_big_step_left
	dw Movement_big_step_right
	dw Movement_slow_slide_step_down
	dw Movement_slow_slide_step_up
	dw Movement_slow_slide_step_left
	dw Movement_slow_slide_step_right
	dw Movement_slide_step_down
	dw Movement_slide_step_up
	dw Movement_slide_step_left
	dw Movement_slide_step_right
	dw Movement_fast_slide_step_down
	dw Movement_fast_slide_step_up
	dw Movement_fast_slide_step_left
	dw Movement_fast_slide_step_right
	dw Movement_turn_away_down
	dw Movement_turn_away_up
	dw Movement_turn_away_left
	dw Movement_turn_away_right
	dw Movement_turn_in_down
	dw Movement_turn_in_up
	dw Movement_turn_in_left
	dw Movement_turn_in_right
	dw Movement_turn_waterfall_down
	dw Movement_turn_waterfall_up
	dw Movement_turn_waterfall_left
	dw Movement_turn_waterfall_right
	dw Movement_slow_jump_step_down
	dw Movement_slow_jump_step_up
	dw Movement_slow_jump_step_left
	dw Movement_slow_jump_step_right
	dw Movement_jump_step_down
	dw Movement_jump_step_up
	dw Movement_jump_step_left
	dw Movement_jump_step_right
	dw Movement_fast_jump_step_down
	dw Movement_fast_jump_step_up
	dw Movement_fast_jump_step_left
	dw Movement_fast_jump_step_right
	dw Function5293
	dw Function529c
	dw Movement_remove_fixed_facing
	dw Movement_fix_facing
	dw Function52b7
	dw Movement_hide_person
	dw Movement_show_person
	dw Function5226
	dw Function522a
	dw Function522e
	dw Function5232
	dw Function5236
	dw Function523a
	dw Movement_accelerate_last
	dw Movement_step_sleep
	dw Movement_step_end
	dw Function51db
	dw Movement_remove_person
	dw Function51b8
	dw Function5210
	dw Movement_teleport_from
	dw Movement_teleport_to
	dw Movement_skyfall
	dw Movement_step_wait5
	dw Function525f
	dw Function5189
	dw Function51ab
	dw Movement_hide_emote
	dw Movement_show_emote
	dw Movement_step_shake
	dw Function5279
	dw Function5196
	dw Function516a
	dw Function513e
; 5129


Movement_teleport_from: ; 5129
	ld hl, $0009
	add hl, bc
	ld [hl], $c
	ret
; 5130

Movement_teleport_to: ; 5130
	ld hl, $0009
	add hl, bc
	ld [hl], $d
	ret
; 5137

Movement_skyfall: ; 5137
	ld hl, $0009
	add hl, bc
	ld [hl], $e
	ret
; 513e

Function513e: ; 513e
	ld hl, $0009
	add hl, bc
	ld [hl], $19
	ret
; 5145

Movement_step_wait5: ; 5145
	call GetSpriteDirection
	rlca
	rlca
	ld hl, $000c
	add hl, bc
	ld [hl], a
	ld hl, $000b
	add hl, bc
	ld [hl], $4
	call GetMovementByte
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0009
	add hl, bc
	ld [hl], $3
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ret
; 516a

Function516a: ; 516a
	call GetSpriteDirection
	rlca
	rlca
	ld hl, $000c
	add hl, bc
	ld [hl], a
	call GetMovementByte
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ld hl, $0009
	add hl, bc
	ld [hl], $12
	ret
; 5189

Function5189: ; 5189
	ld hl, $000b
	add hl, bc
	ld [hl], $6
	ld hl, $0009
	add hl, bc
	ld [hl], $10
	ret
; 5196

Function5196: ; 5196
	call GetMovementByte
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $000b
	add hl, bc
	ld [hl], $1
	ld hl, $0009
	add hl, bc
	ld [hl], $11
	ret
; 51ab

Function51ab: ; 51ab
	ld hl, $000b
	add hl, bc
	ld [hl], $6
	ld hl, $0009
	add hl, bc
	ld [hl], $1
	ret
; 51b8

Function51b8: ; 51b8
	ld hl, $001b
	add hl, bc
	ld [hl], $0
	jp Function5065
; 51c1

Movement_step_end: ; 51c1
	call Function4769
	ld hl, $0003
	add hl, bc
	ld [hl], a
	ld hl, $001b
	add hl, bc
	ld [hl], $0
	ld hl, VramState
	res 7, [hl]
	ld hl, $0009
	add hl, bc
	ld [hl], $1
	ret
; 51db

Function51db: ; 51db
	call Function4769
	ld hl, $0003
	add hl, bc
	ld [hl], a
	ld hl, $001b
	add hl, bc
	ld [hl], $0
	call GetMovementByte
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0009
	add hl, bc
	ld [hl], $3
	ld hl, VramState
	res 7, [hl]
	ret
; 51fd

Movement_remove_person: ; 51fd
	call Function4357
	ld hl, wd4cd
	ld a, [hConnectionStripLength]
	cp [hl]
	jr nz, .asm_520a
	ld [hl], $ff

.asm_520a
	ld hl, VramState
	res 7, [hl]
	ret
; 5210

Function5210: ; 5210
	ld hl, $000b
	add hl, bc
	ld [hl], $1
	ld hl, $0009
	add hl, bc
	ld [hl], $4
	ld hl, VramState
	res 7, [hl]
	ret
; 5222

Movement_show_person: ; 5222
	ld a, $1
	jr Function5247

Function5226: ; 5226
	ld a, $2
	jr Function5247

Function522a: ; 522a
	ld a, $3
	jr Function5247

Function522e: ; 522e
	ld a, $4
	jr Function5247

Function5232: ; 5232
	ld a, $5
	jr Function5247

Function5236: ; 5236
	ld a, $6
	jr Function5247

Function523a: ; 523a
	ld a, $7
	jr Function5247

Movement_accelerate_last: ; 523e
	ld a, $8
	jr Function5247

Movement_step_sleep: ; 5242
; parameters:
;	duration (DecimalParam)

	call GetMovementByte
	jr Function5247

Function5247: ; 5247
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0009
	add hl, bc
	ld [hl], $3
	ld hl, $000b
	add hl, bc
	ld [hl], $1
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ret
; 525f

Function525f: ; 525f
	ld a, $1
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0009
	add hl, bc
	ld [hl], $b
	ld hl, $000b
	add hl, bc
	ld [hl], $3
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ret
; 5279

Function5279: ; 5279
	ld a, $18
	ld hl, $000a
	add hl, bc
	ld [hl], a
	ld hl, $0009
	add hl, bc
	ld [hl], $3
	ld hl, $000b
	add hl, bc
	ld [hl], $b
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ret
; 5293

Function5293: ; 5293
	ld hl, $0004
	add hl, bc
	res 3, [hl]
	jp Function5065
; 529c

Function529c: ; 529c
	ld hl, $0004
	add hl, bc
	set 3, [hl]
	jp Function5065
; 52a5

Movement_remove_fixed_facing: ; 52a5
	ld hl, $0004
	add hl, bc
	res 2, [hl]
	jp Function5065
; 52ae

Movement_fix_facing: ; 52ae
	ld hl, $0004
	add hl, bc
	set 2, [hl]
	jp Function5065
; 52b7

Function52b7: ; 52b7
	ld hl, $0004
	add hl, bc
	res 0, [hl]
	jp Function5065
; 52c0

Movement_hide_person: ; 52c0
	ld hl, $0004
	add hl, bc
	set 0, [hl]
	jp Function5065
; 52c9

Movement_hide_emote: ; 52c9
	call Function5579
	jp Function5065
; 52cf

Movement_show_emote: ; 52cf
	call Function5547
	jp Function5065
; 52d5

Movement_step_shake: ; 52d5
; parameters:
;	displacement (DecimalParam)

	call GetMovementByte
	call Function5565
	jp Function5065
; 52de

Movement_turn_head_down: ; 52de
	ld a, $0
	jr Function52ee

Movement_turn_head_up: ; 52e2
	ld a, $4
	jr Function52ee

Movement_turn_head_left: ; 52e6
	ld a, $8
	jr Function52ee

Movement_turn_head_right: ; 52ea
	ld a, $c
	jr Function52ee

Function52ee: ; 52ee
	ld hl, $0008
	add hl, bc
	ld [hl], a
	ld hl, $000b
	add hl, bc
	ld [hl], $1
	ld hl, $0007
	add hl, bc
	ld [hl], $ff
	ret
; 5300

Movement_slow_step_down: ; 5300
	ld a, $0
	jp Function5412
; 5305

Movement_slow_step_up: ; 5305
	ld a, $1
	jp Function5412
; 530a

Movement_slow_step_left: ; 530a
	ld a, $2
	jp Function5412
; 530f

Movement_slow_step_right: ; 530f
	ld a, $3
	jp Function5412
; 5314

Movement_step_down: ; 5314
	ld a, $4
	jp Function5412
; 5319

Movement_step_up: ; 5319
	ld a, $5
	jp Function5412
; 531e

Movement_step_left: ; 531e
	ld a, $6
	jp Function5412
; 5323

Movement_step_right: ; 5323
	ld a, $7
	jp Function5412
; 5328

Movement_big_step_down: ; 5328
	ld a, $8
	jp Function5412
; 532d

Movement_big_step_up: ; 532d
	ld a, $9
	jp Function5412
; 5332

Movement_big_step_left: ; 5332
	ld a, $a
	jp Function5412
; 5337

Movement_big_step_right: ; 5337
	ld a, $b
	jp Function5412
; 533c


Movement_turn_away_down: ; 533c
	ld a, $0
	jp Function5446
; 5341

Movement_turn_away_up: ; 5341
	ld a, $1
	jp Function5446
; 5346

Movement_turn_away_left: ; 5346
	ld a, $2
	jp Function5446
; 534b

Movement_turn_away_right: ; 534b
	ld a, $3
	jp Function5446
; 5350

Movement_turn_in_down: ; 5350
	ld a, $4
	jp Function5446
; 5355

Movement_turn_in_up: ; 5355
	ld a, $5
	jp Function5446
; 535a

Movement_turn_in_left: ; 535a
	ld a, $6
	jp Function5446
; 535f

Movement_turn_in_right: ; 535f
	ld a, $7
	jp Function5446
; 5364

Movement_turn_waterfall_down: ; 5364
	ld a, $8
	jp Function5446
; 5369

Movement_turn_waterfall_up: ; 5369
	ld a, $9
	jp Function5446
; 536e

Movement_turn_waterfall_left: ; 536e
	ld a, $a
	jp Function5446
; 5373

Movement_turn_waterfall_right: ; 5373
	ld a, $b
	jp Function5446
; 5378


Movement_slow_slide_step_down: ; 5378
	ld a, $0
	jp Function5468
; 537d

Movement_slow_slide_step_up: ; 537d
	ld a, $1
	jp Function5468
; 5382

Movement_slow_slide_step_left: ; 5382
	ld a, $2
	jp Function5468
; 5387

Movement_slow_slide_step_right: ; 5387
	ld a, $3
	jp Function5468
; 538c

Movement_slide_step_down: ; 538c
	ld a, $4
	jp Function5468
; 5391

Movement_slide_step_up: ; 5391
	ld a, $5
	jp Function5468
; 5396

Movement_slide_step_left: ; 5396
	ld a, $6
	jp Function5468
; 539b

Movement_slide_step_right: ; 539b
	ld a, $7
	jp Function5468
; 53a0

Movement_fast_slide_step_down: ; 53a0
	ld a, $8
	jp Function5468
; 53a5

Movement_fast_slide_step_up: ; 53a5
	ld a, $9
	jp Function5468
; 53aa

Movement_fast_slide_step_left: ; 53aa
	ld a, $a
	jp Function5468
; 53af

Movement_fast_slide_step_right: ; 53af
	ld a, $b
	jp Function5468
; 53b4


Movement_slow_jump_step_down: ; 53b4
	ld a, $0
	jp Function548a
; 53b9

Movement_slow_jump_step_up: ; 53b9
	ld a, $1
	jp Function548a
; 53be

Movement_slow_jump_step_left: ; 53be
	ld a, $2
	jp Function548a
; 53c3

Movement_slow_jump_step_right: ; 53c3
	ld a, $3
	jp Function548a
; 53c8

Movement_jump_step_down: ; 53c8
	ld a, $4
	jp Function548a
; 53cd

Movement_jump_step_up: ; 53cd
	ld a, $5
	jp Function548a
; 53d2

Movement_jump_step_left: ; 53d2
	ld a, $6
	jp Function548a
; 53d7

Movement_jump_step_right: ; 53d7
	ld a, $7
	jp Function548a
; 53dc

Movement_fast_jump_step_down: ; 53dc
	ld a, $8
	jp Function548a
; 53e1

Movement_fast_jump_step_up: ; 53e1
	ld a, $9
	jp Function548a
; 53e6

Movement_fast_jump_step_left: ; 53e6
	ld a, $a
	jp Function548a
; 53eb

Movement_fast_jump_step_right: ; 53eb
	ld a, $b
	jp Function548a
; 53f0


Movement_half_step_down: ; 53f0
	ld a, $0
	jr Function5400

Movement_half_step_up: ; 53f4
	ld a, $4
	jr Function5400

Movement_half_step_left: ; 53f8
	ld a, $8
	jr Function5400

Movement_half_step_right: ; 53fc
	ld a, $c
	jr Function5400

Function5400: ; 5400
	ld hl, $001d
	add hl, bc
	ld [hl], a
	ld hl, $000b
	add hl, bc
	ld [hl], $2
	ld hl, $0009
	add hl, bc
	ld [hl], $a
	ret
; 5412

Function5412: ; 5412
	call Function4690
	call Function463f
	ld hl, $000b
	add hl, bc
	ld [hl], $2
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	call Function188e
	jr z, .asm_542d

	call Function1875
	jr c, .asm_5430

.asm_542d
	call Function5556

.asm_5430
	ld hl, wd4cf
	ld a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_543f

	ld hl, $0009
	add hl, bc
	ld [hl], $2
	ret

.asm_543f
	ld hl, $0009
	add hl, bc
	ld [hl], $6
	ret
; 5446

Function5446: ; 5446
	call Function4690
	call Function463f
	ld hl, $000b
	add hl, bc
	ld [hl], $4
	ld hl, wd4cf
	ld a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_5461
	ld hl, $0009
	add hl, bc
	ld [hl], $2
	ret

.asm_5461
	ld hl, $0009
	add hl, bc
	ld [hl], $6
	ret
; 5468


Function5468: ; 5468
	call Function4690
	call Function463f
	ld hl, $000b
	add hl, bc
	ld [hl], $1
	ld hl, wd4cf
	ld a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_5483
	ld hl, $0009
	add hl, bc
	ld [hl], $2
	ret

.asm_5483
	ld hl, $0009
	add hl, bc
	ld [hl], $6
	ret
; 548a


Function548a: ; 548a
	call Function4690
	ld hl, $001f
	add hl, bc
	ld [hl], $0
	ld hl, $0005
	add hl, bc
	res 3, [hl]
	ld hl, $000b
	add hl, bc
	ld [hl], $2
	call Function5529
	ld hl, wd4cf
	ld a, [hConnectionStripLength]
	cp [hl]
	jr z, .asm_54b1
	ld hl, $0009
	add hl, bc
	ld [hl], $8
	ret

.asm_54b1
	ld hl, $0009
	add hl, bc
	ld [hl], $9
	ret
; 54b8
