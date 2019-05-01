; Game Boy hardware interrupts

SECTION "home/interrupts.asm@vblank", ROM0[$0040]
	jp VBlank

SECTION "home/interrupts.asm@lcd", ROM0[$0048]
	jp LCD

SECTION "home/interrupts.asm@timer", ROM0[$0050]
	jp Timer

SECTION "home/interrupts.asm@serial", ROM0[$0058]
	jp Serial

SECTION "home/interrupts.asm@joypad", ROM0[$0060]
	jp JoypadInt
