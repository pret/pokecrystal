Function8cf53: ; 8cf53
	ld hl, wc300
	ld bc, wc3c1 - wc300
.loop
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; 8cf62

Function8cf62: ; 8cf62
	call PlaySpriteAnimations
	call DelayFrame
	ret
; 8cf69

PlaySpriteAnimations: ; 8cf69
	push hl
	push de
	push bc
	push af

	ld a, $0
	ld [wc3b5], a
	call DoNextFrameForAllSprites

	pop af
	pop bc
	pop de
	pop hl
	ret
; 8cf7a

DoNextFrameForAllSprites: ; 8cf7a
	ld hl, wSpriteAnimationStructs
	ld e, 10 ; There are 10 structs here.

.loop
	ld a, [hl]
	and a
	jr z, .next ; This struct is deinitialized.
	ld c, l
	ld b, h
	push hl
	push de
	call Function8d24b ; Uses a massive jumptable
	call Function8d04c
	pop de
	pop hl
	jr c, .done

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wc3b5]
	ld l, a
	ld h, Sprites / $0100

.loop2 ; Clear (Sprites + [wc3b5] --> SpritesEnd)
	ld a, l
	cp SpritesEnd % $100
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret
; 8cfa8

Function8cfa8: ; 8cfa8 (23:4fa8)
	ld hl, wSpriteAnimationStructs
	ld e, 10

.loop
	ld a, [hl]
	and a
	jr z, .next
	ld c, l
	ld b, h
	push hl
	push de
	call Function8d24b ; Uses a massive jumptable
	call Function8d04c
	pop de
	pop hl
	jr c, .done

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop

	ld a, [wc3b5]
	ld l, a
	ld h, (Sprites + $40) / $100

.loop2 ; Clear (Sprites + [wc3b5] --> Sprites + $40)
	ld a, l
	cp (Sprites + $40) % $100
	jr nc, .done
	xor a
	ld [hli], a
	jr .loop2

.done
	ret

InitSpriteAnimStruct:: ; 8cfd6
; Find if there's any room in the wSpriteAnimationStructs array, which is 10x16
	push de
	push af
	ld hl, wSpriteAnimationStructs
	ld e, 10
.loop
	ld a, [hl]
	and a
	jr z, .found
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
; We've reached the end.  There is no more room here.
; Return carry.
	pop af
	pop de
	scf
	ret

.found
; Back up the structure address to bc.
	ld c, l
	ld b, h
; Value [wc3b4] is initially set to -1. Set it to
; the number of objects loaded into this array.
	ld hl, wc3b4
	inc [hl]
	ld a, [hl]
	and a
	jr nz, .initialized
	inc [hl]

.initialized
; Get row a of Unknown_8d1c4, copy the pointer into de
	pop af
	ld e, a
	ld d, 0
	ld hl, Unknown_8d1c4
rept 3
	add hl, de
endr
	ld e, l
	ld d, h
; Set hl to the first field (field 0) in the current structure.
	ld hl, 0
	add hl, bc
; Load the index.
	ld a, [wc3b4]
	ld [hli], a
; Copy the table entry to the next two fields.
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
; Look up the third field from the table in the wc300 array (10x2).
; Take the value and load it in 
	ld a, [de]
	call LookUpInwSpriteAnimDict
	ld [hli], a
	pop de
; Set hl to field 4.  Kinda pointless, because we're presumably already here.
	ld hl, $4
	add hl, bc
; Load the original value of de into here.
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
; load 0 into the next four fields
	xor a
rept 2
	ld [hli], a
endr
	xor a
rept 2
	ld [hli], a
endr
; load -1 into the next field
	dec a
	ld [hli], a
; load 0 into the last five fields
	xor a
rept 4
	ld [hli], a
endr
	ld [hl], a
; back up the address of the first field to wc3b8
	ld a, c
	ld [wc3b8], a
	ld a, b
	ld [wc3b8 + 1], a
	ret
; 8d036

Function8d036: ; 8d036
; Clear the index field of the struct in bc.
	ld hl, 0
	add hl, bc
	ld [hl], $0
	ret
; 8d03d


Function8d03d: ; 8d03d (23:503d)
; Clear the index field of every struct in the wSpriteAnimationStructs array.
	ld hl, wSpriteAnimationStructs
	ld bc, $10
	ld e, 10
	xor a
.loop
	ld [hl], a
	add hl, bc
	dec e
	jr nz, .loop
	ret


Function8d04c: ; 8d04c
	call Function8d0ec ; init WRAM
	call Function8d132 ; read from a memory array
	cp -3
	jr z, .done
	cp -4
	jr z, .almost
	call Function8d1a2 ; OAM?
	ld a, [wc3ba]
	add [hl]
	ld [wc3ba], a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld a, [wc3b5]
	ld e, a
	ld d, Sprites / $100
	ld a, [hli]
	ld c, a
.loop
	ld a, [wc3bc]
	ld b, a
	ld a, [wc3be]
	add b
	ld b, a
	ld a, [wc3bf]
	add b
	ld b, a
	call Function8d0be
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3bb]
	ld b, a
	ld a, [wc3bd]
	add b
	ld b, a
	ld a, [wc3c0]
	add b
	ld b, a
	call Function8d0ce
	add b
	ld [de], a
	inc hl
	inc de
	ld a, [wc3ba]
	add [hl]
	ld [de], a
	inc hl
	inc de
	call Function8d0de
	ld [de], a
	inc hl
	inc de
	ld a, e
	ld [wc3b5], a
	cp SpritesEnd % $100
	jr nc, .outofroom
	dec c
	jr nz, .loop
	pop bc
	jr .done

.almost
	call Function8d036

.done
	and a
	ret

.outofroom
	pop bc
	scf
	ret
; 8d0be

Function8d0be: ; 8d0be
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 6, [hl]
	jr z, .ok
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0ce

Function8d0ce: ; 8d0ce
	push hl
	ld a, [hl]
	ld hl, wc3b8
	bit 5, [hl]
	jr z, .ok
	add $8
	xor $ff
	inc a

.ok
	pop hl
	ret
; 8d0de

Function8d0de: ; 8d0de
	ld a, [wc3b8]
	ld b, a
	ld a, [hl]
	xor b
	and $e0
	ld b, a
	ld a, [hl]
	and $1f
	or b
	ret
; 8d0ec

Function8d0ec: ; 8d0ec
	xor a
	ld [wc3b8], a
	ld hl, $3
	add hl, bc
	ld a, [hli]
	ld [wc3ba], a
	ld a, [hli]
	ld [wc3bb], a
	ld a, [hli]
	ld [wc3bc], a
	ld a, [hli]
	ld [wc3bd], a
	ld a, [hli]
	ld [wc3be], a
	ret
; 8d109

LookUpInwSpriteAnimDict: ; 8d109
; a = wSpriteAnimDict[a] if a in wSpriteAnimDict else 0
	push hl
	push bc
	ld hl, wSpriteAnimDict
	ld b, a
	ld c, 10
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc hl
	dec c
	jr nz, .loop
	xor a
	jr .done

.ok
	ld a, [hl]

.done
	pop bc
	pop hl
	ret
; 8d120

Function8d120:: ; 8d120
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $8
	add hl, bc
	ld [hl], $0
	ld hl, $a
	add hl, bc
	ld [hl], $ff
	ret
; 8d132


Function8d132: ; 8d132
.loop
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld a, [hl]
	and a
	jr z, .done ; finished the current sequence
	dec [hl]
	call Function8d189 ; load pointer from Unknown_8d6e6
	ld a, [hli]
	push af
	jr .okay

.done
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	inc [hl]
	call Function8d189 ; load pointer from Unknown_8d6e6
	ld a, [hli]
	cp $fe
	jr z, .minus_2
	cp $ff
	jr z, .minus_1

	push af
	ld a, [hl]
	push hl
	and $3f
	ld hl, SPRITEANIMSTRUCT_09
	add hl, bc
	add [hl]
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a
	pop hl
.okay
	ld a, [hl]
	and $c0
	srl a
	ld [wc3b8], a
	pop af
	ret

.minus_1
	xor a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a

	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
rept 2
	dec [hl]
endr
	jr .loop

.minus_2
	xor a
	ld hl, SPRITEANIMSTRUCT_DURATION
	add hl, bc
	ld [hl], a

	dec a
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld [hl], a
	jr .loop
; 8d189

Function8d189: ; 8d189
	; Get the data for the current frame for the current animation sequence

	; Unknown_8d6e6 + 2 * SpriteAnim[SPRITEANIMSTRUCT_01] + 3 * SpriteAnim[SPRITEANIMSTRUCT_FRAME]
	ld hl, SPRITEANIMSTRUCT_01
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, Unknown_8d6e6
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, de
	ret
; 8d1a2

Function8d1a2: ; 8d1a2
	ld e, a
	ld d, 0
	ld hl, Unknown_8d94d
rept 3
	add hl, de
endr
	ret
; 8d1ac

Function8d1ac: ; unreferenced
	push hl
	ld l, a
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Unknown_8e706 ; broken 2bpp pointers
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	push bc
	call Request2bpp
	pop bc
	ret
; 8d1c4

