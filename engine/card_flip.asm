_CardFlip: ; e00ee (38:40ee)
	ld hl, Options
	set 4, [hl]
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra
	ld hl, LZ_e0d16
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, LZ_e0ea8
	ld de, VTiles2 tile $3e
	call Decompress
	ld hl, LZ_e0cdb
	ld de, VTiles0 tile $00
	call Decompress
	ld hl, GFX_e0cf6
	ld de, VTiles1 tile $6f
	ld bc, $10
	call CopyBytes
	ld hl, GFX_e0d06
	ld de, VTiles1 tile $75
	ld bc, $10
	call CopyBytes
	call Functione0521
	call Functione04c1
	call Functione0c37
	call EnableLCD
	call Function3200
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	call DelayFrame
	xor a
	ld [wJumptableIndex], a
	ld a, $2
	ld [wcf64], a
	ld [wcf65], a
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
.MasterLoop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .leavethegame
	call .CardFlip
	jr .MasterLoop
.leavethegame
	call WaitSFX
	ld de, SFX_QUIT_SLOTS
	call PlaySFX
	call WaitSFX
	call ClearBGPalettes
	ld hl, Options
	res 4, [hl]
	ret

.CardFlip: ; e0191 (38:4191)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e01a0 (38:41a0)

.Jumptable: ; e01a0
	dw .AskPlayWithThree
	dw .DeductCoins
	dw .ChooseACard
	dw .PlaceYourBet
	dw .CheckTheCard
	dw .TabulateTheResult
	dw .PlayAgain
	dw .Quit
; e01b0

.Increment: ; e01b0
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e01b5

.AskPlayWithThree: ; e01b5
	ld hl, .PlayWithThreeCoinsText
	call Functione0489
	call YesNoBox
	jr c, .SaidNo
	call Functione0366
	call .Increment
	ret

.SaidNo
	ld a, $7
	ld [wJumptableIndex], a
	ret
; e01cd

.PlayWithThreeCoinsText: ; 0xe01cd
	; Play with three coins?
	text_jump UnknownText_0x1c5793
	db "@"
; 0xe01d2

.DeductCoins: ; e01d2
	ld a, [Coins]
	ld h, a
	ld a, [Coins + 1]
	ld l, a
	ld a, h
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp 3
	jr nc, .deduct ; You have at least 3 coins.
	ld hl, .NotEnoughCoinsText
	call Functione0489
	ld a, $7
	ld [wJumptableIndex], a
	ret

