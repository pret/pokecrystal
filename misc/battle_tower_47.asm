BattleTowerText:: ; 11c000
; Print text c for trainer [BT_OTrainer_TrainerClass]
; 1: Intro text
; 2: Player lost
; 3: Player won
	ld a, [rSVBK]
	push af
	ld a, 3 ; BANK(BT_OTrainer_TrainerClass)
	ld [rSVBK], a
IF DEF(CRYSTAL11)
	ld hl, BT_OTrainer_TrainerClass
ELSE
	ld hl, BT_OTrainer_Name + 5
ENDC
	ld a, [hl]
	dec a
	ld e, a
	ld d, 0
	ld hl, BTTrainerClassGenders
	add hl, de
	ld a, [hl]
	and a
	jr nz, .female
	; generate a random number between 0 and 24
	ld a, [hRandomAdd]
	and $1f
	cp 25
	jr c, .okay0
	sub 25

.okay0
	ld hl, BTMaleTrainerTexts
	jr .proceed

.female
	; generate a random number between 0 and 14
	ld a, [hRandomAdd]
	and $f
	cp 15
	jr c, .okay1
	sub 15

.okay1
	ld hl, BTFemaleTrainerTexts

.proceed
	ld b, 0
	dec c
	jr nz, .restore
	ld [BT_TrainerTextIndex], a
	jr .okay2

.restore
	ld a, [BT_TrainerTextIndex]

.okay2
	push af
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld h, a
	ld l, c
	pop af
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld l, c
	ld h, a
	bccoord 1, 14
	pop af
	ld [rSVBK], a
	call PlaceWholeStringInBoxAtOnce
	ret
; 11c05d

Function11c05d: ; 11c05d
	ld a, e
	or d
	jr z, .asm_11c071
	ld a, e
	and d
	cp $ff
	jr z, .asm_11c071
	push hl
	call Function11c156
	pop hl
	call PlaceString
	and a
	ret

.asm_11c071
	ld c, l
	ld b, h
	scf
	ret
; 11c075

Function11c075: ; 11c075
	push de
	ld a, c
	call Function11c254
	pop de
	ld bc, wcd36
	call Function11c08f
	ret
; 11c082

Function11c082: ; 11c082
	push de
	ld a, c
	call Function11c254
	pop de
	ld bc, wcd36
	call Function11c0c6
	ret
; 11c08f

Function11c08f: ; 11c08f
	ld l, e
	ld h, d
	push hl
	ld a, $3
.asm_11c094
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	push bc
	call Function11c05d
	jr c, .asm_11c0a2
	inc bc

.asm_11c0a2
	ld l, c
	ld h, b
	pop bc
	pop af
	dec a
	jr nz, .asm_11c094
	pop hl
	ld de, $0028
	add hl, de
	ld a, $3
.asm_11c0b0
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	push bc
	call Function11c05d
	jr c, .asm_11c0be
	inc bc

.asm_11c0be
	ld l, c
	ld h, b
	pop bc
	pop af
	dec a
	jr nz, .asm_11c0b0
	ret
; 11c0c6


Function11c0c6: ; 11c0c6
	ld a, [wJumptableIndex]
	ld l, a
	ld a, [wcf64]
	ld h, a
	push hl
	ld hl, $c608 + 16
	ld a, $0
	ld [hli], a
	push de
	xor a
	ld [wJumptableIndex], a
	ld a, $12
	ld [wcf64], a
	ld a, $6
.asm_11c0e1
	push af
	ld a, [bc]
	ld e, a
	inc bc
	ld a, [bc]
	ld d, a
	inc bc
	or e
	jr z, .asm_11c133
	push hl
	push bc
	call Function11c156
	call Function11c14a
	ld e, c
	pop bc
	pop hl
	ld a, e
	or a
	jr z, .asm_11c133
.asm_11c0fa
	ld a, [wcf64]
	cp $12
	jr z, .asm_11c102
	inc e

.asm_11c102
	cp e
	jr nc, .asm_11c11c
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ld [hl], $4e
	rra
	jr c, .asm_11c113
	ld [hl], $55

.asm_11c113
	inc hl
	ld a, $12
	ld [wcf64], a
	dec e
	jr .asm_11c0fa

.asm_11c11c
	cp $12
	jr z, .asm_11c123
	ld [hl], $7f
	inc hl

.asm_11c123
	sub e
	ld [wcf64], a
	ld de, $c608
.asm_11c12a
	ld a, [de]
	cp $50
	jr z, .asm_11c133
	inc de
	ld [hli], a
	jr .asm_11c12a

.asm_11c133
	pop af
	dec a
	jr nz, .asm_11c0e1
	ld [hl], $57
	pop bc
	ld hl, $c608 + 16
	call PlaceWholeStringInBoxAtOnce
	pop hl
	ld a, l
	ld [wJumptableIndex], a
	ld a, h
	ld [wcf64], a
	ret
; 11c14a

Function11c14a: ; 11c14a
	ld c, $0
	ld hl, $c608
.asm_11c14f
	ld a, [hli]
	cp $50
	ret z
	inc c
	jr .asm_11c14f
; 11c156

Function11c156: ; 11c156
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, $50
	ld hl, $c608
	ld bc, $000b
	call ByteFill
	ld a, d
	and a
	jr z, .asm_11c19c
	ld hl, Unknown_11daac
	dec d
	sla d
	ld c, d
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	push bc
	pop hl
	ld c, e
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld bc, $0005
.asm_11c18f
	ld de, $c608
	call CopyBytes
	ld de, $c608
	pop af
	ld [rSVBK], a
	ret

.asm_11c19c
	ld a, e
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld bc, $000a
	jr .asm_11c18f
; 11c1ab

Function11c1ab: ; 11c1ab
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function11c1b9
	pop af
	ld [hInMenu], a
	ret
; 11c1b9

Function11c1b9: ; 11c1b9
	call Function11c1ca
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	call Function11c283
	pop af
	ld [rSVBK], a
	ret
; 11c1ca

Function11c1ca: ; 11c1ca
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [wcd23], a
	ld [BGMapBuffer], a
	ld [wcd21], a
	ld [CreditsTimer], a
	ld [wcd35], a
	ld [wcd2b], a
	ld a, $ff
	ld [wcd24], a
	ld a, [wcfa9]
	dec a
	call Function11c254
	call WhiteBGMap
	call ClearSprites
	call ClearScreen
	call Function11d323
	call SetPalettes
	call DisableLCD
	ld hl, GFX_11d67e
	ld de, VTiles2
	ld bc, $60
	call CopyBytes
	ld hl, LZ_11d6de
	ld de, VTiles0
	call Decompress
	call EnableLCD
	callba Function104061
	callba Function8cf53
	callba LoadPokemonData
	callba Function40c30
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, $c6d0
	ld de, LYOverrides
	ld bc, $100
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function11d4aa
	call Function11d3ba
	ret
; 11c254

Function11c254: ; 11c254
	push af
	ld a, $4
	call GetSRAMBank
	ld hl, $a007
	pop af
	sla a
	sla a
	ld c, a
	sla a
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld de, wcd36
	ld bc, $000c
	call CopyBytes
	call CloseSRAM
	ret
; 11c277


Function11c277: ; 11c277 (47:4277)
	ld a, $7f
	hlcoord 0, 6
	ld bc, $f0
	call ByteFill
	ret

Function11c283: ; 11c283
.asm_11c283
	call JoyTextDelay
	ld a, [hJoyPressed]
	ld [hJoypadPressed], a
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11c2a2
	call Function11c2ac
	callba Function8cf69
	callba Function104061
	jr .asm_11c283

.asm_11c2a2
	callba Function8cf53
	call ClearSprites
	ret
; 11c2ac

Function11c2ac: ; 11c2ac
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11c2bb
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 11c2bb


Jumptable_11c2bb: ; 11c2bb (47:42bb)
	dw Function11c2e9
	dw Function11c346
	dw Function11c35f
	dw Function11c373
	dw Function11c3c2
	dw Function11c3ed
	dw Function11c52c
	dw Function11c53d
	dw Function11c658
	dw Function11c675
	dw Function11c9bd
	dw Function11c9c3
	dw Function11caad
	dw Function11cab3
	dw Function11cb52
	dw Function11cb66
	dw Function11cbf5
	dw Function11ccef
	dw Function11cd04
	dw Function11cd20
	dw Function11cd54
	dw Function11ce0b
	dw Function11ce2b


Function11c2e9: ; 11c2e9 (47:42e9)
	lb de, $1a, $0d
	ld a, $1d
	call Function3b2a
	lb de, $42, $0d
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $1
	ld [hl], a
	lb de, $4a, $10
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $3
	ld [hl], a
	lb de, $50, $80
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $4
	ld [hl], a
	lb de, $50, $20
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $5
	ld [hl], a
	lb de, $50, $10
	ld a, $1d
	call Function3b2a
	ld hl, $c
	add hl, bc
	ld a, $2
	ld [hl], a
	ld hl, wcd23
	set 1, [hl]
	set 2, [hl]
	jp Function11cfb5

Function11c346: ; 11c346 (47:4346)
	ld a, $9
	ld [wcd2d], a
	ld a, $2
	ld [wcd2e], a
	ld [wcd2f], a
	ld [wcd30], a
	ld de, wcd2d
	call Function11cfce
	jp Function11cfb5

Function11c35f: ; 11c35f (47:435f)
	ld hl, wcd2f
rept 2
	inc [hl]
endr
rept 2
	dec hl
endr
	dec [hl]
	push af
	ld de, wcd2d
	call Function11cfce
	pop af
	ret nz
	jp Function11cfb5

Function11c373: ; 11c373 (47:4373)
	ld hl, wcd30
rept 2
	inc [hl]
endr
rept 2
	dec hl
endr
	dec [hl]
	push af
	ld de, wcd2d
	call Function11cfce
	pop af
	ret nz
	call Function11c38a
	jp Function11cfb5

Function11c38a: ; 11c38a (47:438a)
	ld hl, Unknown_11c986
	ld bc, wcd36
	ld a, $6
.asm_11c392
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	push de
	pop hl
	ld a, [bc]
	inc bc
	ld e, a
	ld a, [bc]
	inc bc
	ld d, a
	push bc
	or e
	jr z, .asm_11c3af
	ld a, e
	and d
	cp $ff
	jr z, .asm_11c3af
	call Function11c05d
	jr .asm_11c3b5
.asm_11c3af
	ld de, String_11c3bc
	call PlaceString
.asm_11c3b5
	pop bc
	pop hl
	pop af
	dec a
	jr nz, .asm_11c392
	ret
; 11c3bc (47:43bc)

String_11c3bc: ; 11c3bc
	db "ーーーーー@"
; 11c3c2

Function11c3c2: ; 11c3c2 (47:43c2)
	call Function11c277
	ld de, Unknown_11cfbe
	call Function11d035
	hlcoord 1, 7
	ld de, String_11c4db
	call PlaceString
	hlcoord 1, 16
	ld de, String_11c51b
	call PlaceString
	call Function11c4be
	ld hl, wcd23
	set 0, [hl]
	ld hl, wcd24
	res 0, [hl]
	call Function11cfb5

Function11c3ed: ; 11c3ed (47:43ed)
	ld hl, BGMapBuffer ; wcd20 (aliases: CreditsPos)
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $8
	jr nz, .asm_11c426
	ld a, [de]
	and $2
	jr nz, .asm_11c41a
	ld a, [de]
	and $1
	jr nz, .asm_11c42c
	ld de, hJoyLast
	ld a, [de]
	and $40
	jr nz, .asm_11c47c
	ld a, [de]
	and $80
	jr nz, .asm_11c484
	ld a, [de]
	and $20
	jr nz, .asm_11c48c
	ld a, [de]
	and $10
	jr nz, .asm_11c498
	ret
.asm_11c41a
	call PlayClickSFX
.asm_11c41d
	ld hl, wcd24
	set 0, [hl]
	ld a, $c
	jr .asm_11c475
.asm_11c426
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
	ret
.asm_11c42c
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	cp $6
	jr c, .asm_11c472
	sub $6
	jr z, .asm_11c469
	dec a
	jr z, .asm_11c41d
	ld hl, wcd36
	ld c, $c
	xor a
.asm_11c440
	or [hl]
	inc hl
	dec c
	jr nz, .asm_11c440
	and a
	jr z, .asm_11c460
	ld de, Unknown_11cfba
	call Function11cfce
	decoord 1, 2
	ld bc, wcd36
	call Function11c08f
	ld hl, wcd24
	set 0, [hl]
	ld a, $e
	jr .asm_11c475
.asm_11c460
	ld hl, wcd24
	set 0, [hl]
	ld a, $11
	jr .asm_11c475
.asm_11c469
	ld hl, wcd24
	set 0, [hl]
	ld a, $a
	jr .asm_11c475
.asm_11c472
	call Function11c4a5
.asm_11c475
	ld [wJumptableIndex], a
	call PlayClickSFX
	ret
.asm_11c47c
	ld a, [hl]
	cp $3
	ret c
	sub $3
	jr .asm_11c4a3
.asm_11c484
	ld a, [hl]
	cp $6
	ret nc
	add $3
	jr .asm_11c4a3
.asm_11c48c
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	dec a
	jr .asm_11c4a3
.asm_11c498
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	inc a
.asm_11c4a3
	ld [hl], a
	ret

Function11c4a5: ; 11c4a5 (47:44a5)
	ld hl, wcd23
	res 0, [hl]
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c4b7
	xor a
	ld [wcd21], a
	ld a, $6
	ret
.asm_11c4b7
	xor a
	ld [CreditsTimer], a
	ld a, $15
	ret

Function11c4be: ; 11c4be (47:44be)
	ld a, $1
	hlcoord 0, 6, AttrMap
	ld bc, $a0
	call ByteFill
	ld a, $7
	hlcoord 0, 14, AttrMap
	ld bc, $28
	call ByteFill
	callba Function104061
	ret
; 11c4db (47:44db)

String_11c4db: ; 11c4db
	db   "6つのことば", $1f, "くみあわせます"
	next "かえたいところ", $1f, "えらぶと でてくる"
	next "ことばのグループから いれかえたい"
	next "たんご", $1f, "えらんでください"
	db   "@"
; 11c51b

String_11c51b: ; 11c51b
	db "ぜんぶけす やめる   けってい@"
; 11c52c

Function11c52c: ; 11c52c (47:452c)
	call Function11c277
	call Function11c5f0
	call Function11c618
	ld hl, wcd24
	res 1, [hl]
	call Function11cfb5

Function11c53d: ; 11c53d (47:453d)
	ld hl, wcd21
	ld de, hJoypadPressed ; $ffa3

	ld a, [de]
	and START
	jr nz, .start

	ld a, [de]
	and SELECT
	jr nz, .select

	ld a, [de]
	and B_BUTTON
	jr nz, .b

	ld a, [de]
	and A_BUTTON
	jr nz, .a

	ld de, hJoyLast

	ld a, [de]
	and D_UP
	jr nz, .up

	ld a, [de]
	and D_DOWN
	jr nz, .down

	ld a, [de]
	and D_LEFT
	jr nz, .left

	ld a, [de]
	and D_RIGHT
	jr nz, .right

	ret

.a
	ld a, [wcd21]
	cp $f
	jr c, .asm_11c59d
	sub $f
	jr z, .asm_11c5ab
	dec a
	jr z, .asm_11c599
	jr .b

