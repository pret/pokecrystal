
SECTION "bank42", ROMX, BANK[$42]

Function108000: ; 108000
	ld a, $80
	ld [wcf65], a
	ld de, Unknown_10800b
	jp Function108089
; 10800b

Unknown_10800b:
	db $0d, $12, $10, $03, $06, $0f, $0c

Function108012:
	ld a, $80
	jr asm_108018

Function108016: ; 108016
	ld a, $0
asm_108018:
	ld [wcf65], a
	ld de, Unknown_108021
	jp Function108089
; 108021

Unknown_108021:
	db $11, $07, $08, $0e, $0c

Function108026: ; 108026
	ld a, $0
	jr asm_10802c

Function10802a: ; 10802a
	ld a, $1

asm_10802c:
	ld [wcf65], a
	ld de, Unknown_108035
	jp Function10805b
; 108035

Unknown_108035:
	db $01, $12, $02, $03, $05, $08, $0b, $0c

Function10803d: ; 10803d
	ld a, $0
	ld [wcf65], a
	ld de, Unknown_108048
	jp Function108089
; 108048

Unknown_108048:
	db $11, $07, $08, $13, $0c

Function10804d: ; 10804d
	ld a, $0
	ld [wcf65], a
	ld de, Unknown_108058
	jp Function108089
; 108058

Unknown_108058:
	db $11, $0e, $0c

Function10805b: ; 10805b
	ld hl, wc734
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [$ffde]
	push af
	xor a
	ld [$ffde], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function1080b7
.asm_108078
	call Function10824b
	jr nc, .asm_108078
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [$ffde], a
	ret
; 108089

Function108089: ; 108089
	ld hl, BattleEnded
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [$ffde]
	push af
	xor a
	ld [$ffde], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function108157
.asm_1080a6
	call Function10824b
	jr nc, .asm_1080a6
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [$ffde], a
	ret
; 1080b7

Function1080b7: ; 1080b7
	xor a
	ld [wcf63], a
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ad
	call Function1081ca
	call Functione51
	call Functione58
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_108da7
	ld de, VTiles2
	call Decompress
	ld a, $0
	ld [rVBK], a
	ld hl, LZ_108d27
	ld de, $8200
	call Decompress
	call EnableLCD
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, $8060
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], $0
	ld a, [$c6d0]
	ld hl, $c6fd
	ld de, $8300
	call Function1081e9
	ld a, [wc702]
	ld hl, wc72f
	ld de, $9310
	call Function1081e9
	ld a, [$c6d0]
	ld de, $c6d1
	call Function108239
	ld a, [wc702]
	ld de, wc703
	call Function108239
	xor a
	call Function108b98
	call Function108af4
	ret
; 108157

Function108157: ; 108157
	xor a
	ld [wcf63], a
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ad
	call Function1081ca
	call Functione51
	call Functione58
	call EnableLCD
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], $0
	call DelayFrame
	ld a, [$c6d0]
	ld de, $c6d1
	call Function108239
	ld a, [wc702]
	ld de, wc703
	call Function108239
	xor a
	call Function108b98
	call Function108af4
	ret
; 1081ad

Function1081ad: ; 1081ad
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $1800
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, $1800
	xor a
	call ByteFill
	ret
; 1081ca

Function1081ca: ; 1081ca
	ld a, $1
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, $0800
	ld a, $0
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld hl, VBGMap0
	ld bc, $0800
	ld a, $7f
	call ByteFill
	ret
; 1081e9

Function1081e9: ; 1081e9
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef GetFrontpic
	ret
; 108201

Function108201: ; 108201
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef Function5108b
	ret
; 108219

Function108219: ; 108219
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, $3
	predef Functiond008e
	ret
; 108229

Function108229: ; 108229
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, $3
	predef Functiond00a3
	ret
; 108239

Function108239: ; 108239
	push de
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, $000b
	call CopyBytes
	ret
; 10824b

Function10824b: ; 10824b
	ld a, [wcf63]
	bit 7, a
	jr nz, .asm_10825a
	call Function10827b
	call DelayFrame
	and a
	ret

.asm_10825a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Functione51
	call Functione58
	callba Function106462
	callba Function106464
	scf
	ret
; 10827b

