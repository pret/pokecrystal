_InitScrollingMenu::
	xor a
	ld [wMenuJoypad], a
	ldh [hBGMapMode], a
	inc a
	ldh [hInMenu], a
	call InitScrollingMenuCursor
	call ScrollingMenu_InitFlags
	call ScrollingMenu_ValidateSwitchItem
	call ScrollingMenu_InitDisplay
	call ApplyTilemap
	xor a
	ldh [hBGMapMode], a
	ret

_ScrollingMenu::
.loop
	call ScrollingMenuJoyAction
	jp c, .exit
	call z, .zero
	jr .loop

.exit
	call MenuClickSound
	ld [wMenuJoypad], a
	ld a, 0
	ldh [hInMenu], a
	ret

.zero
	call ScrollingMenu_InitDisplay
	ld a, 1
	ldh [hBGMapMode], a
	ld c, 3
	call DelayFrames
	xor a
	ldh [hBGMapMode], a
	ret

ScrollingMenu_InitDisplay:
	xor a
	ldh [hBGMapMode], a
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call ScrollingMenu_UpdateDisplay
	call ScrollingMenu_PlaceCursor
	call ScrollingMenu_CheckCallFunction3
	pop af
	ld [wOptions], a
	ret

ScrollingMenuJoyAction:
.loop
	call ScrollingMenuJoypad
	ldh a, [hJoyLast]
	and D_PAD
	ld b, a
	ldh a, [hJoyPressed]
	and BUTTONS
	or b
	bit A_BUTTON_F, a
	jp nz, .a_button
	bit B_BUTTON_F, a
	jp nz, .b_button
	bit SELECT_F, a
	jp nz, .select
	bit START_F, a
	jp nz, .start
	bit D_RIGHT_F, a
	jp nz, .d_right
	bit D_LEFT_F, a
	jp nz, .d_left
	bit D_UP_F, a
	jp nz, .d_up
	bit D_DOWN_F, a
	jp nz, .d_down
	jr .loop

.no_zero_no_carry ; unreferenced
	ld a, -1
	and a
	ret

.a_button
	call PlaceHollowCursor
	ld a, [wMenuCursorY]
	dec a
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [wMenuSelection]
	ld [wCurItem], a
	ld a, [wMenuSelectionQuantity]
	ld [wItemQuantity], a
	call ScrollingMenu_GetCursorPosition
	dec a
	ld [wScrollingMenuCursorPosition], a
	ld [wCurItemQuantity], a
	ld a, [wMenuSelection]
	cp -1
	jr z, .b_button
	ld a, A_BUTTON
	scf
	ret

.b_button
	ld a, B_BUTTON
	scf
	ret

.select
	ld a, [wMenuDataFlags]
	bit 7, a
	jp z, xor_a_dec_a
	ld a, [wMenuCursorY]
	dec a
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [wMenuSelection]
	cp -1
	jp z, xor_a_dec_a
	call ScrollingMenu_GetCursorPosition
	dec a
	ld [wScrollingMenuCursorPosition], a
	ld a, SELECT
	scf
	ret

.start
	ld a, [wMenuDataFlags]
	bit 6, a
	jp z, xor_a_dec_a
	ld a, START
	scf
	ret

.d_left
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuDataFlags]
	bit 3, a
	jp z, xor_a_dec_a
	ld a, D_LEFT
	scf
	ret

.d_right
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuDataFlags]
	bit 2, a
	jp z, xor_a_dec_a
	ld a, D_RIGHT
	scf
	ret

.d_up
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a
	ld hl, wMenuScrollPosition
	ld a, [hl]
	and a
	jr z, .xor_dec_up
	dec [hl]
	jp xor_a

.xor_dec_up
	jp xor_a_dec_a

.d_down
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a
	ld hl, wMenuScrollPosition
	ld a, [wMenuData_ScrollingMenuHeight]
	add [hl]
	ld b, a
	ld a, [wScrollingMenuListSize]
	cp b
	jr c, .xor_dec_down
	inc [hl]
	jp xor_a

.xor_dec_down
	jp xor_a_dec_a

ScrollingMenu_GetCursorPosition:
	ld a, [wMenuScrollPosition]
	ld c, a
	ld a, [wMenuCursorY]
	add c
	ld c, a
	ret

ScrollingMenu_ClearLeftColumn:
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH
	add hl, de
	ld de, 2 * SCREEN_WIDTH
	ld a, [wMenuData_ScrollingMenuHeight]
.loop
	ld [hl], " "
	add hl, de
	dec a
	jr nz, .loop
	ret

InitScrollingMenuCursor:
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMenuData_ItemsPointerBank]
	call GetFarByte
	ld [wScrollingMenuListSize], a
	ld a, [wMenuData_ScrollingMenuHeight]
	ld c, a
	ld a, [wMenuScrollPosition]
	add c
	ld c, a
	ld a, [wScrollingMenuListSize]
	inc a
	cp c
	jr nc, .skip
	ld a, [wMenuData_ScrollingMenuHeight]
	ld c, a
	ld a, [wScrollingMenuListSize]
	inc a
	sub c
	jr nc, .store
	xor a

.store
	ld [wMenuScrollPosition], a

.skip
	ld a, [wMenuScrollPosition]
	ld c, a
	ld a, [wMenuCursorPosition]
	add c
	ld b, a
	ld a, [wScrollingMenuListSize]
	inc a
	cp b
	jr c, .wrap
	jr nc, .done

.wrap
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [wMenuCursorPosition], a

.done
	ret