.start
	ld hl, wcd24
	set 0, [hl]
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)

.b
	ld a, $4
	jr .asm_11c59f

.select
	ld a, [wcd2b]
	xor $1
	ld [wcd2b], a
	ld a, $15
	jr .asm_11c59f

.asm_11c599
	ld a, $13
	jr .asm_11c59f

.asm_11c59d
	ld a, $8

.asm_11c59f
	ld hl, wcd24
	set 1, [hl]
	ld [wJumptableIndex], a
	call PlayClickSFX
	ret

.asm_11c5ab
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11ca6a
	call PlayClickSFX
	ret

.up
	ld a, [hl]
	cp $3
	ret c
	sub $3
	jr .asm_11c5ee

.down
	ld a, [hl]
	cp $f
	ret nc
	add $3
	jr .asm_11c5ee

.left
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	cp $9
	ret z
	cp $c
	ret z
	cp $f
	ret z
	dec a
	jr .asm_11c5ee

.right
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	cp $b
	ret z
	cp $e
	ret z
	cp $11
	ret z
	inc a

.asm_11c5ee
	ld [hl], a
	ret
; 11c5f0

Function11c5f0: ; 11c5f0 (47:45f0)
	ld de, Strings_11da52
	ld bc, Unknown_11c63a
	ld a, $f
.asm_11c5f8
	push af
	ld a, [bc]
	inc bc
	ld l, a
	ld a, [bc]
	inc bc
	ld h, a
	push bc
	call PlaceString
.asm_11c603
	inc de
	ld a, [de]
	cp $50
	jr z, .asm_11c603
	pop bc
	pop af
	dec a
	jr nz, .asm_11c5f8
	hlcoord 1, 17
	ld de, String_11c62a
	call PlaceString
	ret

Function11c618: ; 11c618 (47:4618)
	ld a, $2
	hlcoord 0, 6, AttrMap
	ld bc, $c8
	call ByteFill
	callba Function104061
	ret
; 11c62a (47:462a)

String_11c62a: ; 11c62a
	db "けす    モード   やめる@"
; 11c63a

Unknown_11c63a: ; 11c63a
	dwcoord  1,  7
	dwcoord  7,  7
	dwcoord 13,  7
	dwcoord  1,  9
	dwcoord  7,  9
	dwcoord 13,  9
	dwcoord  1, 11
	dwcoord  7, 11
	dwcoord 13, 11
	dwcoord  1, 13
	dwcoord  7, 13
	dwcoord 13, 13
	dwcoord  1, 15
	dwcoord  7, 15
	dwcoord 13, 15
; 11c658

Function11c658: ; 11c658 (47:4658)
	call Function11c277
	call Function11c770
	ld de, Unknown_11cfc2
	call Function11d035
	call Function11c9ab
	call Function11c7bc
	call Function11c86e
	ld hl, wcd24
	res 3, [hl]
	call Function11cfb5

Function11c675: ; 11c675 (47:4675)
	ld hl, wcd25
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and A_BUTTON
	jr nz, .a
	ld a, [de]
	and B_BUTTON
	jr nz, .b
	ld a, [de]
	and START
	jr nz, .start
	ld a, [de]
	and SELECT
	jr z, .select

	ld a, [wcd26]
	and a
	ret z
	sub $c
	jr nc, .asm_11c699
	xor a
.asm_11c699
	ld [wcd26], a
	jr .asm_11c6c4

.start
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	cp [hl]
	ret nc
	ld [wcd26], a
	ld a, [hl]
	ld b, a
	ld hl, wcd25
	ld a, [wcd26]
	add [hl]
	jr c, .asm_11c6b9
	cp b
	jr c, .asm_11c6c4
.asm_11c6b9
	ld a, [wcd28]
	ld hl, wcd26
	sub [hl]
	dec a
	ld [wcd25], a
.asm_11c6c4
	call Function11c992
	call Function11c7bc
	call Function11c86e
	ret

.select
	ld de, hJoyLast
	ld a, [de]
	and D_UP
	jr nz, .asm_11c708
	ld a, [de]
	and D_DOWN
	jr nz, .asm_11c731
	ld a, [de]
	and D_LEFT
	jr nz, .asm_11c746
	ld a, [de]
	and D_RIGHT
	jr nz, .asm_11c755
	ret

.a
	call Function11c8f6
	ld a, $4
	ld [wcd35], a
	jr .asm_11c6fc
.b
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c6fa
	ld a, $6
	jr .asm_11c6fc
.asm_11c6fa
	ld a, $15
.asm_11c6fc
	ld [wJumptableIndex], a
	ld hl, wcd24
	set 3, [hl]
	call PlayClickSFX
	ret
.asm_11c708
	ld a, [hl]
	cp $3
	jr c, .asm_11c711
	sub $3
	jr .asm_11c76e
.asm_11c711
	ld a, [wcd26]
	sub $3
	ret c
	ld [wcd26], a
	jr .asm_11c6c4
.asm_11c71c
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	ret c
	cp [hl]
	ret nc
	ld a, [wcd26]
	add $3
	ld [wcd26], a
	jr .asm_11c6c4
.asm_11c731
	ld a, [wcd28]
	ld b, a
	ld a, [wcd26]
	add [hl]
	add $3
	cp b
	ret nc
	ld a, [hl]
	cp $9
	jr nc, .asm_11c71c
	add $3
	jr .asm_11c76e
.asm_11c746
	ld a, [hl]
	and a
	ret z
	cp $3
	ret z
	cp $6
	ret z
	cp $9
	ret z
	dec a
	jr .asm_11c76e
.asm_11c755
	ld a, [wcd28]
	ld b, a
	ld a, [wcd26]
	add [hl]
	inc a
	cp b
	ret nc
	ld a, [hl]
	cp $2
	ret z
	cp $5
	ret z
	cp $8
	ret z
	cp $b
	ret z
	inc a
.asm_11c76e
	ld [hl], a
	ret

Function11c770: ; 11c770 (47:4770)
	xor a
	ld [wcd25], a
	ld [wcd26], a
	ld [wcd27], a
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c7ab
	ld a, [wcd21]
	and a
	jr z, .asm_11c799
	dec a
	sla a
	ld hl, Unknown_11f220
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wcd28], a
	ld a, [hl]
.asm_11c795
	ld [wcd29], a
	ret
.asm_11c799
	ld a, [wc7d2]
	ld [wcd28], a
.asm_11c79f
	ld c, $c
	call SimpleDivide
	and a
	jr nz, .asm_11c7a8
	dec b
.asm_11c7a8
	ld a, b
	jr .asm_11c795
.asm_11c7ab
	ld hl, $c68a + 30
	ld a, [CreditsTimer]
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hl]
	ld [wcd28], a
	jr .asm_11c79f

Function11c7bc: ; 11c7bc (47:47bc)
	ld bc, Unknown_11c854
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c814
	ld a, [wcd21]
	ld d, a
	and a
	jr z, .asm_11c7e9
	ld a, [wcd26]
	ld e, a
.asm_11c7d0
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	ret z
	push bc
	push de
	call Function11c05d
	pop de
	pop bc
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c7d0
	ret
.asm_11c7e9
	ld hl, wd100
	ld a, [wcd26]
	ld e, a
	add hl, de
.asm_11c7f1
	push de
	ld a, [hli]
	ld e, a
	ld d, $0
	push hl
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	jr z, .asm_11c811
	push bc
	call Function11c05d
	pop bc
	pop hl
	pop de
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c7f1
	ret
.asm_11c811
	pop hl
	pop de
	ret
.asm_11c814
	ld hl, $c648
	ld a, [wcd22]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wcd26]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [wcd26]
	ld e, a
.asm_11c831
	push de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	inc bc
	and l
	cp $ff
	jr z, .asm_11c851
	push bc
	call Function11c05d
	pop bc
	pop hl
	pop de
	inc e
	ld a, [wcd28]
	cp e
	jr nz, .asm_11c831
	ret
.asm_11c851
	pop hl
	pop de
	ret
; 11c854 (47:4854)

Unknown_11c854: ; 11c854
	dwcoord  2,  8
	dwcoord  8,  8
	dwcoord 14,  8
	dwcoord  2, 10
	dwcoord  8, 10
	dwcoord 14, 10
	dwcoord  2, 12
	dwcoord  8, 12
	dwcoord 14, 12
	dwcoord  2, 14
	dwcoord  8, 14
	dwcoord 14, 14
	dw -1
; 11c86e

Function11c86e: ; 11c86e (47:486e)
	ld a, [wcd26]
	and a
	jr z, .asm_11c88a
	hlcoord 2, 17
	ld de, String_11c8f0
	call PlaceString
	hlcoord 6, 17
	ld c, $3
	xor a
.asm_11c883
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_11c883
	jr .asm_11c895
.asm_11c88a
	hlcoord 2, 17
	ld c, $7
	ld a, $7f
.asm_11c891
	ld [hli], a
	dec c
	jr nz, .asm_11c891
.asm_11c895
	ld hl, wcd28
	ld a, [wcd26]
	add $c
	jr c, .asm_11c8b7
	cp [hl]
	jr nc, .asm_11c8b7
	hlcoord 16, 17
	ld de, String_11c8f3
	call PlaceString
	hlcoord 11, 17
	ld a, $3
	ld c, a
.asm_11c8b1
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_11c8b1
	ret
.asm_11c8b7
	hlcoord 17, 16
	ld a, $7f
	ld [hl], a
	hlcoord 11, 17
	ld c, $7
.asm_11c8c2
	ld [hli], a
	dec c
	jr nz, .asm_11c8c2
	ret
; 11c8c7 (47:48c7)

Function11c8c7: ; 11c8c7
	inc a
	push af
	and $f
	ld [hDividend], a
	pop af
	and $f0
	swap a
	ld [hQuotient], a
	xor a
	ld [$ffb5], a
	push hl
	callba Function11a80c
	pop hl
	ld a, [wcd63]
	add $f6
	ld [hli], a
	ld a, [wcd62]
	add $f6
	ld [hli], a
	ret
; 11c8ec

String_11c8ec: ; 11c8ec
	db "ぺージ@"
; 11c8f0

String_11c8f0: ; 11c8f0
	db "まえ@"
; 11c8f3

String_11c8f3: ; 11c8f3
	db "つぎ@"
; 11c8f6

Function11c8f6: ; 11c8f6 (47:48f6)
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11c95d
	push hl
	ld a, [wcd2b]
	and a
	jr nz, .asm_11c938
	ld a, [wcd21]
	ld d, a
	and a
	jr z, .asm_11c927
	ld hl, wcd26
	ld a, [wcd25]
	add [hl]
.asm_11c911
	ld e, a
.asm_11c912
	pop hl
	push de
	call Function11c05d
	pop de
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	ld c, a
	ld b, $0
	ld hl, wcd36
rept 2
	add hl, bc
endr
	ld [hl], e
	inc hl
	ld [hl], d
	ret
.asm_11c927
	ld hl, wcd26
	ld a, [wcd25]
	add [hl]
	ld c, a
	ld b, $0
	ld hl, wd100
	add hl, bc
	ld a, [hl]
	jr .asm_11c911
.asm_11c938
	ld hl, $c648
	ld a, [wcd22]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wcd26]
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [wcd25]
	ld e, a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	jr .asm_11c912

Function11c95d: ; 11c95d (47:495d)
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_11c986
	add hl, bc
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	push bc
	push bc
	pop hl
	ld a, $5
	ld c, a
	ld a, $7f
.asm_11c972
	ld [hli], a
	dec c
	jr nz, .asm_11c972
	dec hl
	ld bc, -20
	add hl, bc
	ld a, $5
	ld c, a
	ld a, $7f
.asm_11c980
	ld [hld], a
	dec c
	jr nz, .asm_11c980
	pop hl
	ret
; 11c986 (47:4986)

Unknown_11c986:
	dwcoord  1,  2
	dwcoord  7,  2
	dwcoord 13,  2
	dwcoord  1,  4
	dwcoord  7,  4
	dwcoord 13,  4
; 11c992

Function11c992: ; 11c992 (47:4992)
	ld a, $8
	hlcoord 2, 7
.asm_11c997
	push af
	ld a, $7f
	push hl
	ld bc, $11
	call ByteFill
	pop hl
	ld bc, $14
	add hl, bc
	pop af
	dec a
	jr nz, .asm_11c997
	ret

Function11c9ab: ; 11c9ab (47:49ab)
	ld a, $7
	hlcoord 0, 6, AttrMap
	ld bc, $c8
	call ByteFill
	callba Function104061
	ret

Function11c9bd: ; 11c9bd (47:49bd)
	ld de, String_11ca38
	call Function11ca7f

Function11c9c3: ; 11c9c3 (47:49c3)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11c9de
	ld a, [de]
	and $2
	jr nz, .asm_11c9e9
	ld a, [de]
	and $40
	jr nz, .asm_11c9f7
	ld a, [de]
	and $80
	jr nz, .asm_11c9fc
	ret
.asm_11c9de
	ld a, [hl]
	and a
	jr nz, .asm_11c9e9
	call Function11ca5e
	xor a
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
.asm_11c9e9
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wJumptableIndex], a
	call PlayClickSFX
	ret
.asm_11c9f7
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11c9fc
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret

Function11ca01: ; 11ca01 (47:4a01)
	hlcoord 14, 7, AttrMap
	ld de, $14
	ld a, $5
	ld c, a
.asm_11ca0a
	push hl
	ld a, $6
	ld b, a
	ld a, $7
.asm_11ca10
	ld [hli], a
	dec b
	jr nz, .asm_11ca10
	pop hl
	add hl, de
	dec c
	jr nz, .asm_11ca0a

Function11ca19: ; 11ca19 (47:4a19)
	hlcoord 0, 12, AttrMap
	ld de, $14
	ld a, $6
	ld c, a
.asm_11ca22
	push hl
	ld a, $14
	ld b, a
	ld a, $7
.asm_11ca28
	ld [hli], a
	dec b
	jr nz, .asm_11ca28
	pop hl
	add hl, de
	dec c
	jr nz, .asm_11ca22
	callba Function104061
	ret
; 11ca38 (47:4a38)

String_11ca38: ; 11ca38
	db   "とうろくちゅう", $25, "あいさつ", $1f, "ぜんぶ"
	next "けしても よろしいですか?@"
; 11ca57

String_11ca57: ; 11ca57
	db   "はい"
	next "いいえ@"
; 11ca5e

Function11ca5e: ; 11ca5e (47:4a5e)
	xor a
.asm_11ca5f
	push af
	call Function11ca6a
	pop af
	inc a
	cp $6
	jr nz, .asm_11ca5f
	ret

Function11ca6a: ; 11ca6a (47:4a6a)
	ld hl, wcd36
	ld c, a
	ld b, $0
rept 2
	add hl, bc
endr
	ld [hl], b
	inc hl
	ld [hl], b
	call Function11c95d
	ld de, String_11c3bc
	call PlaceString
	ret

Function11ca7f: ; 11ca7f (47:4a7f)
	push de
	ld de, Unknown_11cfc6
	call Function11cfce
	ld de, Unknown_11cfca
	call Function11cfce
	hlcoord 1, 14
	pop de
	call PlaceString
	hlcoord 16, 8
	ld de, String_11ca57
	call PlaceString
	call Function11ca01
	ld a, $1
	ld [wcd2a], a
	ld hl, wcd24
	res 4, [hl]
	call Function11cfb5
	ret