Unknown_8d1c4: ; 8d1c4
	db $01, SPRITE_ANIM_SEQ_01, $00 ; 00
	db $07, SPRITE_ANIM_SEQ_04, $00 ; 01
	db $08, SPRITE_ANIM_SEQ_05, $05 ; 02
	db $0a, SPRITE_ANIM_SEQ_06, $00 ; 03
	db $0b, SPRITE_ANIM_SEQ_07, $06 ; 04
	db $0c, SPRITE_ANIM_SEQ_08, $06 ; 05
	db $0d, SPRITE_ANIM_SEQ_09, $07 ; 06
	db $0e, SPRITE_ANIM_SEQ_0A, $07 ; 07
	db $10, SPRITE_ANIM_SEQ_0B, $07 ; 08
	db $08, SPRITE_ANIM_SEQ_0C, $05 ; 09
	db $11, SPRITE_ANIM_SEQ_00, $00 ; 0a
	db $12, SPRITE_ANIM_SEQ_0D, $08 ; 0b
	db $12, SPRITE_ANIM_SEQ_0E, $08 ; 0c
	db $12, SPRITE_ANIM_SEQ_0F, $08 ; 0d
	db $13, SPRITE_ANIM_SEQ_10, $00 ; 0e
	db $15, SPRITE_ANIM_SEQ_00, $00 ; 0f
	db $16, SPRITE_ANIM_SEQ_11, $00 ; 10
	db $17, SPRITE_ANIM_SEQ_12, $00 ; 11
	db $18, SPRITE_ANIM_SEQ_12, $00 ; 12
	db $19, SPRITE_ANIM_SEQ_13, $00 ; 13
	db $1a, SPRITE_ANIM_SEQ_14, $00 ; 14
	db $1b, SPRITE_ANIM_SEQ_00, $00 ; 15
	db $1d, SPRITE_ANIM_SEQ_15, $00 ; 16
	db $1e, SPRITE_ANIM_SEQ_00, $00 ; 17
	db $1d, SPRITE_ANIM_SEQ_17, $00 ; 18
	db $1f, SPRITE_ANIM_SEQ_00, $00 ; 19
	db $24, SPRITE_ANIM_SEQ_19, $00 ; 1a
	db $25, SPRITE_ANIM_SEQ_00, $00 ; 1b
	db $20, SPRITE_ANIM_SEQ_13, $00 ; 1c
	db $26, SPRITE_ANIM_SEQ_1A, $00 ; 1d
	db $2d, SPRITE_ANIM_SEQ_00, $00 ; 1e
	db $2e, SPRITE_ANIM_SEQ_00, $00 ; 1f
	db $2f, SPRITE_ANIM_SEQ_00, $00 ; 20
	db $30, SPRITE_ANIM_SEQ_00, $00 ; 21
	db $31, SPRITE_ANIM_SEQ_00, $00 ; 22
	db $32, SPRITE_ANIM_SEQ_1B, $00 ; 23
	db $33, SPRITE_ANIM_SEQ_1C, $00 ; 24
	db $34, SPRITE_ANIM_SEQ_00, $00 ; 25
	db $35, SPRITE_ANIM_SEQ_1D, $00 ; 26
	db $37, SPRITE_ANIM_SEQ_1E, $00 ; 27
	db $38, SPRITE_ANIM_SEQ_1E, $00 ; 28
	db $39, SPRITE_ANIM_SEQ_20, $00 ; 29
	db $3f, SPRITE_ANIM_SEQ_21, $00 ; 2a
	db $3e, SPRITE_ANIM_SEQ_22, $00 ; 2b
	db $40, SPRITE_ANIM_SEQ_00, $00 ; 2c
; 8d24b


Function8d24b: ; 8d24b
	ld hl, $2 ; field 2, see the second column in the above table
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, .Jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8d25b


.Jumptable: ; 8d25b (23:525b)
	dw .zero        ; town map
	dw .one         ; bouncing mon icons
	dw .two
	dw .three
	dw .four
	dw .five
	dw .six         ; Game Freak logo
	dw .seven
	dw .eight
	dw .nine
	dw .ten
	dw .eleven
	dw .twelve      ; blinking cursor
	dw .thirteen
	dw .fourteen
	dw .fifteen
	dw .sixteen
	dw .seventeen
	dw .eighteen
	dw .nineteen    ; finish egg hatching animation
	dw .twenty
	dw .twentyone
	dw .twentytwo   ; flying sprite
	dw .twentythree ; flying leaves
	dw .twentyfour
	dw .twentyfive
	dw .twentysix
	dw .twentyseven
	dw .twentyeight
	dw .twentynine  ; intro suicune
	dw .thirty      ; intro pichu wooper
	dw .thirtyone
	dw .thirtytwo   ; intro unown
	dw .thirtythree ; intro unown F with suicune leaping up
	dw .thirtyfour  ; intro suicune facing away from us


.zero: ; 8d2a1 (23:52a1)
	ret

.one: ; 8d2a2 (23:52a2)
	ld a, [MenuSelection2]
	ld hl, 0
	add hl, bc
	cp [hl]
	jr z, .two
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ret

.two: ; 8d2b9 (23:52b9)
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld d, a
	inc [hl]
	and $f
	ret nz
	ld hl, $d
	add hl, bc
	ld e, [hl]
	ld hl, $7
	add hl, bc
	ld a, d
	and $10 ; bit 4
	jr z, .asm_8d2df
	ld a, e
	and a
	jr z, .asm_8d2e6
	cp $1
	jr z, .asm_8d2e2
.asm_8d2df
	xor a
	ld [hl], a
	ret
.asm_8d2e2
	ld a, $ff
	ld [hl], a
	ret
.asm_8d2e6
	ld a, $fe
	ld [hl], a
	ret

.three: ; 8d2ea (23:52ea)
	ld a, [MenuSelection2]
	ld hl, 0
	add hl, bc
	cp [hl]
	jr z, .asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $10
	ret
.asm_8d2fb
	ld hl, $4
	add hl, bc
	ld [hl], $18
	ret

.four: ; 8d302 (23:5302)
	call .anonymous_jumptable
	jp [hl]
; 8d306 (23:5306)

; Anonymous jumptable (see .anonymous_jumptable)
	dw .four_zero
	dw .four_one
; 8d30a

.four_zero: ; 8d30a
	call .asm_8d6d8
	ld hl, 0
	add hl, bc
	ld a, [hl]
	ld hl, $d
	add hl, bc
	and $3
	ld [hl], a
	inc [hl]
	swap a
	ld hl, $c
	add hl, bc
	ld [hl], a

.four_one: ; 8d321
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $a4
	jr nc, .asm_8d356
	ld hl, $d
	add hl, bc
	add $4
	ld hl, $4
	add hl, bc
	ld [hl], a
	ld hl, $5
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld a, [hl]
	sla a
	sla a
	ld d, $2
	ld hl, $c
	add hl, bc
	ld a, [hl]
	add $3
	ld [hl], a
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.asm_8d356
	call Function8d036
	ret
; 8d35a

.twentyfive: ; 8d35a (23:535a)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, $2
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.five: ; 8d36c (23:536c)
	callab Function11a3b
	ret

.twelve: ; 8d373 (23:5373)
	callab Function120c1
	ret

.six: ; 8d37a (23:537a)
	callab GameFreakLogoJumper
	ret

.seven: ; 8d381 (23:5381)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d3ba
rept 2
	dec [hl]
endr
	ld d, a
	and $1f
	jr nz, .asm_8d395
	ld hl, $d
	add hl, bc
	dec [hl]
.asm_8d395
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld hl, $b
	add hl, bc
	add [hl]
	ld [hl], a
	ret
.asm_8d3ba
	ld a, $1
	ld [wcf64], a
	call Function8d036
	ret

.eight: ; 8d3c3 (23:53c3)
	ld hl, $c
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .asm_8d41e
	ld hl, $f
	add hl, bc
	ld d, [hl]
	ld hl, $b
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $e
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	ld e, l
	ld d, h
	ld hl, $e
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, -$10
	add hl, de
	ld e, l
	ld d, h
	ld hl, $c
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $b
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a
	ret
.asm_8d41e
	call Function8d036
	ret

.nine: ; 8d422 (23:5422)
	callab Function9321d
	ret

.ten: ; 8d429 (23:5429)
	callab Function932ac
	ld hl, wcf64
	ld a, [hl]
	cp $2
	ret nz
	ld [hl], $3
	ld a, $f
	call Function8d120
	ret

.eleven: ; 8d43e (23:543e)
	ld hl, $b
	add hl, bc
	ld a, [hl]
	dec [hl]
	ld e, a
	and $1
	jr z, .asm_8d462
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $78
	jr c, .asm_8d461
	call Function8d036
	ld a, $4
	ld [wcf64], a
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ret
.asm_8d461
	inc [hl]
.asm_8d462
	ld a, e
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.thirteen: ; 8d46e (23:546e)
	callab ret_e00ed
	ret

.fifteen: ; 8d475 (23:5475)
	callab Function90d41
	ret

.fourteen: ; 8d47c (23:547c)
	callab Functione21a1
	ret

.sixteen: ; 8d483 (23:5483)
	call .anonymous_jumptable
	jp [hl]
; 8d487 (23:5487)

; Anonymous jumptable (see .anonymous_jumptable)
	dw .sixteen_zero
	dw .sixteen_one
	dw .sixteen_two
	dw .sixteen_three
	dw .sixteen_four
	dw .sixteen_five
; 8d493

.sixteen_zero: ; 8d493
	ld a, $14
	call Function8d120
	ld hl, $b
	add hl, bc
	ld [hl], $2
	ld hl, $c
	add hl, bc
	ld [hl], $20
	ret
; 8d4a5

.sixteen_two: ; 8d4a5
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d4af
	dec [hl]
	ret

.asm_8d4af
	call .asm_8d6d8
	ld hl, $c
	add hl, bc
	ld [hl], $40

.sixteen_three: ; 8d4b8
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $30
	jr c, .asm_8d4cd
	dec [hl]
	ld d, $28
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

.asm_8d4cd
	ld de, SFX_GOT_SAFARI_BALLS
	call PlaySFX
	jr .sixteen_five
; 8d4d5

.sixteen_one: ; 8d4d5
	ld hl, $b
	add hl, bc
	ld [hl], $4
	ld hl, $c
	add hl, bc
	ld [hl], $30
	ld hl, $d
	add hl, bc
	ld [hl], $24
	ret
; 8d4e8

.sixteen_four: ; 8d4e8
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_8d51c
	ld d, a
	ld hl, $c
	add hl, bc
	ld a, [hl]
	call ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	inc [hl]
	ld a, [hl]
	and $3f
	ret nz
	ld hl, $c
	add hl, bc
	ld [hl], $20
	ld hl, $d
	add hl, bc
	ld a, [hl]
	sub $c
	ld [hl], a
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

.asm_8d51c
	xor a
	ld hl, $7
	add hl, bc
	ld [hl], a
	call .asm_8d6d8
	ret

.sixteen_five: ; 8d526
	call Function8d036
	ret
; 8d52a

.seventeen: ; 8d52a (23:552a)
	ld hl, $4
	add hl, bc
	ld a, [hl]
rept 2
	inc [hl]
endr
	cp $b0
	jr nc, .asm_8d53f
	and $3
	ret nz
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

.asm_8d53f
	call Function8d036
	ret

.eighteen: ; 8d543 (23:5543)
	callab Function29676
	ret

