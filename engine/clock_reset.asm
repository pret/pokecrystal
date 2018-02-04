
ResetClock_GetWraparoundTime: ; 20000 (8:4000)
	push hl
	dec a
	ld e, a
	ld d, 0
	ld hl, .WrapAroundTimes
rept 4
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	pop hl
	ret
; 20015 (8:4015)

.WrapAroundTimes: ; 20015
	dw wBuffer4
	db 7, 4

	dw wBuffer5
	db 24, 12

	dw wBuffer6
	db 60, 15
; 20021

RestartClock: ; 20021 (8:4021)
; If we're here, we had an RTC overflow.
	ld hl, .Text_ClockTimeMayBeWrong
	call PrintText
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call LoadStandardMenuDataHeader
	call ClearTileMap
	ld hl, .Text_SetWithControlPad
	call PrintText
	call .SetClock
	call ExitMenu
	pop bc
	ld hl, wOptions
	ld [hl], b
	ld c, a
	ret
; 20047 (8:4047)

.Text_ClockTimeMayBeWrong: ; 0x20047
	; The clock's time may be wrong. Please reset the time.
	text_jump UnknownText_0x1c40e6
	db "@"
; 0x2004c

.Text_SetWithControlPad: ; 0x2004c
	; Set with the Control Pad. Confirm: A Button Cancel:  B Button
	text_jump UnknownText_0x1c411c
	db "@"
; 0x20051

.SetClock: ; 20051 (8:4051)
	ld a, 1
	ld [wBuffer1], a ; which digit
	ld [wBuffer2], a
	ld a, 8
	ld [wBuffer3], a
	call UpdateTime
	call GetWeekday
	ld [wBuffer4], a
	ld a, [hHours]
	ld [wBuffer5], a
	ld a, [hMinutes]
	ld [wBuffer6], a

.loop
	call .joy_loop
	jr nc, .loop
	and a
	ret nz
	call .PrintTime
	ld hl, .Text_IsThisOK
	call PrintText
	call YesNoBox
	jr c, .cancel
	ld a, [wBuffer4]
	ld [wStringBuffer2], a
	ld a, [wBuffer5]
	ld [wStringBuffer2 + 1], a
	ld a, [wBuffer6]
	ld [wStringBuffer2 + 2], a
	xor a
	ld [wStringBuffer2 + 3], a
	call InitTime
	call .PrintTime
	ld hl, .Text_ClockReset
	call PrintText
	call WaitPressAorB_BlinkCursor
	xor a
	ret

.cancel
	ld a, $1
	ret
; 200b0 (8:40b0)

.Text_IsThisOK: ; 0x200b0
	; Is this OK?
	text_jump UnknownText_0x1c415b
	db "@"
; 0x200b5

.Text_ClockReset: ; 0x200b5
	; The clock has been reset.
	text_jump UnknownText_0x1c4168
	db "@"
; 0x200ba

.joy_loop
	call JoyTextDelay_ForcehJoyDown
	ld c, a
	push af
	call .PrintTime
	pop af
	bit 0, a
	jr nz, .press_A
	bit 1, a
	jr nz, .press_B
	bit 6, a
	jr nz, .pressed_up
	bit 7, a
	jr nz, .pressed_down
	bit 5, a
	jr nz, .pressed_left
	bit 4, a
	jr nz, .pressed_right
	jr .joy_loop

.press_A
	ld a, $0
	scf
	ret

.press_B
	ld a, $1
	scf
	ret

.pressed_up
	ld a, [wBuffer1]
	call ResetClock_GetWraparoundTime
	ld a, [de]
	inc a
	ld [de], a
	cp b
	jr c, .done_scroll
	ld a, $0
	ld [de], a
	jr .done_scroll

.pressed_down
	ld a, [wBuffer1]
	call ResetClock_GetWraparoundTime
	ld a, [de]
	dec a
	ld [de], a
	cp -1
	jr nz, .done_scroll
	ld a, b
	dec a
	ld [de], a
	jr .done_scroll

.pressed_left
	ld hl, wBuffer1
	dec [hl]
	jr nz, .done_scroll
	ld [hl], $3
	jr .done_scroll

.pressed_right
	ld hl, wBuffer1
	inc [hl]
	ld a, [hl]
	cp $4
	jr c, .done_scroll
	ld [hl], $1

.done_scroll
	xor a
	ret

.PrintTime: ; 2011f (8:411f)
	hlcoord 0, 5
	ld b, 5
	ld c, 18
	call TextBox
	decoord 1, 8
	ld a, [wBuffer4]
	ld b, a
	farcall PrintDayOfWeek
	ld a, [wBuffer5]
	ld b, a
	ld a, [wBuffer6]
	ld c, a
	decoord 11, 8
	farcall PrintHoursMins
	ld a, [wBuffer2]
	lb de, " ", " "
	call .PlaceChars
	ld a, [wBuffer1]
	lb de, "▲", "▼"
	call .PlaceChars
	ld a, [wBuffer1]
	ld [wBuffer2], a
	ret
; 20160 (8:4160)

; unused
.unreferenced ; 20160
	ld a, [wBuffer3]
	ld b, a
	call Coord2Tile
	ret
; 20168

.PlaceChars: ; 20168 (8:4168)
	push de
	call ResetClock_GetWraparoundTime
	ld a, [wBuffer3]
	dec a
	ld b, a
	call Coord2Tile
	pop de
	ld [hl], d
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	ld [hl], e
	ret
; 2017c (8:417c)

String_2017c: ; 2017c
	db "じ@" ; HR
; 2017e

String_2017e: ; 2017e
	db "ふん@" ; MIN
; 20181
