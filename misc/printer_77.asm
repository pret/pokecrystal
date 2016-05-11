PrintPage1: ; 1dc1b0
	hlcoord 0, 0
	decoord 0, 0, wPrinterTileMapBuffer
	ld bc, 17 * SCREEN_WIDTH
	call CopyBytes
	hlcoord 17, 1, wPrinterTileMapBuffer
	ld a, $62
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 17, 2, wPrinterTileMapBuffer
	ld a, $64
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 1, 9, wPrinterTileMapBuffer
	ld a, " "
	ld [hli], a
	ld [hl], a
	hlcoord 1, 10, wPrinterTileMapBuffer
	ld a, $61
	ld [hli], a
	ld [hl], a
	hlcoord 2, 11, wPrinterTileMapBuffer
	lb bc, 5, 18
	call ClearBox
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wd265]
	ld b, a
	ld c, 1 ; get page 1
	callba GetDexEntryPagePointer
	pop af
	ld a, b
	hlcoord 1, 11, wPrinterTileMapBuffer
	call nz, FarString
	hlcoord 19, 0, wPrinterTileMapBuffer
	ld [hl], $35
	ld de, SCREEN_WIDTH
	add hl, de
	ld b, $f
.column_loop
	ld [hl], $37
	add hl, de
	dec b
	jr nz, .column_loop
	ld [hl], $3a
	ret
; 1dc213

PrintPage2: ; 1dc213
	hlcoord 0, 0, wPrinterTileMapBuffer
	ld bc, 8 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0, 0, wPrinterTileMapBuffer
	ld a, $36
	ld b, 6
	call .FillColumn
	hlcoord 19, 0, wPrinterTileMapBuffer
	ld a, $37
	ld b, 6
	call .FillColumn
	hlcoord 0, 6, wPrinterTileMapBuffer
	ld [hl], $38
	inc hl
	ld a, $39
	ld bc, SCREEN_HEIGHT
	call ByteFill
	ld [hl], $3a
	hlcoord 0, 7, wPrinterTileMapBuffer
	ld bc, SCREEN_WIDTH
	ld a, $32
	call ByteFill
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wd265]
	ld b, a
	ld c, 2 ; get page 2
	callba GetDexEntryPagePointer
	pop af
	hlcoord 1, 1, wPrinterTileMapBuffer
	ld a, b
	call nz, FarString
	ret
; 1dc26a

.FillColumn: ; 1dc26a
	push de
	ld de, SCREEN_WIDTH
.column_loop
	ld [hl], a
	add hl, de
	dec b
	jr nz, .column_loop
	pop de
	ret
; 1dc275

GBPrinterStrings:
GBPrinterString_Null: db "@"
GBPrinterString_CheckingLink: next " CHECKING LINK...@"
GBPrinterString_Transmitting: next "  TRANSMITTING...@"
GBPrinterString_Printing: next "    PRINTING...@"
GBPrinterString_PrinterError1:
	db   " Printer Error 1"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
GBPrinterString_PrinterError2:
	db   " Printer Error 2"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
GBPrinterString_PrinterError3:
	db   " Printer Error 3"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
GBPrinterString_PrinterError4:
	db   " Printer Error 4"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
; 1dc381

PrintPartyMonPage1: ; 1dc381
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call LoadFontsBattleExtra

	ld de, MobileHPIcon
	ld hl, VTiles2 tile $71
	lb bc, BANK(MobileHPIcon), 1
	call Request1bpp

	ld de, MobileLvIcon
	ld hl, VTiles2 tile $6e
	lb bc, BANK(MobileLvIcon), 1
	call Request1bpp

	ld de, ShinyIcon
	ld hl, VTiles2 tile $3f
	lb bc, BANK(ShinyIcon), 1
	call Get2bpp

	xor a
	ld [MonType], a
	callba CopyPkmnToTempMon
	hlcoord 0, 7
	ld b, 9
	ld c, 18
	call TextBox
	hlcoord 8, 2
	ld a, [TempMonLevel]
	call PrintLevel_Force3Digits
	hlcoord 12, 2
	ld [hl], "◀" ; Filled left triangle
	inc hl
	ld de, TempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [CurSpecies], a
	ld hl, PartyMonNicknames
	call Function1dc50e
	hlcoord 8, 4
	call PlaceString
	hlcoord 9, 6
	ld [hl], "/"
	call GetPokemonName
	hlcoord 10, 6
	call PlaceString
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 9
	ld de, String1dc550
	call PlaceString
	ld hl, PartyMonOT
	call Function1dc50e
	hlcoord 4, 9
	call PlaceString
	hlcoord 1, 11
	ld de, String1dc559
	call PlaceString
	hlcoord 4, 11
	ld de, TempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 14
	ld de, String1dc554
	call PlaceString
	hlcoord 7, 14
	ld a, [TempMonMoves + 0]
	call Function1dc51a
	call Function1dc52c
	ld hl, TempMonDVs
	predef GetUnownLetter
	ld hl, wBoxAlignment
	xor a
	ld [hl], a
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_1dc469
	inc [hl]

.asm_1dc469
	hlcoord 0, 0
	call _PrepMonFrontpic
	call WaitBGMap
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call SetPalettes
	ret
; 1dc47b

PrintPartyMonPage2: ; 1dc47b
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call LoadFontsBattleExtra
	xor a
	ld [MonType], a
	callba CopyPkmnToTempMon
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBox
	ld bc, SCREEN_WIDTH
	decoord 0, 0
	hlcoord 0, 1
	call CopyBytes
	hlcoord 7, 0
	ld a, [TempMonMoves + 1]
	call Function1dc51a
	hlcoord 7, 2
	ld a, [TempMonMoves + 2]
	call Function1dc51a
	hlcoord 7, 4
	ld a, [TempMonMoves + 3]
	call Function1dc51a
	hlcoord 7, 7
	ld de, String1dc55d
	call PlaceString
	hlcoord 16, 7
	ld de, TempMonAttack
	call .PrintTempMonStats
	hlcoord 16, 9
	ld de, TempMonDefense
	call .PrintTempMonStats
	hlcoord 16, 11
	ld de, TempMonSpclAtk
	call .PrintTempMonStats
	hlcoord 16, 13
	ld de, TempMonSpclDef
	call .PrintTempMonStats
	hlcoord 16, 15
	ld de, TempMonSpeed
	call .PrintTempMonStats
	call WaitBGMap
	ld b, SCGB_STATS_SCREEN_HP_PALS
	call GetSGBLayout
	call SetPalettes
	ret
; 1dc507

.PrintTempMonStats: ; 1dc507
	lb bc, 2, 3
	call PrintNum
	ret
; 1dc50e

Function1dc50e: ; 1dc50e
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ret
; 1dc51a

Function1dc51a: ; 1dc51a
	and a
	jr z, .no_move

	ld [wd265], a
	call GetMoveName
	jr .got_string

.no_move
	ld de, String1dc584

.got_string
	call PlaceString
	ret
; 1dc52c

Function1dc52c: ; 1dc52c
	callba GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 17, 2
	ld [hl], a
	ld bc, TempMonDVs
	callba CheckShininess
	ret nc
	hlcoord 18, 2
	ld [hl], "<SHINY>"
	ret
; 1dc550

String1dc550: ; 1dc550
	db "OT/@"

String1dc554: ; 1dc554
	db "MOVE@"

String1dc559: ; 1dc559
	db "<ID>№.@"

String1dc55d: ; 1dc55d
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	db   "@"

String1dc584: ; 1dc584
	db "------------@"
; 1dc591
