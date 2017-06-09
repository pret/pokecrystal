CARDFLIP_LIGHT_OFF EQU $ef
CARDFLIP_LIGHT_ON  EQU $f5
CARDFLIP_DECK_SIZE EQU 4 * 6

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
	call CardFlip_InitTilemap
	call CardFlip_InitAttrPals
	call EnableLCD
	call WaitBGMap2
	ld a, $e4
	call DmgToCgbBGPals
	ld de, $e4e4
	call DmgToCgbObjPals
	call DelayFrame
	xor a
	ld [wJumptableIndex], a
	ld a, $2
	ld [wCardFlipCursorY], a
	ld [wCardFlipCursorX], a
	ld de, MUSIC_GAME_CORNER
	call PlayMusic
.MasterLoop:
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
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
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
	call CardFlip_UpdateCoinBalanceDisplay
	call YesNoBox
	jr c, .SaidNo
	call CardFlip_ShuffleDeck
	call .Increment
	ret

.SaidNo:
	ld a, 7
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
	ld a, 7
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
	ld a, [wCardFlipNumCardsPlayed]
	call AddNTimes
	ld [hl], CARDFLIP_LIGHT_ON
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	call PlaceCardFaceDown
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 6
	call PlaceCardFaceDown
	call WaitBGMap
	ld hl, .ChooseACardText
	call CardFlip_UpdateCoinBalanceDisplay
	xor a
	ld [wCardFlipWhichCard], a
.loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .next
	ld de, SFX_KINESIS
	call PlaySFX
	call PlaceOAMCardBorder
	ld c, 4
	call DelayFrames
	ld hl, wCardFlipWhichCard
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
	call PlaceOAMCardBorder
	ld c, 4
	call DelayFrames
	call ClearSprites
	ld c, 4
	call DelayFrames
	pop af
	dec a
	jr nz, .loop2
	ld hl, wCardFlipWhichCard
	ld a, [hl]
	push af
	xor $1
	ld [hl], a
	call GetCoordsOfChosenCard
	lb bc, 6, 5
	call CardFlip_FillGreenBox
	pop af
	ld [wCardFlipWhichCard], a
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
	call ChooseCard_HandleJoypad
	call CardFlip_UpdateCursorOAM
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
	call CardFlip_UpdateCursorOAM
	call WaitSFX
	ld de, SFX_CHOOSE_A_CARD
	call PlaySFX
	call WaitSFX
	ld a, [wCardFlipNumCardsPlayed]
	ld e, a
	ld d, 0
	ld hl, wDeck
	add hl, de
	add hl, de
	ld a, [wCardFlipWhichCard]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wCardFlipFaceUpCard], a
	ld e, a
	ld hl, wDiscardPile
	add hl, de
	ld [hl], TRUE
	call GetCoordsOfChosenCard
	call CardFlip_DisplayCardFaceUp
	call WaitBGMap2
	call .Increment
	ret
; e0314

.TabulateTheResult: ; e0314
	call CardFlip_CheckWinCondition
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

.Continue:
	ld a, [wCardFlipNumCardsPlayed]
	inc a
	ld [wCardFlipNumCardsPlayed], a
	cp 12
	jr c, .KeepTheCurrentDeck
	call CardFlip_InitTilemap
	ld a, $1
	ld [hBGMapMode], a
	call CardFlip_ShuffleDeck
	ld hl, .CardsShuffledText
	call PrintText
	jr .LoopAround

.KeepTheCurrentDeck:
	call CardFlip_BlankDiscardedCardSlot

.LoopAround:
	ld a, 1
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
	ld bc, CARDFLIP_DECK_SIZE
	xor a
	call ByteFill
	ld de, wDeck
	ld c, CARDFLIP_DECK_SIZE - 1
.loop
	call Random
	and $1f
	cp CARDFLIP_DECK_SIZE
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
	ld [wCardFlipNumCardsPlayed], a
	ld hl, wDiscardPile
	ld bc, CARDFLIP_DECK_SIZE
	call ByteFill
	ret