ScrollingMenu_InitFlags:
	ld a, [wMenuDataFlags]
	ld c, a
	ld a, [wScrollingMenuListSize]
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add 1
	ld [w2DMenuCursorInitY], a
	ld a, [wMenuBorderLeftCoord]
	add 0
	ld [w2DMenuCursorInitX], a
	ld a, [wMenuData_ScrollingMenuHeight]
	cp b
	jr c, .no_extra_row
	jr z, .no_extra_row
	ld a, b
	inc a
.no_extra_row
	ld [w2DMenuNumRows], a
	ld a, 1
	ld [w2DMenuNumCols], a
	ld a, $8c
	bit 2, c
	jr z, .skip_set_0
	set 0, a

.skip_set_0
	bit 3, c
	jr z, .skip_set_1
	set 1, a

.skip_set_1
	ld [w2DMenuFlags1], a
	xor a
	ld [w2DMenuFlags2], a
	ld a, $20
	ld [w2DMenuCursorOffsets], a
	ld a, A_BUTTON | B_BUTTON | D_UP | D_DOWN
	bit 7, c
	jr z, .disallow_select
	add SELECT

.disallow_select
	bit 6, c
	jr z, .disallow_start
	add START

.disallow_start
	ld [wMenuJoypadFilter], a
	ld a, [w2DMenuNumRows]
	ld b, a
	ld a, [wMenuCursorPosition]
	and a
	jr z, .reset_cursor
	cp b
	jr z, .cursor_okay
	jr c, .cursor_okay

.reset_cursor
	ld a, 1

.cursor_okay
	ld [wMenuCursorY], a
	ld a, 1
	ld [wMenuCursorX], a
	xor a
	ld [wCursorCurrentTile], a
	ld [wCursorCurrentTile + 1], a
	ld [wCursorOffCharacter], a
	ret

ScrollingMenu_ValidateSwitchItem:
	ld a, [wScrollingMenuListSize]
	ld c, a
	ld a, [wSwitchItem]
	and a
	jr z, .done
	dec a
	cp c
	jr c, .done
	xor a
	ld [wSwitchItem], a

.done
	ret

ScrollingMenu_UpdateDisplay:
	call ClearWholeMenuBox
	ld a, [wMenuDataFlags]
	bit 4, a ; place arrows
	jr z, .okay
	ld a, [wMenuScrollPosition]
	and a
	jr z, .okay
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], "▲"

.okay
	call MenuBoxCoord2Tile
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	ld a, [wMenuData_ScrollingMenuHeight]
	ld b, a
	ld c, $0
.loop
	ld a, [wMenuScrollPosition]
	add c
	ld [wScrollingMenuCursorPosition], a
	ld a, c
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [wMenuSelection]
	cp -1
	jr z, .cancel
	push bc
	push hl
	call ScrollingMenu_CallFunctions1and2
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp b
	jr nz, .loop
	ld a, [wMenuDataFlags]
	bit 4, a ; place arrows
	jr z, .done
	ld a, [wMenuBorderBottomCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], "▼"

.done
	ret

.cancel
	ld a, [wMenuDataFlags]
	bit 0, a ; call function on cancel
	jr nz, .call_function
	ld de, .CancelString
	call PlaceString
	ret

.CancelString
	db "CANCEL@"

.call_function
	ld d, h
	ld e, l
	ld hl, wMenuData_ScrollingMenuFunction1
	jp CallPointerAt

ScrollingMenu_CallFunctions1and2:
	push hl
	ld d, h
	ld e, l
	ld hl, wMenuData_ScrollingMenuFunction1
	call CallPointerAt
	pop hl
	ld a, [wMenuData_ScrollingMenuWidth]
	and a
	jr z, .done
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wMenuData_ScrollingMenuFunction2
	call CallPointerAt

.done
	ret

ScrollingMenu_PlaceCursor:
	ld a, [wSwitchItem]
	and a
	jr z, .done
	ld b, a
	ld a, [wMenuScrollPosition]
	cp b
	jr nc, .done
	ld c, a
	ld a, [wMenuData_ScrollingMenuHeight]
	add c
	cp b
	jr c, .done
	ld a, b
	sub c
	dec a
	add a
	add $1
	ld c, a
	ld a, [wMenuBorderTopCoord]
	add c
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	add $0
	ld c, a
	call Coord2Tile
	ld [hl], "▷"

.done
	ret

ScrollingMenu_CheckCallFunction3:
	ld a, [wMenuDataFlags]
	bit 5, a ; call function 3
	ret z
	bit 1, a ; call function 3 if not switching items
	jr z, .call
	ld a, [wSwitchItem]
	and a
	ret nz

.call
	ld a, [wMenuCursorY]
	dec a
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld hl, wMenuData_ScrollingMenuFunction3
	call CallPointerAt
	ret

ScrollingMenu_GetListItemCoordAndFunctionArgs:
	push de
	push hl
	ld e, a
	ld a, [wMenuScrollPosition]
	add e
	ld e, a
	ld d, 0
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; items
	ld a, [wMenuData_ScrollingMenuItemFormat]
	cp SCROLLINGMENU_ITEMS_NORMAL
	jr z, .got_spacing
	cp SCROLLINGMENU_ITEMS_QUANTITY
	jr z, .pointless_jump
.pointless_jump
	add hl, de
.got_spacing
	add hl, de
	ld a, [wMenuData_ItemsPointerBank]
	call GetFarByte
	ld [wMenuSelection], a
	ld [wCurItem], a
	inc hl
	ld a, [wMenuData_ItemsPointerBank]
	call GetFarByte
	ld [wMenuSelectionQuantity], a
	pop hl
	pop de
	ret
