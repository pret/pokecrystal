InitClock: ; 90672 (24:4672)
; Ask the player to set the time.
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a

	ld a, $0
	ld [wc2ce], a
	ld a, $10
	ld [MusicFade], a
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld c, 8
	call DelayFrames
	call Function4dd
	call ClearTileMap
	call ClearSprites
	ld b, SCGB_08
	call GetSGBLayout
	xor a
	ld [hBGMapMode], a
	call LoadStandardFont
	ld de, GFX_908fb
	ld hl, VTiles2 tile $00
	lb bc, BANK(GFX_908fb), 1
	call Request1bpp
	ld de, GFX_90903
	ld hl, VTiles2 tile $01
	lb bc, BANK(GFX_90903), 1
	call Request1bpp
	ld de, GFX_9090b
	ld hl, VTiles2 tile $02
	lb bc, BANK(GFX_9090b), 1
	call Request1bpp
	call .ClearScreen
	call WaitBGMap
	call Function4a3
	ld hl, UnknownText_0x90874
	call PrintText
	ld hl, wc608
	ld bc, 50
	xor a
	call ByteFill
	ld a, $a
	ld [wInitHourBuffer], a

.loop
	ld hl, UnknownText_0x90879
	call PrintText
	hlcoord 3, 7
	ld b, 2
	ld c, 15
	call TextBox
	hlcoord 11, 7
	ld [hl], $1
	hlcoord 11, 10
	ld [hl], $2
	hlcoord 4, 9
	call DisplayHourOClock
	ld c, 10
	call DelayFrames

.SetHourLoop
	call JoyTextDelay
	call SetHour
	jr nc, .SetHourLoop

	ld a, [wInitHourBuffer]
	ld [StringBuffer2 + 1], a
	call .ClearScreen
	ld hl, UnknownText_0x90886
	call PrintText
	call YesNoBox
	jr nc, .HourIsSet
	call .ClearScreen
	jr .loop

.HourIsSet
	ld hl, UnknownText_0x9089a
	call PrintText
	hlcoord 11, 7
	lb bc, 2, 7
	call TextBox
	hlcoord 15, 7
	ld [hl], $1
	hlcoord 15, 10
	ld [hl], $2
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	ld c, 10
	call DelayFrames

.SetMinutesLoop
	call JoyTextDelay
	call SetMinutes
	jr nc, .SetMinutesLoop

	ld a, [BattleMonNick + 5]
	ld [StringBuffer2 + 2], a
	call .ClearScreen
	ld hl, UnknownText_0x908a4
	call PrintText
	call YesNoBox
	jr nc, .MinutesAreSet
	call .ClearScreen
	jr .HourIsSet

.MinutesAreSet
	call Function658
	ld hl, OakText_ResponseToSetTime
	call PrintText
	call WaitPressAorB_BlinkCursor
	pop af
	ld [hInMenu], a
	ret

.ClearScreen: ; 90783 (24:4783)
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ld a, $1
	ld [hBGMapMode], a
	ret

SetHour: ; 90795 (24:4795)
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .Confirm

	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	call DelayFrame
	and a
	ret

.down
	ld hl, wInitHourBuffer
	ld a, [hl]
	and a
	jr nz, .DecreaseThroughMidnight
	ld a, 23 + 1
.DecreaseThroughMidnight
	dec a
	ld [hl], a
	jr .okay

.up
	ld hl, wInitHourBuffer
	ld a, [hl]
	cp 23
	jr c, .AdvanceThroughMidnight
	ld a, -1
.AdvanceThroughMidnight
	inc a
	ld [hl], a

.okay
	hlcoord 4, 9
	ld a, " "
	ld bc, 15
	call ByteFill
	hlcoord 4, 9
	call DisplayHourOClock
	call WaitBGMap
	and a
	ret

.Confirm
	scf
	ret

