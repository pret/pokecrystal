SwitchItemsInBag: ; 2490c (9:490c)
	ld a, [wSwitchItem]
	and a
	jr z, .init
	ld b, a
	ld a, [wScrollingMenuCursorPosition]
	inc a
	cp b
	jr z, .trivial
	ld a, [wScrollingMenuCursorPosition]
	call Function24a5c
	ld a, [hl]
	cp $ff
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
	call Function24a5c
	dec hl
	push hl
	call Function24a80
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
	call Function24a5c
	ld d, h
	ld e, l
	call Function24a80
	add hl, bc
	pop bc
	call CopyBytes
	ld a, [wScrollingMenuCursorPosition]
	call Function24a4d
	xor a
	ld [wSwitchItem], a
	ret

Function249a7: ; 249a7 (9:49a7)
	ld a, [wSwitchItem]
	call Function24a5c
	ld d, h
	ld e, l
	ld a, [wScrollingMenuCursorPosition]
	call Function24a5c
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

Function249d1: ; 249d1 (9:49d1)
	ld a, [wSwitchItem]
	call Function24a5c
	inc hl
	push hl
	ld a, [wScrollingMenuCursorPosition]
	call Function24a5c
	inc hl
	ld a, [hl]
	pop hl
	add [hl]
	cp 100
	jr c, .asm_24a01
	sub 99
	push af
	ld a, [wScrollingMenuCursorPosition]
	call Function24a5c
	inc hl
	ld [hl], 99
	ld a, [wSwitchItem]
	call Function24a5c
	inc hl
	pop af
	ld [hl], a
	xor a
	ld [wSwitchItem], a
	ret

.asm_24a01
	push af
	ld a, [wScrollingMenuCursorPosition]
	call Function24a5c
	inc hl
	pop af
	ld [hl], a
	ld hl, wMenuData2Addr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wSwitchItem]
	cp [hl]
	jr nz, .asm_24a25
	dec [hl]
	ld a, [wSwitchItem]
	call Function24a5c
	ld [hl], $ff
	xor a
	ld [wSwitchItem], a
	ret

.asm_24a25
	dec [hl]
	call Function24a80
	push bc
	ld a, [wSwitchItem]
	call Function24a5c
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

Function24a40: ; 24a40 (9:4a40)
	call Function24a5c
	ld de, wd002
	call Function24a80
	call CopyBytes
	ret

Function24a4d: ; 24a4d (9:4a4d)
	call Function24a5c
	ld d, h
	ld e, l
	ld hl, wd002
	call Function24a80
	call CopyBytes
	ret

Function24a5c: ; 24a5c (9:4a5c)
	push af
	call Function24a80
	ld hl, wMenuData2Addr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	pop af
	call AddNTimes
	ret

Function24a6c: ; 24a6c (9:4a6c)
	push hl
	call Function24a80
	ld a, d
	sub e
	jr nc, .asm_24a76
	dec a
	cpl
.asm_24a76
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret

Function24a80: ; 24a80 (9:4a80)
	push hl
	ld a, [wcf94]
	ld c, a
	ld b, 0
	ld hl, Unknown_24a91
rept 2
	add hl, bc
endr
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	ret

; 24a91 (9:4a91)

Unknown_24a91: ; 24a91
	dw 0, 1, 2
; 24a97

Function24a97: ; 24a97 (9:4a97)
	push af
	call Function24a80
	ld a, c
	cp $2
	jr nz, .asm_24aa7
	pop af
	call Function24a5c
	inc hl
	ld a, [hl]
	ret

.asm_24aa7
	pop af
	ld a, $1
	ret

Function24aab: ; 24aab (9:4aab)
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret
