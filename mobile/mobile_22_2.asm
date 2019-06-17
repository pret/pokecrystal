Function8b342::
; Loads the map data pointer, then runs through a
; dw with three dummy functions. Spends a lot of energy
; doing pretty much nothing.
	call GetMapAttributesPointer
	ld d, h
	ld e, l

; Everything between here and "ret" is useless.
	xor a
.loop
	push af
	ld hl, .dw
	rst JumpTable
	pop af
	inc a
	cp 3
	jr nz, .loop
	ret

.dw
	dw .zero
	dw .one
	dw .two

.zero
	ret

.one
	ret

.two
	ret

Function8b35d:
	ld a, h
	cp d
	ret nz
	ld a, l
	cp e
	ret

Function8b363:
	push bc
	farcall Mobile_AlwaysReturnNotCarry
	pop bc
	ret

Function8b36c:
	; [bc + (0:4)] = -1
	push bc
	ld h, b
	ld l, c
	ld bc, 4
	ld a, -1
	call ByteFill
	pop bc
	ret

Function8b379:
	; d = [bc + e]
	push bc
	ld a, c
	add e
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [bc]
	ld d, a
	pop bc
	ret

Function8b385:
	; [bc + e] = d
	push bc
	ld a, c
	add e
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, d
	ld [bc], a
	pop bc
	ret

Function8b391:
	; find first e in range(4) such that [bc + e] == -1
	; if none exist, return carry
	push bc
	ld e, 0
	ld d, 4
.loop
	ld a, [bc]
	inc bc
	cp -1
	jr z, .done
	inc e
	dec d
	jr nz, .loop
	dec e
	scf
.done
	pop bc
	ret

Function8b3a4:
	; strcmp(hl, bc, 4)
	push de
	push bc
	ld d, b
	ld e, c
	ld c, 4
	call Function89185
	pop bc
	pop de
	ret

Function8b3b0:
	ld bc, $a037 ; 4:a037
	ld a, [$a60b]
	and a
	jr z, .asm_8b3c2
	cp $3
	jr nc, .asm_8b3c2
	call Function8b391
	jr c, .asm_8b3c9
.asm_8b3c2
	call Function8b36c
	xor a
	ld [$a60b], a
.asm_8b3c9
	ld a, [$a60b]
	ret

Function8b3cd:
	push de
	push bc
	ld e, $4
.asm_8b3d1
	ld a, [bc]
	inc bc
	call Function8998b
	inc hl
	dec e
	jr nz, .asm_8b3d1
	pop bc
	pop de
	ret

Function8b3dd:
	push de
	push bc
	call JoyTextDelay_ForcehJoyDown ; joypad
	ld a, c
	pop bc
	pop de
	bit A_BUTTON_F, a
	jr nz, .a_button
	bit B_BUTTON_F, a
	jr nz, .b_button
	bit D_UP_F, a
	jr nz, .d_up
	bit D_DOWN_F, a
	jr nz, .d_down
	and a
	ret

.a_button
	ld a, e
	cp $3
	jr z, .e_is_zero
	inc e
	ld d, 0
	call Function8b385
	xor a
	ld [wd010], a
	ret

.e_is_zero
	call PlayClickSFX
	ld d, $0
	scf
	ret

.b_button
	ld a, e
	and a
	jr nz, .e_is_not_zero
	call PlayClickSFX
	ld d, -1
	call Function8b385
	ld d, 1
	scf
	ret

.e_is_not_zero
	ld d, -1
	call Function8b385
	dec e
	xor a
	ld [wd010], a
	ret

.d_up
	call Function8b379
	ld a, d
	cp $a
	jr c, .less_than_10_up_1
	ld d, $9
.less_than_10_up_1
	inc d
	ld a, d
	cp $a
	jr c, .less_than_10_up_2
	ld d, $0
.less_than_10_up_2
	call Function8b385
	xor a
	ld [wd010], a
	ret

.d_down
	call Function8b379
	ld a, d
	cp $a
	jr c, .less_than_10_down
	ld d, $0
.less_than_10_down
	ld a, d
	dec d
	and a
	jr nz, .nonzero_down
	ld d, $9
.nonzero_down
	call Function8b385
	xor a
	ld [wd010], a
	ret

Function8b45c:
	call Function8b36c
	xor a
	ld [wd010], a
	ld [wd012], a
	call Function8b391
	ld d, $0
	call Function8b385
