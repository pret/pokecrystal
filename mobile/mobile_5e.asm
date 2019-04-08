MobileAdapterGFX::
INCBIN "gfx/mobile/mobile_adapter.2bpp"

Function17a68f::
	call Function17a6a8
	call Function17a751
	ld hl, $d088
	bit 5, [hl]
	jr z, .asm_17a6a6
	ld de, wStringBuffer1 ; $d073
	push de
	call Function17a721
	pop de
	xor a
	ret

.asm_17a6a6
	scf
	ret

Function17a6a8:
	push de
	push bc
	ld hl, wStringBuffer2 ; $d086
	ld bc, $a
	xor a
	call ByteFill
	ld hl, wBuffer1
	ld bc, $10
	ld a, $ff
	call ByteFill
	pop bc
	ld a, c
	and a
	jr z, .asm_17a6c9
	ld hl, $d088
	set 4, [hl]
.asm_17a6c9
	pop de
	call Function17a6f5
	call Function17aba0
	farcall Function106464
	call Function17ac0c
	farcall HDMATransferAttrMapAndTileMapToWRAMBank3
	call Function17abcf
	farcall LoadOW_BGPal7
	farcall Function49420
	call SetPalettes
	call DelayFrame
	ret

Function17a6f5:
	ld hl, wBuffer1
	ld c, $0
	ld b, $8
.asm_17a6fc
	ld a, [de]
	call Function17a713
	jr c, .asm_17a70e
	ld a, [de]
	swap a
	call Function17a713
	jr c, .asm_17a70e
	inc de
	dec b
	jr nz, .asm_17a6fc
.asm_17a70e
	ld a, c
	ld [$d08c], a
	ret

Function17a713:
	and $f
	cp $a
	jr nc, .asm_17a71d
	ld [hli], a
	inc c
	and a
	ret

.asm_17a71d
	ld [hl], $ff
	scf
	ret

Function17a721:
	push de
	ld h, d
	ld l, e
	ld bc, $8
	ld a, $ff
	call ByteFill
	pop de
	ld hl, wBuffer1
	ld b, $8
.asm_17a732
	ld c, $0
	ld a, [hli]
	cp $a
	jr nc, .asm_17a748
	ld c, a
	ld a, [hli]
	cp $a
	jr nc, .asm_17a74c
	swap a
	or c
	ld [de], a
	inc de
	dec b
	jr nz, .asm_17a732
	ret

.asm_17a748
	ld a, $ff
	ld [de], a
	ret

.asm_17a74c
	ld a, $f0
	or c
	ld [de], a
	ret

Function17a751:
	xor a
	ld [$d087], a
.asm_17a755
	call Function17a781
	call Function17a7ae
	call Function17a97b
	call Function17a770
	call Function17a78f
	ld hl, $d08f
	inc [hl]
	ld a, [$d087]
	bit 7, a
	jr z, .asm_17a755
	ret

Function17a770:
	ldh a, [hOAMUpdate]
	push af
	ld a, $1
	ldh [hOAMUpdate], a
	call HideSprites
	call Function17a9cb
	pop af
	ldh [hOAMUpdate], a
	ret

Function17a781:
	ldh a, [hInMenu]
	push af
	ld a, $1
	ldh [hInMenu], a
	call JoyTextDelay
	pop af
	ldh [hInMenu], a
	ret

Function17a78f:
	ld hl, $d088
	bit 7, [hl]
	res 7, [hl]
	jr nz, .asm_17a79f
	farcall HDMATransferTileMapToWRAMBank3
	ret

.asm_17a79f
	farcall ReloadMapPart
	ret

Function17a7a6:
	ld a, [$d087]
	inc a
	ld [$d087], a
	ret

Function17a7ae:
	ld a, [$d087]
	ld hl, Jumptable_17a7b6
	rst JumpTable
	ret

Jumptable_17a7b6:
	dw Function17a7c2
	dw Function17a7cd
	dw Function17a7d8
	dw Function17a7ff
	dw Function17a81a
	dw Function17a7f4

Function17a7c2:
	ld a, $4
	call Function17aad3
	ld a, $1
	ld [$d087], a
	ret

Function17a7cd:
	call Function17a83c
	call Function17a8ae
	ret c
	call Function17a848
	ret

Function17a7d8:
	call Function17a83c
	call Function17a848
	ld hl, $d08b
	dec [hl]
	ret nz
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld a, $1
	ld [$d087], a
	ret

Function17a7f4:
	ld hl, $d08b
	dec [hl]
	ret nz
	ld hl, $d087
	set 7, [hl]
	ret

