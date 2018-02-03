UnownPrinter: ; 16be4
	ld a, [wUnownDex]
	and a
	ret z

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [wOptions]
	push af
	set NO_TEXT_SCROLL, a
	ld [wOptions], a
	call ClearBGPalettes
	call ClearTileMap

	ld de, UnownDexATile
	ld hl, vTiles1 tile $6f
	lb bc, BANK(UnownDexBTile), 1
	call Request1bpp

	ld de, UnownDexBTile
	ld hl, vTiles1 tile $75
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
	ld [wCurPartySpecies], a
	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a

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
	farcall PrintUnownStamp
	call RestartMapMusic
	pop af
	ld [wJumptableIndex], a
	jr .joy_loop

.pressed_b
	pop af
	ld [wOptions], a
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
	ld [wUnownLetter], a
	ld a, UNOWN
	ld [wCurPartySpecies], a
	xor a
	ld [wBoxAlignment], a
	ld de, vTiles2
	predef GetMonFrontpic
	call .Load2bppToSRAM
	hlcoord 1, 6
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	ld de, vTiles2 tile $31
	farcall RotateUnownFrontpic
	ret

.Load2bppToSRAM: ; 16cff
	ld a, [rSVBK]
	push af
	ld a, BANK(wDecompressScratch)
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
	xor a ; sScratch
	call GetSRAMBank
	ld hl, sScratch
	ld bc, $31 tiles
	xor a
	call ByteFill
	ld hl, vTiles2 tile $31
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
INCBIN "gfx/printer/bold_a.1bpp"
UnownDexBTile: ; 16da4
INCBIN "gfx/printer/bold_b.1bpp"
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
