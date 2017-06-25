MobileTradeAnimation_SendGivemonToGTS: ; 108000
	ld a, $80
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics
; 10800b

.TradeAnimScript:
	mobiletradeanim_showgtsgivemon
	mobiletradeanim_12
	mobiletradeanim_10
	mobiletradeanim_sendmon
	mobiletradeanim_06
	mobiletradeanim_0f
	mobiletradeanim_end

MobileTradeAnimation_RetrieveGivemonFromGTS:
	ld a, $80
	jr asm_108018

MobileTradeAnimation_ReceiveGetmonFromGTS: ; 108016
	ld a, $0
asm_108018:
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics
; 108021

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_07
	mobiletradeanim_receivemon
	mobiletradeanim_showgtsgetmon
	mobiletradeanim_end

Function108026: ; 108026
	ld a, $0
	jr asm_10802c

Function10802a: ; 10802a
	ld a, $1

asm_10802c:
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_Frontpics
; 108035

.TradeAnimScript: ; trade
	mobiletradeanim_showgivemon
	mobiletradeanim_12
	mobiletradeanim_02
	mobiletradeanim_sendmon
	mobiletradeanim_05
	mobiletradeanim_receivemon
	mobiletradeanim_showgetmon
	mobiletradeanim_end

Function10803d: ; 10803d
	ld a, $0
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics
; 108048

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_07
	mobiletradeanim_receivemon
	mobiletradeanim_showoddegg
	mobiletradeanim_end

Function10804d: ; 10804d
	ld a, $0
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics
; 108058

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_showgtsgetmon
	mobiletradeanim_end

RunMobileTradeAnim_Frontpics: ; 10805b
	ld hl, wTradeAnimPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function1080b7
.loop
	call MobileTradeAnim_JumptableLoop
	jr nc, .loop
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [hMapAnims], a
	ret
; 108089

RunMobileTradeAnim_NoFrontpics: ; 108089
	ld hl, wTradeAnimPointer
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld hl, VramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function108157
.loop
	call MobileTradeAnim_JumptableLoop
	jr nc, .loop
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	pop af
	ld [hMapAnims], a
	ret
; 1080b7

Function1080b7: ; 1080b7
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearVTiles
	call MobileTradeAnim_ClearBGMap
	call LoadStandardFont
	call LoadFontsBattleExtra

	ld a, $1
	ld [rVBK], a
	ld hl, LZ_108da7
	ld de, VTiles2
	call Decompress

	ld a, $0
	ld [rVBK], a
	ld hl, LZ_108d27
	ld de, VTiles0 tile $20
	call Decompress

	call EnableLCD

	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba ClearSpriteAnims

	call DelayFrame

	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp

	ld de, TradePoofGFX
	ld hl, VTiles0 tile $06
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp

	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $0

	ld a, [wPlayerTrademonSpecies]
	ld hl, wPlayerTrademonDVs
	ld de, VTiles0 tile $30
	call MobileTradeAnim_GetFrontpic

	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, VTiles2 tile $31
	call MobileTradeAnim_GetFrontpic

	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call MobileTradeAnim_InitSpeciesName

	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call MobileTradeAnim_InitSpeciesName

	xor a
	call Function108b98
	call Function108af4
	ret
; 108157

Function108157: ; 108157
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearVTiles
	call MobileTradeAnim_ClearBGMap
	call LoadStandardFont
	call LoadFontsBattleExtra
	call EnableLCD
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba ClearSpriteAnims
	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $0
	call DelayFrame
	ld a, [wPlayerTrademonSpecies]
	ld de, wPlayerTrademonSpeciesName
	call MobileTradeAnim_InitSpeciesName
	ld a, [wOTTrademonSpecies]
	ld de, wOTTrademonSpeciesName
	call MobileTradeAnim_InitSpeciesName
	xor a
	call Function108b98
	call Function108af4
	ret
; 1081ad

MobileTradeAnim_ClearVTiles: ; 1081ad
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, 3 * $80 tiles
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, 3 * $80 tiles
	xor a
	call ByteFill
	ret
; 1081ca