; e0398

CollapseCursorPosition: ; e0398
	ld hl, 0
	ld bc, 6
	ld a, [wCardFlipCursorY]
	call AddNTimes
	ld b, $0
	ld a, [wCardFlipCursorX]
	ld c, a
	add hl, bc
	ret
; e03ac

GetCoordsOfChosenCard: ; e03ac
	ld a, [wCardFlipWhichCard]
	and a
	jr nz, .BottomCard
	hlcoord 2, 0
	bcpixel 2, 3
	jr .done

.BottomCard:
	hlcoord 2, 6
	bcpixel 8, 3

.done
	ret
; e03c1

PlaceCardFaceDown: ; e03c1
	xor a
	ld [hBGMapMode], a
	ld de, .FaceDownCardTilemap
	lb bc, 6, 5
	call CardFlip_CopyToBox
	ret
; e03ce

.FaceDownCardTilemap: ; e03ce
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
	; Flip the card face up.
	ld de, .FaceUpCardTilemap
	lb bc, 6, 5
	call CardFlip_CopyToBox

	; Get the level and species of the upturned card.
	ld a, [wCardFlipFaceUpCard]
	ld e, a
	ld d, 0
	ld hl, .Deck
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]

	; Place the level.
	pop hl
	ld bc, 3 + SCREEN_WIDTH
	add hl, bc
	ld [hl], e

	; Place the Pokepic.
	ld bc, SCREEN_HEIGHT
	add hl, bc
	ld a, d
	ld de, SCREEN_WIDTH
	ld b, 3
.row
	push hl
	ld c, 3
.col
	ld [hli], a
	inc a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	dec b
	jr nz, .row
	pop hl

	; Pointless CGB check
	ld a, [hCGB]
	and a
	ret z

	; Set the attributes
	ld de, AttrMap - TileMap
	add hl, de
	ld a, [wCardFlipFaceUpCard]
	and 3
	inc a
	lb bc, 6, 5
	call CardFlip_FillBox
	ret
; e043b

.FaceUpCardTilemap: ; e043b
	db $18, $19, $19, $19, $1a
	db $1b, $35, $7f, $7f, $1c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $1d, $1e, $1e, $1e, $1f
; e0459

.Deck: ; e0459
	; level, pic anchor (3x3)
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

CardFlip_InitTilemap: ; e04c1 (38:44c1)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $29
	call ByteFill
	hlcoord 9, 0
	ld de, CardFlipTilemap
	lb bc, 12, 11
	call CardFlip_CopyToBox
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

CardFlip_CopyToBox: ; e04f7 (38:44f7)
.row
	push bc
	push hl
.col
	ld a, [de]
	inc de
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
; e0509 (38:4509)

CardFlip_CopyOAM: ; e0509
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

CardFlip_BlankDiscardedCardSlot: ; e0534
	xor a
	ld [hBGMapMode], a
	ld a, [wCardFlipFaceUpCard]
	ld e, a
	ld d, 0

	and 3 ; get mon
	ld c, a
	ld b, 0

	ld a, e
	and $1c ; get level
	srl a
	add .Jumptable % $100
	ld l, a
	ld a, 0
	adc .Jumptable / $100
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e0553

.Jumptable: ; e0553

	dw .Level1
	dw .Level2
	dw .Level3
	dw .Level4
	dw .Level5
	dw .Level6
; e055f

.Level1: ; e055f
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded2
	hlcoord 13, 3
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $37
	ret

.discarded2
	hlcoord 13, 3
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0583

.Level2: ; e0583
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded1
	hlcoord 13, 4
	add hl, bc
	add hl, bc
	ld [hl], $3b
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded1
	hlcoord 13, 4
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05a7

.Level3: ; e05a7
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded4
	hlcoord 13, 6
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $38
	ret

.discarded4
	hlcoord 13, 6
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e05cb

