LoadSGBLayout:
	call CheckCGB
	jp nz, LoadSGBLayoutCGB

	ld a, b
	cp SCGB_DEFAULT
	jr nz, .not_default
	ld a, [wDefaultSGBLayout]
.not_default
	cp SCGB_PARTY_MENU_HP_BARS
	jp z, SGB_ApplyPartyMenuHPPals
	ld l, a
	ld h, 0
	add hl, hl
	ld de, .Jumptable
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, _LoadSGBLayout_ReturnFromJumpTable
	push de
	jp hl

.Jumptable:
	dw .SGB_BattleGrayscale
	dw .SGB_BattleColors
	dw .SGB_PokegearPals
	dw .SGB_StatsScreenHPPals
	dw .SGB_Pokedex
	dw .SGB_SlotMachine
	dw .SGB_BetaTitleScreen
	dw .SGB_GSIntro
	dw .SGB_Diploma
	dw .SGB_MapPals
	dw .SGB_PartyMenu
	dw .SGB_Evolution
	dw .SGB_GSTitleScreen
	dw .SGB0d
	dw .SGB_MoveList
	dw .SGB_BetaPikachuMinigame
	dw .SGB_PokedexSearchOption
	dw .SGB_BetaPoker
	dw .SGB_Pokepic
	dw .SGB_MagnetTrain
	dw .SGB_PackPals
	dw .SGB_TrainerCard
	dw .SGB_PokedexUnownMode
	dw .SGB_BillsPC
	dw .SGB_UnownPuzzle
	dw .SGB_GamefreakLogo
	dw .SGB_PlayerOrMonFrontpicPals
	dw .SGB_TradeTube
	dw .SGB_TrainerOrMonFrontpicPals
	dw .SGB_MysteryGift
	dw .SGB1e

.SGB_BattleGrayscale:
	ld hl, PalPacket_BattleGrayscale
	ld de, BlkPacket_Battle
	ret

.SGB_BattleColors:
	ld hl, BlkPacket_Battle
	call PushSGBPals

	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes

	ld a, [wPlayerHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, HPBarPals
	add hl, de

	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a

	ld a, [wEnemyHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl

	ld de, HPBarPals
	add hl, de
	ld a, [hli]
	ld [wSGBPals + 9], a
	ld a, [hli]
	ld [wSGBPals + 10], a
	ld a, [hli]
	ld [wSGBPals + 11], a
	ld a, [hl]
	ld [wSGBPals + 12], a

	ld hl, PalPacket_9cf6
	ld de, wSGBPals + PALPACKET_LENGTH
	ld bc, PALPACKET_LENGTH
	call CopyBytes

	call GetBattlemonBackpicPalettePointer

	ld a, [hli]
	ld [wSGBPals + 19], a
	ld a, [hli]
	ld [wSGBPals + 20], a
	ld a, [hli]
	ld [wSGBPals + 21], a
	ld a, [hl]
	ld [wSGBPals + 22], a
	call GetEnemyFrontpicPalettePointer
	ld a, [hli]
	ld [wSGBPals + 25], a
	ld a, [hli]
	ld [wSGBPals + 26], a
	ld a, [hli]
	ld [wSGBPals + 27], a
	ld a, [hl]
	ld [wSGBPals + 28], a

	ld hl, wSGBPals
	ld de, wSGBPals + PALPACKET_LENGTH
	ld a, SCGB_BATTLE_COLORS
	ld [wDefaultSGBLayout], a
	ret

.SGB_MoveList:
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes

	ld hl, wSGBPals + 1
	ld [hl], $10
	inc hl
	inc hl

	ld a, [wPlayerHPPal]
	add PREDEFPAL_HP_GREEN
	ld [hl], a
	ld hl, wSGBPals
	ld de, BlkPacket_MoveList
	ret

.SGB_PokegearPals:
	ld hl, PalPacket_Pokegear
	ld de, BlkPacket_9a86
	ret

.SGB_StatsScreenHPPals:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld a, [wCurHPPal]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, HPBarPals
	add hl, de
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 9], a
	ld a, [hli]
	ld [wSGBPals + 10], a
	ld a, [hli]
	ld [wSGBPals + 11], a
	ld a, [hl]
	ld [wSGBPals + 12], a
	ld hl, wSGBPals
	ld de, BlkPacket_StatsScreen
	ret

.SGB_PartyMenu:
	ld hl, PalPacket_PartyMenu
	ld de, wSGBPals + 1
	ret

.SGB_Pokedex:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], LOW(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], HIGH(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], LOW(palred 26 + palgreen 10 + palblue 6)
	inc hl
	ld [hl], HIGH(palred 26 + palgreen 10 + palblue 6)
	ld a, [wCurPartySpecies]
	call GetMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 9], a
	ld a, [hli]
	ld [wSGBPals + 10], a
	ld a, [hli]
	ld [wSGBPals + 11], a
	ld a, [hl]
	ld [wSGBPals + 12], a
	ld hl, wSGBPals
	ld de, BlkPacket_Pokedex_PC
	ret

