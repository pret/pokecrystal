SwitchItemsInBag:
	ld a, [wSwitchItem]
	and a
	jr z, .init
	ld b, a
	ld a, [wScrollingMenuCursorPosition]
	inc a
	cp b
	jr z, .trivial
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	ld a, [hl]
	cp -1
	ret z
	ld a, [wSwitchItem]
	dec a
	ld [wSwitchItem], a
	call Function249a7
	jp c, Function249d1
	ld a, [wScrollingMenuCursorPosition]
	ld c, a
	ld a, [wSwitchItem]
	cp c
	jr c, .asm_2497a
	jr .asm_2494a

.init
	ld a, [wScrollingMenuCursorPosition]
	inc a
	ld [wSwitchItem], a
	ret

.trivial
	xor a
	ld [wSwitchItem], a
	ret

.asm_2494a
	ld a, [wSwitchItem]
	call Function24a40
	ld a, [wScrollingMenuCursorPosition]
	ld d, a
	ld a, [wSwitchItem]
	ld e, a
	call Function24a6c
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	dec hl
	push hl
	call ItemSwitch_ConvertItemFormatToDW
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	call Function24aab
	ld a, [wScrollingMenuCursorPosition]
	call Function24a4d
	xor a
	ld [wSwitchItem], a
	ret

.asm_2497a
	ld a, [wSwitchItem]
	call Function24a40
	ld a, [wScrollingMenuCursorPosition]
	ld d, a
	ld a, [wSwitchItem]
	ld e, a
	call Function24a6c
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	call ItemSwitch_ConvertItemFormatToDW
	add hl, bc
	pop bc
	call CopyBytes
	ld a, [wScrollingMenuCursorPosition]
	call Function24a4d
	xor a
	ld [wSwitchItem], a
	ret

Function249a7:
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	ld a, [de]
	cp [hl]
	jr nz, .asm_249cd
	ld a, [wScrollingMenuCursorPosition]
	call Function24a97
	cp 99
	jr z, .asm_249cd
	ld a, [wSwitchItem]
	call Function24a97
	cp 99
	jr nz, .asm_249cf
.asm_249cd
	and a
	ret

.asm_249cf
	scf
	ret

Function249d1:
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	inc hl
	push hl
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	ld a, [hl]
	pop hl
	add [hl]
	cp 100
	jr c, .asm_24a01
	sub 99
	push af
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	ld [hl], 99
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	inc hl
	pop af
	ld [hl], a
	xor a
	ld [wSwitchItem], a
	ret

.asm_24a01
	push af
	ld a, [wScrollingMenuCursorPosition]
	call ItemSwitch_GetNthItem
	inc hl
	pop af
	ld [hl], a
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSwitchItem]
	cp [hl]
	jr nz, .asm_24a25
	dec [hl]
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	ld [hl], $ff
	xor a
	ld [wSwitchItem], a
	ret

.asm_24a25
	dec [hl]
	call ItemSwitch_ConvertItemFormatToDW
	push bc
	ld a, [wSwitchItem]
	call ItemSwitch_GetNthItem
	pop bc
	push hl
	add hl, bc
	pop de
.asm_24a34
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr nz, .asm_24a34
	xor a
	ld [wSwitchItem], a
	ret

Function24a40:
	call ItemSwitch_GetNthItem
	ld de, wd002
	call ItemSwitch_ConvertItemFormatToDW
	call CopyBytes
	ret

Function24a4d:
	call ItemSwitch_GetNthItem
	ld d, h
	ld e, l
	ld hl, wd002
	call ItemSwitch_ConvertItemFormatToDW
	call CopyBytes
	ret

ItemSwitch_GetNthItem:
	push af
	call ItemSwitch_ConvertItemFormatToDW
	ld hl, wMenuData_ItemsPointerAddr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	pop af
	call AddNTimes
	ret

Function24a6c:
	push hl
	call ItemSwitch_ConvertItemFormatToDW
	ld a, d
	sub e
	jr nc, .dont_negate
	dec a
	cpl
.dont_negate
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret

ItemSwitch_ConvertItemFormatToDW:
; This function is absolutely idiotic.
	push hl
	ld a, [wMenuData_ScrollingMenuItemFormat]
	ld c, a
	ld b, 0
	ld hl, .format_dws
	add hl, bc
	add hl, bc
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	ret

.format_dws
	dw 0
	dw 1
	dw 2

Function24a97:
	push af
	call ItemSwitch_ConvertItemFormatToDW
	ld a, c
	cp 2
	jr nz, .not_2
	pop af
	call ItemSwitch_GetNthItem
	inc hl
	ld a, [hl]
	ret

.not_2
	pop af
	ld a, $1
	ret

Function24aab:
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
