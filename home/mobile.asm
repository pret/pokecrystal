Function3e32:: ; 3e32
; Mobile
	cp $2
	ld [$c988], a
	ld a, l
	ld [$c986], a
	ld a, h
	ld [$c987], a
	jr nz, .asm_3e4f

	ld [$c982], a
	ld a, l
	ld [$c981], a
	ld hl, $c983
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a

.asm_3e4f
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

Function3e80:: ; 3e80
	ld a, [hROMBank]
	push af
	ld a, BANK(Function1116c5)
	ld [$c981], a
	rst Bankswitch

	call Function1116c5
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
	jr nz, .skip_Function1118de

	ld a, [rSC]
	and 1 << rSC_ON
	jr nz, .skip_Function1118de

	ld a, [hROMBank]
	push af
	ld a, BANK(Function1118de)
	ld [$c981], a
	rst Bankswitch

	call Function1118de

	pop bc
	ld a, b
	ld [$c981], a
	rst Bankswitch

.skip_Function1118de
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
	ld [wdc02], a
	ld a, [hROMBank]
	push af
	ld a, BANK(Function114243)
	rst Bankswitch

	call Function114243
	pop bc
	ld a, b
	rst Bankswitch

	ld a, [wdc02]
	ret
; 3eea
