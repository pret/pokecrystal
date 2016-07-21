DoAnimFrame: ; 8d24b
	ld hl, SPRITEANIMSTRUCT_ANIM_SEQ_ID
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8d25b

.Jumptable: ; 8d25b (23:525b)

	dw .Null        ; null
	dw .one         ; bouncing mon icon
	dw .two         ; bouncing mon icon, selected
	dw .three       ; bouncing mon icon, menu open
	dw .four
	dw .namingscreencursor
	dw .GameFreakLogo         ; Game Freak logo
	dw .seven
	dw .eight
	dw .SlotsGolem        ; Something to do with slots
	dw .SlotsChansey         ; Something to do with slots
	dw .SlotsChanseyEgg      ; Something to do with slots
	dw .mailcompositioncursor      ; blinking cursor
	dw .thirteen
	dw .fourteen
	dw .fifteen
	dw .sixteen
	dw .seventeen
	dw .eighteen
	dw .EggShell    ; finish egg hatching animation
	dw .RadioTuningKnob      ; radio tuning knob
	dw .twentyone   ; cut grass leaves
	dw .FlyFrom   ; flying sprite
	dw .FlyLeaf ; flying leaves
	dw .FlyTo  ; fly to
	dw .twentyfive
	dw .twentysix
	dw .twentyseven
	dw .twentyeight
	dw .twentynine  ; intro suicune
	dw .thirty      ; intro pichu wooper
	dw .thirtyone   ; celebi
	dw .thirtytwo   ; intro unown
	dw .thirtythree ; intro unown F with suicune leaping up
	dw .thirtyfour  ; intro suicune facing away from us


.Null: ; 8d2a1 (23:52a1)
	ret

.one ; 8d2a2 (23:52a2)
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .two

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0
	ret

.two ; 8d2b9 (23:52b9)
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .load_zero
	ld a, e
	and a
	jr z, .load_minus_two
	cp $1
	jr z, .load_minus_one
.load_zero
	xor a
	ld [hl], a
	ret

.load_minus_one
	ld a, -1
	ld [hl], a
	ret

.load_minus_two
	ld a, -2
	ld [hl], a
	ret

.three ; 8d2ea (23:52ea)
	ld a, [wMenuCursorY]

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	cp [hl]
	jr z, .three_offset_right

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 2
	ret

.three_offset_right
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], 8 * 3
	ret

.four ; 8d302 (23:5302)
	call .AnonymousJumptable
	jp [hl]
; 8d306 (23:5306)

; Anonymous dw (see .AnonymousJumptable)
	dw .four_zero
	dw .four_one
; 8d30a

.four_zero ; 8d30a
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_INDEX
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], a

.four_one ; 8d321
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d356

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	add $4

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d356
	call DeinitializeSprite
	ret
; 8d35a

.twentyfive ; 8d35a (23:535a)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, $2
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.namingscreencursor ; 8d36c (23:536c)
	callab NamingScreen_AnimateCursor
	ret

.mailcompositioncursor ; 8d373 (23:5373)
	callab ComposeMail_AnimateCursor
	ret

.GameFreakLogo: ; 8d37a (23:537a)
	callab GameFreakLogoJumper
	ret

.seven ; 8d381 (23:5381)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba
	dec [hl]
	dec [hl]
	ld d, a
	and $1f
	jr nz, .asm_8d395

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	add [hl]
	ld [hl], a
	ret

.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call DeinitializeSprite
	ret

.eight ; 8d3c3 (23:53c3)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret

.asm_8d41e
	call DeinitializeSprite
	ret

.SlotsGolem: ; 8d422 (23:5422)
	callab SlotMachine_AnimateGolem
	ret

.SlotsChansey: ; 8d429 (23:5429)
	callab Slots_AnimateChansey
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, $f
	call _ReinitSpriteAnimFrame
	ret

.SlotsChanseyEgg: ; 8d43e (23:543e)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .move_vertical

	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp 15 * 8
	jr c, .move_right
	call DeinitializeSprite
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret

.move_right
	inc [hl]
.move_vertical
	ld a, e
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.thirteen ; 8d46e (23:546e)
	callab ret_e00ed
	ret

.fifteen ; 8d475 (23:5475)
	callab AnimatePokegearModeIndicatorArrow
	ret

.fourteen ; 8d47c (23:547c)
	callab DummyGame_InterpretJoypad_AnimateCursor
	ret

.sixteen ; 8d483 (23:5483)
	call .AnonymousJumptable
	jp [hl]