Function10827b: ; 10827b
	ld a, [wcf63]
	ld e, a
	ld d, 0
	ld hl, Jumptable_10828a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 10828a

Jumptable_10828a: ; 10828a
	dw Function1082b7
	dw Function10830e
	dw Function108638
	dw Function108763
	dw Function1087cf
	dw Function108811
	dw Function108838
	dw Function10884c
	dw Function108863
	dw Function108894
	dw Function10890a
	dw Function10839b
	dw Function1082c6
	dw Function10842c
	dw Function1084d7
	dw Function108919
	dw Function108689
	dw Function1086f4
	dw Function10893d
	dw Function108589
; 1082b2

Function1082b2: ; 1082b2
	ld hl, wcf63
	inc [hl]
	ret
; 1082b7

Function1082b7: ; 1082b7
	ld hl, wc734
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld [wcf63], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret
; 1082c6

Function1082c6: ; 1082c6
	ld hl, wcf63
	set 7, [hl]
	ret
; 1082cc

Function1082cc: ; 1082cc
.asm_1082cc
	push bc
	callba Function8cf69
	pop bc
	call DelayFrame
	dec c
	jr nz, .asm_1082cc
	ret
; 1082db

Function1082db: ; 1082db
.asm_1082db
	callba Function8cf69
	callba Functiond00b4
	callba Function10402d
	jr nc, .asm_1082db
	ret
; 1082f0

Function1082f0: ; 1082f0
.asm_1082f0
	call Function108b78
	call DelayFrame
	dec c
	jr nz, .asm_1082f0
	ret
; 1082fa

Function1082fa: ; 1082fa
.asm_1082fa
	call Function108b78
	push hl
	push bc
	callba Function8cf69
	pop bc
	pop hl
	call DelayFrame
	dec c
	jr nz, .asm_1082fa
	ret
; 10830e

Function10830e: ; 10830e
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	ld a, $80
	ld [hSCX], a
	xor a
	ld [hSCY], a
	ld a, $87
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	call Function1089a8
	ld a, [$c6d0]
	ld [CurPartySpecies], a
	call Function10895e
	ld a, [$c6fd]
	ld [TempMonDVs], a
	ld a, [$c6fe]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	call WaitBGMap
.asm_108348
	ld a, [hWX]
	cp $7
	jr z, .asm_10835d
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	call DelayFrame
	jr .asm_108348

.asm_10835d
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	ld a, [$c6d0]
	call GetCryIndex
	jr c, .asm_108371
	ld e, c
	ld d, b
	call PlayCryHeader

.asm_108371
	ld c, $50
	call DelayFrames
	call Function108bec
	lb de, $54, $58
	ld a, $20
	call Function3b2a
	ld de, SFX_BALL_POOF
	call PlaySFX
	ld hl, TileMap
	ld bc, $00f0
	ld a, $7f
	call ByteFill
	ld c, $50
	call Function1082cc
	call Function1082b7
	ret
; 10839b

Function10839b: ; 10839b
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ca
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld hl, wc72f
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba Function8d03d
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	lb de, $54, $58
	ld a, $21
	call Function3b2a
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, $30
	call Function1082cc
	ld de, SFX_BALL_POOF
	call PlaySFX
	call Function1089d2
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wc72f]
	ld [TempMonDVs], a
	ld a, [wc730]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	call Function108963
	ld a, [wc702]
	call Function108229
	call Function1082db
	call Function108c16
	call Function1082b7
	ret
; 10842c

Function10842c: ; 10842c
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	ld a, $80
	ld [hSCX], a
	xor a
	ld [hSCY], a
	ld a, $87
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	call Function1089a8
	ld a, [$c6d0]
	ld [CurPartySpecies], a
	ld hl, $c6fd
	call Function10898a
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, $8060
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	ld a, [$c6fd]
	ld [TempMonDVs], a
	ld a, [$c6fe]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	call WaitBGMap
.asm_108484
	ld a, [hWX]
	cp $7
	jr z, .asm_108499
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	call DelayFrame
	jr .asm_108484

.asm_108499
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	ld a, [$c6d0]
	call GetCryIndex
	jr c, .asm_1084ad
	ld e, c
	ld d, b
	call PlayCryHeader

