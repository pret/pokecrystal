DEF CARDFLIP_LIGHT_OFF EQU "♂" ; $ef
DEF CARDFLIP_LIGHT_ON  EQU "♀" ; $f5

DEF CARDFLIP_DECK_SIZE EQUS "(wDeckEnd - wDeck)"
	assert wDiscardPileEnd - wDiscardPile == wDeckEnd - wDeck

MemoryGameGFX:
; Graphics for an unused Game Corner
; game were meant to be here.

UnusedCursor_InterpretJoypad_AnimateCursor:
	ret

_CardFlip:
	ld hl, wOptions
	set NO_TEXT_SCROLL, [hl]
	call ClearBGPalettes
	call ClearTilemap
	call ClearSprites
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra

	ld hl, CardFlipLZ01
	ld de, vTiles2 tile $00
	call Decompress
	ld hl, CardFlipLZ02
	ld de, vTiles2 tile $3e
	call Decompress
	ld hl, CardFlipLZ03
	ld de, vTiles0 tile $00
	call Decompress
	ld hl, CardFlipOffButtonGFX
	ld de, vTiles0 tile CARDFLIP_LIGHT_OFF
	ld bc, 1 tiles
	call CopyBytes
	ld hl, CardFlipOnButtonGFX
	ld de, vTiles0 tile CARDFLIP_LIGHT_ON
	ld bc, 1 tiles
	call CopyBytes

	call CardFlip_ShiftDigitsUpOnePixel
	call CardFlip_InitTilemap
	call CardFlip_InitAttrPals
	call EnableLCD
	call WaitBGMap2
	ld a, %11100100
	call DmgToCgbBGPals
	lb de, %11100100, %11100100
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
	ld hl, wOptions
	res 4, [hl]
	ret

.CardFlip:
	jumptable .Jumptable, wJumptableIndex

.Jumptable:
	dw .AskPlayWithThree
	dw .DeductCoins
	dw .ChooseACard
	dw .PlaceYourBet
	dw .CheckTheCard
	dw .TabulateTheResult
	dw .PlayAgain
	dw .Quit

.Increment:
	ld hl, wJumptableIndex
	inc [hl]
	ret

.AskPlayWithThree:
	ld hl, .CardFlipPlayWithThreeCoinsText
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

.CardFlipPlayWithThreeCoinsText:
	text_far _CardFlipPlayWithThreeCoinsText
	text_end

.DeductCoins:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	ld a, h
	and a
	jr nz, .deduct ; You have at least 256 coins.
	ld a, l
	cp 3
	jr nc, .deduct ; You have at least 3 coins.
	ld hl, .CardFlipNotEnoughCoinsText
	call CardFlip_UpdateCoinBalanceDisplay
	ld a, 7
	ld [wJumptableIndex], a
	ret

.deduct
	ld de, -3
	add hl, de
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	xor a
	ldh [hBGMapMode], a
	call CardFlip_PrintCoinBalance
	ld a, $1
	ldh [hBGMapMode], a
	call WaitSFX
	call .Increment
	ret

.CardFlipNotEnoughCoinsText:
	text_far _CardFlipNotEnoughCoinsText
	text_end

.ChooseACard:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 9
	call CardFlip_FillGreenBox
	hlcoord 9, 0
	ld bc, SCREEN_WIDTH
	ld a, [wCardFlipNumCardsPlayed]
	call AddNTimes
	ld [hl], CARDFLIP_LIGHT_ON
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	call PlaceCardFaceDown
	ld a, $1
	ldh [hBGMapMode], a
	ld c, 20
	call DelayFrames
	hlcoord 2, 6
	call PlaceCardFaceDown
	call WaitBGMap
	ld hl, .CardFlipChooseACardText
	call CardFlip_UpdateCoinBalanceDisplay
	xor a
	ld [wCardFlipWhichCard], a
.loop
	call JoyTextDelay
	ldh a, [hJoyLast]
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

.CardFlipChooseACardText:
	text_far _CardFlipChooseACardText
	text_end

.PlaceYourBet:
	ld hl, .CardFlipPlaceYourBetText
	call CardFlip_UpdateCoinBalanceDisplay
.betloop
	call JoyTextDelay
	ldh a, [hJoyLast]
	and A_BUTTON
	jr nz, .betdone
	call ChooseCard_HandleJoypad
	call CardFlip_UpdateCursorOAM
	call DelayFrame
	jr .betloop

.betdone
	call .Increment
	ret

.CardFlipPlaceYourBetText:
	text_far _CardFlipPlaceYourBetText
	text_end

.CheckTheCard:
	xor a
	ldh [hVBlankCounter], a
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

.TabulateTheResult:
	call CardFlip_CheckWinCondition
	call WaitPressAorB_BlinkCursor
	call .Increment
	ret

.PlayAgain:
	call ClearSprites
	ld hl, .CardFlipPlayAgainText
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
	ldh [hBGMapMode], a
	call CardFlip_ShuffleDeck
	ld hl, .CardFlipShuffledText
	call PrintText
	jr .LoopAround

.KeepTheCurrentDeck:
	call CardFlip_BlankDiscardedCardSlot

.LoopAround:
	ld a, 1
	ld [wJumptableIndex], a
	ret

.CardFlipPlayAgainText:
	text_far _CardFlipPlayAgainText
	text_end

.CardFlipShuffledText:
	text_far _CardFlipShuffledText
	text_end

.Quit:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

CardFlip_ShuffleDeck:
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
	ld h, 0
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

CollapseCursorPosition:
	ld hl, 0
	ld bc, 6
	ld a, [wCardFlipCursorY]
	call AddNTimes
	ld b, $0
	ld a, [wCardFlipCursorX]
	ld c, a
	add hl, bc
	ret

GetCoordsOfChosenCard:
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

PlaceCardFaceDown:
	xor a
	ldh [hBGMapMode], a
	ld de, .FaceDownCardTilemap
	lb bc, 6, 5
	call CardFlip_CopyToBox
	ret

.FaceDownCardTilemap:
	db $08, $09, $09, $09, $0a
	db $0b, $28, $2b, $28, $0c
	db $0b, $2c, $2d, $2e, $0c
	db $0b, $2f, $30, $31, $0c
	db $0b, $32, $33, $34, $0c
	db $0d, $0e, $0e, $0e, $0f

CardFlip_DisplayCardFaceUp:
	xor a
	ldh [hBGMapMode], a
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
	ldh a, [hCGB]
	and a
	ret z

	; Set the attributes
	ld de, wAttrmap - wTilemap
	add hl, de
	ld a, [wCardFlipFaceUpCard]
	and 3
	inc a
	lb bc, 6, 5
	call CardFlip_FillBox
	ret

.FaceUpCardTilemap:
	db $18, $19, $19, $19, $1a
	db $1b, $35, $7f, $7f, $1c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $0b, $28, $28, $28, $0c
	db $1d, $1e, $1e, $1e, $1f

.Deck:
	; level, pic anchor (3x3)
	db "1", $4e, "1", $57, "1", $69, "1", $60
	db "2", $4e, "2", $57, "2", $69, "2", $60
	db "3", $4e, "3", $57, "3", $69, "3", $60
	db "4", $4e, "4", $57, "4", $69, "4", $60
	db "5", $4e, "5", $57, "5", $69, "5", $60
	db "6", $4e, "6", $57, "6", $69, "6", $60

CardFlip_UpdateCoinBalanceDisplay:
	push hl
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call Textbox
	pop hl
	call PrintTextboxText
	call CardFlip_PrintCoinBalance
	ret

CardFlip_PrintCoinBalance:
	hlcoord 9, 15
	ld b, 1
	ld c, 9
	call Textbox
	hlcoord 10, 16
	ld de, .CoinStr
	call PlaceString
	hlcoord 15, 16
	ld de, wCoins
	lb bc, PRINTNUM_LEADINGZEROS | 2, 4
	call PrintNum
	ret