.nineteen: ; 8d54a (23:554a)
	ld hl, SpriteAnim1Sprite0c - SpriteAnim1
	add hl, bc
	ld a, [hl]
	cp $80
	jr nc, .finish_nineteen
	ld d, a
	add $8
	ld [hl], a
	ld hl, SpriteAnim1Sprite0b - SpriteAnim1
	add hl, bc
	ld a, [hl]
	xor $20
	ld [hl], a

	push af
	push de
	call .ApplyYOffset
	ld hl, SpriteAnim1YOffset - SpriteAnim1
	add hl, bc
	ld [hl], a

	pop de
	pop af
	call .ApplyXOffset
	ld hl, SpriteAnim1XOffset - SpriteAnim1
	add hl, bc
	ld [hl], a
	ret

.finish_nineteen
	call Function8d036
	ret

.twenty: ; 8d578 (23:5578)
	callab Function91640
	ret

.twentyone: ; 8d57f (23:557f)
	ld hl, $d
	add hl, bc
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $80
	add hl, de
	ld e, l
	ld d, h
	ld hl, $d
	add hl, bc
	ld [hl], e
	inc hl
	ld [hl], d
	ld hl, $c
	add hl, bc
	ld a, [hl]
rept 3
	inc [hl]
endr
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentytwo: ; 8d5b0 (23:55b0)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	and a
	ret z
	ld hl, $d
	add hl, bc
	ld a, [hl]
	inc [hl]
	cp $40
	ret c
	ld hl, $5
	add hl, bc
rept 2
	dec [hl]
endr
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $40
	jr nc, .asm_8d5d3
	add $8
	ld [hl], a
.asm_8d5d3
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentythree: ; 8d5e2 (23:55e2)
	ld hl, $4
	add hl, bc
	ld a, [hl]
	cp $b8
	jr nc, .asm_8d603
rept 2
	inc [hl]
endr
	ld hl, $5
	add hl, bc
	dec [hl]
	ld d, $40
	ld hl, $c
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret
.asm_8d603
	call Function8d036
	ret

.twentyfour: ; 8d607 (23:5607)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $54
	ret z
	ld hl, $5
	add hl, bc
rept 2
	inc [hl]
endr
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	jr z, .asm_8d621
	sub $2
	ld [hl], a
.asm_8d621
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.twentyseven: ; 8d630 (23:5630)
	callba Function108bc7
	ret

.twentyeight: ; 8d637 (23:5637)
	callba Function108be0
	ret

.twentynine: ; 8d63e (23:563e)
	ld a, [wcf65]
	and a
	jr nz, .asm_8d645
	ret
.asm_8d645
	ld hl, $7
	add hl, bc
	ld [hl], $0
	ld hl, $d
	add hl, bc
	ld a, [hl]
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	ld a, $36
	call Function8d120
	ret

.thirty: ; 8d666 (23:5666)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $14
	jr nc, .asm_8d67f
	add $2
	ld [hl], a
	xor $ff
	inc a
	ld d, $20
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
.asm_8d67f
	ret

.thirtytwo: ; 8d680 (23:5680)
	ld hl, $b
	add hl, bc
	ld d, [hl]
rept 3
	inc [hl]
endr
	ld hl, $c
	add hl, bc
	ld a, [hl]
	push af
	push de
	call .ApplyYOffset
	ld hl, $7
	add hl, bc
	ld [hl], a
	pop de
	pop af
	call .ApplyXOffset
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret

.thirtythree: ; 8d6a2 (23:56a2)
	ld a, [wcf64]
	cp $40
	ret nz
	ld a, $3d
	call Function8d120
	ret

.thirtyfour: ; 8d6ae (23:56ae)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	add $10
	ld [hl], a
	ret

.twentysix: ; 8d6b7 (23:56b7)
	callba Function11d0b6
	ret

.thirtyone: ; 8d6be (23:56be)
	callba Function49aa2
	ret

.anonymous_jumptable: ; 8d6c5 (23:56c5)
	ld hl, [sp+$0]
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc de
	ld hl, $b
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

.asm_8d6d8: ; 8d6d8
	ld hl, $b
	add hl, bc
	inc [hl]
	ret
; 8d6de

.ApplyYOffset: ; 8d6de (23:56de)
	call ApplyYOffset
	ret

.ApplyXOffset: ; 8d6e2 (23:56e2)
	call ApplyXOffset
	ret
; 8d6e6 (23:56e6)

Unknown_8d6e6: ; 8d6e6
	dw Unknown_8d76a ; 00
	dw Unknown_8d76d ; 01
	dw Unknown_8d772 ; 02
	dw Unknown_8d777 ; 03
	dw Unknown_8d77c ; 04
	dw Unknown_8d781 ; 05
	dw Unknown_8d786 ; 06
	dw Unknown_8d7a6 ; 07
	dw Unknown_8d7ab ; 08
	dw Unknown_8d7b0 ; 09
	dw Unknown_8d7b5 ; 0a
	dw Unknown_8d7d4 ; 0b
	dw Unknown_8d7d9 ; 0c
	dw Unknown_8d7e2 ; 0d
	dw Unknown_8d7eb ; 0e
	dw Unknown_8d7f4 ; 0f
	dw Unknown_8d7ff ; 10
	dw Unknown_8d78b ; 11
	dw Unknown_8d802 ; 12
	dw Unknown_8d805 ; 13
	dw Unknown_8d808 ; 14
	dw Unknown_8d811 ; 15
	dw Unknown_8d818 ; 16
	dw Unknown_8d81d ; 17
	dw Unknown_8d822 ; 18
	dw Unknown_8d825 ; 19
	dw Unknown_8d82c ; 1a
	dw Unknown_8d82f ; 1b
	dw Unknown_8d861 ; 1c
	dw Unknown_8d864 ; 1d
	dw Unknown_8d867 ; 1e
	dw Unknown_8d874 ; 1f
	dw Unknown_8d877 ; 20
	dw Unknown_8d87a ; 21
	dw Unknown_8d87d ; 22
	dw Unknown_8d880 ; 23
	dw Unknown_8d883 ; 24
	dw Unknown_8d890 ; 25
	dw Unknown_8d899 ; 26
	dw Unknown_8d89c ; 27
	dw Unknown_8d89f ; 28
	dw Unknown_8d8a2 ; 29
	dw Unknown_8d8a5 ; 2a
	dw Unknown_8d8a8 ; 2b
	dw Unknown_8d8ab ; 2c
	dw Unknown_8d794 ; 2d
	dw Unknown_8d79d ; 2e
	dw Unknown_8d8ae ; 2f
	dw Unknown_8d8cd ; 30
	dw Unknown_8d8ec ; 31
	dw Unknown_8d8f1 ; 32
	dw Unknown_8d8f4 ; 33
	dw Unknown_8d8f7 ; 34
	dw Unknown_8d8fe ; 35
	dw Unknown_8d907 ; 36
	dw Unknown_8d90c ; 37
	dw Unknown_8d913 ; 38
	dw Unknown_8d916 ; 39
	dw Unknown_8d91d ; 3a
	dw Unknown_8d924 ; 3b
	dw Unknown_8d92b ; 3c
	dw Unknown_8d932 ; 3d
	dw Unknown_8d93d ; 3e
	dw Unknown_8d940 ; 3f
	dw Unknown_8d943 ; 40
	dw Unknown_8d948 ; 41
; 8d76a

Unknown_8d76a: 	dw $2000
                db -1
Unknown_8d76d: 	dw $0800, $0801
                db -2
Unknown_8d772: 	dw $083d, $083e
                db -2
Unknown_8d777: 	dw $083f, $0840
                db -2
Unknown_8d77c: 	dw $0400, $0401
                db -2
Unknown_8d781: 	dw $043d, $043e
                db -2
Unknown_8d786: 	dw $043f, $0440
                db -2
Unknown_8d78b: 	dw $0800, $0801, $0800, $4801
                db -2
Unknown_8d794: 	dw $0863, $0864, $0863, $4864
                db -2
Unknown_8d79d: 	dw $0865, $0866, $0865, $4866
                db -2
Unknown_8d7a6: 	dw $011e, $011f
                db -2
Unknown_8d7ab: 	dw $0120, $01fd
                db -2
Unknown_8d7b0: 	dw $0121, $01fd
                db -2
Unknown_8d7b5: 	dw $0c81, $0182, $0183, $0482, $0c81, $0c82, $0483, $2084, $0385, $0386, $0487, $0488, $0489, $0a8a, $078b
                db -1
Unknown_8d7d4: 	dw $0323, $8323
                db -2
Unknown_8d7d9: 	dw $0224, $0225, $0226, $0225
                db -2
Unknown_8d7e2: 	dw $0727, $0728, $8727, $4728
                db -2
Unknown_8d7eb: 	dw $0729, $072a, $0729, $072b
                db -2
Unknown_8d7f4: 	dw $0729, $072c, $072d, $072c, $0729
                db -1
Unknown_8d7ff: 	dw $142e
                db -1
Unknown_8d802: 	dw $202f
                db -1
Unknown_8d805: 	dw $2030
                db -1
Unknown_8d808: 	dw $0330, $0331, $0330, $4331
                db -2
Unknown_8d811: 	dw $0432, $0433, $0434
                db -4
Unknown_8d818: 	dw $0335, $0336
                db -2
Unknown_8d81d: 	dw $0737, $0738
                db -2
Unknown_8d822: 	dw $2039
                db -1
Unknown_8d825: 	dw $023b, $023a, $023b
                db -1
Unknown_8d82c: 	dw $203c
                db -1
Unknown_8d82f: 	dw $0841, $0842, $0841, $4842
                db -2
                dw $0843, $0844
                db -2
                dw $0845, $0846
                db -2
                dw $0847, $0848
                db -2
                dw $0149, $4149, $c149, $8149
                db -2
                dw $204a
                db -1
                dw $204b
                db -1
                dw $204c
                db -1
                dw $204d
                db -1
                dw $034e, $03fd
                db -2
Unknown_8d861: 	dw $20fd
                db -1
Unknown_8d864: 	dw $204f
                db -1
Unknown_8d867: 	dw $0250, $1051, $01fd, $0152, $01fd, $0153
                db -4
Unknown_8d874: 	dw $2054
                db -1
Unknown_8d877: 	dw $2055
                db -1
