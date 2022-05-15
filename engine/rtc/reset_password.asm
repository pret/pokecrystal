_ResetClock:
	farcall BlankScreen
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .PasswordAskResetClockText
	call PrintText
	ld hl, .NoYes_MenuHeader
	call CopyMenuHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp 1
	ret z
	call ClockResetPassword
	jr c, .wrongpassword
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	ld a, $80
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ld hl, .PasswordAskResetText
	call PrintText
	ret

.wrongpassword
	ld hl, .PasswordWrongText
	call PrintText
	ret

.PasswordAskResetText:
	text_far _PasswordAskResetText
	text_end

.PasswordWrongText:
	text_far _PasswordWrongText
	text_end

.PasswordAskResetClockText:
	text_far _PasswordAskResetClockText
	text_end

.NoYes_MenuHeader:
	db 0 ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .NoYes_MenuData
	db 1 ; default option

.NoYes_MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "NO@"
	db "YES@"

ClockResetPassword:
	call .CalculatePassword
	push de
	ld hl, wStringBuffer2
	ld bc, 5
	xor a
	call ByteFill
	ld a, 4
	ld [wStringBuffer2 + 5], a
	ld hl, .PasswordAskEnterText
	call PrintText
.loop
	call .updateIDdisplay
.loop2
	call JoyTextDelay
	ldh a, [hJoyLast]
	ld b, a
	and A_BUTTON
	jr nz, .confirm
	ld a, b
	and D_PAD
	jr z, .loop2
	call .dpadinput
	ld c, 3
	call DelayFrames
	jr .loop

.confirm
	call .ConvertDecIDToBytes
	pop de
	ld a, e
	cp l
	jr nz, .nope
	ld a, d
	cp h
	jr nz, .nope
	and a
	ret

.nope
	scf
	ret

.PasswordAskEnterText:
	text_far _PasswordAskEnterText
	text_end

.updateIDdisplay
	hlcoord 14, 15
	ld de, wStringBuffer2
	ld c, 5
.loop3
	ld a, [de]
	add "0"
	ld [hli], a
	inc de
	dec c
	jr nz, .loop3
	hlcoord 14, 16
	ld bc, 5
	ld a, " "
	call ByteFill
	hlcoord 14, 16
	ld a, [wStringBuffer2 + 5]
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], "▲"
	ret

.dpadinput
	ld a, b
	and D_LEFT
	jr nz, .left
	ld a, b
	and D_RIGHT
	jr nz, .right
	ld a, b
	and D_UP
	jr nz, .up
	ld a, b
	and D_DOWN
	jr nz, .down
	ret

.left
	ld a, [wStringBuffer2 + 5]
	and a
	ret z
	dec a
	ld [wStringBuffer2 + 5], a
	ret

.right
	ld a, [wStringBuffer2 + 5]
	cp 4
	ret z
	inc a
	ld [wStringBuffer2 + 5], a
	ret

.up
	call .getcurrentdigit
	ld a, [hl]
	cp 9
	jr z, .wraparound_up
	inc a
	ld [hl], a
	ret

.wraparound_up
	ld [hl], 0
	ret

.down
	call .getcurrentdigit
	ld a, [hl]
	and a
	jr z, .wraparound_down
	dec a
	ld [hl], a
	ret

.wraparound_down
	ld [hl], 9
	ret

.getcurrentdigit
	ld a, [wStringBuffer2 + 5]
	ld e, a
	ld d, 0
	ld hl, wStringBuffer2
	add hl, de
	ret

.ConvertDecIDToBytes:
	ld hl, 0
	ld de, wStringBuffer2 + 4
	ld bc, 1
	call .ConvertToBytes
	ld bc, 10
	call .ConvertToBytes
	ld bc, 100
	call .ConvertToBytes
	ld bc, 1000
	call .ConvertToBytes
	ld bc, 10000
.ConvertToBytes:
	ld a, [de]
	dec de
	push hl
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
	add hl, bc
	ret

.CalculatePassword:
	ld a, BANK(sPlayerData)
	call OpenSRAM
	ld de, 0
	ld hl, sPlayerData + (wPlayerID - wPlayerData)
	ld c, 2
	call .ComponentFromNumber
	ld hl, sPlayerData + (wPlayerName - wPlayerData)
	ld c, NAME_LENGTH_JAPANESE - 1
	call .ComponentFromString
	ld hl, sPlayerData + (wMoney - wPlayerData)
	ld c, 3
	call .ComponentFromNumber
	call CloseSRAM
	ret

.ComponentFromNumber:
	ld a, [hli]
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromNumber
	ret

.ComponentFromString:
	ld a, [hli]
	cp "@"
	ret z
	add e
	ld e, a
	ld a, 0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromString
	ret
