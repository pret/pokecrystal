_ResetClock: ; 4d3b1
	callba BlankScreen
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .text_askreset
	call PrintText
	ld hl, .NoYes_MenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	call ClockResetPassword
	jr c, .wrongpassword
	ld a, BANK(sRTCStatusFlags)
	call GetSRAMBank
	ld a, $80
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ld hl, .text_okay
	call PrintText
	ret

.wrongpassword
	ld hl, .text_wrong
	call PrintText
	ret

.text_okay ; 0x4d3fe
	; Password OK. Select CONTINUE & reset settings.
	text_jump UnknownText_0x1c55db
	db "@"

.text_wrong ; 0x4d403
	; Wrong password!
	text_jump UnknownText_0x1c560b
	db "@"

.text_askreset ; 0x4d408
	; Reset the clock?
	text_jump UnknownText_0x1c561c
	db "@"

.NoYes_MenuDataHeader: ; 0x4d40d
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .NoYes_MenuData2
	db 1 ; default option

.NoYes_MenuData2: ; 0x4d415
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"

ClockResetPassword: ; 4d41e
	call .CalculatePassword
	push de
	ld hl, StringBuffer2
	ld bc, 5
	xor a
	call ByteFill
	ld a, $4
	ld [StringBuffer2 + 5], a
	ld hl, .pleaseenterpasswordtext
	call PrintText
.loop
	call .updateIDdisplay
.loop2
	call JoyTextDelay
	ld a, [hJoyLast]
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

.pleaseenterpasswordtext ; 0x4d463
	; Please enter the password.
	text_jump UnknownText_0x1c562e
	db "@"

.updateIDdisplay ; 4d468
	hlcoord 14, 15
	ld de, StringBuffer2
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
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $61
	ret

.dpadinput ; 4d490
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
	ld a, [StringBuffer2 + 5]
	and a
	ret z
	dec a
	ld [StringBuffer2 + 5], a
	ret

.right
	ld a, [StringBuffer2 + 5]
	cp $4
	ret z
	inc a
	ld [StringBuffer2 + 5], a
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
	ld [hl], $0
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

.getcurrentdigit ; 4d4d5
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	ld hl, StringBuffer2
	add hl, de
	ret

.ConvertDecIDToBytes: ; 4d4e0
	ld hl, 0
	ld de, StringBuffer2 + 4
	ld bc, 1
	call .ConvertToBytes
	ld bc, 10
	call .ConvertToBytes
	ld bc, 100
	call .ConvertToBytes
	ld bc, 1000
	call .ConvertToBytes
	ld bc, 10000
.ConvertToBytes: ; 4d501
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

.CalculatePassword: ; 4d50f
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld de, 0
	ld hl, sPlayerData + (PlayerID - wPlayerData)
	ld c, $2
	call .ComponentFromNumber
	ld hl, sPlayerData + (PlayerName - wPlayerData)
	ld c, $5 ; PLAYER_NAME_LENGTH_J
	call .ComponentFromString
	ld hl, sPlayerData + (Money - wPlayerData)
	ld c, $3
	call .ComponentFromNumber
	call CloseSRAM
	ret

.ComponentFromNumber: ; 4d533
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromNumber
	ret

.ComponentFromString: ; 4d53e
	ld a, [hli]
	cp "@"
	ret z
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromString
	ret

_DeleteSaveData: ; 4d54c
	callba BlankScreen
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .Text_ClearAllSaveData
	call PrintText
	ld hl, .NoYesMenuDataHeader
	call CopyMenuDataHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	callba EmptyAllSRAMBanks
	ret

.Text_ClearAllSaveData: ; 0x4d580
	; Clear all save data?
	text_jump UnknownText_0x1c564a
	db "@"

.NoYesMenuDataHeader: ; 0x4d585
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2: ; 0x4d58d
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
