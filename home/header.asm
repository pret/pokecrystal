; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0
	di
	jp Start

SECTION "rst8", ROM0 ; rst FarCall
	jp FarCall_hl

SECTION "rst10", ROM0 ; rst Bankswitch
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18", ROM0
	rst $38

SECTION "rst20", ROM0
	rst $38

SECTION "rst28", ROM0 ; rst JumpTable
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
; SECTION "rst30", ROM0
	ld l, a
	pop de
	jp hl

SECTION "rst38", ROM0
	rst $38


; Game Boy hardware interrupts

SECTION "vblank", ROM0
	jp VBlank

SECTION "lcd", ROM0
	jp LCD

SECTION "timer", ROM0
	jp Timer

SECTION "serial", ROM0
	jp Serial

SECTION "joypad", ROM0
	jp Joypad


; Game Boy cartridge header

SECTION "Header", ROM0

Start::
	nop
	jp _Start

; The cartridge header data is filled in by rgbfix.
; This makes sure it doesn't get used.
	ds $0150 - $0104