DisplayHourOClock: ; 907de (24:47de)
	push hl
	ld a, [wInitHourBuffer]
	ld c, a
	ld e, l
	ld d, h
	call PrintHour
	inc hl
	ld de, String_oclock
	call PlaceString
	pop hl
	ret
; 907f1 (24:47f1)

Function907f1: ; 907f1
	ld h, d
	ld l, e
	push hl
	call DisplayHourOClock
	pop de
rept 2
	inc de
endr
	ld a, $9c
	ld [de], a
	inc de
	push de
	ld hl, $3
	add hl, de
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	pop hl
	call DisplayMinutesWithMinString
rept 3
	inc hl
endr
	ret
; 90810

SetMinutes: ; 90810 (24:4810)
	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .asm_90857
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_90835
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_90828
	call DelayFrame
	and a
	ret
.asm_90828
	ld hl, BattleMonNick + 5
	ld a, [hl]
	and a
	jr nz, .asm_90831
	ld a, 59 + 1
.asm_90831
	dec a
	ld [hl], a
	jr .asm_90841
.asm_90835
	ld hl, BattleMonNick + 5
	ld a, [hl]
	cp 59
	jr c, .asm_9083f
	ld a, -1
.asm_9083f
	inc a
	ld [hl], a
.asm_90841
	hlcoord 12, 9
	ld a, " "
	ld bc, 7
	call ByteFill
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	call WaitBGMap
	and a
	ret
.asm_90857
	scf
	ret

DisplayMinutesWithMinString: ; 90859 (24:4859)
	ld de, BattleMonNick + 5
	call PrintTwoDigitNumberRightAlign
	inc hl
	ld de, String_min
	call PlaceString
	ret

PrintTwoDigitNumberRightAlign: ; 90867 (24:4867)
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	ret
; 90874 (24:4874)

UnknownText_0x90874: ; 0x90874
	; Zzz… Hm? Wha…? You woke me up! Will you check the clock for me?
	text_jump UnknownText_0x1bc29c
	db "@"
; 0x90879

UnknownText_0x90879: ; 0x90879
	; What time is it?
	text_jump UnknownText_0x1bc2eb
	db "@"
; 0x9087e

String_oclock:
	db "o'clock@"
; 90886

UnknownText_0x90886: ; 0x90886
	; What?@ @
	text_jump UnknownText_0x1bc2fd
	start_asm
	hlcoord 1, 16
	call DisplayHourOClock
	ld hl, UnknownText_0x90895
	ret
; 90895 (24:4895)

UnknownText_0x90895: ; 0x90895
	; ?
	text_jump UnknownText_0x1bc305
	db "@"
; 0x9089a

UnknownText_0x9089a: ; 0x9089a
	; How many minutes?
	text_jump UnknownText_0x1bc308
	db "@"
; 0x9089f

String_min:
	db "min.@"
; 908a4

UnknownText_0x908a4: ; 0x908a4
	; Whoa!@ @
	text_jump UnknownText_0x1bc31b
	start_asm
; 0x908a9
	hlcoord 7, 14
	call DisplayMinutesWithMinString
	ld hl, UnknownText_0x908b3
	ret
; 908b3 (24:48b3)

UnknownText_0x908b3: ; 0x908b3
	; ?
	text_jump UnknownText_0x1bc323
	db "@"
; 0x908b8

OakText_ResponseToSetTime: ; 0x908b8
	start_asm
	decoord 1, 14
	ld a, [wInitHourBuffer]
	ld c, a
	call PrintHour
	ld [hl], ":"
	inc hl
	ld de, BattleMonNick + 5
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld b, h
	ld c, l
	ld a, [wInitHourBuffer]
	cp 4
	jr c, .NITE
	cp 11
	jr c, .MORN
	cp 18
	jr c, .DAY
.NITE
	ld hl, .sodark
	ret
.MORN
	ld hl, .overslept
	ret
.DAY
	ld hl, .yikes
	ret
; 908ec (24:48ec)

.overslept: ; 0x908ec
	; ! I overslept!
	text_jump UnknownText_0x1bc326
	db "@"
