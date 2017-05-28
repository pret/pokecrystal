Cosine:: ; 1b0f
; Return d * cos(a) in hl
	add $10 ; 90 degrees

Sine:: ; 1b11
; Return d * sin(a) in hl
; a is a signed 6-bit value.

	ld e, a

	homecall _Sine
	ret
; 1b1e
