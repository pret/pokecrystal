; LCD handling


Unreferenced_Function547:: ; 547
	ld a, [hLCDCPointer]
	cp rSCX - $ff00
	ret nz
	ld c, a
	ld a, [wLYOverrides]
	ld [$ff00+c], a
	ret
; 552


LCD:: ; 552
	push af
	ld a, [hLCDCPointer]
	and a
	jr z, .done

; At this point it's assumed we're in WRAM bank 5!
	push bc
	ld a, [rLY]
	ld c, a
	ld b, HIGH(wLYOverrides)
	ld a, [bc]
	ld b, a
	ld a, [hLCDCPointer]
	ld c, a
	ld a, b
	ld [$ff00+c], a
	pop bc

.done
	pop af
	reti
; 568


DisableLCD:: ; 568
; Turn the LCD off

; Don't need to do anything if the LCD is already off
	ld a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z

	xor a
	ld [rIF], a
	ld a, [rIE]
	ld b, a

; Disable VBlank
	res 0, a ; vblank
	ld [rIE], a

.wait
; Wait until VBlank would normally happen
	ld a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	ld a, [rLCDC]
	and $ff ^ (1 << rLCDC_ENABLE)
	ld [rLCDC], a

	xor a
	ld [rIF], a
	ld a, b
	ld [rIE], a
	ret
; 58a


EnableLCD:: ; 58a
	ld a, [rLCDC]
	set rLCDC_ENABLE, a
	ld [rLCDC], a
	ret
; 591
