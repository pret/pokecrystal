; rst vectors (called through the rst instruction)

SECTION "rst0", ROM0[$0000]
	di
	jp Start

SECTION "rst8", ROM0[$0008] ; rst FarCall
	jp FarCall_hl

SECTION "rst10", ROM0[$0010] ; rst Bankswitch
	ldh [hROMBank], a
	ld [MBC3RomBank], a
	ret

SECTION "rst18", ROM0[$0018]
	rst $38

SECTION "rst20", ROM0[$0020]
	rst $38

SECTION "rst28", ROM0[$0028] ; rst JumpTable
	push de
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
; SECTION "rst30", ROM0[$0030]
	ld l, a
	pop de
	jp hl

SECTION "rst38", ROM0[$0038]
	rst $38


; Game Boy hardware interrupts

SECTION "vblank", ROM0[$0040]
	jp VBlank

SECTION "lcd", ROM0[$0048]
	jp LCD

SECTION "timer", ROM0[$0050]
	jp Timer

SECTION "serial", ROM0[$0058]
	jp Serial

SECTION "joypad", ROM0[$0060]
	jp Joypad


; Game Boy cartridge header

SECTION "Header", ROM0[$0100]

Start::
	nop
	jp _Start

; The cartridge header data is filled in by rgbfix.
; This makes sure it doesn't get used.
	ds $0150 - $0104