.Level4: ; e05cb
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded3
	hlcoord 13, 7
	add hl, bc
	add hl, bc
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded3
	hlcoord 13, 7
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e05ef

.Level5: ; e05ef
	ld hl, wDiscardPile + 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded6
	hlcoord 13, 9
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $39
	ret

.discarded6
	hlcoord 13, 9
	add hl, bc
	add hl, bc
	ld [hl], $36
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3d
	ret
; e0613

.Level6: ; e0613
	ld hl, wDiscardPile - 4
	add hl, de
	ld a, [hl]
	and a
	jr nz, .discarded5
	hlcoord 13, 10
	add hl, bc
	add hl, bc
	ld [hl], $3c
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret

.discarded5
	hlcoord 13, 10
	add hl, bc
	add hl, bc
	ld [hl], $3d
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld [hl], $3a
	ret
; e0637

CardFlip_CheckWinCondition: ; e0637
	call CollapseCursorPosition
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; e0643

.Jumptable: ; e0643

	dw .Impossible
	dw .Impossible
	dw .PikaJiggly
	dw .PikaJiggly
	dw .PoliOddish
	dw .PoliOddish

	dw .Impossible
	dw .Impossible
	dw .Pikachu
	dw .Jigglypuff
	dw .Poliwag
	dw .Oddish

	dw .OneTwo
	dw .One
	dw .PikaOne
	dw .JigglyOne
	dw .PoliOne
	dw .OddOne

	dw .OneTwo
	dw .Two
	dw .PikaTwo
	dw .JigglyTwo
	dw .PoliTwo
	dw .OddTwo

	dw .ThreeFour
	dw .Three
	dw .PikaThree
	dw .JigglyThree
	dw .PoliThree
	dw .OddThree

	dw .ThreeFour
	dw .Four
	dw .PikaFour
	dw .JigglyFour
	dw .PoliFour
	dw .OddFour

	dw .FiveSix
	dw .Five
	dw .PikaFive
	dw .JigglyFive
	dw .PoliFive
	dw .OddFive

	dw .FiveSix
	dw .Six
	dw .PikaSix
	dw .JigglySix
	dw .PoliSix
	dw .OddSix
; e06a3

.Impossible: ; e06a3
	jp .Lose
; e06a6

.PikaJiggly: ; e06a6
	ld a, [wCardFlipFaceUpCard]
	and $2
	jp nz, .Lose
	jr .WinSix

.PoliOddish: ; e06b0
	ld a, [wCardFlipFaceUpCard]
	and $2
	jr nz, .WinSix
	jp .Lose

.WinSix: ; e06ba
	ld c, $6
	ld de, SFX_2ND_PLACE
	jp .Payout
; e06c2

.OneTwo: ; e06c2
	ld a, [wCardFlipFaceUpCard]
	and $18
	jr z, .WinNine
	jp .Lose

.ThreeFour: ; e06cc
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $8
	jr z, .WinNine
	jp .Lose

.FiveSix: ; e06d8
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $10
	jr z, .WinNine
	jp .Lose

.WinNine: ; e06e4
	ld c, $9
	ld de, SFX_2ND_PLACE
	jp .Payout
; e06ec

.Pikachu: ; e06ec
	ld a, [wCardFlipFaceUpCard]
	and $3
	jr z, .WinTwelve
	jp .Lose

.Jigglypuff: ; e06f6
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $1
	jr z, .WinTwelve
	jp .Lose

.Poliwag: ; e0702
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $2
	jr z, .WinTwelve
	jp .Lose

.Oddish: ; e070e
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $3
	jr z, .WinTwelve
	jp .Lose

.WinTwelve: ; e071a
	ld c, $c
	ld de, SFX_2ND_PLACE
	jp .Payout
; e0722

.One: ; e0722
	ld a, [wCardFlipFaceUpCard]
	and $1c
	jr z, .WinEighteen
	jp .Lose

