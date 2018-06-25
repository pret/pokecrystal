ObjectActionPairPointers:
; entries correspond to OBJECT_ACTION_* constants
	dw SetFacingStanding,              SetFacingStanding
	dw SetFacingStandAction,           SetFacingCurrent
	dw SetFacingStepAction,            SetFacingCurrent
	dw SetFacingBumpAction,            SetFacingCurrent
	dw SetFacingCounterclockwiseSpin,  SetFacingCurrent
	dw SetFacingCounterclockwiseSpin2, SetFacingStanding
	dw SetFacingFish,                  SetFacingFish
	dw SetFacingShadow,                SetFacingStanding
	dw SetFacingEmote,                 SetFacingEmote
	dw SetFacingBigDollSym,            SetFacingBigDollSym
	dw SetFacingBounce,                SetFacingFreezeBounce
	dw SetFacingWeirdTree,             SetFacingCurrent
	dw SetFacingBigDollAsym,           SetFacingBigDollAsym
	dw SetFacingBigDoll,               SetFacingBigDoll
	dw SetFacingBoulderDust,           SetFacingStanding
	dw SetFacingGrassShake,            SetFacingStanding
	dw SetFacingSkyfall,               SetFacingCurrent

SetFacingStanding:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], STANDING
	ret

SetFacingCurrent:
	call GetSpriteDirection
	or FACING_STEP_DOWN_0 ; useless
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingStandAction:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	and 1
	jr nz, SetFacingStepAction
	jp SetFacingCurrent

SetFacingStepAction:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING_F, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a

	rrca
	rrca
	maskbits NUM_DIRECTIONS
	ld d, a

	call GetSpriteDirection
	or FACING_STEP_DOWN_0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingSkyfall:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING_F, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	add 2
	and %00001111
	ld [hl], a

	rrca
	rrca
	maskbits NUM_DIRECTIONS
	ld d, a

	call GetSpriteDirection
	or FACING_STEP_DOWN_0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingBumpAction:
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING_F, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]

	ld a, [hl]
	rrca
	rrca
	rrca
	maskbits NUM_DIRECTIONS
	ld d, a

	call GetSpriteDirection
	or FACING_STEP_DOWN_0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingCounterclockwiseSpin:
	call CounterclockwiseSpinAction
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	or FACING_STEP_DOWN_0 ; useless
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingCounterclockwiseSpin2:
	call CounterclockwiseSpinAction
	jp SetFacingStanding

CounterclockwiseSpinAction:
; Here, OBJECT_STEP_FRAME consists of two 2-bit components,
; using only bits 0,1 and 4,5.
; bits 0,1 is a timer (4 overworld frames)
; bits 4,5 determines the facing - the direction is counterclockwise.
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	and %11110000
	ld e, a

	ld a, [hl]
	inc a
	and %00001111
	ld d, a
	cp 4
	jr c, .ok

	ld d, 0
	ld a, e
	add $10
	and %00110000
	ld e, a

.ok
	ld a, d
	or e
	ld [hl], a

	swap e
	ld d, 0
	ld hl, .Directions
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_FACING
	add hl, bc
	ld [hl], a
	ret

.Directions:
	db OW_DOWN, OW_RIGHT, OW_UP, OW_LEFT

SetFacingFish:
	call GetSpriteDirection
	rrca
	rrca
	add FACING_FISH_DOWN
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingShadow:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_SHADOW
	ret

SetFacingEmote:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_EMOTE
	ret

SetFacingBigDollSym:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_BIG_DOLL_SYM
	ret

SetFacingBounce:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a
	and %00001000
	jr z, SetFacingFreezeBounce
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_STEP_UP_0
	ret

SetFacingFreezeBounce:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_STEP_DOWN_0
	ret

SetFacingWeirdTree:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	maskbits NUM_DIRECTIONS, 2
	rrca
	rrca
	add FACING_WEIRD_TREE_0
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret

SetFacingBigDollAsym:
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_BIG_DOLL_ASYM
	ret

SetFacingBigDoll:
	ld a, [wVariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS]
	ld d, FACING_BIG_DOLL_SYM ; symmetric
	cp SPRITE_BIG_SNORLAX
	jr z, .ok
	cp SPRITE_BIG_LAPRAS
	jr z, .ok
	ld d, FACING_BIG_DOLL_ASYM ; asymmetric

.ok
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], d
	ret

SetFacingBoulderDust:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]

	ld hl, OBJECT_FACING_STEP
	add hl, bc
	and 2
	ld a, FACING_BOULDER_DUST_1
	jr z, .ok
	inc a ; FACING_BOULDER_DUST_2
.ok
	ld [hl], a
	ret

SetFacingGrassShake:
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	and 4
	ld a, FACING_GRASS_1
	jr z, .ok
	inc a ; FACING_GRASS_2

.ok
	ld [hl], a
	ret