Function11caad: ; 11caad (47:4aad)
	ld de, String_11cb1c
	call Function11ca7f

Function11cab3: ; 11cab3 (47:4ab3)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11cace
	ld a, [de]
	and $2
	jr nz, .asm_11caf9
	ld a, [de]
	and $40
	jr nz, .asm_11cb12
	ld a, [de]
	and $80
	jr nz, .asm_11cb17
	ret
.asm_11cace
	call PlayClickSFX
	ld a, [hl]
	and a
	jr nz, .asm_11cafc
	ld a, [wcd35]
	and a
	jr z, .asm_11caf3
	cp $ff
	jr z, .asm_11caf3
	ld a, $ff
	ld [wcd35], a
	hlcoord 1, 14
	ld de, String_11cb31
	call PlaceString
	ld a, $1
	ld [wcd2a], a
	ret
.asm_11caf3
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
.asm_11caf9
	call PlayClickSFX
.asm_11cafc
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wJumptableIndex], a
	ld a, [wcd35]
	cp $ff
	ret nz
	ld a, $1
	ld [wcd35], a
	ret
.asm_11cb12
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11cb17
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret
; 11cb1c (47:4b1c)

String_11cb1c: ; 11cb1c
	db   "あいさつ", $25, "とうろく", $1f, "ちゅうし"
	next "しますか?@"
; 11cb31

String_11cb31: ; 11cb31
	db   "とうろくちゅう", $25, "あいさつ", $24, "ほぞん"
	next "されません", $4a, "よろしい ですか?@"
; 11cb52

Function11cb52: ; 11cb52 (47:4b52)
	ld hl, Unknown_11cc01
	ld a, [wcfa9]
.asm_11cb58
	dec a
	jr z, .asm_11cb5f
rept 2
	inc hl
endr
	jr .asm_11cb58
.asm_11cb5f
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	call Function11ca7f

Function11cb66: ; 11cb66 (47:4b66)
	ld hl, wcd2a
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and $1
	jr nz, .asm_11cb81
	ld a, [de]
	and $2
	jr nz, .asm_11cbd7
	ld a, [de]
	and $40
	jr nz, .asm_11cbeb
	ld a, [de]
	and $80
	jr nz, .asm_11cbf0
	ret
.asm_11cb81
	ld a, [hl]
	and a
	jr nz, .asm_11cbd4
	ld a, $4
	call GetSRAMBank
	ld hl, $a007
	ld a, [wcfa9]
	dec a
	sla a
	sla a
	ld c, a
	sla a
	add c
	ld c, a
	ld b, $0
	add hl, bc
	ld de, wcd36
	ld c, $c
.asm_11cba2
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .asm_11cba2
	call CloseSRAM
	call PlayClickSFX
	ld de, Unknown_11cfc6
	call Function11cfce
	ld hl, Unknown_11cc7e
	ld a, [wcfa9]
.asm_11cbba
	dec a
	jr z, .asm_11cbc1
rept 2
	inc hl
endr
	jr .asm_11cbba
.asm_11cbc1
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	hlcoord 1, 14
	call PlaceString
	ld hl, wJumptableIndex
	inc [hl]
	inc hl
	ld a, $10
	ld [hl], a
	ret
.asm_11cbd4
	call PlayClickSFX
.asm_11cbd7
	ld de, Unknown_11cfba
	call Function11cfce
	call Function11c38a
	ld hl, wcd24
	set 4, [hl]
	ld a, $4
	ld [wJumptableIndex], a
	ret
.asm_11cbeb
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ret
.asm_11cbf0
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ret

Function11cbf5: ; 11cbf5 (47:4bf5)
	call WaitSFX
	ld hl, wcf64
	dec [hl]
	ret nz
	dec hl
	set 7, [hl]
	ret
; 11cc01 (47:4c01)

Unknown_11cc01: ; 11cc01
	dw String_11cc09
	dw String_11cc23
	dw String_11cc42
	dw String_11cc60

String_11cc09: ; 11cc09
	db   "じこしょうかい は"
	next "この あいさつで いいですか?@"

String_11cc23: ; 11cc23
	db   "たいせん ", $4a, "はじまるとき は"
	next "この あいさつで いいですか?@"

String_11cc42: ; 11cc42
	db   "たいせん ", $1d, "かったとき は"
	next "この あいさつで いいですか?@"

String_11cc60: ; 11cc60
	db   "たいせん ", $1d, "まけたとき は"
	next "この あいさつで いいですか?@"
; 11cc7e

Unknown_11cc7e: ; 11cc7e
	dw String_11cc86
	dw String_11cc9d
	dw String_11ccb9
	dw String_11ccd4

String_11cc86: ; 11cc86
	db   "じこしょうかい の"
	next "あいさつ", $1f, "とうろくした!@"

String_11cc9d: ; 11cc9d
	db   "たいせん ", $4a, "はじまるとき の"
	next "あいさつ", $1f, "とうろくした!@"

String_11ccb9: ; 11ccb9
	db   "たいせん ", $1d, "かったとき の"
	next "あいさつ", $1f, "とうろくした!@"

String_11ccd4: ; 11ccd4
	db   "たいせん ", $1d, "まけたとき の"
	next "あいさつ", $1f, "とうろくした!@"
; 11ccef

Function11ccef: ; 11ccef (47:4cef)
	ld de, Unknown_11cfc6
	call Function11cfce
	hlcoord 1, 14
	ld de, String_11cd10
	call PlaceString
	call Function11ca19
	call Function11cfb5

Function11cd04: ; 11cd04 (47:4d04)
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and a
	ret z
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 11cd10 (47:4d10)

String_11cd10: ; 11cd10
	db "なにか ことば", $1f, "いれてください@"
; 11cd20

Function11cd20: ; 11cd20 (47:4d20)
	call Function11c277
	ld de, Unknown_11cfc6
	call Function11cfce
	hlcoord 1, 14
	ld a, [wcd2b]
	ld [wcd2c], a
	and a
	jr nz, .asm_11cd3a
	ld de, String_11cdc7
	jr .asm_11cd3d
.asm_11cd3a
	ld de, String_11cdd9
.asm_11cd3d
	call PlaceString
	hlcoord 4, 8
	ld de, String_11cdf5
	call PlaceString
	call Function11cdaa
	ld hl, wcd24
	res 5, [hl]
	call Function11cfb5

Function11cd54: ; 11cd54 (47:4d54)
	ld hl, wcd2c
	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and A_BUTTON
	jr nz, .asm_11cd6f
	ld a, [de]
	and B_BUTTON
	jr nz, .asm_11cd73
	ld a, [de]
	and D_UP
	jr nz, .asm_11cd8b
	ld a, [de]
	and D_DOWN
	jr nz, .asm_11cd94
	ret

.asm_11cd6f
	ld a, [hl]
	ld [wcd2b], a
.asm_11cd73
	ld a, [wcd2b]
	and a
	jr nz, .asm_11cd7d
	ld a, $6
	jr .asm_11cd7f

.asm_11cd7d
	ld a, $15
.asm_11cd7f
	ld [wJumptableIndex], a
	ld hl, wcd24
	set 5, [hl]
	call PlayClickSFX
	ret

.asm_11cd8b
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld de, String_11cdc7
	jr .asm_11cd9b

.asm_11cd94
	ld a, [hl]
	and a
	ret nz
	inc [hl]
	ld de, String_11cdd9
.asm_11cd9b
	push de
	ld de, Unknown_11cfc6
	call Function11cfce
	pop de
	hlcoord 1, 14
	call PlaceString
	ret

Function11cdaa: ; 11cdaa (47:4daa)
	ld a, $2
	hlcoord 0, 6, AttrMap
	ld bc, $78
	call ByteFill
	ld a, $7
	hlcoord 0, 12, AttrMap
	ld bc, $50
	call ByteFill
	callba Function104061
	ret
; 11cdc7 (47:4dc7)

String_11cdc7: ; 11cdc7
	db   "ことば", $1f, "しゅるいべつに"
	next "えらべます@"
; 11cdd9

String_11cdd9: ; 11cdd9
	db   "ことば", $1f, "アイウエォ の"
	next "じゅんばんで ひょうじ します@"
; 11cdf5

String_11cdf5: ; 11cdf5
	db "しゅるいべつ モード"
	next "アイウエォ  モード@"
; 11ce0b

Function11ce0b: ; 11ce0b (47:4e0b)
	call Function11c277
	hlcoord 1, 7
	ld de, String_11cf79
	call PlaceString
	hlcoord 1, 17
	ld de, String_11c62a
	call PlaceString
	call Function11c618
	ld hl, wcd24
	res 2, [hl]
	call Function11cfb5

Function11ce2b: ; 11ce2b (47:4e2b)
	ld a, [CreditsTimer]
	sla a
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_11ceb9
	add hl, bc

	ld de, hJoypadPressed ; $ffa3
	ld a, [de]
	and START
	jr nz, .start
	ld a, [de]
	and SELECT
	jr nz, .select
	ld a, [de]
	and A_BUTTON
	jr nz, .a
	ld a, [de]
	and B_BUTTON
	jr nz, .b

	ld de, hJoyLast
	ld a, [de]
	and D_UP
	jr nz, .up
	ld a, [de]
	and D_DOWN
	jr nz, .down
	ld a, [de]
	and D_LEFT
	jr nz, .left
	ld a, [de]
	and D_RIGHT
	jr nz, .right

	ret

.a
	ld a, [CreditsTimer]
	cp $2d
	jr c, .asm_11ce92
	sub $2d
	jr z, .asm_11cea4
	dec a
	jr z, .asm_11ce96
	jr .b

.start
	ld hl, wcd24
	set 0, [hl]
	ld a, $8
	ld [BGMapBuffer], a ; wcd20 (aliases: CreditsPos)
.b
	ld a, $4
	jr .asm_11ce98
.select
	ld a, [wcd2b]
	xor $1
	ld [wcd2b], a
	ld a, $6
	jr .asm_11ce98

.asm_11ce92
	ld a, $8
	jr .asm_11ce98

.asm_11ce96
	ld a, $13
.asm_11ce98
	ld [wJumptableIndex], a
	ld hl, wcd24
	set 2, [hl]
	call PlayClickSFX
	ret
.asm_11cea4
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	call Function11ca6a
	call PlayClickSFX
	ret

.left
	inc hl
.down
	inc hl
.right
	inc hl
.up
	ld a, [hl]
	cp $ff
	ret z
	ld [CreditsTimer], a
	ret
; 11ceb9 (47:4eb9)

Unknown_11ceb9: ; 11ceb9
	; up left down right
	db $ff, $01, $05, $ff
	db $ff, $02, $06, $00
	db $ff, $03, $07, $01
	db $ff, $04, $08, $02
	db $ff, $14, $09, $03
	db $00, $06, $0a, $ff
	db $01, $07, $0b, $05
	db $02, $08, $0c, $06
	db $03, $09, $0d, $07
	db $04, $19, $0e, $08
	db $05, $0b, $0f, $ff
	db $06, $0c, $10, $0a
	db $07, $0d, $11, $0b
	db $08, $0e, $12, $0c
	db $09, $1e, $13, $0d
	db $0a, $10, $2d, $ff
	db $0b, $11, $2d, $0f
	db $0c, $12, $2d, $10
	db $0d, $13, $2d, $11
	db $0e, $26, $2d, $12
	db $ff, $15, $19, $04
	db $ff, $16, $1a, $14
	db $ff, $17, $1b, $15
	db $ff, $18, $1c, $16
	db $ff, $23, $1d, $17
	db $14, $1a, $1e, $09
	db $15, $1b, $1f, $19
	db $16, $1c, $20, $1a
	db $17, $1d, $21, $1b
	db $18, $2b, $22, $1c
	db $19, $1f, $26, $0e
	db $1a, $20, $27, $1e
	db $1b, $21, $28, $1f
	db $1c, $22, $29, $20
	db $1d, $2c, $2a, $21
	db $ff, $24, $2b, $18
	db $ff, $25, $2b, $23
	db $ff, $ff, $2b, $24
	db $1e, $27, $2e, $13
	db $1f, $28, $2e, $26
	db $20, $29, $2e, $27
	db $21, $2a, $2e, $28
	db $22, $ff, $2e, $29
	db $23, $ff, $2c, $1d
	db $2b, $ff, $2f, $22
	db $0f, $2e, $ff, $ff
	db $26, $2f, $ff, $2d
	db $2c, $ff, $ff, $2e
; 11cf79

String_11cf79: ; 11cf79
	db   "あいうえお なにぬねの や ゆ よ"
	next "かきくけこ はひふへほ わ"
	next "さしすせそ まみむめも そのた"
	next "たちつてと らりるれろ"
	db   "@"
; 11cfb5

Function11cfb5: ; 11cfb5 (47:4fb5)
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 11cfba (47:4fba)

Unknown_11cfba:
	db  0,  0 ; start coords
	db 20,  6 ; end coords

Unknown_11cfbe:
	db  0, 14 ; start coords
	db 20,  4 ; end coords

Unknown_11cfc2:
	db  0,  6 ; start coords
	db 20, 10 ; end coords

Unknown_11cfc6:
	db  0, 12 ; start coords
	db 20,  6 ; end coords

Unknown_11cfca:
	db 14,  7 ; start coords
	db  6,  5 ; end coords
; 11cfce

Function11cfce: ; 11cfce (47:4fce)
	hlcoord 0, 0
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	and a
.asm_11cfda
	jr z, .asm_11cfe0
	add hl, bc
	dec a
	jr .asm_11cfda
.asm_11cfe0
	pop af
	ld c, a
	ld b, 0
	add hl, bc
	push hl
	ld a, $79
	ld [hli], a
	ld a, [de]
	inc de
rept 2
	dec a
endr
	jr z, .asm_11cff6
	ld c, a
	ld a, $7a
.asm_11cff2
	ld [hli], a
	dec c
	jr nz, .asm_11cff2
.asm_11cff6
	ld a, $7b
	ld [hl], a
	pop hl
	ld bc, $14
	add hl, bc
	ld a, [de]
	dec de
rept 2
	dec a
endr
	jr z, .asm_11d022
	ld b, a
.asm_11d005
	push hl
	ld a, $7c
	ld [hli], a
	ld a, [de]
rept 2
	dec a
endr
	jr z, .asm_11d015
	ld c, a
	ld a, $7f
.asm_11d011
	ld [hli], a
	dec c
	jr nz, .asm_11d011
.asm_11d015
	ld a, $7c
	ld [hl], a
	pop hl
	push bc
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_11d005
.asm_11d022
	ld a, $7d
	ld [hli], a
	ld a, [de]
rept 2
	dec a
endr
	jr z, .asm_11d031
	ld c, a
	ld a, $7a
.asm_11d02d
	ld [hli], a
	dec c
	jr nz, .asm_11d02d
.asm_11d031
	ld a, $7e
	ld [hl], a
	ret

Function11d035: ; 11d035 (47:5035)
	hlcoord 0, 0
	ld bc, $14
	ld a, [de]
	inc de
	push af
	ld a, [de]
	inc de
	and a
.asm_11d041
	jr z, .asm_11d047
	add hl, bc
	dec a
	jr .asm_11d041