Function17a7ff:
	ld hl, $d08b
	dec [hl]
	ret nz
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	set 5, [hl]
	ld hl, $d087
	set 7, [hl]
	ret

Function17a81a:
	call IsSFXPlaying
	ret nc
	ldh a, [hJoyPressed]
	and $3
	ret z
	call ExitMenu
	call Function17ac1d
	call Function17ac2a
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	res 6, [hl]
	ld a, $1
	ld [$d087], a
	ret

Function17a83c:
	ldh a, [hJoyLast]
	and $f0
	ld c, a
	ldh a, [hJoyPressed]
	and $b
	or c
	ld c, a
	ret

Function17a848:
	ld a, c
	and $60
	cp $60
	jr z, .asm_17a876
	ld a, c
	and $50
	cp $50
	jr z, .asm_17a87d
	ld a, c
	and $a0
	cp $a0
	jr z, .asm_17a884
	ld a, c
	and $90
	cp $90
	jr z, .asm_17a88b
	bit 6, c
	jr nz, .asm_17a892
	bit 7, c
	jr nz, .asm_17a899
	bit 5, c
	jr nz, .asm_17a8a0
	bit 4, c
	jr nz, .asm_17a8a7
	xor a
	ret

.asm_17a876
	ld a, $9
	call Function17aad0
	scf
	ret

.asm_17a87d
	ld a, $a
	call Function17aad0
	scf
	ret

.asm_17a884
	ld a, $b
	call Function17aad0
	scf
	ret

.asm_17a88b
	ld a, $c
	call Function17aad0
	scf
	ret

.asm_17a892
	ld a, $5
	call Function17aad0
	scf
	ret

.asm_17a899
	ld a, $6
	call Function17aad0
	scf
	ret

.asm_17a8a0
	ld a, $7
	call Function17aad0
	scf
	ret

.asm_17a8a7
	ld a, $8
	call Function17aad0
	scf
	ret

Function17a8ae:
	bit 1, c
	jr nz, .asm_17a8bc
	bit 0, c
	jr nz, .asm_17a8cc
	bit 3, c
	jr nz, .asm_17a8d7
	xor a
	ret

.asm_17a8bc
	ld a, $b
	ld [$d08a], a
	call Function17aa98
	call Function17a943
	call Function17aa88
	scf
	ret

.asm_17a8cc
	call Function17aad7
	call Function17aa98
	call Function17a8de
	scf
	ret

.asm_17a8d7
	ld a, $c
	call Function17aad3
	scf
	ret

Function17a8de:
	ld a, $2
	call Function17aae0
	ld a, [hl]
	cp $f1
	jr z, .asm_17a8fd
	cp $f0
	jr z, .asm_17a904
	cp $f2
	jr z, .asm_17a911
	ld e, a
	call Function17a964
	ld a, $2
	ld [$d087], a
	call Function17aa88
	ret

.asm_17a8fd
	call Function17a943
	call Function17aa88
	ret

.asm_17a904
	call Function17aad7
	call Function17aa98
	call Function17a91e
	call Function17aa88
	ret

.asm_17a911
	call Function17aa98
	ld a, $5
	ld [$d087], a
	xor a
	call Function17aa88
	ret

Function17a91e:
	ld a, [$d08c]
	cp $7
	jr c, .asm_17a92c
	ld a, $3
	ld [$d087], a
	xor a
	ret

.asm_17a92c
	call LoadStandardMenuHeader
	call Function17a99e
	ld hl, $d088
	set 7, [hl]
	ld hl, $d088
	set 6, [hl]
	ld a, $4
	ld [$d087], a
	scf
	ret

Function17a943:
	ld a, [$d08c]
	and a
	jr z, .asm_17a95d
	dec a
	ld [$d08c], a
	ld c, a
	ld b, $0
	ld hl, wBuffer1
	add hl, bc
	ld [hl], $ff
	ld a, $2
	ld [$d087], a
	and a
	ret

.asm_17a95d
	ld a, $5
	ld [$d087], a
	xor a
	ret

Function17a964:
	ld a, [$d08c]
	cp $10
	jr nc, .asm_17a979
	ld c, a
	ld b, $0
	inc a
	ld [$d08c], a
	ld hl, wBuffer1
	add hl, bc
	ld [hl], e
	and a
	ret

.asm_17a979
	scf
	ret

Function17a97b:
	hlcoord 1, 1
	lb bc, 2, 18
	call ClearBox
	hlcoord 3, 2
	ld de, wBuffer1
	ld a, [$d08c]
	and a
	ret z
	ld c, a
.asm_17a990
	ld a, [de]
	inc de
	cp $a
	jr nc, .asm_17a99d
	add $f6
	ld [hli], a
	dec c
	jr nz, .asm_17a990
	ret

