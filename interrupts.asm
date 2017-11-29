; Game Boy hardware interrupts

SECTION "vblank",ROM0
	jp VBlank

SECTION "lcd",ROM0
	jp LCD

SECTION "timer",ROM0
	reti

SECTION "serial",ROM0
	jp Serial

SECTION "joypad",ROM0
	jp JoypadInt