.asm_11d047
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	push hl
	ld a, $79
	ld [hl], a
	pop hl
	push hl
	ld a, [de]
	dec a
	inc de
	ld c, a
	add hl, bc
	ld a, $7b
	ld [hl], a
	call Function11d0ac
	ld a, $7e
	ld [hl], a
	pop hl
	push hl
	call Function11d0ac
	ld a, $7d
	ld [hl], a
	pop hl
	push hl
	inc hl
	push hl
	call Function11d0ac
	pop bc
	dec de
	ld a, [de]
	cp $2
	jr z, .asm_11d082
rept 2
	dec a
endr
.asm_11d078
	push af
	ld a, $7a
	ld [hli], a
	ld [bc], a
	inc bc
	pop af
	dec a
	jr nz, .asm_11d078
.asm_11d082
	pop hl
	ld bc, $14
	add hl, bc
	push hl
	ld a, [de]
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	inc de
	ld a, [de]
	cp $2
	ret z
	push bc
rept 2
	dec a
endr
	ld c, a
	ld b, a
	ld de, $14
.asm_11d09c
	ld a, $7c
	ld [hl], a
	add hl, de
	dec c
	jr nz, .asm_11d09c
	pop hl
.asm_11d0a4
	ld a, $7c
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_11d0a4
	ret

Function11d0ac: ; 11d0ac (47:50ac)
	ld a, [de]
	dec a
	ld bc, $14
.asm_11d0b1
	add hl, bc
	dec a
	jr nz, .asm_11d0b1
	ret

Function11d0b6: ; 11d0b6 (47:50b6)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, Jumptable_11d0c7
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_11d0c7: ; 11d0c7 (47:50c7)
	dw Function11d0dd
	dw Function11d0e9
	dw Function11d0f5
	dw Function11d10f
	dw Function11d134
	dw Function11d145
	dw Function11d156
	dw Function11d175
	dw Function11d1d7
	dw Function11d1d1
	dw Function11d1fc


Function11d0dd: ; 11d0dd (47:50dd)
	ld a, [BGMapBuffer] ; wcd20 (aliases: CreditsPos)
	sla a
	ld hl, Unknown_11d208
	ld e, $1
	jr asm_11d11e

Function11d0e9: ; 11d0e9 (47:50e9)
	ld a, [wcd21]
	sla a
	ld hl, Unknown_11d21a
	ld e, $2
	jr asm_11d11e

Function11d0f5: ; 11d0f5 (47:50f5)
	ld hl, Unknown_11d2be
	ld a, [CreditsTimer]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call Function3b3c
	ld a, [CreditsTimer]
	sla a
	ld hl, Unknown_11d23e
	ld e, $4
	jr asm_11d11e

Function11d10f: ; 11d10f (47:510f)
	ld a, $27
	call Function3b3c
	ld a, [wcd25]
	sla a
	ld hl, Unknown_11d29e
	ld e, $8

asm_11d11e: ; 11d11e (47:511e)
	push de
	ld e, a
	ld d, $0
	add hl, de
	push hl
	pop de
	ld hl, $4
	add hl, bc
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	pop de
	ld a, e
	call Function11d2ee
	ret

Function11d134: ; 11d134 (47:5134)
	ld a, $27
	call Function3b3c
	ld a, [wcd2a]
	sla a
	ld hl, Unknown_11d2b6
	ld e, $10
	jr asm_11d11e

Function11d145: ; 11d145 (47:5145)
	ld a, $27
	call Function3b3c
	ld a, [wcd2c]
	sla a
	ld hl, Unknown_11d2ba
	ld e, $20
	jr asm_11d11e

Function11d156: ; 11d156 (47:5156)
	ld a, $2a
	call Function3b3c
	ld a, [wcd4a]
	sla a
	sla a
	sla a
	add $18
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, $30
	ld [hl], a
	ld a, $1
	ld e, a
	call Function11d2ee
	ret

Function11d175: ; 11d175 (47:5175)
	ld a, [wcd4d]
	cp $4
	jr z, .asm_11d180
	ld a, $28
	jr .asm_11d182
.asm_11d180
	ld a, $26
.asm_11d182
	call Function3b3c
	ld a, [wcd4d]
	cp $4
	jr z, .asm_11d1b1
	ld a, [wcd4c]
	sla a
	sla a
	sla a
	add $20
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, [wcd4d]
	sla a
	sla a
	sla a
	sla a
	add $48
	ld [hl], a
	ld a, $2
	ld e, a
	call Function11d2ee
	ret
.asm_11d1b1
	ld a, [wcd4c]
	sla a
	sla a
	sla a
	ld e, a
	sla a
	sla a
	add e
	add $18
	ld hl, $4
	add hl, bc
	ld [hli], a
	ld a, $8a
	ld [hl], a
	ld a, $2
	ld e, a
	call Function11d2ee
	ret

Function11d1d1: ; 11d1d1 (47:51d1)
	ld d, $98
	ld a, $2c
	jr asm_11d1db

Function11d1d7: ; 11d1d7 (47:51d7)
	ld d, $10
	ld a, $2b

asm_11d1db: ; 11d1db (47:51db)
	push de
	call Function3b3c
	ld a, [wcd4a]
	sla a
	sla a
	sla a
	ld e, a
	sla a
	add e
	add $40
	ld hl, $5
	add hl, bc
	ld [hld], a
	pop af
	ld [hl], a
	ld a, $4
	ld e, a
	call Function11d2ee
	ret

Function11d1fc: ; 11d1fc (47:51fc)
	ld a, $26
	call Function3b3c
	ld a, $8
	ld e, a
	call Function11d2ee
	ret
; 11d208 (47:5208)

Unknown_11d208: ; 11d208
	db $0d, $1a
	db $3d, $1a
	db $6d, $1a
	db $0d, $2a
	db $3d, $2a
	db $6d, $2a
	db $0d, $8a
	db $3d, $8a
	db $6d, $8a

Unknown_11d21a: ; 11d21a
	db $0d, $42
	db $3d, $42
	db $6d, $42
	db $0d, $52
	db $3d, $52
	db $6d, $52
	db $0d, $62
	db $3d, $62
	db $6d, $62
	db $0d, $72
	db $3d, $72
	db $6d, $72
	db $0d, $82
	db $3d, $82
	db $6d, $82
	db $0d, $92
	db $3d, $92
	db $6d, $92

Unknown_11d23e: ; 11d23e
	db $10, $48
	db $18, $48
	db $20, $48
	db $28, $48
	db $30, $48
	db $10, $58
	db $18, $58
	db $20, $58
	db $28, $58
	db $30, $58
	db $10, $68
	db $18, $68
	db $20, $68
	db $28, $68
	db $30, $68
	db $10, $78
	db $18, $78
	db $20, $78
	db $28, $78
	db $30, $78
	db $40, $48
	db $48, $48
	db $50, $48
	db $58, $48
	db $60, $48
	db $40, $58
	db $48, $58
	db $50, $58
	db $58, $58
	db $60, $58
	db $40, $68
	db $48, $68
	db $50, $68
	db $58, $68
	db $60, $68
	db $70, $48
	db $80, $48
	db $90, $48
	db $40, $78
	db $48, $78
	db $50, $78
	db $58, $78
	db $60, $78
	db $70, $58
	db $70, $68
	db $0d, $92
	db $3d, $92
	db $6d, $92

Unknown_11d29e: ; 11d29e
	db $10, $50
	db $40, $50
	db $70, $50
	db $10, $60
	db $40, $60
	db $70, $60
	db $10, $70
	db $40, $70
	db $70, $70
	db $10, $80
	db $40, $80
	db $70, $80

Unknown_11d2b6: ; 11d2b6
	db $80, $50
	db $80, $60

Unknown_11d2ba: ; 11d2ba
	db $20, $50
	db $20, $60

Unknown_11d2be: ; 11d2be
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $28, $28
	db $29, $26
	db $26, $26

Function11d2ee: ; 11d2ee (47:52ee)
	ld hl, wcd24
	and [hl]
	jr nz, .asm_11d316
	ld a, e
	ld hl, wcd23
	and [hl]
	jr z, .asm_11d30f
	ld hl, $e
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_11d305
	dec [hl]
	ret
.asm_11d305
	ld a, $0
	ld [hld], a
	ld a, $1
	xor [hl]
	ld [hl], a
	and a
	jr nz, .asm_11d316
.asm_11d30f
	ld hl, $7
	add hl, bc
	xor a
	ld [hl], a
	ret
.asm_11d316
	ld hl, $5
	add hl, bc
	ld a, $b0
	sub [hl]
	ld hl, $7
	add hl, bc
	ld [hl], a
	ret

Function11d323: ; 11d323
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_11d33a
	ld de, Unkn1Pals
	ld bc, 16 * 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 11d33a

Palette_11d33a:
	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 16, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 23, 17, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

; 11d3ba

Function11d3ba: ; 11d3ba
	ld a, [rSVBK]
	push af
	ld hl, BattleMonSpclDef
	ld a, $0
	ld [wcd2d], a
	ld [hli], a
	ld a, $d8
	ld [wcd2e], a
	ld [hl], a
	ld a, $fe
	ld [wcd2f], a
	ld a, $54
	ld [wcd30], a
	ld a, $a8
	ld [wcd31], a
	ld a, $c6
	ld [wcd32], a
	ld a, $4a
	ld [wcd33], a
	ld a, $c6
	ld [wcd34], a
	ld hl, Unknown_11f23c
	ld a, $2d

Function11d3ef: ; 11d3ef
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	push hl
	ld hl, Unkn1Pals
	add hl, de
	ld a, [wcd2d]
	ld e, a
	ld a, [wcd2e]
	ld d, a
	push bc
.asm_11d406
	ld a, $3
	ld [rSVBK], a
	ld a, [hli]
	push af
	ld a, $5
	ld [rSVBK], a
	pop af
	ld [de], a
	inc de
	ld a, $3
	ld [rSVBK], a
	ld a, [hli]
	push af
	ld a, $5
	ld [rSVBK], a
	pop af
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_11d406
	ld a, [wcd2f]
	ld l, a
	ld a, [wcd30]
	ld h, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, l
	ld [wcd2f], a
	ld a, h
	ld [wcd30], a
	push bc
	pop hl
	ld c, $0
.asm_11d43d
	ld a, [hl]
	cp $ff
	jr z, .asm_11d453
	call Function11d493
	jr nz, .asm_11d44a
	inc hl
	jr .asm_11d43d

.asm_11d44a
	ld a, [hli]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	inc c
	jr .asm_11d43d

.asm_11d453
	pop hl
	ld b, $0
	add hl, bc
	push hl
	pop bc
	ld a, [wcd31]
	ld l, a
	ld a, [wcd32]
	ld h, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, l
	ld [wcd31], a
	ld a, h
	ld [wcd32], a
	ld a, [wcd33]
	ld l, a
	ld a, [wcd34]
	ld h, a
	ld a, e
	ld [wcd2d], a
	ld [hli], a
	ld a, d
	ld [wcd2e], a
	ld [hli], a
	ld a, l
	ld [wcd33], a
	ld a, h
	ld [wcd34], a
	pop hl
	pop af
	dec a
	jr z, .asm_11d48f
	jp Function11d3ef

.asm_11d48f
	pop af
	ld [rSVBK], a
	ret
; 11d493

Function11d493: ; 11d493
	push hl
	push bc
	push de
	dec a
	ld hl, rSVBK
	ld e, $1
	ld [hl], e
	call CheckSeenMon
	ld hl, rSVBK
	ld e, $5
	ld [hl], e
	pop de
	pop bc
	pop hl
	ret
; 11d4aa

Function11d4aa: ; 11d4aa
	ld a, [rSVBK]
	push af
	ld a, $3
	ld [rSVBK], a
	ld hl, Unknown_11daac
	ld bc, Unknown_11f220
	xor a
	ld [wcd2d], a
	inc a
	ld [wcd2e], a
	ld a, $e
.asm_11d4c1
	push af
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push hl
	ld hl, $0005
	add hl, de
	ld a, [bc]
rept 2
	inc bc
endr
	push bc
.asm_11d4cf
	push af
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ld hl, wd000
	add hl, de
	ld a, [wcd2d]
	ld [hli], a
	inc a
	ld [wcd2d], a
	ld a, [wcd2e]
	ld [hl], a
	pop hl
	ld de, $0008
	add hl, de
	pop af
	dec a
	jr nz, .asm_11d4cf
	ld hl, wcd2d
	xor a
	ld [hli], a
	inc [hl]
	pop bc
	pop hl
	pop af
	dec a
	jr nz, .asm_11d4c1
	pop af
	ld [rSVBK], a
	ret
; 11d4fe


Unknown_11d4fe:
; Pokemon sorted by kana.
; Notably, Rhydon is missing.

	dw Unknown_11d558
	dw Unknown_11d55f
	dw Unknown_11d565
	dw Unknown_11d56c
	dw Unknown_11d574
	dw Unknown_11d57f
	dw Unknown_11d58e
	dw Unknown_11d598
	dw Unknown_11d59f
	dw Unknown_11d5a3
	dw Unknown_11d5b2
	dw Unknown_11d5bb
	dw Unknown_11d5c0
	dw Unknown_11d5c8
	dw Unknown_11d5cb
	dw Unknown_11d5cd
	dw Unknown_11d5d1
	dw Unknown_11d5d4
	dw Unknown_11d5d6
	dw Unknown_11d5dc
	dw Unknown_11d5e7
	dw Unknown_11d5ea
	dw Unknown_11d5f7
	dw Unknown_11d5f9
	dw Unknown_11d5fc
	dw Unknown_11d5fe
	dw Unknown_11d60e
	dw Unknown_11d61d
	dw Unknown_11d62e
	dw Unknown_11d636
	dw Unknown_11d63e
	dw Unknown_11d649
	dw Unknown_11d64e
	dw Unknown_11d651
	dw Unknown_11d656
	dw Unknown_11d65a
	dw Unknown_11d660
	dw Unknown_11d662
	dw Unknown_11d665
	dw Unknown_11d66d
	dw Unknown_11d671
	dw Unknown_11d674
	dw Unknown_11d678
	dw Unknown_11d67a
	dw Unknown_11d67d

