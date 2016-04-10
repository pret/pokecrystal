_InitScrollingMenu:: ; 245af
	xor a
	ld [wMenuJoypad], a
	ld [hBGMapMode], a
	inc a
	ld [hInMenu], a
	call InitScrollingMenuCursor
	call ScrollingMenu_InitFlags
	call ScrollingMenu_ValidateSwitchItem
	call ScrollingMenu_InitDisplay
	call ApplyTilemap
	xor a
	ld [hBGMapMode], a
	ret
; 245cb

_ScrollingMenu:: ; 245cb
.loop
	call ScrollingMenuJoyAction
	jp c, .exit
	call z, .zero
	jr .loop
; 245d6

.exit ; 245d6
	call MenuClickSound
	ld [wMenuJoypad], a
	ld a, 0
	ld [hInMenu], a
	ret
; 245e1

.zero ; 245e1
	call ScrollingMenu_InitDisplay
	ld a, 1
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ret
; 245f1

ScrollingMenu_InitDisplay: ; 245f1
	xor a
	ld [hBGMapMode], a
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call ScrollingMenu_UpdateDisplay
	call ScrollingMenu_PlaceCursor
	call ScrollingMenu_CheckCallFunction3
	pop af
	ld [Options], a
	ret
; 24609

ScrollingMenuJoyAction: ; 24609
.loop
	call ScrollingMenuJoypad
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyPressed]
	and BUTTONS
	or b
	bit 0, a ; A
	jp nz, .a_button
	bit 1, a ; B
	jp nz, .b_button
	bit 2, a ; Select
	jp nz, .select
	bit 3, a ; Start
	jp nz, .start
	bit 4, a ; Right
	jp nz, .d_right
	bit 5, a ; Left
	jp nz, .d_left
	bit 6, a ; Up
	jp nz, .d_up
	bit 7, a ; Down
	jp nz, .d_down
	jr .loop
; 24640

.unreferenced ; unreferenced
	ld a, -1
	and a
	ret
; 24644

.a_button ; 24644
	call PlaceHollowCursor
	ld a, [wMenuCursorY]
	dec a
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [MenuSelection]
	ld [CurItem], a
	ld a, [MenuSelectionQuantity]
	ld [wItemQuantityBuffer], a
	call ScrollingMenu_GetCursorPosition
	dec a
	ld [wScrollingMenuCursorPosition], a
	ld [CurItemQuantity], a
	ld a, [MenuSelection]
	cp -1
	jr z, .b_button
	ld a, A_BUTTON
	scf
	ret
; 2466f

.b_button ; 2466f
	ld a, B_BUTTON
	scf
	ret
; 24673

.select ; 24673
	ld a, [wMenuData2Flags]
	bit 7, a
	jp z, xor_a_dec_a
	ld a, [wMenuCursorY]
	dec a
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [MenuSelection]
	cp -1
	jp z, xor_a_dec_a
	call ScrollingMenu_GetCursorPosition
	dec a
	ld [wScrollingMenuCursorPosition], a
	ld a, SELECT
	scf
	ret
; 24695

.start ; 24695
	ld a, [wMenuData2Flags]
	bit 6, a
	jp z, xor_a_dec_a
	ld a, START
	scf
	ret
; 246a1

.d_left ; 246a1
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 3, a
	jp z, xor_a_dec_a
	ld a, D_LEFT
	scf
	ret
; 246b5

.d_right ; 246b5
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 2, a
	jp z, xor_a_dec_a
	ld a, D_RIGHT
	scf
	ret
; 246c9

.d_up ; 246c9
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
; 246df

.d_down ; 246df
	ld hl, w2DMenuFlags2
	bit 7, [hl]
	jp z, xor_a
	ld hl, wMenuScrollPosition
	ld a, [wMenuData2_ScrollingMenuHeight]
	add [hl]
	ld b, a
	ld a, [wScrollingMenuListSize]
	cp b
	jr c, .xor_dec_down
	inc [hl]
	jp xor_a

.xor_dec_down
	jp xor_a_dec_a
; 246fc

ScrollingMenu_GetCursorPosition: ; 246fc
	ld a, [wMenuScrollPosition]
	ld c, a
	ld a, [wMenuCursorY]
	add c
	ld c, a
	ret
; 24706

ScrollingMenu_ClearLeftColumn: ; 24706 (9:4706)
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH
	add hl, de
	ld de, 2 * SCREEN_WIDTH
	ld a, [wMenuData2_ScrollingMenuHeight]
