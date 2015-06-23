Cosine:: ; 1b0f
; Return d * cos(a) in hl
	add $10 ; 90 degrees

Sine:: ; 1b11
; Return d * sin(a) in hl
; a is a signed 6-bit value.

	ld e, a

	ld a, [hROMBank]
	push af
	ld a, BANK(_Sine)
	rst Bankswitch

	call _Sine

	pop af
	rst Bankswitch
	ret
; 1b1e