Unknown_8d87a: 	dw $6055
                db -1
Unknown_8d87d: 	dw $a055
                db -1
Unknown_8d880: 	dw $e055
                db -1
Unknown_8d883: 	dw $0a56, $0957, $0a58, $0a59, $0958, $0a5a
                db -2
Unknown_8d890: 	dw $0250, $025b, $0250, $425b
                db -2
Unknown_8d899: 	dw $025c
                db -1
Unknown_8d89c: 	dw $025d
                db -1
Unknown_8d89f: 	dw $025e
                db -1
Unknown_8d8a2: 	dw $025f
                db -1
Unknown_8d8a5: 	dw $0260
                db -1
Unknown_8d8a8: 	dw $0261
                db -1
Unknown_8d8ab: 	dw $0262
                db -1
Unknown_8d8ae: 	dw $0332, $0333, $0334, $0330, $0331, $0330, $4331, $0330, $0331, $0330, $4331, $0330, $0331, $0330, $4331
                db -1
Unknown_8d8cd: 	dw $0330, $0331, $0330, $4331, $0330, $0331, $0330, $4331, $0330, $0331, $0330, $4331, $0332, $0333, $0334
                db -4
Unknown_8d8ec: 	dw $0367, $0368
                db -2
Unknown_8d8f1: 	dw $036c
                db -1
Unknown_8d8f4: 	dw $036d
                db -1
Unknown_8d8f7: 	dw $0269, $026a, $026b
                db -4
Unknown_8d8fe: 	dw $036e, $036f, $0370, $0371
                db -2
Unknown_8d907: 	dw $0371, $076e
                db -1
Unknown_8d90c: 	dw $2072, $0773, $0774
                db -1
Unknown_8d913: 	dw $0375
                db -1
Unknown_8d916: 	dw $0376, $0377, $0778
                db -4
Unknown_8d91d: 	dw $4376, $4377, $4778
                db -4
Unknown_8d924: 	dw $8376, $8377, $8778
                db -4
Unknown_8d92b: 	dw $c376, $c377, $c778
                db -4
Unknown_8d932: 	dw $0379, $037a, $037b, $077c, $077d
                db -1
Unknown_8d93d: 	dw $037e
                db -1
Unknown_8d940: 	dw $00fd
                db -1
Unknown_8d943: 	dw $087f, $0880
                db -1
Unknown_8d948: 	dw $487f, $4880
                db -1
; 8d94d

Unknown_8d94d: ; 8d94d
	dbw $00, Unknown_8dd8a ; 00
	dbw $04, Unknown_8dd8a ; 01
	dbw $4c, Unknown_8daf1 ; 02
	dbw $5c, Unknown_8daf1 ; 03
	dbw $6c, Unknown_8daf6 ; 04
	dbw $6e, Unknown_8daf6 ; 05
	dbw $2d, Unknown_8ddf0 ; 06
	dbw $4d, Unknown_8ddf0 ; 07
	dbw $60, Unknown_8de09 ; 08
	dbw $00, Unknown_8de09 ; 09
	dbw $00, Unknown_8de09 ; 0a
	dbw $06, Unknown_8de09 ; 0b
	dbw $0c, Unknown_8de7e ; 0c
	dbw $0d, Unknown_8daf1 ; 0d
	dbw $00, Unknown_8dc53 ; 0e
	dbw $04, Unknown_8dc53 ; 0f
	dbw $08, Unknown_8dc53 ; 10
	dbw $40, Unknown_8dc53 ; 11
	dbw $44, Unknown_8dc53 ; 12
	dbw $48, Unknown_8dc53 ; 13
	dbw $4c, Unknown_8dc53 ; 14
	dbw $80, Unknown_8de87 ; 15
	dbw $85, Unknown_8de87 ; 16
	dbw $8a, Unknown_8de87 ; 17
	dbw $00, Unknown_8db29 ; 18
	dbw $01, Unknown_8db5c ; 19
	dbw $09, Unknown_8db9d ; 1a
	dbw $10, Unknown_8dc94 ; 1b
	dbw $29, Unknown_8dc94 ; 1c
	dbw $42, Unknown_8dc94 ; 1d
	dbw $f8, Unknown_8e17e ; 1e
	dbw $fa, Unknown_8e17e ; 1f
	dbw $00, Unknown_8deb2 ; 20
	dbw $00, Unknown_8dec3 ; 21
	dbw $00, Unknown_8deec ; 22
	dbw $0f, Unknown_8db07 ; 23
	dbw $11, Unknown_8daf1 ; 24
	dbw $12, Unknown_8daf1 ; 25
	dbw $13, Unknown_8daf1 ; 26
	dbw $00, Unknown_8df29 ; 27
	dbw $08, Unknown_8df29 ; 28
	dbw $10, Unknown_8df42 ; 29
	dbw $10, Unknown_8df5b ; 2a
	dbw $10, Unknown_8df74 ; 2b
	dbw $10, Unknown_8df8d ; 2c
	dbw $10, Unknown_8dfa6 ; 2d
	dbw $3a, Unknown_8daf1 ; 2e
	dbw $00, Unknown_8dd8a ; 2f
	dbw $00, Unknown_8db18 ; 30
	dbw $02, Unknown_8dd9b ; 31
	dbw $06, Unknown_8db5c ; 32
	dbw $0a, Unknown_8db5c ; 33
	dbw $0e, Unknown_8db5c ; 34
	dbw $12, Unknown_8db3a ; 35
	dbw $13, Unknown_8db3a ; 36
	dbw $00, Unknown_8dd8a ; 37
	dbw $04, Unknown_8dd8a ; 38
	dbw $10, Unknown_8db5c ; 39
	dbw $00, Unknown_8dd9b ; 3a
	dbw $04, Unknown_8daf1 ; 3b
	dbw $00, Unknown_8dfbf ; 3c
	dbw $00, Unknown_8ddac ; 3d
	dbw $00, Unknown_8ddbd ; 3e
	dbw $00, Unknown_8ddce ; 3f
	dbw $00, Unknown_8dddf ; 40
	dbw $00, Unknown_8dd9b ; 41
	dbw $04, Unknown_8dd9b ; 42
	dbw $00, Unknown_8dc2e ; 43
	dbw $30, Unknown_8dc2e ; 44
	dbw $03, Unknown_8dc2e ; 45
	dbw $33, Unknown_8dc2e ; 46
	dbw $06, Unknown_8dc2e ; 47
	dbw $36, Unknown_8dc2e ; 48
	dbw $09, Unknown_8dc2e ; 49
	dbw $39, Unknown_8dc2e ; 4a
	dbw $0c, Unknown_8dfcc ; 4b
	dbw $0c, Unknown_8dfe5 ; 4c
	dbw $3c, Unknown_8daf1 ; 4d
	dbw $3e, Unknown_8daf1 ; 4e
	dbw $00, Unknown_8de9c ; 4f
	dbw $00, Unknown_8dea1 ; 50
	dbw $00, Unknown_8dff6 ; 51
	dbw $00, Unknown_8e007 ; 52
	dbw $00, Unknown_8e018 ; 53
	dbw $00, Unknown_8daf1 ; 54
	dbw $01, Unknown_8daf1 ; 55
	dbw $00, Unknown_8e029 ; 56
	dbw $00, Unknown_8e076 ; 57
	dbw $00, Unknown_8e0b7 ; 58
	dbw $00, Unknown_8e0f4 ; 59
	dbw $00, Unknown_8e139 ; 5a
	dbw $04, Unknown_8dea1 ; 5b
	dbw $00, Unknown_8e183 ; 5c
	dbw $00, Unknown_8e1b4 ; 5d
	dbw $00, Unknown_8e1b9 ; 5e
	dbw $00, Unknown_8e1ca ; 5f
	dbw $00, Unknown_8e1eb ; 60
	dbw $00, Unknown_8e1f0 ; 61
	dbw $00, Unknown_8e1f9 ; 62
	dbw $00, Unknown_8e202 ; 63
	dbw $04, Unknown_8e202 ; 64
	dbw $00, Unknown_8e213 ; 65
	dbw $04, Unknown_8e213 ; 66
	dbw $20, Unknown_8e224 ; 67
	dbw $21, Unknown_8e224 ; 68
	dbw $22, Unknown_8e24b ; 69
	dbw $23, Unknown_8e25c ; 6a
	dbw $27, Unknown_8e27d ; 6b
	dbw $2a, Unknown_8e229 ; 6c
	dbw $2a, Unknown_8e23a ; 6d
	dbw $00, Unknown_8e2ae ; 6e
	dbw $08, Unknown_8e33f ; 6f
	dbw $60, Unknown_8e3b0 ; 70
	dbw $68, Unknown_8e429 ; 71
	dbw $00, Unknown_8e4a6 ; 72
	dbw $05, Unknown_8e4a6 ; 73
	dbw $0a, Unknown_8e4a6 ; 74
	dbw $50, Unknown_8e50b ; 75
	dbw $00, Unknown_8e54c ; 76
	dbw $01, Unknown_8e551 ; 77
	dbw $04, Unknown_8e55e ; 78
	dbw $00, Unknown_8db29 ; 79
	dbw $01, Unknown_8e57b ; 7a
	dbw $03, Unknown_8e59c ; 7b
	dbw $08, Unknown_8e5cd ; 7c
	dbw $1c, Unknown_8e5cd ; 7d
	dbw $80, Unknown_8e61e ; 7e
	dbw $00, Unknown_8e66f ; 7f
	dbw $04, Unknown_8e66f ; 80
	dbw $d0, Unknown_8e680 ; 81
	dbw $d3, Unknown_8e680 ; 82
	dbw $d6, Unknown_8e680 ; 83
	dbw $6c, Unknown_8e6a5 ; 84
	dbw $68, Unknown_8e6a5 ; 85
	dbw $64, Unknown_8e6a5 ; 86
	dbw $60, Unknown_8e6a5 ; 87
	dbw $0c, Unknown_8e6a5 ; 88
	dbw $08, Unknown_8e6a5 ; 89
	dbw $04, Unknown_8e6a5 ; 8a
	dbw $00, Unknown_8e6a5 ; 8b
; 8daf1


Unknown_8daf1: ; 8daf1
	db 1
	db $fc, $fc, $00, $00
; 8daf6