.asm_8b46e
	call Mobile22_SetBGMapMode0
	call Function8b493
	call Function8b4cc
	call Function8b518
	call Function89b78
	push bc
	call Function8b4fd
	call Function89c44
	ld a, $1
	ldh [hBGMapMode], a
	pop bc
	call Function8b3dd
	jr nc, .asm_8b46e
	ld a, d
	and a
	ret z
	scf
	ret

Function8b493:
	push bc
	call Mobile22_SetBGMapMode0
	call Function8b521
	ld hl, Jumptable_8b4a0
	pop bc
	rst JumpTable
	ret

Jumptable_8b4a0:
	dw Function8b4a4
	dw Function8b4b8

Function8b4a4:
	push bc
	push de
	call Function8b4d8
	call Textbox
	pop de
	pop bc
	call Function8b4cc
	call Function8b518
	call Function8b3cd
	ret

Function8b4b8:
	push bc
	push de
	call Function8b4ea
	call Function89b3b
	pop de
	pop bc
	call Function8b4cc
	call Function8b518
	call Function8b3cd
	ret

Function8b4cc:
	push bc
	ld hl, Unknown_8b529
	call Function8b50a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc
	ret

Function8b4d8:
	ld hl, Unknown_8b529
	call Function8b50a
	push hl
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Function8b4ea:
	ld hl, Unknown_8b529
	call Function8b50a
	push hl
	inc hl
	inc hl
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	ret

Function8b4fd:
	ld hl, Unknown_8b529 + 4
	call Function8b50a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld d, a
	ret

Function8b50a:
	ld a, [wd02e]
	and a
	ret z
	ld b, $0
	ld c, $8
.asm_8b513
	add hl, bc
	dec a
	jr nz, .asm_8b513
	ret

Function8b518:
	push de
	ld d, $0
	ld e, $14
	add hl, de
	inc hl
	pop de
	ret

Function8b521:
	ld hl, Unknown_8b529 + 7
	call Function8b50a
	ld a, [hl]
	ret

Unknown_8b529:
	dwcoord 2, 5
	db 1, 4, $20, $49, 0, 1
	dwcoord 7, 4
	db 1, 4, $48, $41, 0, 0

Function8b539:
	ld bc, wd017
	call Function8b36c
	xor a
	ld [wd012], a
	ld [wd02e], a
	call Function8b493
	call Function8b4fd
	ld e, $0
	call Function89c44
	call CGBOnly_CopyTilemapAtOnce
	ret

Function8b555:
.loop
	ld hl, UnknownText_0x8b5ce
	call PrintText
	ld bc, wd017
	call Function8b45c
	jr c, .asm_8b5c8
	call Function89448
	ld bc, wd017
	call Function8b493
	ld bc, wd017
	call Function8b664
	jr nz, .asm_8b57c
	ld hl, UnknownText_0x8b5e2
	call PrintText
	jr .loop

.asm_8b57c
	ld hl, UnknownText_0x8b5d3
	call PrintText
	ld bc, wd013
	call Function8b45c
	jr c, .loop
	ld bc, wd017
	ld hl, wd013
	call Function8b3a4
	jr z, .strings_equal
	call Function89448
	ld bc, wd013
	call Function8b493
	ld hl, UnknownText_0x8b5d8
	call PrintText
	jr .asm_8b57c

.strings_equal
	call OpenSRAMBank4
	ld hl, wd013
	ld de, $a037 ; 4:a037
	ld bc, $4
	call CopyBytes
	call CloseSRAM
	call Function89448
	ld bc, wd013
	call Function8b493
	ld hl, UnknownText_0x8b5dd
	call PrintText
	and a
.asm_8b5c8
	push af
	call Function89448
	pop af
	ret

UnknownText_0x8b5ce:
	; Please enter any four-digit number.
	text_far _EnterNewPasscodeText
	text_end

UnknownText_0x8b5d3:
	; Enter the same number to confirm.
	text_far _ConfirmPasscodeText
	text_end

UnknownText_0x8b5d8:
	; That's not the same number.
	text_far _PasscodesNotSameText
	text_end

UnknownText_0x8b5dd:
	; Your PASSCODE has been set. Enter this number next time to open the CARD FOLDER.
	text_far _PasscodeSetText
	text_end

UnknownText_0x8b5e2:
	; 0000 is invalid!
	text_far _FourZerosInvalidText
	text_end

Function8b5e7:
	ld bc, wd013
	call Function8b36c
	xor a
	ld [wd012], a
	ld [wd02e], a
	call Function8b493
	call Function891ab
	call Function8b4fd
	ld e, $0
	call Function89c44
