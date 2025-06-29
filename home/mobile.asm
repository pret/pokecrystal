MobileAPI::
; Mobile
	cp $2
	ld [wMobileAPIIndex], a
	ld a, l
	ld [wc986], a
	ld a, h
	ld [wc987], a
	jr nz, .okay

	ld [wc982], a
	ld a, l
	ld [wc981], a
	ld hl, wc983
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a

.okay
	ld hl, wc822
	set 6, [hl]
	ldh a, [hROMBank]
	push af
	ld a, BANK(_MobileAPI)
	ld [wc981], a
	rst Bankswitch

	jp _MobileAPI

ReturnMobileAPI::
; Return from _MobileAPI
	ld [wc986], a
	ld a, l
	ld [wc987], a
	ld a, h
	ld [wMobileAPIIndex], a

	pop bc
	ld a, b
	ld [wc981], a
	rst Bankswitch

	ld hl, wc822
	res 6, [hl]
	ld hl, wc987
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc986]
	ret

MobileReceive::
	ldh a, [hROMBank]
	push af
	ld a, BANK(_MobileReceive)
	ld [wc981], a
	rst Bankswitch

	call _MobileReceive
	pop bc
	ld a, b
	ld [wc981], a
	rst Bankswitch

	ret

MobileTimer::
	push af
	push bc
	push de
	push hl

	ldh a, [hMobile]
	and a
	jr z, .pop_ret

	xor a
	ldh [rTAC], a

; Turn off timer interrupt
	ldh a, [rIF]
	and IF_VBLANK | IF_STAT | IF_SERIAL | IF_JOYPAD
	ldh [rIF], a

	ld a, [wc86a]
	or a
	jr z, .pop_ret

	ld a, [wc822]
	bit 1, a
	jr nz, .skip_timer

	ldh a, [rSC]
	and SC_START
	jr nz, .skip_timer

	ldh a, [hROMBank]
	push af
	ld a, BANK(_Timer)
	ld [wc981], a
	rst Bankswitch

	call _Timer

	pop bc
	ld a, b
	ld [wc981], a
	rst Bankswitch

.skip_timer
	ldh a, [rTMA]
	ldh [rTIMA], a

	ld a, TAC_START | TAC_65KHZ
	ldh [rTAC], a

.pop_ret
	pop hl
	pop de
	pop bc
	pop af
	reti

Function3ed7:: ; unreferenced
	ld [$dc02], a
	ldh a, [hROMBank]
	push af
	ld a, BANK(Function114243)
	rst Bankswitch

	call Function114243
	pop bc
	ld a, b
	rst Bankswitch

	ld a, [$dc02]
	ret

Function3eea::
	push hl
	push bc
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	call Function3f35
	pop bc
	pop hl
	call MobileHome_PlaceBox
	ret

Function3efd:: ; unreferenced
	push hl
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call .fill_attr
	pop hl
	call PrintTextboxText
	ret

.fill_attr
	push hl
	push bc
	ld de, wAttrmap - wTilemap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	call Function3f35
	pop bc
	pop hl
	call TextboxBorder
	ret

Function3f20::
	hlcoord 0, 0, wAttrmap
	ld b,  6
	ld c, 20
	call Function3f35
	hlcoord 0, 0
	ld b,  4
	ld c, 18
	call MobileHome_PlaceBox
	ret

Function3f35::
	ld a, 6
	ld de, SCREEN_WIDTH
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret

MobileHome_PlaceBox:
	push bc
	call .FillTop
	pop bc
.RowLoop:
	push bc
	call .FillMiddle
	pop bc
	dec b
	jr nz, .RowLoop
	call .FillBottom
	ret

.FillTop:
	ld a, $63
	ld d, $62
	ld e, $64
	jr .FillRow

.FillBottom:
	ld a, $68
	ld d, $67
	ld e, $69
	jr .FillRow

.FillMiddle:
	ld a, $7f
	ld d, $65
	ld e, $66

.FillRow:
	push hl
	ld [hl], d
	inc hl
.FillLoop:
	ld [hli], a
	dec c
	jr nz, .FillLoop
	ld [hl], e
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	ret

Function3f7c::
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	call Function3eea
	ret

Function3f88::
	ld hl, wDecompressScratch
	ld b, 0
.row
	push bc
	ld c, 1 tiles / 2
.col
	ld a, [de]
	inc de
	cpl
	ld [hl], 0
	inc hl
	ld [hli], a
	dec c
	jr nz, .col
	pop bc
	dec c
	jr nz, .row
	ret

Function3f9f::
	ld hl, wDecompressScratch
.row
	push bc
	ld c, 1 tiles / 2
.col
	ld a, [de]
	inc de
	inc de
	cpl
	ld [hl], $0
	inc hl
	ld [hli], a
	dec c
	jr nz, .col
	pop bc
	dec c
	jr nz, .row
	ret