.CoinStr:
	db "COIN@"

CardFlip_InitTilemap:
	xor a
	ldh [hBGMapMode], a
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
	call Textbox
	ret

CardFlip_FillGreenBox:
	ld a, $29

CardFlip_FillBox:
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

CardFlip_CopyToBox:
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

CardFlip_CopyOAM:
	ld de, wShadowOAMSprite00
	ld a, [hli]
.loop
	push af
	ld a, [hli]
	add b
	ld [de], a ; y
	inc de
	ld a, [hli]
	add c
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

CardFlip_ShiftDigitsUpOnePixel:
; The top rows of digits 1-9 become the bottom rows of 0-8,
; so this routine relies on the top rows being blank.
	ld de, vTiles0 tile "0"
	ld hl, vTiles0 tile "0" + 2
	ld bc, 10 tiles - 2
	call CopyBytes
	ld hl, vTiles0 tile "9" + 1 tiles - 2
	xor a
	ld [hli], a
	ld [hl], a
	ret

CardFlip_BlankDiscardedCardSlot:
	xor a
	ldh [hBGMapMode], a
	ld a, [wCardFlipFaceUpCard]
	ld e, a
	ld d, 0

	and 3 ; get mon
	ld c, a
	ld b, 0

	ld a, e
	and $1c ; get level
	srl a
	add LOW(.Jumptable)
	ld l, a
	ld a, 0
	adc HIGH(.Jumptable)
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
	dw .Level1
	dw .Level2
	dw .Level3
	dw .Level4
	dw .Level5
	dw .Level6

.Level1:
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

.Level2:
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

.Level3:
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

.Level4:
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

.Level5:
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

.Level6:
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

CardFlip_CheckWinCondition:
	call CollapseCursorPosition
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.Jumptable:
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

.Impossible:
	jp .Lose

.PikaJiggly:
	ld a, [wCardFlipFaceUpCard]
	and $2
	jp nz, .Lose
	jr .WinSix

.PoliOddish:
	ld a, [wCardFlipFaceUpCard]
	and $2
	jr nz, .WinSix
	jp .Lose

.WinSix:
	ld c, $6
	ld de, SFX_2ND_PLACE
	jp .Payout

.OneTwo:
	ld a, [wCardFlipFaceUpCard]
	and $18
	jr z, .WinNine
	jp .Lose

.ThreeFour:
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $8
	jr z, .WinNine
	jp .Lose

.FiveSix:
	ld a, [wCardFlipFaceUpCard]
	and $18
	cp $10
	jr z, .WinNine
	jp .Lose

.WinNine:
	ld c, $9
	ld de, SFX_2ND_PLACE
	jp .Payout

.Pikachu:
	ld a, [wCardFlipFaceUpCard]
	and $3
	jr z, .WinTwelve
	jp .Lose

.Jigglypuff:
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $1
	jr z, .WinTwelve
	jp .Lose

.Poliwag:
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $2
	jr z, .WinTwelve
	jp .Lose

.Oddish:
	ld a, [wCardFlipFaceUpCard]
	and $3
	cp $3
	jr z, .WinTwelve
	jp .Lose

.WinTwelve:
	ld c, $c
	ld de, SFX_2ND_PLACE
	jp .Payout

.One:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	jr z, .WinEighteen
	jp .Lose

.Two:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $4
	jr z, .WinEighteen
	jp .Lose

.Three:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $8
	jr z, .WinEighteen
	jp .Lose

.Four:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $c
	jr z, .WinEighteen
	jp .Lose

.Five:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $10
	jr z, .WinEighteen
	jp .Lose

.Six:
	ld a, [wCardFlipFaceUpCard]
	and $1c
	cp $14
	jr z, .WinEighteen
	jp .Lose

.WinEighteen:
	ld c, $12
	ld de, SFX_2ND_PLACE
	jp .Payout