.asm_8b602
	ld hl, UnknownText_0x8b642
	call PrintText
	ld bc, wd013
	call Function8b45c
	jr c, .asm_8b63c
	call Function89448
	ld bc, wd013
	call Function8b493
	call OpenSRAMBank4
	ld hl, $a037 ; 4:a037
	call Function8b3a4
	call CloseSRAM
	jr z, .asm_8b635
	ld hl, UnknownText_0x8b647
	call PrintText
	ld bc, wd013
	call Function8b36c
	jr .asm_8b602
.asm_8b635
	ld hl, UnknownText_0x8b64c
	call PrintText
	and a
.asm_8b63c
	push af
	call Function89448
	pop af
	ret

UnknownText_0x8b642:
	; Enter the CARD FOLDER PASSCODE.
	text_far _EnterPasscodeText
	text_end

UnknownText_0x8b647:
	; Incorrect PASSCODE!
	text_far _IncorrectPasscodeText
	text_end

UnknownText_0x8b64c:
	; CARD FOLDER open.@ @
	text_far _CardFolderOpenText
	text_asm
	ld de, SFX_TWINKLE
	call PlaySFX
	call WaitSFX
	ld c, $8
	call DelayFrames
	ld hl, .string_8b663
	ret

.string_8b663
	text_end

Function8b664:
	push bc
	ld de, $4
.asm_8b668
	ld a, [bc]
	cp $0
	jr nz, .asm_8b66e
	inc d
.asm_8b66e
	inc bc
	dec e
	jr nz, .asm_8b668
	pop bc
	ld a, d
	cp $4
	ret

Function8b677:
	call ClearBGPalettes
	call DisableLCD
	call Function8b690
	call Function8b6bb
	call Function8b6ed
	call EnableLCD
	call Function891ab
	call SetPalettes
	ret

Function8b690:
	ld hl, GFX_17afa5 + $514
	ld de, vTiles2
	ld bc, $160
	ld a, BANK(GFX_17afa5)
	call FarCopyBytes
	ld hl, GFX_17afa5 + $514 + $160 - $10
	ld de, vTiles2 tile $61
	ld bc, $10
	ld a, BANK(GFX_17afa5)
	call FarCopyBytes
	ld hl, GFX_17afa5 + $514 + $160
	ld de, vTiles0 tile $ee
	ld bc, $10
	ld a, BANK(GFX_17afa5)
	call FarCopyBytes
	ret

Function8b6bb:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, Palette_8b6d5
	ld de, wBGPals1
	ld bc, 3 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call Function8949c
	ret

Palette_8b6d5:
	RGB 31, 31, 31
	RGB 31, 21, 00
	RGB 14, 07, 03
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 21, 00
	RGB 22, 09, 17
	RGB 00, 00, 00
	RGB 31, 31, 31
	RGB 31, 21, 00
	RGB 06, 24, 08
	RGB 00, 00, 00

Function8b6ed:
	hlcoord 0, 0, wAttrMap
	ld bc, $012c
	xor a
	call ByteFill
	hlcoord 0, 14, wAttrMap
	ld bc, $0050
	ld a, $7
	call ByteFill
	ret

Function8b703:
	call Mobile22_SetBGMapMode0
	push hl
	ld a, $c
	ld [hli], a
	inc a
	call Function8b73e
	inc a
	ld [hl], a
	pop hl
	push hl
	push bc
	ld de, SCREEN_WIDTH
	add hl, de
.asm_8b717
	push hl
	ld a, $f
	ld [hli], a
	ld a, $7f
	call Function8b73e
	ld a, $11
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .asm_8b717
	call Function8b732
	pop bc
	pop hl
	jr Function8b744

Function8b732:
	ld a, $12
	ld [hli], a
	ld a, $13
	call Function8b73e
	ld a, $14
	ld [hl], a
	ret

Function8b73e:
	ld d, c
.asm_8b73f
	ld [hli], a
	dec d
	jr nz, .asm_8b73f
	ret

Function8b744:
	ld de, wAttrMap - wTileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	xor a
.asm_8b74d
	push bc
	push hl
.asm_8b74f
	ld [hli], a
	dec c
	jr nz, .asm_8b74f
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .asm_8b74d
	ret