Unknown_11d558:	db EKANS, ARBOK, SEAKING, ARIADOS, CROCONAW, UNOWN, $ff
Unknown_11d55f:	db EEVEE, GEODUDE, SPINARAK, PILOSWINE, ONIX, $ff
Unknown_11d565:	db ARCANINE, SUDOWOODO, WEEPINBELL, VICTREEBEL, WOOPER, SWINUB, $ff
Unknown_11d56c:	db SKARMORY, AIPOM, ESPEON, HITMONCHAN, ELEKID, ELECTABUZZ, ENTEI, $ff
Unknown_11d574:	db FERALIGATR, FURRET, OCTILLERY, PRIMEAPE, SENTRET, STANTLER, SPEAROW, FEAROW, OMASTAR, OMANYTE, $ff
Unknown_11d57f:	db GROWLITHE, MACHAMP, DRAGONITE, PINSIR, SNORLAX, KABUTO, KABUTOPS, HITMONTOP, WARTORTLE, BLASTOISE, FARFETCH_D, CUBONE, MAROWAK, KANGASKHAN, $ff
Unknown_11d58e:	db SUNFLORA, CATERPIE, GYARADOS, RAPIDASH, NINETALES, GIRAFARIG, BELLOSSOM, KINGDRA, KINGLER, $ff
Unknown_11d598:	db GLOOM, PINECO, GLIGAR, KRABBY, GRANBULL, CROBAT, $ff
Unknown_11d59f:	db ABRA, GENGAR, TAUROS, $ff
Unknown_11d5a3:	db MAGIKARP, MAGNEMITE, GASTLY, HAUNTER, MACHOKE, KAKUNA, PSYDUCK, PHANPY, RATTATA, GOLDUCK, GOLBAT, GOLEM, GRAVELER, VENONAT, $ff
Unknown_11d5b2:	db RHYHORN, PUPITAR, CORSOLA, HITMONLEE, ZAPDOS, JOLTEON, SANDSHREW, SANDSLASH, $ff
Unknown_11d5bb:	db SEADRA, SHELLDER, VAPOREON, DEWGONG, $ff
Unknown_11d5c0:	db SUICUNE, STARMIE, SCYTHER, ZUBAT, BEEDRILL, HYPNO, DROWZEE, $ff
Unknown_11d5c8:	db SQUIRTLE, CELEBI, $ff
Unknown_11d5cb:	db WOBBUFFET, $ff
Unknown_11d5cd:	db DUGTRIO, HORSEA, EXEGGCUTE, $ff
Unknown_11d5d1:	db CHIKORITA, CHINCHOU, $ff
Unknown_11d5d4:	db SHUCKLE, $ff
Unknown_11d5d6:	db DIGLETT, REMORAID, DELIBIRD, HOUNDOUR, AMPHAROS, $ff
Unknown_11d5dc:	db DODUO, DODRIO, SMEARGLE, KOFFING, TENTACRUEL, TOGETIC, TOGEPI, GOLDEEN, METAPOD, DONPHAN, $ff
Unknown_11d5e7:	db ODDISH, EXEGGUTOR, $ff
Unknown_11d5ea:	db NIDOKING, NIDOQUEEN, NIDORAN_M, NIDORAN_F, NIDORINA, NIDORINO, MEOWTH, SNEASEL, POLIWHIRL, POLITOED, POLIWRATH, POLIWAG, $ff
Unknown_11d5f7:	db QUAGSIRE, $ff
Unknown_11d5f9:	db NATU, XATU, $ff
Unknown_11d5fc:	db DUNSPARCE, $ff
Unknown_11d5fe:	db SEEL, STEELIX, TYPHLOSION, DRAGONAIR, BUTTERFREE, SCIZOR, HOPPIP, BLISSEY, PARAS, PARASECT, QWILFISH, MR__MIME, TYROGUE, CLOYSTER, TYRANITAR, $ff
Unknown_11d60e:	db CLEFFA, WEEDLE, PIKACHU, CLEFABLE, PIDGEOT, PIDGEOTTO, PICHU, CLEFAIRY, CHARMANDER, STARYU, CYNDAQUIL, SUNKERN, TEDDIURSA, VOLTORB, $ff
Unknown_11d61d:	db MOLTRES, FLAREON, ALAKAZAM, MAGMAR, FORRETRESS, WIGGLYTUFF, IVYSAUR, BULBASAUR, VENUSAUR, AERODACTYL, MAGBY, IGGLYBUFF, UMBREON, ARTICUNO, JIGGLYPUFF, SNUBBULL, $ff
Unknown_11d62e:	db BAYLEEF, GRIMER, MUK, HERACROSS, HOUNDOOM, PERSIAN, LICKITUNG, $ff
Unknown_11d636:	db HO_OH, HOOTHOOT, PIDGEY, PONYTA, SKIPLOOM, PORYGON, PORYGON2, $ff
Unknown_11d63e:	db MAGCARGO, SLUGMA, QUILAVA, BELLSPROUT, WEEZING, MARILL, AZUMARILL, ELECTRODE, MANKEY, MANTINE, $ff
Unknown_11d649:	db DRATINI, MEW, MEWTWO, MILTANK, $ff
Unknown_11d64e:	db MISDREAVUS, SMOOCHUM, $ff
Unknown_11d651:	db MEGANIUM, DITTO, TENTACOOL, MAREEP, $ff
Unknown_11d656:	db FLAAFFY, VENOMOTH, TANGELA, $ff
Unknown_11d65a:	db SLOWKING, SLOWBRO, SLOWPOKE, MURKROW, YANMA, $ff
Unknown_11d660:	db KADABRA, $ff
Unknown_11d662:	db LARVITAR, NOCTOWL, $ff
Unknown_11d665:	db RAIKOU, RAICHU, CHANSEY, RATICATE, LAPRAS, VILEPLUME, LANTURN, $ff
Unknown_11d66d:	db CHARMELEON, CHARIZARD, URSARING, $ff
Unknown_11d671:	db JYNX, LUGIA, $ff
Unknown_11d674:	db MAGNETON, LEDIAN, LEDYBA, $ff
Unknown_11d678:	db VULPIX, $ff
Unknown_11d67a:	db JUMPLUFF, TOTODILE, MACHOP
Unknown_11d67d:	db $ff
; 11d67e

GFX_11d67e:
INCBIN "gfx/pokedex/select_start.2bpp"
; 11d6de

LZ_11d6de:
INCBIN "gfx/pokedex/slowpoke.2bpp.lz"
; 11da52

Strings_11da52: ; 11da52
	db "ポケモン@@"
	db "タイプ@@@"
	db "あいさつ@@"
	db "ひと@@@@"
	db "バトル@@@"
	db "こえ@@@@"
	db "かいわ@@@"
	db "きもち@@@"
	db "じょうたい@"
	db "せいかつ@@"
	db "しゅみ@@@"
	db "こうどう@@"
	db "じかん@@@"
	db "むすび@@@"
	db "あれこれ@@"
; 11daac

Unknown_11daac: ; 11daac
	dw Unknown_11dac8
	dw Unknown_11db58
	dw Unknown_11dc78
	dw Unknown_11dea0
	dw Unknown_11e0c8
	dw Unknown_11e2d8
	dw Unknown_11e4e8
	dw Unknown_11e710
	dw Unknown_11e920
	dw Unknown_11ea58
	dw Unknown_11eb90
	dw Unknown_11edb8
	dw Unknown_11eef0
	dw Unknown_11f100

Unknown_11dac8: ; 11dac8
	db "あく@@@", $26, $0, $0
	db "いわ@@@", $aa, $0, $0
	db "エスパー@", $da, $0, $0
	db "かくとう@", $4e, $1, $0
	db "くさ@@@", $ba, $1, $0
	db "ゴースト@", $e4, $1, $0
	db "こおり@@", $e6, $1, $0
	db "じめん@@", $68, $2, $0
	db "タイプ@@", $e8, $2, $0
	db "でんき@@", $8e, $3, $0
	db "どく@@@", $ae, $3, $0
	db "ドラゴン@", $bc, $3, $0
	db "ノーマル@", $22, $4, $0
	db "はがね@@", $36, $4, $0
	db "ひこう@@", $5e, $4, $0
	db "ほのお@@", $b2, $4, $0
	db "みず@@@", $f4, $4, $0
	db "むし@@@", $12, $5, $0

Unknown_11db58: ; 11db58
	db "ありがと@", $58, $0, $0
	db "ありがとう", $5a, $0, $0
	db "いくぜ!@", $80, $0, $0
	db "いくよ!@", $82, $0, $0
	db "いくわよ!", $84, $0, $0
	db "いやー@@", $a6, $0, $0
	db "おっす@@", $a, $1, $0
	db "おはつです", $22, $1, $0
	db "おめでとう", $2a, $1, $0
	db "ごめん@@", $f8, $1, $0
	db "ごめんよ@", $fa, $1, $0
	db "こらっ@@", $fc, $1, $0
	db "こんちは!", $a, $2, $0
	db "こんにちは", $10, $2, $0
	db "さようなら", $28, $2, $0
	db "サンキュー", $2e, $2, $0
	db "さんじょう", $30, $2, $0
	db "しっけい@", $48, $2, $0
	db "しつれい@", $4c, $2, $0
	db "じゃーね@", $6c, $2, $0
	db "すいません", $8c, $2, $0
	db "それじゃ@", $ca, $2, $0
	db "どうも@@", $a6, $3, $0
	db "なんじゃ@", $ee, $3, $0
	db "ハーイ@@", $2c, $4, $0
	db "はいはい@", $32, $4, $0
	db "バイバイ@", $34, $4, $0
	db "へイ@@@", $8a, $4, $0
	db "またね@@", $de, $4, $0
	db "もしもし@", $32, $5, $0
	db "やあ@@@", $3e, $5, $0
	db "やっほー@", $4e, $5, $0
	db "よう@@@", $62, $5, $0
	db "ようこそ@", $64, $5, $0
	db "よろしく@", $80, $5, $0
	db "らっしゃい", $94, $5, $0

Unknown_11dc78: ; 11dc78
	db "あいて@@", $1c, $0, $0
	db "あたし@@", $36, $0, $0
	db "あなた@@", $40, $0, $0
	db "あなたが@", $42, $0, $0
	db "あなたに@", $44, $0, $0
	db "あなたの@", $46, $0, $0
	db "あなたは@", $48, $0, $0
	db "あなたを@", $4a, $0, $0
	db "おかあさん", $e8, $0, $0
	db "おじいさん", $fc, $0, $0
	db "おじさん@", $2, $1, $0
	db "おとうさん", $e, $1, $0
	db "おとこのこ", $10, $1, $0
	db "おとな@@", $14, $1, $0
	db "おにいさん", $16, $1, $0
	db "おねえさん", $18, $1, $0
	db "おばあさん", $1c, $1, $0
	db "おばさん@", $20, $1, $0
	db "おれさま@", $34, $1, $0
	db "おんなのこ", $3a, $1, $0
	db "ガール@@", $40, $1, $0
	db "かぞく@@", $52, $1, $0
	db "かのじょ@", $72, $1, $0
	db "かれ@@@", $7c, $1, $0
	db "きみ@@@", $9a, $1, $0
	db "きみが@@", $9c, $1, $0
	db "きみに@@", $9e, $1, $0
	db "きみの@@", $a0, $1, $0
	db "きみは@@", $a2, $1, $0
	db "きみを@@", $a4, $1, $0
	db "ギャル@@", $ae, $1, $0
	db "きょうだい", $b2, $1, $0
	db "こども@@", $f0, $1, $0
	db "じぶん@@", $54, $2, $0
	db "じぶんが@", $56, $2, $0
	db "じぶんに@", $58, $2, $0
	db "じぶんの@", $5a, $2, $0
	db "じぶんは@", $5c, $2, $0
	db "じぶんを@", $5e, $2, $0
	db "だれ@@@", $18, $3, $0
	db "だれか@@", $1a, $3, $0
	db "だれが@@", $1c, $3, $0
	db "だれに@@", $1e, $3, $0
	db "だれの@@", $20, $3, $0
	db "だれも@@", $22, $3, $0
	db "だれを@@", $24, $3, $0
	db "ちゃん@@", $38, $3, $0
	db "ともだち@", $b8, $3, $0
	db "なかま@@", $d4, $3, $0
	db "ひと@@@", $62, $4, $0
	db "ボーイ@@", $98, $4, $0
	db "ボク@@@", $a0, $4, $0
	db "ボクが@@", $a2, $4, $0
	db "ボクに@@", $a4, $4, $0
	db "ボクの@@", $a6, $4, $0
	db "ボクは@@", $a8, $4, $0
	db "ボクを@@", $aa, $4, $0
	db "みんな@@", $4, $5, $0
	db "みんなが@", $6, $5, $0
	db "みんなに@", $8, $5, $0
	db "みんなの@", $a, $5, $0
	db "みんなは@", $c, $5, $0
	db "ライバル@", $8a, $5, $0
	db "わたし@@", $c2, $5, $0
	db "わたしが@", $c4, $5, $0
	db "わたしに@", $c6, $5, $0
	db "わたしの@", $c8, $5, $0
	db "わたしは@", $ca, $5, $0
	db "わたしを@", $cc, $5, $0

Unknown_11dea0: ; 11dea0
	db "あいしょう", $18, $0, $0
	db "いけ!@@", $88, $0, $0
	db "いちばん@", $96, $0, $0
	db "かくご@@", $4c, $1, $0
	db "かたせて@", $54, $1, $0
	db "かち@@@", $56, $1, $0
	db "かつ@@@", $58, $1, $0
	db "かった@@", $60, $1, $0
	db "かったら@", $62, $1, $0
	db "かって@@", $64, $1, $0
	db "かてない@", $66, $1, $0
	db "かてる@@", $68, $1, $0
	db "かなわない", $70, $1, $0
	db "きあい@@", $84, $1, $0
	db "きめた@@", $a8, $1, $0
	db "きりふだ@", $b6, $1, $0
	db "くらえ@@", $c2, $1, $0
	db "こい!@@", $da, $1, $0
	db "こうげき@", $e0, $1, $0
	db "こうさん@", $e2, $1, $0
	db "こんじょう", $8, $2, $0
	db "さいのう@", $16, $2, $0
	db "さくせん@", $1a, $2, $0
	db "さばき@@", $22, $2, $0
	db "しょうぶ@", $7e, $2, $0
	db "しょうり@", $80, $2, $0
	db "せめ@@@", $b4, $2, $0
	db "センス@@", $b6, $2, $0
	db "たいせん@", $e6, $2, $0
	db "たたかい@", $f6, $2, $0
	db "ちから@@", $32, $3, $0
	db "チャレンジ", $36, $3, $0
	db "つよい@@", $58, $3, $0
	db "つよすぎ@", $5a, $3, $0
	db "つらい@@", $5c, $3, $0
	db "つらかった", $5e, $3, $0
	db "てかげん@", $6c, $3, $0
	db "てき@@@", $6e, $3, $0
	db "てんさい@", $90, $3, $0
	db "でんせつ@", $94, $3, $0
	db "トレーナー", $c6, $3, $0
	db "にげ@@@", $4, $4, $0
	db "ぬるい@@", $10, $4, $0
	db "ねらう@@", $16, $4, $0
	db "バトル@@", $4a, $4, $0
	db "ファイト@", $72, $4, $0
	db "ふっかつ@", $78, $4, $0
	db "ポイント@", $94, $4, $0
	db "ポケモン@", $ac, $4, $0
	db "ほんき@@", $bc, $4, $0
	db "まいった!", $c4, $4, $0
	db "まけ@@@", $c8, $4, $0
	db "まけたら@", $ca, $4, $0
	db "まけて@@", $cc, $4, $0
	db "まける@@", $ce, $4, $0
	db "まもり@@", $ea, $4, $0
	db "みかた@@", $f2, $4, $0
	db "みとめない", $fe, $4, $0
	db "みとめる@", $0, $5, $0
	db "むてき@@", $16, $5, $0
	db "もらった!", $3c, $5, $0
	db "よゆう@@", $7a, $5, $0
	db "よわい@@", $82, $5, $0
	db "よわすぎ@", $84, $5, $0
	db "らくしょう", $8e, $5, $0
	db "りーダー@", $9e, $5, $0
	db "ルール@@", $a0, $5, $0
	db "レべル@@", $a6, $5, $0
	db "わざ@@@", $be, $5, $0