Unknown_8daf6: ; 8daf6
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $01, $00
	db $00, $f8, $10, $00
	db $00, $00, $11, $00
; 8db07

Unknown_8db07: ; 8db07
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $00, $20
	db $00, $f8, $01, $00
	db $00, $00, $01, $20
; 8db18

Unknown_8db18: ; 8db18
	db 4
	db $f8, $f8, $00, $80
	db $f8, $00, $00, $a0
	db $00, $f8, $01, $80
	db $00, $00, $01, $a0
; 8db29

Unknown_8db29: ; 8db29
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $00, $20
	db $00, $f8, $00, $40
	db $00, $00, $00, $60
; 8db3a

Unknown_8db3a: ; 8db3a
	db 4
	db $f8, $f8, $00, $07
	db $f8, $00, $00, $27
	db $00, $f8, $00, $47
	db $00, $00, $00, $67
; 8db4b

; 8db4b
	db 4
	db $f8, $f8, $00, $80
	db $f8, $00, $00, $a0
	db $00, $f8, $00, $c0
	db $00, $00, $00, $e0
; 8db5c

Unknown_8db5c: ; 8db5c
	db 16
	db $f0, $f0, $00, $00
	db $f0, $f8, $01, $00
	db $f8, $f0, $02, $00
	db $f8, $f8, $03, $00
	db $f0, $00, $01, $20
	db $f0, $08, $00, $20
	db $f8, $00, $03, $20
	db $f8, $08, $02, $20
	db $00, $f0, $02, $40
	db $00, $f8, $03, $40
	db $08, $f0, $00, $40
	db $08, $f8, $01, $40
	db $00, $00, $03, $60
	db $00, $08, $02, $60
	db $08, $00, $01, $60
	db $08, $08, $00, $60
; 8db9d

Unknown_8db9d: ; 8db9d
	db 36
	db $e8, $e8, $00, $00
	db $e8, $f0, $01, $00
	db $e8, $f8, $02, $00
	db $f0, $e8, $03, $00
	db $f0, $f0, $04, $00
	db $f0, $f8, $05, $00
	db $f8, $e8, $06, $00
	db $f8, $f0, $05, $00
	db $f8, $f8, $05, $00
	db $e8, $00, $02, $20
	db $e8, $08, $01, $20
	db $e8, $10, $00, $20
	db $f0, $00, $05, $20
	db $f0, $08, $04, $20
	db $f0, $10, $03, $20
	db $f8, $00, $05, $20
	db $f8, $08, $05, $20
	db $f8, $10, $06, $20
	db $00, $e8, $06, $40
	db $00, $f0, $05, $40
	db $00, $f8, $05, $40
	db $08, $e8, $03, $40
	db $08, $f0, $04, $40
	db $08, $f8, $05, $40
	db $10, $e8, $00, $40
	db $10, $f0, $01, $40
	db $10, $f8, $02, $40
	db $00, $00, $05, $60
	db $00, $08, $05, $60
	db $00, $10, $06, $60
	db $08, $00, $05, $60
	db $08, $08, $04, $60
	db $08, $10, $03, $60
	db $10, $00, $02, $60
	db $10, $08, $01, $60
	db $10, $10, $00, $60
; 8dc2e

Unknown_8dc2e: ; 8dc2e
	db 9
	db $f4, $f4, $00, $00
	db $f4, $fc, $01, $00
	db $f4, $04, $02, $00
	db $fc, $f4, $10, $00
	db $fc, $fc, $11, $00
	db $fc, $04, $12, $00
	db $04, $f4, $20, $00
	db $04, $fc, $21, $00
	db $04, $04, $22, $00
; 8dc53

Unknown_8dc53: ; 8dc53
	db 16
	db $f0, $f0, $00, $00
	db $f0, $f8, $01, $00
	db $f0, $00, $02, $00
	db $f0, $08, $03, $00
	db $f8, $f0, $10, $00
	db $f8, $f8, $11, $00
	db $f8, $00, $12, $00
	db $f8, $08, $13, $00
	db $00, $f0, $20, $00
	db $00, $f8, $21, $00
	db $00, $00, $22, $00
	db $00, $08, $23, $00
	db $08, $f0, $30, $00
	db $08, $f8, $31, $00
	db $08, $00, $32, $00
	db $08, $08, $33, $00
; 8dc94

Unknown_8dc94: ; 8dc94
	db 25
	db $ec, $ec, $00, $00
	db $f4, $ec, $01, $00
	db $fc, $ec, $02, $00
	db $04, $ec, $03, $00
	db $0c, $ec, $04, $00
	db $ec, $f4, $05, $00
	db $f4, $f4, $06, $00
	db $fc, $f4, $07, $00
	db $04, $f4, $08, $00
	db $0c, $f4, $09, $00
	db $ec, $fc, $0a, $00
	db $f4, $fc, $0b, $00
	db $fc, $fc, $0c, $00
	db $04, $fc, $0d, $00
	db $0c, $fc, $0e, $00
	db $ec, $04, $0f, $00
	db $f4, $04, $10, $00
	db $fc, $04, $11, $00
	db $04, $04, $12, $00
	db $0c, $04, $13, $00
	db $ec, $0c, $14, $00
	db $f4, $0c, $15, $00
	db $fc, $0c, $16, $00
	db $04, $0c, $17, $00
	db $0c, $0c, $18, $00
; 8dcf9

; 8dcf9
	db 36
	db $e8, $e8, $00, $00
	db $e8, $f0, $01, $00
	db $e8, $f8, $02, $00
	db $e8, $00, $03, $00
	db $e8, $08, $04, $00
	db $e8, $10, $05, $00
	db $f0, $e8, $06, $00
	db $f0, $f0, $07, $00
	db $f0, $f8, $08, $00
	db $f0, $00, $09, $00
	db $f0, $08, $0a, $00
	db $f0, $10, $0b, $00
	db $f8, $e8, $0c, $00
	db $f8, $f0, $0d, $00
	db $f8, $f8, $0e, $00
	db $f8, $00, $0f, $00
	db $f8, $08, $10, $00
	db $f8, $10, $11, $00
	db $00, $e8, $12, $00
	db $00, $f0, $13, $00
	db $00, $f8, $14, $00
	db $00, $00, $15, $00
	db $00, $08, $16, $00
	db $00, $10, $17, $00
	db $08, $e8, $18, $00
	db $08, $f0, $19, $00
	db $08, $f8, $1a, $00
	db $08, $00, $1b, $00
	db $08, $08, $1c, $00
	db $08, $10, $1d, $00
	db $10, $e8, $1e, $00
	db $10, $f0, $1f, $00
	db $10, $f8, $20, $00
	db $10, $00, $21, $00
	db $10, $08, $22, $00
	db $10, $10, $23, $00
; 8dd8a

Unknown_8dd8a: ; 8dd8a
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $01, $00
	db $00, $f8, $02, $00
	db $00, $00, $03, $00
; 8dd9b

Unknown_8dd9b: ; 8dd9b
	db 4
	db $f8, $f8, $00, $80
	db $f8, $00, $01, $80
	db $00, $f8, $02, $80
	db $00, $00, $03, $80
; 8ddac

Unknown_8ddac: ; 8ddac
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $01, $00
	db $00, $f8, $08, $00
	db $00, $00, $03, $00
; 8ddbd

Unknown_8ddbd: ; 8ddbd
	db 4
	db $f8, $f8, $04, $00
	db $f8, $00, $05, $00
	db $00, $f8, $08, $00
	db $00, $00, $07, $00
; 8ddce

Unknown_8ddce: ; 8ddce
	db 4
	db $f8, $f8, $00, $00
	db $f8, $00, $01, $00
	db $00, $f8, $09, $00
	db $00, $00, $03, $00
; 8dddf

Unknown_8dddf: ; 8dddf
	db 4
	db $f8, $f8, $04, $00
	db $f8, $00, $05, $00
	db $00, $f8, $09, $00
	db $00, $00, $07, $00
; 8ddf0

Unknown_8ddf0: ; 8ddf0
	db 6
	db $f8, $f4, $00, $01
	db $f8, $fc, $01, $01
	db $f8, $04, $02, $01
	db $00, $f4, $10, $01
	db $00, $fc, $11, $01
	db $00, $04, $12, $01
; 8de09

Unknown_8de09: ; 8de09
	db 29
	db $e8, $e8, $00, $00
	db $e8, $f0, $01, $00
	db $e8, $f8, $02, $00
	db $e8, $00, $03, $00
	db $f0, $e8, $10, $00
	db $f0, $f0, $11, $00
	db $f0, $f8, $12, $00
	db $f0, $00, $13, $00
	db $f8, $e8, $20, $00
	db $f8, $f0, $21, $00
	db $f8, $f8, $22, $00
	db $f8, $00, $23, $00
	db $f8, $08, $24, $00
	db $00, $e8, $30, $80
	db $00, $f0, $31, $80
	db $00, $f8, $32, $80
	db $00, $00, $33, $80
	db $00, $08, $34, $80
	db $08, $e8, $40, $80
	db $08, $f0, $41, $80
	db $08, $f8, $42, $80
	db $08, $00, $43, $80
	db $08, $08, $44, $80
	db $08, $10, $45, $80
	db $10, $f0, $51, $80
	db $10, $f8, $52, $80
	db $10, $00, $53, $80
	db $10, $08, $54, $80
	db $10, $10, $55, $80
; 8de7e

Unknown_8de7e: ; 8de7e
	db 2
	db $f8, $fc, $00, $00
	db $00, $fc, $10, $00
; 8de87

Unknown_8de87: ; 8de87
	db 5
	db $f0, $18, $00, $00
	db $f0, $20, $01, $00
	db $f8, $10, $02, $00
	db $f8, $18, $03, $00
	db $00, $10, $04, $00
; 8de9c

Unknown_8de9c: ; 8de9c
	db 1
	db $fc, $fc, $00, $06
; 8dea1

Unknown_8dea1: ; 8dea1
	db 4
	db $f8, $f8, $00, $06
	db $f8, $00, $01, $06
	db $00, $f8, $02, $06
	db $00, $00, $03, $06
; 8deb2

Unknown_8deb2: ; 8deb2
	db 4
	db $ff, $ff, $00, $00
	db $ff, $00, $00, $20
	db $00, $ff, $00, $40
	db $00, $00, $00, $60
; 8dec3

