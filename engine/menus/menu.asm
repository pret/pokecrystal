_2DMenu_::
	ld hl, CopyMenuData
	ld a, [wMenuData_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	call UpdateSprites
	call ApplyTilemap
	call Get2DMenuSelection
	ret

_InterpretBattleMenu::
	ld hl, CopyMenuData
	ld a, [wMenuData_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	farcall MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	call Get2DMenuSelection
	ret

_InterpretMobileMenu::
	ld hl, CopyMenuData
	ld a, [wMenuData_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	farcall MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	call Init2DMenuCursorPosition
	ld hl, w2DMenuFlags1
	set _2DMENU_DISABLE_JOYPAD_FILTER_F, [hl]
.loop
	call DelayFrame
	farcall Function10032e
	ld a, [wcd2b]
	and a
	jr nz, .quit
	call MobileMenuJoypad
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop
	call Mobile_GetMenuSelection
	ret

.quit
	ld a, [w2DMenuNumCols]
	ld c, a
	ld a, [w2DMenuNumRows]
	call SimpleMultiply
	ld [wMenuCursorPosition], a
	and a
	ret

Draw2DMenu:
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call Place2DMenuItemStrings
	ret

Get2DMenuSelection:
	call Init2DMenuCursorPosition
	call StaticMenuJoypad
	call MenuClickSound
Mobile_GetMenuSelection:
	ld a, [wMenuDataFlags]
	bit STATICMENU_ENABLE_SELECT_F, a
	jr z, .skip
	call GetMenuJoypad
	bit B_PAD_SELECT, a
	jr nz, .quit1

.skip
	ld a, [wMenuDataFlags]
	bit STATICMENU_DISABLE_B_F, a
	jr nz, .skip2
	call GetMenuJoypad
	bit B_PAD_B, a
	jr nz, .quit2

.skip2
	ld a, [w2DMenuNumCols]
	ld c, a
	ld a, [wMenuCursorY]
	dec a
	call SimpleMultiply
	ld c, a
	ld a, [wMenuCursorX]
	add c
	ld [wMenuCursorPosition], a
	and a
	ret

.quit1
	scf
	ret

.quit2
	scf
	ret

Get2DMenuNumberOfColumns:
	ld a, [wMenuData_2DMenuDimensions]
	and $f
	ret

Get2DMenuNumberOfRows:
	ld a, [wMenuData_2DMenuDimensions]
	swap a
	and $f
	ret

Place2DMenuItemStrings:
	ld hl, wMenuData_2DMenuItemStringsAddr
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile
	call Get2DMenuNumberOfRows
	ld b, a
.row
	push bc
	push hl
	call Get2DMenuNumberOfColumns
	ld c, a
.col
	push bc
	ld a, [wMenuData_2DMenuItemStringsBank]
	call Place2DMenuItemName
	inc de
	ld a, [wMenuData_2DMenuSpacing]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	dec c
	jr nz, .col
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ld hl, wMenuData_2DMenuFunctionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [wMenuData_2DMenuFunctionBank]
	rst FarCall
	ret

Init2DMenuCursorPosition:
	call GetMenuTextStartCoord
	ld a, b
	ld [w2DMenuCursorInitY], a
	dec c
	ld a, c
	ld [w2DMenuCursorInitX], a
	call Get2DMenuNumberOfRows
	ld [w2DMenuNumRows], a
	call Get2DMenuNumberOfColumns
	ld [w2DMenuNumCols], a
	call .InitFlags_a
	call .InitFlags_b
	call .InitFlags_c
	ld a, [w2DMenuNumCols]
	ld e, a
	ld a, [wMenuCursorPosition]
	ld b, a
	xor a
	ld d, 0
.loop
	inc d
	add e
	cp b
	jr c, .loop
	sub e
	ld c, a
	ld a, b
	sub c
	and a
	jr z, .reset1
	cp e
	jr z, .okay1
	jr c, .okay1
.reset1
	ld a, 1
.okay1
	ld [wMenuCursorX], a
	ld a, [w2DMenuNumRows]
	ld e, a
	ld a, d
	and a
	jr z, .reset2
	cp e
	jr z, .okay2
	jr c, .okay2
.reset2
	ld a, 1
.okay2
	ld [wMenuCursorY], a
	xor a
	ld [wCursorOffCharacter], a
	ld [wCursorCurrentTile], a
	ld [wCursorCurrentTile + 1], a
	ret

.InitFlags_a:
	xor a
	ld hl, w2DMenuFlags1
	ld [hli], a
	ld [hld], a
	ld a, [wMenuDataFlags]
	bit STATICMENU_WRAP_F, a
	ret z
	set _2DMENU_WRAP_UP_DOWN_F, [hl]
	set _2DMENU_WRAP_LEFT_RIGHT_F, [hl]
	ret

.InitFlags_b:
	ld a, [wMenuData_2DMenuSpacing]
	or $20
	ld [w2DMenuCursorOffsets], a
	ret

.InitFlags_c:
	ld hl, wMenuDataFlags
	ld a, PAD_A
	bit STATICMENU_DISABLE_B_F, [hl]
	jr nz, .skip
	or PAD_B
.skip
	bit STATICMENU_ENABLE_SELECT_F, [hl]
	jr z, .skip2
	or PAD_SELECT
.skip2
	ld [wMenuJoypadFilter], a
	ret

_StaticMenuJoypad::
	call Place2DMenuCursor
_ScrollingMenuJoypad::
	ld hl, w2DMenuFlags2
	res _2DMENU_DISABLE_JOYPAD_FILTER_F, [hl]
	ldh a, [hBGMapMode]
	push af
	call MenuJoypadLoop
	pop af
	ldh [hBGMapMode], a
	ret

MobileMenuJoypad:
	ld hl, w2DMenuFlags2
	res _2DMENU_DISABLE_JOYPAD_FILTER_F, [hl]
	ldh a, [hBGMapMode]
	push af
	call Move2DMenuCursor
	call Do2DMenuRTCJoypad
	jr nc, .skip_joypad
	call _2DMenuInterpretJoypad
.skip_joypad
	pop af
	ldh [hBGMapMode], a
	call GetMenuJoypad
	ld c, a
	ret

Function241d5: ; unreferenced
	call Place2DMenuCursor
.loop
	call Move2DMenuCursor
	call HDMATransferTilemapToWRAMBank3 ; should be farcall
	call .loop2
	jr nc, .done
	call _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit _2DMENU_DISABLE_JOYPAD_FILTER_F, a
	jr nz, .done
	call GetMenuJoypad
	ld c, a
	ld a, [wMenuJoypadFilter]
	and c
	jr z, .loop

.done
	ret

.loop2
	call Menu_WasButtonPressed
	ret c
	ld c, 1
	ld b, 3
	call AdvanceMobileInactivityTimerAndCheckExpired ; should be farcall
	ret c
	farcall Function100337
	ret c
	ld a, [w2DMenuFlags1]
	bit _2DMENU_DISABLE_JOYPAD_FILTER_F, a
	jr z, .loop2
	and a
	ret

MenuJoypadLoop:
.loop
	call Move2DMenuCursor
	call .BGMap_OAM
	call Do2DMenuRTCJoypad
	jr nc, .done
	call _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit _2DMENU_DISABLE_JOYPAD_FILTER_F, a
	jr nz, .done
	call GetMenuJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop

.done
	ret

.BGMap_OAM:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call WaitBGMap
	pop af
	ldh [hOAMUpdate], a
	xor a
	ldh [hBGMapMode], a
	ret

Do2DMenuRTCJoypad:
.loopRTC
	call UpdateTimeAndPals
	call Menu_WasButtonPressed
	ret c
	ld a, [w2DMenuFlags1]
	bit _2DMENU_DISABLE_JOYPAD_FILTER_F, a
	jr z, .loopRTC
	and a
	ret

Menu_WasButtonPressed:
	ld a, [w2DMenuFlags1]
	bit _2DMENU_ENABLE_SPRITE_ANIMS_F, a
	jr z, .skip_to_joypad
	callfar PlaySpriteAnimationsAndDelayFrame

.skip_to_joypad
	call JoyTextDelay
	call GetMenuJoypad
	and a
	ret z
	vc_hook Forbid_printing_photo_studio
	scf
	vc_hook Forbid_printing_PC_Box
	ret

_2DMenuInterpretJoypad:
	call GetMenuJoypad
	bit B_PAD_A, a
	jp nz, .a_b_start_select
	bit B_PAD_B, a
	jp nz, .a_b_start_select
	bit B_PAD_SELECT, a
	jp nz, .a_b_start_select
	bit B_PAD_START, a
	jp nz, .a_b_start_select
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_LEFT, a
	jr nz, .d_left
	bit B_PAD_UP, a
	jr nz, .d_up
	bit B_PAD_DOWN, a
	jr nz, .d_down
	and a
	ret

.set_bit_7
	ld hl, w2DMenuFlags2
	set _2DMENU_EXITING_F, [hl]
	scf
	ret

.d_down
	ld hl, wMenuCursorY
	ld a, [w2DMenuNumRows]
	cp [hl]
	jr z, .check_wrap_around_down
	inc [hl]
	xor a
	ret

.check_wrap_around_down
	ld a, [w2DMenuFlags1]
	bit _2DMENU_WRAP_UP_DOWN_F, a
	jr nz, .wrap_around_down
	bit _2DMENU_EXIT_DOWN_F, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_down
	ld [hl], $1
	xor a
	ret

.d_up
	ld hl, wMenuCursorY
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_up
	ld [hl], a
	xor a
	ret

.check_wrap_around_up
	ld a, [w2DMenuFlags1]
	bit _2DMENU_WRAP_UP_DOWN_F, a
	jr nz, .wrap_around_up
	bit _2DMENU_EXIT_UP_F, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_up
	ld a, [w2DMenuNumRows]
	ld [hl], a
	xor a
	ret

.d_left
	ld hl, wMenuCursorX
	ld a, [hl]
	dec a
	jr z, .check_wrap_around_left
	ld [hl], a
	xor a
	ret

.check_wrap_around_left
	ld a, [w2DMenuFlags1]
	bit _2DMENU_WRAP_LEFT_RIGHT_F, a
	jr nz, .wrap_around_left
	bit _2DMENU_EXIT_LEFT_F, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_left
	ld a, [w2DMenuNumCols]
	ld [hl], a
	xor a
	ret

.d_right
	ld hl, wMenuCursorX
	ld a, [w2DMenuNumCols]
	cp [hl]
	jr z, .check_wrap_around_right
	inc [hl]
	xor a
	ret

.check_wrap_around_right
	ld a, [w2DMenuFlags1]
	bit _2DMENU_WRAP_LEFT_RIGHT_F, a
	jr nz, .wrap_around_right
	bit _2DMENU_EXIT_RIGHT_F, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_right
	ld [hl], $1
	xor a
	ret

.a_b_start_select
	xor a
	ret

Move2DMenuCursor:
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp "▶"
	jr nz, Place2DMenuCursor
	ld a, [wCursorOffCharacter]
	ld [hl], a
Place2DMenuCursor:
	ld a, [w2DMenuCursorInitY]
	ld b, a
	ld a, [w2DMenuCursorInitX]
	ld c, a
	call Coord2Tile
	ld a, [w2DMenuCursorOffsets]
	swap a
	and $f
	ld c, a
	ld a, [wMenuCursorY]
	ld b, a
	xor a
	dec b
	jr z, .got_row
.row_loop
	add c
	dec b
	jr nz, .row_loop

.got_row
	ld c, SCREEN_WIDTH
	call AddNTimes
	ld a, [w2DMenuCursorOffsets]
	and $f
	ld c, a
	ld a, [wMenuCursorX]
	ld b, a
	xor a
	dec b
	jr z, .got_col
.col_loop
	add c
	dec b
	jr nz, .col_loop

.got_col
	ld c, a
	add hl, bc
	ld a, [hl]
	cp "▶"
	jr z, .cursor_on
	ld [wCursorOffCharacter], a
	ld [hl], "▶"

.cursor_on
	ld a, l
	ld [wCursorCurrentTile], a
	ld a, h
	ld [wCursorCurrentTile + 1], a
	ret

_PushWindow::
	ldh a, [rWBK]
	push af
	ld a, BANK(wWindowStack)
	ldh [rWBK], a

	ld hl, wWindowStackPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld b, wMenuHeaderEnd - wMenuHeader
	ld hl, wMenuHeader
.loop
	ld a, [hli]
	ld [de], a
	dec de
	dec b
	jr nz, .loop

; If bit MENU_BACKUP_TILES_F or MENU_BACKUP_TILES_2_F of the menu flags is set,
; also set bit MENU_RESTORE_TILES_F of the address at 7:[wWindowStackPointer],
; and draw the menu using the coordinates from the header.
; Otherwise, reset bit MENU_RESTORE_TILES_F of 7:[wWindowStackPointer].
	ld a, [wMenuFlags]
	bit MENU_BACKUP_TILES_F, a
	jr nz, .backup_tiles
	bit MENU_BACKUP_TILES_2_F, a
	jr z, .no_backup_tiles

.backup_tiles
	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	set MENU_RESTORE_TILES_F, [hl]
	call MenuBoxCoord2Tile
	call .copy
	call MenuBoxCoord2Attr
	call .copy
	jr .done

.no_backup_tiles
	pop hl ; last-pushed register was de
	push hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res MENU_RESTORE_TILES_F, [hl]

.done
	pop hl
	call .ret ; empty function
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
	dec de
	ld hl, wWindowStackPointer
	ld [hl], e
	inc hl
	ld [hl], d

	pop af
	ldh [rWBK], a
	ld hl, wWindowStackSize
	inc [hl]
	ret

.copy
	call GetMenuBoxDims
	inc b
	inc c
	call .ret ; empty function

.row
	push bc
	push hl

.col
	ld a, [hli]
	ld [de], a
	dec de
	dec c
	jr nz, .col

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row

	ret

.ret
	ret

_ExitMenu::
	xor a
	ldh [hBGMapMode], a

	ldh a, [rWBK]
	push af
	ld a, BANK(wWindowStack)
	ldh [rWBK], a

	call GetWindowStackTop
	ld a, l
	or h
	jp z, Error_Cant_ExitMenu
	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a
	call PopWindow
	ld a, [wMenuFlags]
	bit MENU_RESTORE_TILES_F, a
	jr z, .loop
	ld d, h
	ld e, l
	call RestoreTileBackup

.loop
	call GetWindowStackTop
	ld a, h
	or l
	jr z, .done
	call PopWindow

.done
	pop af
	ldh [rWBK], a
	ld hl, wWindowStackSize
	dec [hl]
	ret

RestoreOverworldMapTiles: ; unreferenced
	ld a, [wStateFlags]
	bit SPRITE_UPDATES_DISABLED_F, a
	ret z
	xor a ; sScratch
	call OpenSRAM
	hlcoord 0, 0
	ld de, sScratch
	ld bc, SCREEN_AREA
	call CopyBytes
	call CloseSRAM
	call LoadOverworldTilemapAndAttrmapPals
	xor a ; sScratch
	call OpenSRAM
	ld hl, sScratch
	decoord 0, 0
	ld bc, SCREEN_AREA
.loop
	ld a, [hl]
	cp $61
	jr c, .next
	ld [de], a
.next
	inc hl
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	call CloseSRAM
	ret

Error_Cant_ExitMenu:
	ld hl, .WindowPoppingErrorText
	call PrintText
	call WaitBGMap
.infinite_loop
	jr .infinite_loop

.WindowPoppingErrorText:
	text_far _WindowPoppingErrorText
	text_end

_InitVerticalMenuCursor::
	ld a, [wMenuDataFlags]
	ld b, a
	ld hl, w2DMenuCursorInitY
	ld a, [wMenuBorderTopCoord]
	inc a
	bit STATICMENU_NO_TOP_SPACING_F, b
	jr nz, .skip_offset
	inc a
.skip_offset
	ld [hli], a
; w2DMenuCursorInitX
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld [hli], a
; w2DMenuNumRows
	ld a, [wMenuDataItems]
	ld [hli], a
; w2DMenuNumCols
	ld a, 1
	ld [hli], a
; w2DMenuFlags1
	ld [hl], 0
	bit STATICMENU_WRAP_F, b
	jr z, .skip_bit_5
	set _2DMENU_WRAP_UP_DOWN_F, [hl]
.skip_bit_5
	ld a, [wMenuFlags]
	bit MENU_SPRITE_ANIMS_F, a
	jr z, .skip_bit_6
	set _2DMENU_ENABLE_SPRITE_ANIMS_F, [hl]
.skip_bit_6
	inc hl
; w2DMenuFlags2
	xor a
	ld [hli], a
; w2DMenuCursorOffsets
	ln a, 2, 0
	ld [hli], a
; wMenuJoypadFilter
	ld a, PAD_A
	bit STATICMENU_DISABLE_B_F, b
	jr nz, .skip_bit_1
	add PAD_B
.skip_bit_1
	ld [hli], a
; wMenuCursorY
	ld a, [wMenuCursorPosition]
	and a
	jr z, .load_at_the_top
	ld c, a
	ld a, [wMenuDataItems]
	cp c
	jr nc, .load_position
.load_at_the_top
	ld c, 1
.load_position
	ld [hl], c
	inc hl
; wMenuCursorX
	ld a, 1
	ld [hli], a
; wCursorOffCharacter, wCursorCurrentTile
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
