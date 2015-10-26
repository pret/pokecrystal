BackUpTiles:: ; 1c00
	callab _BackUpTiles
	ret
; 1c07

ExitMenu:: ; 0x1c07
	push af
	callab Function243e8
	pop af
	ret

Function1c10:: ; 0x1c10
	callab Function2446d
	ret

WriteBackup:: ; 0x1c17
	push af
	call ExitMenu
	call Function321c
	call UpdateSprites
	pop af
	ret

RestoreTileBackup:: ; 0x1c23
	call GetMemTileCoord
	call .copy
	call GetMemAttrCoord
	call .copy
	ret
; 0x1c30

.copy: ; 0x1c30
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

Function1c47:: ; 0x1c47
	ld b, $10
	ld de, wcf81
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

Function1c66:: ; 1c66
	push hl
	push de
	push bc
	push af
	ld hl, wcf86
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wcf91
	ld bc, $0010
	call CopyBytes
	pop af
	pop bc
	pop de
	pop hl
	ret
; 1c7e

Function1c7e:: ; 1c7e
	ld hl, wcf71
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 1c89

Function1c89:: ; 1c89
	call Function1c66
	ld hl, wcf86
	ld e, [hl]
	inc hl
	ld d, [hl]
	call Function1cc6
	call GetTileCoord
	inc de
	ld a, [de]
	inc de
	ld b, a
.asm_1c9c
	push bc
	call PlaceString
	inc de
	ld bc, $0028
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1c9c
	ld a, [wcf91]
	bit 4, a
	ret z
	call GetMemTileCoord
	ld a, [de]
	ld c, a
	inc de
	ld b, $0
	add hl, bc
	jp PlaceString
; 1cbb

Function1cbb:: ; 1cbb
	call GetMemTileCoord
	call GetMenuBoxDims
	dec b
	dec c
	jp TextBox
; 1cc6

Function1cc6:: ; 1cc6
	ld a, [wMenuBorderTopCoord]
	ld b, a
	inc b
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	inc c
	ld a, [wcf91]
	bit 6, a
	jr nz, .asm_1cd8
	inc b

.asm_1cd8
	ld a, [wcf91]
	bit 7, a
	jr z, .asm_1ce0
	inc c

.asm_1ce0
	ret
; 1ce1

Function1ce1:: ; 1ce1
	call GetMemTileCoord
	ld bc, $0015
	add hl, bc
	call GetMenuBoxDims
	dec b
	dec c
	call ClearBox
	ret
; 1cf1

Function1cf1:: ; 1cf1
	call GetMemTileCoord
	call GetMenuBoxDims
	inc c
	inc b
	call ClearBox
	ret
; 1cfd


GetMemTileCoord:: ; 1cfd
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a
; 1d05


GetTileCoord:: ; 1d05
; Return the address of TileMap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l
rept 2
	add hl, hl
endr
	add hl, bc
rept 2
	add hl, hl
endr
	ld c, a
	xor a
	ld b, a
	add hl, bc
	bccoord 0, 0
	add hl, bc
	ret
; 1d19

GetMemAttrCoord:: ; 1d19
	ld a, [wMenuBorderLeftCoord]
	ld c, a
	ld a, [wMenuBorderTopCoord]
	ld b, a

GetAttrCoord:: ; 1d21
; Return the address of AttrMap(c, b) in hl.
	xor a
	ld h, a
	ld l, b
	ld a, c
	ld b, h
	ld c, l
rept 2
	add hl, hl
endr
	add hl, bc
rept 2
	add hl, hl
endr
	ld c, a
	xor a
	ld b, a
	add hl, bc
	bccoord 0, 0, AttrMap
	add hl, bc
	ret
; 1d35
