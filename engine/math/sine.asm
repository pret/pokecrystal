INCLUDE "constants.inc"


SECTION "engine/math/sine.asm", ROMX

_Sine::
; a = d * sin(e * pi/32)
	ld a, e
	calc_sine_wave
