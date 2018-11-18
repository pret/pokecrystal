_DeleteSaveData:
	farcall BlankScreen
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .Text_ClearAllSaveData
	call PrintText
	ld hl, .NoYesMenuHeader
	call CopyMenuHeader
	call VerticalMenu
	ret c
	ld a, [wMenuCursorY]
	cp $1
	ret z
	farcall EmptyAllSRAMBanks
	ret

.Text_ClearAllSaveData:
	; Clear all save data?
	text_far UnknownText_0x1c564a
	text_end

.NoYesMenuHeader:
	db 0 ; flags
	menu_coords 14, 7, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
