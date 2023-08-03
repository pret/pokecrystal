DEF TILES_PER_CYCLE EQU 8
DEF MOBILE_TILES_PER_CYCLE EQU 6

Get2bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy2bpp

	homecall HDMATransfer2bpp

	ret

Get1bppViaHDMA::
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp z, Copy1bpp

	homecall HDMATransfer1bpp

	ret

FarCopyBytesDouble_DoubleBankSwitch::
	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call FarCopyBytesDouble

	pop af
	rst Bankswitch
	ret

SafeHDMATransfer::
; Copy c 2bpp tiles from b:de to hl using GDMA. Assumes $00 < c <= $80.
	dec c
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a
	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	; load the source and target MSB and LSB
	ld a, d
	ldh [rHDMA1], a ; source MSB
	ld a, e
	ldh [rHDMA2], a ; source LSB
	ld a, h
	ldh [rHDMA3], a ; target MSB
	ld a, l
	ldh [rHDMA4], a ; target LSB

	; if LCD is disabled, just run all of it
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jr nz, .lcd_enabled

	ld a, c
	ldh [rHDMA5], a
	jr .done

.lcd_enabled
	push de
	di
.loop
	ld a, c
	cp 3
	ld d, c
	jr c, .got_tilecopy
	ld d, 2
.got_tilecopy
	push bc
	lb bc, %11, LOW(rSTAT)
.wait_hblank1
	ld a, [c]
	and b
	jr z, .wait_hblank1
.wait_hblank2
	ld a, [c]
	and b
	jr nz, .wait_hblank2

	ld a, d
	ldh [rHDMA5], a
	pop bc
	ld a, c
	sub 3
	ld c, a
	jr nc, .loop
	ei
	pop de
.done
	pop af
	rst Bankswitch
	pop af
	ldh [hBGMapMode], a
	ret

UpdatePlayerSprite::
	farcall _UpdatePlayerSprite
	ret

LoadStandardFont::
	farcall _LoadStandardFont
	ret

LoadFontsBattleExtra::
	farcall _LoadFontsBattleExtra
	ret

LoadFontsExtra::
	farcall _LoadFontsExtra1
	farcall _LoadFontsExtra2
	ret

DecompressRequest2bpp::
	push de
	ld a, BANK(sScratch)
	call OpenSRAM
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

FarCopyBytes::
; copy bc bytes from a:hl to de

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
	rst Bankswitch

	call CopyBytes

	pop af
	rst Bankswitch
	ret

FarCopyBytesDouble:
; Copy bc bytes from a:hl to bc*2 bytes at de,
; doubling each byte in the process.

	ldh [hTempBank], a
	ldh a, [hROMBank]
	push af
	ldh a, [hTempBank]
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

CheckGDMA:
; Check if we can use GDMA. Return carry if we can.
	ldh a, [hCGB]
	and a
	ret z

	; The 4 least significant bits must be zero.
	ld a, e
	or l
	and $f
	ret nz

	; Must be a copy from non-VRAM to VRAM.
	ld a, d
	sub $80
	cp $20
	ccf
	ret nc
	ld a, h
	sub $80
	cp $20
	ret nc

	; Must not be a copy of >$80 tiles.
	ld a, c
	dec a
	add a
	ccf
	ret

Request2bpp::
; Load 2bpp at b:de to occupy c tiles of hl.
	call CheckGDMA
	jp c, SafeHDMATransfer

	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ldh a, [hTilesPerCycle]
	push af
	ld a, TILES_PER_CYCLE
	ldh [hTilesPerCycle], a

	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ldh a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, MOBILE_TILES_PER_CYCLE
	ldh [hTilesPerCycle], a

.NotMobile:
	ld a, e
	ld [wRequested2bppSource], a
	ld a, d
	ld [wRequested2bppSource + 1], a
	ld a, l
	ld [wRequested2bppDest], a
	ld a, h
	ld [wRequested2bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .cycle

	ld [wRequested2bppSize], a
.wait
	call DelayFrame
	ld a, [wRequested2bppSize]
	and a
	jr nz, .wait

	pop af
	ldh [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ldh a, [hTilesPerCycle]
	ld [wRequested2bppSize], a

.wait2
	call DelayFrame
	ld a, [wRequested2bppSize]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

Request1bpp::
; Load 1bpp at b:de to occupy c tiles of hl.
	ldh a, [hBGMapMode]
	push af
	xor a
	ldh [hBGMapMode], a

	ldh a, [hROMBank]
	push af
	ld a, b
	rst Bankswitch

	ldh a, [hTilesPerCycle]
	push af
	ld a, TILES_PER_CYCLE
	ldh [hTilesPerCycle], a

	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, .NotMobile
	ldh a, [hMobile]
	and a
	jr nz, .NotMobile
	ld a, MOBILE_TILES_PER_CYCLE
	ldh [hTilesPerCycle], a

.NotMobile:
	ld a, e
	ld [wRequested1bppSource], a
	ld a, d
	ld [wRequested1bppSource + 1], a
	ld a, l
	ld [wRequested1bppDest], a
	ld a, h
	ld [wRequested1bppDest + 1], a
.loop
	ld a, c
	ld hl, hTilesPerCycle
	cp [hl]
	jr nc, .cycle

	ld [wRequested1bppSize], a
.wait
	call DelayFrame
	ld a, [wRequested1bppSize]
	and a
	jr nz, .wait

	pop af
	ldh [hTilesPerCycle], a

	pop af
	rst Bankswitch

	pop af
	ldh [hBGMapMode], a
	ret

.cycle
	ldh a, [hTilesPerCycle]
	ld [wRequested1bppSize], a

.wait2
	call DelayFrame
	ld a, [wRequested1bppSize]
	and a
	jr nz, .wait2

	ld a, c
	ld hl, hTilesPerCycle
	sub [hl]
	ld c, a
	jr .loop

Get2bpp::
; copy c 2bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request2bpp
	; fallthrough

Copy2bpp:
	call CheckGDMA
	jp c, SafeHDMATransfer

	push hl
	ld h, d
	ld l, e
	pop de

; bank
	ld a, b

; bc = c * LEN_2BPP_TILE
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

Get1bpp::
; copy c 1bpp tiles from b:de to hl
	ldh a, [rLCDC]
	bit rLCDC_ENABLE, a
	jp nz, Request1bpp
	; fallthrough

Copy1bpp::
	push de
	ld d, h
	ld e, l

; bank
	ld a, b

; bc = c * LEN_1BPP_TILE
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
