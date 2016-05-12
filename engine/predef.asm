GetPredefPointer:: ; 854b
; Return the bank and address of PredefID in a and PredefAddress.

; Save hl for later (back in Predef)
	ld a, h
	ld [PredefTemp], a
	ld a, l
	ld [PredefTemp + 1], a

	push de
	ld a, [PredefID]
	ld e, a
	ld d, 0
	ld hl, PredefPointers
	add hl, de
	add hl, de
	add hl, de
	pop de

	ld a, [hli]
	ld [PredefAddress + 1], a
	ld a, [hli]
	ld [PredefAddress], a
	ld a, [hl]

	ret
; 856b

PredefPointers:: ; 856b
; $4b Predef pointers
; address, bank

	add_predef LearnMove ; $0
	add_predef Predef1
	add_predef HealParty
	add_predef FlagPredef
	add_predef ComputeHPBarPixels
	add_predef FillPP
	add_predef TryAddMonToParty
	add_predef AddTempmonToParty
	add_predef SentGetPkmnIntoFromBox
	add_predef SentPkmnIntoBox
	add_predef GiveEgg
	add_predef AnimateHPBar
	add_predef CalcPkmnStats
	add_predef CalcPkmnStatC
	add_predef CanLearnTMHMMove
	add_predef GetTMHMMove
	add_predef Predef_LinkTextbox ; $ 10
	add_predef PrintMoveDesc
	add_predef UpdatePlayerHUD
	add_predef PlaceGraphic
	add_predef CheckPlayerPartyForFitPkmn
	add_predef UpdateEnemyHUD
	add_predef StartBattle
	add_predef FillInExpBar
	add_predef GetMonBackpic ; $18
	add_predef GetMonFrontpic
	add_predef LearnLevelMoves
	add_predef FillMoves
	add_predef EvolveAfterBattle
	add_predef TradeAnimationPlayer2
	add_predef TradeAnimation
	add_predef CopyPkmnToTempMon
	add_predef ListMoves ; $20
	add_predef PlaceNonFaintStatus
	add_predef Predef22
	add_predef ListMovePP
	add_predef GetGender
	add_predef StatsScreenInit
	add_predef DrawPlayerHP
	add_predef DrawEnemyHP
	add_predef PrintTempMonStats ; $28
	add_predef GetTypeName
	add_predef PrintMoveType
	add_predef PrintType
	add_predef PrintMonTypes
	add_predef GetUnownLetter
	add_predef LoadPoisonBGPals
	add_predef Predef2F
	add_predef InitSGBBorder ; $30
	add_predef Predef_LoadSGBLayout
	add_predef _Area
	add_predef CheckContestMon
	add_predef Predef_StartBattle
	add_predef Predef35
	add_predef Predef36
	add_predef PlayBattleAnim
	add_predef Predef38 ; $38
	add_predef Predef39
	add_predef Predef3A
	add_predef PartyMonItemName
	add_predef GetFrontpic
	add_predef GetBackpic
	add_predef FrontpicPredef
	add_predef GetTrainerPic
	add_predef DecompressPredef ; $40
	add_predef CheckTypeMatchup
	add_predef ConvertMon_1to2
	add_predef NewPokedexEntry
	add_predef AnimateMon_Slow_Normal
	add_predef PlaceStatusString
	add_predef LoadMonAnimation
	add_predef AnimateFrontpic
	add_predef Predef48 ; $48
	add_predef HOF_AnimateFrontpic
	dbw $ff, InexplicablyEmptyFunction ; ???
; 864c
