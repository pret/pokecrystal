GetTrademonFrontpic: ; 4d7fd
	ld a, [wOTTrademonSpecies]
	ld hl, wOTTrademonDVs
	ld de, vTiles2
	push de
	push af
	predef Predef_GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef Predef_GetAnimatedFrontpic
	ret

AnimateTrademonFrontpic: ; 4d81e
	ld a, [wOTTrademonSpecies]
	call IsAPokemon
	ret c
	farcall ShowOTTrademonStats
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
	farcall TradeAnim_ShowGetmonFrontpic
	ld a, [wOTTrademonSpecies]
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef Predef_AnimateFrontpic
	ret
