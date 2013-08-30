; Functions to copy data from ROM.


Functiondc9: ; dc9
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy2bpp

	ld a, [hROMBank]
	push af
	ld a, BANK(Function104284)
	rst Bankswitch
	call Function104284
	pop af
	rst Bankswitch

	ret
; ddc

Functionddc: ; ddc
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy1bpp

	ld a, [hROMBank]
	push af
	ld a, BANK(Function1042b2)
	rst Bankswitch
	call Function1042b2
	pop af
	rst Bankswitch

	ret
; def

Functiondef: ; def
	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch
	call FarCopyBytesDouble
	pop af
	rst Bankswitch
	ret
; dfd

Functiondfd: ; dfd
	dec c
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

.asm_e09
	ld a, d
	ld [rHDMA1], a
	ld a, e
	and $f0
	ld [rHDMA2], a
	ld a, h
	and $1f
	ld [rHDMA3], a
	ld a, l
	and $f0
	ld [rHDMA4], a
	ld a, c
	cp $8
	jr c, .asm_e3c
	sub $8
	ld c, a
	ld a, $f
	ld [hDMATransfer], a
	call DelayFrame
	ld a, l
	add $0
	ld l, a
	ld a, h
	adc $1
	ld h, a
	ld a, e
	add $0
	ld e, a
	ld a, d
	adc $1
	ld d, a
	jr .asm_e09

.asm_e3c
	ld a, c
	and $7f
	ld [hDMATransfer], a
	call DelayFrame
	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret
; e4a



Functione4a: ; e4a
	ld a, $5
	ld hl, $4135
	rst FarCall
	ret
; e51



Functione51: ; e51
	ld a, $3e
	ld hl, $7449
	rst FarCall
	ret
; e58

Functione58: ; e58
	ld a, $3e
	ld hl, $74be
	rst FarCall
	ret
; e5f



Functione5f: ; e5f
	ld a, $3e
	ld hl, $748a
	rst FarCall
	ld a, $3e
	ld hl, $74b0
	rst FarCall
	ret
; e6c

Functione6c: ; e6c
	ld a, $3e
	ld hl, $74b0
	rst FarCall
	ret
; e73

Functione73: ; e73
	push de
	ld a, $0
	call GetSRAMBank
	push bc
	ld de, $a000
	ld a, b
	call FarDecompress
	pop bc
	pop hl
	ld de, $a000
	call Request2bpp
	call CloseSRAM
	ret
; e8d



FarCopyBytes: ; e8d
; copy bc bytes from a:hl to de

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret
; 0xe9b


FarCopyBytesDouble: ; e9b
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ld [hBuffer], a
	ld a, [hROMBank]
	push af
	ld a, [hBuffer]
	rst Bankswitch

; switcheroo, de <> hl
	ld a, h
	ld h, d
	ld d, a
	ld a, l
	ld l, e
	ld e, a

	inc b
	inc c
	jr .dec

.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld [hli], a
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret
; 0xeba


Request2bpp: ; eba
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, [$ffd3]
	push af

	ld a, $8
	ld [$ffd3], a
	ld a, [InLinkBattle]
	cp $4
	jr nz, .asm_edc
	ld a, [$ffe9]
	and a
	jr nz, .asm_edc
	ld a, $6
	ld [$ffd3], a

.asm_edc
	ld a, e
	ld [$cf68], a
	ld a, d
	ld [$cf69], a
	ld a, l
	ld [$cf6a], a
	ld a, h
	ld [$cf6b], a

.asm_eec
	ld a, c
	ld hl, $ffd3
	cp [hl]
	jr nc, .asm_f08

	ld [$cf67], a
.wait
	call DelayFrame
	ld a, [$cf67]
	and a
	jr nz, .wait

	pop af
	ld [$ffd3], a

	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

.asm_f08
	ld a, [$ffd3]
	ld [$cf67], a
.asm_f0d
	call DelayFrame
	ld a, [$cf67]
	and a
	jr nz, .asm_f0d
	ld a, c
	ld hl, $ffd3
	sub [hl]
	ld c, a
	jr .asm_eec
; f1e


Request1bpp: ; f1e
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, [$ffd3]
	push af

	ld a, $8
	ld [$ffd3], a
	ld a, [InLinkBattle]
	cp $4
	jr nz, .asm_f40
	ld a, [$ffe9]
	and a
	jr nz, .asm_f40
	ld a, $6
	ld [$ffd3], a

.asm_f40
	ld a, e
	ld [$cf6d], a
	ld a, d
	ld [$cf6e], a
	ld a, l
	ld [$cf6f], a
	ld a, h
	ld [$cf70], a
.asm_f50
	ld a, c
	ld hl, $ffd3
	cp [hl]
	jr nc, .asm_f6c

	ld [$cf6c], a
.wait
	call DelayFrame
	ld a, [$cf6c]
	and a
	jr nz, .wait

	pop af
	ld [$ffd3], a

	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

.asm_f6c
	ld a, [$ffd3]
	ld [$cf6c], a
.asm_f71
	call DelayFrame
	ld a, [$cf6c]
	and a
	jr nz, .asm_f71
	ld a, c
	ld hl, $ffd3
	sub [hl]
	ld c, a
	jr .asm_f50
; f82


Get2bpp: ; f82
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request2bpp

Copy2bpp: ; f89
; copy c 2bpp tiles from b:de to hl

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * $10
	push af
	swap c
	ld a, $f
	and c
	ld b, a
	ld a, $f0
	and c
	ld c, a
	pop af

	jp FarCopyBytes
; f9d


Get1bpp: ; f9d
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request1bpp

Copy1bpp: ; fa4
; copy c 1bpp tiles from b:de to hl

	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * $10 / 2
	push af
	ld h, 0
	ld l, c
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble
; fb6

