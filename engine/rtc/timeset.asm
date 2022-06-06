DEF TIMESET_UP_ARROW   EQU "♂" ; $ef
DEF TIMESET_DOWN_ARROW EQU "♀" ; $f5

InitClock:
; Ask the player to set the time.
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a

	ld a, $0
	ld [wSpriteUpdatesEnabled], a
	ld a, $10
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 8
	call DelayFrames
	call RotateFourPalettesLeft
	call ClearTilemap
	call ClearSprites
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	xor a
	ldh [hBGMapMode], a
	call LoadStandardFont
	ld de, TimeSetBackgroundGFX
	ld hl, vTiles2 tile $00
	lb bc, BANK(TimeSetBackgroundGFX), 1
	call Request1bpp
	ld de, TimeSetUpArrowGFX
	ld hl, vTiles2 tile $01
	lb bc, BANK(TimeSetUpArrowGFX), 1
	call Request1bpp
	ld de, TimeSetDownArrowGFX
	ld hl, vTiles2 tile $02
	lb bc, BANK(TimeSetDownArrowGFX), 1
	call Request1bpp
	call .ClearScreen
	call WaitBGMap
	call RotateFourPalettesRight
	ld hl, OakTimeWokeUpText
	call PrintText
	ld hl, wTimeSetBuffer
	ld bc, wTimeSetBufferEnd - wTimeSetBuffer
	xor a
	call ByteFill
	ld a, 10 ; default hour = 10 AM
	ld [wInitHourBuffer], a

.loop
	ld hl, OakTimeWhatTimeIsItText
	call PrintText
	hlcoord 3, 7
	ld b, 2
	ld c, 15
	call Textbox
	hlcoord 11, 7
	ld [hl], $1
	hlcoord 11, 10
	ld [hl], $2
	hlcoord 4, 9
	call DisplayHourOClock
	ld c, 10
	call DelayFrames

.SetHourLoop:
	call JoyTextDelay
	call SetHour
	jr nc, .SetHourLoop

	ld a, [wInitHourBuffer]
	ld [wStringBuffer2 + 1], a
	call .ClearScreen
	ld hl, OakTimeWhatHoursText
	call PrintText
	call YesNoBox
	jr nc, .HourIsSet
	call .ClearScreen
	jr .loop

.HourIsSet:
	ld hl, OakTimeHowManyMinutesText
	call PrintText
	hlcoord 11, 7
	lb bc, 2, 7
	call Textbox
	hlcoord 15, 7
	ld [hl], $1
	hlcoord 15, 10
	ld [hl], $2
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	ld c, 10
	call DelayFrames

.SetMinutesLoop:
	call JoyTextDelay
	call SetMinutes
	jr nc, .SetMinutesLoop

	ld a, [wInitMinuteBuffer]
	ld [wStringBuffer2 + 2], a
	call .ClearScreen
	ld hl, OakTimeWhoaMinutesText
	call PrintText
	call YesNoBox
	jr nc, .MinutesAreSet
	call .ClearScreen
	jr .HourIsSet

.MinutesAreSet:
	call InitTimeOfDay
	ld hl, OakText_ResponseToSetTime
	call PrintText
	call WaitPressAorB_BlinkCursor
	pop af
	ldh [hInMenu], a
	ret