.PikaOne:
	ld e, $0
	jr .CheckWin72

.JigglyOne:
	ld e, $1
	jr .CheckWin72

.PoliOne:
	ld e, $2
	jr .CheckWin72

.OddOne:
	ld e, $3
	jr .CheckWin72

.PikaTwo:
	ld e, $4
	jr .CheckWin72

.JigglyTwo:
	ld e, $5
	jr .CheckWin72

.PoliTwo:
	ld e, $6
	jr .CheckWin72

.OddTwo:
	ld e, $7
	jr .CheckWin72

.PikaThree:
	ld e, $8
	jr .CheckWin72

.JigglyThree:
	ld e, $9
	jr .CheckWin72

.PoliThree:
	ld e, $a
	jr .CheckWin72

.OddThree:
	ld e, $b
	jr .CheckWin72

.PikaFour:
	ld e, $c
	jr .CheckWin72

.JigglyFour:
	ld e, $d
	jr .CheckWin72

.PoliFour:
	ld e, $e
	jr .CheckWin72

.OddFour:
	ld e, $f
	jr .CheckWin72

.PikaFive:
	ld e, $10
	jr .CheckWin72

.JigglyFive:
	ld e, $11
	jr .CheckWin72

.PoliFive:
	ld e, $12
	jr .CheckWin72

.OddFive:
	ld e, $13
	jr .CheckWin72

.PikaSix:
	ld e, $14
	jr .CheckWin72

.JigglySix:
	ld e, $15
	jr .CheckWin72

.PoliSix:
	ld e, $16
	jr .CheckWin72

.OddSix:
	ld e, $17

.CheckWin72:
	ld a, [wCardFlipFaceUpCard]
	cp e
	jr nz, .Lose
	ld c, 72
	ld de, SFX_2ND_PLACE
	jr .Payout

.Lose:
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, .CardFlipDarnText
	call CardFlip_UpdateCoinBalanceDisplay
	call WaitSFX
	ret

.Payout:
	push bc
	push de
	ld hl, .CardFlipYeahText
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

.CardFlipYeahText:
	text_far _CardFlipYeahText
	text_end

.CardFlipDarnText:
	text_far _CardFlipDarnText
	text_end

.AddCoinPlaySFX:
	ld a, [wCoins]
	ld h, a
	ld a, [wCoins + 1]
	ld l, a
	inc hl
	ld a, h
	ld [wCoins], a
	ld a, l
	ld [wCoins + 1], a
	ld de, SFX_PAY_DAY
	call PlaySFX
	ret

.IsCoinCaseFull:
	ld a, [wCoins]
	cp HIGH(MAX_COINS)
	jr c, .less
	jr z, .check_low
	jr .more

.check_low
	ld a, [wCoins + 1]
	cp LOW(MAX_COINS)
	jr c, .less

.more
	scf
	ret

.less
	and a
	ret

PlaceOAMCardBorder:
	call GetCoordsOfChosenCard
	ld hl, .SpriteData
	call CardFlip_CopyOAM
	ret

.SpriteData:
	db 18
	dbsprite 0, 0, 0, 0, $04, 0
	dbsprite 1, 0, 0, 0, $06, 0
	dbsprite 2, 0, 0, 0, $06, 0
	dbsprite 3, 0, 0, 0, $06, 0
	dbsprite 4, 0, 0, 0, $04, 0 | X_FLIP

	dbsprite 0, 1, 0, 0, $05, 0
	dbsprite 4, 1, 0, 0, $05, 0 | X_FLIP

	dbsprite 0, 2, 0, 0, $05, 0
	dbsprite 4, 2, 0, 0, $05, 0 | X_FLIP

	dbsprite 0, 3, 0, 0, $05, 0
	dbsprite 4, 3, 0, 0, $05, 0 | X_FLIP

	dbsprite 0, 4, 0, 0, $05, $00
	dbsprite 4, 4, 0, 0, $05, 0 | X_FLIP

	dbsprite 0, 5, 0, 0, $04, 0 | Y_FLIP
	dbsprite 1, 5, 0, 0, $06, 0 | Y_FLIP
	dbsprite 2, 5, 0, 0, $06, 0 | Y_FLIP
	dbsprite 3, 5, 0, 0, $06, 0 | Y_FLIP
	dbsprite 4, 5, 0, 0, $04, 0 | X_FLIP | Y_FLIP