.Two: ; e072c
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $4
	jr z, .WinEighteen
	jp .Lose

.Three: ; e0738
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $8
	jr z, .WinEighteen
	jp .Lose

.Four: ; e0744
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $c
	jr z, .WinEighteen
	jp .Lose

.Five: ; e0750
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $10
	jr z, .WinEighteen
	jp .Lose

.Six: ; e075c
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $14
	jr z, .WinEighteen
	jp .Lose

.WinEighteen: ; e0768
	ld c, $12
	ld de, SFX_2ND_PLACE
	jp .Payout
; e0770


.PikaOne: ; e0770
	ld e, $0
	jr .CheckWin72

.JigglyOne: ; e0774
	ld e, $1
	jr .CheckWin72

.PoliOne: ; e0778
	ld e, $2
	jr .CheckWin72

.OddOne: ; e077c
	ld e, $3
	jr .CheckWin72

.PikaTwo: ; e0780
	ld e, $4
	jr .CheckWin72

.JigglyTwo: ; e0784
	ld e, $5
	jr .CheckWin72

.PoliTwo: ; e0788
	ld e, $6
	jr .CheckWin72

.OddTwo: ; e078c
	ld e, $7
	jr .CheckWin72

.PikaThree: ; e0790
	ld e, $8
	jr .CheckWin72

.JigglyThree: ; e0794
	ld e, $9
	jr .CheckWin72

.PoliThree: ; e0798
	ld e, $a
	jr .CheckWin72

.OddThree: ; e079c
	ld e, $b
	jr .CheckWin72

.PikaFour: ; e07a0
	ld e, $c
	jr .CheckWin72

.JigglyFour: ; e07a4
	ld e, $d
	jr .CheckWin72

.PoliFour: ; e07a8
	ld e, $e
	jr .CheckWin72

.OddFour: ; e07ac
	ld e, $f
	jr .CheckWin72

.PikaFive: ; e07b0
	ld e, $10
	jr .CheckWin72

.JigglyFive: ; e07b4
	ld e, $11
	jr .CheckWin72

.PoliFive: ; e07b8
	ld e, $12
	jr .CheckWin72

.OddFive: ; e07bc
	ld e, $13
	jr .CheckWin72

.PikaSix: ; e07c0
	ld e, $14
	jr .CheckWin72

.JigglySix: ; e07c4
	ld e, $15
	jr .CheckWin72

.PoliSix: ; e07c8
	ld e, $16
	jr .CheckWin72

.OddSix: ; e07cc
	ld e, $17

.CheckWin72: ; e07ce
	ld a, [wCardFlipFaceUpCard]
	cp e
	jr nz, .Lose
	ld c, 72
	ld de, SFX_2ND_PLACE
	jr .Payout

.Lose: ; e07db
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, .Text_Darn
	call CardFlip_UpdateCoinBalanceDisplay
	call WaitSFX
	ret

.Payout: ; e07eb
	push bc
	push de
	ld hl, .Text_Yeah
	call CardFlip_UpdateCoinBalanceDisplay
	pop de
	call PlaySFX
	call WaitSFX
	pop bc
.loop
	push bc
	call .IsCoinCaseFull
	jr c, .full
	call .AddCoinPlaySFX

.full
	call CardFlip_PrintCoinBalance
	ld c, 2
	call DelayFrames
	pop bc
	dec c
	jr nz, .loop
	ret
; e0811

.Text_Yeah: ; 0xe0811
	; Yeah!
	text_jump UnknownText_0x1c5813
	db "@"
; 0xe0816

.Text_Darn: ; 0xe0816
	; Darn…
	text_jump UnknownText_0x1c581a
	db "@"
; 0xe081b

.AddCoinPlaySFX: ; e081b
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

.IsCoinCaseFull: ; e0833
	ld a, [Coins]
	cp 9999 / $100
	jr c, .less
	jr z, .check_low
	jr .more

