; Functions used in displaying and handling menus.


LoadMenuDataHeader::
	call CopyMenuDataHeader
	call PushWindow
	ret

CopyMenuDataHeader::
	ld de, wMenuDataHeader
	ld bc, wMenuDataHeaderEnd - wMenuDataHeader
	call CopyBytes
	ld a, [hROMBank]
	ld [wMenuDataBank], a
	ret
; 0x1d4b

StoreTo_wMenuCursorBuffer:: ; 1d4b
	ld [wMenuCursorBuffer], a
	ret
; 1d4f


MenuTextBox:: ; 1d4f
	push hl
	call LoadMenuTextBox
	pop hl
	jp PrintText
; 1d57

ret_1d57:: ; 1d57
; unreferenced
	ret
; 1d58

LoadMenuTextBox:: ; 1d58
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ret
; 1d5f

.MenuDataHeader: ; 1d5f
	db $40 ; tile backup
	db 12, 0 ; start coords
	db 17, 19 ; end coords
	dw VTiles0
	db 0 ; default option
; 1d67

MenuTextBoxBackup:: ; 1d67
	call MenuTextBox
	call CloseWindow
	ret
; 1d6e

LoadStandardMenuDataHeader:: ; 1d6e
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ret
; 1d75

.MenuDataHeader: ; 1d75
	db $40 ; tile backup
	db 0, 0 ; start coords
	db 17, 19 ; end coords
	dw 0
	db 1 ; default option
; 1d7d

Call_ExitMenu:: ; 1d7d
	call ExitMenu
	ret
; 1d81

VerticalMenu::
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call PlaceVerticalMenuItems
	call ApplyTilemap
	call CopyMenuData2
	ld a, [wMenuData2Flags]
	bit 7, a
	jr z, .cancel
	call InitVerticalMenuCursor
	call StaticMenuJoypad
	call MenuClickSound
	bit 1, a
	jr z, .okay
.cancel
	scf
	ret

.okay
	and a
	ret
; 0x1dab

GetMenu2:: ; 1dab
	call LoadMenuDataHeader
	call VerticalMenu
	call CloseWindow
	ld a, [wMenuCursorY]
	ret
; 1db8

CopyNameFromMenu::
	push hl
	push bc
	push af
	ld hl, wMenuData2Pointer
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
; 0x1dcf


YesNoBox:: ; 1dcf
	lb bc, SCREEN_WIDTH - 6, 7

PlaceYesNoBox:: ; 1dd2
	jr _YesNoBox

PlaceGenericTwoOptionBox:: ; 1dd4
	call LoadMenuDataHeader
	jr InterpretTwoOptionMenu

_YesNoBox:: ; 1dd9
; Return nc (yes) or c (no).
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
; This seems to be an overflow prevention, but
; it was coded wrong.
	ld a, b
	cp SCREEN_WIDTH - 6
	jr nz, .okay ; should this be "jr nc"?
	ld a, SCREEN_WIDTH - 6
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

InterpretTwoOptionMenu:: ; 1dfe
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
; 1e1d

YesNoMenuDataHeader:: ; 1e1d
	db $40 ; tile backup
	db 5, 10 ; start coords
	db 9, 15 ; end coords
	dw .MenuData2
	db 1 ; default option
; 1e25

.MenuData2: ; 1e25
	db $c0 ; flags
	db 2
	db "YES@"
	db "NO@"
; 1e2e

OffsetMenuDataHeader:: ; 1e2e
	call _OffsetMenuDataHeader
	call PushWindow
	ret
; 1e35

_OffsetMenuDataHeader:: ; 1e35
	push de
	call CopyMenuDataHeader
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
; 1e5d

DoNthMenu:: ; 1e5d
	call DrawVariableLengthMenuBox
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions
	call GetStaticMenuJoypad
	call GetMenuJoypad
	call MenuClickSound
	ret
; 1e70

SetUpMenu:: ; 1e70
	call DrawVariableLengthMenuBox ; ???
	call MenuWriteText
	call InitMenuCursorAndButtonPermissions ; set up selection pointer
	ld hl, w2DMenuFlags1
	set 7, [hl]
	ret

DrawVariableLengthMenuBox::
	call CopyMenuData2
	call GetMenuIndexSet
	call AutomaticGetMenuBottomCoord
	call MenuBox
	ret

MenuWriteText::
	xor a
	ld [hBGMapMode], a
	call GetMenuIndexSet ; sort out the text
	call RunMenuItemPrintingFunction ; actually write it
	call SafeUpdateSprites
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call ApplyTilemap
	pop af
	ld [hOAMUpdate], a
	ret
; 0x1ea6

AutomaticGetMenuBottomCoord:: ; 1ea6
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderRightCoord]
	sub c
	ld c, a
	ld a, [wMenuData2Items]
	add a
	inc a
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add b
	ld [wMenuBorderBottomCoord], a
	ret
; 1ebd

GetMenuIndexSet:: ; 1ebd
	ld hl, wMenuData2IndicesPointer
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
	ld [wMenuData2Items], a
	ret
; 1eda

