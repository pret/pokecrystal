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
	ld a, BANK(sRTCStatusFlags)
	call OpenSRAM
	ld a, $80
	ld [sRTCStatusFlags], a
	call CloseSRAM
	ld hl, .PasswordAskResetText
	call PrintText
	ret

.PasswordAskResetText:
	text_far _PasswordAskResetText
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