.check_low
	ld a, [Coins + 1]
	cp 9999 % $100
	jr c, .less

.more
	scf
	ret

.less
	and a
	ret
; e0849

PlaceOAMCardBorder: ; e0849
	call GetCoordsOfChosenCard
	ld hl, .SpriteData
	call CardFlip_CopyOAM
	ret
; e0853

.SpriteData: ; e0853
	db 18
	dsprite 0, 0, 0, 0, $04, $00
	dsprite 0, 0, 1, 0, $06, $00
	dsprite 0, 0, 2, 0, $06, $00
	dsprite 0, 0, 3, 0, $06, $00
	dsprite 0, 0, 4, 0, $04, $20

	dsprite 1, 0, 0, 0, $05, $00
	dsprite 1, 0, 4, 0, $05, $20

	dsprite 2, 0, 0, 0, $05, $00
	dsprite 2, 0, 4, 0, $05, $20

	dsprite 3, 0, 0, 0, $05, $00
	dsprite 3, 0, 4, 0, $05, $20

	dsprite 4, 0, 0, 0, $05, $00
	dsprite 4, 0, 4, 0, $05, $20

	dsprite 5, 0, 0, 0, $04, $40
	dsprite 5, 0, 1, 0, $06, $40
	dsprite 5, 0, 2, 0, $06, $40
	dsprite 5, 0, 3, 0, $06, $40
	dsprite 5, 0, 4, 0, $04, $60
; e089c

ChooseCard_HandleJoypad: ; e089c
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jp nz, .d_left
	ld a, [hl]
	and D_RIGHT
	jp nz, .d_right
	ld a, [hl]
	and D_UP
	jp nz, .d_up
	ld a, [hl]
	and D_DOWN
	jp nz, .d_down
	ret
; e08b8

.d_left ; e08b8
	ld hl, wCardFlipCursorX
	ld a, [wCardFlipCursorY]
	and a
	jr z, .mon_pair_left
	cp $1
	jr z, .mon_group_left
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jp .play_sound

.mon_group_left
	ld a, [hl]
	cp $3
	jr c, .left_to_number_gp
	dec [hl]
	jp .play_sound

.mon_pair_left
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .left_to_number_gp
	dec [hl]
	dec [hl]
	jp .play_sound

.left_to_number_gp
	ld a, $2
	ld [wCardFlipCursorY], a
	ld a, $1
	ld [wCardFlipCursorX], a
	jp .play_sound
; e08ef

.d_right ; e08ef
	ld hl, wCardFlipCursorX
	ld a, [wCardFlipCursorY]
	and a
	jr z, .mon_pair_right
	ld a, [hl]
	cp $5
	ret nc
	inc [hl]
	jr .play_sound

.mon_pair_right
	ld a, [hl]
	and $e
	ld [hl], a
	cp $4
	ret nc
	inc [hl]
	inc [hl]
	jr .play_sound

.d_up ; e090a
	ld hl, wCardFlipCursorY
	ld a, [wCardFlipCursorX]
	and a
	jr z, .num_pair_up
	cp $1
	jr z, .num_gp_up
	ld a, [hl]
	and a
	ret z
	dec [hl]
	jr .play_sound

.num_gp_up
	ld a, [hl]
	cp $3
	jr c, .up_to_mon_group
	dec [hl]
	jr .play_sound

.num_pair_up
	ld a, [hl]
	and $e
	ld [hl], a
	cp $3
	jr c, .up_to_mon_group
	dec [hl]
	dec [hl]
	jr .play_sound

.up_to_mon_group
	ld a, $1
	ld [wCardFlipCursorY], a
	ld a, $2
	ld [wCardFlipCursorX], a
	jr .play_sound

.d_down ; e093d
	ld hl, wCardFlipCursorY
	ld a, [wCardFlipCursorX]
	and a
	jr z, .num_pair_down
	ld hl, wCardFlipCursorY
	ld a, [hl]
	cp $7
	ret nc
	inc [hl]
	jr .play_sound

