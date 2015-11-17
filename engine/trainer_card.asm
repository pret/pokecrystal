Function25105: ; 25105
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function2513b
.asm_25117
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_25132
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_25132
	call Function2518e
	call DelayFrame
	jr .asm_25117
.asm_25132
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	ret

Function2513b: ; 2513b (9:513b)
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD

	callba Function8833e

	ld hl, CardRightCornerGFX
	ld de, VTiles2 tile $1c
	ld bc, 1 tiles
	ld a, BANK(CardRightCornerGFX)
	call FarCopyBytes

	ld hl, CardStatusGFX
	ld de, VTiles2 tile $29
	ld bc, $56 tiles
	ld a, BANK(CardStatusGFX)
	call FarCopyBytes

	call Function25299

	hlcoord 0, 8
	ld d, $6
	call Function253b0

	call EnableLCD
	call WaitBGMap
	ld b, SCGB_15
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	ld hl, wJumptableIndex
	xor a
rept 3
	ld [hli], a
endr
	ld [hl], a
	ret

Function2518e: ; 2518e (9:518e)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, $0
	ld hl, Jumptable_2519d
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_2519d: ; 2519d (9:519d)
	dw Function251b6
	dw Function251d7
	dw Function251f4
	dw Function25221
	dw Function2524c
	dw Function25279
	dw Function251b0


Function251ab: ; 251ab (9:51ab)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function251b0: ; 251b0 (9:51b0)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function251b6: ; 251b6 (9:51b6)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, CardStatusGFX
	ld hl, VTiles2 tile $29
	lb bc, BANK(CardStatusGFX), $56
	call Request2bpp
	call Function2530a
	call Function251ab
	ret

Function251d7: ; 251d7 (9:51d7)
	call Function25415
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT | A_BUTTON
	jr nz, .pressed_right_a
	ret

.pressed_right_a
	ld a, $2
	ld [wJumptableIndex], a
	ret
; 251e9 (9:51e9)

Function251e9: ; 251e9
	ld a, [KantoBadges]
	and a
	ret z

	ld a, $4
	ld [wJumptableIndex], a
	ret
; 251f4

Function251f4: ; 251f4 (9:51f4)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, LeaderGFX
	ld hl, VTiles2 tile $29
	lb bc, BANK(LeaderGFX), $56
	call Request2bpp
	ld de, BadgeGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(BadgeGFX), $2c
	call Request2bpp
	call Function2536c
	call Function251ab
	ret

Function25221: ; 25221 (9:5221)
	ld hl, Unknown_254c9
	call Function25438
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON
	jr nz, Function25246
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_25235
	ret
.asm_25235
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 2523b (9:523b)

Function2523b: ; 2523b
	ld a, [KantoBadges]
	and a
	ret z
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 25246

Function25246: ; 25246
	ld a, $6
	ld [wJumptableIndex], a
	ret

Function2524c: ; 2524c (9:524c)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, LeaderGFX2
	ld hl, VTiles2 tile $29
	lb bc, BANK(LeaderGFX2), $56
	call Request2bpp
	ld de, BadgeGFX2
	ld hl, VTiles0 tile $00
	lb bc, BANK(BadgeGFX2), $2c
	call Request2bpp
	call Function2536c
	call Function251ab
	ret

Function25279: ; 25279 (9:5279)
	ld hl, Unknown_254c9
	call Function25438
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_2528d
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_25293
	ret
.asm_2528d
	ld a, $2
	ld [wJumptableIndex], a
	ret
.asm_25293
	ld a, $0
	ld [wJumptableIndex], a
	ret

Function25299: ; 25299 (9:5299)
	hlcoord 0, 0
	ld d, $5
	call Function253b0
	hlcoord 2, 2
	ld de, String_252ec
	call PlaceString
	hlcoord 2, 4
	ld de, Tilemap_252f9
	call Function253a8
	hlcoord 7, 2
	ld de, PlayerName
	call PlaceString
	hlcoord 5, 4
	ld de, PlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 7, 6
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 3
	ld de, Tilemap_252fc
	call Function253a8
	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ld [hFillBox], a
	predef FillBox
	ret
; 252ec (9:52ec)

String_252ec: ; 252ec
	db   "NAME/"
	next ""
	next "MONEY@"

Tilemap_252f9: ; 252f9
	db $27, $28, $ff ; ID NO

Tilemap_252fc: ; 252fc
	db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $26, $ff ; ____________>
; 2530a

Function2530a: ; 2530a (9:530a)
	hlcoord 2, 10
	ld de, String_2534c
	call PlaceString
	hlcoord 10, 15
	ld de, String_2535c
	call PlaceString
	ld hl, PokedexCaught
	ld b, $20
	call CountSetBits
	ld de, wd265
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum
	call Function25415
	hlcoord 2, 8
	ld de, Tilemap_25366
	call Function253a8
	ld a, [StatusFlags] ; pokedex
	bit 0, a
	ret nz
	hlcoord 1, 9
	lb bc, 2, 17
	call ClearBox
	ret
; 2534c (9:534c)

String_2534c: ; 2534c
	db   "#DEX"
	next "PLAY TIME"
	db   "@"

String_2535b: ; 2535b
	db "@"

String_2535c: ; 2535c
	db "  BADGES▶@"

Tilemap_25366: ; 25366
	db $29, $2a, $2b, $2c, $2d, $ff
; 2536c

