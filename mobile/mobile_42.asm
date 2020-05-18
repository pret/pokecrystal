MobileTradeAnimation_SendGivemonToGTS:
	ld a, $80
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics

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

MobileTradeAnimation_ReceiveGetmonFromGTS:
	ld a, $0
asm_108018:
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_07
	mobiletradeanim_receivemon
	mobiletradeanim_showgtsgetmon
	mobiletradeanim_end

Function108026:
	ld a, $0
	jr asm_10802c

Function10802a:
	ld a, $1

asm_10802c:
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_Frontpics

.TradeAnimScript: ; trade
	mobiletradeanim_showgivemon
	mobiletradeanim_12
	mobiletradeanim_02
	mobiletradeanim_sendmon
	mobiletradeanim_05
	mobiletradeanim_receivemon
	mobiletradeanim_showgetmon
	mobiletradeanim_end

Function10803d:
	ld a, $0
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_07
	mobiletradeanim_receivemon
	mobiletradeanim_showoddegg
	mobiletradeanim_end

Function10804d:
	ld a, $0
	ld [wcf65], a
	ld de, .TradeAnimScript
	jp RunMobileTradeAnim_NoFrontpics

.TradeAnimScript:
	mobiletradeanim_11
	mobiletradeanim_showgtsgetmon
	mobiletradeanim_end

RunMobileTradeAnim_Frontpics:
	ld hl, wTradeAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ld hl, wVramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function1080b7
.loop
	call MobileTradeAnim_JumptableLoop
	jr nc, .loop
	pop af
	ld [wOptions], a
	pop af
	ld [wVramState], a
	pop af
	ldh [hMapAnims], a
	ret

RunMobileTradeAnim_NoFrontpics:
	ld hl, wTradeAnimAddress
	ld [hl], e
	inc hl
	ld [hl], d
	ldh a, [hMapAnims]
	push af
	xor a
	ldh [hMapAnims], a
	ld hl, wVramState
	ld a, [hl]
	push af
	res 0, [hl]
	ld hl, wOptions
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function108157
.loop
	call MobileTradeAnim_JumptableLoop
	jr nc, .loop
	pop af
	ld [wOptions], a
	pop af
	ld [wVramState], a
	pop af
	ldh [hMapAnims], a
	ret

Function1080b7:
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearTiles
	call MobileTradeAnim_ClearBGMap
	call LoadStandardFont
	call LoadFontsBattleExtra

	ld a, $1
	ldh [rVBK], a
	ld hl, MobileTradeGFX
	ld de, vTiles2
	call Decompress

	ld a, $0
	ldh [rVBK], a
	ld hl, MobileTradeSpritesGFX
	ld de, vTiles0 tile $20
	call Decompress

	call EnableLCD

	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	farcall ClearSpriteAnims

	call DelayFrame

	ld de, TradeBallGFX
	ld hl, vTiles0
	lb bc, BANK(TradeBallGFX), 6
	call Request2bpp

	ld de, TradePoofGFX
	ld hl, vTiles0 tile $06
	lb bc, BANK(TradePoofGFX), 12
	call Request2bpp

	xor a
	ld hl, wSpriteAnimDict
	ld [hli], a
	ld [hl], $0

	ld a, [wPlayerTrademonSpecies]
	ld hl, wPlayerTrademonDVs
	ld de, vTiles0 tile $30
	call MobileTradeAnim_GetFrontpic

	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, vTiles2 tile $31
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

Function108157:
	xor a
	ld [wJumptableIndex], a
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearTiles
	call MobileTradeAnim_ClearBGMap
	call LoadStandardFont
	call LoadFontsBattleExtra
	call EnableLCD
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	farcall ClearSpriteAnims
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

MobileTradeAnim_ClearTiles:
	ld a, $1
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, 3 * $80 tiles
	xor a
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	ld hl, vTiles0
	ld bc, 3 * $80 tiles
	xor a
	call ByteFill
	ret

MobileTradeAnim_ClearBGMap:
	ld a, $1
	ldh [rVBK], a
	hlbgcoord 0, 0
	ld bc, 2 * BG_MAP_HEIGHT * BG_MAP_WIDTH
	ld a, $0
	call ByteFill
	ld a, $0
	ldh [rVBK], a
	hlbgcoord 0, 0
	ld bc, 2 * BG_MAP_HEIGHT * BG_MAP_WIDTH
	ld a, $7f
	call ByteFill
	ret

