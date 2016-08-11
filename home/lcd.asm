; LCD handling


Function547:: ; 547
; Unreferenced
	ld a, [hLCDCPointer]
	cp rSCX - $ff00
	ret nz
	ld c, a
	ld a, [LYOverrides]
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
	ld b, LYOverrides >> 8
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
	bit 7, a ; lcd enable
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
	cp 145
	jr nz, .wait

	ld a, [rLCDC]
	and %01111111 ; lcd enable off
	ld [rLCDC], a

	xor a
	ld [rIF], a
	ld a, b
	ld [rIE], a
	ret
; 58a


EnableLCD:: ; 58a
	ld a, [rLCDC]
	set 7, a ; lcd enable
	ld [rLCDC], a
	ret
; 591