Unknown_8dec3: ; 8dec3
	db 10
	db $ff, $00, $00, $00
	db $ff, $08, $01, $00
	db $ff, $10, $01, $00
	db $ff, $18, $01, $00
	db $ff, $20, $00, $20
	db $00, $00, $00, $40
	db $00, $08, $01, $40
	db $00, $10, $01, $40
	db $00, $18, $01, $40
	db $00, $20, $00, $60
; 8deec

Unknown_8deec: ; 8deec
	db 15
	db $ec, $f4, $00, $11
	db $ec, $fc, $01, $11
	db $ec, $04, $02, $11
	db $f4, $f4, $03, $11
	db $f4, $fc, $04, $11
	db $f4, $04, $05, $11
	db $fc, $f4, $06, $11
	db $fc, $fc, $07, $11
	db $fc, $04, $08, $11
	db $04, $f4, $09, $11
	db $04, $fc, $0a, $11
	db $04, $04, $0b, $11
	db $0c, $f4, $0c, $11
	db $0c, $fc, $0d, $11
	db $0c, $04, $0e, $11
; 8df29

Unknown_8df29: ; 8df29
	db 6
	db $f4, $f4, $00, $15
	db $f4, $fc, $02, $15
	db $f4, $04, $00, $35
	db $04, $f4, $04, $15
	db $04, $fc, $06, $15
	db $04, $04, $04, $35
; 8df42

Unknown_8df42: ; 8df42
	db 6
	db $f4, $f4, $00, $16
	db $f4, $fc, $02, $16
	db $f4, $04, $04, $16
	db $04, $f4, $06, $16
	db $04, $fc, $08, $16
	db $04, $04, $0a, $16
; 8df5b

Unknown_8df5b: ; 8df5b
	db 6
	db $f4, $f4, $00, $16
	db $f4, $fc, $02, $16
	db $f4, $04, $04, $16
	db $04, $f4, $0c, $16
	db $04, $fc, $0e, $16
	db $04, $04, $10, $16
; 8df74

Unknown_8df74: ; 8df74
	db 6
	db $f4, $f4, $00, $16
	db $f4, $fc, $02, $16
	db $f4, $04, $04, $16
	db $04, $f4, $12, $16
	db $04, $fc, $14, $16
	db $04, $04, $16, $16
; 8df8d

Unknown_8df8d: ; 8df8d
	db 6
	db $f4, $f4, $00, $16
	db $f4, $fc, $02, $16
	db $f4, $04, $04, $16
	db $04, $f4, $18, $16
	db $04, $fc, $1a, $16
	db $04, $04, $1c, $16
; 8dfa6

Unknown_8dfa6: ; 8dfa6
	db 6
	db $f4, $f4, $1e, $16
	db $f4, $fc, $20, $16
	db $f4, $04, $22, $16
	db $04, $f4, $24, $16
	db $04, $fc, $26, $16
	db $04, $04, $28, $16
; 8dfbf

Unknown_8dfbf: ; 8dfbf
	db 3
	db $f4, $fc, $00, $10
	db $fc, $fc, $00, $10
	db $04, $fc, $00, $10
; 8dfcc

Unknown_8dfcc: ; 8dfcc
	db 6
	db $00, $00, $00, $00
	db $00, $08, $01, $00
	db $00, $10, $01, $00
	db $00, $18, $01, $00
	db $00, $20, $02, $00
	db $00, $28, $03, $00
; 8dfe5

Unknown_8dfe5: ; 8dfe5
	db 4
	db $00, $00, $00, $00
	db $00, $08, $01, $00
	db $00, $10, $02, $00
	db $00, $18, $03, $00
; 8dff6

Unknown_8dff6: ; 8dff6
	db 4
	db $f8, $f6, $00, $06
	db $f8, $02, $01, $06
	db $00, $f6, $02, $06
	db $00, $02, $03, $06
; 8e007

Unknown_8e007: ; 8e007
	db 4
	db $f8, $f4, $00, $06
	db $f8, $04, $01, $06
	db $00, $f4, $02, $06
	db $00, $04, $03, $06
; 8e018

Unknown_8e018: ; 8e018
	db 4
	db $f8, $f0, $00, $06
	db $f8, $08, $01, $06
	db $00, $f0, $02, $06
	db $00, $08, $03, $06
; 8e029

Unknown_8e029: ; 8e029
	db 19
	db $f8, $e0, $00, $00
	db $f0, $e8, $02, $00
	db $00, $e8, $04, $00
	db $e8, $f0, $06, $00
	db $f8, $f0, $08, $00
	db $08, $f0, $0a, $00
	db $e8, $f8, $0c, $00
	db $f8, $f8, $0e, $00
	db $08, $f8, $10, $00
	db $e8, $00, $12, $00
	db $f8, $00, $14, $00
	db $08, $00, $16, $00
	db $e8, $08, $18, $00
	db $f8, $08, $1a, $00
	db $08, $08, $1c, $00
	db $f8, $10, $1e, $00
	db $08, $10, $20, $00
	db $f0, $18, $22, $00
	db $00, $18, $24, $00
; 8e076

Unknown_8e076: ; 8e076
	db 16
	db $f8, $e0, $00, $00
	db $f0, $e8, $02, $00
	db $00, $e8, $04, $00
	db $f8, $f0, $26, $00
	db $08, $f0, $0a, $00
	db $e8, $f8, $28, $00
	db $f8, $f8, $2a, $00
	db $08, $f8, $10, $00
	db $f8, $00, $2c, $00
	db $08, $00, $16, $00
	db $f8, $08, $30, $00
	db $08, $08, $1c, $00
	db $f8, $10, $1e, $00
	db $08, $10, $20, $00
	db $f0, $18, $22, $00
	db $00, $18, $24, $00
; 8e0b7

Unknown_8e0b7: ; 8e0b7
	db 15
	db $f8, $e0, $00, $00
	db $f0, $e8, $02, $00
	db $00, $e8, $32, $00
	db $f8, $f0, $34, $00
	db $08, $f0, $36, $00
	db $f8, $f8, $38, $00
	db $08, $f8, $3a, $00
	db $f8, $00, $3c, $00
	db $08, $00, $3e, $00
	db $f8, $08, $30, $00
	db $08, $08, $1c, $00
	db $f8, $10, $1e, $00
	db $08, $10, $20, $00
	db $f0, $18, $22, $00
	db $00, $18, $24, $00
; 8e0f4

Unknown_8e0f4: ; 8e0f4
	db 17
	db $f8, $e0, $00, $00
	db $f0, $e8, $02, $00
	db $00, $e8, $04, $00
	db $f8, $f0, $40, $00
	db $08, $f0, $42, $00
	db $18, $f0, $44, $00
	db $f8, $f8, $46, $00
	db $08, $f8, $48, $00
	db $18, $f8, $4a, $00
	db $f8, $00, $4c, $00
	db $08, $00, $4e, $00
	db $f8, $08, $30, $00
	db $08, $08, $1c, $00
	db $f8, $10, $1e, $00
	db $08, $10, $20, $00
	db $f0, $18, $22, $00
	db $00, $18, $24, $00
; 8e139

Unknown_8e139: ; 8e139
	db 17
	db $f8, $e0, $00, $00
	db $f0, $e8, $02, $00
	db $00, $e8, $04, $00
	db $f8, $f0, $50, $00
	db $08, $f0, $0a, $00
	db $e8, $f8, $52, $00
	db $f8, $f8, $54, $00
	db $08, $f8, $10, $00
	db $e8, $00, $56, $00
	db $f8, $00, $2e, $00
	db $08, $00, $16, $00
	db $f8, $08, $30, $00
	db $08, $08, $1c, $00
	db $f8, $10, $1e, $00
	db $08, $10, $20, $00
	db $f0, $18, $22, $00
	db $00, $18, $24, $00
; 8e17e

Unknown_8e17e: ; 8e17e
	db 1
	db $fc, $fc, $00, $11
; 8e183

Unknown_8e183: ; 8e183
	db 12
	db $00, $00, $30, $00
	db $00, $08, $31, $00
	db $00, $10, $31, $00
	db $00, $18, $31, $00
	db $00, $20, $31, $00
	db $00, $28, $32, $00
	db $08, $00, $33, $00
	db $08, $08, $34, $00
	db $08, $10, $34, $00
	db $08, $18, $34, $00
	db $08, $20, $34, $00
	db $08, $28, $35, $00
; 8e1b4

Unknown_8e1b4: ; 8e1b4
	db 1
	db $00, $00, $ed, $00
; 8e1b9

Unknown_8e1b9: ; 8e1b9
	db 4
	db $ff, $ff, $30, $00
	db $ff, $01, $32, $00
	db $01, $ff, $33, $00
	db $01, $01, $35, $00
; 8e1ca

Unknown_8e1ca: ; 8e1ca
	db 8
	db $ff, $ff, $30, $00
	db $ff, $04, $31, $00
	db $ff, $0c, $31, $00
	db $ff, $11, $32, $00
	db $01, $ff, $33, $00
	db $01, $04, $34, $00
	db $01, $0c, $34, $00
	db $01, $11, $35, $00
; 8e1eb

Unknown_8e1eb: ; 8e1eb
	db 1
	db $00, $00, $34, $00
; 8e1f0

Unknown_8e1f0: ; 8e1f0
	db 2
	db $00, $00, $30, $00
	db $08, $00, $33, $00
; 8e1f9

Unknown_8e1f9: ; 8e1f9
	db 2
	db $00, $00, $32, $00
	db $08, $00, $35, $00
; 8e202

Unknown_8e202: ; 8e202
	db 4
	db $f8, $f8, $00, $01
	db $f8, $00, $01, $01
	db $00, $f8, $02, $01
	db $00, $00, $03, $01
; 8e213

Unknown_8e213: ; 8e213
	db 4
	db $f8, $f8, $00, $81
	db $f8, $00, $01, $81
	db $00, $f8, $02, $81
	db $00, $00, $03, $81
; 8e224

Unknown_8e224: ; 8e224
	db 1
	db $fc, $fc, $00, $02
; 8e229

Unknown_8e229: ; 8e229
	db 4
	db $f0, $fc, $00, $03
	db $f8, $fc, $01, $03
	db $00, $fc, $02, $03
	db $08, $fc, $03, $03
; 8e23a