.asm_17a99d
	ret

Function17a99e:
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call Function17ac46
	hlcoord 2, 14
	ld de, String_17a9b2
	call PlaceString
	ret

String_17a9b2:
	db   "でんわばんごうが　ただしく"
	next "はいって　いません！"
	db   "@"

Function17a9cb:
	ld de, wVirtualOAM ; $c400
	ld hl, $d088
	bit 6, [hl]
	jr nz, .bit_6_set
	call Function17a9e3
	call Function17aa22
	call Function17a9f5
	ret

.bit_6_set
	call Function17a9e3
	ret

Function17a9e3:
	ld a, $3
	ld [$d08e], a
	ld hl, Unknown_17aa77
	ld b, $8
	ld c, $8
	ld a, $5
	call Function17aa4a
	ret

Function17a9f5:
	ld a, [$d08c]
	cp $10
	ret nc
	ld a, [$d08f]
	swap a
	and $1
	add $1
	ld [$d08e], a
	ld a, [$d08c]
	cp $10
	jr c, .okay
	dec a
.okay
	ld c, $8
	call SimpleMultiply
	add $18
	ld b, a
	ld c, $11
	ld hl, Unknown_17aa72
	ld a, $4
	call Function17aa4a
	ret

Function17aa22:
	ld a, $0
	ld [$d08e], a
	push de
	ld a, $3
	call Function17aae0
	add a
	add a
	add a
	add $0
	push af
	ld a, $4
	call Function17aae0
	add a
	add a
	add a
	add $8
	ld c, a
	pop af
	ld b, a
	pop de
	ld a, $0
	ld hl, Unknown_17aa77
	call Function17aa4a
	ret

Function17aa4a:
	ld [$d08d], a
	ld a, b
	add $8
	ld b, a
	ld a, c
	add $10
	ld c, a
	ld a, [hli]
.loop
	push af
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [hli]
	add b
	ld [de], a
	inc de
	ld a, [$d08d]
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [$d08e]
	or [hl]
	inc hl
	ld [de], a
	inc de
	pop af
	dec a
	jr nz, .loop
	ret

Unknown_17aa72:
	db 1
	db 0, 0, 0, 0

Unknown_17aa77:
	db 4
	db 0, 0, 0, 0
	db 0, 8, 1, 0
	db 8, 0, 2, 0
	db 8, 8, 3, 0

Function17aa88:
	jr c, asm_17aa91
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	ret

asm_17aa91:
	ld de, SFX_WRONG
	call PlaySFX
	ret

Function17aa98:
	ld a, $5
	ld [$d08b], a
	call Function17aaa9
	call Function17aac3
	ld hl, $d088
	set 7, [hl]
	ret

Function17aaa9:
	ld a, $3
	call Function17aae3
	ld c, a
	ld b, $0
	hlcoord 0, 0, wAttrMap
	add hl, bc
	push hl
	ld a, $4
	call Function17aae3
	ld bc, $14
	pop hl
	call AddNTimes
	ret

Function17aac3:
	ld a, $b
	push hl
	ld [hli], a
	ld [hli], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	ld [hli], a
	ld [hli], a
	ret

Function17aad0:
	call Function17aae0

Function17aad3:
	ld [$d089], a
	ret

Function17aad7:
	push af
	ld a, [$d089]
	ld [$d08a], a
	pop af
	ret

Function17aae0:
	call Function17aad7

Function17aae3:
	push af
	ld a, [$d08a]
	ld bc, $d
	ld hl, Unknown_17aaf7
	call AddNTimes
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret

Unknown_17aaf7:
	db $0, $0, $1, $6, $5, $9, $3, $2, $1, $2, $1, $2, $4
	db $0, $0, $2, $9, $5, $a, $4, $0, $2, $a, $a, $3, $5
	db $0, $0, $3, $c, $5, $b, $5, $1, $0, $1, $0, $4, $0
	db $0, $0, $4, $6, $8, $0, $6, $5, $4, $5, $1, $5, $7
	db $0, $0, $5, $9, $8, $1, $7, $3, $5, $0, $2, $6, $8
	db $0, $0, $6, $c, $8, $2, $8, $4, $3, $1, $3, $7, $3
	db $0, $0, $7, $6, $b, $3, $9, $8, $7, $8, $4, $8, $a
	db $0, $0, $8, $9, $b, $4, $a, $6, $8, $3, $5, $9, $b
	db $0, $0, $9, $c, $b, $5, $b, $7, $6, $4, $6, $a, $6
	db $0, $0,$f2, $6, $e, $6, $0, $c, $a, $c, $7, $c, $0
	db $0, $0, $0, $9, $e, $7, $1, $9, $b, $6, $8, $1, $1
	db $0, $0,$f1, $c, $e, $8, $2, $a, $c, $7, $c, $2, $c
	db $0, $0,$f0,$10, $e, $c, $c, $b, $9, $b, $9, $b, $9