; 8d487 (23:5487)

; Anonymous dw (see .AnonymousJumptable)
	dw .sixteen_zero
	dw .sixteen_one
	dw .sixteen_two
	dw .sixteen_three
	dw .sixteen_four
	dw .sixteen_five
; 8d493

.sixteen_zero ; 8d493
	ld a, $14
	call _ReinitSpriteAnimFrame

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $2

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20
	ret
; 8d4a5

.sixteen_two ; 8d4a5
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call .IncrementJumptableIndex

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $40

.sixteen_three ; 8d4b8
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .sixteen_five
; 8d4d5

.sixteen_one ; 8d4d5
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld [hl], $4

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $30

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], $24
	ret
; 8d4e8

.sixteen_four ; 8d4e8
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	call Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld [hl], $20

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	call .IncrementJumptableIndex
	ret

.sixteen_five ; 8d526
	call DeinitializeSprite
	ret
; 8d52a

.seventeen ; 8d52a (23:552a)
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	cp $b0
	jr nc, .delete
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.delete
	call DeinitializeSprite
	ret

.eighteen ; 8d543 (23:5543)
	callab TradeAnim_AnimateTrademonInTube
	ret

.EggShell: ; 8d54a (23:554a)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_EggShell
	ld d, a
	add $8
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.finish_EggShell
	call DeinitializeSprite
	ret

.RadioTuningKnob: ; 8d578 (23:5578)
	callab AnimateTuningKnob
	ret

.twentyone ; 8d57f (23:557f)
	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	inc [hl]
	inc [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyFrom: ; 8d5b0 (23:55b0)
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	and a
	ret z

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]
	dec [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .skip
	add $8
	ld [hl], a
.skip
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.FlyLeaf: ; 8d5e2 (23:55e2)
	ld hl, SPRITEANIMSTRUCT_XCOORD
	add hl, bc
	ld a, [hl]
	cp -9 * 8
	jr nc, .delete_leaf
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	dec [hl]

	ld d, $40
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.delete_leaf
	call DeinitializeSprite
	ret

.FlyTo: ; 8d607 (23:5607)
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 10 * 8 + 4
	ret z

	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0F
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, SPRITEANIMSTRUCT_0E
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.twentyseven ; 8d630 (23:5630)
	callba Function108bc7
	ret

.twentyeight ; 8d637 (23:5637)
	callba Function108be0
	ret

.twentynine ; 8d63e (23:563e)
	ld a, [wcf65]
	and a
	jr nz, .asm_8d645
	ret
.asm_8d645
	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], $0

	ld hl, SPRITEANIMSTRUCT_0D
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	ld a, $36
	call _ReinitSpriteAnimFrame
	ret

.thirty ; 8d666 (23:5666)
	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	cp $14
	jr nc, .asm_8d67f
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
.asm_8d67f
	ret

.thirtytwo ; 8d680 (23:5680)
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld d, [hl]
	inc [hl]
	inc [hl]
	inc [hl]

	ld hl, SPRITEANIMSTRUCT_0C
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .Sprites_Sine

	ld hl, SPRITEANIMSTRUCT_YOFFSET
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .Sprites_Cosine

	ld hl, SPRITEANIMSTRUCT_XOFFSET
	add hl, bc
	ld [hl], a
	ret

.thirtythree ; 8d6a2 (23:56a2)
	ld a, [wcf64]
	cp $40
	ret nz
	ld a, $3d
	call _ReinitSpriteAnimFrame
	ret

.thirtyfour ; 8d6ae (23:56ae)
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	add $10
	ld [hl], a
	ret

.twentysix ; 8d6b7 (23:56b7)
	callba AnimateEZChatCursor
	ret

.thirtyone ; 8d6be (23:56be)
	callba UpdateCelebiPosition
	ret

.AnonymousJumptable: ; 8d6c5 (23:56c5)
	ld hl, [sp+$0]
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de

	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, hl
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 8d6d8 (23:56d8)

.IncrementJumptableIndex: ; 8d6d8
	ld hl, SPRITEANIMSTRUCT_JUMPTABLE_INDEX
	add hl, bc
	inc [hl]
	ret
; 8d6de

.Sprites_Sine: ; 8d6de (23:56de)
	call Sprites_Sine
	ret

.Sprites_Cosine: ; 8d6e2 (23:56e2)
	call Sprites_Cosine
	ret
; 8d6e6 (23:56e6)