Function2536c: ; 2536c (9:536c)
	hlcoord 2, 8
	ld de, Tilemap_253a2
	call Function253a8
	hlcoord 2, 10
	ld a, $29
	ld c, $4
.asm_2537c
	call Function253f4
rept 4
	inc hl
endr
	dec c
	jr nz, .asm_2537c
	hlcoord 2, 13
	ld a, $51
	ld c, $4
.asm_2538d
	call Function253f4
rept 4
	inc hl
endr
	dec c
	jr nz, .asm_2538d
	xor a
	ld [wcf64], a
	ld hl, Unknown_254c9
	call Function25448
	ret
; 253a2 (9:53a2)

Tilemap_253a2: ; 253a2
	db $79, $7a, $7b, $7c, $7d, $ff ; "BADGES"
; 253a8

Function253a8: ; 253a8 (9:53a8)
	ld a, [de]
	cp $ff
	ret z
	ld [hli], a
	inc de
	jr Function253a8

Function253b0: ; 253b0 (9:53b0)
	ld e, $14
.asm_253b2
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .asm_253b2
	ld a, $23
	ld [hli], a
	ld e, $11
	ld a, $7f
.asm_253bf
	ld [hli], a
	dec e
	jr nz, .asm_253bf
	ld a, $1c
	ld [hli], a
	ld a, $23
	ld [hli], a
.asm_253c9
	ld a, $23
	ld [hli], a
	ld e, $12
	ld a, $7f
.asm_253d0
	ld [hli], a
	dec e
	jr nz, .asm_253d0
	ld a, $23
	ld [hli], a
	dec d
	jr nz, .asm_253c9
	ld a, $23
	ld [hli], a
	ld a, $24
	ld [hli], a
	ld e, $11
	ld a, $7f
.asm_253e4
	ld [hli], a
	dec e
	jr nz, .asm_253e4
	ld a, $23
	ld [hli], a
	ld e, $14
.asm_253ed
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .asm_253ed
	ret

Function253f4: ; 253f4 (9:53f4)
	push de
	push hl
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, $11
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, $11
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

Function25415: ; 25415 (9:5415)
	hlcoord 11, 12
	ld de, GameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 15, 12
	ld a, [hl]
	xor $51
	ld [hl], a
	ret

Function25438: ; 25438 (9:5438)
	ld a, [hVBlankCounter]
	and $7
	ret nz
	ld a, [wcf64]
	inc a
	and $7
	ld [wcf64], a
	jr Function25448

Function25448: ; 25448 (9:5448)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	ld c, a
	ld de, Sprites
	ld b, 8
.asm_25453
	srl c
	push bc
	jr nc, .asm_25472
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld [wcf66], a
	ld a, [wcf64]
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld [wcf65], a
	call Function2547b
	pop hl
.asm_25472
	ld bc, $b
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_25453
	ret

Function2547b: ; 2547b (9:547b)
	ld a, [wcf65]
	and $80
	jr nz, .asm_25487
	ld hl, Unknown_254a7
	jr .asm_2548a
.asm_25487
	ld hl, Unknown_254b8
.asm_2548a
	ld a, [hli]
	cp $ff
	ret z
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [wcf65]
	and $7f
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wcf66]
	add [hl]
	ld [de], a
	inc hl
	inc de
	jr .asm_2548a
; 254a7 (9:54a7)

Unknown_254a7: ; 254a7
	db $00, $00, $00, $00
	db $00, $08, $01, $00
	db $08, $00, $02, $00
	db $08, $08, $03, $00
	db $ff

Unknown_254b8: ; 254b8
	db $00, $00, $01, $20
	db $00, $08, $00, $20
	db $08, $00, $03, $20
	db $08, $08, $02, $20
	db $ff

Unknown_254c9: ; 254c9
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw JohtoBadges

	; Zephyrbadge
	db $68, $18, $00
	db $00, $20, $24, $20 | $80
	db $00, $20, $24, $20 | $80

	; Hivebadge
	db $68, $38, $00
	db $04, $20, $24, $20 | $80
	db $04, $20, $24, $20 | $80

	; Plainbadge
	db $68, $58, $00
	db $08, $20, $24, $20 | $80
	db $08, $20, $24, $20 | $80

	; Fogbadge
	db $68, $78, $00
	db $0c, $20, $24, $20 | $80
	db $0c, $20, $24, $20 | $80

	; Mineralbadge
	db $80, $38, $00
	db $10, $20, $24, $20 | $80
	db $10, $20, $24, $20 | $80

	; Stormbadge
	db $80, $18, $00
	db $14, $20, $24, $20 | $80
	db $14, $20, $24, $20 | $80

	; Glacierbadge
	db $80, $58, $00
	db $18, $20, $24, $20 | $80
	db $18, $20, $24, $20 | $80

	; Risingbadge
	; X-flips on alternate cycles.
	db $80, $78, $00
	db $1c, $20, $24, $20 | $80
	db $1c | $80, $20, $24, $20 | $80
; 25523

CardStatusGFX: INCBIN "gfx/misc/card_status.2bpp"

LeaderGFX:  INCBIN "gfx/misc/leaders.w24.2bpp"
LeaderGFX2: INCBIN "gfx/misc/leaders.w24.2bpp"
BadgeGFX:   INCBIN "gfx/misc/badges.2bpp"
BadgeGFX2:  INCBIN "gfx/misc/badges.2bpp"

CardRightCornerGFX: INCBIN "gfx/misc/card_right_corner.2bpp"
