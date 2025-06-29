Load2DMenuData::
	push hl
	push bc
	ld hl, w2DMenuData
	ld b, w2DMenuDataEnd - w2DMenuData
.loop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop

	; Reset menu state
	ld a, $1
	ld [hli], a ; wMenuCursorY
	ld [hli], a ; wMenuCursorX
	xor a
	ld [hli], a ; wCursorOffCharacter
	ld [hli], a ; wCursorCurrentTile
	ld [hli], a
	pop bc
	pop hl
	ret

StaticMenuJoypad::
	callfar _StaticMenuJoypad
	call GetMenuJoypad
	ret

ScrollingMenuJoypad::
	callfar _ScrollingMenuJoypad
	call GetMenuJoypad
	ret

GetMenuJoypad::
	push bc
	push af
	ldh a, [hJoyLast]
	and PAD_CTRL_PAD
	ld b, a
	ldh a, [hJoyPressed]
	and PAD_BUTTONS
	or b
	ld b, a
	pop af
	ld a, b
	pop bc
	ret

PlaceHollowCursor::
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], "▷"
	ret

HideCursor::
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld [hl], " "
	ret

PushWindow::
	callfar _PushWindow
	ret

ExitMenu::
	push af
	callfar _ExitMenu
	pop af
	ret

InitVerticalMenuCursor::
	callfar _InitVerticalMenuCursor
	ret

CloseWindow::
	push af
	call ExitMenu
	call ApplyTilemap
	call UpdateSprites
	pop af
	ret

RestoreTileBackup::
	call MenuBoxCoord2Tile
	call .copy
	call MenuBoxCoord2Attr
	call .copy
	ret

.copy
	call GetMenuBoxDims
	inc b
	inc c

.row
	push bc
	push hl

.col
	ld a, [de]
	ld [hli], a
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

PopWindow::
	ld b, wMenuHeaderEnd - wMenuHeader
	ld de, wMenuHeader
.loop
	ld a, [hld]
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	ret

GetMenuBoxDims::
	ld a, [wMenuBorderTopCoord] ; top
	ld b, a
	ld a, [wMenuBorderBottomCoord] ; bottom
	sub b
	ld b, a
	ld a, [wMenuBorderLeftCoord] ; left
	ld c, a
	ld a, [wMenuBorderRightCoord] ; right
	sub c
	ld c, a
	ret

CopyMenuData::
	push hl
	push de
	push bc
	push af
	ld hl, wMenuDataPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMenuData
	ld bc, wMenuDataEnd - wMenuData
	call CopyBytes
	pop af
	pop bc
	pop de
	pop hl
	ret

GetWindowStackTop::
	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

PlaceVerticalMenuItems::
	call CopyMenuData
	ld hl, wMenuDataPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile ; hl now contains the tilemap address where we will start printing text.
	inc de
	ld a, [de] ; Number of items
	inc de
	ld b, a
.loop
	push bc
	call PlaceString
	inc de
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .loop

	ld a, [wMenuDataFlags]
	bit STATICMENU_PLACE_TITLE_F, a
	ret z

	call MenuBoxCoord2Tile
	ld a, [de]
	ld c, a
	inc de
	ld b, 0
	add hl, bc
	jp PlaceString

MenuBox::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	jp Textbox

GetMenuTextStartCoord::
	ld a, [wMenuBorderTopCoord]
	ld b, a
	inc b
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	inc c
; if not set, leave extra room on top
	ld a, [wMenuDataFlags]
	bit STATICMENU_NO_TOP_SPACING_F, a
	jr nz, .no_top_spacing
	inc b

.no_top_spacing
; if set, leave extra room on the left
	ld a, [wMenuDataFlags]
	bit STATICMENU_CURSOR_F, a
	jr z, .no_cursor
	inc c

.no_cursor
	ret

ClearMenuBoxInterior::
	call MenuBoxCoord2Tile
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	call GetMenuBoxDims
	dec b
	dec c
	call ClearBox
	ret

ClearWholeMenuBox::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	inc c
	inc b
	call ClearBox
	ret

MenuBoxCoord2Tile::
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a
	; fallthrough

Coord2Tile::
; Return the address of wTilemap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl
	ld c, a
	xor a
	ld b, a
	add hl, bc
	bccoord 0, 0
	add hl, bc
	ret

MenuBoxCoord2Attr::
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a
	; fallthrough

Coord2Attr:: ; unreferenced
; Return the address of wAttrmap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l
	add hl, hl
	add hl, hl
	add hl, bc
	add hl, hl
	add hl, hl
	ld c, a
	xor a
	ld b, a
	add hl, bc
	bccoord 0, 0, wAttrmap
	add hl, bc
	ret

LoadMenuHeader::
	call CopyMenuHeader
	call PushWindow
	ret

CopyMenuHeader::
	ld de, wMenuHeader
	ld bc, wMenuHeaderEnd - wMenuHeader
	call CopyBytes
	ldh a, [hROMBank]
	ld [wMenuDataBank], a
	ret