; 0x908f1

.yikes: ; 0x908f1
	; ! Yikes! I over- slept!
	text_jump UnknownText_0x1bc336
	db "@"
; 0x908f6

.sodark: ; 0x908f6
	; ! No wonder it's so dark!
	text_jump UnknownText_0x1bc34f
	db "@"
; 0x908fb

GFX_908fb: ; 908fb
INCBIN "gfx/unknown/0908fb.2bpp"
GFX_90903: ; 90903
INCBIN "gfx/unknown/090903.2bpp"
GFX_9090b: ; 9090b
INCBIN "gfx/unknown/09090b.2bpp"
; 90913

Special_SetDayOfWeek: ; 90913
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld de, GFX_90903
	ld hl, VTiles1 tile $6f
	lb bc, BANK(GFX_90903), 1
	call Request1bpp
	ld de, GFX_9090b
	ld hl, VTiles1 tile $75
	lb bc, BANK(GFX_9090b), 1
	call Request1bpp
	xor a
	ld [wd002], a
.asm_90936
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	call LoadStandardMenuDataHeader
	ld hl, UnknownText_0x90a3f
	call PrintText
	hlcoord 9, 3
	ld b, 2
	ld c, 9
	call TextBox
	hlcoord 14, 3
	ld [hl], $ef
	hlcoord 14, 6
	ld [hl], $f5
	hlcoord 10, 5
	call Function909de
	call Function321c
	ld c, 10
	call DelayFrames
.asm_9096a
	call JoyTextDelay
	call Function90993
	jr nc, .asm_9096a
	call ExitMenu
	call UpdateSprites
	ld hl, UnknownText_0x90a44
	call PrintText
	call YesNoBox
	jr c, .asm_90936
	ld a, [wd002]
	ld [StringBuffer2], a
	call Function663
	call LoadStandardFont
	pop af
	ld [hInMenu], a
	ret
; 90993

Function90993: ; 90993
	ld a, [hJoyPressed]
	and A_BUTTON
	jr z, .asm_9099b
	scf
	ret

.asm_9099b
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_909ba
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_909ad
	call DelayFrame
	and a
	ret

.asm_909ad
	ld hl, wd002
	ld a, [hl]
	and a
	jr nz, .asm_909b6
	ld a, 6 + 1

.asm_909b6
	dec a
	ld [hl], a
	jr .asm_909c6

.asm_909ba
	ld hl, wd002
	ld a, [hl]
	cp 6
	jr c, .asm_909c4
	ld a, -1

.asm_909c4
	inc a
	ld [hl], a

.asm_909c6
	xor a
	ld [hBGMapMode], a
	hlcoord 10, 4
	ld b, $2
	ld c, $9
	call ClearBox
	hlcoord 10, 5
	call Function909de
	call WaitBGMap
	and a
	ret
; 909de

Function909de: ; 909de
	push hl
	ld a, [wd002]
	ld e, a
	ld d, 0
	ld hl, WeekdaysStrings
rept 2
	add hl, de
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret
; 909f2

WeekdaysStrings: ; 909f2
	dw Sunday
	dw Monday
	dw Tuesday
	dw Wednesday
	dw Thursday
	dw Friday
	dw Saturday
	dw Sunday

Sunday:    db " SUNDAY@"
Monday:    db " MONDAY@"
Tuesday:   db " TUESDAY@"
Wednesday: db "WEDNESDAY@"
Thursday:  db "THURSDAY@"
Friday:    db " FRIDAY@"
Saturday:  db "SATURDAY@"


UnknownText_0x90a3f: ; 0x90a3f
	; What day is it?
	text_jump UnknownText_0x1bc369
	db "@"
; 0x90a44

UnknownText_0x90a44: ; 0x90a44
	start_asm
	hlcoord 1, 14
	call Function909de
	ld hl, UnknownText_0x90a4f
	ret
; 90a4f (24:4a4f)

