; LCD handling

Unreferenced_Function547::
	ldh a, [hLCDCPointer]
	cp LOW(rSCX)
	ret nz
	ld c, a
	ld a, [wLYOverrides]
	ld [$ff00+c], a
	ret

LCD::
	push af
	ldh a, [hLCDCPointer]
	and a
	jr z, .done

; At this point it's assumed we're in WRAM bank 5!
	push bc
	ldh a, [rLY]
	ld c, a
	ld b, HIGH(wLYOverrides)
	ld a, [bc]
	ld b, a
	ldh a, [hLCDCPointer]
	ld c, a
	ld a, b
	ld [$ff00+c], a
	pop bc

.done
	pop af
	reti

DisableLCD::
; Turn the LCD off

; Don't need to do anything if the LCD is already off
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	ret z

	xor a
	ldh [rIF], a
	ldh a, [rIE]
	ld b, a

; Disable VBlank
	res 0, a ; vblank
	ldh [rIE], a

.wait
; Wait until VBlank would normally happen
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait

	ldh a, [rLCDC]
	and $ff ^ (1 << rLCDC_ENABLE)
	ldh [rLCDC], a

	xor a
	ldh [rIF], a
	ld a, b
	ldh [rIE], a
	ret

EnableLCD::
	ldh a, [rLCDC]
	set rLCDC_ENABLE, a
	ldh [rLCDC], a
	ret