Unknown_8e23a: ; 8e23a
	db 4
	db $f0, $fc, $03, $44
	db $f8, $fc, $02, $44
	db $00, $fc, $01, $44
	db $08, $fc, $00, $44
; 8e24b

Unknown_8e24b: ; 8e24b
	db 4
	db $f8, $f8, $00, $01
	db $f8, $00, $00, $21
	db $00, $f8, $00, $41
	db $00, $00, $00, $61
; 8e25c

Unknown_8e25c: ; 8e25c
	db 8
	db $f4, $f4, $00, $01
	db $f4, $fc, $01, $01
	db $f4, $04, $00, $21
	db $fc, $f4, $02, $01
	db $fc, $04, $02, $21
	db $04, $f4, $00, $41
	db $04, $fc, $01, $41
	db $04, $04, $00, $61
; 8e27d

Unknown_8e27d: ; 8e27d
	db 12
	db $f0, $f0, $00, $01
	db $f0, $f8, $01, $01
	db $f8, $f0, $02, $01
	db $f0, $00, $01, $21
	db $f0, $08, $00, $21
	db $f8, $08, $02, $21
	db $00, $f0, $02, $41
	db $08, $f0, $00, $41
	db $08, $f8, $01, $41
	db $00, $08, $02, $61
	db $08, $00, $01, $61
	db $08, $08, $00, $61
; 8e2ae

Unknown_8e2ae: ; 8e2ae
	db 36
	db $e8, $08, $05, $00
	db $e8, $10, $06, $00
	db $e8, $18, $07, $00
	db $f0, $e8, $11, $00
	db $f0, $f0, $12, $00
	db $f0, $f8, $13, $00
	db $f0, $00, $14, $00
	db $f0, $08, $15, $00
	db $f0, $10, $16, $00
	db $f0, $18, $17, $00
	db $f8, $e0, $20, $00
	db $f8, $e8, $21, $00
	db $f8, $f0, $22, $00
	db $f8, $f8, $23, $00
	db $f8, $00, $24, $00
	db $f8, $08, $25, $00
	db $f8, $10, $26, $00
	db $f8, $18, $27, $00
	db $00, $e0, $30, $00
	db $00, $e8, $31, $00
	db $00, $f0, $32, $00
	db $00, $f8, $33, $00
	db $00, $00, $34, $00
	db $00, $08, $35, $00
	db $00, $10, $36, $00
	db $08, $e0, $40, $00
	db $08, $e8, $41, $00
	db $08, $f0, $42, $00
	db $08, $f8, $43, $00
	db $08, $00, $44, $00
	db $08, $08, $45, $00
	db $08, $10, $46, $00
	db $08, $18, $47, $00
	db $10, $e0, $50, $00
	db $10, $e8, $51, $00
	db $10, $18, $57, $00
; 8e33f

Unknown_8e33f: ; 8e33f
	db 28
	db $e8, $00, $04, $00
	db $e8, $08, $05, $00
	db $e8, $10, $06, $00
	db $f0, $e8, $11, $00
	db $f0, $f0, $12, $00
	db $f0, $f8, $13, $00
	db $f0, $00, $14, $00
	db $f0, $08, $15, $00
	db $f0, $10, $16, $00
	db $f8, $e8, $21, $00
	db $f8, $f0, $22, $00
	db $f8, $f8, $23, $00
	db $f8, $00, $24, $00
	db $f8, $08, $25, $00
	db $f8, $10, $26, $00
	db $00, $e0, $30, $00
	db $00, $e8, $31, $00
	db $00, $f0, $32, $00
	db $00, $f8, $33, $00
	db $00, $00, $34, $00
	db $00, $08, $35, $00
	db $08, $f0, $42, $00
	db $08, $f8, $43, $00
	db $08, $00, $44, $00
	db $08, $08, $45, $00
	db $10, $f8, $53, $00
	db $10, $00, $54, $00
	db $10, $08, $55, $00
; 8e3b0

Unknown_8e3b0: ; 8e3b0
	db 30
	db $e8, $00, $04, $00
	db $e8, $08, $05, $00
	db $f0, $e8, $11, $00
	db $f0, $f0, $12, $00
	db $f0, $f8, $13, $00
	db $f0, $00, $14, $00
	db $f0, $08, $15, $00
	db $f0, $10, $16, $00
	db $f0, $18, $17, $00
	db $f8, $e0, $20, $00
	db $f8, $e8, $21, $00
	db $f8, $f0, $22, $00
	db $f8, $f8, $23, $00
	db $f8, $00, $24, $00
	db $f8, $08, $25, $00
	db $f8, $10, $26, $00
	db $00, $e0, $30, $00
	db $00, $e8, $31, $00
	db $00, $f0, $32, $00
	db $00, $f8, $33, $00
	db $00, $00, $34, $00
	db $00, $08, $35, $00
	db $08, $f0, $42, $00
	db $08, $f8, $43, $00
	db $08, $00, $44, $00
	db $08, $08, $45, $00
	db $10, $f0, $52, $00
	db $10, $f8, $53, $00
	db $10, $00, $54, $00
	db $10, $08, $55, $00
; 8e429

Unknown_8e429: ; 8e429
	db 31
	db $f0, $e8, $11, $00
	db $f0, $f0, $12, $00
	db $f0, $f8, $13, $00
	db $f0, $00, $14, $00
	db $f0, $08, $15, $00
	db $f0, $10, $16, $00
	db $f0, $18, $17, $00
	db $f8, $e0, $20, $00
	db $f8, $e8, $21, $00
	db $f8, $f0, $22, $00
	db $f8, $f8, $23, $00
	db $f8, $00, $24, $00
	db $f8, $08, $25, $00
	db $f8, $10, $26, $00
	db $f8, $18, $27, $00
	db $00, $e0, $30, $00
	db $00, $e8, $31, $00
	db $00, $f0, $32, $00
	db $00, $f8, $33, $00
	db $00, $00, $34, $00
	db $00, $08, $35, $00
	db $00, $10, $36, $00
	db $08, $e8, $41, $00
	db $08, $f0, $42, $00
	db $08, $f8, $43, $00
	db $08, $00, $44, $00
	db $08, $08, $45, $00
	db $10, $e8, $51, $00
	db $10, $f0, $52, $00
	db $10, $00, $54, $00
	db $10, $08, $55, $00
; 8e4a6

Unknown_8e4a6: ; 8e4a6
	db 25
	db $ec, $ec, $00, $09
	db $ec, $f4, $01, $09
	db $ec, $fc, $02, $09
	db $ec, $04, $03, $09
	db $ec, $0c, $04, $09
	db $f4, $ec, $10, $09
	db $f4, $f4, $11, $09
	db $f4, $fc, $12, $09
	db $f4, $04, $13, $09
	db $f4, $0c, $14, $09
	db $fc, $ec, $20, $09
	db $fc, $f4, $21, $09
	db $fc, $fc, $22, $09
	db $fc, $04, $23, $09
	db $fc, $0c, $24, $09
	db $04, $ec, $30, $09
	db $04, $f4, $31, $09
	db $04, $fc, $32, $09
	db $04, $04, $33, $09
	db $04, $0c, $34, $09
	db $0c, $ec, $40, $09
	db $0c, $f4, $41, $09
	db $0c, $fc, $42, $09
	db $0c, $04, $43, $09
	db $0c, $0c, $44, $09
; 8e50b

Unknown_8e50b: ; 8e50b
	db 16
	db $f0, $ec, $00, $0a
	db $f0, $f4, $01, $0a
	db $f0, $fc, $02, $0a
	db $f0, $04, $03, $0a
	db $f8, $ec, $04, $0a
	db $f8, $f4, $05, $0a
	db $f8, $fc, $06, $0a
	db $f8, $04, $07, $0a
	db $00, $ec, $08, $0a
	db $00, $f4, $09, $0a
	db $00, $fc, $0a, $0a
	db $00, $04, $0b, $0a
	db $08, $ec, $0c, $0a
	db $08, $f4, $0d, $0a
	db $08, $fc, $0e, $0a
	db $08, $04, $0f, $0a
; 8e54c

Unknown_8e54c: ; 8e54c
	db 1
	db $fc, $fc, $00, $00
; 8e551

Unknown_8e551: ; 8e551
	db 3
	db $00, $f8, $00, $00
	db $f8, $f8, $01, $00
	db $f8, $00, $02, $00
; 8e55e

Unknown_8e55e: ; 8e55e
	db 7
	db $08, $f0, $00, $00
	db $00, $f0, $01, $00
	db $f8, $f0, $02, $00
	db $f8, $f8, $03, $00
	db $f0, $f8, $04, $00
	db $f0, $00, $05, $00
	db $f0, $08, $06, $00
; 8e57b

Unknown_8e57b: ; 8e57b
	db 8
	db $f8, $f0, $00, $00
	db $f8, $f8, $01, $00
	db $f8, $00, $01, $20
	db $f8, $08, $00, $20
	db $00, $f0, $00, $40
	db $00, $f8, $01, $40
	db $00, $00, $01, $60
	db $00, $08, $00, $60
; 8e59c

Unknown_8e59c: ; 8e59c
	db 12
	db $e8, $f8, $00, $00
	db $f0, $f8, $01, $00
	db $f8, $f8, $02, $00
	db $e8, $00, $00, $20
	db $f0, $00, $01, $20
	db $f8, $00, $02, $20
	db $00, $f8, $02, $40
	db $08, $f8, $01, $40
	db $10, $f8, $00, $40
	db $00, $00, $02, $60
	db $08, $00, $01, $60
	db $10, $00, $00, $60
; 8e5cd

Unknown_8e5cd: ; 8e5cd
	db 20
	db $ec, $f0, $00, $00
	db $ec, $f8, $01, $00
	db $ec, $00, $02, $00
	db $ec, $08, $03, $00
	db $f4, $f0, $04, $00
	db $f4, $f8, $05, $00
	db $f4, $00, $06, $00
	db $f4, $08, $07, $00
	db $fc, $f0, $08, $00
	db $fc, $f8, $09, $00
	db $fc, $00, $0a, $00
	db $fc, $08, $0b, $00
	db $04, $f0, $0c, $00
	db $04, $f8, $0d, $00
	db $04, $00, $0e, $00
	db $04, $08, $0f, $00
	db $0c, $f0, $10, $00
	db $0c, $f8, $11, $00
	db $0c, $00, $12, $00
	db $0c, $08, $13, $00
