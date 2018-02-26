Cosine:: ; 1b0f
; a = d * cos(a * pi/32)
	add %010000 ; cos(x) = sin(x + pi/2)
	; fallthrough
Sine:: ; 1b11
; a = d * sin(a * pi/32)
	ld e, a
	homecall _Sine
	ret
; 1b1e
