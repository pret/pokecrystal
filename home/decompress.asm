FarDecompress:: ; b40
; Decompress graphics data at a:hl to de

; put a away for a sec
	ld [$c2c4], a
; save bank
	ld a, [hROMBank]
	push af
; bankswitch
	ld a, [$c2c4]
	rst Bankswitch
	
; what we came here for
	call Decompress
	
; restore bank
	pop af
	rst Bankswitch
	ret
; b50


Decompress:: ; b50
; Pokemon Crystal uses an lz variant for compression.

; This is mainly used for graphics, but the intro's
; tilemaps also use this compression.

; This function decompresses lz-compressed data at hl to de.


; Basic rundown:

;	A typical control command consists of:
;		-the command (bits 5-7)
;		-the count (bits 0-4)
;		-and any additional params

;	$ff is used as a terminator.


;	Commands:

;		0: literal
;			literal data for some number of bytes
;		1: iterate
;			one byte repeated for some number of bytes
;		2: alternate
;			two bytes alternated for some number of bytes
;		3: zero (whitespace)
;			0x00 repeated for some number of bytes

;	Repeater control commands have a signed parameter used to determine the start point.
;	Wraparound is simulated:
;		Positive values are added to the start address of the decompressed data
;		and negative values are subtracted from the current position.

;		4: repeat
;			repeat some number of bytes from decompressed data
;		5: flipped
;			repeat some number of flipped bytes from decompressed data
;			ex: $ad = %10101101 -> %10110101 = $b5
;		6: reverse
;			repeat some number of bytes in reverse from decompressed data

;	If the value in the count needs to be larger than 5 bits,
;	control code 7 can be used to expand the count to 10 bits.

;		A new control command is read in bits 2-4.
;		The new 10-bit count is split:
;			bits 0-1 contain the top 2 bits
;			another byte is added containing the latter 8

;		So, the structure of the control command becomes:
;			111xxxyy yyyyyyyy
;			 |  |  |    |
;            |  | our new count
;            | the control command for this count
;            7 (this command)

; For more information, refer to the code below and in extras/gfx.py .

; save starting output address
	ld a, e
	ld [$c2c2], a
	ld a, d
	ld [$c2c3], a
	
.loop
; get next byte
	ld a, [hl]
; done?
	cp $ff ; end
	ret z

; get control code
	and %11100000
	
; 10-bit param?
	cp $e0 ; LZ_HI
	jr nz, .normal
	
	
; 10-bit param:

; get next 3 bits (%00011100)
	ld a, [hl]
	add a
	add a ; << 3
	add a
	
; this is our new control code
	and %11100000
	push af
	
; get param hi
	ld a, [hli]
	and %00000011
	ld b, a
	
; get param lo
	ld a, [hli]
	ld c, a
	
; read at least 1 byte
	inc bc
	jr .readers
	
	
.normal
; push control code
	push af
; get param
	ld a, [hli]
	and %00011111
	ld c, a
	ld b, $0
; read at least 1 byte
	inc c
	
.readers
; let's get started

; inc loop counts since we bail as soon as they hit 0
	inc b
	inc c
	
; get control code
	pop af
; command type
	bit 7, a ; 80, a0, c0
	jr nz, .repeatertype
	
; literals
	cp $20 ; LZ_ITER
	jr z, .iter
	cp $40 ; LZ_ALT
	jr z, .alt
	cp $60 ; LZ_ZERO
	jr z, .zero
	; else $00
	
; 00 ; LZ_LIT
; literal data for bc bytes
.loop1
; done?
	dec c
	jr nz, .next1
	dec b
	jp z, .loop
	
.next1
	ld a, [hli]
	ld [de], a
	inc de
	jr .loop1
	
	
; 20 ; LZ_ITER
; write byte for bc bytes
.iter
	ld a, [hli]
	
.iterloop
	dec c
	jr nz, .iternext
	dec b
	jp z, .loop
	
.iternext
	ld [de], a
	inc de
	jr .iterloop
	
	
; 40 ; LZ_ALT
; alternate two bytes for bc bytes

; next pair
.alt
; done?
	dec c
	jr nz, .alt0
	dec b
	jp z, .altclose0
	
; alternate for bc
.alt0
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .alt1
; done?
	dec b
	jp z, .altclose1
.alt1
	ld a, [hld]
	ld [de], a
	inc de
	jr .alt
	
; skip past the bytes we were alternating
.altclose0
	inc hl
.altclose1
	inc hl
	jr .loop
	
	
; 60 ; LZ_ZERO
; write 00 for bc bytes
.zero
	xor a
	
.zeroloop
	dec c
	jr nz, .zeronext
	dec b
	jp z, .loop
	
.zeronext
	ld [de], a
	inc de
	jr .zeroloop
	
	
; repeats
; 80, a0, c0
; repeat decompressed data from output
.repeatertype
	push hl
	push af
; get next byte
	ld a, [hli]
; absolute?
	bit 7, a
	jr z, .absolute
	
; relative
; a = -a
	and %01111111 ; forget the bit we just looked at
	cpl
; add de (current output address)
	add e
	ld l, a
	ld a, $ff ; -1
	adc d
	ld h, a
	jr .repeaters
	
.absolute
; get next byte (lo)
	ld l, [hl]
; last byte (hi)
	ld h, a
; add starting output address
	ld a, [$c2c2]
	add l
	ld l, a
	ld a, [$c2c3]
	adc h
	ld h, a
	
.repeaters
	pop af
	cp $80 ; LZ_REPEAT
	jr z, .repeat
	cp $a0 ; LZ_FLIP
	jr z, .flip
	cp $c0 ; LZ_REVERSE
	jr z, .reverse
	
; e0 -> 80
	
; 80 ; LZ_REPEAT
; repeat some decompressed data
.repeat
; done?
	dec c
	jr nz, .repeatnext
	dec b
	jr z, .cleanup
	
.repeatnext
	ld a, [hli]
	ld [de], a
	inc de
	jr .repeat
	
	
; a0 ; LZ_FLIP
; repeat some decompressed data w/ flipped bit order
.flip
	dec c
	jr nz, .flipnext
	dec b
	jp z, .cleanup
	
.flipnext
	ld a, [hli]
	push bc
	ld bc, $0008
	
.fliploop
	rra
	rl b
	dec c
	jr nz, .fliploop
	ld a, b
	pop bc
	ld [de], a
	inc de
	jr .flip
	
	
; c0 ; LZ_REVERSE
; repeat some decompressed data in reverse
.reverse
	dec c
	jr nz, .reversenext
	
	dec b
	jp z, .cleanup
	
.reversenext
	ld a, [hld]
	ld [de], a
	inc de
	jr .reverse
	
	
.cleanup
; get type of repeat we just used
	pop hl
; was it relative or absolute?
	bit 7, [hl]
	jr nz, .next

; skip two bytes for absolute
	inc hl
; skip one byte for relative
.next
	inc hl
	jp .loop
; c2f

