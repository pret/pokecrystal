; The CGB hardware introduces Double Speed Mode.
; While active, the clock speed is doubled.

; The hardware can switch between normal speed
; and double speed at any time, but LCD output
; collapses during the switch.

DoubleSpeed:: ; 2fef
	ld hl, rKEY1
	bit 7, [hl]
	jr z, SwitchSpeed
	ret
; 2ff7

NormalSpeed:: ; 2ff7
	ld hl, rKEY1
	bit 7, [hl]
	ret z
; 2ffd

SwitchSpeed:: ; 2ffd
	set 0, [hl]
	xor a
	ld [rIF], a
	ld [rIE], a
	ld a, $30
	ld [rJOYP], a
	stop ; rgbasm adds a nop after this instruction by default
	ret
; 300b
