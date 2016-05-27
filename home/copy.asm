; Functions to copy data from ROM.


Get2bpp_2:: ; dc9
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy2bpp

	homecall _Get2bpp

	ret
; ddc

Get1bpp_2:: ; ddc
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy1bpp

	homecall _Get1bpp

	ret
; def

FarCopyBytesDouble_DoubleBankSwitch:: ; def
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

OldDMATransfer:: ; dfd
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
; load the source and target MSB and LSB
	ld a, d
	ld [rHDMA1], a ; source MSB
	ld a, e
	and $f0
	ld [rHDMA2], a ; source LSB
	ld a, h
	and $1f
	ld [rHDMA3], a ; target MSB
	ld a, l
	and $f0
	ld [rHDMA4], a ; target LSB
; stop when c < 8
	ld a, c
	cp $8
	jr c, .done
; decrease c by 8
	sub $8
	ld c, a
; DMA transfer state
	ld a, $f
	ld [hDMATransfer], a
	call DelayFrame
; add $100 to hl and de
	ld a, l
	add $100 % $100
	ld l, a
	ld a, h
	adc $100 / $100
	ld h, a
	ld a, e
	add $100 % $100
	ld e, a
	ld a, d
	adc $100 / $100
	ld d, a
	jr .loop

.done
	ld a, c
	and $7f ; pretty silly, considering at most bits 0-2 would be set
	ld [hDMATransfer], a
	call DelayFrame
	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret
; e4a



ReplaceKrisSprite:: ; e4a
	callba _ReplaceKrisSprite
	ret
; e51



LoadStandardFont:: ; e51
	callba _LoadStandardFont
	ret
; e58

LoadFontsBattleExtra:: ; e58
	callba _LoadFontsBattleExtra
	ret
; e5f



LoadFontsExtra:: ; e5f
	callba _LoadFontsExtra1
	callba _LoadFontsExtra2
	ret
; e6c

LoadFontsExtra2:: ; e6c
	callba _LoadFontsExtra2
	ret
; e73

DecompressRequest2bpp:: ; e73
	push de
	ld a, BANK(sScratch)
	call GetSRAMBank
	push bc

	ld de, sScratch
	ld a, b
	call FarDecompress

	pop bc
	pop hl

	ld de, sScratch
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


Request2bpp:: ; eba
; Load 2bpp at b:de to occupy c tiles of hl.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, [hTilesPerCycle]
	push af
	ld a, $8
	ld [hTilesPerCycle], a

	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ld a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, $6
	ld [hTilesPerCycle], a

.NotMobile:
	ld a, e
	ld [Requested2bppSource], a
	ld a, d
	ld [Requested2bppSource + 1], a
	ld a, l
	ld [Requested2bppDest], a
	ld a, h
	ld [Requested2bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .iterate

	ld [Requested2bpp], a
.wait
	call DelayFrame
	ld a, [Requested2bpp]
	and a
	jr nz, .wait

	pop af
	ld [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

.iterate
	ld a, [hTilesPerCycle]
	ld [Requested2bpp], a

.wait2
	call DelayFrame
	ld a, [Requested2bpp]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop
; f1e


Request1bpp:: ; f1e
; Load 1bpp at b:de to occupy c tiles of hl.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a

	ld a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ld a, [hTilesPerCycle]
	push af

	ld a, $8
	ld [hTilesPerCycle], a
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ld a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, $6
	ld [hTilesPerCycle], a

.NotMobile:
	ld a, e
	ld [Requested1bppSource], a
	ld a, d
	ld [Requested1bppSource + 1], a
	ld a, l
	ld [Requested1bppDest], a
	ld a, h
	ld [Requested1bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .iterate

	ld [Requested1bpp], a
.wait
	call DelayFrame
	ld a, [Requested1bpp]
	and a
	jr nz, .wait

	pop af
	ld [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ld [hBGMapMode], a
	ret

.iterate
	ld a, [hTilesPerCycle]
	ld [Requested1bpp], a

.wait2
	call DelayFrame
	ld a, [Requested1bpp]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop
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
	add hl, hl
	add hl, hl
	add hl, hl
	ld b, h
	ld c, l
	pop af

	pop hl
	jp FarCopyBytesDouble
; fb6