MobileTradeAnim_ClearBGMap: ; 1081ca
	ld a, $1
	ld [rVBK], a
	hlbgcoord 0, 0
	ld bc, 2 * BG_MAP_HEIGHT * BG_MAP_WIDTH
	ld a, $0
	call ByteFill
	ld a, $0
	ld [rVBK], a
	hlbgcoord 0, 0
	ld bc, 2 * BG_MAP_HEIGHT * BG_MAP_WIDTH
	ld a, $7f
	call ByteFill
	ret
; 1081e9

MobileTradeAnim_GetFrontpic: ; 1081e9
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
	predef FrontpicPredef
	ret
; 108219

Function108219: ; 108219
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret
; 108229

Function108229: ; 108229
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef LoadMonAnimation
	ret
; 108239

MobileTradeAnim_InitSpeciesName: ; 108239
	push de
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	ret
; 10824b

MobileTradeAnim_JumptableLoop: ; 10824b
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .StopAnim
	call .ExecuteMobileTradeAnimCommand
	call DelayFrame
	and a
	ret

.StopAnim:
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call LoadStandardFont
	call LoadFontsBattleExtra
	callba MobileFunc_106462
	callba Function106464
	scf
	ret
; 10827b

.ExecuteMobileTradeAnimCommand: ; 10827b
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .Jumptable
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl
; 10828a

.Jumptable: ; 10828a

	dw GetMobileTradeAnimByte ; 00
	dw MobileTradeAnim_ShowPlayerMonToBeSent ; 01
	dw MobileTradeAnim_02 ; 02
	dw MobileTradeAnim_GiveTrademon1 ; 03
	dw MobileTradeAnim_GiveTrademon2 ; 04
	dw MobileTradeAnim_05 ; 05
	dw MobileTradeAnim_06 ; 06
	dw MobileTradeAnim_07 ; 07
	dw MobileTradeAnim_GetTrademon1 ; 08
	dw MobileTradeAnim_GetTrademon2 ; 09
	dw MobileTradeAnim_GetTrademon3 ; 0a
	dw MobileTradeAnim_ShowOTMonFromTrade ; 0b
	dw EndMobileTradeAnim ; 0c
	dw MobileTradeAnim_ShowPlayerMonForGTS ; 0d
	dw MobileTradeAnim_ShowOTMonFromGTS ; 0e
	dw MobileTradeAnim_0f ; 0f
	dw MobileTradeAnim_10 ; 10
	dw MobileTradeAnim_11 ; 11
	dw MobileTradeAnim_FadeToBlack ; 12
	dw MobileTradeAnim_GetOddEgg ; 13 get odd egg
; 1082b2

MobileTradeAnim_Next: ; 1082b2
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 1082b7

GetMobileTradeAnimByte: ; 1082b7
	ld hl, wTradeAnimPointer
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, [de]
	ld [wJumptableIndex], a
	inc de
	ld [hl], d
	dec hl
	ld [hl], e
	ret
; 1082c6

EndMobileTradeAnim: ; 1082c6
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 1082cc

WaitMobileTradeSpriteAnims: ; 1082cc
.loop
	push bc
	callba PlaySpriteAnimations
	pop bc
	call DelayFrame
	dec c
	jr nz, .loop
	ret
; 1082db

Function1082db: ; 1082db
.loop
	callba PlaySpriteAnimations
	callba SetUpPokeAnim
	callba HDMATransferTileMapToWRAMBank3
	jr nc, .loop
	ret
; 1082f0

Function1082f0: ; 1082f0
.loop
	call Function108b78
	call DelayFrame
	dec c
	jr nz, .loop
	ret
; 1082fa

Function1082fa: ; 1082fa
.loop
	call Function108b78
	push hl
	push bc
	callba PlaySpriteAnimations
	pop bc
	pop hl
	call DelayFrame
	dec c
	jr nz, .loop
	ret
; 10830e

