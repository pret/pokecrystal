; Game Boy hardware interrupts

SECTION "home/interrupts.inc@vblank", ROM0[$0040]
	jp VBlank

SECTION "home/interrupts.inc@lcd", ROM0[$0048]
	jp LCD

SECTION "home/interrupts.inc@timer", ROM0[$0050]
	jp Timer

SECTION "home/interrupts.inc@serial", ROM0[$0058]
	jp Serial

SECTION "home/interrupts.inc@joypad", ROM0[$0060]
	jp JoypadInt
