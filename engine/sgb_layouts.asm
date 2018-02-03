LoadSGBLayout: ; 864c
	call CheckCGB
	jp nz, LoadSGBLayoutCGB

	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [wSGBPredef]
.not_ram
	cp SCGB_PARTY_MENU_HP_PALS
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
; 866f

.Jumptable: ; 866f
	dw .SGB_BattleGrayscale
	dw .SGB_BattleColors
	dw .SGB_PokegearPals
	dw .SGB_StatsScreenHPPals
	dw .SGB_Pokedex
	dw .SGB_SlotMachine
	dw .SGB06
	dw .SGB_GSIntro
	dw .SGB_Diploma
	dw .SGB_MapPals
	dw .SGB_PartyMenu
	dw .SGB_Evolution
	dw .SGB_GSTitleScreen
	dw .SGB0d
	dw .SGB_MoveList
	dw .SGB0f
	dw .SGB_PokedexSearchOption
	dw .SGB11
	dw .SGB12
	dw .SGB13
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
; 86ad

.SGB_BattleGrayscale: ; 86ad
	ld hl, PalPacket_BattleGrayscale
	ld de, BlkPacket_Battle
	ret
; 86b4

.SGB_BattleColors: ; 86b4
	ld hl, BlkPacket_Battle
	call PushSGBPals_

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
	ld [wSGBPredef], a
	ret
; 873c

.SGB_MoveList: ; 873c
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
; 875c

.SGB_PokegearPals: ; 875c
	ld hl, PalPacket_Pokegear
	ld de, BlkPacket_9a86
	ret
; 8763

.SGB_StatsScreenHPPals: ; 8763
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
; 87ab

.SGB_PartyMenu: ; 87ab
	ld hl, PalPacket_PartyMenu
	ld de, wSGBPals + 1
	ret
; 87b2

.SGB_Pokedex: ; 87b2
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
	call GetMonPalettePointer_
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
; 87e9

.SGB_BillsPC: ; 87e9
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
; 8823

.SGB_PokedexUnownMode: ; 8823
	call .SGB_Pokedex
	ld de, BlkPacket_PokedexUnownMode
	ret
; 882a

.SGB_PokedexSearchOption: ; 882a
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
; 884b

.SGB_PackPals: ; 884b
	ld hl, PalPacket_Pack
	ld de, BlkPacket_9a86
	ret
; 8852

.SGB_SlotMachine: ; 8852
	ld hl, PalPacket_SlotMachine
	ld de, BlkPacket_SlotMachine
	ret
; 8859

.SGB06: ; 8859
	ld hl, PalPacket_SCGB_06
	ld de, BlkPacket_SCGB_06
	ret
; 8860

.SGB_Diploma:
.SGB_MysteryGift: ; 8860
	ld hl, PalPacket_Diploma
	ld de, BlkPacket_9a86
	ret
; 8867

.SGB_GSIntro: ; 8867
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
; 8878

.BlkPacketTable_GSIntro: ; 8878
	dw BlkPacket_9a86, PalPacket_GSIntroShellderLapras
	dw BlkPacket_GSIntroJigglypuffPikachu, PalPacket_GSIntroJigglypuffPikachu
	dw BlkPacket_9a86, PalPacket_GSIntroStartersTransition
; 8884

.SGB_GSTitleScreen: ; 8884
	ld hl, PalPacket_GSTitleScreen
	ld de, BlkPacket_GSTitleScreen
	ld a, SCGB_DIPLOMA
	ld [wSGBPredef], a
	ret
; 8890

.SGB13: ; 8890
	ld hl, PalPacket_SCGB_13
	ld de, BlkPacket_SCGB_13
	ret
; 8897

.SGB0f: ; 8897
	ld hl, PalPacket_SCGB_0F
	ld de, BlkPacket_9a86
	ret
; 889e

.SGB11: ; 889e
	ld hl, BlkPacket_9a86
	ld de, wPlayerLightScreenCount ; ???
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	ld hl, PalPacket_SCGB_11
	ld de, BlkPacket_9a86
	ret
; 88b1

.SGB_MapPals: ; 88b1
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, PALPACKET_LENGTH
	call CopyBytes
	call .GetMapPalsIndex
	ld hl, wSGBPals + 1
	ld [hld], a
	ld de, BlkPacket_9a86
	ld a, SCGB_MAPPALS
	ld [wSGBPredef], a
	ret
; 88cd

.SGB_Evolution: ; 88cd
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
; 891a

.SGB0d:
.SGB_TrainerCard: ; 891a
	ld hl, PalPacket_Diploma
	ld de, BlkPacket_9a86
	ret
; 8921

.SGB_UnownPuzzle: ; 8921
	ld hl, PalPacket_UnownPuzzle
	ld de, BlkPacket_9a86
	ret
; 8928

.SGB12: ; 8928
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
; 8969

.SGB1e: ; 8969
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
; 89a6

.SGB_GamefreakLogo: ; 89a6
	ld hl, PalPacket_GamefreakLogo
	ld de, BlkPacket_9a86
	ret
; 89ad

.SGB_PlayerOrMonFrontpicPals: ; 89ad
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
; 89d9

.SGB_TradeTube: ; 89d9
	ld hl, PalPacket_TradeTube
	ld de, BlkPacket_9a86
	ret
; 89e0

.SGB_TrainerOrMonFrontpicPals: ; 89e0
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
; 8a0c

.GetMapPalsIndex: ; 8a0c
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
	jr z, .perm5
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
	ld a, PREDEFPAL_00
	ret

.cave
	ld a, PREDEFPAL_DUNGEONS
	ret

.perm5
	ld a, PREDEFPAL_VERMILION
	ret

.gate
	ld a, PREDEFPAL_PEWTER
	ret
; 8a45

INCLUDE "data/maps/sgb_roof_pal_inds.asm"

_LoadSGBLayout_ReturnFromJumpTable: ; 8a60
	push de
	call PushSGBPals_
	pop hl
	jp PushSGBPals_
; 8a68