.num_pair_down
	ld a, [hl]
	and $e
	ld [hl], a
	cp $6
	ret nc
	inc [hl]
	inc [hl]

.play_sound ; e0959
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret
; e0960

CardFlip_UpdateCursorOAM: ; e0960
	call ClearSprites
	ld a, [hCGB]
	and a
	jr nz, .skip
	ld a, [hVBlankCounter]
	and $4
	ret nz

.skip
	call CollapseCursorPosition
	add hl, hl
	add hl, hl
	ld de, .OAMData
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CardFlip_CopyOAM
	ret
; e0981

.OAMData: ; e0981
cardflip_cursor: MACRO
if _NARG >= 5
	dbpixel \1, \2, \3, \4
	dw \5
else
	dbpixel \1, \2
	dw \3
endc
endm


	cardflip_cursor 11,  2,       .Impossible
	cardflip_cursor 12,  2,       .Impossible
	cardflip_cursor 13,  2,       .PokeGroupPair
	cardflip_cursor 13,  2,       .PokeGroupPair
	cardflip_cursor 17,  2,       .PokeGroupPair
	cardflip_cursor 17,  2,       .PokeGroupPair

	cardflip_cursor 11,  3,       .Impossible
	cardflip_cursor 12,  3,       .Impossible
	cardflip_cursor 13,  3,       .PokeGroup
	cardflip_cursor 15,  3,       .PokeGroup
	cardflip_cursor 17,  3,       .PokeGroup
	cardflip_cursor 19,  3,       .PokeGroup

	cardflip_cursor 11,  5,       .NumGroupPair
	cardflip_cursor 12,  5,       .NumGroup
	cardflip_cursor 13,  5,       .SingleTile
	cardflip_cursor 15,  5,       .SingleTile
	cardflip_cursor 17,  5,       .SingleTile
	cardflip_cursor 19,  5,       .SingleTile

	cardflip_cursor 11,  5,       .NumGroupPair
	cardflip_cursor 12,  6, 0, 4, .NumGroup
	cardflip_cursor 13,  6, 0, 4, .SingleTile
	cardflip_cursor 15,  6, 0, 4, .SingleTile
	cardflip_cursor 17,  6, 0, 4, .SingleTile
	cardflip_cursor 19,  6, 0, 4, .SingleTile

	cardflip_cursor 11,  8,       .NumGroupPair
	cardflip_cursor 12,  8,       .NumGroup
	cardflip_cursor 13,  8,       .SingleTile
	cardflip_cursor 15,  8,       .SingleTile
	cardflip_cursor 17,  8,       .SingleTile
	cardflip_cursor 19,  8,       .SingleTile

	cardflip_cursor 11,  8,       .NumGroupPair
	cardflip_cursor 12,  9, 0, 4, .NumGroup
	cardflip_cursor 13,  9, 0, 4, .SingleTile
	cardflip_cursor 15,  9, 0, 4, .SingleTile
	cardflip_cursor 17,  9, 0, 4, .SingleTile
	cardflip_cursor 19,  9, 0, 4, .SingleTile

	cardflip_cursor 11, 11,       .NumGroupPair
	cardflip_cursor 12, 11,       .NumGroup
	cardflip_cursor 13, 11,       .SingleTile
	cardflip_cursor 15, 11,       .SingleTile
	cardflip_cursor 17, 11,       .SingleTile
	cardflip_cursor 19, 11,       .SingleTile

	cardflip_cursor 11, 11,       .NumGroupPair
	cardflip_cursor 12, 12, 0, 4, .NumGroup
	cardflip_cursor 13, 12, 0, 4, .SingleTile
	cardflip_cursor 15, 12, 0, 4, .SingleTile
	cardflip_cursor 17, 12, 0, 4, .SingleTile
	cardflip_cursor 19, 12, 0, 4, .SingleTile
; e0a41

