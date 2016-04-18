PushWindow:: ; 1c00
	callab _PushWindow
	ret
; 1c07

ExitMenu:: ; 0x1c07
	push af
	callab _ExitMenu
	pop af
	ret

InitVerticalMenuCursor:: ; 0x1c10
	callab _InitVerticalMenuCursor
	ret

CloseWindow:: ; 0x1c17
	push af
	call ExitMenu
	call ApplyTilemap
	call UpdateSprites
	pop af
	ret

RestoreTileBackup:: ; 0x1c23
	call MenuBoxCoord2Tile
	call .copy
	call MenuBoxCoord2Attr
	call .copy
	ret
; 0x1c30

.copy ; 0x1c30
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
	jr nz, .col ; 0x1c3b $fa

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row ; 0x1c44 $ef

	ret

PopWindow:: ; 0x1c47
	ld b, $10
	ld de, wMenuFlags
.loop
	ld a, [hld]
	ld [de], a
	inc de
	dec b
	jr nz, .loop ; 0x1c50 $fa
	ret

GetMenuBoxDims:: ; 0x1c53
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
; 0x1c66

CopyMenuData2:: ; 1c66
	push hl
	push de
	push bc
	push af
	ld hl, wMenuData2Pointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMenuData2Flags
	ld bc, wMenuData2End - wMenuData2Flags
	call CopyBytes
	pop af
	pop bc
	pop de
	pop hl
	ret
; 1c7e

GetWindowStackTop:: ; 1c7e
	ld hl, wWindowStackPointer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 1c89

PlaceVerticalMenuItems:: ; 1c89
	call CopyMenuData2
	ld hl, wMenuData2Pointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	call GetMenuTextStartCoord
	call Coord2Tile ; hl now contains the TileMap address where we will start printing text.
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

	ld a, [wMenuData2Flags]
	bit 4, a
	ret z

	call MenuBoxCoord2Tile
	ld a, [de]
	ld c, a
	inc de
	ld b, $0
	add hl, bc
	jp PlaceString
; 1cbb

MenuBox:: ; 1cbb
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	jp TextBox
; 1cc6

GetMenuTextStartCoord:: ; 1cc6
	ld a, [wMenuBorderTopCoord]
	ld b, a
	inc b
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	inc c
; bit 6: if not set, leave extra room on top
	ld a, [wMenuData2Flags]
	bit 6, a
	jr nz, .bit_6_set
	inc b

.bit_6_set
; bit 7: if set, leave extra room on the left
	ld a, [wMenuData2Flags]
	bit 7, a
	jr z, .bit_7_clear
	inc c

.bit_7_clear
	ret
; 1ce1

ClearMenuBoxInterior:: ; 1ce1
	call MenuBoxCoord2Tile
	ld bc, SCREEN_WIDTH + 1
	add hl, bc
	call GetMenuBoxDims
	dec b
	dec c
	call ClearBox
	ret
; 1cf1

ClearWholeMenuBox:: ; 1cf1
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	inc c
	inc b
	call ClearBox
	ret
; 1cfd


MenuBoxCoord2Tile:: ; 1cfd
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a
; 1d05


Coord2Tile:: ; 1d05
; Return the address of TileMap(c, b) in hl.
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
; 1d19

MenuBoxCoord2Attr:: ; 1d19
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a

Coord2Attr:: ; 1d21
; Return the address of AttrMap(c, b) in hl.
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
	bccoord 0, 0, AttrMap
	add hl, bc
	ret
; 1d35