.SGB_BillsPC:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], LOW(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], HIGH(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], LOW(palred 26 + palgreen 10 + palblue 6)
	inc hl
	ld [hl], HIGH(palred 26 + palgreen 10 + palblue 6)
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 9], a
	ld a, [hli]
	ld [wSGBPals + 10], a
	ld a, [hli]
	ld [wSGBPals + 11], a
	ld a, [hl]
	ld [wSGBPals + 12], a
	ld hl, wSGBPals
	ld de, BlkPacket_Pokedex_PC
	ret

.SGB_PokedexUnownMode:
	call .SGB_Pokedex
	ld de, BlkPacket_PokedexUnownMode
	ret

.SGB_PokedexSearchOption:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], LOW(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], HIGH(palred 31 + palgreen 20 + palblue 10)
	inc hl
	ld [hl], LOW(palred 26 + palgreen 10 + palblue 6)
	inc hl
	ld [hl], HIGH(palred 26 + palgreen 10 + palblue 6)
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret

.SGB_PackPals:
	ld hl, PalPacket_Pack
	ld de, BlkPacket_9a86
	ret

.SGB_SlotMachine:
	ld hl, PalPacket_SlotMachine
	ld de, BlkPacket_SlotMachine
	ret

.SGB_BetaTitleScreen:
	ld hl, PalPacket_BetaTitleScreen
	ld de, BlkPacket_BetaTitleScreen
	ret

.SGB_Diploma:
.SGB_MysteryGift:
	ld hl, PalPacket_Diploma
	ld de, BlkPacket_9a86
	ret

.SGB_GSIntro:
	ld b, 0
	ld hl, .BlkPacketTable_GSIntro
rept 4
	add hl, bc
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

.BlkPacketTable_GSIntro:
	dw BlkPacket_9a86, PalPacket_GSIntroShellderLapras
	dw BlkPacket_GSIntroJigglypuffPikachu, PalPacket_GSIntroJigglypuffPikachu
	dw BlkPacket_9a86, PalPacket_GSIntroStartersTransition

.SGB_GSTitleScreen:
	ld hl, PalPacket_GSTitleScreen
	ld de, BlkPacket_GSTitleScreen
	ld a, SCGB_DIPLOMA
	ld [wDefaultSGBLayout], a
	ret

.SGB_MagnetTrain:
	ld hl, PalPacket_MagnetTrain
	ld de, BlkPacket_MagnetTrain
	ret

.SGB_BetaPikachuMinigame:
	ld hl, PalPacket_BetaPikachuMinigame
	ld de, BlkPacket_9a86
	ret

.SGB_BetaPoker:
	ld hl, BlkPacket_9a86
	ld de, wBetaPokerSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, PalPacket_BetaPoker
	ld de, BlkPacket_9a86
	ret

.SGB_MapPals:
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	call .GetMapPalsIndex
	ld hl, wSGBPals + 1
	ld [hld], a
	ld de, BlkPacket_9a86
	ld a, SCGB_MAPPALS
	ld [wDefaultSGBLayout], a
	ret