MobileTradeAnim_ShowPlayerMonToBeSent: ; 10830e
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
	call MobileTradeAnim_DisplayMonToBeSent
	ld a, [wPlayerTrademonSpecies]
	ld [CurPartySpecies], a
	call Function10895e
	ld a, [wPlayerTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call WaitBGMap
.loop
	ld a, [hWX]
	cp $7
	jr z, .okay
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	call DelayFrame
	jr .loop

.okay
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	ld a, [wPlayerTrademonSpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCryHeader

.skip_cry
	ld c, 80
	call DelayFrames
	call Function108bec
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_20
	call _InitSpriteAnimStruct
	ld de, SFX_BALL_POOF
	call PlaySFX
	hlcoord 0, 0
	ld bc, 12 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ld c, 80
	call WaitMobileTradeSpriteAnims
	call GetMobileTradeAnimByte
	ret
; 10839b

MobileTradeAnim_ShowOTMonFromTrade: ; 10839b
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba DeinitializeAllSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_21
	call _InitSpriteAnimStruct
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, 48
	call WaitMobileTradeSpriteAnims
	ld de, SFX_BALL_POOF
	call PlaySFX
	call MobileTradeAnim_DisplayReceivedMon
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call Function108963
	ld a, [wOTTrademonSpecies]
	call Function108229
	call Function1082db
	call Function108c16
	call GetMobileTradeAnimByte
	ret
; 10842c

MobileTradeAnim_ShowPlayerMonForGTS: ; 10842c
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
	call MobileTradeAnim_DisplayMonToBeSent
	ld a, [wPlayerTrademonSpecies]
	ld [CurPartySpecies], a
	ld hl, wPlayerTrademonDVs
	call Function10898a
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, VTiles0 tile $06
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	ld a, [wPlayerTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call WaitBGMap
.loop
	ld a, [hWX]
	cp $7
	jr z, .done
	sub $4
	ld [hWX], a
	ld a, [hSCX]
	sub $4
	ld [hSCX], a
	call DelayFrame
	jr .loop

.done
	ld a, $7
	ld [hWX], a
	xor a
	ld [hSCX], a
	ld a, [wPlayerTrademonSpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCryHeader

.skip_cry
	ld c, 80
	call DelayFrames
	call Function108c2b
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_20
	call _InitSpriteAnimStruct
	ld de, SFX_BALL_POOF
	call PlaySFX
	hlcoord 0, 0
	ld bc, 12 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ld c, 80
	call WaitMobileTradeSpriteAnims
	call GetMobileTradeAnimByte
	ret
; 1084d7

MobileTradeAnim_ShowOTMonFromGTS: ; 1084d7
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba DeinitializeAllSprites
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, VTiles0 tile $06
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_21
	call _InitSpriteAnimStruct
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, 48
	call WaitMobileTradeSpriteAnims
	ld de, SFX_BALL_POOF
	call PlaySFX
	call MobileTradeAnim_DisplayReceivedMon
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $50
	ld [hWY], a
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	call Function10898a
	ld a, [wOTTrademonSpecies]
	call Function108229
	call Function1082db
	call Function108c40
	call GetMobileTradeAnimByte
	ret
; 108589

MobileTradeAnim_GetOddEgg: ; 108589
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, VTiles2
	call Function108201
	call EnableLCD
	callba DeinitializeAllSprites
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, VTiles0
	lb bc, BANK(TradeBallGFX), $06
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, VTiles0 tile $06
	lb bc, BANK(TradePoofGFX), $0c
	call Request2bpp
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_21
	call _InitSpriteAnimStruct
	call Function108b45
	ld a, $1
	call Function108b98
	call Function108af4
	ld c, 48
	call WaitMobileTradeSpriteAnims
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
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [TempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [TempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	call Function10898a
	ld a, [wOTTrademonSpecies]
	call Function108229
	call Function1082db
	call GetMobileTradeAnimByte
	ret
; 108638

MobileTradeAnim_02: ; 108638
	callba DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
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
	ld de, UnknBGPals
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function108d07
	call Function108af4
	call GetMobileTradeAnimByte
	ret
; 108689

MobileTradeAnim_10: ; 108689
	callba DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_108da7
	ld de, VTiles2
	call Decompress
	ld a, $0
	ld [rVBK], a
	ld hl, LZ_108d27
	ld de, VTiles0 tile $20
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
	ld de, UnknBGPals
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	call Function108d07
	call Function108af4
	call GetMobileTradeAnimByte
	ret
; 1086f4

MobileTradeAnim_11: ; 1086f4
	call ClearBGPalettes
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
	ld de, VTiles0 tile $20
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
	ld de, UnknBGPals
	ld bc, 8 palettes
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
	call GetMobileTradeAnimByte
	ret
; 108763

MobileTradeAnim_GiveTrademon1: ; 108763
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, 40
	ld hl, BGPals + 6 palettes
	call Function1082f0
	call Function108af4
.loop
	ld a, [hSCX]
	cp $e0
	jr z, .loop2
	dec a
	dec a
	ld [hSCX], a
	cp $f8
	jr nz, .next
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_22
	call _InitSpriteAnimStruct

.next
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.loop2
	ld a, [hSCY]
	cp $f8
	jr z, .done
	dec a
	dec a
	ld [hSCY], a
	cp $40
	jr z, .init
	cp $30
	jr z, .delete
	cp $68
	jr z, .replace
	jr .next2

.init
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_22
	call _InitSpriteAnimStruct
	xor a
	call Function108ad4
	jr .next2

.delete
	call MobileTradeAnim_DeleteSprites
	jr .next2

.replace
	call MobileTradeAnim_DeleteSprites
	ld a, $1
	call Function108ad4
.next2
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop2

.done
	call MobileTradeAnim_Next
	ret
; 1087cf

MobileTradeAnim_GiveTrademon2: ; 1087cf
	ld c, 40
	ld hl, BGPals + 1 palettes
	call Function1082f0
	call Function108af4
	call Function108b5a
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_25
	call _InitSpriteAnimStruct
	ld de, SFX_FORESIGHT
	call PlaySFX
	ld c, 10
	call WaitMobileTradeSpriteAnims
	xor a
	ld [wcf64], a
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_23
	call _InitSpriteAnimStruct
.loop
	ld a, [hSCY]
	cp $90
	jr z, .done
	sub $8
	ld [hSCY], a
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.done
	call GetMobileTradeAnimByte
	ret
; 108811

MobileTradeAnim_05: ; 108811
	ld c, 40
	call WaitMobileTradeSpriteAnims
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	ld c, 60
	call WaitMobileTradeSpriteAnims
	depixel 30, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_24
	call _InitSpriteAnimStruct
	call GetMobileTradeAnimByte
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret
; 108838

MobileTradeAnim_06: ; 108838
	ld c, 40
	call WaitMobileTradeSpriteAnims
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	call GetMobileTradeAnimByte
	ret
; 10884c

MobileTradeAnim_07: ; 10884c
	ld c, 80
	call DelayFrames
	depixel 30, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_24
	call _InitSpriteAnimStruct
	call GetMobileTradeAnimByte
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret
; 108863

MobileTradeAnim_GetTrademon1: ; 108863
	ld c, 40
	call WaitMobileTradeSpriteAnims
.loop
	ld a, [hSCY]
	cp $f8
	jr z, .done
	add $8
	ld [hSCY], a
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.done
	callba DeinitializeAllSprites
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_25
	call _InitSpriteAnimStruct
	ld de, SFX_GLASS_TING_2
	call PlaySFX
	call Function108af4
	call MobileTradeAnim_Next
	ret
; 108894

MobileTradeAnim_GetTrademon2: ; 108894
	ld c, 20
	ld hl, BGPals + 1 palettes
	call Function1082fa
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, 20
	ld hl, BGPals + 1 palettes
	call Function1082fa
	call Function108af4
.asm_1088ad
	ld a, [hSCY]
	cp $78
	jr z, .asm_1088ee
	inc a
	inc a
	ld [hSCY], a
	cp $30
	jr z, .asm_1088c5
	cp $40
	jr z, .asm_1088dd
	cp $68
	jr z, .asm_1088cf
	jr .asm_1088e7

.asm_1088c5
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_22
	call _InitSpriteAnimStruct
	jr .asm_1088e7

.asm_1088cf
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_22
	call _InitSpriteAnimStruct
	xor a
	call Function108ad4
	jr .asm_1088e7

.asm_1088dd
	call MobileTradeAnim_DeleteSprites
	ld a, $1
	call Function108ad4
	jr .asm_1088e7

.asm_1088e7
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .asm_1088ad

.asm_1088ee
	ld a, [hSCX]
	cp $c
	jr z, .asm_108906
	inc a
	inc a
	ld [hSCX], a
	cp -8
	jr nz, .asm_1088e7
	call MobileTradeAnim_DeleteSprites
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .asm_1088ee

.asm_108906
	call MobileTradeAnim_Next
	ret
; 10890a

MobileTradeAnim_GetTrademon3: ; 10890a
	ld c, 40
	ld hl, BGPals + 6 palettes
	call Function1082f0
	call Function108af4
	call GetMobileTradeAnimByte
	ret
; 108919

MobileTradeAnim_0f: ; 108919
	ld c, 40
	call WaitMobileTradeSpriteAnims
	callba DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call MobileTradeAnim_ClearVTiles
	call MobileTradeAnim_ClearBGMap
	call EnableLCD
	call GetMobileTradeAnimByte
	ret
; 10893d

MobileTradeAnim_FadeToBlack: ; 10893d
.loop
	ld a, [rBGP]
	and a
	jr z, .blank
	sla a
	sla a
	call DmgToCgbBGPals
	call DmgToCgbObjPal0
	ld c, 4
	call DelayFrames
	jr .loop

.blank
	xor a
	call DmgToCgbBGPals
	call DmgToCgbObjPal0
	call GetMobileTradeAnimByte
	ret
; 10895e

Function10895e: ; 10895e
	ld de, VTiles0 tile $30
	jr asm_108966

Function108963:
	ld de, VTiles2 tile $31
asm_108966
	call DelayFrame
	ld hl, VTiles2
	lb bc, $a, $31 ; $a is the bank of ?????
	call Request2bpp
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	hlcoord 7, 2
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret
; 10898a

Function10898a: ; 10898a
	ld de, VTiles2
	call MobileTradeAnim_GetFrontpic
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	hlcoord 7, 2
	xor a
	ld [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret
; 1089a8

MobileTradeAnim_DisplayMonToBeSent: ; 1089a8
	ld de, wPlayerTrademonSpecies
	ld a, [de]
	cp EGG
	jr z, MobileTradeAnim_DisplayEggData
	call MobileTradeAnim_LoadMonTemplate
	ld de, wPlayerTrademonSpecies
	call MobileTradeAnim_MonDisplay_PrintSpeciesNumber
	ld de, wPlayerTrademonSpeciesName
	call MobileTradeAnim_MonDisplay_PrintSpeciesName
	ld a, [wPlayerTrademonCaughtData]
	ld de, wPlayerTrademonOTName
	call MobileTradeAnim_MonDisplay_PrintOTNameAndGender
	ld de, wPlayerTrademonID
	call MobileTradeAnim_MonDisplay_PrintIDNumber
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret

MobileTradeAnim_DisplayReceivedMon:
	ld de, wOTTrademonSpecies
	ld a, [de]
	cp EGG
	jr z, MobileTradeAnim_DisplayEggData
	call MobileTradeAnim_LoadMonTemplate
	ld de, wOTTrademonSpecies
	call MobileTradeAnim_MonDisplay_PrintSpeciesNumber
	ld de, wOTTrademonSpeciesName
	call MobileTradeAnim_MonDisplay_PrintSpeciesName
	ld a, [wOTTrademonCaughtData]
	ld de, wOTTrademonOTName
	call MobileTradeAnim_MonDisplay_PrintOTNameAndGender
	ld de, wOTTrademonID
	call MobileTradeAnim_MonDisplay_PrintIDNumber
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret

MobileTradeAnim_DisplayEggData
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 5, 0
	ld b, 6
	ld c, 9
	call TextBox
	hlcoord 6, 2
	ld de, .EggTemplate
	call PlaceString
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret
; 108a1d

.EggTemplate: ; 108a1d
	db   "タマゴ"
	next "おや/?????"
	next "<ID>№·?????"
	db   "@"
; 108a33

Function108a33: ; 108a33
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 5, 0
	ld b, 6
	ld c, 9
	call TextBox
	hlcoord 7, 4
	ld de, .OddEgg
	call PlaceString
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret
; 108a54

.OddEgg: ; 108a54
	db "なぞのタマゴ@"
; 108a5b

MobileTradeAnim_LoadMonTemplate: ; 108a5b
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 4, 0
	ld b,  6
	ld c, 10
	call TextBox
	hlcoord 5, 0
	ld de, .MonTemplate
	call PlaceString
	ret
; 108a79

.MonTemplate: ; 108a79
	db   "─ №·"
	next ""
	next "おや/"
	next "<ID>№·"
	db   "@"
; 108a87

MobileTradeAnim_MonDisplay_UpdateBGMap: ; 108a87
	call WaitBGMap
	call WaitTop
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	ret
; 108a92

MobileTradeAnim_MonDisplay_PrintSpeciesNumber: ; 108a92
	hlcoord 9, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret
; 108a9c

MobileTradeAnim_MonDisplay_PrintSpeciesName: ; 108a9c
	hlcoord 5, 2
	call PlaceString
	ret
; 108aa3

MobileTradeAnim_MonDisplay_PrintOTNameAndGender: ; 108aa3
	cp $3
	jr c, .got_gender
	xor a
.got_gender
	push af
	hlcoord 8, 4
	call PlaceString
	inc bc
	pop af
	ld hl, .GenderChars
	ld d, 0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [bc], a
	ret
; 108abb

.GenderChars: ; 108abb
	db " "
	db "♂"
	db "♀"
; 108abe

MobileTradeAnim_MonDisplay_PrintIDNumber: ; 108abe
	hlcoord 8, 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret
; 108ac8

MobileTradeAnim_ClearTilemap: ; 108ac8
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
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
	ld hl, VTiles2 tile $4a
	lb bc, BANK(GFX_1092c7), 16
	call Get2bpp_2
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
	jr z, .copy_palette_109147
	ld hl, Palette_109187
	ld de, UnknOBPals
	ld bc, 8 palettes
	call CopyBytes
	ld hl, Palette_109187
	ld de, OBPals
	ld bc, 8 palettes
	call CopyBytes
	jr .done_copy

.copy_palette_109147
	ld hl, Palette_109147
	ld de, UnknOBPals
	ld bc, 8 palettes
	call CopyBytes
	ld hl, Palette_109147
	ld de, OBPals
	ld bc, 8 palettes
	call CopyBytes

.done_copy
	pop af
	ld [rSVBK], a
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbObjPal0
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call DelayFrame
	ret
; 108b45

Function108b45: ; 108b45
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld de, (31 << 10) + (31 << 5) + 31 ; $7fff
	ld hl, UnknBGPals
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
	ld de, (15 << 10) + (31 << 5) + 18 ; $3ff2
	ld hl, BGPals + 4 palettes
	ld c, $10
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .loop
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
	jr z, .Orange
	ld de, (31 << 10) + (31 << 5) + 31 ; $7fff
	jr .load_pal

.Orange:
	ld de, ( 1 << 10) + (15 << 5) + 31 ; $05ff
.load_pal
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
	ld hl, Palette_108b98 + 1 palettes
	jr .asm_108bb0

.asm_108bad
	ld hl, Palette_108b98
.asm_108bb0
	ld de, UnknBGPals + 7 palettes
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ld [rSVBK], a
	ret
; 108bbd

MobileTradeAnim_DeleteSprites: ; 108bbd
	callba DeinitializeAllSprites
	call ClearSprites
	ret
; 108bc7

Function108bc7: ; 108bc7 (42:4bc7)
	ld a, [wcf64]
	and a
	ret z
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp -1 * 8 - 6
	jr z, .delete
	sub 1 * 8
	ld [hl], a
	ret

.delete
	callba DeinitializeSprite
	ret

Function108be0: ; 108be0 (42:4be0)
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 9 * 8 + 2
	ret z
	add 1 * 8
	ld [hl], a
	ret
; 108bec (42:4bec)

Function108bec: ; 108bec
	ld a, $90
	ld [hWY], a
	ld hl, .PlayerWillTradeMon
	call PrintText
	ld c, 80
	call DelayFrames
	ld hl, .ForPartnersMon
	call PrintText
	ld c, 80
	call DelayFrames
	ret
; 108c07

.PlayerWillTradeMon: ; 0x108c07
	text_jump UnknownText_0x1bc787
	db "@"
; 0x108c0c

.ForPartnersMon: ; 0x108c0c
	text_jump UnknownText_0x1bc79d
	db "@"
; 0x108c11

.UnusedTextPlayersMonTrade: ; 0x108c11
	text_jump UnknownText_0x1bc7b0
	db "@"
; 0x108c16

Function108c16: ; 108c16
	ld a, $90
	ld [hWY], a
	ld hl, .TakeGoodCareOfMon
	call PrintText
	ld c, 80
	call DelayFrames
	ret
; 108c26

.TakeGoodCareOfMon: ; 0x108c26
	text_jump UnknownText_0x1bc7c3
	db "@"
; 0x108c2b

Function108c2b: ; 108c2b
	ld a, $90
	ld [hWY], a
	ld hl, .PlayersMonTrade
	call PrintText
	ld c, 80
	call DelayFrames
	ret
; 108c3b

.PlayersMonTrade: ; 0x108c3b
	text_jump UnknownText_0x1bc7dd
	db "@"
; 0x108c40

Function108c40: ; 108c40
	ld a, $90
	ld [hWY], a
	ld a, [wcf65]
	and %10000000
	jr z, .Getmon
	ld hl, .CameBack
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.Getmon:
	ld hl, .TakeGoodCareOf
	call PrintText
	ld c, 80
	call DelayFrames
	ret
; 108c63

.TakeGoodCareOf: ; 0x108c63
	text_jump UnknownText_0x1bc7f0
	db "@"
; 0x108c68

.CameBack: ; 0x108c68
	text_jump UnknownText_0x1bc80a
	db "@"
; 0x108c6d

Function108c6d: ; 108c6d
	ld hl, LZ_108fe7
	debgcoord 0, 0
	call Decompress
	ld hl, LZ_108fe7
	debgcoord 0, 0, VBGMap1
	call Decompress
	ret
; 108c80

Function108c80: ; 108c80
	ld a, $1
	ld [rVBK], a
	ld hl, LZ_1090a7
	debgcoord 0, 0
	call Decompress
	ld hl, LZ_1090a7
	debgcoord 0, 0, VBGMap1
	call Decompress
	ld a, $0
	ld [rVBK], a
	ret
; 108c9b

DebugMobileTrade: ; 108c9b
; localization error: NAME_LENGTH (11) should be 6 here

	ld hl, .DebugTradeData
	ld a, [hli]
	ld [wPlayerTrademonSpecies], a

	ld de, wPlayerTrademonSenderName
	ld c, NAME_LENGTH
.your_name_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .your_name_loop

	ld de, wPlayerTrademonID
	ld c, 2
.your_id_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .your_id_loop

	ld de, wPlayerTrademonOTName
	ld c, NAME_LENGTH
.your_ot_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .your_ot_loop

	ld a, [hli]
	ld [wOTTrademonSpecies], a

	ld de, wOTTrademonSenderName
	ld c, NAME_LENGTH
.their_name_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .their_name_loop

	ld de, wOTTrademonID
	ld c, 2
.their_id_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .their_id_loop

	ld de, wOTTrademonOTName
	ld c, NAME_LENGTH
.their_ot_loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .their_ot_loop

	ret
; 108ce9

.DebugTradeData:
	db VENUSAUR
	db "ゲーフり@@"
	dw $0123
	db "かびーん@@"
	db CHARIZARD
	db "クりーチャ@"
	dw $0456
	db "マツミヤ@@"
; 108d07

Function108d07: ; 108d07
	ld a, [wc74e]
	and $7f
	cp $8
	jr c, .asm_108d12
	ld a, $7

.asm_108d12
	ld bc, 1 palettes
	ld hl, Palette_1093c7
	call AddNTimes
	ld a, $5
	ld de, UnknBGPals + 4 palettes
	ld bc, 1 palettes
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
; unreferenced
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
