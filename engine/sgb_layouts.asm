Predef_LoadSGBLayout: ; 864c
; LoadSGBLayout
	call CheckCGB
	jp nz, Predef_LoadSGBLayoutCGB

	ld a, b
	cp SCGB_RAM
	jr nz, .not_ram
	ld a, [SGBPredef]
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
	dw .SGB07
	dw .SGB_Diploma
	dw .SGB_MapPals
	dw .SGB_PartyMenu
	dw .SGB_Evolution
	dw .SGB0c
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
	dw .SGB19
	dw .SGB_PlayerOrMonFrontpicPals
	dw .SGB_TradeTube
	dw .SGB_TrainerOrMonFrontpicPals
	dw .SGB_MysteryGift
	dw .SGB1e
; 86ad

.SGB_BattleGrayscale: ; 86ad
	ld hl, PalPacket_9c66
	ld de, BlkPacket_9aa6
	ret
; 86b4

.SGB_BattleColors: ; 86b4
	ld hl, BlkPacket_9aa6
	call PushSGBPals_

	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes

	ld a, [PlayerHPPal]
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

	ld a, [EnemyHPPal]
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
	ld de, wSGBPals + $10
	ld bc, $10
	call CopyBytes

	call GetBattlemonBackpicPalettePointer

	ld a, [hli]
	ld [wSGBPals + $13], a
	ld a, [hli]
	ld [wSGBPals + $14], a
	ld a, [hli]
	ld [wSGBPals + $15], a
	ld a, [hl]
	ld [wSGBPals + $16], a
	call GetEnemyFrontpicPalettePointer
	ld a, [hli]
	ld [wSGBPals + $19], a
	ld a, [hli]
	ld [wSGBPals + $1a], a
	ld a, [hli]
	ld [wSGBPals + $1b], a
	ld a, [hl]
	ld [wSGBPals + $1c], a

	ld hl, wSGBPals
	ld de, wSGBPals + $10
	ld a, SCGB_BATTLE_COLORS
	ld [SGBPredef], a
	ret
; 873c

.SGB_MoveList: ; 873c
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes

	ld hl, wSGBPals + 1
	ld [hl], $10
	inc hl
	inc hl

	ld a, [PlayerHPPal]
	add $2f
	ld [hl], a
	ld hl, wSGBPals
	ld de, BlkPacket_9ad6
	ret
; 875c

.SGB_PokegearPals: ; 875c
	ld hl, PalPacket_9c76
	ld de, BlkPacket_9a86
	ret
; 8763

.SGB_StatsScreenHPPals: ; 8763
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
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
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
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
	ld de, BlkPacket_9ac6
	ret
; 87ab

.SGB_PartyMenu: ; 87ab
	ld hl, PalPacket_9c56
	ld de, wSGBPals + 1
	ret
; 87b2

.SGB_Pokedex: ; 87b2
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [CurPartySpecies]
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
	ld de, BlkPacket_9ae6
	ret
; 87e9

.SGB_BillsPC: ; 87e9
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
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
	ld de, BlkPacket_9ae6
	ret
; 8823

.SGB_PokedexUnownMode: ; 8823
	call .SGB_Pokedex
	ld de, BlkPacket_9af6
	ret
; 882a

.SGB_PokedexSearchOption: ; 882a
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld hl, wSGBPals + 3
	ld [hl], $9f
	inc hl
	ld [hl], $2a
	inc hl
	ld [hl], $5a
	inc hl
	ld [hl], $19
	ld hl, wSGBPals
	ld de, BlkPacket_9a86
	ret
; 884b

.SGB_PackPals: ; 884b
	ld hl, PalPacket_9c36
	ld de, BlkPacket_9a86
	ret
; 8852

.SGB_SlotMachine: ; 8852
	ld hl, PalPacket_9c96
	ld de, BlkPacket_9b06
	ret
; 8859

.SGB06: ; 8859
	ld hl, PalPacket_9ca6
	ld de, BlkPacket_9b76
	ret
; 8860

.SGB_Diploma:
.SGB_MysteryGift: ; 8860
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8867

.SGB07: ; 8867
	ld b, 0
	ld hl, .BlkPacketTable_SGB07
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

.BlkPacketTable_SGB07: ; 8878
	dw BlkPacket_9a86, PalPacket_9be6
	dw BlkPacket_9a96, PalPacket_9c06
	dw BlkPacket_9a86, PalPacket_9c16
; 8884

.SGB0c: ; 8884
	ld hl, PalPacket_9b96
	ld de, BlkPacket_9b56
	ld a, SCGB_DIPLOMA
	ld [SGBPredef], a
	ret
; 8890

.SGB13: ; 8890
	ld hl, PalPacket_9ba6
	ld de, BlkPacket_9b86
	ret
; 8897

.SGB0f: ; 8897
	ld hl, PalPacket_9c46
	ld de, BlkPacket_9a86
	ret
; 889e

.SGB11: ; 889e
	ld hl, BlkPacket_9a86
	ld de, PlayerLightScreenCount
	ld bc, $10
	call CopyBytes
	ld hl, PalPacket_9bb6
	ld de, BlkPacket_9a86
	ret
; 88b1

.SGB_MapPals: ; 88b1
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	call .GetMapPalsIndex
	ld hl, wSGBPals + 1
	ld [hld], a
	ld de, BlkPacket_9a86
	ld a, SCGB_MAPPALS
	ld [SGBPredef], a
	ret
; 88cd

.SGB_Evolution: ; 88cd
	push bc
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
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
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld c, l
	ld b, h
	ld a, [PlayerHPPal]
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
	ld hl, PalPacket_9cb6
	ld de, BlkPacket_9a86
	ret
; 8921

.SGB_UnownPuzzle: ; 8921
	ld hl, PalPacket_9bc6
	ld de, BlkPacket_9a86
	ret
; 8928

.SGB12: ; 8928
	ld hl, PalPacket_9bd6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld hl, BlkPacket_9a86
	ld de, wSGBPals + $10
	ld bc, $10
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
	ld de, wSGBPals + $10
	ret
; 8969

.SGB1e: ; 8969
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld a, [CurPartySpecies]
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

.SGB19: ; 89a6
	ld hl, PalPacket_9cd6
	ld de, BlkPacket_9a86
	ret
; 89ad

.SGB_PlayerOrMonFrontpicPals: ; 89ad
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
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
	ld hl, PalPacket_9cc6
	ld de, BlkPacket_9a86
	ret
; 89e0

.SGB_TrainerOrMonFrontpicPals: ; 89e0
	ld hl, PalPacket_9ce6
	ld de, wSGBPals
	ld bc, $10
	call CopyBytes
	ld a, [CurPartySpecies]
	ld bc, TempMonDVs
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
	ld a, [TimeOfDayPal]
	cp NITE_F
	jr c, .morn_day
	ld a, $19
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
	ld a, [MapGroup]
	ld e, a
	ld d, 0
	ld hl, MapGroupRoofSGBPalInds
	add hl, de
	ld a, [hl]
	ret

.route
	ld a, $00
	ret

.cave
	ld a, $18
	ret

.perm5
	ld a, $06
	ret

.gate
	ld a, $03
	ret
; 8a45

INCLUDE "gfx/sgb/roof_pal_inds.asm"

_LoadSGBLayout_ReturnFromJumpTable: ; 8a60
	push de
	call PushSGBPals_
	pop hl
	jp PushSGBPals_
; 8a68
