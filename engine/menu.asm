_2DMenu_:: ; 2400e
	ld hl, CopyMenuData2
	ld a, [wMenuData2_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	call UpdateSprites
	call ApplyTilemap
	call Get2DMenuSelection
	ret
; 24022

_InterpretBattleMenu:: ; 24022
	ld hl, CopyMenuData2
	ld a, [wMenuData2_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	callba MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	call Get2DMenuSelection
	ret
; 2403c

_InterpretMobileMenu:: ; 2403c
	ld hl, CopyMenuData2
	ld a, [wMenuData2_2DMenuItemStringsBank]
	rst FarCall

	call Draw2DMenu
	callba MobileTextBorder
	call UpdateSprites
	call ApplyTilemap
	call Init2DMenuCursorPosition
	ld hl, w2DMenuFlags1
	set 7, [hl]
.loop
	call DelayFrame
	callba Function10032e
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
	ld [wMenuCursorBuffer], a
	and a
	ret
; 24085



Draw2DMenu: ; 24085
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call Place2DMenuItemStrings
	ret
; 2408f

Get2DMenuSelection: ; 2408f
	call Init2DMenuCursorPosition
	call StaticMenuJoypad
	call MenuClickSound
Mobile_GetMenuSelection: ; 24098
	ld a, [wMenuData2Flags]
	bit 1, a
	jr z, .skip
	call GetMenuJoypad
	bit SELECT_F, a
	jr nz, .quit1

.skip
	ld a, [wMenuData2Flags]
	bit 0, a
	jr nz, .skip2
	call GetMenuJoypad
	bit B_BUTTON_F, a
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
	ld [wMenuCursorBuffer], a
	and a
	ret

.quit1
	scf
	ret

.quit2
	scf
	ret
; 240cd

GetMenuNumberOfColumns: ; 240cd
	ld a, [wMenuData2Items]
	and $f
	ret
; 240d3

GetMenuNumberOfRows: ; 240d3
	ld a, [wMenuData2Items]
	swap a
	and $f
	ret
; 240db

Place2DMenuItemStrings: ; 240db
	ld hl, wMenuData2_2DMenuItemStringsAddr
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile
	call GetMenuNumberOfRows
	ld b, a
.row
	push bc
	push hl
	call GetMenuNumberOfColumns
	ld c, a
.col
	push bc
	ld a, [wMenuData2_2DMenuItemStringsBank]
	call Place2DMenuItemName
	inc de
	ld a, [wMenuData2Spacing]
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
	ld hl, wMenuData2_2DMenuFunctionAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	ret z
	ld a, [wMenuData2_2DMenuFunctionBank]
	rst FarCall
	ret
; 2411a


Init2DMenuCursorPosition: ; 2411a (9:411a)
	call GetMenuTextStartCoord
	ld a, b
	ld [w2DMenuCursorInitY], a
	dec c
	ld a, c
	ld [w2DMenuCursorInitX], a
	call GetMenuNumberOfRows
	ld [w2DMenuNumRows], a
	call GetMenuNumberOfColumns
	ld [w2DMenuNumCols], a
	call .InitFlags_a
	call .InitFlags_b
	call .InitFlags_c
	ld a, [w2DMenuNumCols]
	ld e, a
	ld a, [wMenuCursorBuffer]
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
; 24179

.InitFlags_a: ; 24179
	xor a
	ld hl, w2DMenuFlags1
	ld [hli], a
	ld [hld], a
	ld a, [wMenuData2Flags]
	bit 5, a
	ret z
	set 5, [hl]
	set 4, [hl]
	ret
; 2418a

.InitFlags_b: ; 2418a
	ld a, [wMenuData2Spacing]
	or $20
	ld [w2DMenuCursorOffsets], a
	ret
; 24193

.InitFlags_c: ; 24193
	ld hl, wMenuData2Flags
	ld a, A_BUTTON
	bit 0, [hl]
	jr nz, .skip
	or B_BUTTON
.skip
	bit 1, [hl]
	jr z, .skip2
	or SELECT
.skip2
	ld [wMenuJoypadFilter], a
	ret
; 241a8


_StaticMenuJoypad:: ; 241a8
	call Place2DMenuCursor
_ScrollingMenuJoypad:: ; 241ab
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call MenuJoypadLoop
	pop af
	ld [hBGMapMode], a
	ret
; 241ba

MobileMenuJoypad: ; 241ba
	ld hl, w2DMenuFlags2
	res 7, [hl]
	ld a, [hBGMapMode]
	push af
	call Move2DMenuCursor
	call Do2DMenuRTCJoypad
	jr nc, .skip_joypad
	call _2DMenuInterpretJoypad
.skip_joypad
	pop af
	ld [hBGMapMode], a
	call GetMenuJoypad
	ld c, a
	ret
; 241d5


Function241d5: ; 241d5
; Unreferenced
	call Place2DMenuCursor
.loop
	call Move2DMenuCursor
	call HDMATransferTileMapToWRAMBank3 ; BUG: This function is in another bank.
	                    ; Pointer in current bank (9) is bogus.
	call .loop2
	jr nc, .done
	call _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
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
	call AdvanceMobileInactivityTimerAndCheckExpired ; BUG: This function is in another bank.
	                    ; Pointer in current bank (9) is bogus.
	ret c
	callba Function100337
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loop2
	and a
	ret
; 24216


MenuJoypadLoop: ; 24216
.loop
	call Move2DMenuCursor
	call .BGMap_OAM
	call Do2DMenuRTCJoypad
	jr nc, .done
	call _2DMenuInterpretJoypad
	jr c, .done
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr nz, .done
	call GetMenuJoypad
	ld b, a
	ld a, [wMenuJoypadFilter]
	and b
	jr z, .loop

.done
	ret
; 24238

.BGMap_OAM: ; 24238
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a
	call WaitBGMap
	pop af
	ld [hOAMUpdate], a
	xor a
	ld [hBGMapMode], a
	ret
; 24249

Do2DMenuRTCJoypad: ; 24249
.loopRTC
	call RTC
	call Menu_WasButtonPressed
	ret c
	ld a, [w2DMenuFlags1]
	bit 7, a
	jr z, .loopRTC
	and a
	ret
; 24259

Menu_WasButtonPressed: ; 24259
	ld a, [w2DMenuFlags1]
	bit 6, a
	jr z, .skip_to_joypad
	callab PlaySpriteAnimationsAndDelayFrame

.skip_to_joypad
	call JoyTextDelay
	call GetMenuJoypad
	and a
	ret z
	scf
	ret
; 24270

_2DMenuInterpretJoypad: ; 24270
	call GetMenuJoypad
	bit A_BUTTON_F, a
	jp nz, .a_b_start_select
	bit B_BUTTON_F, a
	jp nz, .a_b_start_select
	bit SELECT_F, a
	jp nz, .a_b_start_select
	bit START_F, a
	jp nz, .a_b_start_select
	bit D_RIGHT_F, a
	jr nz, .d_right
	bit D_LEFT_F, a
	jr nz, .d_left
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and a
	ret

.set_bit_7 ; 24299
	ld hl, w2DMenuFlags2
	set 7, [hl]
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
	bit 5, a
	jr nz, .wrap_around_down
	bit 3, a
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
	bit 5, a
	jr nz, .wrap_around_up
	bit 2, a
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
	bit 4, a
	jr nz, .wrap_around_left
	bit 1, a
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
	bit 4, a
	jr nz, .wrap_around_right
	bit 0, a
	jp nz, .set_bit_7
	xor a
	ret

.wrap_around_right
	ld [hl], $1
	xor a
	ret
; 24318

.a_b_start_select ; 24318
	xor a
	ret
; 2431a

Move2DMenuCursor: ; 2431a
	ld hl, wCursorCurrentTile
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	cp "▶"
	jr nz, Place2DMenuCursor
	ld a, [wCursorOffCharacter]
	ld [hl], a
Place2DMenuCursor: ; 24329
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
; 24374

_PushWindow:: ; 24374
	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a

	ld hl, wWindowStackPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld b, $10
	ld hl, wMenuFlags
.loop
	ld a, [hli]
	ld [de], a
	dec de
	dec b
	jr nz, .loop

; If bit 6 or 7 of the menu flags is set, set bit 0 of the address
; at 7:[wWindowStackPointer], and draw the menu using the coordinates from the header.
; Otherwise, reset bit 0 of 7:[wWindowStackPointer].
	ld a, [wMenuFlags]
	bit 6, a
	jr nz, .bit_6
	bit 7, a
	jr z, .not_bit_7

.bit_6
	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	set 0, [hl]
	call MenuBoxCoord2Tile
	call .copy
	call MenuBoxCoord2Attr
	call .copy
	jr .done

.not_bit_7
	pop hl ; last-pushed register was de
	push hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res 0, [hl]

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
	ld [rSVBK], a
	ld hl, wWindowStackSize
	inc [hl]
	ret
; 243cd

.copy ; 243cd
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
; 243e7

.ret ; 243e7
	ret
; 243e8

_ExitMenu:: ; 243e8
	xor a
	ld [hBGMapMode], a

	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a

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
	bit 0, a
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
	ld [rSVBK], a
	ld hl, wWindowStackSize
	dec [hl]
	ret
; 24423

Function24423: ; 24423
; Unreferenced
	ld a, [VramState]
	bit 0, a
	ret z
	xor a
	call GetSRAMBank
	hlcoord 0, 0
	ld de, sScratch
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	call CloseSRAM
	call OverworldTextModeSwitch
	xor a
	call GetSRAMBank
	ld hl, sScratch
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
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
; 2445d

Error_Cant_ExitMenu: ; 2445d
	ld hl, .Text_NoWindowsAvailableForPopping
	call PrintText
	call WaitBGMap
.InfiniteLoop:
	jr .InfiniteLoop
; 24468

.Text_NoWindowsAvailableForPopping: ; 24468
	text_jump UnknownText_0x1c46b7
	db "@"
; 2446d

_InitVerticalMenuCursor:: ; 2446d
	ld a, [wMenuData2Flags]
	ld b, a
	ld hl, w2DMenuCursorInitY
	ld a, [wMenuBorderTopCoord]
	inc a
	bit 6, b
	jr nz, .skip_offset
	inc a
.skip_offset
	ld [hli], a
; w2DMenuCursorInitX
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld [hli], a
; w2DMenuNumRows
	ld a, [wMenuData2Items]
	ld [hli], a
; w2DMenuNumCols
	ld a, 1
	ld [hli], a
; w2DMenuFlags1
	ld [hl], $0
	bit 5, b
	jr z, .skip_bit_5
	set 5, [hl]
.skip_bit_5
	ld a, [wMenuFlags]
	bit 4, a
	jr z, .skip_bit_6
	set 6, [hl]
.skip_bit_6
	inc hl
; w2DMenuFlags2
	xor a
	ld [hli], a
; w2DMenuCursorOffsets
	ln a, 2, 0
	ld [hli], a
; wMenuJoypadFilter
	ld a, A_BUTTON
	bit 0, b
	jr nz, .skip_bit_1
	add B_BUTTON
.skip_bit_1
	ld [hli], a
; wMenuCursorY
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .load_at_the_top
	ld c, a
	ld a, [wMenuData2Items]
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
; 244c3