ChooseCard_HandleJoypad:
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

.d_left
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

.d_right
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

.d_up
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

.d_down
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

.play_sound
	ld de, SFX_POKEBALLS_PLACED_ON_TABLE
	call PlaySFX
	ret

CardFlip_UpdateCursorOAM:
	call ClearSprites
	ldh a, [hCGB]
	and a
	jr nz, .skip
	ldh a, [hVBlankCounter]
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

.OAMData:
MACRO cardflip_cursor
	if _NARG >= 5
		dbpixel \1, \2, \3, \4
		dw \5
	else
		dbpixel \1, \2
		dw \3
	endc
ENDM

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

.SingleTile:
	db 6
	dbsprite  -1,  0, 7, 0, $00, 0 | PRIORITY
	dbsprite   0,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   1,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  0, 7, 5, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   0,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   1,  0, 0, 5, $03, 0 | PRIORITY

.PokeGroup:
	db 26
	dbsprite  -1,  0, 7, 0, $00, 0 | PRIORITY
	dbsprite   0,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   1,  0, 0, 0, $00, 0 | X_FLIP | PRIORITY
	dbsprite  -1,  1, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  1, 0, 0, $01, 0 | X_FLIP | PRIORITY
	dbsprite  -1,  2, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  2, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  3, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  3, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  4, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  4, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  5, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  5, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  6, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  6, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  7, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  7, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  8, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  8, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  9, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  9, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1, 10, 7, 0, $01, 0 | PRIORITY
	dbsprite   1, 10, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1, 10, 7, 1, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   0, 10, 0, 1, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   1, 10, 0, 1, $03, 0 | PRIORITY

.NumGroup:
	db 20
	dbsprite  -1,  0, 7, 0, $00, 0 | PRIORITY
	dbsprite   0,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   1,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   2,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   4,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   5,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   6,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   7,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   8,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  0, 7, 5, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   0,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   1,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   2,  0, 0, 5, $03, 0 | PRIORITY
	dbsprite   3,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   4,  0, 0, 5, $03, 0 | PRIORITY
	dbsprite   5,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   6,  0, 0, 5, $03, 0 | PRIORITY
	dbsprite   7,  0, 0, 5, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   8,  0, 0, 5, $03, 0 | PRIORITY

.NumGroupPair:
	db 30
	dbsprite   0,  0, 0, 0, $00, 0 | PRIORITY
	dbsprite   1,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   2,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   3,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   4,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   5,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   6,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   7,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   8,  0, 0, 0, $02, 0 | PRIORITY
	dbsprite   9,  0, 0, 0, $03, 0 | PRIORITY
	dbsprite   0,  1, 0, 0, $01, 0 | PRIORITY
	dbsprite   3,  1, 0, 0, $03, 0 | PRIORITY
	dbsprite   5,  1, 0, 0, $03, 0 | PRIORITY
	dbsprite   7,  1, 0, 0, $03, 0 | PRIORITY
	dbsprite   9,  1, 0, 0, $03, 0 | PRIORITY
	dbsprite   0,  2, 0, 0, $01, 0 | PRIORITY
	dbsprite   3,  2, 0, 0, $03, 0 | PRIORITY
	dbsprite   5,  2, 0, 0, $03, 0 | PRIORITY
	dbsprite   7,  2, 0, 0, $03, 0 | PRIORITY
	dbsprite   9,  2, 0, 0, $03, 0 | PRIORITY
	dbsprite   0,  2, 0, 1, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   1,  2, 0, 1, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   2,  2, 0, 1, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   3,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   4,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   5,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   6,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   7,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   8,  2, 0, 1, $03, 0 | PRIORITY
	dbsprite   9,  2, 0, 1, $03, 0 | PRIORITY