Unknown_11e0c8: ; 11e0c8
	db "!@@@@", $0, $0, $0
	db "!!@@@", $2, $0, $0
	db "!?@@@", $4, $0, $0
	db "?@@@@", $6, $0, $0
	db "…@@@@", $8, $0, $0
	db "…!@@@", $a, $0, $0
	db "………@@", $c, $0, $0
	db "ー@@@@", $e, $0, $0
	db "ーーー@@", $10, $0, $0
	db "あーあ@@", $14, $0, $0
	db "あーん@@", $16, $0, $0
	db "あははー@", $52, $0, $0
	db "あら@@@", $54, $0, $0
	db "いえ@@@", $72, $0, $0
	db "イエス@@", $74, $0, $0
	db "うう@@@", $ac, $0, $0
	db "うーん@@", $ae, $0, $0
	db "うおー!@", $b0, $0, $0
	db "うおりゃー", $b2, $0, $0
	db "うひょー@", $bc, $0, $0
	db "うふふ@@", $be, $0, $0
	db "うわー@@", $ca, $0, $0
	db "うわーん@", $cc, $0, $0
	db "ええ@@@", $d2, $0, $0
	db "えー@@@", $d4, $0, $0
	db "えーん@@", $d6, $0, $0
	db "えへへ@@", $dc, $0, $0
	db "おいおい@", $e0, $0, $0
	db "おお@@@", $e2, $0, $0
	db "おっと@@", $c, $1, $0
	db "がーん@@", $42, $1, $0
	db "キャー@@", $aa, $1, $0
	db "ギャー@@", $ac, $1, $0
	db "ぐふふふふ", $bc, $1, $0
	db "げっ@@@", $ce, $1, $0
	db "しくしく@", $3e, $2, $0
	db "ちえっ@@", $2e, $3, $0
	db "てへ@@@", $86, $3, $0
	db "ノー@@@", $20, $4, $0
	db "はあー@@", $2a, $4, $0
	db "はい@@@", $30, $4, $0
	db "はっはっは", $48, $4, $0
	db "ひいー@@", $56, $4, $0
	db "ひゃあ@@", $6a, $4, $0
	db "ふっふっふ", $7c, $4, $0
	db "ふにゃ@@", $7e, $4, $0
	db "ププ@@@", $80, $4, $0
	db "ふふん@@", $82, $4, $0
	db "ふん@@@", $88, $4, $0
	db "へっへっへ", $8e, $4, $0
	db "へへー@@", $90, $4, $0
	db "ほーほほほ", $9c, $4, $0
	db "ほら@@@", $b6, $4, $0
	db "まあ@@@", $c0, $4, $0
	db "むきー!!", $10, $5, $0
	db "むふー@@", $18, $5, $0
	db "むふふ@@", $1a, $5, $0
	db "むむ@@@", $1c, $5, $0
	db "よーし@@", $6a, $5, $0
	db "よし!@@", $72, $5, $0
	db "ラララ@@", $98, $5, $0
	db "わーい@@", $ac, $5, $0
	db "わーん!!", $b0, $5, $0
	db "ワォ@@@", $b2, $5, $0
	db "わっ!!@", $ce, $5, $0
	db "わははは!", $d0, $5, $0

Unknown_11e2d8: ; 11e2d8
	db "あのね@@", $50, $0, $0
	db "あんまり@", $6e, $0, $0
	db "いじわる@", $8e, $0, $0
	db "うそ@@@", $b6, $0, $0
	db "うむ@@@", $c4, $0, $0
	db "おーい@@", $e4, $0, $0
	db "おすすめ@", $6, $1, $0
	db "おばかさん", $1e, $1, $0
	db "かなり@@", $6e, $1, $0
	db "から@@@", $7a, $1, $0
	db "きぶん@@", $98, $1, $0
	db "けど@@@", $d6, $1, $0
	db "こそ@@@", $ea, $1, $0
	db "こと@@@", $ee, $1, $0
	db "さあ@@@", $12, $2, $0
	db "さっぱり@", $1e, $2, $0
	db "さて@@@", $20, $2, $0
	db "じゅうぶん", $72, $2, $0
	db "すぐ@@@", $94, $2, $0
	db "すごく@@", $98, $2, $0
	db "すこしは@", $9a, $2, $0
	db "すっっごい", $a0, $2, $0
	db "ぜーんぜん", $b0, $2, $0
	db "ぜったい@", $b2, $2, $0
	db "それで@@", $ce, $2, $0
	db "だけ@@@", $f2, $2, $0
	db "だって@@", $fc, $2, $0
	db "たぶん@@", $6, $3, $0
	db "たら@@@", $14, $3, $0
	db "ちょー@@", $3a, $3, $0
	db "ちょっと@", $3c, $3, $0
	db "ったら@@", $4e, $3, $0
	db "って@@@", $50, $3, $0
	db "ていうか@", $62, $3, $0
	db "でも@@@", $88, $3, $0
	db "どうしても", $9c, $3, $0
	db "とうぜん@", $a0, $3, $0
	db "どうぞ@@", $a2, $3, $0
	db "とりあえず", $be, $3, $0
	db "なあ@@@", $cc, $3, $0
	db "なんて@@", $f4, $3, $0
	db "なんでも@", $fc, $3, $0
	db "なんとか@", $fe, $3, $0
	db "には@@@", $8, $4, $0
	db "バッチり@", $46, $4, $0
	db "ばりばり@", $52, $4, $0
	db "ほど@@@", $b0, $4, $0
	db "ほんと@@", $be, $4, $0
	db "まさに@@", $d0, $4, $0
	db "マジ@@@", $d2, $4, $0
	db "マジで@@", $d4, $4, $0
	db "まったく@", $e4, $4, $0
	db "まで@@@", $e6, $4, $0
	db "まるで@@", $ec, $4, $0
	db "ムード@@", $e, $5, $0
	db "むしろ@@", $14, $5, $0
	db "めちゃ@@", $24, $5, $0
	db "めっぽう@", $28, $5, $0
	db "もう@@@", $2c, $5, $0
	db "モード@@", $2e, $5, $0
	db "もっと@@", $36, $5, $0
	db "もはや@@", $38, $5, $0
	db "やっと@@", $4a, $5, $0
	db "やっぱり@", $4c, $5, $0
	db "より@@@", $7c, $5, $0
	db "れば@@@", $a4, $5, $0

Unknown_11e4e8: ; 11e4e8
	db "あいたい@", $1a, $0, $0
	db "あそびたい", $32, $0, $0
	db "いきたい@", $7c, $0, $0
	db "うかれて@", $b4, $0, $0
	db "うれしい@", $c6, $0, $0
	db "うれしさ@", $c8, $0, $0
	db "エキサイト", $d8, $0, $0
	db "えらい@@", $de, $0, $0
	db "おかしい@", $ec, $0, $0
	db "ォッケー@", $8, $1, $0
	db "かえりたい", $48, $1, $0
	db "がっくし@", $5a, $1, $0
	db "かなしい@", $6c, $1, $0
	db "がんばって", $80, $1, $0
	db "きがしない", $86, $1, $0
	db "きがする@", $88, $1, $0
	db "ききたい@", $8a, $1, $0
	db "きになる@", $90, $1, $0
	db "きのせい@", $96, $1, $0
	db "きらい@@", $b4, $1, $0
	db "くやしい@", $be, $1, $0
	db "くやしさ@", $c0, $1, $0
	db "さみしい@", $24, $2, $0
	db "ざんねん@", $32, $2, $0
	db "しあわせ@", $36, $2, $0
	db "したい@@", $44, $2, $0
	db "したくない", $46, $2, $0
	db "しまった@", $64, $2, $0
	db "しょんぼり", $82, $2, $0
	db "すき@@@", $92, $2, $0
	db "だいきらい", $da, $2, $0
	db "たいくつ@", $dc, $2, $0
	db "だいじ@@", $de, $2, $0
	db "だいすき@", $e4, $2, $0
	db "たいへん@", $ea, $2, $0
	db "たのしい@", $0, $3, $0
	db "たのしすぎ", $2, $3, $0
	db "たべたい@", $8, $3, $0
	db "ダメダメ@", $e, $3, $0
	db "たりない@", $16, $3, $0
	db "ちくしょー", $34, $3, $0
	db "どうしよう", $9e, $3, $0
	db "ドキドキ@", $ac, $3, $0
	db "ナイス@@", $d0, $3, $0
	db "のみたい@", $26, $4, $0
	db "びっくり@", $60, $4, $0
	db "ふあん@@", $74, $4, $0
	db "ふらふら@", $86, $4, $0
	db "ほしい@@", $ae, $4, $0
	db "ボロボロ@", $b8, $4, $0
	db "まだまだ@", $e0, $4, $0
	db "まてない@", $e8, $4, $0
	db "まんぞく@", $f0, $4, $0
	db "みたい@@", $f8, $4, $0
	db "めずらしい", $22, $5, $0
	db "メラメラ@", $2a, $5, $0
	db "やだ@@@", $46, $5, $0
	db "やったー@", $48, $5, $0
	db "やばい@@", $50, $5, $0
	db "やばすぎる", $52, $5, $0
	db "やられた@", $54, $5, $0
	db "やられて@", $56, $5, $0
	db "よかった@", $6e, $5, $0
	db "ラブラブ@", $96, $5, $0
	db "ロマン@@", $a8, $5, $0
	db "ろんがい@", $aa, $5, $0
	db "わから@@", $b4, $5, $0
	db "わかり@@", $b6, $5, $0
	db "わくわく@", $ba, $5, $0

Unknown_11e710: ; 11e710
	db "あつい@@", $38, $0, $0
	db "あった@@", $3a, $0, $0
	db "あり@@@", $56, $0, $0
	db "ある@@@", $5e, $0, $0
	db "あわてて@", $6a, $0, $0
	db "いい@@@", $70, $0, $0
	db "いか@@@", $76, $0, $0
	db "イカス@@", $78, $0, $0
	db "いきおい@", $7a, $0, $0
	db "いける@@", $8a, $0, $0
	db "いじょう@", $8c, $0, $0
	db "いそがしい", $90, $0, $0
	db "いっしょに", $9a, $0, $0
	db "いっぱい@", $9c, $0, $0
	db "いない@@", $a0, $0, $0
	db "いや@@@", $a4, $0, $0
	db "いる@@@", $a8, $0, $0
	db "うまい@@", $c0, $0, $0
	db "うまく@@", $c2, $0, $0
	db "おおきい@", $e6, $0, $0
	db "おくれ@@", $f2, $0, $0
	db "おしい@@", $fa, $0, $0
	db "おもしろい", $2c, $1, $0
	db "おもしろく", $2e, $1, $0
	db "かっこいい", $5c, $1, $0
	db "かわいい@", $7e, $1, $0
	db "かんぺき@", $82, $1, $0
	db "けっこう@", $d0, $1, $0
	db "げんき@@", $d8, $1, $0
	db "こわい@@", $6, $2, $0
	db "さいこう@", $14, $2, $0
	db "さむい@@", $26, $2, $0
	db "さわやか@", $2c, $2, $0
	db "しかたない", $38, $2, $0
	db "すごい@@", $96, $2, $0
	db "すごすぎ@", $9c, $2, $0
	db "すてき@@", $a4, $2, $0
	db "たいした@", $e0, $2, $0
	db "だいじょぶ", $e2, $2, $0
	db "たかい@@", $ec, $2, $0
	db "ただしい@", $f8, $2, $0
	db "だめ@@@", $c, $3, $0
	db "ちいさい@", $2c, $3, $0
	db "ちがう@@", $30, $3, $0
	db "つかれ@@", $48, $3, $0
	db "とくい@@", $b0, $3, $0
	db "とまらない", $b6, $3, $0
	db "ない@@@", $ce, $3, $0
	db "なかった@", $d2, $3, $0
	db "なし@@@", $d8, $3, $0
	db "なって@@", $dc, $3, $0
	db "はやい@@", $50, $4, $0
	db "ひかる@@", $5a, $4, $0
	db "ひくい@@", $5c, $4, $0
	db "ひどい@@", $64, $4, $0
	db "ひとりで@", $66, $4, $0
	db "ひま@@@", $68, $4, $0
	db "ふそく@@", $76, $4, $0
	db "へた@@@", $8c, $4, $0
	db "まちがって", $e2, $4, $0
	db "やさしい@", $42, $5, $0
	db "よく@@@", $70, $5, $0
	db "よわって@", $86, $5, $0
	db "らく@@@", $8c, $5, $0
	db "らしい@@", $90, $5, $0
	db "わるい@@", $d4, $5, $0

Unknown_11e920: ; 11e920
	db "アルバイト", $64, $0, $0
	db "うち@@@", $ba, $0, $0
	db "おかね@@", $ee, $0, $0
	db "おこづかい", $f4, $0, $0
	db "おふろ@@", $24, $1, $0
	db "がっこう@", $5e, $1, $0
	db "きねん@@", $92, $1, $0
	db "グループ@", $c6, $1, $0
	db "ゲット@@", $d2, $1, $0
	db "こうかん@", $de, $1, $0
	db "しごと@@", $40, $2, $0
	db "しゅぎょう", $74, $2, $0
	db "じゅぎょう", $76, $2, $0
	db "じゅく@@", $78, $2, $0
	db "しんか@@", $88, $2, $0
	db "ずかん@@", $90, $2, $0
	db "せいかつ@", $ae, $2, $0
	db "せんせい@", $b8, $2, $0
	db "センター@", $ba, $2, $0
	db "タワー@@", $28, $3, $0
	db "つうしん@", $40, $3, $0
	db "テスト@@", $7e, $3, $0
	db "テレビ@@", $8c, $3, $0
	db "でんわ@@", $96, $3, $0
	db "どうぐ@@", $9a, $3, $0
	db "トレード@", $c4, $3, $0
	db "なまえ@@", $e8, $3, $0
	db "ニュース@", $a, $4, $0
	db "にんき@@", $c, $4, $0
	db "パーティー", $2e, $4, $0
	db "べんきょう", $92, $4, $0
	db "マシン@@", $d6, $4, $0
	db "めいし@@", $1e, $5, $0
	db "メッセージ", $26, $5, $0
	db "もようがえ", $3a, $5, $0
	db "ゆめ@@@", $5a, $5, $0
	db "ようちえん", $66, $5, $0
	db "ラジォ@@", $92, $5, $0
	db "ワールド@", $ae, $5, $0

Unknown_11ea58: ; 11ea58
	db "アイドル@", $1e, $0, $0
	db "アニメ@@", $4c, $0, $0
	db "うた@@@", $b8, $0, $0
	db "えいが@@", $d0, $0, $0
	db "おかし@@", $ea, $0, $0
	db "おしゃべり", $4, $1, $0
	db "おままごと", $28, $1, $0
	db "おもちゃ@", $30, $1, $0
	db "おんがく@", $38, $1, $0
	db "カード@@", $3e, $1, $0
	db "かいもの@", $46, $1, $0
	db "グルメ@@", $c8, $1, $0
	db "ゲーム@@", $cc, $1, $0
	db "ざっし@@", $1c, $2, $0
	db "さんぽ@@", $34, $2, $0
	db "じてんしゃ", $50, $2, $0
	db "しゅみ@@", $7a, $2, $0
	db "スポーツ@", $a8, $2, $0
	db "ダイエット", $d8, $2, $0
	db "たからもの", $f0, $2, $0
	db "たび@@@", $4, $3, $0
	db "ダンス@@", $2a, $3, $0
	db "つり@@@", $60, $3, $0
	db "デート@@", $6a, $3, $0
	db "でんしゃ@", $92, $3, $0
	db "ぬいぐるみ", $e, $4, $0
	db "パソコン@", $3e, $4, $0
	db "はな@@@", $4c, $4, $0
	db "ヒーロー@", $58, $4, $0
	db "ひるね@@", $6e, $4, $0
	db "ヒロイン@", $70, $4, $0
	db "ぼうけん@", $96, $4, $0
	db "ボード@@", $9a, $4, $0
	db "ボール@@", $9e, $4, $0
	db "ほん@@@", $ba, $4, $0
	db "マンガ@@", $ee, $4, $0
	db "やくそく@", $40, $5, $0
	db "やすみ@@", $44, $5, $0
	db "よてい@@", $74, $5, $0

