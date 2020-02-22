; Game Boy hardware interrupts

SECTION "home/interrupts.asm@vblank", ROM0
	jp VBlank

SECTION "home/interrupts.asm@lcd", ROM0
	jp LCD

SECTION "home/interrupts.asm@timer", ROM0
	jp Timer

SECTION "home/interrupts.asm@serial", ROM0
	jp Serial

SECTION "home/interrupts.asm@joypad", ROM0
	jp JoypadInt