.SGB_Evolution:
	push bc
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	pop bc
	ld a, c
	and a
	jr z, .partymon
	; Egg
	ld hl, wSGBPals + 3
	ld [hl], LOW(palred 7 + palgreen 7 + palblue 7)
	inc hl
	ld [hl], HIGH(palred 7 + palgreen 7 + palblue 7)
	inc hl
	ld [hl], LOW(palred 2 + palgreen 3 + palblue 3)
	inc hl
	ld [hl], HIGH(palred 2 + palgreen 3 + palblue 3)
	jr .done

.partymon
	ld hl, wPartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wCurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [wPlayerHPPal]
	call GetPlayerOrMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a

.done
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret

.SGB0d:
.SGB_TrainerCard:
	ld hl, PalPacket_Diploma
	ld de, BlkPacket_9a86
	ret

.SGB_UnownPuzzle:
	ld hl, PalPacket_UnownPuzzle
	ld de, BlkPacket_9a86
	ret

.SGB_Pokepic:
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, BlkPacket_9a86
	ld de, wSGBPals + PALPACKET_LENGTH
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	call .GetMapPalsIndex
	ld hl, wSGBPals + 1
	ld [hl], a
	ld hl, wSGBPals + 3
	ld [hl], $2e
	ld hl, wSGBPals + $13
	ld a, 5
	ld [hli], a
	ld a, [wMenuBorderLeftCoord]
	ld [hli], a
	ld a, [wMenuBorderTopCoord]
	ld [hli], a
	ld a, [wMenuBorderRightCoord]
	ld [hli], a
	ld a, [wMenuBorderBottomCoord]
	ld [hl], a
	ld hl, wSGBPals
	ld de, wSGBPals + PALPACKET_LENGTH
	ret

.SGB1e:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld l, a
	ld h, 0
	add hl, hl
	add hl, hl
	add hl, hl
	ld de, PokemonPalettes
	add hl, de
	ld a, [wcf65]
	and 3
	sla a
	sla a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret

.SGB_GamefreakLogo:
	ld hl, PalPacket_GamefreakLogo
	ld de, BlkPacket_9a86
	ret

.SGB_PlayerOrMonFrontpicPals:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetPlayerOrMonPalettePointer
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret

.SGB_TradeTube:
	ld hl, PalPacket_TradeTube
	ld de, BlkPacket_9a86
	ret

.SGB_TrainerOrMonFrontpicPals:
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld a, [wCurPartySpecies]
	ld bc, wTempMonDVs
	call GetFrontpicPalettePointer
	ld a, [hli]
	ld [wSGBPals + 3], a
	ld a, [hli]
	ld [wSGBPals + 4], a
	ld a, [hli]
	ld [wSGBPals + 5], a
	ld a, [hl]
	ld [wSGBPals + 6], a
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret

.GetMapPalsIndex:
	ld a, [wTimeOfDayPal]
	cp NITE_F
	jr c, .morn_day
	ld a, PREDEFPAL_NITE
	ret

.morn_day
	ld a, [wEnvironment]
	cp ROUTE
	jr z, .route
	cp CAVE
	jr z, .cave
	cp DUNGEON
	jr z, .cave
	cp ENVIRONMENT_5
	jr z, .env5
	cp GATE
	jr z, .gate
	ld a, [wMapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofSGBPalInds
	add hl, de
	ld a, [hl]
	ret

.route
	ld a, PREDEFPAL_ROUTES
	ret

.cave
	ld a, PREDEFPAL_DUNGEONS
	ret

.env5
	ld a, PREDEFPAL_VERMILION
	ret

.gate
	ld a, PREDEFPAL_PEWTER
	ret

INCLUDE "data/maps/sgb_roof_pal_inds.asm"

_LoadSGBLayout_ReturnFromJumpTable:
	push de
	call PushSGBPals
	pop hl
	jp PushSGBPals
