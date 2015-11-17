Special_MagnetTrain: ; 8cc04
	ld a, [ScriptVar]
	and a
	jr nz, .ToGoldenrod
	ld a, 1 ; forwards
	lb bc, $40, $60
	ld de, $fca0
	jr .continue

.ToGoldenrod
	ld a, -1 ; backwards
	lb bc, $c0, $a0
	ld de, $b460

.continue
	ld h, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, h
	ld [w5_d191], a
	ld a, c
	ld [w5_d192], a
	ld a, b
	ld [w5_d193], a
	ld a, e
	ld [w5_d194], a
	ld a, d
	ld [w5_d195], a
	ld a, [hSCX]
	push af
	ld a, [hSCY]
	push af
	call Function8ccc9
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $1
.loop
	ld a, [wJumptableIndex]
	and a
	jr z, .initialize
	bit 7, a
	jr nz, .done
	callab Function8cf69
	call Function8cdf7
	call Function8cc99
	call Function3b0c
	call DelayFrame
	jr .loop

.initialize
	call Function8ceae
	jr .loop

.done
	pop af
	ld [hVBlank], a
	call ClearBGPalettes
	xor a
	ld [hLCDStatCustom], a
	ld [hLCDStatCustom + 1], a
	ld [hLCDStatCustom + 2], a
	ld [hSCX], a
	ld [Requested2bppSource], a
	ld [Requested2bppSource + 1], a
	ld [Requested2bppDest], a
	ld [Requested2bppDest + 1], a
	ld [Requested2bpp], a
	call ClearTileMap
	pop af
	ld [hSCY], a
	pop af
	ld [hSCX], a
	xor a
	ld [hBGMapMode], a
	pop af
	ld [rSVBK], a
	ret
; 8cc99

Function8cc99: ; 8cc99
	ld hl, LYOverridesBackup
	ld c, $2f
	ld a, [wcf64]
	add a
	ld [hSCX], a
	call Function8ccc4
	ld c, $30
	ld a, [wcf65]
	call Function8ccc4
	ld c, $31
	ld a, [wcf64]
	add a
	call Function8ccc4
	ld a, [wd191]
	ld d, a
	ld hl, wcf64
	ld a, [hl]
rept 2
	add d
endr
	ld [hl], a
	ret
; 8ccc4

Function8ccc4: ; 8ccc4
.asm_8ccc4
	ld [hli], a
	dec c
	jr nz, .asm_8ccc4
	ret
; 8ccc9

Function8ccc9: ; 8ccc9
	call ClearBGPalettes
	call ClearSprites
	call DisableLCD
	callab Function8cf53
	call SetMagnetTrainPals
	call DrawMagnetTrain
	ld a, $90
	ld [hWY], a
	call EnableLCD
	xor a
	ld [hBGMapMode], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	callba GetPlayerIcon
	pop af
	ld [rSVBK], a
	ld hl, VTiles0
	ld c, $4
	call Request2bpp
	ld hl, $c0
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTiles0 tile $04
	ld c, $4
	call Request2bpp
	call Function8cda6
	ld hl, wJumptableIndex
	xor a
	ld [hli], a
	ld a, [wd192]
rept 3
	ld [hli], a
endr
	ld de, MUSIC_MAGNET_TRAIN
	call PlayMusic2
	ret
; 8cd27

DrawMagnetTrain: ; 8cd27
	ld hl, VBGMap0
	xor a
.asm_8cd2b
	call GetMagnetTrainBGTiles
	ld b, 32 / 2
	call .FillAlt
	inc a
	cp $12
	jr c, .asm_8cd2b
	ld hl, VBGMap0 tile $0c
	ld de, MagnetTrainTilemap1
	ld c, 20
	call .FillLine
	ld hl, VBGMap0 tile $0e
	ld de, MagnetTrainTilemap2
	ld c, 20
	call .FillLine
	ld hl, VBGMap0 tile $10
	ld de, MagnetTrainTilemap3
	ld c, 20
	call .FillLine
	ld hl, VBGMap0 tile $12
	ld de, MagnetTrainTilemap4
	ld c, 20
	call .FillLine
	ret
; 8cd65

.FillLine ; 8cd65
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .FillLine
	ret
; 8cd6c

.FillAlt ; 8cd6c
	ld [hl], e
	inc hl
	ld [hl], d
	inc hl
	dec b
	jr nz, .FillAlt
	ret
; 8cd74

GetMagnetTrainBGTiles: ; 8cd74
	push hl
	ld e, a
	ld d, 0
	ld hl, MagnetTrainBGTiles
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	pop hl
	ret
; 8cd82

MagnetTrainBGTiles: ; 8cd82
; Alternating tiles for each line
; of the Magnet Train tilemap.
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $08, $08 ; fence
	db $18, $18 ; fence
	db $1f, $1f ; track
	db $31, $31 ; track
	db $11, $11 ; track
	db $11, $11 ; track
	db $0d, $0d ; track
	db $31, $31 ; track
	db $04, $04 ; fence
	db $18, $18 ; fence
	db $4c, $4d ; bush
	db $5c, $5d ; bush
	db $4c, $4d ; bush
	db $5c, $5d ; bush
; 8cda6

