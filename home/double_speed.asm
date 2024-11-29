; The CGB hardware introduces Double Speed Mode.
; While active, the clock speed is doubled.

; The hardware can switch between normal speed
; and double speed at any time, but LCD output
; collapses during the switch.

DoubleSpeed::
	ld hl, rKEY1
	bit KEY1_DBLSPEED, [hl]
	jr z, SwitchSpeed
	ret

NormalSpeed::
	ld hl, rKEY1
	bit KEY1_DBLSPEED, [hl]
	ret z

SwitchSpeed::
	set KEY1_PREPARE, [hl]
	xor a
	ldh [rIF], a
	ldh [rIE], a
	ld a, (1 << rJOYP_BUTTONS) | (1 << rJOYP_DPAD)
	ldh [rJOYP], a
	stop ; rgbasm adds a nop after this instruction by default
	ret