.deduct
	ld de, -3
	add hl, de
	ld a, h
	ld [Coins], a
	ld a, l
	ld [Coins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	xor a
	ld [hBGMapMode], a
	call Functione049c
	ld a, $1
	ld [hBGMapMode], a
	call WaitSFX
	call .Increment
	ret
; e0212

.NotEnoughCoinsText: ; 0xe0212
	; Not enough coins…
	text_jump UnknownText_0x1c57ab
	db "@"
; 0xe0217

.ChooseACard: ; e0217
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 9
	call Functione04e5
	hlcoord 9, 0
	ld bc, SCREEN_WIDTH
	ld a, [wc6e8]
	call AddNTimes
	ld [hl], $f5
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	call Functione03c1
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 6
	call Functione03c1
	call WaitBGMap
	ld hl, .ChooseACardText
	call Functione0489
	xor a
	ld [wcf66], a
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .next
	ld de, SFX_KINESIS
	call PlaySFX
	call Functione0849
	ld c, 4
	call DelayFrames
	ld hl, wcf66
	ld a, [hl]
	xor $1
	ld [hl], a
	jr .loop

.next
	ld de, SFX_SLOT_MACHINE_START
	call PlaySFX
	ld a, $3
.loop2
	push af
	call Functione0849
	ld c, 4
	call DelayFrames
	call ClearSprites
	ld c, 4
	call DelayFrames
	pop af
	dec a
	jr nz, .loop2
	ld hl, wcf66
	ld a, [hl]
	push af
	xor $1
	ld [hl], a
	call Functione03ac
	lb bc, 6, 5
	call Functione04e5
	pop af
	ld [wcf66], a
	call .Increment
	ret
; e02b2

.ChooseACardText: ; 0xe02b2
	; Choose a card.
	text_jump UnknownText_0x1c57be
	db "@"
; 0xe02b7

.PlaceYourBet: ; e02b7
	ld hl, .PlaceYourBetText
	call Functione0489
.betloop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .betdone
	call Functione089c
	call Functione0960
	call DelayFrame
	jr .betloop

.betdone
	call .Increment
	ret
; e02d5

.PlaceYourBetText: ; 0xe02d5
	; Place your bet.
	text_jump UnknownText_0x1c57ce
	db "@"
; 0xe02da

.CheckTheCard: ; e02da
	xor a
	ld [hVBlankCounter], a
	call Functione0960
	call WaitSFX
	ld de, SFX_CHOOSE_A_CARD
	call PlaySFX
	call WaitSFX
	ld a, [wc6e8]
	ld e, a
	ld d, 0
	ld hl, wc6d0
rept 2
	add hl, de
endr
	ld a, [wcf66]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [CurEnemyMoveNum], a
	ld e, a
	ld hl, wc6ea
	add hl, de
	ld [hl], $1
	call Functione03ac
	call Functione03ec
	call Function3200
	call .Increment
	ret
; e0314

.TabulateTheResult: ; e0314
	call Functione0637
	call WaitPressAorB_BlinkCursor
	call .Increment
	ret
; e031e

.PlayAgain: ; e031e
	call ClearSprites
	ld hl, .PlayAgainText
	call Functione0489
	call YesNoBox
	jr nc, .Continue
	call .Increment
	ret

.Continue
	ld a, [wc6e8]
	inc a
	ld [wc6e8], a
	cp $c
	jr c, .KeepTheCurrentDeck
	call Functione04c1
	ld a, $1
	ld [hBGMapMode], a
	call Functione0366
	ld hl, .CardsShuffledText
	call PrintText
	jr .LoopAround

.KeepTheCurrentDeck
	call Functione0534

.LoopAround
	ld a, $1
	ld [wJumptableIndex], a
	ret
; e0356

.PlayAgainText: ; 0xe0356
	; Want to play again?
	text_jump UnknownText_0x1c57df
	db "@"
; 0xe035b

.CardsShuffledText: ; 0xe035b
	; The cards have been shuffled.
	text_jump UnknownText_0x1c57f4
	db "@"
; 0xe0360

.Quit: ; e0360
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; e0366

Functione0366: ; e0366
	ld hl, wc6d0
	ld bc, $18
	xor a
	call ByteFill
	ld de, wc6d0
	ld c, $17
.asm_e0375
	call Random
	and $1f
	cp $18
	jr nc, .asm_e0375
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e0375
	ld [hl], c
	dec c
	jr nz, .asm_e0375
	xor a
	ld [wc6e8], a
	ld hl, wc6ea
	ld bc, $18
	call ByteFill
	ret
; e0398

Functione0398: ; e0398
	ld hl, 0
	ld bc, 6
	ld a, [wcf64]
	call AddNTimes
	ld b, $0
	ld a, [wcf65]
	ld c, a
	add hl, bc
	ret
; e03ac

Functione03ac: ; e03ac
	ld a, [wcf66]
	and a
	jr nz, .asm_e03ba
	hlcoord 2, 0
	ld bc, $1018
	jr .asm_e03c0

.asm_e03ba
	hlcoord 2, 6
	ld bc, $4018

.asm_e03c0
	ret
; e03c1

Functione03c1: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, Unknown_e03ce
	lb bc, 6, 5
	call Functione04f7
	ret
; e03ce

Unknown_e03ce: ; e03ce
	db $08, $09, $09, $09, $0a
	db $0b, $28, $2b, $28, $0c
	db $0b, $2c, $2d, $2e, $0c
	db $0b, $2f, $30, $31, $0c
	db $0b, $32, $33, $34, $0c
	db $0d, $0e, $0e, $0e, $0f
; e03ec

Functione03ec: ; e03ec
	xor a
	ld [hBGMapMode], a
	push hl
	push hl
	ld de, Unknown_e043b
	lb bc, 6, 5
	call Functione04f7
	ld a, [CurEnemyMoveNum]
	ld e, a
	ld d, 0
	ld hl, Unknown_e0459
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	ld bc, $17
	add hl, bc
	ld [hl], e
	ld bc, SCREEN_HEIGHT
	add hl, bc
	ld a, d
	ld de, SCREEN_WIDTH
	ld b, $3
.asm_e0418
	push hl
	ld c, $3
.asm_e041b
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_e041b
	pop hl
	add hl, de
	dec b
	jr nz, .asm_e0418
	pop hl
	ld a, [hCGB]
	and a
	ret z
	ld de, AttrMap - TileMap
	add hl, de
	ld a, [CurEnemyMoveNum]
	and 3
	inc a
	lb bc, 6, 5
	call Functione04e7
	ret
; e043b

Unknown_e043b: ; e043b
	db $18, $19, $19, $19, $1a
	db $1b, $35, $7f, $7f, $1c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $1d, $1e, $1e, $1e, $1f
; e0459

Unknown_e0459: ; e0459
	db $f7,$4e, $f7,$57, $f7,$69, $f7,$60
	db $f8,$4e, $f8,$57, $f8,$69, $f8,$60
	db $f9,$4e, $f9,$57, $f9,$69, $f9,$60
	db $fa,$4e, $fa,$57, $fa,$69, $fa,$60
	db $fb,$4e, $fb,$57, $fb,$69, $fb,$60
	db $fc,$4e, $fc,$57, $fc,$69, $fc,$60
; e0489

Functione0489: ; e0489
	push hl
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	pop hl
	call PrintTextBoxText
	call Functione049c
	ret
; e049c

Functione049c: ; e049c
	hlcoord 9, 15
	ld b, $1
	ld c, $9
	call TextBox
	hlcoord 10, 16
	ld de, String_e04bc
	call PlaceString
	hlcoord 15, 16
	ld de, Coins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret
; e04bc

String_e04bc:
	db "COIN@"
; e04c1

Functione04c1: ; e04c1 (38:44c1)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $29
	call ByteFill
	hlcoord 9, 0
	ld de, Unknown_e110c
	lb bc, 12, 11
	call Functione04f7
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	ret
; e04e5 (38:44e5)

Functione04e5: ; e04e5
	ld a, $29

Functione04e7: ; e04e7 (38:44e7)
	push bc
	push hl
.asm_e04e9
	ld [hli], a
	dec c
	jr nz, .asm_e04e9
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, Functione04e7
	ret

Functione04f7: ; e04f7 (38:44f7)
	push bc
	push hl
.asm_e04f9
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_e04f9
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, Functione04f7
	ret
; e0509 (38:4509)

Functione0509: ; e0509
	ld de, Sprites
	ld a, [hli]
.asm_e050d
	push af
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .asm_e050d
	ret
; e0521

Functione0521: ; e0521 (38:4521)
	ld de, VTiles1 tile $76
	ld hl, $8f62
	ld bc, $9e
	call CopyBytes
	ld hl, $8ffe
	xor a
	ld [hli], a
	ld [hl], a
	ret
; e0534 (38:4534)

Functione0534: ; e0534
	xor a
	ld [hBGMapMode], a
	ld a, [CurEnemyMoveNum]
	ld e, a
	ld d, 0
	and 3
	ld c, a
	ld b, 0
	ld a, e
	and $1c
	srl a
	add Jumptable_e0553 % $100
	ld l, a
	ld a, 0
	adc Jumptable_e0553 / $100
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e0553

Jumptable_e0553: ; e0553
	dw Functione055f
	dw Functione0583
	dw Functione05a7
	dw Functione05cb
	dw Functione05ef
	dw Functione0613
; e055f

Functione055f: ; e055f
	ld hl, wc6e6 + 8
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e0575
	hlcoord 13, 3
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $37
	ret

.asm_e0575
	hlcoord 13, 3
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0583

Functione0583: ; e0583
	ld hl, wc6e6
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e0599
	hlcoord 13, 4
rept 2
	add hl, bc
endr
	ld [hl], $3b
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.asm_e0599
	hlcoord 13, 4
rept 2
	add hl, bc
endr
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05a7

Functione05a7: ; e05a7
	ld hl, wc6e6 + 8
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e05bd
	hlcoord 13, 6
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $38
	ret

.asm_e05bd
	hlcoord 13, 6
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e05cb

Functione05cb: ; e05cb
	ld hl, wc6e6
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e05e1
	hlcoord 13, 7
rept 2
	add hl, bc
endr
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.asm_e05e1
	hlcoord 13, 7
rept 2
	add hl, bc
endr
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05ef

Functione05ef: ; e05ef
	ld hl, wc6e6 + 8
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e0605
	hlcoord 13, 9
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $39
	ret

.asm_e0605
	hlcoord 13, 9
rept 2
	add hl, bc
endr
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0613

Functione0613: ; e0613
	ld hl, wc6e6
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e0629
	hlcoord 13, 10
rept 2
	add hl, bc
endr
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.asm_e0629
	hlcoord 13, 10
rept 2
	add hl, bc
endr
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e0637

Functione0637: ; e0637
	call Functione0398
	add hl, hl
	ld de, Jumptable_e0643
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e0643

Jumptable_e0643: ; e0643
	dw Functione06a3
	dw Functione06a3
	dw Functione06a6
	dw Functione06a6
	dw Functione06b0
	dw Functione06b0
	dw Functione06a3
	dw Functione06a3
	dw Functione06ec
	dw Functione06f6
	dw Functione0702
	dw Functione070e
	dw Functione06c2
	dw Functione0722
	dw Functione0770
	dw Functione0774
	dw Functione0778
	dw Functione077c
	dw Functione06c2
	dw Functione072c
	dw Functione0780
	dw Functione0784
	dw Functione0788
	dw Functione078c
	dw Functione06cc
	dw Functione0738
	dw Functione0790
	dw Functione0794
	dw Functione0798
	dw Functione079c
	dw Functione06cc
	dw Functione0744
	dw Functione07a0
	dw Functione07a4
	dw Functione07a8
	dw Functione07ac
	dw Functione06d8
	dw Functione0750
	dw Functione07b0
	dw Functione07b4
	dw Functione07b8
	dw Functione07bc
	dw Functione06d8
	dw Functione075c
	dw Functione07c0
	dw Functione07c4
	dw Functione07c8
	dw Functione07cc
; e06a3

Functione06a3: ; e06a3
	jp Functione07db
; e06a6

Functione06a6: ; e06a6
	ld a, [CurEnemyMoveNum]
	and $2
	jp nz, Functione07db
	jr Functione06ba

Functione06b0: ; e06b0
	ld a, [CurEnemyMoveNum]
	and $2
	jr nz, Functione06ba
	jp Functione07db

Functione06ba: ; e06ba
	ld c, $6
	ld de, SFX_2ND_PLACE
	jp Functione07eb
; e06c2

Functione06c2: ; e06c2
	ld a, [CurEnemyMoveNum]
	and $18
	jr z, Functione06e4
	jp Functione07db

Functione06cc: ; e06cc
	ld a, [CurEnemyMoveNum]
	and $18
	cp $8
	jr z, Functione06e4
	jp Functione07db

Functione06d8: ; e06d8
	ld a, [CurEnemyMoveNum]
	and $18
	cp $10
	jr z, Functione06e4
	jp Functione07db

Functione06e4: ; e06e4
	ld c, $9
	ld de, SFX_2ND_PLACE
	jp Functione07eb
; e06ec

Functione06ec: ; e06ec
	ld a, [CurEnemyMoveNum]
	and $3
	jr z, Functione071a
	jp Functione07db

Functione06f6: ; e06f6
	ld a, [CurEnemyMoveNum]
	and $3
	cp $1
	jr z, Functione071a
	jp Functione07db

Functione0702: ; e0702
	ld a, [CurEnemyMoveNum]
	and $3
	cp $2
	jr z, Functione071a
	jp Functione07db

Functione070e: ; e070e
	ld a, [CurEnemyMoveNum]
	and $3
	cp $3
	jr z, Functione071a
	jp Functione07db

Functione071a: ; e071a
	ld c, $c
	ld de, SFX_2ND_PLACE
	jp Functione07eb
; e0722

Functione0722: ; e0722
	ld a, [CurEnemyMoveNum]
	and $1c
	jr z, Functione0768
	jp Functione07db

Functione072c: ; e072c
	ld a, [CurEnemyMoveNum]
	and $1c
	cp $4
	jr z, Functione0768
	jp Functione07db

Functione0738: ; e0738
	ld a, [CurEnemyMoveNum]
	and $1c
	cp $8
	jr z, Functione0768
	jp Functione07db

Functione0744: ; e0744
	ld a, [CurEnemyMoveNum]
	and $1c
	cp $c
	jr z, Functione0768
	jp Functione07db

Functione0750: ; e0750
	ld a, [CurEnemyMoveNum]
	and $1c
	cp $10
	jr z, Functione0768
	jp Functione07db

Functione075c: ; e075c
	ld a, [CurEnemyMoveNum]
	and $1c
	cp $14
	jr z, Functione0768
	jp Functione07db

Functione0768: ; e0768
	ld c, $12
	ld de, SFX_2ND_PLACE
	jp Functione07eb
; e0770


Functione0770: ; e0770
	ld e, $0
	jr Functione07ce

Functione0774: ; e0774
	ld e, $1
	jr Functione07ce

Functione0778: ; e0778
	ld e, $2
	jr Functione07ce

Functione077c: ; e077c
	ld e, $3
	jr Functione07ce

Functione0780: ; e0780
	ld e, $4
	jr Functione07ce

Functione0784: ; e0784
	ld e, $5
	jr Functione07ce

Functione0788: ; e0788
	ld e, $6
	jr Functione07ce

Functione078c: ; e078c
	ld e, $7
	jr Functione07ce

Functione0790: ; e0790
	ld e, $8
	jr Functione07ce

Functione0794: ; e0794
	ld e, $9
	jr Functione07ce

Functione0798: ; e0798
	ld e, $a
	jr Functione07ce

Functione079c: ; e079c
	ld e, $b
	jr Functione07ce

Functione07a0: ; e07a0
	ld e, $c
	jr Functione07ce

Functione07a4: ; e07a4
	ld e, $d
	jr Functione07ce

Functione07a8: ; e07a8
	ld e, $e
	jr Functione07ce

Functione07ac: ; e07ac
	ld e, $f
	jr Functione07ce

Functione07b0: ; e07b0
	ld e, $10
	jr Functione07ce

Functione07b4: ; e07b4
	ld e, $11
	jr Functione07ce

Functione07b8: ; e07b8
	ld e, $12
	jr Functione07ce

Functione07bc: ; e07bc
	ld e, $13
	jr Functione07ce

Functione07c0: ; e07c0
	ld e, $14
	jr Functione07ce

Functione07c4: ; e07c4
	ld e, $15
	jr Functione07ce

Functione07c8: ; e07c8
	ld e, $16
	jr Functione07ce

Functione07cc: ; e07cc
	ld e, $17

Functione07ce: ; e07ce
	ld a, [CurEnemyMoveNum]
	cp e
	jr nz, Functione07db
	ld c, $48
	ld de, SFX_2ND_PLACE
	jr Functione07eb

Functione07db: ; e07db
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, UnknownText_0xe0816
	call Functione0489
	call WaitSFX
	ret

Functione07eb: ; e07eb
	push bc
	push de
	ld hl, UnknownText_0xe0811
	call Functione0489
	pop de
	call PlaySFX
	call WaitSFX
	pop bc
.asm_e07fb
	push bc
	call Functione0833
	jr c, .asm_e0804
	call Functione081b

.asm_e0804
	call Functione049c
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .asm_e07fb
	ret
; e0811

UnknownText_0xe0811: ; 0xe0811
	; Yeah!
	text_jump UnknownText_0x1c5813
	db "@"
; 0xe0816

UnknownText_0xe0816: ; 0xe0816
	; Darn…
	text_jump UnknownText_0x1c581a
	db "@"
; 0xe081b

Functione081b: ; e081b
	ld a, [Coins]
	ld h, a
	ld a, [Coins + 1]
	ld l, a
	inc hl
	ld a, h
	ld [Coins], a
	ld a, l
	ld [Coins + 1], a
	ld de, SFX_PAY_DAY
	call PlaySFX
	ret
; e0833

Functione0833: ; e0833
	ld a, [Coins]
	cp 9999 / $100
	jr c, .asm_e0847
	jr z, .asm_e083e
	jr .asm_e0845

.asm_e083e
	ld a, [Coins + 1]
	cp 9999 % $100
	jr c, .asm_e0847

.asm_e0845
	scf
	ret

.asm_e0847
	and a
	ret
; e0849

Functione0849: ; e0849
	call Functione03ac
	ld hl, Unknown_e0853
	call Functione0509
	ret
; e0853

Unknown_e0853: ; e0853
	db 18
	db $00, $00, $04, $00
	db $00, $08, $06, $00
	db $00, $10, $06, $00
	db $00, $18, $06, $00
	db $00, $20, $04, $20
	db $08, $00, $05, $00
	db $08, $20, $05, $20
	db $10, $00, $05, $00
	db $10, $20, $05, $20
	db $18, $00, $05, $00
	db $18, $20, $05, $20
	db $20, $00, $05, $00
	db $20, $20, $05, $20
	db $28, $00, $04, $40
	db $28, $08, $06, $40
	db $28, $10, $06, $40
	db $28, $18, $06, $40
	db $28, $20, $04, $60
; e089c

Functione089c: ; e089c
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jp nz, Functione08b8
	ld a, [hl]
	and D_RIGHT
	jp nz, Functione08ef
	ld a, [hl]
	and D_UP
	jp nz, Functione090a
	ld a, [hl]
	and D_DOWN
	jp nz, Functione093d
	ret
; e08b8

Functione08b8: ; e08b8
	ld hl, wcf65
	ld a, [wcf64]
	and a
	jr z, .asm_e08d5
	cp $1
	jr z, .asm_e08cc
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jp Functione0959

.asm_e08cc
	ld a, [hl]
	cp $3
	jr c, .asm_e08e2
	dec [hl]
	jp Functione0959

.asm_e08d5
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .asm_e08e2
rept 2
	dec [hl]
endr
	jp Functione0959

.asm_e08e2
	ld a, $2
	ld [wcf64], a
	ld a, $1
	ld [wcf65], a
	jp Functione0959
; e08ef

Functione08ef: ; e08ef
	ld hl, wcf65
	ld a, [wcf64]
	and a
	jr z, .asm_e08ff
	ld a, [hl]
	cp $5
	ret nc
	inc [hl]
	jr Functione0959

.asm_e08ff
	ld a, [hl]
	and $e
	ld [hl], a
	cp $4
	ret nc
rept 2
	inc [hl]
endr
	jr Functione0959

Functione090a: ; e090a
	ld hl, wcf64
	ld a, [wcf65]
	and a
	jr z, .asm_e0925
	cp $1
	jr z, .asm_e091d
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr Functione0959

.asm_e091d
	ld a, [hl]
	cp $3
	jr c, .asm_e0931
	dec [hl]
	jr Functione0959

.asm_e0925
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .asm_e0931
rept 2
	dec [hl]
endr
	jr Functione0959

.asm_e0931
	ld a, $1
	ld [wcf64], a
	ld a, $2
	ld [wcf65], a
	jr Functione0959

Functione093d: ; e093d
	ld hl, wcf64
	ld a, [wcf65]
	and a
	jr z, .asm_e0950
	ld hl, wcf64
	ld a, [hl]
	cp $7
	ret nc
	inc [hl]
	jr Functione0959

.asm_e0950
	ld a, [hl]
	and $e
	ld [hl], a
	cp $6
	ret nc
rept 2
	inc [hl]
endr

Functione0959: ; e0959
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret
; e0960

Functione0960: ; e0960
	call ClearSprites
	ld a, [hCGB]
	and a
	jr nz, .asm_e096d
	ld a, [hVBlankCounter]
	and $4
	ret nz

.asm_e096d
	call Functione0398
rept 2
	add hl, hl
endr
	ld de, Unknown_e0981
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Functione0509
	ret
; e0981

Unknown_e0981: ; e0981
	dbbw $58, $10, Unknown_e0c26
	dbbw $60, $10, Unknown_e0c26
	dbbw $68, $10, Unknown_e0b8d
	dbbw $68, $10, Unknown_e0b8d
	dbbw $88, $10, Unknown_e0b8d
	dbbw $88, $10, Unknown_e0b8d

	dbbw $58, $18, Unknown_e0c26
	dbbw $60, $18, Unknown_e0c26
	dbbw $68, $18, Unknown_e0a5a
	dbbw $78, $18, Unknown_e0a5a
	dbbw $88, $18, Unknown_e0a5a
	dbbw $98, $18, Unknown_e0a5a

	dbbw $58, $28, Unknown_e0b14
	dbbw $60, $28, Unknown_e0ac3
	dbbw $68, $28, Unknown_e0a41
	dbbw $78, $28, Unknown_e0a41
	dbbw $88, $28, Unknown_e0a41
	dbbw $98, $28, Unknown_e0a41
	dbbw $58, $28, Unknown_e0b14

	dbbw $60, $34, Unknown_e0ac3
	dbbw $68, $34, Unknown_e0a41
	dbbw $78, $34, Unknown_e0a41
	dbbw $88, $34, Unknown_e0a41
	dbbw $98, $34, Unknown_e0a41

	dbbw $58, $40, Unknown_e0b14
	dbbw $60, $40, Unknown_e0ac3
	dbbw $68, $40, Unknown_e0a41
	dbbw $78, $40, Unknown_e0a41
	dbbw $88, $40, Unknown_e0a41
	dbbw $98, $40, Unknown_e0a41
	dbbw $58, $40, Unknown_e0b14

	dbbw $60, $4c, Unknown_e0ac3
	dbbw $68, $4c, Unknown_e0a41
	dbbw $78, $4c, Unknown_e0a41
	dbbw $88, $4c, Unknown_e0a41
	dbbw $98, $4c, Unknown_e0a41

	dbbw $58, $58, Unknown_e0b14
	dbbw $60, $58, Unknown_e0ac3
	dbbw $68, $58, Unknown_e0a41
	dbbw $78, $58, Unknown_e0a41
	dbbw $88, $58, Unknown_e0a41
	dbbw $98, $58, Unknown_e0a41
	dbbw $58, $58, Unknown_e0b14

	dbbw $60, $64, Unknown_e0ac3
	dbbw $68, $64, Unknown_e0a41
	dbbw $78, $64, Unknown_e0a41
	dbbw $88, $64, Unknown_e0a41
	dbbw $98, $64, Unknown_e0a41
; e0a41

Unknown_e0a41: ; e0a41
	db 6
	db $00, $ff, $00, $80
	db $00, $00, $02, $80
	db $00, $08, $03, $80
	db $05, $ff, $00, $c0
	db $05, $00, $02, $c0
	db $05, $08, $03, $80

Unknown_e0a5a: ; e0a5a
	db 26
	db $00, $ff, $00, $80
	db $00, $00, $02, $80
	db $00, $08, $00, $a0
	db $08, $ff, $01, $80
	db $08, $08, $01, $a0
	db $10, $ff, $01, $80
	db $10, $08, $03, $80
	db $18, $ff, $01, $80
	db $18, $08, $03, $80
	db $20, $ff, $01, $80
	db $20, $08, $03, $80
	db $28, $ff, $01, $80
	db $28, $08, $03, $80
	db $30, $ff, $01, $80
	db $30, $08, $03, $80
	db $38, $ff, $01, $80
	db $38, $08, $03, $80
	db $40, $ff, $01, $80
	db $40, $08, $03, $80
	db $48, $ff, $01, $80
	db $48, $08, $03, $80
	db $50, $ff, $01, $80
	db $50, $08, $03, $80
	db $51, $ff, $00, $c0
	db $51, $00, $02, $c0
	db $51, $08, $03, $80

Unknown_e0ac3: ; e0ac3
	db 20
	db $00, $ff, $00, $80
	db $00, $00, $02, $80
	db $00, $08, $02, $80
	db $00, $10, $03, $80
	db $00, $18, $02, $80
	db $00, $20, $03, $80
	db $00, $28, $02, $80
	db $00, $30, $03, $80
	db $00, $38, $02, $80
	db $00, $40, $03, $80
	db $05, $ff, $00, $c0
	db $05, $00, $02, $c0
	db $05, $08, $02, $c0
	db $05, $10, $03, $80
	db $05, $18, $02, $c0
	db $05, $20, $03, $80
	db $05, $28, $02, $c0
	db $05, $30, $03, $80
	db $05, $38, $02, $c0
	db $05, $40, $03, $80

Unknown_e0b14: ; e0b14
	db 30
	db $00, $00, $00, $80
	db $00, $08, $02, $80
	db $00, $10, $02, $80
	db $00, $18, $03, $80
	db $00, $20, $02, $80
	db $00, $28, $03, $80
	db $00, $30, $02, $80
	db $00, $38, $03, $80
	db $00, $40, $02, $80
	db $00, $48, $03, $80
	db $08, $00, $01, $80
	db $08, $18, $03, $80
	db $08, $28, $03, $80
	db $08, $38, $03, $80
	db $08, $48, $03, $80
	db $10, $00, $01, $80
	db $10, $18, $03, $80
	db $10, $28, $03, $80
	db $10, $38, $03, $80
	db $10, $48, $03, $80
	db $11, $00, $00, $c0
	db $11, $08, $02, $c0
	db $11, $10, $02, $c0
	db $11, $18, $03, $80
	db $11, $20, $03, $80
	db $11, $28, $03, $80
	db $11, $30, $03, $80
	db $11, $38, $03, $80
	db $11, $40, $03, $80
	db $11, $48, $03, $80

Unknown_e0b8d: ; e0b8d
	db 38
	db $00, $ff, $00, $80
	db $00, $18, $00, $a0
	db $08, $ff, $01, $80
	db $08, $18, $01, $a0
	db $10, $ff, $01, $80
	db $10, $18, $01, $a0
	db $18, $ff, $01, $80
	db $18, $08, $03, $80
	db $18, $18, $03, $80
	db $20, $ff, $01, $80
	db $20, $08, $03, $80
	db $20, $18, $03, $80
	db $28, $ff, $01, $80
	db $28, $08, $03, $80
	db $28, $18, $03, $80
	db $30, $ff, $01, $80
	db $30, $08, $03, $80
	db $30, $18, $03, $80
	db $38, $ff, $01, $80
	db $38, $08, $03, $80
	db $38, $18, $03, $80
	db $40, $ff, $01, $80
	db $40, $08, $03, $80
	db $40, $18, $03, $80
	db $48, $ff, $01, $80
	db $48, $08, $03, $80
	db $48, $18, $03, $80
	db $50, $ff, $01, $80
	db $50, $08, $03, $80
	db $50, $18, $03, $80
	db $58, $ff, $01, $80
	db $58, $08, $03, $80
	db $58, $18, $03, $80
	db $59, $ff, $00, $c0
	db $59, $00, $02, $c0
	db $59, $08, $03, $c0
	db $59, $10, $02, $c0
	db $59, $18, $03, $e0

Unknown_e0c26: ; e0c26
	db 4
	db $00, $00, $00, $80
	db $00, $08, $00, $a0
	db $08, $00, $00, $c0
	db $08, $08, $00, $e0
; e0c37

Functione0c37: ; e0c37 (38:4c37)
	ld a, [hCGB]
	and a
	ret z
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	hlcoord 12, 1, AttrMap
	lb bc, 2, 2
	ld a, $1
	call Functione04e7
	hlcoord 14, 1, AttrMap
	lb bc, 2, 2
	ld a, $2
	call Functione04e7
	hlcoord 16, 1, AttrMap
	lb bc, 2, 2
	ld a, $3
	call Functione04e7
	hlcoord 18, 1, AttrMap
	lb bc, 2, 2
	ld a, $4
	call Functione04e7
	hlcoord 9, 0, AttrMap
	lb bc, 12, 1
	ld a, $1
	call Functione04e7
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e0c93
	ld de, UnknBGPals
	ld bc, $48
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; e0c93 (38:4c93)

Palette_e0c93: ; e0c93
	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 29, 25, 00
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 13, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 17, 30
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 08, 31, 08
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 17, 07, 31
	RGB 06, 19, 08
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 31, 00, 00
; e0cdb

LZ_e0cdb: ; e0cdb
INCBIN "gfx/unknown/0e0cdb.2bpp.lz"

GFX_e0cf6: ; e0cf6
INCBIN "gfx/unknown/0e0cf6.2bpp"

GFX_e0d06: ; e0d06
INCBIN "gfx/unknown/0e0d06.2bpp"

LZ_e0d16: ; e0d16
INCBIN "gfx/unknown/0e0d16.2bpp.lz"

LZ_e0ea8: ; e0ea8
INCBIN "gfx/unknown/0e0ea8.2bpp.lz"

Unknown_e110c: ; e110c
	db $ef, $15, $27, $2a, $2a, $06, $27, $2a, $2a, $06, $27
	db $ef, $07, $27, $3e, $3f, $42, $43, $46, $47, $4a, $4b
	db $ef, $17, $26, $40, $41, $44, $45, $48, $49, $4c, $4d
	db $ef, $25, $04, $00, $01, $00, $01, $00, $01, $00, $01
	db $ef, $05, $14, $10, $11, $10, $11, $10, $11, $10, $11
	db $ef, $16, $24, $20, $21, $20, $21, $20, $21, $20, $21
	db $ef, $25, $04, $00, $02, $00, $02, $00, $02, $00, $02
	db $ef, $05, $14, $10, $12, $10, $12, $10, $12, $10, $12
	db $ef, $16, $24, $20, $22, $20, $22, $20, $22, $20, $22
	db $ef, $25, $04, $00, $03, $00, $03, $00, $03, $00, $03
	db $ef, $05, $14, $10, $13, $10, $13, $10, $13, $10, $13
	db $ef, $16, $24, $20, $23, $20, $23, $20, $23, $20, $23
; e1190

Functione1190: ; e1190
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	ld hl, wc608
	ld bc, $1e0
	xor a
	call ByteFill
	ld hl, GFX_e17c5
	ld de, VTiles1 tile $60
	ld bc, $40
	call CopyBytes
	ld hl, LZ_e1805
	ld de, VTiles1 tile $6d
	call Decompress
	call Functione17a3
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $ee
	call ByteFill
	hlcoord 4, 3
	lb bc, 12, 12
	ld a, $ef
	call Functione13ee
	call Functione124e
	call Functione13fe
	call Functione127d
	xor a
	ld [hSCY], a
	ld [hSCX], a
	ld [rWY], a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld a, $93
	ld [rLCDC], a
	call WaitBGMap
	ld b, SCGB_18
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, $24
	call DmgToCgbObjPal0
	xor a
	ld [wd0ec], a
	call DelayFrame
.asm_e1217
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_e123d
	call Functione12ca
	ld a, [wcf64]
	and a
	jr nz, .asm_e1230
	ld a, [hVBlankCounter]
	and $10
	jr z, .asm_e1235

.asm_e1230
	call Functione14d9
	jr .asm_e1238

.asm_e1235
	call ClearSprites

.asm_e1238
	call DelayFrame
	jr .asm_e1217

.asm_e123d
	pop af
	ld [hInMenu], a
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	ld a, $e3
	ld [rLCDC], a
	ret
; e124e

Functione124e: ; e124e
	ld c, $1
	ld b, $10
.asm_e1252
	call Random
	and $f
	ld hl, Unknown_e126d
	ld e, a
	ld d, $0
	add hl, de
	ld e, [hl]
	ld hl, wc6d0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .asm_e1252
	ld [hl], c
	inc c
	dec b
	jr nz, .asm_e1252
	ret
; e126d

Unknown_e126d: ; e126d
	db $00, $01, $02, $03
	db $04, $05, $06, $0b
	db $0c, $11, $12, $17
	db $18, $1d, $1e, $23
; e127d

Functione127d: ; e127d
	call Functione128d
	hlcoord 5, 16
	ld a, $f6
	ld c, $a
.asm_e1287
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_e1287
	ret
; e128d

Functione128d: ; e128d
	hlcoord 4, 15
	ld a, $f0
	ld [hli], a
	ld bc, $a
	ld a, $f1
	call ByteFill
	hlcoord 15, 15
	ld a, $f2
	ld [hli], a
	hlcoord 4, 16
	ld a, $f3
	ld [hli], a
	ld bc, $a
	ld a, $ef
	call ByteFill
	hlcoord 15, 16
	ld a, $f3
	ld [hli], a
	hlcoord 4, 17
	ld a, $f4
	ld [hli], a
	ld bc, $a
	ld a, $f1
	call ByteFill
	hlcoord 15, 17
	ld a, $f5
	ld [hl], a
	ret
; e12ca

Functione12ca: ; e12ca
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_e12d9
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e12d9

Jumptable_e12d9: ; e12d9
	dw Functione12db
; e12db

Functione12db: ; e12db
	ld a, [hJoyPressed]
	and START
	jp nz, Functione13de
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, Functione1376
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_e1301
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_e130d
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_e1325
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_e1345
	ret

.asm_e1301
	ld hl, wcf65
	ld a, [hl]
	cp $6
	ret c
	sub $6
	ld [hl], a
	jr .asm_e1364

.asm_e130d
	ld hl, wcf65
	ld a, [hl]
	cp $19
	ret z
	cp $1a
	ret z
	cp $1b
	ret z
	cp $1c
	ret z
	cp $1e
	ret nc
	add $6
	ld [hl], a
	jr .asm_e1364

.asm_e1325
	ld hl, wcf65
	ld a, [hl]
	and a
	ret z
	cp $6
	ret z
	cp $c
	ret z
	cp $12
	ret z
	cp $18
	ret z
	cp $1e
	ret z
	cp $23
	jr z, .asm_e1341
	dec [hl]
	jr .asm_e1364

.asm_e1341
	ld [hl], $1e
	jr .asm_e1364

.asm_e1345
	ld hl, wcf65
	ld a, [hl]
	cp $5
	ret z
	cp $b
	ret z
	cp $11
	ret z
	cp $17
	ret z
	cp $1d
	ret z
	cp $23
	ret z
	cp $1e
	jr z, .asm_e1362
	inc [hl]
	jr .asm_e1364

.asm_e1362
	ld [hl], $23

.asm_e1364
	ld a, [wcf64]
	and a
	jr nz, .asm_e136f
	ld de, SFX_POUND
	jr .asm_e1372

.asm_e136f
	ld de, SFX_MOVE_PUZZLE_PIECE

.asm_e1372
	call PlaySFX
	ret
; e1376

Functione1376: ; e1376
	ld a, [wcf64]
	and a
	jr nz, .asm_e139f
	call Functione1475
	and a
	jr z, Functione13e4
	ld de, SFX_MEGA_KICK
	call PlaySFX
	ld [hl], $0
	ld [wcf66], a
	call Functione14d9
	call Functione1441
	call WaitBGMap
	call WaitSFX
	ld a, $1
	ld [wcf64], a
	ret

.asm_e139f
	call Functione1475
	and a
	jr nz, Functione13e4
	ld de, SFX_PLACE_PUZZLE_PIECE_DOWN
	call PlaySFX
	ld a, [wcf66]
	ld [hl], a
	call Functione141f
	call WaitBGMap
	xor a
	ld [wcf66], a
	call Functione14d9
	xor a
	ld [wcf64], a
	call WaitSFX
	call Functione14a0
	ret nc
	call Functione128d
	call ClearSprites
	ld de, SFX_1ST_PLACE
	call PlaySFX
	call WaitSFX
	call SimpleWaitPressAorB
	ld a, $1
	ld [wd0ec], a

Functione13de: ; e13de
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Functione13e4: ; e13e4
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	ret
; e13ee

Functione13ee: ; e13ee
	ld de, SCREEN_WIDTH
.asm_e13f1
	push bc
	push hl
.asm_e13f3
	ld [hli], a
	dec c
	jr nz, .asm_e13f3
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .asm_e13f1
	ret
; e13fe

Functione13fe: ; e13fe
	xor a
	ld [wcf65], a
	ld c, $24
.asm_e1404
	push bc
	call Functione1475
	ld [wcf66], a
	and a
	jr z, .asm_e1413
	call Functione141f
	jr .asm_e1416

.asm_e1413
	call Functione1441

.asm_e1416
	ld hl, wcf65
	inc [hl]
	pop bc
	dec c
	jr nz, .asm_e1404
	ret
; e141f

Functione141f: ; e141f
	ld a, $2
	call Functione1463
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	call Functione1481
	pop hl
	ld de, SCREEN_WIDTH
	ld b, $3
.asm_e1431
	ld c, $3
	push hl
.asm_e1434
	ld [hli], a
	inc a
	dec c
	jr nz, .asm_e1434
	add $9
	pop hl
	add hl, de
	dec b
	jr nz, .asm_e1431
	ret
; e1441

Functione1441: ; e1441
	ld a, $2
	call Functione1463
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, $4
	call Functione1463
	ld a, [hl]
	pop hl
	ld de, SCREEN_WIDTH
	ld b, $3
.asm_e1456
	ld c, $3
	push hl
.asm_e1459
	ld [hli], a
	dec c
	jr nz, .asm_e1459
	pop hl
	add hl, de
	dec b
	jr nz, .asm_e1456
	ret
; e1463

Functione1463: ; e1463
	ld e, a
	ld d, 0
	ld hl, Unknown_e1559
	add hl, de
	ld a, [wcf65]
	ld e, a
rept 4
	add hl, de
endr
rept 2
	add hl, de
endr
	ret
; e1475

Functione1475: ; e1475
	ld hl, wc6d0
	ld a, [wcf65]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ret
; e1481

Functione1481: ; e1481
	ld a, [wcf66]
	ld hl, Unknown_e148f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ret
; e148f

Unknown_e148f: ; e148f
	db $e0
	db $00, $03, $06, $09
	db $24, $27, $2a, $2d
	db $48, $4b, $4e, $51
	db $6c, $6f, $72, $75
; e14a0

Functione14a0: ; e14a0
	ld hl, Unknown_e14b5
	ld de, wc6d0
	ld c, $24
.asm_e14a8
	ld a, [de]
	cp [hl]
	jr nz, .asm_e14b3
	inc de
	inc hl
	dec c
	jr nz, .asm_e14a8
	scf
	ret

.asm_e14b3
	and a
	ret
; e14b5

Unknown_e14b5: ; e14b5
	db $00, $00, $00, $00, $00, $00
	db $00, $01, $02, $03, $04, $00
	db $00, $05, $06, $07, $08, $00
	db $00, $09, $0a, $0b, $0c, $00
	db $00, $0d, $0e, $0f, $10, $00
	db $00, $00, $00, $00, $00, $00
; e14d9

Functione14d9: ; e14d9
	call Functione1481
	ld [wd002], a
	xor a
	call Functione1463
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wd002]
	cp $e0
	jr z, .asm_e14f2
	ld hl, Unknown_e150f
	jr .asm_e14f5