.asm_1084ad
	ld c, $50
	call DelayFrames
	call Function108c2b
	lb de, $54, $58
	ld a, $20
	call Function3b2a
	ld de, SFX_BALL_POOF
	call PlaySFX
	ld hl, TileMap
	ld bc, $00f0
	ld a, $7f
	call ByteFill
	ld c, $50
	call Function1082cc
	call Function1082b7
	ret
; 1084d7

Function1084d7: ; 1084d7
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ca
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld hl, wc72f
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba Function8d03d
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, $8060
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	lb de, $54, $58
	ld a, $21
	call Function3b2a
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, $30
	call Function1082cc
	ld de, SFX_BALL_POOF
	call PlaySFX
	call Function1089d2
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wc72f]
	ld [TempMonDVs], a
	ld a, [wc730]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, [wc702]
	ld hl, wc72f
	call Function10898a
	ld a, [wc702]
	call Function108229
	call Function1082db
	call Function108c40
	call Function1082b7
	ret
; 108589

Function108589: ; 108589
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ca
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld hl, wc72f
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba Function8d03d
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, $8060
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	lb de, $54, $58
	ld a, $21
	call Function3b2a
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, $30
	call Function1082cc
	ld de, SFX_BALL_POOF
	call PlaySFX
	call Function108a33
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wc72f]
	ld [TempMonDVs], a
	ld a, [wc730]
	ld [TempMonDVs + 1], a
	ld b, $1a
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	ld a, [wc702]
	ld hl, wc72f
	call Function10898a
	ld a, [wc702]
	call Function108229
	call Function1082db
	call Function1082b7
	ret
; 108638

Function108638: ; 108638
	callba Function8d03d
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	call Function1081ca
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $c
	ld [hSCX], a
	ld a, $78
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_109107
	ld de, Unkn1Pals
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function108d07
	call Function108af4
	call Function1082b7
	ret
; 108689

Function108689: ; 108689
	callba Function8d03d
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	call Function1081ca
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_108da7
	ld de, VTiles2
	call Decompress
	ld a, $0
	ld [rVBK], a
	ld hl, LZ_108d27
	ld de, $8200
	call Decompress
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $c
	ld [hSCX], a
	ld a, $78
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_109107
	ld de, Unkn1Pals
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function108d07
	call Function108af4
	call Function1082b7
	ret
; 1086f4

Function1086f4: ; 1086f4
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_108da7
	ld de, VTiles2
	call Decompress
	ld a, $0
	ld [rVBK], a
	ld hl, LZ_108d27
	ld de, $8200
	call Decompress
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $80
	ld [hSCX], a
	ld a, $90
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_109107
	ld de, Unkn1Pals
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function108d07
	call Function108af4
	call Function108b5a
	ld a, $e0
	ld [hSCX], a
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	call Function1082b7
	ret
; 108763

Function108763: ; 108763
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, $28
	ld hl, $d0b0
	call Function1082f0
	call Function108af4
.asm_108774
	ld a, [hSCX]
	cp $e0
	jr z, .asm_108791
rept 2
	dec a
endr
	ld [hSCX], a
	cp $f8
	jr nz, .asm_10878a
	lb de, $54, $58
	ld a, $22
	call Function3b2a

.asm_10878a
	ld c, $1
	call Function1082cc
	jr .asm_108774

.asm_108791
	ld a, [hSCY]
	cp $f8
	jr z, .asm_1087cb
rept 2
	dec a
endr
	ld [hSCY], a
	cp $40
	jr z, .asm_1087a9
	cp $30
	jr z, .asm_1087b7
	cp $68
	jr z, .asm_1087bc
	jr .asm_1087c4

.asm_1087a9
	lb de, $54, $58
	ld a, $22
	call Function3b2a
	xor a
	call Function108ad4
	jr .asm_1087c4

.asm_1087b7
	call Function108bbd
	jr .asm_1087c4

.asm_1087bc
	call Function108bbd
	ld a, $1
	call Function108ad4

.asm_1087c4
	ld c, $1
	call Function1082cc
	jr .asm_108791

.asm_1087cb
	call Function1082b2
	ret
; 1087cf

