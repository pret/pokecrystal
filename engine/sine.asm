_Sine:: ; 84d9
; A simple sine function.
; Return d * sin(e) in hl.

; e is a signed 6-bit value.
	ld a, e
	and %111111
	cp  %100000
	jr nc, .negative

	call .ApplySineWave
	ld a, h
	ret

.negative
	and %011111
	call .ApplySineWave
	ld a, h
	xor -1
	inc a
	ret

.ApplySineWave: ; 84ef
	ld e, a
	ld a, d
	ld d, 0
	ld hl, .sinewave
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0

; Factor amplitude
.multiply
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret

.sinewave ; 850b
; A $20-word table representing a sine wave.
; 90 degrees is index $10 at a base amplitude of $100.
	sine_wave $100
