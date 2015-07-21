; Functions to copy data from ROM.


Functiondc9:: ; dc9
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

Functionddc:: ; ddc
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

Functiondef:: ; def
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

Functiondfd:: ; dfd
	dec c
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

.loop
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
	jr c, .done
	sub $8
	ld c, a
	ld a, $f
	ld [hDMATransfer], a
	call DelayFrame
	ld a, l
	add 0
	ld l, a
	ld a, h
	adc 1
	ld h, a
	ld a, e
	add 0
	ld e, a
	ld a, d
	adc 1
	ld d, a
	jr .loop

.done
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



Special_ReplaceKrisSprite:: ; e4a
	callba Function14135
	ret
; e51



Functione51:: ; e51
	callba Functionfb449
	ret
; e58

Functione58:: ; e58
	callba Functionfb4be
	ret
; e5f



Functione5f:: ; e5f
	callba Functionfb48a
	callba Functionfb4b0
	ret
; e6c

Functione6c:: ; e6c
	callba Functionfb4b0
	ret
; e73

Functione73:: ; e73
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



FarCopyBytes:: ; e8d
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


FarCopyBytesDouble:: ; e9b
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
rept 2
	ld [hli], a
endr
.dec
	dec c
	jr nz, .loop
	dec b
	jr nz, .loop

	pop af
	rst Bankswitch
	ret
; 0xeba


Request2bpp:: ; eba
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
	ld [Requested2bppSource], a
	ld a, d
	ld [Requested2bppSource + 1], a
	ld a, l
	ld [Requested2bppDest], a
	ld a, h
	ld [Requested2bppDest + 1], a

.asm_eec
	ld a, c
	ld hl, $ffd3
	cp [hl]
	jr nc, .asm_f08

	ld [Requested2bpp], a
.wait
	call DelayFrame
	ld a, [Requested2bpp]
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
	ld [Requested2bpp], a
.asm_f0d
	call DelayFrame
	ld a, [Requested2bpp]
	and a
	jr nz, .asm_f0d
	ld a, c
	ld hl, $ffd3
	sub [hl]
	ld c, a
	jr .asm_eec
; f1e


Request1bpp:: ; f1e
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
	ld [Requested1bppSource], a
	ld a, d
	ld [Requested1bppSource + 1], a
	ld a, l
	ld [Requested1bppDest], a
	ld a, h
	ld [Requested1bppDest + 1], a
.asm_f50
	ld a, c
	ld hl, $ffd3
	cp [hl]
	jr nc, .asm_f6c

	ld [Requested1bpp], a
.wait
	call DelayFrame
	ld a, [Requested1bpp]
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
	ld [Requested1bpp], a
.asm_f71
	call DelayFrame
	ld a, [Requested1bpp]
	and a
	jr nz, .asm_f71
	ld a, c
	ld hl, $ffd3
	sub [hl]
	ld c, a
	jr .asm_f50
; f82


Get2bpp:: ; f82
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request2bpp

Copy2bpp:: ; f89
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


Get1bpp:: ; f9d
	ld a, [rLCDC]
	bit 7, a
	jp nz, Request1bpp

Copy1bpp:: ; fa4
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
rept 3
	add hl, hl
endr
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble
; fb6