Function8b75d:
	call Mobile22_SetBGMapMode0
	hlcoord 0, 0
	ld a, $1
	ld bc, SCREEN_WIDTH
	call ByteFill
	hlcoord 0, 1
	ld a, $2
	ld [hl], a
	hlcoord 9, 1
	ld c, $b
	call Function8b788
	hlcoord 1, 1
	ld a, $4
	ld e, $8
.asm_8b780
	ld [hli], a
	inc a
	dec e
	jr nz, .asm_8b780
	jr Function8b79e

Function8b787:
	ret

Function8b788:
.asm_8b788
	ld a, $2
	ld [hli], a
	dec c
	ret z
	ld a, $1
	ld [hli], a
	dec c
	ret z
	ld a, $3
	ld [hli], a
	dec c
	ret z
	ld a, $1
	ld [hli], a
	dec c
	jr nz, .asm_8b788
	ret

Function8b79e:
	hlcoord 0, 1, wAttrMap
	ld a, $1
	ld [hli], a
	hlcoord 9, 1, wAttrMap
	ld e, $b
.asm_8b7a9
	ld a, $2
	ld [hli], a
	dec e
	ret z
	xor a
	ld [hli], a
	dec e
	ret z
	ld a, $1
	ld [hli], a
	dec e
	ret z
	xor a
	ld [hli], a
	dec e
	jr nz, .asm_8b7a9
	ret

Function8b7bd:
	call Function8b855
	ld hl, MenuHeader_0x8b867
	call CopyMenuHeader
	ld a, [wd030]
	ld [wMenuCursorBuffer], a
	ld a, [wd031]
	ld [wMenuScrollPosition], a
	ld a, [wd032]
	and a
	jr z, .asm_8b7e0
	ld a, [wMenuFlags]
	set 3, a
	ld [wMenuFlags], a

.asm_8b7e0
	ld a, [wd0e3]
	and a
	jr z, .asm_8b7ea
	dec a
	ld [wScrollingMenuCursorPosition], a

.asm_8b7ea
	hlcoord 0, 2
	ld b, $b
	ld c, $12
	call Function8b703
	call Function8b75d
	call UpdateSprites
	call Function89209
	call ScrollingMenu
	call Function8920f
	ld a, [wMenuJoypad]
	cp $2
	jr z, .asm_8b823
	cp $20
	jr nz, .asm_8b813
	call Function8b832
	jr .asm_8b7ea

.asm_8b813
	cp $10
	jr nz, .asm_8b81c
	call Function8b83e
	jr .asm_8b7ea

.asm_8b81c
	ld a, [wMenuSelection]
	cp $ff
	jr nz, .asm_8b824

.asm_8b823
	xor a

.asm_8b824
	ld c, a
	ld a, [wMenuCursorY]
	ld [wd030], a
	ld a, [wMenuScrollPosition]
	ld [wd031], a
	ret

Function8b832:
	ld a, [wMenuScrollPosition]
	ld hl, wMenuDataItems
	sub [hl]
	jr nc, Function8b84b
	xor a
	jr Function8b84b

Function8b83e:
	ld a, [wMenuScrollPosition]
	ld hl, wMenuDataItems
	add [hl]
	cp $24
	jr c, Function8b84b
	ld a, $24

Function8b84b:
	ld [wMenuScrollPosition], a
	ld a, [wMenuCursorY]
	ld [wMenuCursorBuffer], a
	ret

Function8b855:
	ld a, $28
	ld hl, wd002
	ld [hli], a
	ld c, $28
	xor a
.asm_8b85e
	inc a
	ld [hli], a
	dec c
	jr nz, .asm_8b85e
	ld a, $ff
	ld [hl], a
	ret

MenuHeader_0x8b867:
	db MENU_BACKUP_TILES ; flags
	menu_coords 1, 3, 18, 13
	dw MenuData_0x8b870
	db 1 ; default option

	db 0

MenuData_0x8b870:
	db SCROLLINGMENU_ENABLE_FUNCTION3 | SCROLLINGMENU_DISPLAY_ARROWS | SCROLLINGMENU_ENABLE_RIGHT | SCROLLINGMENU_ENABLE_LEFT ; flags
	db 5, 3 ; rows, columns
	db SCROLLINGMENU_ITEMS_NORMAL ; item format
	dbw 0, wd002
	dba Function8b880
	dba Function8b88c
	dba Function8b8c8

Function8b880:
	ld h, d
	ld l, e
	ld de, wMenuSelection
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret

Function8b88c:
	call OpenSRAMBank4
	ld h, d
	ld l, e
	push hl
	ld de, String_89116
	call Function8931b
	call Function8932d
	jr c, .asm_8b8a3
	ld hl, 0
	add hl, bc
	ld d, h
	ld e, l