UnknownText_0x90a4f: ; 0x90a4f
	; , is it?
	text_jump UnknownText_0x1bc37a
	db "@"
; 0x90a54

Special_InitialSetDSTFlag: ; 90a54
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, UnknownText_0x90a6c
	call PlaceWholeStringInBoxAtOnce
	ret
; 90a6c

UnknownText_0x90a6c: ; 90a6c
	start_asm
	call UpdateTime
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 1, 14
	callba PrintHoursMins
	ld hl, TextJump_DSTIsThatOK
	ret
; 90a83 (24:4a83)

TextJump_DSTIsThatOK: ; 0x90a83
	; DST, is that OK?
	text_jump Text_DSTIsThatOK
	db "@"
; 0x90a88

Special_InitialClearDSTFlag: ; 90a88
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, UnknownText_0x90aa0
	call PlaceWholeStringInBoxAtOnce
	ret
; 90aa0

UnknownText_0x90aa0: ; 90aa0
	start_asm
	call UpdateTime
	ld a, [hHours]
	ld b, a
	ld a, [hMinutes]
	ld c, a
	decoord 1, 14
	callba PrintHoursMins
	ld hl, UnknownText_0x90ab7
	ret
; 90ab7

UnknownText_0x90ab7: ; 0x90ab7
	; , is that OK?
	text_jump UnknownText_0x1c5ff1
	db "@"
; 0x90abc

Function90abc: ; 90abc
	hlcoord 1, 14
	lb bc, 3, SCREEN_WIDTH - 2
	call ClearBox
	ld hl, UnknownText_0x90acc
	call PlaceWholeStringInBoxAtOnce
	ret
; 90acc

UnknownText_0x90acc: ; 0x90acc
	start_asm

	call UpdateTime

	hlcoord 1, 14
	ld [hl], "R"
	inc hl
	ld [hl], "T"
	inc hl
	ld [hl], " "
	inc hl

	ld de, hRTCDayLo
	call Function90b23

	hlcoord 1, 16
	ld [hl], "D"
	inc hl
	ld [hl], "F"
	inc hl
	ld [hl], " "
	inc hl

	ld de, StartDay
	call Function90b23

	ld [hl], " "
	inc hl

	ld a, [wDST]
	bit 7, a
	jr z, .off

	ld [hl], "O"
	inc hl
	ld [hl], "N"
	inc hl
	jr .done

.off
	ld [hl], "O"
	inc hl
	ld [hl], "F"
	inc hl
	ld [hl], "F"
	inc hl

.done
	ld hl, UnknownText_0x90b13
	ret
; 90b13

UnknownText_0x90b13: ; 0x90b13
	text "<PARA>Now on DEBUG…"
	prompt
; 0x90b23

Function90b23: ; 90b23
	lb bc, 1, 3
	call PrintNum
	ld [hl], "."
	inc hl
	inc de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	inc de
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 90b3e

PrintHour: ; 90b3e (24:4b3e)
	ld l, e
	ld h, d
	push bc
	call GetTimeOfDayString
	call PlaceString
	ld l, c
	ld h, b
	inc hl
	pop bc
	call AdjustHourForAMorPM
	ld [wd265], a
	ld de, wd265
	call PrintTwoDigitNumberRightAlign
	ret

GetTimeOfDayString: ; 90b58 (24:4b58)
	ld a, c
	cp 4
	jr c, .nite
	cp 10
	jr c, .morn
	cp 18
	jr c, .day
.nite
	ld de, .NITE
	ret
.morn
	ld de, .MORN
	ret
.day
	ld de, .DAY
	ret
; 90b71 (24:4b71)

.NITE: db "NITE@"
.MORN: db "MORN@"
.DAY: db "DAY@"
; 90b7f

AdjustHourForAMorPM:
; Convert the hour stored in c (0-23) to a 1-12 value
	ld a, c
	or a
	jr z, .midnight
	cp 12
	ret c
	ret z
	sub 12
	ret

.midnight
	ld a, 12
	ret
