Function115d99:
	ld de, MobileDialingGFX
	ld hl, vTiles0 tile $60
	lb bc, BANK(MobileDialingGFX), 20
	call Get2bpp
	xor a
	ld [wc305], a
	ld [wc306], a
	ld [wc309], a
	ld [wc30a], a
	ld [wc30b], a
	ld [wc30c], a
	ld a, $10
	ld [wc307], a
	ld a, $18
	ld [wc308], a
	ret

Function115dc3:
	xor a
	ld [wc305], a
	ld a, $a0
	ld hl, wShadowOAMSprite31
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	ret

Function115dd3:
	ld a, [wc305]
	and a
	ret z
	ld a, $a0
	ld hl, wShadowOAMSprite31
	ld bc, 8 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	call Function115e22
	ld a, [wc309]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e86
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld de, wShadowOAMSprite31
	ld a, [wc307]
	ld c, a
	ld a, [wc308]
	ld b, a
	ld a, [hli]
.asm_115e04
	push af
	ld a, [hli]
	add b
	ld [de], a ; y
	inc de
	ld a, [hli]
	add c
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .asm_115e04
	ret

Function115e18:
	ld a, c
	ld [wc30a], a
	xor a
	ld [wc30b], a
	jr Function115e2b

Function115e22:
	ld hl, wc30c
	dec [hl]
	ret nz
	ld hl, wc30b
	inc [hl]

Function115e2b:
	ld a, [wc30a]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_115e59
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	push de
	pop hl
	ld a, [wc30b]
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	cp $ff
	jr nz, .not_end
	xor a
	ld [wc30b], a
	jr Function115e2b

.not_end
	ld [wc309], a
	ld a, [hl]
	ld [wc30c], a
	ret

Unknown_115e59:
	dw Unknown_115e61
	dw Unknown_115e6c
	dw Unknown_115e76
	dw Unknown_115e79

; OAM idx (see Unknown_115e86), flip flags/duration
Unknown_115e61:
	db $04, $08
	db $05, $08
	db $06, $08
	db $07, $08
	db $08, $08
	db -1

Unknown_115e6c:
	db $01, $08
	db $02, $08
	db $03, $08
	db $09, $08
	db $0a, $08
Unknown_115e76:
	db $00, $08
	db -1

Unknown_115e79:
	db $0b, $08
	db $0c, $08
	db $0d, $08
	db $0e, $08
	db $0f, $08
	db $00, $08
	db -1

Unknown_115e86:
	dw Unknown_115ea6
	dw Unknown_115eb7
	dw Unknown_115ecc
	dw Unknown_115ee1
	dw Unknown_115ef6
	dw Unknown_115f13
	dw Unknown_115f30
	dw Unknown_115f4d
	dw Unknown_115f6a
	dw Unknown_115f87
	dw Unknown_115f9c
	dw Unknown_115fb1
	dw Unknown_115fc6
	dw Unknown_115fdb
	dw Unknown_115ff0
	dw Unknown_116005

Unknown_115ea6:
	db 4
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115eb7:
	db 5
	dbsprite   1,   0, 0, 0, $64, $00
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115ecc:
	db 5
	dbsprite   1,   0, 0, 0, $65, $00
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115ee1:
	db 5
	dbsprite   1,   0, 0, 0, $66, $00
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115ef6:
	db 7
	dbsprite   0,   0, 0, 0, $67, $01
	dbsprite   0,   1, 0, 0, $68, $01
	dbsprite   0,   2, 0, 0, $6d, $00
	dbsprite   1,   2, 0, 0, $69, $00
	dbsprite   2,   2, 0, 0, $6a, $00
	dbsprite   1,   3, 0, 0, $6b, $00
	dbsprite   2,   3, 0, 0, $6c, $00

Unknown_115f13:
	db 7
	dbsprite   0,   0, 0, 0, $67, $01
	dbsprite   0,   1, 0, 0, $68, $01
	dbsprite   0,   2, 0, 0, $6e, $00
	dbsprite   1,   2, 0, 0, $69, $00
	dbsprite   2,   2, 0, 0, $6a, $00
	dbsprite   1,   3, 0, 0, $6b, $00
	dbsprite   2,   3, 0, 0, $6c, $00