.asm_8b8a3
	pop hl
	push hl
	call PlaceString
	pop hl
	ld d, $0
	ld e, $6
	add hl, de
	push hl
	ld de, String_89116
	call Function8931b
	call Function8934a
	jr c, .asm_8b8c0
	ld hl, $0006
	add hl, bc
	ld d, h
	ld e, l

.asm_8b8c0
	pop hl
	call PlaceString
	call CloseSRAM
	ret

Function8b8c8:
	hlcoord 0, 14
	ld b, $2
	ld c, $12
	call Textbox
	ld a, [wd033]
	ld b, 0
	ld c, a
	ld hl, Unknown_8b903
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	hlcoord 0, 13
	ld a, $f
	ld [hl], a
	hlcoord 19, 13
	ld a, $11
	ld [hl], a
	ld a, [wMenuScrollPosition]
	cp $24
	ret c
	hlcoord 0, 13
	ld c, $12
	call Function8b732
	ret

Unknown_8b903:
	dw String_8b90b
	dw String_8b919
	dw String_8b92a
	dw String_8b938

String_8b90b: db "めいしを　えらんでください@"        ; Please select a noun.
String_8b919: db "どの　めいしと　いれかえますか？@"    ; OK to swap with any noun?
String_8b92a: db "あいてを　えらんでください@"        ; Please select an opponent.
String_8b938: db "いれる　ところを　えらんでください@" ; Please select a location.

Function8b94a:
	ld [wd033], a
	xor a
	ld [wMenuScrollPosition], a
	ld [wd032], a
	ld [wd0e3], a
	ld [wd031], a
	ld a, $1
	ld [wd030], a
	ret

Function8b960:
	ld hl, MenuHeader_0x8b9ac
	call LoadMenuHeader
	call Function8b9e9
	jr c, .asm_8b97a
	hlcoord 11, 0
	ld b, $6
	ld c, $7
	call Function8b703
	ld hl, MenuHeader_0x8b9b1
	jr .asm_8b987
.asm_8b97a
	hlcoord 11, 0
	ld b, $a
	ld c, $7
	call Function8b703
	ld hl, MenuHeader_0x8b9ca
.asm_8b987
	ld a, $1
	call Function89d5e
	ld hl, Function8b9ab
	call Function89d85
	call ExitMenu
	jr c, .asm_8b99c
	call Function8b99f
	jr nz, .asm_8b99d
.asm_8b99c
	xor a
.asm_8b99d
	ld c, a
	ret

Function8b99f:
	ld hl, wd002
	dec a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	cp $ff
	ret

Function8b9ab:
	ret

MenuHeader_0x8b9ac:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, TEXTBOX_Y - 1

MenuHeader_0x8b9b1:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, 7
	dw MenuData_0x8b9b9
	db 1 ; default option

MenuData_0x8b9b9:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 3 ; items
	db "へんしゅう@" ; EDIT
	db "いれかえ@"   ; REPLACE
	db "やめる@"     ; QUIT

MenuHeader_0x8b9ca:
	db MENU_BACKUP_TILES ; flags
	menu_coords 11, 0, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw MenuData_0x8b9d2
	db 1 ; default option

MenuData_0x8b9d2:
	db STATICMENU_CURSOR | STATICMENU_WRAP ; flags
	db 5 ; items
	db "みる@"       ; VIEW
	db "へんしゅう@" ; EDIT
	db "いれかえ@"   ; REPLACE
	db "けす@"       ; ERASE
	db "やめる@"     ; QUIT

Function8b9e9:
	call OpenSRAMBank4
	call Function8931b
	call Function8932d
	jr nc, .asm_8b9f6
	jr .asm_8b9ff
.asm_8b9f6
	ld hl, $11
	add hl, bc
	call Function89b45
	jr c, .asm_8ba08
.asm_8b9ff
	call Function892b4
	and a
	ld de, Unknown_8ba1c
	jr .asm_8ba0c
.asm_8ba08
	ld de, Unknown_8ba1f
	scf
.asm_8ba0c
	push af
	ld hl, wd002
.asm_8ba10
	ld a, [de]
	inc de
	ld [hli], a
	cp $ff
	jr nz, .asm_8ba10
	call CloseSRAM
	pop af
	ret

Unknown_8ba1c:
	db 2, 4, -1

Unknown_8ba1f:
	db 1, 2, 4, 3, -1
