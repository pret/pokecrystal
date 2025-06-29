; The CGB hardware introduces Double Speed Mode.
; While active, the clock speed is doubled.

; The hardware can switch between normal speed
; and double speed at any time, but LCD output
; collapses during the switch.

DoubleSpeed::
	ld hl, rSPD
	bit B_SPD_DOUBLE, [hl]
	jr z, SwitchSpeed
	ret

NormalSpeed::
	ld hl, rSPD
	bit B_SPD_DOUBLE, [hl]
	ret z

SwitchSpeed::
	set B_SPD_PREPARE, [hl]
	xor a
	ldh [rIF], a
	ldh [rIE], a
	ld a, JOYP_GET_NONE
	ldh [rJOYP], a
	stop ; rgbasm adds a nop after this instruction by default
	ret