Unknown_115f30:
	db 7
	dbsprite   0,   0, 0, 0, $67, $01
	dbsprite   0,   1, 0, 0, $68, $01
	dbsprite   0,   2, 0, 0, $6f, $00
	dbsprite   1,   2, 0, 0, $69, $00
	dbsprite   2,   2, 0, 0, $6a, $00
	dbsprite   1,   3, 0, 0, $6b, $00
	dbsprite   2,   3, 0, 0, $6c, $00

Unknown_115f4d:
	db 7
	dbsprite   0,   0, 0, 0, $67, $01
	dbsprite   0,   1, 0, 0, $68, $01
	dbsprite   0,   2, 0, 0, $70, $00
	dbsprite   1,   2, 0, 0, $69, $00
	dbsprite   2,   2, 0, 0, $6a, $00
	dbsprite   1,   3, 0, 0, $6b, $00
	dbsprite   2,   3, 0, 0, $6c, $00

Unknown_115f6a:
	db 7
	dbsprite   0,   0, 0, 0, $67, $01
	dbsprite   0,   1, 0, 0, $68, $01
	dbsprite   0,   2, 0, 0, $71, $00
	dbsprite   1,   2, 0, 0, $69, $00
	dbsprite   2,   2, 0, 0, $6a, $00
	dbsprite   1,   3, 0, 0, $6b, $00
	dbsprite   2,   3, 0, 0, $6c, $00

Unknown_115f87:
	db 5
	dbsprite   1,   0, 0, 0, $72, $00
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115f9c:
	db 5
	dbsprite   1,   0, 0, 0, $73, $00
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115fb1:
	db 5
	dbsprite   1,   0, 0, 1, $64, $60
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115fc6:
	db 5
	dbsprite   1,   0, 0, 1, $65, $60
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115fdb:
	db 5
	dbsprite   1,   0, 0, 1, $66, $60
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_115ff0:
	db 5
	dbsprite   1,   0, 0, 1, $72, $60
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

Unknown_116005:
	db 5
	dbsprite   1,   0, 0, 1, $73, $60
	dbsprite   0,   1, 0, 0, $60, $01
	dbsprite   1,   1, 0, 0, $61, $01
	dbsprite   0,   2, 0, 0, $62, $01
	dbsprite   1,   2, 0, 0, $63, $01

MobileDialingGFX::
INCBIN "gfx/mobile/dialing.2bpp"

Function11615a:
	xor a
	ld [wc30d], a
	ld [wc319], a
	ld [wc310], a
	ld [wc311], a
	ld [wc312], a
	ld [wc313], a
	ld [wc314], a
	ld [wc314 + 1], a
	ld [wc314 + 4], a
	ld [wc3f6], a
	ld [wc3f8], a
	ld [wc3f2], a
	ld [wc3f4], a
	ld a, $24
	ld [wc3f5], a
	ld a, $7
	ld [wc3f7], a
	ld a, $b0
	ld [wc30e], a
	ld [wc3f1], a
	ld a, $48
	ld [wc30f], a
	ld [wc3f3], a
	ret

Function11619d:
	ld a, [wc30d]
	and a
	ret z
	ld a, [wc319]
	cp $2
	jr c, .asm_1161b4
	ld a, $a0
	ld hl, wShadowOAM
	ld bc, 25 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill

.asm_1161b4
	call Function1161b8
	ret

Function1161b8:
	jumptable .Jumptable, wc319

.Jumptable:
	dw Function1161d5
	dw Function116294
	dw Function1162cb
	dw Function1162f2
	dw Function1163c0
	dw Function11636e
	dw Function116441

Function1161d5:
	ldh a, [rSVBK]
	push af

	ld a, $6
	ldh [rSVBK], a

	ld hl, PichuBorderMobileTilemapAttrmap
	ld de, wDecompressScratch
	ld bc, 32 * 12 * 2
	call CopyBytes

	di