Function1087cf: ; 1087cf
	ld c, $28
	ld hl, StringBuffer2 + 2
	call Function1082f0
	call Function108af4
	call Function108b5a
	lb de, $4a, $50
	ld a, $25
	call Function3b2a
	ld de, SFX_FORESIGHT
	call PlaySFX
	ld c, $a
	call Function1082cc
	xor a
	ld [wcf64], a
	lb de, $4a, $50
	ld a, $23
	call Function3b2a
.asm_1087fc
	ld a, [hSCY]
	cp $90
	jr z, .asm_10880d
	sub $8
	ld [hSCY], a
	ld c, $1
	call Function1082cc
	jr .asm_1087fc

.asm_10880d
	call Function1082b7
	ret
; 108811

Function108811: ; 108811
	ld c, $28
	call Function1082cc
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	ld c, $3c
	call Function1082cc
	lb de, $f2, $50
	ld a, $24
	call Function3b2a
	call Function1082b7
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret
; 108838

Function108838: ; 108838
	ld c, $28
	call Function1082cc
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	call Function1082b7
	ret
; 10884c

Function10884c: ; 10884c
	ld c, $50
	call DelayFrames
	lb de, $f2, $50
	ld a, $24
	call Function3b2a
	call Function1082b7
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret
; 108863

Function108863: ; 108863
	ld c, $28
	call Function1082cc
.asm_108868
	ld a, [hSCY]
	cp $f8
	jr z, .asm_108879
	add $8
	ld [hSCY], a
	ld c, $1
	call Function1082cc
	jr .asm_108868

.asm_108879
	callba Function8d03d
	lb de, $4a, $50
	ld a, $25
	call Function3b2a
	ld de, SFX_GLASS_TING_2
	call PlaySFX
	call Function108af4
	call Function1082b2
	ret
; 108894

Function108894: ; 108894
	ld c, $14
	ld hl, StringBuffer2 + 2
	call Function1082fa
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, $14
	ld hl, StringBuffer2 + 2
	call Function1082fa
	call Function108af4
.asm_1088ad
	ld a, [hSCY]
	cp $78
	jr z, .asm_1088ee
rept 2
	inc a
endr
	ld [hSCY], a
	cp $30
	jr z, .asm_1088c5
	cp $40
	jr z, .asm_1088dd
	cp $68
	jr z, .asm_1088cf
	jr .asm_1088e7

.asm_1088c5
	lb de, $54, $58
	ld a, $22
	call Function3b2a
	jr .asm_1088e7

.asm_1088cf
	lb de, $54, $58
	ld a, $22
	call Function3b2a
	xor a
	call Function108ad4
	jr .asm_1088e7

.asm_1088dd
	call Function108bbd
	ld a, $1
	call Function108ad4
	jr .asm_1088e7

.asm_1088e7
	ld c, $1
	call Function1082cc
	jr .asm_1088ad

.asm_1088ee
	ld a, [hSCX]
	cp $c
	jr z, .asm_108906
rept 2
	inc a
endr
	ld [hSCX], a
	cp $f8
	jr nz, .asm_1088e7
	call Function108bbd
	ld c, $1
	call Function1082cc
	jr .asm_1088ee

.asm_108906
	call Function1082b2
	ret
; 10890a

Function10890a: ; 10890a
	ld c, $28
	ld hl, $d0b0
	call Function1082f0
	call Function108af4
	call Function1082b7
	ret
; 108919

Function108919: ; 108919
	ld c, $28
	call Function1082cc
	callba Function8d03d
	call WhiteBGMap
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call Function1081ad
	call Function1081ca
	call EnableLCD
	call Function1082b7
	ret
; 10893d

Function10893d: ; 10893d
.asm_10893d
	ld a, [rBGP]
	and a
	jr z, .asm_108953
	sla a
	sla a
	call DmgToCgbBGPals
	call Functioncf8
	ld c, $4
	call DelayFrames
	jr .asm_10893d

.asm_108953
	xor a
	call DmgToCgbBGPals
	call Functioncf8
	call Function1082b7
	ret
; 10895e

Function10895e: ; 10895e
	ld de, $8300
	jr asm_108966

Function108963:
	ld de, $9310

asm_108966
	call DelayFrame
	ld hl, VTiles2
	lb bc, $0a, $31
	call Request2bpp
	call WaitTop
	call Function108ac8
	hlcoord 7, 2
	xor a
	ld [$ffad], a
	ld bc, $0707
	predef FillBox
	call WaitBGMap
	ret
