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
; 445f

Pointers445f: ; 445f
	dw SetFacingStanding, SetFacingStanding ; 00
	dw Function44b5,      SetFacingCurrent ; 01 standing?
	dw Function44c1,      SetFacingCurrent ; 02 walking?
	dw Function4508,      SetFacingCurrent ; 03 bumping?
	dw Function4529,      SetFacingCurrent ; 04
	dw Function4539,      SetFacingStanding ; 05
	dw Function456e,      Function456e ; 06
	dw Function457b,      SetFacingStanding ; 07
	dw Function4582,      Function4582 ; 08
	dw Function4589,      Function4589 ; 09
	dw Function4590,      Function45a4 ; 0a
	dw Function45ab,      SetFacingCurrent ; 0c
	dw Function45be,      Function45be ; 0b
	dw Function45c5,      Function45c5 ; 0d
	dw Function45da,      SetFacingStanding ; 0e
	dw Function45ed,      SetFacingStanding ; 0f
	dw Function44e4,      SetFacingCurrent ; 10
; 44a3

SetFacingStanding: ; 44a3
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], STANDING
	ret
; 44aa

SetFacingCurrent: ; 44aa
	call GetSpriteDirection
	or 0 ; useless
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 44b5

Function44b5: ; 44b5
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld a, [hl]
	and 1
	jr nz, Function44c1
	jp SetFacingCurrent
; 44c1

Function44c1: ; 44c1
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a

	rrca
	rrca
	and %00000011
	ld d, a

	call GetSpriteDirection
	or 0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 44e4

Function44e4: ; 44e4
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	add 2
	and %00001111
	ld [hl], a

	rrca
	rrca
	and %00000011
	ld d, a

	call GetSpriteDirection
	or 0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 4508

Function4508: ; 4508
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit SLIDING, [hl]
	jp nz, SetFacingCurrent

	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]

	ld a, [hl]
	rrca
	rrca
	rrca
	and %00000011
	ld d, a

	call GetSpriteDirection
	or 0 ; useless
	or d
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 4529

Function4529: ; 4529
	call Function453f
	ld hl, OBJECT_FACING
	add hl, bc
	ld a, [hl]
	or 0 ; useless
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 4539

Function4539: ; 4539
	call Function453f
	jp SetFacingStanding
; 453f

Function453f: ; 453f
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
; 456a

.Directions: ; 456a
	db OW_DOWN, OW_RIGHT, OW_UP, OW_LEFT
; 456e

Function456e: ; 456e
	call GetSpriteDirection
	rrca
	rrca
	add $10
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 457b

Function457b: ; 457b
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_15
	ret
; 4582

Function4582: ; 4582 emote
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_EMOTE
	ret
; 4589

Function4589: ; 4589
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_17
	ret
; 4590

Function4590: ; 4590
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	and %00001111
	ld [hl], a
	and %00001000
	jr z, Function45a4
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_04
	ret
; 45a4

Function45a4: ; 45a4
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], 0
	ret
; 45ab

Function45ab: ; 45ab
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	and %00001100
	rrca
	rrca
	add $18
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], a
	ret
; 45be

Function45be: ; 45be
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], FACING_16
	ret
; 45c5

Function45c5: ; 45c5
	ld a, [VariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS]
	ld d, FACING_17
	cp SPRITE_BIG_SNORLAX
	jr z, .ok
	cp SPRITE_BIG_LAPRAS
	jr z, .ok
	ld d, FACING_16

.ok
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	ld [hl], d
	ret
; 45da

Function45da: ; 45da
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]

	ld hl, OBJECT_FACING_STEP
	add hl, bc
	and 2
	ld a, FACING_1C
	jr z, .ok
	inc a ; FACING_1D
.ok
	ld [hl], a
	ret
; 45ed

Function45ed: ; 45ed
	ld hl, OBJECT_STEP_FRAME
	add hl, bc
	inc [hl]
	ld a, [hl]
	ld hl, OBJECT_FACING_STEP
	add hl, bc
	and 4
	ld a, FACING_1E
	jr z, .ok
	inc a ; FACING_1F

.ok
	ld [hl], a
	ret
; 4600