.wait_for_vblank
; Wait until a vblank would occur had interrupts not just been disabled.
	ldh a, [rLY]
	cp LY_VBLANK + 1
	jr nz, .wait_for_vblank

	ld a, $d0
	ldh [rHDMA1], a
	ld a, $0
	ldh [rHDMA2], a
	ld a, $1c
	ldh [rHDMA3], a
	xor a
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	ld a, $d0
	ldh [rHDMA1], a
	ld a, $80
	ldh [rHDMA2], a
	ld a, $1c
	ldh [rHDMA3], a
	ld a, $80
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	ld a, $d1
	ldh [rHDMA1], a
	ld a, $0
	ldh [rHDMA2], a
	ld a, $1d
	ldh [rHDMA3], a
	xor a
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	ld a, $1
	ldh [rVBK], a

	ld a, $d1
	ldh [rHDMA1], a
	ld a, $80
	ldh [rHDMA2], a
	ld a, $1c
	ldh [rHDMA3], a
	xor a
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	ld a, $d2
	ldh [rHDMA1], a
	ld a, $0
	ldh [rHDMA2], a
	ld a, $1c
	ldh [rHDMA3], a
	ld a, $80
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	ld a, $d2
	ldh [rHDMA1], a
	ld a, $80
	ldh [rHDMA2], a
	ld a, $1d
	ldh [rHDMA3], a
	xor a
	ldh [rHDMA4], a
	ld a, $8
	ldh [rHDMA5], a

	xor a
	ldh [rVBK], a

	ei

	pop af
	ldh [rSVBK], a

	farcall ReloadMapPart
	ld a, $8
	ld [wMusicFade], a
	ld de, MUSIC_MOBILE_ADAPTER
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a
	ld a, [wc319]
	inc a
	ld [wc319], a
	ret

MenuHeader_11628c: ; unreferenced
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 6, SCREEN_WIDTH - 1, SCREEN_HEIGHT - 1
	dw NULL
	db 0 ; default option

Function116294:
	farcall Function170d02
	ld a, [wc319]
	inc a
	ld [wc319], a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wBGPals1 palette 6
	ld de, wc320
	ld bc, 2 palettes
	call CopyBytes
	ld hl, PichuBorderMobileBGPalettes
	ld de, wBGPals1 palette 7
	ld bc, 1 palettes
	call CopyBytes
	call SetPalettes
	pop af
	ldh [rSVBK], a
	ld a, $30
	ldh [hWY], a
	ret

Function1162cb:
	farcall Function170cc6
	ld a, [wc319]
	inc a
	ld [wc319], a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, PichuBorderMobileOBPalettes
	ld de, wOBPals1 + 2 palettes
	ld bc, 6 palettes
	call CopyBytes
	call SetPalettes
	pop af
	ldh [rSVBK], a
	ret

Function1162f2:
	call Function11659d
	call Function116758
	call Function1167a6
	ld a, [wc310]
	cp EGG
	ret z
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc30e]
	ld c, a
	ld a, [wc30f]
	ld b, a
	ld a, [wc314 + 4]
	ld e, a
	ld a, [hli]
	sub e
	ld de, wShadowOAMSprite09
.asm_116321
	push af
	ld a, [hli]
	add b
	ld [de], a ; y
	inc de
	ld a, [hli]
	add c
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .asm_116321
	call Function116468
	ld a, [wc3f5]
	sla a
	ld c, a
	ld b, 0
	ld hl, Unknown_1168c5
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	push de
	pop hl
	ld a, [wc3f1]
	ld c, a
	ld a, [wc3f3]
	ld b, a
	ld a, [wc3f8]
	ld e, a
	ld a, [hli]
	sub e
	ld de, wShadowOAMSprite00
.asm_11635a
	push af
	ld a, [hli]
	add b
	ld [de], a ; y
	inc de
	ld a, [hli]
	add c
	ld [de], a ; x
	inc de
	ld a, [hli]
	ld [de], a ; tile id
	inc de
	ld a, [hli]
	ld [de], a ; attributes
	inc de
	pop af
	dec a
	jr nz, .asm_11635a
	ret

Function11636e:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wBGPals2
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call SetPalettes
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld a, $a0
	ld hl, wShadowOAM
	ld bc, 16 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	ld a, $90
	ldh [hWY], a
	call UpdateSprites
	pop af
	ldh [rSVBK], a
	farcall ReloadMapPart
	ld a, $8
	ld [wMusicFade], a
	ld a, [wMapMusic]
	ld [wMusicFadeID], a
	xor a
	ld [wMusicFadeID + 1], a
	xor a
	ld [wc319], a
	ld [wc30d], a
	ret