.loop
	ld [hl], " "
	add hl, de
	dec a
	jr nz, .loop
	ret

InitScrollingMenuCursor: ; 2471a
	ld hl, wMenuData2_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMenuData2_ItemsPointerBank]
	call GetFarByte
	ld [wScrollingMenuListSize], a
	ld a, [wMenuData2_ScrollingMenuHeight]
	ld c, a
	ld a, [wMenuScrollPosition]
	add c
	ld c, a
	ld a, [wScrollingMenuListSize]
	inc a
	cp c
	jr nc, .skip
	ld a, [wMenuData2_ScrollingMenuHeight]
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
	ld a, [wMenuCursorBuffer]
	add c
	ld b, a
	ld a, [wScrollingMenuListSize]
	inc a
	cp b
	jr c, .asm_2475a
	jr nc, .asm_24763

.asm_2475a
	xor a
	ld [wMenuScrollPosition], a
	ld a, $1
	ld [wMenuCursorBuffer], a

.asm_24763
	ret
; 24764

ScrollingMenu_InitFlags: ; 24764
	ld a, [wMenuData2Flags]
	ld c, a
	ld a, [wScrollingMenuListSize]
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add 1
	ld [w2DMenuCursorInitY], a
	ld a, [wMenuBorderLeftCoord]
	add 0
	ld [w2DMenuCursorInitX], a
	ld a, [wMenuData2_ScrollingMenuHeight]
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
	ld a, [wMenuCursorBuffer]
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
; 247dd

ScrollingMenu_ValidateSwitchItem: ; 247dd
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
; 247f0

ScrollingMenu_UpdateDisplay: ; 247f0
	call ClearWholeMenuBox
	ld a, [wMenuData2Flags]
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
	ld a, [wMenuData2_ScrollingMenuHeight]
	ld b, a
	ld c, $0
.loop
	ld a, [wMenuScrollPosition]
	add c
	ld [wScrollingMenuCursorPosition], a
	ld a, c
	call ScrollingMenu_GetListItemCoordAndFunctionArgs
	ld a, [MenuSelection]
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
	ld a, [wMenuData2Flags]
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
	ld a, [wMenuData2Flags]
	bit 0, a ; call function on cancel
	jr nz, .call_function
	ld de, .string_2485f
	call PlaceString
	ret

.string_2485f
	db "CANCEL@"

.call_function
	ld d, h
	ld e, l
	ld hl, wMenuData2_ScrollingMenuFunction1
	jp CallPointerAt
; 2486e

ScrollingMenu_CallFunctions1and2: ; 2486e
	push hl
	ld d, h
	ld e, l
	ld hl, wMenuData2_ScrollingMenuFunction1
	call CallPointerAt
	pop hl
	ld a, [wMenuData2_ScrollingMenuWidth]
	and a
	jr z, .done
	ld e, a
	ld d, $0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wMenuData2_ScrollingMenuFunction2
	call CallPointerAt

.done
	ret
; 2488b

ScrollingMenu_PlaceCursor: ; 2488b
	ld a, [wSwitchItem]
	and a
	jr z, .done
	ld b, a
	ld a, [wMenuScrollPosition]
	cp b
	jr nc, .done
	ld c, a
	ld a, [wMenuData2_ScrollingMenuHeight]
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
; 248b8

ScrollingMenu_CheckCallFunction3: ; 248b8
	ld a, [wMenuData2Flags]
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
	ld hl, wMenuData2_ScrollingMenuFunction3
	call CallPointerAt
	ret
; 248d5

ScrollingMenu_GetListItemCoordAndFunctionArgs: ; 248d5
	push de
	push hl
	ld e, a
	ld a, [wMenuScrollPosition]
	add e
	ld e, a
	ld d, $0
	ld hl, wMenuData2_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl ; items
	ld a, [wMenuData2_ScrollingMenuSpacing]
	cp 1
	jr z, .got_spacing
	cp 2
	jr z, .pointless_jump
.pointless_jump
	add hl, de
.got_spacing
	add hl, de
	ld a, [wMenuData2_ItemsPointerBank]
	call GetFarByte
	ld [MenuSelection], a
	ld [CurItem], a
	inc hl
	ld a, [wMenuData2_ItemsPointerBank]
	call GetFarByte
	ld [MenuSelectionQuantity], a
	pop hl
	pop de
	ret
; 2490c