Function8cda6: ; 8cda6
	ld hl, LYOverrides
	ld bc, $90
	ld a, [wd192]
	call ByteFill
	ld hl, LYOverridesBackup
	ld bc, $90
	ld a, [wd192]
	call ByteFill
	ld a, $43
	ld [hLCDStatCustom], a
	ret
; 8cdc3

SetMagnetTrainPals: ; 8cdc3
	ld a, $1
	ld [rVBK], a

	; bushes
	ld hl, VBGMap0
	ld bc, 8 tiles
	ld a, $2
	call ByteFill

	; train
	ld hl, VBGMap0 tile $08
	ld bc, 20 tiles
	xor a
	call ByteFill

	; more bushes
	ld hl, VBGMap0 tile $1c
	ld bc, 8 tiles
	ld a, $2
	call ByteFill

	; train window
	ld hl, VBGMap0 tile $10 + 7
	ld bc, 6
	ld a, $4
	call ByteFill

	ld a, $0
	ld [rVBK], a
	ret
; 8cdf7

Function8cdf7: ; 8cdf7
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_8ce06
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8ce06

Jumptable_8ce06: ; 8ce06
	dw Function8ce19
	dw Function8ce6d
	dw Function8ce47
	dw Function8ce6d
	dw Function8ce7a
	dw Function8ce6d
	dw Function8cea2
; 8ce14

Function8ce14: ; 8ce14
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 8ce19

Function8ce19: ; 8ce19
	ld d, $55
	ld a, [wd194 + 1]
	ld e, a
	ld b, SPRITE_ANIM_INDEX_15
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [PlayerGender]
	bit 0, a
	jr z, .asm_8ce31
	ld b, SPRITE_ANIM_INDEX_1F

.asm_8ce31
	pop af
	ld [rSVBK], a
	ld a, b
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $0
	call Function8ce14
	ld a, $80
	ld [wcf66], a
	ret
; 8ce47

Function8ce47: ; 8ce47
	ld hl, wd193
	ld a, [wcf65]
	cp [hl]
	jr z, .asm_8ce64
	ld e, a
	ld a, [wd191]
	xor $ff
	inc a
	add e
	ld [wcf65], a
	ld hl, wc3c0
	ld a, [wd191]
	add [hl]
	ld [hl], a
	ret

.asm_8ce64
	call Function8ce14
	ld a, $80
	ld [wcf66], a
	ret
; 8ce6d

Function8ce6d: ; 8ce6d
	ld hl, wcf66
	ld a, [hl]
	and a
	jr z, .asm_8ce76
	dec [hl]
	ret

.asm_8ce76
	call Function8ce14
	ret
; 8ce7a

Function8ce7a: ; 8ce7a
	ld hl, wd194
	ld a, [wcf65]
	cp [hl]
	jr z, .asm_8ce9e
	ld e, a
	ld a, [wd191]
	xor $ff
	inc a
	ld d, a
	ld a, e
rept 2
	add d
endr
	ld [wcf65], a
	ld hl, wc3c0
	ld a, [wd191]
	ld d, a
	ld a, [hl]
rept 2
	add d
endr
	ld [hl], a
	ret

	ret

.asm_8ce9e
	call Function8ce14
	ret
; 8cea2

Function8cea2: ; 8cea2
	ld a, $80
	ld [wJumptableIndex], a
	ld de, SFX_TRAIN_ARRIVED
	call PlaySFX
	ret
; 8ceae

Function8ceae: ; 8ceae
	callba Function8cf69
	call Function8cdf7
	call Function8cc99
	call Function3b0c
	call DelayFrame
	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a
	ld a, [TimeOfDayPal]
	push af
	ld a, [wPermission]
	push af
	ld a, [TimeOfDay]
	and $3
	ld [TimeOfDayPal], a
	ld a, $1
	ld [wPermission], a
	ld b, SCGB_09
	call GetSGBLayout
	call UpdateTimePals
	ld a, [rBGP]
	ld [wcfc7], a
	ld a, [rOBP0]
	ld [wcfc8], a
	ld a, [rOBP1]
	ld [wcfc9], a
	pop af
	ld [wPermission], a
	pop af
	ld [TimeOfDayPal], a
	pop af
	ld [rSVBK], a
	ret
; 8ceff

MagnetTrainTilemap1:
	db $1f, $05, $06, $0a, $0a
	db $0a, $09, $0a, $0a, $0a
	db $0a, $0a, $0a, $09, $0a
	db $0a, $0a, $0b, $0c, $1f
MagnetTrainTilemap2:
	db $14, $15, $16, $1a, $1a
	db $1a, $19, $1a, $1a, $1a
	db $1a, $1a, $1a, $19, $1a
	db $1a, $1a, $1b, $1c, $1d
MagnetTrainTilemap3:
	db $24, $25, $26, $27, $07
	db $2f, $29, $28, $28, $28
	db $28, $28, $28, $29, $07
	db $2f, $2a, $2b, $2c, $2d
MagnetTrainTilemap4:
	db $20, $1f, $2e, $1f, $17
	db $00, $2e, $1f, $1f, $1f
	db $1f, $1f, $1f, $2e, $17
	db $00, $1f, $2e, $1f, $0f
; 8cf4f
