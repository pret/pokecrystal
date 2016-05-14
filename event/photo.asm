UnownPrinter: ; 16be4
	ld a, [UnownDex]
	and a
	ret z

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [Options]
	push af
	set NO_TEXT_SCROLL, a
	ld [Options], a
	call ClearBGPalettes
	call ClearTileMap

	ld de, UnownDexATile
	ld hl, VTiles1 tile $6f
	lb bc, BANK(UnownDexBTile), 1
	call Request1bpp

	ld de, UnownDexBTile
	ld hl, VTiles1 tile $75
	lb bc, BANK(UnownDexBTile), 1
	call Request1bpp

	hlcoord 0, 0
	lb bc, 3, 18
	call TextBox

	hlcoord 0, 5
	lb bc, 7, 7
	call TextBox

	hlcoord 0, 14
	lb bc, 2, 18
	call TextBox

	hlcoord 1, 2
	ld de, AlphRuinsStampString
	call PlaceString

	hlcoord 1, 16
	ld de, UnownDexDoWhatString
	call PlaceString

	hlcoord 10, 6
	ld de, UnownDexMenuString
	call PlaceString

	xor a
	ld [wJumptableIndex], a
	call .UpdateUnownFrontpic
	call WaitBGMap

	ld a, UNOWN
	ld [CurPartySpecies], a
	xor a
	ld [TempMonDVs], a
	ld [TempMonDVs + 1], a

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call SetPalettes

.joy_loop
	call JoyTextDelay

	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, .pressed_b

	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .pressed_a

	call .LeftRight
	call DelayFrame
	jr .joy_loop

.pressed_a
	ld a, [wJumptableIndex]
	push af
	callba PrintUnownStamp
	call RestartMapMusic
	pop af
	ld [wJumptableIndex], a
	jr .joy_loop

.pressed_b
	pop af
	ld [Options], a
	pop af
	ld [hInMenu], a
	call ReturnToMapFromSubmenu
	ret
; 16ca0

.LeftRight: ; 16ca0
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .press_right
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .press_left
	ret

.press_left
	ld hl, wJumptableIndex
	ld a, [hl]
	and a
	jr nz, .wrap_around_left
	ld [hl], 26 + 1
.wrap_around_left
	dec [hl]
	jr .return

.press_right
	ld hl, wJumptableIndex
	ld a, [hl]
	cp 26
	jr c, .wrap_around_right
	ld [hl], -1
.wrap_around_right
	inc [hl]

.return
	call .UpdateUnownFrontpic
	ret
; 16cc8

.UpdateUnownFrontpic: ; 16cc8
	ld a, [wJumptableIndex]
	cp 26
	jr z, .vacant
	inc a
	ld [UnownLetter], a
	ld a, UNOWN
	ld [CurPartySpecies], a
	xor a
	ld [wBoxAlignment], a
	ld de, VTiles2
	predef GetFrontpic
	call .Load2bppToSRAM
	hlcoord 1, 6
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	ld de, VTiles2 tile $31
	callba RotateUnownFrontpic
	ret

.Load2bppToSRAM: ; 16cff
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, BANK(sScratch)
	call GetSRAMBank
	ld de, wDecompressScratch
	ld hl, sScratch
	ld a, [hROMBank]
	ld b, a
	ld c, $31
	call Get2bpp
	call CloseSRAM

	pop af
	ld [rSVBK], a
	ret

.vacant
	hlcoord 1, 6
	lb bc, 7, 7
	call ClearBox
	hlcoord 1, 9
	ld de, UnownDexVacantString
	call PlaceString
	xor a
	call GetSRAMBank
	ld hl, sScratch
	ld bc, $31 tiles
	xor a
	call ByteFill
	ld hl, VTiles2 tile $31
	ld de, sScratch
	ld c, $31
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ld c, 20
	call DelayFrames
	ret
; 16d57

AlphRuinsStampString:
	db " ALPH RUINS STAMP@"

UnownDexDoWhatString:
	db "Do what?@"

UnownDexMenuString:
	db   "♂ PRINT"
	next "♀ CANCEL"
	next "← PREVIOUS"
	next "→ NEXT"
	db   "@"

UnownDexVacantString:
	db "VACANT@"
; 16d9c

UnownDexATile: ; 16d9c
INCBIN "gfx/unknown/016d9c.1bpp"
UnownDexBTile: ; 16da4
INCBIN "gfx/unknown/016da4.1bpp"
; 16dac

PlaceUnownPrinterFrontpic: ; 16dac
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 7, 11
	ld a, $31
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	ret
; 16dc7

PhotoStudio: ; 16dc7
	ld hl, .Text_AskWhichMon
	call PrintText
	callba SelectMonFromParty
	jr c, .cancel
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, .Text_HoldStill
	call PrintText
	call DisableSpriteUpdates
	callba PrintPartymon
	call ReturnToMapWithSpeechTextbox
	ld a, [hPrinter]
	and a
	jr nz, .cancel
	ld hl, .Text_Presto
	jr .print_text

.cancel
	ld hl, .Text_NoPicture
	jr .print_text

.egg
	ld hl, .Text_Egg

.print_text
	call PrintText
	ret
; 16e04

.Text_AskWhichMon: ; 0x16e04
	; Which #MON should I photo- graph?
	text_jump UnknownText_0x1be024
	db "@"
; 0x16e09

.Text_HoldStill: ; 0x16e09
	; All righty. Hold still for a bit.
	text_jump UnknownText_0x1be047
	db "@"
; 0x16e0e

.Text_Presto: ; 0x16e0e
	; Presto! All done. Come again, OK?
	text_jump UnknownText_0x1be06a
	db "@"
; 0x16e13

.Text_NoPicture: ; 0x16e13
	; Oh, no picture? Come again, OK?
	text_jump UnknownText_0x1c0000
	db "@"
; 0x16e18

.Text_Egg: ; 0x16e18
	; An EGG? My talent is worth more…
	text_jump UnknownText_0x1c0021
	db "@"
; 0x16e1d