.asm_e14f2
	ld hl, Unknown_e1534

.asm_e14f5
	ld de, Sprites
.asm_e14f8
	ld a, [hli]
	cp $ff
	ret z
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [wd002]
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_e14f8
; e150f

Unknown_e150f: ; e150f
	db $f4, $f4, $00, $00
	db $f4, $fc, $01, $00
	db $f4, $04, $02, $00
	db $fc, $f4, $0c, $00
	db $fc, $fc, $0d, $00
	db $fc, $04, $0e, $00
	db $04, $f4, $18, $00
	db $04, $fc, $19, $00
	db $04, $04, $1a, $00
	db $ff

Unknown_e1534: ; e1534
	db $f4, $f4, $00, $00
	db $f4, $fc, $01, $00
	db $f4, $04, $00, $20
	db $fc, $f4, $02, $00
	db $fc, $fc, $03, $00
	db $fc, $04, $02, $20
	db $04, $f4, $00, $40
	db $04, $fc, $01, $40
	db $04, $04, $00, $60
	db $ff

Unknown_e1559: ; e1559

macro_e1559: macro
	db \1, \2
	dwcoord \3, \4
	db \5, \6
endm

	macro_e1559 $1c, $1c,  1,  0, $ee, $00
	macro_e1559 $34, $1c,  4,  0, $ee, $00
	macro_e1559 $4c, $1c,  7,  0, $ee, $00
	macro_e1559 $64, $1c, 10,  0, $ee, $00
	macro_e1559 $7c, $1c, 13,  0, $ee, $00
	macro_e1559 $94, $1c, 16,  0, $ee, $00
	macro_e1559 $1c, $34,  1,  3, $ee, $00
	macro_e1559 $34, $34,  4,  3, $ef, $00
	macro_e1559 $4c, $34,  7,  3, $ef, $00
	macro_e1559 $64, $34, 10,  3, $ef, $00
	macro_e1559 $7c, $34, 13,  3, $ef, $00
	macro_e1559 $94, $34, 16,  3, $ee, $00
	macro_e1559 $1c, $4c,  1,  6, $ee, $00
	macro_e1559 $34, $4c,  4,  6, $ef, $00
	macro_e1559 $4c, $4c,  7,  6, $ef, $00
	macro_e1559 $64, $4c, 10,  6, $ef, $00
	macro_e1559 $7c, $4c, 13,  6, $ef, $00
	macro_e1559 $94, $4c, 16,  6, $ee, $00
	macro_e1559 $1c, $64,  1,  9, $ee, $00
	macro_e1559 $34, $64,  4,  9, $ef, $00
	macro_e1559 $4c, $64,  7,  9, $ef, $00
	macro_e1559 $64, $64, 10,  9, $ef, $00
	macro_e1559 $7c, $64, 13,  9, $ef, $00
	macro_e1559 $94, $64, 16,  9, $ee, $00
	macro_e1559 $1c, $7c,  1, 12, $ee, $00
	macro_e1559 $34, $7c,  4, 12, $ef, $00
	macro_e1559 $4c, $7c,  7, 12, $ef, $00
	macro_e1559 $64, $7c, 10, 12, $ef, $00
	macro_e1559 $7c, $7c, 13, 12, $ef, $00
	macro_e1559 $94, $7c, 16, 12, $ee, $00
	macro_e1559 $1c, $94,  1, 15, $ee, $00
	macro_e1559 $34, $94,  4, 15, $ee, $00
	macro_e1559 $4c, $94,  7, 15, $ee, $00
	macro_e1559 $64, $94, 10, 15, $ee, $00
	macro_e1559 $7c, $94, 13, 15, $ee, $00
	macro_e1559 $94, $94, 16, 15, $ee, $00

