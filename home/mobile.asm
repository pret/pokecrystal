Function3e32:: ; 3e32
; Mobile
	cp $2
	ld [$c988], a
	ld a, l
	ld [$c986], a
	ld a, h
	ld [$c987], a
	jr nz, .okay

	ld [$c982], a
	ld a, l
	ld [$c981], a
	ld hl, $c983
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a

.okay
	ld hl, $c822
	set 6, [hl]
	ld a, [hROMBank]
	push af
	ld a, BANK(Function110030)
	ld [$c981], a
	rst Bankswitch

	jp Function110030
; 3e60

Function3e60:: ; 3e60
; Return from Function110030
	ld [$c986], a
	ld a, l
	ld [$c987], a
	ld a, h
	ld [$c988], a

	pop bc
	ld a, b
	ld [$c981], a
	rst Bankswitch

	ld hl, $c822
	res 6, [hl]
	ld hl, $c987
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [$c986]
	ret
; 3e80

MobileReceive:: ; 3e80
	ld a, [hROMBank]
	push af
	ld a, BANK(_MobileReceive)
	ld [$c981], a
	rst Bankswitch

	call _MobileReceive
	pop bc
	ld a, b
	ld [$c981], a
	rst Bankswitch

	ret
; 3e93


Timer:: ; 3e93
	push af
	push bc
	push de
	push hl

	ld a, [hMobile]
	and a
	jr z, .pop_ret

	xor a
	ld [rTAC], a

; Turn off timer interrupt
	ld a, [rIF]
	and 1 << VBLANK | 1 << LCD_STAT | 1 << SERIAL | 1 << JOYPAD
	ld [rIF], a

	ld a, [$c86a]
	or a
	jr z, .pop_ret

	ld a, [$c822]
	bit 1, a
	jr nz, .skip_Timer

	ld a, [rSC]
	and 1 << rSC_ON
	jr nz, .skip_Timer

	ld a, [hROMBank]
	push af
	ld a, BANK(_Timer)
	ld [$c981], a
	rst Bankswitch

	call _Timer

	pop bc
	ld a, b
	ld [$c981], a
	rst Bankswitch

.skip_Timer
	ld a, [rTMA]
	ld [rTIMA], a

	ld a, 1 << rTAC_ON | rTAC_65536_HZ
	ld [rTAC], a

.pop_ret
	pop hl
	pop de
	pop bc
	pop af
	reti
; 3ed7

Function3ed7:: ; 3ed7
; unreferenced
	ld [$dc02], a
	ld a, [hROMBank]
	push af
	ld a, BANK(Function114243)
	rst Bankswitch

	call Function114243
	pop bc
	ld a, b
	rst Bankswitch

	ld a, [$dc02]
	ret
; 3eea

Function3eea:: ; 3eea
	push hl
	push bc
	ld de, AttrMap - TileMap
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
; 3efd

Function3efd:: ; 3efd
; unreferenced
	push hl
	hlcoord 0, 12
	ld b, 4
	ld c, 18
	call .fill_attr
	pop hl
	call PrintTextBoxText
	ret
; 3f0d

.fill_attr
	push hl
	push bc
	ld de, AttrMap - TileMap
	add hl, de
	inc b
	inc b
	inc c
	inc c
	call Function3f35
	pop bc
	pop hl
	call TextBoxBorder
	ret
; 3f20

Function3f20:: ; 3f20
	hlcoord 0, 0, AttrMap
	ld b,  6
	ld c, 20
	call Function3f35
	hlcoord 0, 0
	ld b,  4
	ld c, 18
	call MobileHome_PlaceBox
	ret
; 3f35

Function3f35:: ; 3f35
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
; 3f47

MobileHome_PlaceBox: ; 3f47
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
; 3f58

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
; 3f7c

Function3f7c:: ; 3f7c
	call MenuBoxCoord2Tile
	call GetMenuBoxDims
	dec b
	dec c
	call Function3eea
	ret
; 3f88

Function3f88:: ; 3f88
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
; 3f9f

Function3f9f:: ; 3f9f
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
; 3fb5
