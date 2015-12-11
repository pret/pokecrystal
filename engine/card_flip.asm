CARDFLIP_LIGHT_OFF EQU $ef
CARDFLIP_LIGHT_ON  EQU $f5

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

	ld hl, CardFlipLZ01
	ld de, VTiles2 tile $00
	call Decompress
	ld hl, CardFlipLZ02
	ld de, VTiles2 tile $3e
	call Decompress
	ld hl, CardFlipLZ03
	ld de, VTiles0 tile $00
	call Decompress
	ld hl, CardFlipOffButtonGFX
	ld de, VTiles1 tile $6f
	ld bc, 1 tiles
	call CopyBytes
	ld hl, CardFlipOnButtonGFX
	ld de, VTiles1 tile $75
	ld bc, 1 tiles
	call CopyBytes

	call CardFlip_ShiftDigitsLeftTwoPixels
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
	jumptable_start
	jumptable .AskPlayWithThree
	jumptable .DeductCoins
	jumptable .ChooseACard
	jumptable .PlaceYourBet
	jumptable .CheckTheCard
	jumptable .TabulateTheResult
	jumptable .PlayAgain
	jumptable .Quit
; e01b0

.Increment: ; e01b0
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e01b5

.AskPlayWithThree: ; e01b5
	ld hl, .PlayWithThreeCoinsText
	call CardFlip_UpdateCoinBalanceDisplay
	call YesNoBox
	jr c, .SaidNo
	call CardFlip_ShuffleDeck
	call .Increment
	ret

.SaidNo
	ld a, 7 ; .QuitTableIndex
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
	call CardFlip_UpdateCoinBalanceDisplay
	ld a, 7 ; .QuitTableIndex
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
	call CardFlip_PrintCoinBalance
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
	call CardFlip_FillGreenBox
	hlcoord 9, 0
	ld bc, SCREEN_WIDTH
	ld a, [wc6e8]
	call AddNTimes
	ld [hl], CARDFLIP_LIGHT_ON
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
	call CardFlip_UpdateCoinBalanceDisplay
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
	call CardFlip_FillGreenBox
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
	call CardFlip_UpdateCoinBalanceDisplay
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
	ld hl, wDeck
rept 2
	add hl, de
endr
	ld a, [wcf66]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wc6e9], a
	ld e, a
	ld hl, wc6ea
	add hl, de
	ld [hl], $1
	call Functione03ac
	call CardFlip_DisplayCardFaceUp
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
	call CardFlip_UpdateCoinBalanceDisplay
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
	call CardFlip_ShuffleDeck
	ld hl, .CardsShuffledText
	call PrintText
	jr .LoopAround

.KeepTheCurrentDeck
	call Functione0534

.LoopAround
	ld a, 1 ; .DeductCoinsTableIndex
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

CardFlip_ShuffleDeck: ; e0366
	ld hl, wDeck
	ld bc, wDeckEnd - wDeck
	xor a
	call ByteFill
	ld de, wDeck
	ld c, wDeckEnd - wDeck - 1
.loop
	call Random
	and $1f
	cp wDeckEnd - wDeck
	jr nc, .loop
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	and a
	jr nz, .loop
	ld [hl], c
	dec c
	jr nz, .loop
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

CardFlip_DisplayCardFaceUp: ; e03ec
	xor a
	ld [hBGMapMode], a
	push hl
	push hl
	ld de, .Unknown_e043b
	lb bc, 6, 5
	call Functione04f7
	ld a, [wc6e9]
	ld e, a
	ld d, 0
	ld hl, .Deck
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
	ld a, [wc6e9]
	and 3
	inc a
	lb bc, 6, 5
	call CardFlip_FillBox
	ret
; e043b

.Unknown_e043b: ; e043b
	db $18, $19, $19, $19, $1a
	db $1b, $35, $7f, $7f, $1c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $1d, $1e, $1e, $1e, $1f
; e0459

.Deck: ; e0459
	db "1",$4e, "1",$57, "1",$69, "1",$60
	db "2",$4e, "2",$57, "2",$69, "2",$60
	db "3",$4e, "3",$57, "3",$69, "3",$60
	db "4",$4e, "4",$57, "4",$69, "4",$60
	db "5",$4e, "5",$57, "5",$69, "5",$60
	db "6",$4e, "6",$57, "6",$69, "6",$60
; e0489

CardFlip_UpdateCoinBalanceDisplay: ; e0489
	push hl
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	pop hl
	call PrintTextBoxText
	call CardFlip_PrintCoinBalance
	ret
; e049c

CardFlip_PrintCoinBalance: ; e049c
	hlcoord 9, 15
	ld b, 1
	ld c, 9
	call TextBox
	hlcoord 10, 16
	ld de, .CoinStr
	call PlaceString
	hlcoord 15, 16
	ld de, Coins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret
; e04bc

.CoinStr:
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

CardFlip_FillGreenBox: ; e04e5
	ld a, $29

CardFlip_FillBox: ; e04e7 (38:44e7)
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret

Functione04f7: ; e04f7 (38:44f7)
	push bc
	push hl
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .loop
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
.loop
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
	jr nz, .loop
	ret
; e0521

CardFlip_ShiftDigitsLeftTwoPixels: ; e0521 (38:4521)
	ld de, VTiles1 tile ("0" & $7f)
	ld hl, VTiles1 tile ("0" & $7f) + 2
	ld bc, 10 tiles - 2
	call CopyBytes
	ld hl, VTiles1 tile $7f + 1 tiles - 2
	xor a
	ld [hli], a
	ld [hl], a
	ret
; e0534 (38:4534)

Functione0534: ; e0534
	xor a
	ld [hBGMapMode], a
	ld a, [wc6e9]
	ld e, a
	ld d, 0
	and 3
	ld c, a
	ld b, 0
	ld a, e
	and $1c
	srl a
	add .Jumptable % $100
	ld l, a
	ld a, 0
	adc .Jumptable / $100
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e0553

.Jumptable: ; e0553
	jumptable_start
	jumptable Functione055f
	jumptable Functione0583
	jumptable Functione05a7
	jumptable Functione05cb
	jumptable Functione05ef
	jumptable Functione0613
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
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e0643

.Jumptable: ; e0643
	jumptable_start
	jumptable Functione06a3
	jumptable Functione06a3
	jumptable Functione06a6
	jumptable Functione06a6
	jumptable Functione06b0
	jumptable Functione06b0
	jumptable Functione06a3
	jumptable Functione06a3
	jumptable Functione06ec
	jumptable Functione06f6
	jumptable Functione0702
	jumptable Functione070e
	jumptable Functione06c2
	jumptable Functione0722
	jumptable Functione0770
	jumptable Functione0774
	jumptable Functione0778
	jumptable Functione077c
	jumptable Functione06c2
	jumptable Functione072c
	jumptable Functione0780
	jumptable Functione0784
	jumptable Functione0788
	jumptable Functione078c
	jumptable Functione06cc
	jumptable Functione0738
	jumptable Functione0790
	jumptable Functione0794
	jumptable Functione0798
	jumptable Functione079c
	jumptable Functione06cc
	jumptable Functione0744
	jumptable Functione07a0
	jumptable Functione07a4
	jumptable Functione07a8
	jumptable Functione07ac
	jumptable Functione06d8
	jumptable Functione0750
	jumptable Functione07b0
	jumptable Functione07b4
	jumptable Functione07b8
	jumptable Functione07bc
	jumptable Functione06d8
	jumptable Functione075c
	jumptable Functione07c0
	jumptable Functione07c4
	jumptable Functione07c8
	jumptable Functione07cc
; e06a3

Functione06a3: ; e06a3
	jp Functione07db
; e06a6

Functione06a6: ; e06a6
	ld a, [wc6e9]
	and $2
	jp nz, Functione07db
	jr Functione06ba

Functione06b0: ; e06b0
	ld a, [wc6e9]
	and $2
	jr nz, Functione06ba
	jp Functione07db

Functione06ba: ; e06ba
	ld c, $6
	ld de, SFX_2ND_PLACE
	jp Functione07eb
; e06c2

Functione06c2: ; e06c2
	ld a, [wc6e9]
	and $18
	jr z, Functione06e4
	jp Functione07db

Functione06cc: ; e06cc
	ld a, [wc6e9]
	and $18
	cp $8
	jr z, Functione06e4
	jp Functione07db

Functione06d8: ; e06d8
	ld a, [wc6e9]
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
	ld a, [wc6e9]
	and $3
	jr z, Functione071a
	jp Functione07db

Functione06f6: ; e06f6
	ld a, [wc6e9]
	and $3
	cp $1
	jr z, Functione071a
	jp Functione07db

Functione0702: ; e0702
	ld a, [wc6e9]
	and $3
	cp $2
	jr z, Functione071a
	jp Functione07db

Functione070e: ; e070e
	ld a, [wc6e9]
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
	ld a, [wc6e9]
	and $1c
	jr z, Functione0768
	jp Functione07db

Functione072c: ; e072c
	ld a, [wc6e9]
	and $1c
	cp $4
	jr z, Functione0768
	jp Functione07db

Functione0738: ; e0738
	ld a, [wc6e9]
	and $1c
	cp $8
	jr z, Functione0768
	jp Functione07db

Functione0744: ; e0744
	ld a, [wc6e9]
	and $1c
	cp $c
	jr z, Functione0768
	jp Functione07db

Functione0750: ; e0750
	ld a, [wc6e9]
	and $1c
	cp $10
	jr z, Functione0768
	jp Functione07db

Functione075c: ; e075c
	ld a, [wc6e9]
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
	ld a, [wc6e9]
	cp e
	jr nz, Functione07db
	ld c, $48
	ld de, SFX_2ND_PLACE
	jr Functione07eb

Functione07db: ; e07db
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, UnknownText_0xe0816
	call CardFlip_UpdateCoinBalanceDisplay
	call WaitSFX
	ret

Functione07eb: ; e07eb
	push bc
	push de
	ld hl, UnknownText_0xe0811
	call CardFlip_UpdateCoinBalanceDisplay
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
	call CardFlip_PrintCoinBalance
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
	jr nz, .skip
	ld a, [hVBlankCounter]
	and $4
	ret nz

.skip
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
	dbbw 11 * 8,  2 * 8,     Unknown_e0c26
	dbbw 12 * 8,  2 * 8,     Unknown_e0c26
	dbbw 13 * 8,  2 * 8,     Unknown_e0b8d
	dbbw 13 * 8,  2 * 8,     Unknown_e0b8d
	dbbw 17 * 8,  2 * 8,     Unknown_e0b8d
	dbbw 17 * 8,  2 * 8,     Unknown_e0b8d

	dbbw 11 * 8,  3 * 8,     Unknown_e0c26
	dbbw 12 * 8,  3 * 8,     Unknown_e0c26
	dbbw 13 * 8,  3 * 8,     Unknown_e0a5a
	dbbw 15 * 8,  3 * 8,     Unknown_e0a5a
	dbbw 17 * 8,  3 * 8,     Unknown_e0a5a
	dbbw 19 * 8,  3 * 8,     Unknown_e0a5a

	dbbw 11 * 8,  5 * 8,     Unknown_e0b14
	dbbw 12 * 8,  5 * 8,     Unknown_e0ac3
	dbbw 13 * 8,  5 * 8,     Unknown_e0a41
	dbbw 15 * 8,  5 * 8,     Unknown_e0a41
	dbbw 17 * 8,  5 * 8,     Unknown_e0a41
	dbbw 19 * 8,  5 * 8,     Unknown_e0a41

	dbbw 11 * 8,  5 * 8,     Unknown_e0b14
	dbbw 12 * 8,  6 * 8 + 4, Unknown_e0ac3
	dbbw 13 * 8,  6 * 8 + 4, Unknown_e0a41
	dbbw 15 * 8,  6 * 8 + 4, Unknown_e0a41
	dbbw 17 * 8,  6 * 8 + 4, Unknown_e0a41
	dbbw 19 * 8,  6 * 8 + 4, Unknown_e0a41

	dbbw 11 * 8,  8 * 8,     Unknown_e0b14
	dbbw 12 * 8,  8 * 8,     Unknown_e0ac3
	dbbw 13 * 8,  8 * 8,     Unknown_e0a41
	dbbw 15 * 8,  8 * 8,     Unknown_e0a41
	dbbw 17 * 8,  8 * 8,     Unknown_e0a41
	dbbw 19 * 8,  8 * 8,     Unknown_e0a41

	dbbw 11 * 8,  8 * 8,     Unknown_e0b14
	dbbw 12 * 8,  9 * 8 + 4, Unknown_e0ac3
	dbbw 13 * 8,  9 * 8 + 4, Unknown_e0a41
	dbbw 15 * 8,  9 * 8 + 4, Unknown_e0a41
	dbbw 17 * 8,  9 * 8 + 4, Unknown_e0a41
	dbbw 19 * 8,  9 * 8 + 4, Unknown_e0a41

	dbbw 11 * 8, 11 * 8,     Unknown_e0b14
	dbbw 12 * 8, 11 * 8,     Unknown_e0ac3
	dbbw 13 * 8, 11 * 8,     Unknown_e0a41
	dbbw 15 * 8, 11 * 8,     Unknown_e0a41
	dbbw 17 * 8, 11 * 8,     Unknown_e0a41
	dbbw 19 * 8, 11 * 8,     Unknown_e0a41

	dbbw 11 * 8, 11 * 8,     Unknown_e0b14
	dbbw 12 * 8, 12 * 8 + 4, Unknown_e0ac3
	dbbw 13 * 8, 12 * 8 + 4, Unknown_e0a41
	dbbw 15 * 8, 12 * 8 + 4, Unknown_e0a41
	dbbw 17 * 8, 12 * 8 + 4, Unknown_e0a41
	dbbw 19 * 8, 12 * 8 + 4, Unknown_e0a41
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
	call CardFlip_FillBox
	hlcoord 14, 1, AttrMap
	lb bc, 2, 2
	ld a, $2
	call CardFlip_FillBox
	hlcoord 16, 1, AttrMap
	lb bc, 2, 2
	ld a, $3
	call CardFlip_FillBox
	hlcoord 18, 1, AttrMap
	lb bc, 2, 2
	ld a, $4
	call CardFlip_FillBox
	hlcoord 9, 0, AttrMap
	lb bc, 12, 1
	ld a, $1
	call CardFlip_FillBox
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

CardFlipLZ03: ; e0cdb
INCBIN "gfx/unknown/0e0cdb.2bpp.lz"

CardFlipOffButtonGFX: ; e0cf6
INCBIN "gfx/unknown/0e0cf6.2bpp"

CardFlipOnButtonGFX: ; e0d06
INCBIN "gfx/unknown/0e0d06.2bpp"

CardFlipLZ01: ; e0d16
INCBIN "gfx/unknown/0e0d16.2bpp.lz"

CardFlipLZ02: ; e0ea8
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