MobileTradeAnim_GetFrontpic:
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	pop de
	predef GetMonFrontpic
	ret

Function108201:
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [wCurPartySpecies], a
	ld [wCurSpecies], a
	call GetBaseData
	pop de
	predef GetAnimatedFrontpic
	ret

Function108219:
	ld [wCurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret

Function108229:
	ld [wCurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef LoadMonAnimation
	ret

MobileTradeAnim_InitSpeciesName:
	push de
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, wStringBuffer1
	pop de
	ld bc, MON_NAME_LENGTH
	call CopyBytes
	ret

MobileTradeAnim_JumptableLoop:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .StopAnim
	call .ExecuteMobileTradeAnimCommand
	call DelayFrame
	and a
	ret

.StopAnim:
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	call LoadStandardFont
	call LoadFontsBattleExtra
	farcall Stubbed_Function106462
	farcall Function106464
	scf
	ret

.ExecuteMobileTradeAnimCommand:
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

.Jumptable:
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

MobileTradeAnim_Next:
	ld hl, wJumptableIndex
	inc [hl]
	ret

GetMobileTradeAnimByte:
	ld hl, wTradeAnimAddress
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

EndMobileTradeAnim:
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

WaitMobileTradeSpriteAnims:
.loop
	push bc
	farcall PlaySpriteAnimations
	pop bc
	call DelayFrame
	dec c
	jr nz, .loop
	ret

Function1082db:
.loop
	farcall PlaySpriteAnimations
	farcall SetUpPokeAnim
	farcall HDMATransferTilemapToWRAMBank3
	jr nc, .loop
	ret

Function1082f0:
.loop
	call Function108b78
	call DelayFrame
	dec c
	jr nz, .loop
	ret

Function1082fa:
.loop
	call Function108b78
	push hl
	push bc
	farcall PlaySpriteAnimations
	pop bc
	pop hl
	call DelayFrame
	dec c
	jr nz, .loop
	ret

MobileTradeAnim_ShowPlayerMonToBeSent:
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	ld a, $80
	ldh [hSCX], a
	xor a
	ldh [hSCY], a
	ld a, $87
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	call MobileTradeAnim_DisplayMonToBeSent
	ld a, [wPlayerTrademonSpecies]
	ld [wCurPartySpecies], a
	call Function10895e
	ld a, [wPlayerTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call WaitBGMap
.loop
	ldh a, [hWX]
	cp $7
	jr z, .okay
	sub $4
	ldh [hWX], a
	ldh a, [hSCX]
	sub $4
	ldh [hSCX], a
	call DelayFrame
	jr .loop

.okay
	ld a, $7
	ldh [hWX], a
	xor a
	ldh [hSCX], a
	ld a, [wPlayerTrademonSpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCry

.skip_cry
	ld c, 80
	call DelayFrames
	call Function108bec
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_SENT_BALL
	call InitSpriteAnimStruct
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

MobileTradeAnim_ShowOTMonFromTrade:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, vTiles2
	call Function108201
	call EnableLCD
	farcall DeinitializeAllSprites
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_OT_BALL
	call InitSpriteAnimStruct
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
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
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

MobileTradeAnim_ShowPlayerMonForGTS:
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	ld a, $80
	ldh [hSCX], a
	xor a
	ldh [hSCY], a
	ld a, $87
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	call MobileTradeAnim_DisplayMonToBeSent
	ld a, [wPlayerTrademonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wPlayerTrademonDVs
	call Function10898a
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, vTiles0
	lb bc, BANK(TradeBallGFX), 6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, vTiles0 tile $06
	lb bc, BANK(TradePoofGFX), 12
	call Request2bpp
	ld a, [wPlayerTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wPlayerTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
	ld b, SCGB_PLAYER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call WaitBGMap
.loop
	ldh a, [hWX]
	cp $7
	jr z, .done
	sub $4
	ldh [hWX], a
	ldh a, [hSCX]
	sub $4
	ldh [hSCX], a
	call DelayFrame
	jr .loop

.done
	ld a, $7
	ldh [hWX], a
	xor a
	ldh [hSCX], a
	ld a, [wPlayerTrademonSpecies]
	call GetCryIndex
	jr c, .skip_cry
	ld e, c
	ld d, b
	call PlayCry

.skip_cry
	ld c, 80
	call DelayFrames
	call Function108c2b
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_SENT_BALL
	call InitSpriteAnimStruct
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

MobileTradeAnim_ShowOTMonFromGTS:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, vTiles2
	call Function108201
	call EnableLCD
	farcall DeinitializeAllSprites
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, vTiles0
	lb bc, BANK(TradeBallGFX), 6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, vTiles0 tile $06
	lb bc, BANK(TradePoofGFX), 12
	call Request2bpp
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_OT_BALL
	call InitSpriteAnimStruct
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
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
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

MobileTradeAnim_GetOddEgg:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld hl, wOTTrademonDVs
	ld de, vTiles2
	call Function108201
	call EnableLCD
	farcall DeinitializeAllSprites
	call DelayFrame
	ld de, TradeBallGFX
	ld hl, vTiles0
	lb bc, BANK(TradeBallGFX), 6
	call Request2bpp
	ld de, TradePoofGFX
	ld hl, vTiles0 tile $06
	lb bc, BANK(TradePoofGFX), 12
	call Request2bpp
	xor a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_OT_BALL
	call InitSpriteAnimStruct
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
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $50
	ldh [hWY], a
	ld a, [wOTTrademonSpecies]
	ld [wCurPartySpecies], a
	ld a, [wOTTrademonDVs]
	ld [wTempMonDVs], a
	ld a, [wOTTrademonDVs + 1]
	ld [wTempMonDVs + 1], a
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

MobileTradeAnim_02:
	farcall DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $c
	ldh [hSCX], a
	ld a, $78
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, MobileTradeBGPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call LoadMobileAdapterPalette
	call Function108af4
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_10:
	farcall DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	call DisableLCD
	call MobileTradeAnim_ClearBGMap
	ld a, $1
	ldh [rVBK], a
	ld hl, MobileTradeGFX
	ld de, vTiles2
	call Decompress
	ld a, $0
	ldh [rVBK], a
	ld hl, MobileTradeSpritesGFX
	ld de, vTiles0 tile $20
	call Decompress
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $c
	ldh [hSCX], a
	ld a, $78
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, MobileTradeBGPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call LoadMobileAdapterPalette
	call Function108af4
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_11:
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	xor a
	ldh [hBGMapMode], a
	call DisableLCD
	ld a, $1
	ldh [rVBK], a
	ld hl, MobileTradeGFX
	ld de, vTiles2
	call Decompress
	ld a, $0
	ldh [rVBK], a
	ld hl, MobileTradeSpritesGFX
	ld de, vTiles0 tile $20
	call Decompress
	call Function108c80
	call Function108c6d
	call EnableLCD
	ld a, $80
	ldh [hSCX], a
	ld a, $90
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld hl, MobileTradeBGPalettes
	ld de, wBGPals1
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	call LoadMobileAdapterPalette
	call Function108af4
	call Function108b5a
	ld a, $e0
	ldh [hSCX], a
	ld de, MUSIC_EVOLUTION
	call PlayMusic2
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_GiveTrademon1:
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, 40
	ld hl, wBGPals2 palette 6
	call Function1082f0
	call Function108af4
.loop
	ldh a, [hSCX]
	cp $e0
	jr z, .loop2
	dec a
	dec a
	ldh [hSCX], a
	cp $f8
	jr nz, .next
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_CABLE_BULGE
	call InitSpriteAnimStruct

.next
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.loop2
	ldh a, [hSCY]
	cp $f8
	jr z, .done
	dec a
	dec a
	ldh [hSCY], a
	cp $40
	jr z, .init
	cp $30
	jr z, .delete
	cp $68
	jr z, .replace
	jr .next2

.init
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_CABLE_BULGE
	call InitSpriteAnimStruct
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

MobileTradeAnim_GiveTrademon2:
	ld c, 40
	ld hl, wBGPals2 + 1 palettes
	call Function1082f0
	call Function108af4
	call Function108b5a
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_PING
	call InitSpriteAnimStruct
	ld de, SFX_FORESIGHT
	call PlaySFX
	ld c, 10
	call WaitMobileTradeSpriteAnims
	xor a
	ld [wcf64], a
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_SENT_PULSE
	call InitSpriteAnimStruct
.loop
	ldh a, [hSCY]
	cp $90
	jr z, .done
	sub $8
	ldh [hSCY], a
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.done
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_05:
	ld c, 40
	call WaitMobileTradeSpriteAnims
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	ld c, 60
	call WaitMobileTradeSpriteAnims
	depixel 30, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_OT_PULSE
	call InitSpriteAnimStruct
	call GetMobileTradeAnimByte
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret

MobileTradeAnim_06:
	ld c, 40
	call WaitMobileTradeSpriteAnims
	ld a, $1
	ld [wcf64], a
	ld de, SFX_SHARPEN
	call PlaySFX
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_07:
	ld c, 80
	call DelayFrames
	depixel 30, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_OT_PULSE
	call InitSpriteAnimStruct
	call GetMobileTradeAnimByte
	ld de, SFX_THROW_BALL
	call PlaySFX
	ret

MobileTradeAnim_GetTrademon1:
	ld c, 40
	call WaitMobileTradeSpriteAnims
.loop
	ldh a, [hSCY]
	cp $f8
	jr z, .done
	add $8
	ldh [hSCY], a
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .loop

.done
	farcall DeinitializeAllSprites
	depixel 9, 10, 2, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_PING
	call InitSpriteAnimStruct
	ld de, SFX_GLASS_TING_2
	call PlaySFX
	call Function108af4
	call MobileTradeAnim_Next
	ret

MobileTradeAnim_GetTrademon2:
	ld c, 20
	ld hl, wBGPals2 + 1 palettes
	call Function1082fa
	ld de, SFX_GIVE_TRADEMON
	call PlaySFX
	ld c, 20
	ld hl, wBGPals2 + 1 palettes
	call Function1082fa
	call Function108af4
.asm_1088ad
	ldh a, [hSCY]
	cp $78
	jr z, .asm_1088ee
	inc a
	inc a
	ldh [hSCY], a
	cp $30
	jr z, .asm_1088c5
	cp $40
	jr z, .asm_1088dd
	cp $68
	jr z, .asm_1088cf
	jr .asm_1088e7

.asm_1088c5
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_CABLE_BULGE
	call InitSpriteAnimStruct
	jr .asm_1088e7

.asm_1088cf
	depixel 10, 11, 4, 0
	ld a, SPRITE_ANIM_INDEX_MOBILE_TRADE_CABLE_BULGE
	call InitSpriteAnimStruct
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
	ldh a, [hSCX]
	cp $c
	jr z, .asm_108906
	inc a
	inc a
	ldh [hSCX], a
	cp -8
	jr nz, .asm_1088e7
	call MobileTradeAnim_DeleteSprites
	ld c, 1
	call WaitMobileTradeSpriteAnims
	jr .asm_1088ee

.asm_108906
	call MobileTradeAnim_Next
	ret

MobileTradeAnim_GetTrademon3:
	ld c, 40
	ld hl, wBGPals2 palette 6
	call Function1082f0
	call Function108af4
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_0f:
	ld c, 40
	call WaitMobileTradeSpriteAnims
	farcall DeinitializeAllSprites
	call ClearBGPalettes
	call ClearSprites
	call ClearTilemap
	call DisableLCD
	call MobileTradeAnim_ClearTiles
	call MobileTradeAnim_ClearBGMap
	call EnableLCD
	call GetMobileTradeAnimByte
	ret

MobileTradeAnim_FadeToBlack:
.loop
	ldh a, [rBGP]
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

Function10895e:
	ld de, vTiles0 tile $30
	jr asm_108966

Function108963:
	ld de, vTiles2 tile $31
asm_108966:
	call DelayFrame
	ld hl, vTiles2
	lb bc, $a, $31 ; $a is the bank of ?????
	call Request2bpp
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	hlcoord 7, 2
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

Function10898a:
	ld de, vTiles2
	call MobileTradeAnim_GetFrontpic
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	hlcoord 7, 2
	xor a
	ldh [hGraphicStartTile], a
	lb bc, 7, 7
	predef PlaceGraphic
	call WaitBGMap
	ret

MobileTradeAnim_DisplayMonToBeSent:
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

MobileTradeAnim_DisplayEggData:
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 5, 0
	ld b, 6
	ld c, 9
	call Textbox
	hlcoord 6, 2
	ld de, .EggTemplate
	call PlaceString
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret

.EggTemplate:
	db   "タマゴ"
	next "おや/？？？？？"
	next "<ID>№<DOT>？？？？？"
	db   "@"

Function108a33:
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 5, 0
	ld b, 6
	ld c, 9
	call Textbox
	hlcoord 7, 4
	ld de, .OddEgg
	call PlaceString
	call MobileTradeAnim_MonDisplay_UpdateBGMap
	ret

.OddEgg:
	db "なぞのタマゴ@"

MobileTradeAnim_LoadMonTemplate:
	call WaitTop
	call MobileTradeAnim_ClearTilemap
	ld a, HIGH(vBGMap1)
	ldh [hBGMapAddress + 1], a
	hlcoord 4, 0
	ld b,  6
	ld c, 10
	call Textbox
	hlcoord 5, 0
	ld de, .MonTemplate
	call PlaceString
	ret

.MonTemplate:
	db   "─　№<DOT>"
	next ""
	next "おや／"
	next "<ID>№<DOT>"
	db   "@"

MobileTradeAnim_MonDisplay_UpdateBGMap:
	call WaitBGMap
	call WaitTop
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	ret

MobileTradeAnim_MonDisplay_PrintSpeciesNumber:
	hlcoord 9, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ret

MobileTradeAnim_MonDisplay_PrintSpeciesName:
	hlcoord 5, 2
	call PlaceString
	ret

MobileTradeAnim_MonDisplay_PrintOTNameAndGender:
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

.GenderChars:
	db " "
	db "♂"
	db "♀"

MobileTradeAnim_MonDisplay_PrintIDNumber:
	hlcoord 8, 6
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret

MobileTradeAnim_ClearTilemap:
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ret

Function108ad4:
	and a
	jr z, .asm_108adc
	ld de, MobileCable2GFX
	jr .asm_108adf

.asm_108adc
	ld de, MobileCable1GFX
.asm_108adf
	ld a, $1
	ldh [rVBK], a
	ld hl, vTiles2 tile $4a
	lb bc, BANK(MobileCable1GFX), 16 ; aka BANK(MobileCable2GFX)
	call Get2bppViaHDMA
	call DelayFrame
	ld a, $0
	ldh [rVBK], a
	ret

Function108af4:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, [wcf65]
	and $1
	jr z, .copy_MobileTradeOB1Palettes
	ld hl, MobileTradeOB2Palettes
	ld de, wOBPals1
	ld bc, 8 palettes
	call CopyBytes
	ld hl, MobileTradeOB2Palettes
	ld de, wOBPals2
	ld bc, 8 palettes
	call CopyBytes
	jr .done_copy

.copy_MobileTradeOB1Palettes
	ld hl, MobileTradeOB1Palettes
	ld de, wOBPals1
	ld bc, 8 palettes
	call CopyBytes
	ld hl, MobileTradeOB1Palettes
	ld de, wOBPals2
	ld bc, 8 palettes
	call CopyBytes

.done_copy
	pop af
	ldh [rSVBK], a
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbObjPal0
	ld a, %11100100 ; 3,2,1,0
	call DmgToCgbBGPals
	call DelayFrame
	ret

Function108b45:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld de, PALRGB_WHITE
	ld hl, wBGPals1
	ld a, e
	ld [hli], a
	ld d, a
	ld [hli], a
	pop af
	ldh [rSVBK], a
	ret

Function108b5a:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld de, palred 18 + palgreen 31 + palblue 15
	ld hl, wBGPals2 + 4 palettes
	ld c, $10
.loop
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	dec c
	jr nz, .loop
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Function108b78:
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, c
	and $2
	jr z, .Orange
	ld de, PALRGB_WHITE
	jr .load_pal

.Orange:
	ld de, palred 31 + palgreen 15 + palblue 1
.load_pal
	ld a, e
	ld [hli], a
	ld a, d
	ld [hld], a
	pop af
	ldh [rSVBK], a
	ld a, $1
	ldh [hCGBPalUpdate], a
	ret

Palette_108b98:
; removed

Function108b98:
	ld d, a
	ldh a, [rSVBK]
	push af
	ld a, $5
	ldh [rSVBK], a
	ld a, [wcf65]
	and $1
	xor d
	jr z, .asm_108bad
	ld hl, Palette_108b98 + 1 palettes
	jr .asm_108bb0

.asm_108bad
	ld hl, Palette_108b98
.asm_108bb0
	ld de, wBGPals1 + 7 palettes
	ld bc, 8 palettes
	call CopyBytes
	pop af
	ldh [rSVBK], a
	ret

MobileTradeAnim_DeleteSprites:
	farcall DeinitializeAllSprites
	call ClearSprites
	ret

Function108bc7:
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
	farcall DeinitializeSprite
	ret

Function108be0:
	ld hl, SPRITEANIMSTRUCT_YCOORD
	add hl, bc
	ld a, [hl]
	cp 9 * 8 + 2
	ret z
	add 1 * 8
	ld [hl], a
	ret

Function108bec:
	ld a, $90
	ldh [hWY], a
	ld hl, .MobilePlayerWillTradeMonText
	call PrintText
	ld c, 80
	call DelayFrames
	ld hl, .MobileForPartnersMonText
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.MobilePlayerWillTradeMonText:
	text_far _MobilePlayerWillTradeMonText
	text_end

.MobileForPartnersMonText:
	text_far _MobileForPartnersMonText
	text_end

.MobilePlayersMonTradeText:
	text_far _MobilePlayersMonTradeText
	text_end

Function108c16:
	ld a, $90
	ldh [hWY], a
	ld hl, .MobileTakeGoodCareOfMonText
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.MobileTakeGoodCareOfMonText:
	text_far _MobileTakeGoodCareOfMonText
	text_end

Function108c2b:
	ld a, $90
	ldh [hWY], a
	ld hl, .MobilePlayersMonTrade2Text
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.MobilePlayersMonTrade2Text:
	text_far _MobilePlayersMonTrade2Text
	text_end

Function108c40:
	ld a, $90
	ldh [hWY], a
	ld a, [wcf65]
	and %10000000
	jr z, .Getmon
	ld hl, .MobileTradeCameBackText
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.Getmon:
	ld hl, .MobileTakeGoodCareOfText
	call PrintText
	ld c, 80
	call DelayFrames
	ret

.MobileTakeGoodCareOfText:
	text_far _MobileTakeGoodCareOfText
	text_end

.MobileTradeCameBackText:
	text_far _MobileTradeCameBackText
	text_end

Function108c6d:
	ld hl, MobileTradeTilemapLZ
	debgcoord 0, 0
	call Decompress
	ld hl, MobileTradeTilemapLZ
	debgcoord 0, 0, vBGMap1
	call Decompress
	ret

Function108c80:
	ld a, $1
	ldh [rVBK], a
	ld hl, MobileTradeAttrmapLZ
	debgcoord 0, 0
	call Decompress
	ld hl, MobileTradeAttrmapLZ
	debgcoord 0, 0, vBGMap1
	call Decompress
	ld a, $0
	ldh [rVBK], a
	ret

DebugMobileTrade:
; localization error: NAME_LENGTH (11) should be NAME_LENGTH_JAPANESE (6) here

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

.DebugTradeData:
	db VENUSAUR
	db "ゲーフり@@"
	dw $0123
	db "かびーん@@"
	db CHARIZARD
	db "クりーチャ@"
	dw $0456
	db "マツミヤ@@"

LoadMobileAdapterPalette:
	ld a, [wc74e]
	and $7f
	cp $8 ; CONST: Amount of mobile adapters
	jr c, .asm_108d12
	ld a, $7

.asm_108d12
	ld bc, 1 palettes
	ld hl, MobileAdapterPalettes
	call AddNTimes
	ld a, BANK(wBGPals1)
	ld de, wBGPals1 + 4 palettes
	ld bc, 1 palettes
	call FarCopyWRAM
	ret

MobileTradeSpritesGFX:
INCBIN "gfx/mobile/mobile_trade_sprites.2bpp.lz"

MobileTradeGFX:
INCBIN "gfx/mobile/mobile_trade.2bpp.lz"

MobileTradeTilemapLZ:
INCBIN "gfx/mobile/mobile_trade.tilemap.lz"

MobileTradeAttrmapLZ:
INCBIN "gfx/mobile/mobile_trade.attrmap.lz"

UnusedMobilePulsePalettes:
INCLUDE "gfx/mobile/unused_mobile_pulses.pal"

MobileTradeBGPalettes:
INCLUDE "gfx/mobile/mobile_trade_bg.pal"

MobileTradeOB1Palettes:
INCLUDE "gfx/mobile/mobile_trade_ob1.pal"

MobileTradeOB2Palettes:
INCLUDE "gfx/mobile/mobile_trade_ob2.pal"

MobileCable1GFX:
INCBIN "gfx/mobile/mobile_cable_1.2bpp"

MobileCable2GFX:
INCBIN "gfx/mobile/mobile_cable_2.2bpp"

MobileAdapterPalettes:
INCLUDE "gfx/mobile/mobile_adapters.pal"