RunMenuItemPrintingFunction:: ; 1eda
	call MenuBoxCoord2Tile
	ld bc, 2 * SCREEN_WIDTH + 2
	add hl, bc
.loop
	inc de
	ld a, [de]
	cp -1
	ret z
	ld [MenuSelection], a
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, wMenuData2DisplayFunctionPointer
	call ._hl_
	pop hl
	ld de, 2 * SCREEN_WIDTH
	add hl, de
	pop de
	jr .loop
; 1efb

._hl_ ; 1efb
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 1eff

InitMenuCursorAndButtonPermissions:: ; 1eff
	call InitVerticalMenuCursor
	ld hl, wMenuJoypadFilter
	ld a, [wMenuData2Flags]
	bit 3, a
	jr z, .disallow_select
	set START_F, [hl]

.disallow_select
	ld a, [wMenuData2Flags]
	bit 2, a
	jr z, .disallow_left_right
	set D_LEFT_F, [hl]
	set D_RIGHT_F, [hl]

.disallow_left_right
	ret
; 1f1a


GetScrollingMenuJoypad:: ; 1f1a
	call ScrollingMenuJoypad
	ld hl, wMenuJoypadFilter
	and [hl]
	jr ContinueGettingMenuJoypad
; 1f23

GetStaticMenuJoypad:: ; 1f23
	xor a
	ld [wMenuJoypad], a
	call StaticMenuJoypad
; 1f2a

ContinueGettingMenuJoypad:
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_start
	bit START_F, a
	jr nz, .b_start
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	xor a
	ld [wMenuJoypad], a
	jr .done

.d_right
	ld a, D_RIGHT
	ld [wMenuJoypad], a
	jr .done

.d_left
	ld a, D_LEFT
	ld [wMenuJoypad], a
	jr .done

.a_button
	ld a, A_BUTTON
	ld [wMenuJoypad], a

.done
	call GetMenuIndexSet
	ld a, [wMenuCursorY]
	ld l, a
	ld h, $0
	add hl, de
	ld a, [hl]
	ld [MenuSelection], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorBuffer], a
	and a
	ret

.b_start
	ld a, B_BUTTON
	ld [wMenuJoypad], a
	ld a, -1
	ld [MenuSelection], a
	scf
	ret
; 1f79

PlaceMenuStrings:: ; 1f79
	push de
	ld hl, wMenuData2PointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MenuSelection]
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret
; 1f8d

PlaceNthMenuStrings:: ; 1f8d
	push de
	ld a, [MenuSelection]
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	call PlaceString
	ret
; 1f9e

Function1f9e:: ; 1f9e
; unreferenced
	call GetMenuDataPointerTableEntry
	inc hl
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 1fa7

MenuJumptable:: ; 1fa7
	ld a, [MenuSelection]
	call GetMenuDataPointerTableEntry
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 1fb1

GetMenuDataPointerTableEntry:: ; 1fb1
	ld e, a
	ld d, $0
	ld hl, wMenuData2PointerTableAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ret
; 1fbf

ClearWindowData:: ; 1fbf
	ld hl, wWindowStackPointer
	call .bytefill
	ld hl, wMenuDataHeader
	call .bytefill
	ld hl, wMenuData2Flags
	call .bytefill
	ld hl, w2DMenuCursorInitY
	call .bytefill

	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a

	xor a
	ld hl, wWindowStackBottom
	ld [hld], a
	ld [hld], a
	ld a, l
	ld [wWindowStackPointer], a
	ld a, h
	ld [wWindowStackPointer + 1], a

	pop af
	ld [rSVBK], a
	ret
; 1ff0

.bytefill ; 1ff0
	ld bc, $0010
	xor a
	call ByteFill
	ret
; 1ff8

MenuClickSound:: ; 1ff8
	push af
	and A_BUTTON | B_BUTTON
	jr z, .nosound
	ld hl, wMenuFlags
	bit 3, [hl]
	jr nz, .nosound
	call PlayClickSFX
.nosound
	pop af
	ret
; 2009


PlayClickSFX:: ; 2009
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 0x2012

MenuTextBoxWaitButton:: ; 2012
	call MenuTextBox
	call WaitButton
	call ExitMenu
	ret
; 201c

Place2DMenuItemName:: ; 201c
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call PlaceString
	pop af
	rst Bankswitch

	ret
; 202a

_2DMenu:: ; 202a
	ld a, [hROMBank]
	ld [wMenuData2_2DMenuItemStringsBank], a
	callba _2DMenu_
	ld a, [wMenuCursorBuffer]
	ret
; 2039

InterpretBattleMenu:: ; 2039
	ld a, [hROMBank]
	ld [wMenuData2_2DMenuItemStringsBank], a
	callba _InterpretBattleMenu
	ld a, [wMenuCursorBuffer]
	ret
; 2048

InterpretMobileMenu:: ; 2048
	ld a, [hROMBank]
	ld [wMenuData2_2DMenuItemStringsBank], a
	callba _InterpretMobileMenu
	ld a, [wMenuCursorBuffer]
	ret
; 2057
