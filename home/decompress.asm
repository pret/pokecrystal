FarDecompress::
; Decompress graphics data from a:hl to de.

	ld [wLZBank], a
	ldh a, [hROMBank]
	push af
	ld a, [wLZBank]
	rst Bankswitch

	call Decompress

	pop af
	rst Bankswitch
	ret

Decompress::
; Pokemon Crystal uses an lz variant for compression.
; This is mainly (but not necessarily) used for graphics.

; This function decompresses lz-compressed data from hl to de.

LZ_END EQU $ff ; Compressed data is terminated with $ff.

; A typical control command consists of:

LZ_CMD EQU %11100000 ; command id (bits 5-7)
LZ_LEN EQU %00011111 ; length n   (bits 0-4)

; Additional parameters are read during command execution.

; Commands:

LZ_LITERAL   EQU 0 << 5 ; Read literal data for n bytes.
LZ_ITERATE   EQU 1 << 5 ; Write the same byte for n bytes.
LZ_ALTERNATE EQU 2 << 5 ; Alternate two bytes for n bytes.
LZ_ZERO      EQU 3 << 5 ; Write 0 for n bytes.

; Another class of commands reuses data from the decompressed output.
LZ_RW        EQU 2 + 5 ; bit

; These commands take a signed offset to start copying from.
; Wraparound is simulated.
; Positive offsets (15-bit) are added to the start address.
; Negative offsets (7-bit) are subtracted from the current position.

LZ_REPEAT    EQU 4 << 5 ; Repeat n bytes from the offset.
LZ_FLIP      EQU 5 << 5 ; Repeat n bitflipped bytes.
LZ_REVERSE   EQU 6 << 5 ; Repeat n bytes in reverse.

; If the value in the count needs to be larger than 5 bits,
; LZ_LONG can be used to expand the count to 10 bits.
LZ_LONG      EQU 7 << 5

; A new control command is read in bits 2-4.
; The top two bits of the length are bits 0-1.
; Another byte is read containing the bottom 8 bits.
LZ_LONG_HI   EQU %00000011

; In other words, the structure of the command becomes
; 111xxxyy yyyyyyyy
; x: the new control command
; y: the length

; For more information, refer to the code below and in extras/gfx.py.

	; Save the output address
	; for rewrite commands.
	ld a, e
	ld [wLZAddress], a
	ld a, d
	ld [wLZAddress + 1], a

.Main:
	ld a, [hl]
	cp LZ_END
	ret z

	and LZ_CMD

	cp LZ_LONG
	jr nz, .short

.long
; The count is now 10 bits.

	; Read the next 3 bits.
	; %00011100 -> %11100000
	ld a, [hl]
	add a
	add a ; << 3
	add a

	; This is our new control code.
	and LZ_CMD
	push af

	ld a, [hli]
	and LZ_LONG_HI
	ld b, a
	ld a, [hli]
	ld c, a

	; read at least 1 byte
	inc bc
	jr .command

.short
	push af

	ld a, [hli]
	and LZ_LEN
	ld c, a
	ld b, 0

	; read at least 1 byte
	inc c

.command
	; Increment loop counts.
	; We bail the moment they hit 0.
	inc b
	inc c

	pop af

	bit LZ_RW, a
	jr nz, .rewrite

	cp LZ_ITERATE
	jr z, .Iter
	cp LZ_ALTERNATE
	jr z, .Alt
	cp LZ_ZERO
	jr z, .Zero

.Literal:
; Read literal data for bc bytes.
.lloop
	dec c
	jr nz, .lnext
	dec b
	jp z, .Main

.lnext
	ld a, [hli]
	ld [de], a
	inc de
	jr .lloop

.Iter:
; Write the same byte for bc bytes.
	ld a, [hli]

.iloop
	dec c
	jr nz, .inext
	dec b
	jp z, .Main

.inext
	ld [de], a
	inc de
	jr .iloop

.Alt:
; Alternate two bytes for bc bytes.
	dec c
	jr nz, .anext1
	dec b
	jp z, .adone1
.anext1
	ld a, [hli]
	ld [de], a
	inc de

	dec c
	jr nz, .anext2
	dec b
	jp z, .adone2
.anext2
	ld a, [hld]
	ld [de], a
	inc de

	jr .Alt

	; Skip past the bytes we were alternating.
.adone1
	inc hl
.adone2
	inc hl
	jr .Main

.Zero:
; Write 0 for bc bytes.
	xor a

.zloop
	dec c
	jr nz, .znext
	dec b
	jp z, .Main

.znext
	ld [de], a
	inc de
	jr .zloop

.rewrite
; Repeat decompressed data from output.
	push hl
	push af

	ld a, [hli]
	bit 7, a ; sign
	jr z, .positive

.negative
; hl = de - a
	; Since we can't subtract a from de,
	; Make it negative and add de.
	and %01111111
	cpl
	add e
	ld l, a
	ld a, -1
	adc d
	ld h, a
	jr .ok

.positive
; Positive offsets are two bytes.
	ld l, [hl]
	ld h, a
	; add to starting output address
	ld a, [wLZAddress]
	add l
	ld l, a
	ld a, [wLZAddress + 1]
	adc h
	ld h, a

.ok
	pop af

	cp LZ_REPEAT
	jr z, .Repeat
	cp LZ_FLIP
	jr z, .Flip
	cp LZ_REVERSE
	jr z, .Reverse

; Since LZ_LONG is command 7,
; only commands 0-6 are passed in.
; This leaves room for an extra command 7.
; However, lengths longer than 768
; would be interpreted as LZ_END.

; More practically, LZ_LONG is not recursive.
; For now, it defaults to LZ_REPEAT.

.Repeat:
; Copy decompressed data for bc bytes.
	dec c
	jr nz, .rnext
	dec b
	jr z, .donerw

.rnext
	ld a, [hli]
	ld [de], a
	inc de
	jr .Repeat

.Flip:
; Copy bitflipped decompressed data for bc bytes.
	dec c
	jr nz, .fnext
	dec b
	jp z, .donerw

.fnext
	ld a, [hli]
	push bc
	lb bc, 0, 8

.floop
	rra
	rl b
	dec c
	jr nz, .floop

	ld a, b
	pop bc

	ld [de], a
	inc de
	jr .Flip

.Reverse:
; Copy reversed decompressed data for bc bytes.
	dec c
	jr nz, .rvnext

	dec b
	jp z, .donerw

.rvnext
	ld a, [hld]
	ld [de], a
	inc de
	jr .Reverse

.donerw
	pop hl

	bit 7, [hl]
	jr nz, .next
	inc hl ; positive offset is two bytes
.next
	inc hl
	jp .Main