Functione1631: ; e1631
	ld hl, VTiles2
	ld de, VTiles0
	ld b, $6
.asm_e1639
	push bc
	push hl
	push hl
	call Functione1654
	pop hl
	ld bc, 8
	add hl, bc
	call Functione1654
	pop hl
	ld bc, $60
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e1639
	call Functione16c7
	ret
; e1654

Functione1654: ; e1654
	ld c, $6
.asm_e1656
	push bc
	push hl
	push hl
	ld c, $4
.asm_e165b
	push bc
	ld a, [hli]
	and $f0
	swap a
	call Functione16aa
	ld c, a
	ld a, [hli]
	and $f0
	swap a
	call Functione16aa
	ld b, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	pop bc
	dec c
	jr nz, .asm_e165b
	pop hl
	ld c, $4
.asm_e1681
	push bc
	ld a, [hli]
	and $f
	call Functione16aa
	ld c, a
	ld a, [hli]
	and $f
	call Functione16aa
	ld b, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	pop bc
	dec c
	jr nz, .asm_e1681
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_e1656
	ret
; e16aa

Functione16aa: ; e16aa
	push hl
	ld hl, Unknown_e16b7
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	ret
; e16b7

Unknown_e16b7: ; e16b7
	db $00, $03, $0c, $0f
	db $30, $33, $3c, $3f
	db $c0, $c3, $cc, $cf
	db $f0, $f3, $fc, $ff