.ClearScreen:
	xor a
	ldh [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ld a, $1
	ldh [hBGMapMode], a
	ret

SetHour:
	ldh a, [hJoyPressed]
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
.DecreaseThroughMidnight:
	dec a
	ld [hl], a
	jr .okay

.up
	ld hl, wInitHourBuffer
	ld a, [hl]
	cp 23
	jr c, .AdvanceThroughMidnight
	ld a, -1
.AdvanceThroughMidnight:
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

.Confirm:
	scf
	ret

DisplayHourOClock:
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

DisplayHoursMinutesWithMinString: ; unreferenced
	ld h, d
	ld l, e
	push hl
	call DisplayHourOClock
	pop de
	inc de
	inc de
	ld a, ":"
	ld [de], a
	inc de
	push de
	ld hl, 3
	add hl, de
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	pop hl
	call DisplayMinutesWithMinString
	inc hl
	inc hl
	inc hl
	ret

SetMinutes:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr nz, .a_button
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	call DelayFrame
	and a
	ret

.d_down
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, 59 + 1
.decrease
	dec a
	ld [hl], a
	jr .finish_dpad

.d_up
	ld hl, wInitMinuteBuffer
	ld a, [hl]
	cp 59
	jr c, .increase
	ld a, -1
.increase
	inc a
	ld [hl], a
.finish_dpad
	hlcoord 12, 9
	ld a, " "
	ld bc, 7
	call ByteFill
	hlcoord 12, 9
	call DisplayMinutesWithMinString
	call WaitBGMap
	and a
	ret
.a_button
	scf
	ret

DisplayMinutesWithMinString:
	ld de, wInitMinuteBuffer
	call PrintTwoDigitNumberLeftAlign
	inc hl
	ld de, String_min
	call PlaceString
	ret

PrintTwoDigitNumberLeftAlign:
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	lb bc, PRINTNUM_LEFTALIGN | 1, 2
	call PrintNum
	ret

OakTimeWokeUpText:
	text_far _OakTimeWokeUpText
	text_end

OakTimeWhatTimeIsItText:
	text_far _OakTimeWhatTimeIsItText
	text_end

String_oclock:
	db "o'clock@"

OakTimeWhatHoursText:
	; What?@ @
	text_far _OakTimeWhatHoursText
	text_asm
	hlcoord 1, 16
	call DisplayHourOClock
	ld hl, .OakTimeHoursQuestionMarkText
	ret

.OakTimeHoursQuestionMarkText:
	text_far _OakTimeHoursQuestionMarkText
	text_end

OakTimeHowManyMinutesText:
	text_far _OakTimeHowManyMinutesText
	text_end

String_min:
	db "min.@"

OakTimeWhoaMinutesText:
	; Whoa!@ @
	text_far _OakTimeWhoaMinutesText
	text_asm
	hlcoord 7, 14
	call DisplayMinutesWithMinString
	ld hl, .OakTimeMinutesQuestionMarkText
	ret

.OakTimeMinutesQuestionMarkText:
	text_far _OakTimeMinutesQuestionMarkText
	text_end

OakText_ResponseToSetTime:
	text_asm
	decoord 1, 14
	ld a, [wInitHourBuffer]
	ld c, a
	call PrintHour
	ld [hl], ":"
	inc hl
	ld de, wInitMinuteBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld b, h
	ld c, l
	ld a, [wInitHourBuffer]
	cp MORN_HOUR
	jr c, .nite
	cp DAY_HOUR + 1
	jr c, .morn
	cp NITE_HOUR
	jr c, .day
.nite
	ld hl, .OakTimeSoDarkText
	ret
.morn
	ld hl, .OakTimeOversleptText
	ret
.day
	ld hl, .OakTimeYikesText
	ret

.OakTimeOversleptText:
	text_far _OakTimeOversleptText
	text_end

.OakTimeYikesText:
	text_far _OakTimeYikesText
	text_end

.OakTimeSoDarkText:
	text_far _OakTimeSoDarkText
	text_end

TimeSetBackgroundGFX:
INCBIN "gfx/new_game/timeset_bg.1bpp"
TimeSetUpArrowGFX:
INCBIN "gfx/new_game/up_arrow.1bpp"
TimeSetDownArrowGFX:
INCBIN "gfx/new_game/down_arrow.1bpp"

SetDayOfWeek:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	ld de, TimeSetUpArrowGFX
	ld hl, vTiles0 tile TIMESET_UP_ARROW
	lb bc, BANK(TimeSetUpArrowGFX), 1
	call Request1bpp
	ld de, TimeSetDownArrowGFX
	ld hl, vTiles0 tile TIMESET_DOWN_ARROW
	lb bc, BANK(TimeSetDownArrowGFX), 1
	call Request1bpp
	xor a
	ld [wTempDayOfWeek], a
.loop
	hlcoord 0, 12
	lb bc, 4, 18
	call Textbox
	call LoadStandardMenuHeader
	ld hl, .OakTimeWhatDayIsItText
	call PrintText
	hlcoord 9, 3
	ld b, 2
	ld c, 9
	call Textbox
	hlcoord 14, 3
	ld [hl], TIMESET_UP_ARROW
	hlcoord 14, 6
	ld [hl], TIMESET_DOWN_ARROW
	hlcoord 10, 5
	call .PlaceWeekdayString
	call ApplyTilemap
	ld c, 10
	call DelayFrames
.loop2
	call JoyTextDelay
	call .GetJoypadAction
	jr nc, .loop2
	call ExitMenu
	call UpdateSprites
	ld hl, .ConfirmWeekdayText
	call PrintText
	call YesNoBox
	jr c, .loop
	ld a, [wTempDayOfWeek]
	ld [wStringBuffer2], a
	call InitDayOfWeek
	call LoadStandardFont
	pop af
	ldh [hInMenu], a
	ret

.GetJoypadAction:
	ldh a, [hJoyPressed]
	and A_BUTTON
	jr z, .not_A
	scf
	ret

.not_A
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .d_up
	ld a, [hl]
	and D_DOWN
	jr nz, .d_down
	call DelayFrame
	and a
	ret

.d_down
	ld hl, wTempDayOfWeek
	ld a, [hl]
	and a
	jr nz, .decrease
	ld a, SATURDAY + 1

.decrease
	dec a
	ld [hl], a
	jr .finish_dpad

.d_up
	ld hl, wTempDayOfWeek
	ld a, [hl]
	cp 6
	jr c, .increase
	ld a, SUNDAY - 1

.increase
	inc a
	ld [hl], a

.finish_dpad
	xor a
	ldh [hBGMapMode], a
	hlcoord 10, 4
	ld b, 2
	ld c, 9
	call ClearBox
	hlcoord 10, 5
	call .PlaceWeekdayString
	call WaitBGMap
	and a
	ret

.PlaceWeekdayString:
	push hl
	ld a, [wTempDayOfWeek]
	ld e, a
	ld d, 0
	ld hl, .WeekdayStrings
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

.WeekdayStrings:
; entries correspond to wCurDay constants (see constants/wram_constants.asm)
	dw .Sunday
	dw .Monday
	dw .Tuesday
	dw .Wednesday
	dw .Thursday
	dw .Friday
	dw .Saturday
	dw .Sunday

.Sunday:    db " SUNDAY@"
.Monday:    db " MONDAY@"
.Tuesday:   db " TUESDAY@"
.Wednesday: db "WEDNESDAY@"
.Thursday:  db "THURSDAY@"
.Friday:    db " FRIDAY@"
.Saturday:  db "SATURDAY@"

.OakTimeWhatDayIsItText:
	text_far _OakTimeWhatDayIsItText
	text_end

.ConfirmWeekdayText:
	text_asm
	hlcoord 1, 14
	call .PlaceWeekdayString
	ld hl, .OakTimeIsItText
	ret

.OakTimeIsItText:
	text_far _OakTimeIsItText
	text_end

InitialSetDSTFlag:
	ld a, [wDST]
	set 7, a
	ld [wDST], a
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, .Text
	call PlaceHLTextAtBC
	ret

.Text:
	text_asm
	call UpdateTime
	ldh a, [hHours]
	ld b, a
	ldh a, [hMinutes]
	ld c, a
	decoord 1, 14
	farcall PrintHoursMins
	ld hl, .DSTIsThatOKText
	ret

.DSTIsThatOKText:
	text_far _DSTIsThatOKText
	text_end

InitialClearDSTFlag:
	ld a, [wDST]
	res 7, a
	ld [wDST], a
	hlcoord 1, 14
	lb bc, 3, 18
	call ClearBox
	ld hl, .Text
	call PlaceHLTextAtBC
	ret

.Text:
	text_asm
	call UpdateTime
	ldh a, [hHours]
	ld b, a
	ldh a, [hMinutes]
	ld c, a
	decoord 1, 14
	farcall PrintHoursMins
	ld hl, .TimeAskOkayText
	ret

.TimeAskOkayText:
	text_far _TimeAskOkayText
	text_end

MrChrono: ; unreferenced
	hlcoord 1, 14
	lb bc, 3, SCREEN_WIDTH - 2
	call ClearBox
	ld hl, .Text
	call PlaceHLTextAtBC
	ret

.Text:
	text_asm
	call UpdateTime

	hlcoord 1, 14
	ld [hl], "R"
	inc hl
	ld [hl], "T"
	inc hl
	ld [hl], " "
	inc hl

	ld de, hRTCDayLo
	call .PrintTime

	hlcoord 1, 16
	ld [hl], "D"
	inc hl
	ld [hl], "F"
	inc hl
	ld [hl], " "
	inc hl

	ld de, wStartDay
	call .PrintTime

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
	ld hl, .NowOnDebug
	ret

.NowOnDebug:
	text_start
	para "Now on DEBUG…"
	prompt

.PrintTime:
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

PrintHour:
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
	ld [wTextDecimalByte], a
	ld de, wTextDecimalByte
	call PrintTwoDigitNumberLeftAlign
	ret

GetTimeOfDayString:
	ld a, c
	cp MORN_HOUR
	jr c, .nite
	cp DAY_HOUR
	jr c, .morn
	cp NITE_HOUR
	jr c, .day
.nite
	ld de, .nite_string
	ret
.morn
	ld de, .morn_string
	ret
.day
	ld de, .day_string
	ret

.nite_string: db "NITE@"
.morn_string: db "MORN@"
.day_string:  db "DAY@"

AdjustHourForAMorPM:
; Convert the hour stored in c (0-23) to a 1-12 value
	ld a, c
	or a
	jr z, .midnight
	cp NOON_HOUR
	ret c
	ret z
	sub NOON_HOUR
	ret

.midnight
	ld a, NOON_HOUR
	ret
