; Game Boy hardware interrupts

SECTION "vblank",ROM0[$40]
	jp VBlank

SECTION "lcd",ROM0[$48]
	jp LCD

SECTION "timer",ROM0[$50]
	jp Timer

SECTION "serial",ROM0[$58]
	jp Serial

SECTION "joypad",ROM0[$60]
	jp JoypadInt