; e16c7

Functione16c7: ; e16c7
	ld hl, Unknown_e1703
	ld a, $8
.asm_e16cc
	push af
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Functione16e2
	pop hl
rept 4
	inc hl
endr
	pop af
	dec a
	jr nz, .asm_e16cc
	ret
; e16e2

Functione16e2: ; e16e2
	lb bc, 4, 4
.asm_e16e5
	push bc
.asm_e16e6
	push de
	push hl
	ld b, $10
.asm_e16ea
	ld a, [de]
	or [hl]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_e16ea
	pop hl
	ld de, $30
	add hl, de
	pop de
	dec c
	jr nz, .asm_e16e6
	ld bc, $180
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_e16e5
	ret
; e1703

Unknown_e1703: ; e1703
	dw GFX_e1723 + $00, $8000
	dw GFX_e1723 + $10, $8010
	dw GFX_e1723 + $20, $8020
	dw GFX_e1723 + $30, $80c0
	dw GFX_e1723 + $40, $80e0
	dw GFX_e1723 + $50, $8180
	dw GFX_e1723 + $60, $8190
	dw GFX_e1723 + $70, $81a0
; e1723

GFX_e1723: ; e1723
INCBIN "gfx/unknown/0e1723.2bpp"

Functione17a3: ; e17a3
	ld a, [ScriptVar]
	and 3
	ld e, a
	ld d, 0
	ld hl, Unknown_e17bd
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTiles2
	call Decompress
	call Functione1631
	ret
; e17bd

Unknown_e17bd: ; e17bd
	dw LZ_e1bab
	dw LZ_e1c9b
	dw LZ_e19fb
	dw LZ_e18ab
; e17c5

GFX_e17c5: ; e17c5
INCBIN "gfx/unknown/0e17c5.2bpp"

LZ_e1805: ; e1805
INCBIN "gfx/unknown/0e1805.2bpp.lz"

LZ_e18ab: ; e18ab
INCBIN "gfx/unknown/0e18ab.2bpp.lz"

LZ_e19fb: ; e19fb
INCBIN "gfx/unknown/0e19fb.2bpp.lz"

LZ_e1bab: ; e1bab
INCBIN "gfx/unknown/0e1bab.2bpp.lz"

LZ_e1c9b: ; e1c9b
INCBIN "gfx/unknown/0e1c9b.2bpp.lz"