StoreMenuCursorPosition::
	ld [wMenuCursorPosition], a
	ret

MenuTextbox::
	push hl
	call LoadMenuTextbox
	pop hl
	jp PrintText

Menu_DummyFunction:: ; unreferenced
	ret

LoadMenuTextbox::
	ld hl, .MenuHeader
	call LoadMenuHeader
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 12, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw vTiles0
	db 0 ; default option

MenuTextboxBackup::
	call MenuTextbox
	call CloseWindow
	ret

LoadStandardMenuHeader::
	ld hl, .MenuHeader
	call LoadMenuHeader
	ret

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw 0
	db 1 ; default option

Call_ExitMenu::
	call ExitMenu
	ret

VerticalMenu::
	xor a
	ldh [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call ApplyTilemap
	call CopyMenuData
	ld a, [wMenuDataFlags]
	bit STATICMENU_CURSOR_F, a
	jr z, .cancel
	call InitVerticalMenuCursor
	call StaticMenuJoypad
	call MenuClickSound
	bit B_PAD_B, a
	jr z, .okay
.cancel
	scf
	ret

.okay
	and a
	ret

GetMenu2::
	call LoadMenuHeader
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	ret

CopyNameFromMenu::
	push hl
	push bc
	push af
	ld hl, wMenuDataPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	pop af
	call GetNthString
	ld d, h
	ld e, l
	call CopyName1
	pop bc
	pop hl
	ret

YesNoBox::
	lb bc, SCREEN_WIDTH - 6, 7

PlaceYesNoBox::
	jr _YesNoBox

PlaceGenericTwoOptionBox:: ; unreferenced
	call LoadMenuHeader
	jr InterpretTwoOptionMenu

_YesNoBox::
; Return nc (yes) or c (no).
	push bc
	ld hl, YesNoMenuHeader
	call CopyMenuHeader
	pop bc
; This seems to be an overflow prevention,
; but it was coded wrong.
	ld a, b
	cp SCREEN_WIDTH - 1 - 5
	jr nz, .okay ; should this be "jr nc"?
	ld a, SCREEN_WIDTH - 1 - 5
	ld b, a

.okay
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add 5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add 4
	ld [wMenuBorderBottomCoord], a
	call PushWindow

InterpretTwoOptionMenu::
	call VerticalMenu
	push af
	ld c, $f
	call DelayFrames
	call CloseWindow
	pop af
	jr c, .no
	ld a, [wMenuCursorY]
	cp 2 ; no
	jr z, .no
	and a
	ret

.no
	ld a, 2
	ld [wMenuCursorY], a
	scf
	ret

YesNoMenuHeader::
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 5, 15, 9
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_NO_TOP_SPACING ; flags
	db 2
	db "YES@"
	db "NO@"

OffsetMenuHeader::
	call _OffsetMenuHeader
	call PushWindow
	ret

_OffsetMenuHeader::
	push de
	call CopyMenuHeader
	pop de
	ld a, [wMenuBorderLeftCoord]
	ld h, a
	ld a, [wMenuBorderRightCoord]
	sub h
	ld h, a
	ld a, d
	ld [wMenuBorderLeftCoord], a
	add h
	ld [wMenuBorderRightCoord], a
	ld a, [wMenuBorderTopCoord]
	ld l, a
	ld a, [wMenuBorderBottomCoord]
	sub l
	ld l, a
	ld a, e
	ld [wMenuBorderTopCoord], a
	add l
	ld [wMenuBorderBottomCoord], a
	ret

DoNthMenu::
	call DrawVariableLengthMenuBox
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions
	call GetStaticMenuJoypad
	call GetMenuJoypad
	call MenuClickSound
	ret

SetUpMenu::
	call DrawVariableLengthMenuBox
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions
	ld hl, w2DMenuFlags1
	set _2DMENU_DISABLE_JOYPAD_FILTER_F, [hl]
	ret

DrawVariableLengthMenuBox::
	call CopyMenuData
	call GetMenuIndexSet
	call AutomaticGetMenuBottomCoord
	call MenuBox
	ret

MenuWriteText::
	xor a
	ldh [hBGMapMode], a
	call GetMenuIndexSet ; sort out the text
	call RunMenuItemPrintingFunction ; actually write it
	call SafeUpdateSprites
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ldh [hOAMUpdate], a
	ret

AutomaticGetMenuBottomCoord::
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld c, a
	ld a, [wMenuDataItems]
	add a
	inc a
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add b
	ld [wMenuBorderBottomCoord], a
	ret

GetMenuIndexSet::
	ld hl, wMenuDataIndicesPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wWhichIndexSet]
	and a
	jr z, .skip
	ld b, a
	ld c, -1
.loop
	ld a, [hli]
	cp c
	jr nz, .loop
	dec b
	jr nz, .loop

.skip
	ld d, h
	ld e, l
	ld a, [hl]
	ld [wMenuDataItems], a
	ret

