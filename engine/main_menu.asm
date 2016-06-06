GFX_49c0c: ; 49c0c
INCBIN "gfx/unknown/049c0c.2bpp"
; 49cdc

MainMenu: ; 49cdc
	xor a
	ld [wDisableTextAcceleration], a
	call Function49ed0
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call SetPalettes
	ld hl, GameTimerPause
	res 0, [hl]
	call MainMenu_GetWhichMenu
	ld [wWhichIndexSet], a
	call MainMenu_PrintCurrentTimeAndDay
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call MainMenuJoypadLoop
	call CloseWindow
	jr c, .quit
	call ClearTileMap
	ld a, [MenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	jr MainMenu

.quit
	ret
; 49d14

.MenuDataHeader: ; 49d14
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 16 ; end coords
	dw .MenuData2
	db 1 ; default option
; 49d1c

.MenuData2: ; 49d1c
	db $80 ; flags
	db 0 ; items
	dw MainMenuItems
	dw PlaceMenuStrings
	dw .Strings
; 49d20

.Strings: ; 49d24
	db "CONTINUE@"
	db "NEW GAME@"
	db "OPTION@"
	db "MYSTERY GIFT@"
	db "MOBILE@"
	db "MOBILE STUDIUM@"

.Jumptable: ; 0x49d60

	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Options
	dw MainMenu_MysteryGift
	dw MainMenu_Mobile
	dw MainMenu_MobileStudium
; 0x49d6c

CONTINUE       EQU 0
NEW_GAME       EQU 1
OPTION         EQU 2
MYSTERY_GIFT   EQU 3
MOBILE         EQU 4
MOBILE_STUDIUM EQU 5

MainMenuItems:

NewGameMenu: ; 0x49d6c
	db 2
	db NEW_GAME
	db OPTION
	db -1

ContinueMenu: ; 0x49d70
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db -1

MobileMysteryMenu: ; 0x49d75
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db -1

MobileMenu: ; 0x49d7c
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db -1

MobileStudiumMenu: ; 0x49d82
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db MOBILE_STUDIUM
	db -1

MysteryMobileStudiumMenu: ; 0x49d89
	db 6
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db MOBILE_STUDIUM
	db -1

MysteryMenu: ; 0x49d91
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db -1

MysteryStudiumMenu: ; 0x49d97
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE_STUDIUM
	db -1

StudiumMenu: ; 0x49d9e
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE_STUDIUM
	db -1


MainMenu_GetWhichMenu: ; 49da4
	nop
	nop
	nop
	ld a, [wSaveFileExists]
	and a
	jr nz, .next
	ld a, $0 ; New Game
	ret

.next
	ld a, [hCGB]
	cp $1
	ld a, $1
	ret nz
	ld a, BANK(sNumDailyMysteryGiftPartnerIDs)
	call GetSRAMBank
	ld a, [sNumDailyMysteryGiftPartnerIDs]
	cp -1
	call CloseSRAM
	jr nz, .mystery_gift
	ld a, [StatusFlags]
	bit 7, a
	ld a, $1 ; Continue
	jr z, .ok
	jr .ok

.ok
	jr .ok2

.ok2
	ld a, $1 ; Continue
	ret

.mystery_gift
	ld a, [StatusFlags]
	bit 7, a
	jr z, .ok3
	jr .ok3

.ok3
	jr .ok4

.ok4
	ld a, $6 ; Mystery Gift
	ret
; 49de4

MainMenuJoypadLoop: ; 49de4
	call SetUpMenu
.loop
	call MainMenu_PrintCurrentTimeAndDay
	ld a, [w2DMenuFlags1]
	set 5, a
	ld [w2DMenuFlags1], a
	call GetScrollingMenuJoypad
	ld a, [wMenuJoypad]
	cp B_BUTTON
	jr z, .b_button
	cp A_BUTTON
	jr z, .a_button
	jr .loop

.a_button
	call PlayClickSFX
	and a
	ret

.b_button
	scf
	ret
; 49e09

MainMenu_PrintCurrentTimeAndDay: ; 49e09
	ld a, [wSaveFileExists]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	call .PlaceBox
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call .PlaceTime
	pop af
	ld [Options], a
	ld a, $1
	ld [hBGMapMode], a
	ret
; 49e27


.PlaceBox: ; 49e27
	call CheckRTCStatus
	and $80
	jr nz, .TimeFail
	hlcoord 0, 14
	ld b, 2
	ld c, 18
	call TextBox
	ret

.TimeFail:
	call SpeechTextBox
	ret
; 49e3d


.PlaceTime: ; 49e3d
	ld a, [wSaveFileExists]
	and a
	ret z
	call CheckRTCStatus
	and $80
	jp nz, .PrintTimeNotSet
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 1, 15
	call .PlaceCurrentDay
	decoord 4, 16
	ld a, [hHours]
	ld c, a
	callba PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

.min
; unreferenced
	db "min.@"
; 49e75

.PrintTimeNotSet: ; 49e75
	hlcoord 1, 14
	ld de, .TimeNotSet
	call PlaceString
	ret
; 49e7f

.TimeNotSet: ; 49e7f
	db "TIME NOT SET@"
; 49e8c

.UnusedText: ; 49e8c
	; Clock time unknown
	text_jump UnknownText_0x1c5182
	db "@"
; 49e91

.PlaceCurrentDay: ; 49e91
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret
; 49ea8

.Days:
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
.Day:
	db "DAY@"
; 49ed0

Function49ed0: ; 49ed0
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret
; 49ee0


MainMenu_NewGame: ; 49ee0
	callba NewGame
	ret
; 49ee7

MainMenu_Options: ; 49ee7
	callba OptionsMenu
	ret
; 49eee

MainMenu_Continue: ; 49eee
	callba Continue
	ret
; 49ef5

MainMenu_MysteryGift: ; 49ef5
	callba MysteryGift
	ret
; 49efc