Function17aba0:
	ldh a, [rVBK]
	push af
	ld a, $1
	ldh [rVBK], a

	ld hl, vTiles5 tile $00
	ld de, GFX_17afa5
	lb bc, BANK(GFX_17afa5), $80
	call Get2bpp

	pop af
	ldh [rVBK], a

	ld hl, vTiles0 tile $00
	ld de, GFX_17afa5 + $4c0
	lb bc, BANK(GFX_17afa5), 5
	call Get2bpp

	ld hl, vTiles0 tile $05
	ld de, GFX_11601a
	lb bc, BANK(GFX_11601a), 4
	call Get2bpp
	ret

Function17abcf:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	ld hl, Palette_17ac55
	ld de, wBGPals1 ; $d000
	ld bc, 6 palettes
	call CopyBytes

	ld hl, Palette_17ac95
	ld de, wOBPals1
	ld bc, 8 palettes
	call CopyBytes

	ld hl, GFX_17afa5 + $510
	ld de, wOBPals1 palette 1
	ld bc, 2 palettes
	call CopyBytes

	ld hl, MapObjectPals palette 1
	ld de, wOBPals1 palette 3
	ld bc, 1 palettes
	ld a, BANK(MapObjectPals)
	call FarCopyBytes

	pop af
	ldh [rSVBK], a
	ret

Function17ac0c:
	call Function17ac1d
	call Function17ac2a
	hlcoord 0, 0
	ld b, 2
	ld c, SCREEN_WIDTH - 2
	call Function17ac46
	ret

Function17ac1d:
	ld hl, Tilemap_17acd5
	decoord 0, 4
	ld bc, (SCREEN_HEIGHT - 4) * SCREEN_WIDTH
	call CopyBytes
	ret

Function17ac2a:
	ld hl, Tilemap_17ae3d
	decoord 0, 4, wAttrMap
	ld bc, (SCREEN_HEIGHT - 4) * SCREEN_WIDTH
	call CopyBytes
	hlcoord 0, 4, wAttrMap
	ld bc, (SCREEN_HEIGHT - 4) * SCREEN_WIDTH
.loop
	ld a, [hl]
	or $8
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Function17ac46:
	ld a, [$d088]
	bit 4, a
	jr nz, .bit_4_set
	call Textbox
	ret

.bit_4_set
	call Function3eea
	ret

Palette_17ac55:
	RGB  0,  0,  0
	RGB  9, 10, 25
	RGB 16, 19, 31
	RGB 31, 31, 31

	RGB  5, 11,  9
	RGB  7, 14, 12
	RGB 17, 24, 22
	RGB 28, 31, 31

	RGB  0,  0,  0
	RGB  3,  0, 10
	RGB  3,  3, 16
	RGB  6,  8, 25

	RGB  5, 11,  9
	RGB 28, 31, 31
	RGB  7, 14, 12
	RGB 17, 24, 22

	RGB  0,  0,  0
	RGB  5,  2, 16
	RGB  8,  8, 26
	RGB 13,  9, 17

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

Palette_17ac95:
	RGB 31, 31, 31
	RGB  4,  3,  3
	RGB 31, 13,  0
	RGB 31, 31, 31

	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31

	RGB 31,  0,  0
	RGB 16,  3,  0
	RGB 28, 19, 11
	RGB 31, 31, 31

	RGB 31, 16,  0
	RGB  9,  6,  4
	RGB 31, 16,  0
	RGB 31, 24,  0

	RGB 31, 18,  6
	RGB  0,  3,  0
	RGB  0,  9,  0
	RGB  0, 12,  0

	RGB  0, 16,  0
	RGB  0, 22,  0
	RGB  0, 25,  0
	RGB  0, 27,  0

	RGB  0, 31,  0
	RGB  3, 31,  0
	RGB  8, 31,  0
	RGB 14, 31,  0

	RGB 16, 31,  0
	RGB 22, 31,  0
	RGB 27, 31,  0
	RGB 31, 31,  0

Tilemap_17acd5:
INCBIN "gfx/unknown/17acd5.tilemap"

Tilemap_17ae3d:
INCBIN "gfx/unknown/17ae3d.tilemap"

GFX_17afa5::
INCBIN "gfx/unknown/17afa5.2bpp"