Unknown_11eb90: ; 11eb90
	db "あう@@@", $20, $0, $0
	db "あきらめ@", $24, $0, $0
	db "あげる@@", $28, $0, $0
	db "あせる@@", $2e, $0, $0
	db "あそび@@", $30, $0, $0
	db "あそぶ@@", $34, $0, $0
	db "あつめ@@", $3e, $0, $0
	db "あるき@@", $60, $0, $0
	db "あるく@@", $62, $0, $0
	db "いく@@@", $7e, $0, $0
	db "いけ@@@", $86, $0, $0
	db "おき@@@", $f0, $0, $0
	db "おこり@@", $f6, $0, $0
	db "おこる@@", $f8, $0, $0
	db "おしえ@@", $fe, $0, $0
	db "おしえて@", $0, $1, $0
	db "おねがい@", $1a, $1, $0
	db "おぼえ@@", $26, $1, $0
	db "かえる@@", $4a, $1, $0
	db "がまん@@", $74, $1, $0
	db "きく@@@", $8c, $1, $0
	db "きたえ@@", $8e, $1, $0
	db "きめ@@@", $a6, $1, $0
	db "くる@@@", $c4, $1, $0
	db "さがし@@", $18, $2, $0
	db "さわぎ@@", $2a, $2, $0
	db "した@@@", $42, $2, $0
	db "しって@@", $4a, $2, $0
	db "して@@@", $4e, $2, $0
	db "しない@@", $52, $2, $0
	db "しまう@@", $60, $2, $0
	db "じまん@@", $66, $2, $0
	db "しらない@", $84, $2, $0
	db "しる@@@", $86, $2, $0
	db "しんじて@", $8a, $2, $0
	db "する@@@", $aa, $2, $0
	db "たべる@@", $a, $3, $0
	db "つかう@@", $42, $3, $0
	db "つかえ@@", $44, $3, $0
	db "つかって@", $46, $3, $0
	db "できない@", $70, $3, $0
	db "できる@@", $72, $3, $0
	db "でない@@", $84, $3, $0
	db "でる@@@", $8a, $3, $0
	db "なげる@@", $d6, $3, $0
	db "なやみ@@", $ea, $3, $0
	db "ねられ@@", $18, $4, $0
	db "ねる@@@", $1a, $4, $0
	db "のがし@@", $24, $4, $0
	db "のむ@@@", $28, $4, $0
	db "はしり@@", $3a, $4, $0
	db "はしる@@", $3c, $4, $0
	db "はたらき@", $40, $4, $0
	db "はたらく@", $42, $4, $0
	db "はまって@", $4e, $4, $0
	db "ぶつけ@@", $7a, $4, $0
	db "ほめ@@@", $b4, $4, $0
	db "みせて@@", $f6, $4, $0
	db "みて@@@", $fc, $4, $0
	db "みる@@@", $2, $5, $0
	db "めざす@@", $20, $5, $0
	db "もって@@", $34, $5, $0
	db "ゆずる@@", $58, $5, $0
	db "ゆるす@@", $5c, $5, $0
	db "ゆるせ@@", $5e, $5, $0
	db "られない@", $9a, $5, $0
	db "られる@@", $9c, $5, $0
	db "わかる@@", $b8, $5, $0
	db "わすれ@@", $c0, $5, $0

Unknown_11edb8: ; 11edb8
	db "あき@@@", $22, $0, $0
	db "あさ@@@", $2a, $0, $0
	db "あした@@", $2c, $0, $0
	db "いちにち@", $94, $0, $0
	db "いつか@@", $98, $0, $0
	db "いつも@@", $9e, $0, $0
	db "いま@@@", $a2, $0, $0
	db "えいえん@", $ce, $0, $0
	db "おととい@", $12, $1, $0
	db "おわり@@", $36, $1, $0
	db "かようび@", $78, $1, $0
	db "きのう@@", $94, $1, $0
	db "きょう@@", $b0, $1, $0
	db "きんようび", $b8, $1, $0
	db "げつようび", $d4, $1, $0
	db "このあと@", $f4, $1, $0
	db "このまえ@", $f6, $1, $0
	db "こんど@@", $c, $2, $0
	db "じかん@@", $3c, $2, $0
	db "じゅうねん", $70, $2, $0
	db "すいようび", $8e, $2, $0
	db "スタート@", $9e, $2, $0
	db "ずっと@@", $a2, $2, $0
	db "ストップ@", $a6, $2, $0
	db "そのうち@", $c4, $2, $0
	db "ついに@@", $3e, $3, $0
	db "つぎ@@@", $4a, $3, $0
	db "どようび@", $ba, $3, $0
	db "なつ@@@", $da, $3, $0
	db "にちようび", $6, $4, $0
	db "はじめ@@", $38, $4, $0
	db "はる@@@", $54, $4, $0
	db "ひる@@@", $6c, $4, $0
	db "ふゆ@@@", $84, $4, $0
	db "まいにち@", $c6, $4, $0
	db "もくようび", $30, $5, $0
	db "よなか@@", $76, $5, $0
	db "よる@@@", $7e, $5, $0
	db "らいしゅう", $88, $5, $0

Unknown_11eef0: ; 11eef0
	db "いたします", $92, $0, $0
	db "おります@", $32, $1, $0
	db "か!?@@", $3c, $1, $0
	db "かい?@@", $44, $1, $0
	db "かしら?@", $50, $1, $0
	db "かな?@@", $6a, $1, $0
	db "かも@@@", $76, $1, $0
	db "くれ@@@", $ca, $1, $0
	db "ございます", $e8, $1, $0
	db "しがち@@", $3a, $2, $0
	db "します@@", $62, $2, $0
	db "じゃ@@@", $6a, $2, $0
	db "じゃん@@", $6e, $2, $0
	db "しよう@@", $7c, $2, $0
	db "ぜ!@@@", $ac, $2, $0
	db "ぞ!@@@", $bc, $2, $0
	db "た@@@@", $d4, $2, $0
	db "だ@@@@", $d6, $2, $0
	db "だからね@", $ee, $2, $0
	db "だぜ@@@", $f4, $2, $0
	db "だった@@", $fa, $2, $0
	db "だね@@@", $fe, $2, $0
	db "だよ@@@", $10, $3, $0
	db "だよねー!", $12, $3, $0
	db "だわ@@@", $26, $3, $0
	db "ッス@@@", $4c, $3, $0
	db "ってかんじ", $52, $3, $0
	db "っぱなし@", $54, $3, $0
	db "つもり@@", $56, $3, $0
	db "ていない@", $64, $3, $0
	db "ている@@", $66, $3, $0
	db "でーす!@", $68, $3, $0
	db "でした@@", $74, $3, $0
	db "でしょ?@", $76, $3, $0
	db "でしょー!", $78, $3, $0
	db "です@@@", $7a, $3, $0
	db "ですか?@", $7c, $3, $0
	db "ですよ@@", $80, $3, $0
	db "ですわ@@", $82, $3, $0
	db "どうなの?", $a4, $3, $0
	db "どうよ?@", $a8, $3, $0
	db "とかいって", $aa, $3, $0
	db "なの@@@", $e0, $3, $0
	db "なのか@@", $e2, $3, $0
	db "なのだ@@", $e4, $3, $0
	db "なのよ@@", $e6, $3, $0
	db "なんだね@", $f2, $3, $0
	db "なんです@", $f8, $3, $0
	db "なんてね@", $fa, $3, $0
	db "ね@@@@", $12, $4, $0
	db "ねー@@@", $14, $4, $0
	db "の@@@@", $1c, $4, $0
	db "の?@@@", $1e, $4, $0
	db "ばっかり@", $44, $4, $0
	db "まーす!@", $c2, $4, $0
	db "ます@@@", $d8, $4, $0
	db "ますわ@@", $da, $4, $0
	db "ません@@", $dc, $4, $0
	db "みたいな@", $fa, $4, $0
	db "よ!@@@", $60, $5, $0
	db "よー@@@", $68, $5, $0
	db "よーん@@", $6c, $5, $0
	db "よね@@@", $78, $5, $0
	db "るよ@@@", $a2, $5, $0
	db "わけ@@@", $bc, $5, $0
	db "わよ!@@", $d2, $5, $0

Unknown_11f100: ; 11f100
	db "ああ@@@", $12, $0, $0
	db "あっち@@", $3c, $0, $0
	db "あの@@@", $4e, $0, $0
	db "ありゃ@@", $5c, $0, $0
	db "あれ@@@", $66, $0, $0
	db "あれは@@", $68, $0, $0
	db "あんな@@", $6c, $0, $0
	db "こう@@@", $dc, $1, $0
	db "こっち@@", $ec, $1, $0
	db "この@@@", $f2, $1, $0
	db "こりゃ@@", $fe, $1, $0
	db "これ@@@", $0, $2, $0
	db "これだ!@", $2, $2, $0
	db "これは@@", $4, $2, $0
	db "こんな@@", $e, $2, $0
	db "そう@@@", $be, $2, $0
	db "そっち@@", $c0, $2, $0
	db "その@@@", $c2, $2, $0
	db "そりゃ@@", $c6, $2, $0
	db "それ@@@", $c8, $2, $0
	db "それだ!@", $cc, $2, $0
	db "それは@@", $d0, $2, $0
	db "そんな@@", $d2, $2, $0
	db "どう@@@", $98, $3, $0
	db "どっち@@", $b2, $3, $0
	db "どの@@@", $b4, $3, $0
	db "どりゃ@@", $c0, $3, $0
	db "どれ@@@", $c2, $3, $0
	db "どれを@@", $c8, $3, $0
	db "どんな@@", $ca, $3, $0
	db "なに@@@", $de, $3, $0
	db "なんか@@", $ec, $3, $0
	db "なんだ@@", $f0, $3, $0
	db "なんで@@", $f6, $3, $0
	db "なんなんだ", $0, $4, $0
	db "なんの@@", $2, $4, $0
; 11f220

Unknown_11f220:
	db $12, $01, $24, $02
	db $45, $05, $45, $05
	db $42, $05, $42, $05
	db $45, $05, $42, $05
	db $27, $03, $27, $03
	db $45, $05, $27, $03
	db $42, $05, $24, $02

Unknown_11f23c:
	db $12, $00, $2f, $00
	db $70, $00, $1e, $00
	db $ac, $00, $11, $00
	db $ce, $00, $09, $00
	db $e0, $00, $2e, $00
	db $3c, $01, $24, $00
	db $84, $01, $1b, $00
	db $ba, $01, $09, $00
	db $cc, $01, $07, $00
	db $da, $01, $1c, $00
	db $12, $02, $12, $00
	db $36, $02, $2b, $00
	db $8c, $02, $10, $00
	db $ac, $02, $08, $00
	db $bc, $02, $0c, $00
	db $d4, $02, $2c, $00
	db $2c, $03, $09, $00
	db $3e, $03, $12, $00
	db $62, $03, $1b, $00
	db $98, $03, $1a, $00
	db $cc, $03, $1c, $00
	db $04, $04, $05, $00
	db $0e, $04, $02, $00
	db $12, $04, $05, $00
	db $1c, $04, $07, $00
	db $2a, $04, $16, $00
	db $56, $04, $0e, $00
	db $72, $04, $0c, $00
	db $8a, $04, $05, $00
	db $94, $04, $16, $00
	db $c0, $04, $19, $00
	db $f2, $04, $0e, $00
	db $0e, $05, $08, $00
	db $1e, $05, $07, $00
	db $2c, $05, $09, $00
	db $3e, $05, $0d, $00
	db $58, $05, $04, $00
	db $60, $05, $14, $00
	db $88, $05, $0b, $00
	db $9e, $05, $01, $00
	db $a0, $05, $02, $00
	db $a4, $05, $02, $00
	db $a8, $05, $02, $00
	db $ac, $05, $15, $00
	db $00, $00, $09, $00

BTTrainerClassGenders:
	db MALE   ; FALKNER
	db FEMALE ; WHITNEY
	db FEMALE ; BUGSY
	db MALE   ; MORTY
	db MALE   ; PRYCE
	db FEMALE ; JASMINE
	db MALE   ; CHUCK
	db FEMALE ; CLAIR
	db MALE   ; RIVAL1
	db MALE   ; POKEMON_PROF
	db FEMALE ; WILL
	db MALE   ; CAL
	db MALE   ; BRUNO
	db FEMALE ; KAREN
	db MALE   ; KOGA
	db MALE   ; CHAMPION
	db MALE   ; BROCK
	db FEMALE ; MISTY
	db MALE   ; LT_SURGE
	db MALE   ; SCIENTIST
	db FEMALE ; ERIKA
	db MALE   ; YOUNGSTER
	db MALE   ; SCHOOLBOY
	db MALE   ; BIRD_KEEPER
	db FEMALE ; LASS
	db FEMALE ; JANINE
	db MALE   ; COOLTRAINERM
	db FEMALE ; COOLTRAINERF
	db FEMALE ; BEAUTY
	db MALE   ; POKEMANIAC
	db MALE   ; GRUNTM
	db MALE   ; GENTLEMAN
	db FEMALE ; SKIER
	db FEMALE ; TEACHER
	db FEMALE ; SABRINA
	db MALE   ; BUG_CATCHER
	db MALE   ; FISHER
	db MALE   ; SWIMMERM
	db FEMALE ; SWIMMERF
	db MALE   ; SAILOR
	db MALE   ; SUPER_NERD
	db MALE   ; RIVAL2
	db MALE   ; GUITARIST
	db MALE   ; HIKER
	db MALE   ; BIKER
	db MALE   ; BLAINE
	db MALE   ; BURGLAR
	db MALE   ; FIREBREATHER
	db MALE   ; JUGGLER
	db MALE   ; BLACKBELT_T
	db MALE   ; EXECUTIVEM
	db MALE   ; PSYCHIC_T
	db FEMALE ; PICNICKER
	db MALE   ; CAMPER
	db FEMALE ; EXECUTIVEF
	db MALE   ; SAGE
	db FEMALE ; MEDIUM
	db MALE   ; BOARDER
	db MALE   ; POKEFANM
	db FEMALE ; KIMONO_GIRL
	db FEMALE ; TWINS
	db FEMALE ; POKEFANF
	db MALE   ; RED
	db MALE   ; BLUE
	db MALE   ; OFFICER
	db FEMALE ; GRUNTF


BTMaleTrainerTexts: ; 11f332
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings: ; 11f338
	dw BTGreetingM1
	dw BTGreetingM2
	dw BTGreetingM3
	dw BTGreetingM4
	dw BTGreetingM5
	dw BTGreetingM6
	dw BTGreetingM7
	dw BTGreetingM8
	dw BTGreetingM9
	dw BTGreetingM10
	dw BTGreetingM11
	dw BTGreetingM12
	dw BTGreetingM13
	dw BTGreetingM14
	dw BTGreetingM15
	dw BTGreetingM16
	dw BTGreetingM17
	dw BTGreetingM18
	dw BTGreetingM19
	dw BTGreetingM20
	dw BTGreetingM21
	dw BTGreetingM22
	dw BTGreetingM23
	dw BTGreetingM24
	dw BTGreetingM25