Function1163c0:
	ldh a, [rSVBK]
	push af
	ld a, $1
	ldh [rSVBK], a
	ld a, $a0
	ld hl, wShadowOAM
	ld bc, 16 * SPRITEOAMSTRUCT_LENGTH
	call ByteFill
	call DelayFrame
	farcall _RefreshSprites
	ld b, SCGB_MAPPALS
	call GetSGBLayout
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, wc320
	ld de, wd030
	ld bc, $0010
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call SetPalettes
	call DelayFrame
	ld a, $90
	ldh [hWY], a
	call UpdateSprites
	farcall _ClearSprites
	pop af
	ldh [rSVBK], a
	farcall ReloadMapPart
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr z, .asm_11642a
	ld a, $8
	ld [wMusicFade], a
	ld a, [wMapMusic]
	ld [wMusicFadeID], a
	xor a
	ld [wMusicFadeID + 1], a
	jr .asm_116439

.asm_11642a
	ld a, $8
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a

.asm_116439
	xor a
	ld [wc319], a
	ld [wc30d], a
	ret

Function116441:
	farcall Function17d405
	ld a, $90
	ldh [hWY], a
	farcall ReloadMapPart
	ld a, $8
	ld [wMusicFade], a
	ld a, [wMapMusic]
	ld [wMusicFadeID], a
	xor a
	ld [wMusicFadeID + 1], a
	xor a
	ld [wc319], a
	ld [wc30d], a
	ret

Function116468:
	call Function116567
	ld a, [wc314]
	cp $d
	jr nz, .asm_1164a8
	ld hl, wc30e
	ld a, [hl]
	cp $50
	jr nc, .asm_116484
	ld a, $50
	sub [hl]
	add $50
	ld [wc3f1], a
	jr .asm_11648d

.asm_116484
	sub $50
	ld c, a
	ld a, $50
	sub c
	ld [wc3f1], a

.asm_11648d
	ld hl, wc30f
	ld a, [hl]
	cp $60
	jr nc, .asm_11649e
	ld a, $60
	sub [hl]
	add $60
	ld [wc3f3], a
	ret

.asm_11649e
	sub $60
	ld c, a
	ld a, $60
	sub c
	ld [wc3f3], a
	ret

.asm_1164a8
	ld hl, wc30e
	ld a, $b0
	cp [hl]
	jr nc, .asm_1164b8
	ld a, [wc3f1]
	and a
	jr z, .asm_11650b
	jr .asm_1164f2

.asm_1164b8
	ld a, [wc3f1]
	sub [hl]
	jr nc, .asm_1164c1
	xor $ff
	inc a

.asm_1164c1
	ld b, a
	ld c, $0
	ld a, $5
.asm_1164c6
	srl b
	rr c
	dec a
	jr nz, .asm_1164c6
	ld a, c
	ld [wc3fa], a
	ld a, b
	ld [wc3f9], a
	ld a, [wc3f1]
	sub [hl]
	jr c, .asm_1164f2
	ld c, $0
	ld a, [wc3fa]
	xor $ff
	add $1
	rl c
	ld [wc3fa], a
	ld a, [wc3f9]
	xor $ff
	add c
	ld [wc3f9], a

.asm_1164f2
	ld a, [wc3f2]
	ld l, a
	ld a, [wc3f1]
	ld h, a
	ld a, [wc3fa]
	ld e, a
	ld a, [wc3f9]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f2], a
	ld a, h
	ld [wc3f1], a

.asm_11650b
	ld hl, wc30f
	ld a, $b0
	cp [hl]
	jr c, .asm_11654d
	ld a, [wc3f3]
	sub [hl]
	jr nc, .asm_11651c
	xor $ff
	inc a

.asm_11651c
	ld b, a
	ld c, $0
	ld a, $5
.asm_116521
	srl b
	rr c
	dec a
	jr nz, .asm_116521
	ld a, c
	ld [wc3fc], a
	ld a, b
	ld [wc3fb], a
	ld a, [wc3f3]
	sub [hl]
	jr c, .asm_11654d
	ld c, $0
	ld a, [wc3fc]
	xor $ff
	add $1
	rl c
	ld [wc3fc], a
	ld a, [wc3fb]
	xor $ff
	add c
	ld [wc3fb], a

.asm_11654d
	ld a, [wc3f4]
	ld l, a
	ld a, [wc3f3]
	ld h, a
	ld a, [wc3fc]
	ld e, a
	ld a, [wc3fb]
	ld d, a
	add hl, de
	ld a, l
	ld [wc3f4], a
	ld a, h
	ld [wc3f3], a
	ret