.SingleTile: ; e0a41
	db 6
	dsprite   0, 0,  -1, 7, $00, $80
	dsprite   0, 0,   0, 0, $02, $80
	dsprite   0, 0,   1, 0, $03, $80
	dsprite   0, 5,  -1, 7, $00, $c0
	dsprite   0, 5,   0, 0, $02, $c0
	dsprite   0, 5,   1, 0, $03, $80

.PokeGroup: ; e0a5a
	db 26
	dsprite   0, 0,  -1, 7, $00, $80
	dsprite   0, 0,   0, 0, $02, $80
	dsprite   0, 0,   1, 0, $00, $a0
	dsprite   1, 0,  -1, 7, $01, $80
	dsprite   1, 0,   1, 0, $01, $a0
	dsprite   2, 0,  -1, 7, $01, $80
	dsprite   2, 0,   1, 0, $03, $80
	dsprite   3, 0,  -1, 7, $01, $80
	dsprite   3, 0,   1, 0, $03, $80
	dsprite   4, 0,  -1, 7, $01, $80
	dsprite   4, 0,   1, 0, $03, $80
	dsprite   5, 0,  -1, 7, $01, $80
	dsprite   5, 0,   1, 0, $03, $80
	dsprite   6, 0,  -1, 7, $01, $80
	dsprite   6, 0,   1, 0, $03, $80
	dsprite   7, 0,  -1, 7, $01, $80
	dsprite   7, 0,   1, 0, $03, $80
	dsprite   8, 0,  -1, 7, $01, $80
	dsprite   8, 0,   1, 0, $03, $80
	dsprite   9, 0,  -1, 7, $01, $80
	dsprite   9, 0,   1, 0, $03, $80
	dsprite  10, 0,  -1, 7, $01, $80
	dsprite  10, 0,   1, 0, $03, $80
	dsprite  10, 1,  -1, 7, $00, $c0
	dsprite  10, 1,   0, 0, $02, $c0
	dsprite  10, 1,   1, 0, $03, $80

.NumGroup: ; e0ac3
	db 20
	dsprite   0, 0,  -1, 7, $00, $80
	dsprite   0, 0,   0, 0, $02, $80
	dsprite   0, 0,   1, 0, $02, $80
	dsprite   0, 0,   2, 0, $03, $80
	dsprite   0, 0,   3, 0, $02, $80
	dsprite   0, 0,   4, 0, $03, $80
	dsprite   0, 0,   5, 0, $02, $80
	dsprite   0, 0,   6, 0, $03, $80
	dsprite   0, 0,   7, 0, $02, $80
	dsprite   0, 0,   8, 0, $03, $80
	dsprite   0, 5,  -1, 7, $00, $c0
	dsprite   0, 5,   0, 0, $02, $c0
	dsprite   0, 5,   1, 0, $02, $c0
	dsprite   0, 5,   2, 0, $03, $80
	dsprite   0, 5,   3, 0, $02, $c0
	dsprite   0, 5,   4, 0, $03, $80
	dsprite   0, 5,   5, 0, $02, $c0
	dsprite   0, 5,   6, 0, $03, $80
	dsprite   0, 5,   7, 0, $02, $c0
	dsprite   0, 5,   8, 0, $03, $80