.PlayerLost: ; 11f36a
	dw BTLossM1
	dw BTLossM2
	dw BTLossM3
	dw BTLossM4
	dw BTLossM5
	dw BTLossM6
	dw BTLossM7
	dw BTLossM8
	dw BTLossM9
	dw BTLossM10
	dw BTLossM11
	dw BTLossM12
	dw BTLossM13
	dw BTLossM14
	dw BTLossM15
	dw BTLossM16
	dw BTLossM17
	dw BTLossM18
	dw BTLossM19
	dw BTLossM20
	dw BTLossM21
	dw BTLossM22
	dw BTLossM23
	dw BTLossM24
	dw BTLossM25

.PlayerWon: ; 11f39c
	dw BTWinM1
	dw BTWinM2
	dw BTWinM3
	dw BTWinM4
	dw BTWinM5
	dw BTWinM6
	dw BTWinM7
	dw BTWinM8
	dw BTWinM9
	dw BTWinM10
	dw BTWinM11
	dw BTWinM12
	dw BTWinM13
	dw BTWinM14
	dw BTWinM15
	dw BTWinM16
	dw BTWinM17
	dw BTWinM18
	dw BTWinM19
	dw BTWinM20
	dw BTWinM21
	dw BTWinM22
	dw BTWinM23
	dw BTWinM24
	dw BTWinM25


BTFemaleTrainerTexts:
	dw .Greetings
	dw .PlayerLost
	dw .PlayerWon

.Greetings: ; 11f3d4
	dw BTGreetingF1
	dw BTGreetingF2
	dw BTGreetingF3
	dw BTGreetingF4
	dw BTGreetingF5
	dw BTGreetingF6
	dw BTGreetingF7
	dw BTGreetingF8
	dw BTGreetingF9
	dw BTGreetingF10
	dw BTGreetingF11
	dw BTGreetingF12
	dw BTGreetingF13
	dw BTGreetingF14
	dw BTGreetingF15

.PlayerLost: ; 11f3f2
	dw BTLossF1
	dw BTLossF2
	dw BTLossF3
	dw BTLossF4
	dw BTLossF5
	dw BTLossF6
	dw BTLossF7
	dw BTLossF8
	dw BTLossF9
	dw BTLossF10
	dw BTLossF11
	dw BTLossF12
	dw BTLossF13
	dw BTLossF14
	dw BTLossF15

.PlayerWon: ; 11f410
	dw BTWinF1
	dw BTWinF2
	dw BTWinF3
	dw BTWinF4
	dw BTWinF5
	dw BTWinF6
	dw BTWinF7
	dw BTWinF8
	dw BTWinF9
	dw BTWinF10
	dw BTWinF11
	dw BTWinF12
	dw BTWinF13
	dw BTWinF14
	dw BTWinF15


BTGreetingM1: ; 0x11f42e
	text_jump BattleTowerText_0x1ec000
	db "@"

BTLossM1: ; 0x11f433
	text_jump BattleTowerText_0x1ec03b
	db "@"

BTWinM1: ; 0x11f438
	text_jump UnknownText_0x1ec060
	db "@"

BTGreetingM2: ; 0x11f43d
	text_jump BattleTowerText_0x1ec080
	db "@"

BTLossM2: ; 0x11f442
	text_jump UnknownText_0x1ec0a3
	db "@"

BTWinM2: ; 0x11f447
	text_jump UnknownText_0x1ec0c4
	db "@"

BTGreetingM3: ; 0x11f44c
	text_jump UnknownText_0x1ec0e1
	db "@"

BTLossM3: ; 0x11f451
	text_jump UnknownText_0x1ec108
	db "@"

BTWinM3: ; 0x11f456
	text_jump UnknownText_0x1ec12a
	db "@"

BTGreetingM4: ; 0x11f45b
	text_jump UnknownText_0x1ec14d
	db "@"

BTLossM4: ; 0x11f460
	text_jump UnknownText_0x1ec16f
	db "@"

BTWinM4: ; 0x11f465
	text_jump UnknownText_0x1ec190
	db "@"

BTGreetingM5: ; 0x11f46a
	text_jump UnknownText_0x1ec1ae
	db "@"

BTLossM5: ; 0x11f46f
	text_jump UnknownText_0x1ec1d0
	db "@"

BTWinM5: ; 0x11f474
	text_jump UnknownText_0x1ec1f4
	db "@"

BTGreetingM6: ; 0x11f479
	text_jump UnknownText_0x1ec216
	db "@"

BTLossM6: ; 0x11f47e
	text_jump UnknownText_0x1ec238
	db "@"

BTWinM6: ; 0x11f483
	text_jump UnknownText_0x1ec259
	db "@"

BTGreetingM7: ; 0x11f488
	text_jump UnknownText_0x1ec27b
	db "@"

BTLossM7: ; 0x11f48d
	text_jump UnknownText_0x1ec2a0
	db "@"

BTWinM7: ; 0x11f492
	text_jump UnknownText_0x1ec2c0
	db "@"

BTGreetingM8: ; 0x11f497
	text_jump UnknownText_0x1ec2d9
	db "@"

BTLossM8: ; 0x11f49c
	text_jump UnknownText_0x1ec2fe
	db "@"

BTWinM8: ; 0x11f4a1
	text_jump UnknownText_0x1ec320
	db "@"

BTGreetingM9: ; 0x11f4a6
	text_jump UnknownText_0x1ec33f
	db "@"

BTLossM9: ; 0x11f4ab
	text_jump UnknownText_0x1ec36c
	db "@"

BTWinM9: ; 0x11f4b0
	text_jump UnknownText_0x1ec389
	db "@"

BTGreetingM10: ; 0x11f4b5
	text_jump UnknownText_0x1ec3ad
	db "@"

BTLossM10: ; 0x11f4ba
	text_jump UnknownText_0x1ec3c5
	db "@"

BTWinM10: ; 0x11f4bf
	text_jump UnknownText_0x1ec3e5
	db "@"

BTGreetingM11: ; 0x11f4c4
	text_jump UnknownText_0x1ec402
	db "@"

BTLossM11: ; 0x11f4c9
	text_jump UnknownText_0x1ec411
	db "@"

BTWinM11: ; 0x11f4ce
	text_jump UnknownText_0x1ec41f
	db "@"

BTGreetingM12: ; 0x11f4d3
	text_jump UnknownText_0x1ec42e
	db "@"

BTLossM12: ; 0x11f4d8
	text_jump UnknownText_0x1ec461
	db "@"

BTWinM12: ; 0x11f4dd
	text_jump UnknownText_0x1ec4a0
	db "@"

BTGreetingM13: ; 0x11f4e2
	text_jump UnknownText_0x1ec4d6
	db "@"

BTLossM13: ; 0x11f4e7
	text_jump UnknownText_0x1ec4f5
	db "@"

BTWinM13: ; 0x11f4ec
	text_jump UnknownText_0x1ec512
	db "@"

BTGreetingM14: ; 0x11f4f1
	text_jump UnknownText_0x1ec532
	db "@"

BTLossM14: ; 0x11f4f6
	text_jump UnknownText_0x1ec54b
	db "@"

BTWinM14: ; 0x11f4fb
	text_jump UnknownText_0x1ec565
	db "@"

BTGreetingM15: ; 0x11f500
	text_jump UnknownText_0x1ec580
	db "@"

BTLossM15: ; 0x11f505
	text_jump UnknownText_0x1ec59d
	db "@"

BTWinM15: ; 0x11f50a
	text_jump UnknownText_0x1ec5b5
	db "@"

BTGreetingM16: ; 0x11f50f
	text_jump UnknownText_0x1ec5d3
	db "@"

BTLossM16: ; 0x11f514
	text_jump UnknownText_0x1ec5ee
	db "@"

BTWinM16: ; 0x11f519
	text_jump UnknownText_0x1ec60d
	db "@"

BTGreetingM17: ; 0x11f51e
	text_jump UnknownText_0x1ec631
	db "@"

BTLossM17: ; 0x11f523
	text_jump UnknownText_0x1ec651
	db "@"

BTWinM17: ; 0x11f528
	text_jump UnknownText_0x1ec68f
	db "@"

BTGreetingM18: ; 0x11f52d
	text_jump UnknownText_0x1ec6b1
	db "@"

BTLossM18: ; 0x11f532
	text_jump UnknownText_0x1ec6d0
	db "@"

BTWinM18: ; 0x11f537
	text_jump UnknownText_0x1ec708
	db "@"

BTGreetingM19: ; 0x11f53c
	text_jump UnknownText_0x1ec720
	db "@"

BTLossM19: ; 0x11f541
	text_jump UnknownText_0x1ec73e
	db "@"

BTWinM19: ; 0x11f546
	text_jump UnknownText_0x1ec75b
	db "@"

BTGreetingM20: ; 0x11f54b
	text_jump UnknownText_0x1ec77f
	db "@"

BTLossM20: ; 0x11f550
	text_jump UnknownText_0x1ec798
	db "@"

BTWinM20: ; 0x11f555
	text_jump UnknownText_0x1ec7bb
	db "@"

BTGreetingM21: ; 0x11f55a
	text_jump UnknownText_0x1ec7d8
	db "@"

BTLossM21: ; 0x11f55f
	text_jump UnknownText_0x1ec818
	db "@"

BTWinM21: ; 0x11f564
	text_jump UnknownText_0x1ec837
	db "@"

BTGreetingM22: ; 0x11f569
	text_jump UnknownText_0x1ec858
	db "@"

BTLossM22: ; 0x11f56e
	text_jump UnknownText_0x1ec876
	db "@"

BTWinM22: ; 0x11f573
	text_jump UnknownText_0x1ec898
	db "@"

BTGreetingM23: ; 0x11f578
	text_jump UnknownText_0x1ec8b1
	db "@"

BTLossM23: ; 0x11f57d
	text_jump UnknownText_0x1ec8d5
	db "@"

BTWinM23: ; 0x11f582
	text_jump UnknownText_0x1ec8f0
	db "@"

BTGreetingM24: ; 0x11f587
	text_jump UnknownText_0x1ec911
	db "@"

BTLossM24: ; 0x11f58c
	text_jump UnknownText_0x1ec928
	db "@"

BTWinM24: ; 0x11f591
	text_jump UnknownText_0x1ec949
	db "@"

BTGreetingM25: ; 0x11f596
	text_jump UnknownText_0x1ec969
	db "@"

BTLossM25: ; 0x11f59b
	text_jump UnknownText_0x1ec986
	db "@"

BTWinM25: ; 0x11f5a0
	text_jump UnknownText_0x1ec99b
	db "@"




BTGreetingF1: ; 0x11f5a5
	text_jump UnknownText_0x1ec9bd
	db "@"

BTLossF1: ; 0x11f5aa
	text_jump UnknownText_0x1ec9d9
	db "@"

BTWinF1: ; 0x11f5af
	text_jump UnknownText_0x1ec9f7
	db "@"

BTGreetingF2: ; 0x11f5b4
	text_jump UnknownText_0x1eca0a
	db "@"

BTLossF2: ; 0x11f5b9
	text_jump UnknownText_0x1eca2a
	db "@"

BTWinF2: ; 0x11f5be
	text_jump UnknownText_0x1eca47
	db "@"

BTGreetingF3: ; 0x11f5c3
	text_jump UnknownText_0x1eca64
	db "@"

BTLossF3: ; 0x11f5c8
	text_jump UnknownText_0x1eca82
	db "@"

BTWinF3: ; 0x11f5cd
	text_jump UnknownText_0x1eca9d
	db "@"

BTGreetingF4: ; 0x11f5d2
	text_jump UnknownText_0x1ecabf
	db "@"

BTLossF4: ; 0x11f5d7
	text_jump UnknownText_0x1ecade
	db "@"

BTWinF4: ; 0x11f5dc
	text_jump UnknownText_0x1ecafa
	db "@"

BTGreetingF5: ; 0x11f5e1
	text_jump UnknownText_0x1ecb19
	db "@"

BTLossF5: ; 0x11f5e6
	text_jump UnknownText_0x1ecb37
	db "@"

BTWinF5: ; 0x11f5eb
	text_jump UnknownText_0x1ecb55
	db "@"

BTGreetingF6: ; 0x11f5f0
	text_jump UnknownText_0x1ecb70
	db "@"

BTLossF6: ; 0x11f5f5
	text_jump UnknownText_0x1ecb92
	db "@"

BTWinF6: ; 0x11f5fa
	text_jump UnknownText_0x1ecbb6
	db "@"

BTGreetingF7: ; 0x11f5ff
	text_jump UnknownText_0x1ecbd9
	db "@"

BTLossF7: ; 0x11f604
	text_jump UnknownText_0x1ecbf3
	db "@"

BTWinF7: ; 0x11f609
	text_jump UnknownText_0x1ecc15
	db "@"

BTGreetingF8: ; 0x11f60e
	text_jump UnknownText_0x1ecc39
	db "@"

BTLossF8: ; 0x11f613
	text_jump UnknownText_0x1ecc55
	db "@"

BTWinF8: ; 0x11f618
	text_jump UnknownText_0x1ecc75
	db "@"

BTGreetingF9: ; 0x11f61d
	text_jump UnknownText_0x1ecc92
	db "@"

BTLossF9: ; 0x11f622
	text_jump UnknownText_0x1ecca7
	db "@"

BTWinF9: ; 0x11f627
	text_jump UnknownText_0x1eccc1
	db "@"

BTGreetingF10: ; 0x11f62c
	text_jump UnknownText_0x1eccd7
	db "@"

BTLossF10: ; 0x11f631
	text_jump UnknownText_0x1eccef
	db "@"

BTWinF10: ; 0x11f636
	text_jump UnknownText_0x1ecd0e
	db "@"

BTGreetingF11: ; 0x11f63b
	text_jump UnknownText_0x1ecd2b
	db "@"

BTLossF11: ; 0x11f640
	text_jump UnknownText_0x1ecd4d
	db "@"

BTWinF11: ; 0x11f645
	text_jump UnknownText_0x1ecd6b
	db "@"

BTGreetingF12: ; 0x11f64a
	text_jump UnknownText_0x1ecd8d
	db "@"

BTLossF12: ; 0x11f64f
	text_jump UnknownText_0x1ecdaf
	db "@"

BTWinF12: ; 0x11f654
	text_jump UnknownText_0x1ecdcf
	db "@"

BTGreetingF13: ; 0x11f659
	text_jump UnknownText_0x1ecded
	db "@"

BTLossF13: ; 0x11f65e
	text_jump UnknownText_0x1ece0d
	db "@"

BTWinF13: ; 0x11f663
	text_jump UnknownText_0x1ece2a
	db "@"

BTGreetingF14: ; 0x11f668
	text_jump UnknownText_0x1ece4b
	db "@"

BTLossF14: ; 0x11f66d
	text_jump UnknownText_0x1ece70
	db "@"

BTWinF14: ; 0x11f672
	text_jump UnknownText_0x1ece8a
	db "@"

BTGreetingF15: ; 0x11f677
	text_jump UnknownText_0x1ecea8
	db "@"

BTLossF15: ; 0x11f67c
	text_jump UnknownText_0x1ecec9
	db "@"

BTWinF15: ; 0x11f681
	text_jump UnknownText_0x1ecee8
	db "@"