.PokeGroupPair:
	db 38
	dbsprite  -1,  0, 7, 0, $00, 0 | PRIORITY
	dbsprite   3,  0, 0, 0, $00, 0 | X_FLIP | PRIORITY
	dbsprite  -1,  1, 7, 0, $01, 0 | PRIORITY
	dbsprite   3,  1, 0, 0, $01, 0 | X_FLIP | PRIORITY
	dbsprite  -1,  2, 7, 0, $01, 0 | PRIORITY
	dbsprite   3,  2, 0, 0, $01, 0 | X_FLIP | PRIORITY
	dbsprite  -1,  3, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  3, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  3, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  4, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  4, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  4, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  5, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  5, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  5, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  6, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  6, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  6, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  7, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  7, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  7, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  8, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  8, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  8, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1,  9, 7, 0, $01, 0 | PRIORITY
	dbsprite   1,  9, 0, 0, $03, 0 | PRIORITY
	dbsprite   3,  9, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1, 10, 7, 0, $01, 0 | PRIORITY
	dbsprite   1, 10, 0, 0, $03, 0 | PRIORITY
	dbsprite   3, 10, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1, 11, 7, 0, $01, 0 | PRIORITY
	dbsprite   1, 11, 0, 0, $03, 0 | PRIORITY
	dbsprite   3, 11, 0, 0, $03, 0 | PRIORITY
	dbsprite  -1, 11, 7, 1, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   0, 11, 0, 1, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   1, 11, 0, 1, $03, 0 | Y_FLIP | PRIORITY
	dbsprite   2, 11, 0, 1, $02, 0 | Y_FLIP | PRIORITY
	dbsprite   3, 11, 0, 1, $03, 0 | X_FLIP | Y_FLIP | PRIORITY

.Impossible:
	db 4
	dbsprite   0,  0, 0, 0, $00, 0 | PRIORITY
	dbsprite   1,  0, 0, 0, $00, 0 | X_FLIP | PRIORITY
	dbsprite   0,  1, 0, 0, $00, 0 | Y_FLIP | PRIORITY
	dbsprite   1,  1, 0, 0, $00, 0 | X_FLIP | Y_FLIP | PRIORITY

CardFlip_InitAttrPals:
	ldh a, [hCGB]
	and a
	ret z

	hlcoord 0, 0, wAttrmap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill

	hlcoord 12, 1, wAttrmap
	lb bc, 2, 2
	ld a, $1
	call CardFlip_FillBox

	hlcoord 14, 1, wAttrmap
	lb bc, 2, 2
	ld a, $2
	call CardFlip_FillBox

	hlcoord 16, 1, wAttrmap
	lb bc, 2, 2
	ld a, $3
	call CardFlip_FillBox

	hlcoord 18, 1, wAttrmap
	lb bc, 2, 2
	ld a, $4
	call CardFlip_FillBox

	hlcoord 9, 0, wAttrmap
	lb bc, 12, 1
	ld a, $1
	call CardFlip_FillBox

	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a
	ld hl, .palettes
	ld de, wBGPals1
	ld bc, 9 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

.palettes
INCLUDE "gfx/card_flip/card_flip.pal"

CardFlipLZ03:
INCBIN "gfx/card_flip/card_flip_3.2bpp.lz"

CardFlipOffButtonGFX:
INCBIN "gfx/card_flip/off.2bpp"

CardFlipOnButtonGFX:
INCBIN "gfx/card_flip/on.2bpp"

CardFlipLZ01:
INCBIN "gfx/card_flip/card_flip_1.2bpp.lz"

CardFlipLZ02:
INCBIN "gfx/card_flip/card_flip_2.2bpp.lz"

CardFlipTilemap:
INCBIN "gfx/card_flip/card_flip.tilemap"