.NumGroupPair: ; e0b14
	db 30
	dsprite   0, 0,   0, 0, $00, $80
	dsprite   0, 0,   1, 0, $02, $80
	dsprite   0, 0,   2, 0, $02, $80
	dsprite   0, 0,   3, 0, $03, $80
	dsprite   0, 0,   4, 0, $02, $80
	dsprite   0, 0,   5, 0, $03, $80
	dsprite   0, 0,   6, 0, $02, $80
	dsprite   0, 0,   7, 0, $03, $80
	dsprite   0, 0,   8, 0, $02, $80
	dsprite   0, 0,   9, 0, $03, $80
	dsprite   1, 0,   0, 0, $01, $80
	dsprite   1, 0,   3, 0, $03, $80
	dsprite   1, 0,   5, 0, $03, $80
	dsprite   1, 0,   7, 0, $03, $80
	dsprite   1, 0,   9, 0, $03, $80
	dsprite   2, 0,   0, 0, $01, $80
	dsprite   2, 0,   3, 0, $03, $80
	dsprite   2, 0,   5, 0, $03, $80
	dsprite   2, 0,   7, 0, $03, $80
	dsprite   2, 0,   9, 0, $03, $80
	dsprite   2, 1,   0, 0, $00, $c0
	dsprite   2, 1,   1, 0, $02, $c0
	dsprite   2, 1,   2, 0, $02, $c0
	dsprite   2, 1,   3, 0, $03, $80
	dsprite   2, 1,   4, 0, $03, $80
	dsprite   2, 1,   5, 0, $03, $80
	dsprite   2, 1,   6, 0, $03, $80
	dsprite   2, 1,   7, 0, $03, $80
	dsprite   2, 1,   8, 0, $03, $80
	dsprite   2, 1,   9, 0, $03, $80

.PokeGroupPair: ; e0b8d
	db 38
	dsprite   0, 0,  -1, 7, $00, $80
	dsprite   0, 0,   3, 0, $00, $a0
	dsprite   1, 0,  -1, 7, $01, $80
	dsprite   1, 0,   3, 0, $01, $a0
	dsprite   2, 0,  -1, 7, $01, $80
	dsprite   2, 0,   3, 0, $01, $a0
	dsprite   3, 0,  -1, 7, $01, $80
	dsprite   3, 0,   1, 0, $03, $80
	dsprite   3, 0,   3, 0, $03, $80
	dsprite   4, 0,  -1, 7, $01, $80
	dsprite   4, 0,   1, 0, $03, $80
	dsprite   4, 0,   3, 0, $03, $80
	dsprite   5, 0,  -1, 7, $01, $80
	dsprite   5, 0,   1, 0, $03, $80
	dsprite   5, 0,   3, 0, $03, $80
	dsprite   6, 0,  -1, 7, $01, $80
	dsprite   6, 0,   1, 0, $03, $80
	dsprite   6, 0,   3, 0, $03, $80
	dsprite   7, 0,  -1, 7, $01, $80
	dsprite   7, 0,   1, 0, $03, $80
	dsprite   7, 0,   3, 0, $03, $80
	dsprite   8, 0,  -1, 7, $01, $80
	dsprite   8, 0,   1, 0, $03, $80
	dsprite   8, 0,   3, 0, $03, $80
	dsprite   9, 0,  -1, 7, $01, $80
	dsprite   9, 0,   1, 0, $03, $80
	dsprite   9, 0,   3, 0, $03, $80
	dsprite  10, 0,  -1, 7, $01, $80
	dsprite  10, 0,   1, 0, $03, $80
	dsprite  10, 0,   3, 0, $03, $80
	dsprite  11, 0,  -1, 7, $01, $80
	dsprite  11, 0,   1, 0, $03, $80
	dsprite  11, 0,   3, 0, $03, $80
	dsprite  11, 1,  -1, 7, $00, $c0
	dsprite  11, 1,   0, 0, $02, $c0
	dsprite  11, 1,   1, 0, $03, $c0
	dsprite  11, 1,   2, 0, $02, $c0
	dsprite  11, 1,   3, 0, $03, $e0

.Impossible: ; e0c26
	db 4
	dsprite   0, 0,   0, 0, $00, $80
	dsprite   0, 0,   1, 0, $00, $a0
	dsprite   1, 0,   0, 0, $00, $c0
	dsprite   1, 0,   1, 0, $00, $e0
; e0c37

CardFlip_InitAttrPals: ; e0c37 (38:4c37)
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
	ld hl, .palettes
	ld de, UnknBGPals
	ld bc, 9 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; e0c93 (38:4c93)

.palettes ; e0c93
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

CardFlipTilemap: ; e110c
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