; 10898a

Function10898a: ; 10898a
	ld de, VTiles2
	call Function1081e9
	call WaitTop
	call Function108ac8
	hlcoord 7, 2
	xor a
	ld [$ffad], a
	ld bc, $0707
	predef FillBox
	call WaitBGMap
	ret
; 1089a8

Function1089a8: ; 1089a8
	ld de, $c6d0
	ld a, [de]
	cp $fd
	jr z, asm_1089fc
	call Function108a5b
	ld de, $c6d0
	call Function108a92
	ld de, $c6d1
	call Function108a9c
	ld a, [wc701]
	ld de, $c6f2
	call Function108aa3
	ld de, $c6ff
	call Function108abe
	call Function108a87
	ret

Function1089d2:
	ld de, wc702
	ld a, [de]
	cp $fd
	jr z, asm_1089fc
	call Function108a5b
	ld de, wc702
	call Function108a92
	ld de, wc703
	call Function108a9c
	ld a, [wc733]
	ld de, wc724
	call Function108aa3
	ld de, wc731
	call Function108abe
	call Function108a87
	ret

asm_1089fc
	call WaitTop
	call Function108ac8
	ld a, $9c
	ld [$ffd7], a
	hlcoord 5, 0
	ld b, $6
	ld c, $9
	call TextBox
	hlcoord 6, 2
	ld de, String_108a1d
	call PlaceString
	call Function108a87
	ret
; 108a1d

String_108a1d: ; 108a1d
	db   "タマゴ"
	next "おや/?????"
	next $73, "№", $f2, "?????"
	db   "@"
; 108a33

Function108a33: ; 108a33
	call WaitTop
	call Function108ac8
	ld a, $9c
	ld [$ffd7], a
	hlcoord 5, 0
	ld b, $6
	ld c, $9
	call TextBox
	hlcoord 7, 4
	ld de, String_108a54
	call PlaceString
	call Function108a87
	ret
; 108a54

String_108a54: ; 108a54
	db "なぞのタマゴ@"
; 108a5b

Function108a5b: ; 108a5b
	call WaitTop
	call Function108ac8
	ld a, $9c
	ld [$ffd7], a
	hlcoord 4, 0
	ld b, $6
	ld c, $a
	call TextBox
	hlcoord 5, 0
	ld de, String_108a79
	call PlaceString
	ret
; 108a79

String_108a79: ; 108a79
	db   "─ №", $f2
	next ""
	next "おや/"
	next $73, "№", $f2
	db   "@"
; 108a87

Function108a87: ; 108a87
	call WaitBGMap
	call WaitTop
	ld a, $98
	ld [$ffd7], a
	ret
; 108a92

Function108a92: ; 108a92
	hlcoord 9, 0
	ld bc, $8103
	call PrintNum
	ret
; 108a9c

Function108a9c: ; 108a9c
	hlcoord 5, 2
	call PlaceString
	ret
; 108aa3

Function108aa3: ; 108aa3
	cp $3
	jr c, .asm_108aa8
	xor a

.asm_108aa8
	push af
	hlcoord 8, 4
	call PlaceString
	inc bc
	pop af
	ld hl, Unknown_108abb
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [bc], a
	ret
; 108abb

Unknown_108abb: ; 108abb
	db " ", "♂", "♀"
; 108abe

Function108abe: ; 108abe
	hlcoord 8, 6
	ld bc, $8205
	call PrintNum
	ret
; 108ac8

Function108ac8: ; 108ac8
	ld hl, TileMap
	ld bc, $0168
	ld a, $7f
	call ByteFill
	ret
; 108ad4

Function108ad4: ; 108ad4
	and a
	jr z, .asm_108adc
	ld de, GFX_1092c7
	jr .asm_108adf

.asm_108adc
	ld de, GFX_1091c7

.asm_108adf
	ld a, $1
	ld [rVBK], a
	ld hl, $94a0
	lb bc, $42, $10
	call Functiondc9
	call DelayFrame
	ld a, $0
	ld [rVBK], a
	ret
; 108af4