; 8e61e

Unknown_8e61e: ; 8e61e
	db 20
	db $00, $08, $00, $81
	db $08, $10, $00, $81
	db $10, $18, $00, $81
	db $18, $20, $00, $81
	db $20, $28, $00, $81
	db $18, $30, $00, $81
	db $10, $38, $00, $81
	db $08, $40, $00, $81
	db $00, $48, $00, $81
	db $08, $50, $00, $81
	db $10, $58, $00, $81
	db $18, $60, $00, $81
	db $20, $68, $00, $81
	db $18, $70, $00, $81
	db $10, $78, $00, $81
	db $08, $80, $00, $81
	db $00, $88, $00, $81
	db $08, $90, $00, $81
	db $10, $98, $00, $81
	db $18, $a0, $00, $81
; 8e66f

Unknown_8e66f: ; 8e66f
	db 4
	db $f8, $f8, $00, $02
	db $f8, $00, $01, $02
	db $00, $f8, $02, $02
	db $00, $00, $03, $02
; 8e680

Unknown_8e680: ; 8e680
	db 9
	db $f0, $f4, $00, $01
	db $f0, $fc, $01, $01
	db $f0, $04, $02, $01
	db $f8, $f4, $10, $01
	db $f8, $fc, $11, $01
	db $f8, $04, $12, $01
	db $00, $f4, $20, $01
	db $00, $fc, $21, $01
	db $00, $04, $22, $01
; 8e6a5

Unknown_8e6a5: ; 8e6a5
	db 24
	db $d8, $f4, $00, $01
	db $d8, $fc, $01, $01
	db $d8, $04, $02, $01
	db $d8, $0c, $03, $01
	db $e0, $f4, $10, $01
	db $e0, $fc, $11, $01
	db $e0, $04, $12, $01
	db $e0, $0c, $13, $01
	db $e8, $f4, $20, $01
	db $e8, $fc, $21, $01
	db $e8, $04, $22, $01
	db $e8, $0c, $23, $01
	db $f0, $f4, $30, $01
	db $f0, $fc, $31, $01
	db $f0, $04, $32, $01
	db $f0, $0c, $33, $01
	db $f8, $f4, $40, $01
	db $f8, $fc, $41, $01
	db $f8, $04, $42, $01
	db $f8, $0c, $43, $01
	db $00, $f4, $50, $01
	db $00, $fc, $51, $01
	db $00, $04, $52, $01
	db $00, $0c, $53, $01
; 8e706
Unknown_8e706: ; Broken 2bpp pointers
	dbbw $80, $01, $672a ; 128-tile 2bpp at 1:672a (inside Multiply)
	dbbw $80, $01, $672a
	dbbw $80, $01, $672a
	dbbw $80, $01, $672a
	dbbw $10, $37, $672a ; 16-tile 2bpp at 37:672a (within Tileset11GFX)
	dbbw $10, $11, $672a ; 16-tile 2bpp at 11:672a (empty data)
	dbbw $10, $39, $672a ; 16-tile 2bpp at 39:672a (empty data)
	dbbw $10, $24, $672a ; 16-tile 2bpp at 24:672a (inside Function926f7)
	dbbw $10, $21, $672a ; 16-tile 2bpp at 21:672a (inside Function8671c)

ApplyXOffset: ; 8e72a
	add $10
ApplyYOffset: ; 8e72c
	and $3f
	cp $20
	jr nc, .xflip
	call Function8e741
	ld a, h
	ret

.xflip
	and $1f
	call Function8e741
	ld a, h
	xor $ff ; cpl
	inc a
	ret
; 8e741

Function8e741: ; 8e741
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.loop
	srl a
	jr nc, .skip_add
	add hl, de

.skip_add
	sla e
	rl d
	and a
	jr nz, .loop
	ret
; 8e75d

.sinewave: ; 8e75d
	sine_wave $100


AnimateEndOfExpBar: ; 8e79d
	ld a, [hSGB]
	ld de, EndOfExpBarGFX
	and a
	jr z, .load
	ld de, SGBEndOfExpBarGFX

.load
	ld hl, VTiles0 tile $00
	lb bc, BANK(EndOfExpBarGFX), 1
	call Request2bpp
	ld c, $8
	ld d, $0
.loop
	push bc
	call .AnimateFrame
	call DelayFrame
	pop bc
rept 2
	inc d
endr
	dec c
	jr nz, .loop
	call ClearSprites
	ret
; 8e7c6

.AnimateFrame: ; 8e7c6
	ld hl, Sprites
	ld c, $8
.anim_loop
	ld a, c
	and a
	ret z
	dec c
	ld a, c
	sla a
	sla a
	sla a
	push af

	push de
	push hl
	call ApplyYOffset
	pop hl
	pop de
	add 13 * 8
	ld [hli], a

	pop af
	push de
	push hl
	call ApplyXOffset
	pop hl
	pop de
	add 10 * 8 + 4
	ld [hli], a

	ld a, $0
	ld [hli], a
	ld a, $6 ; OBJ 6
	ld [hli], a
	jr .anim_loop
; 8e7f4

EndOfExpBarGFX: ; 8e7f4
INCBIN "gfx/battle/expbarend.2bpp"
SGBEndOfExpBarGFX: ; 8e804
INCBIN "gfx/battle/expbarend_sgb.2bpp"

ClearSpriteAnims: ; 8e814
	push hl
	push de
	push bc
	push af
	ld hl, wSpriteAnimDict
	ld bc, wSpriteAnimsEnd - wSpriteAnimDict
.loop
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	pop bc
	pop de
	pop hl
	ret
; 8e82b

Function8e82b: ; 8e82b
	ld a, e
	call ReadMonMenuIcon
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, BANK(Icons)
	ld c, 8
	ret
; 8e83f

Function8e83f: ; 8e83f
	push hl
	push de
	push bc
	call Function8e849
	pop bc
	pop de
	pop hl
	ret
; 8e849

Function8e849: ; 8e849
	ld d, 0
	ld hl, Jumptable_8e854
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8e854


Jumptable_8e854: ; 8e854 (23:6854)
	dw Function8e8d5
	dw Function8e961
	dw Function8e97d
	dw Function8e99a
	dw Function8e898
	dw Function8e8b1
	dw Function8e862


Function8e862: ; 8e862 (23:6862)
	call Function8e908
	call Function8e86c
	call Function8e936
	ret

Function8e86c: ; 8e86c (23:686c)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .asm_8e890
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e88e
	ld a, $6
	jr .asm_8e892
.asm_8e88e
	ld a, $5
.asm_8e890
	ld a, $4
.asm_8e892
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e898: ; 8e898 (23:6898)
	call Function8e8d5
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $48
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $48
	ld [hl], a
	ret

Function8e8b1: ; 8e8b1 (23:68b1)
	call Function8e908
	call Function8e936
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $18
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $60
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

Function8e8d5: ; 8e8d5 (23:68d5)
	call Function8e908
	call Function8e8df
	call Function8e936
	ret

Function8e8df: ; 8e8df (23:68df)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, $30
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e900
	ld a, $3
	jr .asm_8e902
.asm_8e900
	ld a, $2
.asm_8e902
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e908: ; 8e908 (23:6908)
	ld a, [wc3b7]
	push af
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call ReadMonMenuIcon
	ld [CurIcon], a
	call Function8e9db
	ld a, [hObjectStructIndexBuffer]
; y coord
rept 4
	add a
endr
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	pop af
	ld hl, $3
	add hl, bc
	ld [hl], a
	ret

Function8e936: ; 8e936 (23:6936)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld b, a
	call Function8e94c
	ld a, b
	pop bc
	ld hl, $9
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function8e94c: ; 8e94c (23:694c)
	callba PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, Unknown_8e95e
	add hl, de
	ld b, [hl]
	ret
; 8e95e (23:695e)

Unknown_8e95e: ; 8e95e
	db $00, $40, $80
; 8e961

Function8e961: ; 8e961 (23:6961)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	lb de, $24, $20
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e97d: ; 8e97d (23:697d)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	ld d, $1a
	ld e, $24
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e99a: ; 8e99a (23:699a)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	ld a, $62
	ld [wc3b7], a
	call Function8e9db
	ret

GetSpeciesIcon: ; 8e9ac
; Load species icon into VRAM at tile a
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret
; 8e9bc


Function8e9bc: ; 8e9bc (23:69bc)
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret
; 8e9cc (23:69cc)

Function8e9cc: ; 8e9cc
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	call GetIcon_de
	ret
; 8e9db

Function8e9db: ; 8e9db (23:69db)
	ld a, [wc3b7]

GetIconGFX: ; 8e9de
	call GetIcon_a
	ld de, $80 ; 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wc3b7]
	add 10
	ld [wc3b7], a
	ret

HeldItemIcons:
INCBIN "gfx/icon/mail.2bpp"
INCBIN "gfx/icon/item.2bpp"
; 8ea17

GetIcon_de: ; 8ea17
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a: ; 8ea1b
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon: ; 8ea1e
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, VTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [CurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(Icons), 8
	call GetGFXUnlessMobile

	pop hl
	ret
; 8ea3f

GetGFXUnlessMobile: ; 8ea3f
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bpp_2
; 8ea4a

Function8ea4a: ; 8ea4a
	ld hl, wSpriteAnimationStructs
	ld e, $6
	ld a, [MenuSelection2]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, $0
	jr .ok

.loadwithtwo
	ld a, $2

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea71

Function8ea71: ; 8ea71
	ld hl, wSpriteAnimationStructs
	ld e, $6
.loop
	ld a, [hl]
	and a
	jr z, .zero
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], $1
	pop hl
.zero
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea8c (23:6a8c)

Function8ea8c: ; 8ea8c
	ld hl, wSpriteAnimationStructs
	ld e, $6
	ld a, [wd0e3]
	ld d, a
.asm_8ea95
	ld a, [hl]
	and a
	jr z, .asm_8eaab
	cp d
	jr z, .asm_8eaa0
	ld a, $3
	jr .asm_8eaa2
.asm_8eaa0
	ld a, $2
.asm_8eaa2
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl
.asm_8eaab
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .asm_8ea95
	ret

INCLUDE "menu/mon_icons.asm"