RunMenuItemPrintingFunction::
	call MenuBoxCoord2Tile
	ld bc, 2 * SCREEN_WIDTH + 2
	add hl, bc
.loop
	inc de
	ld a, [de]
	cp -1
	ret z
	ld [wMenuSelection], a
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, wMenuDataDisplayFunctionPointer
	call ._hl_
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	jr .loop

._hl_
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

InitMenuCursorAndButtonPermissions::
	call InitVerticalMenuCursor
	ld hl, wMenuJoypadFilter
	ld a, [wMenuDataFlags]
	bit STATICMENU_ENABLE_START_F, a
	jr z, .disallow_start
	set B_PAD_START, [hl]

.disallow_start
	ld a, [wMenuDataFlags]
	bit STATICMENU_ENABLE_LEFT_RIGHT_F, a
	jr z, .disallow_left_right
	set B_PAD_LEFT, [hl]
	set B_PAD_RIGHT, [hl]

.disallow_left_right
	ret

GetScrollingMenuJoypad::
	call ScrollingMenuJoypad
	ld hl, wMenuJoypadFilter
	and [hl]
	jr ContinueGettingMenuJoypad

GetStaticMenuJoypad::
	xor a
	ld [wMenuJoypad], a
	call StaticMenuJoypad

ContinueGettingMenuJoypad:
	bit B_PAD_A, a
	jr nz, .a_button
	bit B_PAD_B, a
	jr nz, .b_start
	bit B_PAD_START, a
	jr nz, .b_start
	bit B_PAD_RIGHT, a
	jr nz, .d_right
	bit B_PAD_LEFT, a
	jr nz, .d_left
	xor a
	ld [wMenuJoypad], a
	jr .done

.d_right
	ld a, PAD_RIGHT
	ld [wMenuJoypad], a
	jr .done

.d_left
	ld a, PAD_LEFT
	ld [wMenuJoypad], a
	jr .done

.a_button
	ld a, PAD_A
	ld [wMenuJoypad], a

.done
	call GetMenuIndexSet
	ld a, [wMenuCursorY]
	ld l, a
	ld h, 0
	add hl, de
	ld a, [hl]
	ld [wMenuSelection], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorPosition], a
	and a
	ret

.b_start
	ld a, PAD_B
	ld [wMenuJoypad], a
	ld a, -1
	ld [wMenuSelection], a
	scf
	ret

PlaceMenuStrings::
	push de
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMenuSelection]
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret

PlaceNthMenuStrings::
	push de
	ld a, [wMenuSelection]
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret

GetNthMenuStrings:: ; unreferenced
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

MenuJumptable::
	ld a, [wMenuSelection]
	call GetMenuDataPointerTableEntry
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

GetMenuDataPointerTableEntry::
	ld e, a
	ld d, 0
	ld hl, wMenuDataPointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ret

ClearWindowData::
	ld hl, wMenuMetadata
	call .ClearMenuData
	ld hl, wMenuHeader
	call .ClearMenuData
	ld hl, wMenuData
	call .ClearMenuData
	ld hl, wMoreMenuData
	call .ClearMenuData

	ldh a, [rWBK]
	push af
	ld a, BANK(wWindowStack)
	ldh [rWBK], a

	xor a
	ld hl, wWindowStackBottom
	ld [hld], a
	ld [hld], a
	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a

	pop af
	ldh [rWBK], a
	ret

.ClearMenuData:
	ld bc, wMenuMetadataEnd - wMenuMetadata
	assert wMenuMetadataEnd - wMenuMetadata == wMenuHeaderEnd - wMenuHeader
	assert wMenuMetadataEnd - wMenuMetadata == wMenuDataEnd - wMenuData
	assert wMenuMetadataEnd - wMenuMetadata == wMoreMenuDataEnd - wMoreMenuData
	xor a
	call ByteFill
	ret

MenuClickSound::
	push af
	and PAD_A | PAD_B
	jr z, .nosound
	ld hl, wMenuFlags
	bit MENU_NO_CLICK_SFX_F, [hl]
	jr nz, .nosound
	call PlayClickSFX
.nosound
	pop af
	ret

PlayClickSFX::
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret

MenuTextboxWaitButton::
	call MenuTextbox
	call WaitButton
	call ExitMenu
	ret

Place2DMenuItemName::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call PlaceString
	pop af
	rst Bankswitch

	ret

_2DMenu::
	ldh a, [hROMBank]
	ld [wMenuData_2DMenuItemStringsBank], a
	farcall _2DMenu_
	ld a, [wMenuCursorPosition]
	ret

InterpretBattleMenu::
	ldh a, [hROMBank]
	ld [wMenuData_2DMenuItemStringsBank], a
	farcall _InterpretBattleMenu
	ld a, [wMenuCursorPosition]
	ret

InterpretMobileMenu:: ; unreferenced
	ldh a, [hROMBank]
	ld [wMenuData_2DMenuItemStringsBank], a
	farcall _InterpretMobileMenu
	ld a, [wMenuCursorPosition]
	ret