Function108af4: ; 108af4
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf65]
	and $1
	jr z, .asm_108b1c
	ld hl, Palette_109187
	ld de, Unkn2Pals
	ld bc, $0040
	call CopyBytes
	ld hl, Palette_109187
	ld de, OBPals
	ld bc, $0040
	call CopyBytes
	jr .asm_108b34

.asm_108b1c
	ld hl, Palette_109147
	ld de, Unkn2Pals
	ld bc, $0040
	call CopyBytes
	ld hl, Palette_109147
	ld de, OBPals
	ld bc, $0040
	call CopyBytes

.asm_108b34
	pop af
	ld [rSVBK], a
	ld a, $e4
	call Functioncf8
	ld a, $e4
	call DmgToCgbBGPals
	call DelayFrame
	ret
; 108b45

Function108b45: ; 108b45
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld de, $7fff
	ld hl, Unkn1Pals
	ld a, e
	ld [hli], a
	ld d, a
	ld [hli], a
	pop af
	ld [rSVBK], a
	ret
; 108b5a

Function108b5a: ; 108b5a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld de, $3ff2
	ld hl, $d0a0
	ld c, $10
.asm_108b69
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .asm_108b69
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 108b78

Function108b78: ; 108b78
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, c
	and $2
	jr z, .asm_108b89
	ld de, $7fff
	jr .asm_108b8c

.asm_108b89
	ld de, $05ff

.asm_108b8c
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 108b98

Palette_108b98:
; removed

Function108b98: ; 108b98
	ld d, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf65]
	and $1
	xor d
	jr z, .asm_108bad
	ld hl, Palette_108b98 + 8
	jr .asm_108bb0

.asm_108bad
	ld hl, Palette_108b98

.asm_108bb0
	ld de, Unkn1Pals + 8 * 7
	ld bc, $0040
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 108bbd

Function108bbd: ; 108bbd
	callba Function8d03d
	call ClearSprites
	ret
; 108bc7

Function108bc7: ; 108bc7 (42:4bc7)
	ld a, [wcf64]
	and a
	ret z
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $f2
	jr z, .asm_108bd9
	sub $8
	ld [hl], a
	ret
.asm_108bd9
	callba Function8d036
	ret

Function108be0: ; 108be0 (42:4be0)
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $4a
	ret z
	add $8
	ld [hl], a
	ret
; 108bec (42:4bec)

Function108bec: ; 108bec
	ld a, $90
	ld [hWY], a
	ld hl, UnknownText_0x108c07
	call PrintText
	ld c, $50
	call DelayFrames
	ld hl, UnknownText_0x108c0c
	call PrintText
	ld c, $50
	call DelayFrames
	ret
; 108c07

UnknownText_0x108c07: ; 0x108c07
	text_jump UnknownText_0x1bc787
	db "@"
; 0x108c0c

UnknownText_0x108c0c: ; 0x108c0c
	text_jump UnknownText_0x1bc79d
	db "@"
; 0x108c11

UnknownText_0x108c11: ; 0x108c11
	text_jump UnknownText_0x1bc7b0
	db "@"
; 0x108c16

Function108c16: ; 108c16
	ld a, $90
	ld [hWY], a
	ld hl, UnknownText_0x108c26
	call PrintText
	ld c, $50
	call DelayFrames
	ret
; 108c26

UnknownText_0x108c26: ; 0x108c26
	text_jump UnknownText_0x1bc7c3
	db "@"
; 0x108c2b

Function108c2b: ; 108c2b
	ld a, $90
	ld [hWY], a
	ld hl, UnknownText_0x108c3b
	call PrintText
	ld c, $50
	call DelayFrames
	ret
; 108c3b

UnknownText_0x108c3b: ; 0x108c3b
	text_jump UnknownText_0x1bc7dd
	db $50
; 0x108c40

Function108c40: ; 108c40
	ld a, $90
	ld [hWY], a
	ld a, [wcf65]
	and $80
	jr z, .asm_108c57
	ld hl, UnknownText_0x108c68
	call PrintText
	ld c, $50
	call DelayFrames
	ret

.asm_108c57
	ld hl, UnknownText_0x108c63
	call PrintText
	ld c, $50
	call DelayFrames
	ret
; 108c63

UnknownText_0x108c63: ; 0x108c63
	text_jump UnknownText_0x1bc7f0
	db "@"
; 0x108c68

UnknownText_0x108c68: ; 0x108c68
	text_jump UnknownText_0x1bc80a
	db "@"
; 0x108c6d

Function108c6d: ; 108c6d
	ld hl, LZ_108fe7
	ld de, VBGMap0
	call Decompress
	ld hl, LZ_108fe7
	ld de, VBGMap1
	call Decompress
	ret
; 108c80

Function108c80: ; 108c80
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_1090a7
	ld de, VBGMap0
	call Decompress
	ld hl, LZ_1090a7
	ld de, VBGMap1
	call Decompress
	ld a, $0
	ld [rVBK], a
	ret
; 108c9b

Function108c9b: ; 108c9b
; localization error: $b should be 6 here

	ld hl, Unknown_108ce9
	ld a, [hli]
	ld [$c6d0], a

	ld de, $c6e7
	ld c, $b
.asm_108ca7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108ca7

	ld de, $c6ff
	ld c, $2
.asm_108cb2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108cb2

	ld de, $c6f2
	ld c, $b
.asm_108cbd
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108cbd

	ld a, [hli]
	ld [wc702], a

	ld de, wc719
	ld c, $b
.asm_108ccc
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108ccc

	ld de, wc731
	ld c, $2
.asm_108cd7
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108cd7

	ld de, wc724
	ld c, $b
.asm_108ce2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_108ce2

	ret
; 108ce9

Unknown_108ce9:
	db 3
	db "ゲーフり@@"
	db $23, $01
	db "かびーん@@"
	db 6
	db "クりーチャ@"
	db $56, $04
	db "マツミヤ@@"
; 108d07

Function108d07: ; 108d07
	ld a, [wc74e]
	and $7f
	cp $8
	jr c, .asm_108d12
	ld a, $7

.asm_108d12
	ld bc, $0008
	ld hl, Palette_1093c7
	call AddNTimes
	ld a, $5
	ld de, wd020
	ld bc, $0008
	call FarCopyWRAM
	ret
; 108d27

LZ_108d27:
INCBIN "gfx/unknown/108d27.2bpp.lz"

LZ_108da7:
INCBIN "gfx/unknown/108da7.2bpp.lz"

LZ_108fe7:
INCBIN "gfx/unknown/108fe7.tilemap.lz"

LZ_1090a7:
INCBIN "gfx/unknown/1090a7.tilemap.lz"

Palette_1090f7:
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB 31,  0, 25
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  9, 19, 31
	RGB  0,  0,  0

Palette_109107:
	RGB 18, 31, 15
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 15,  1
	RGB 14, 14, 31
	RGB 12,  9, 31
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 14, 14, 31
	RGB 12,  9, 31
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 31,  7,  9
	RGB 18,  0,  1
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 15,  1
	RGB 18,  0, 30
	RGB  9,  0, 17
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 18,  0, 30
	RGB  9,  0, 17
	RGB  0,  0,  0

Palette_109147:
	RGB 31, 31, 31
	RGB 31, 31, 12
	RGB 31, 13, 12
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 23, 15
	RGB 31, 18,  7
	RGB 31, 15,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31,  0, 25
	RGB 31,  0, 25
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  9, 19, 31
	RGB  9, 19, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

Palette_109187:
	RGB 31, 31, 31
	RGB 31, 31, 12
	RGB 31, 13, 12
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 23, 15
	RGB 31, 18,  7
	RGB 31, 15,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  9, 19, 31
	RGB  9, 19, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31,  0, 25
	RGB 31,  0, 25
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0

GFX_1091c7:
INCBIN "gfx/unknown/1091c7.2bpp"
GFX_1092c7:
INCBIN "gfx/unknown/1092c7.2bpp"

Palette_1093c7:
	RGB 18, 31, 15
	RGB  4, 13, 31
	RGB  0,  0, 31
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 31, 31,  0
	RGB 31, 15,  0
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB  9, 24,  0
	RGB  2, 16,  0
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 31,  7,  9
	RGB 18,  0,  1
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 28,  5, 31
	RGB 17,  0, 17
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB  9,  9,  9
	RGB  4,  4,  4
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 31, 13, 21
	RGB 27,  7, 12
	RGB  0,  0,  0
	RGB 18, 31, 15
	RGB 21, 20, 20
	RGB 14, 14, 31
	RGB  0,  0,  0
