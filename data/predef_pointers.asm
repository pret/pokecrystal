; Predef routines can be used with the "predef" and "predef_jump" macros.
; This preserves registers bc, de, hl and f.

add_predef: MACRO
\1Predef::
	dab \1
ENDM

PredefPointers:: ; 856b
	add_predef Predef_LearnMove ; $0
	add_predef DummyPredef1
	add_predef HealParty ; this is both a special and a predef
	add_predef Predef_SmallFarFlagAction
	add_predef Predef_ComputeHPBarPixels
	add_predef Predef_FillPP
	add_predef Predef_TryAddMonToParty
	add_predef Predef_AddTempmonToParty
	add_predef Predef_SendGetPkmnIntoFromBox
	add_predef Predef_SendPkmnIntoBox
	add_predef Predef_GiveEgg
	add_predef Predef_AnimateHPBar
	add_predef Predef_CalcPkmnStats
	add_predef Predef_CalcPkmnStatC
	add_predef Predef_CanLearnTMHMMove
	add_predef Predef_GetTMHMMove
	add_predef Predef_LinkTextbox ; $ 10
	add_predef Predef_PrintMoveDesc
	add_predef Predef_UpdatePlayerHUD
	add_predef Predef_PlaceGraphic
	add_predef Predef_CheckPlayerPartyForFitPkmn
	add_predef Predef_UpdateEnemyHUD
	add_predef Predef_StartBattle
	add_predef Predef_FillInExpBar
	add_predef Predef_GetBattleMonBackpic ; $18
	add_predef Predef_GetEnemyMonFrontpic
	add_predef Predef_LearnLevelMoves
	add_predef Predef_FillMoves
	add_predef Predef_EvolveAfterBattle
	add_predef Predef_TradeAnimationPlayer2
	add_predef Predef_TradeAnimation
	add_predef Predef_CopyPkmnToTempMon
	add_predef Predef_ListMoves ; $20
	add_predef Predef_PlaceNonFaintStatus
	add_predef UnusedPredef22
	add_predef Predef_ListMovePP
	add_predef Predef_GetGender
	add_predef Predef_StatsScreenInit
	add_predef Predef_DrawPlayerHP
	add_predef Predef_DrawEnemyHP
	add_predef Predef_PrintTempMonStats ; $28
	add_predef Predef_GetTypeName
	add_predef Predef_PrintMoveType
	add_predef Predef_PrintType
	add_predef Predef_PrintMonTypes
	add_predef Predef_GetUnownLetter
	add_predef Predef_LoadPoisonBGPals
	add_predef DummyPredef2F
	add_predef Predef_InitSGBBorder ; $30
	add_predef Predef_LoadSGBLayout
	add_predef Predef_Pokedex_GetArea
	add_predef UnusedPredef_CheckContestMon
	add_predef Predef_DoBattleTransition
	add_predef DummyPredef35
	add_predef DummyPredef36
	add_predef Predef_PlayBattleAnim
	add_predef DummyPredef38 ; $38
	add_predef DummyPredef39
	add_predef DummyPredef3A
	add_predef Predef_PartyMonItemName
	add_predef Predef_GetMonFrontpic
	add_predef Predef_GetMonBackpic
	add_predef Predef_GetAnimatedFrontpic
	add_predef Predef_GetTrainerPic
	add_predef Predef_Decompress ; $40
	add_predef Predef_CheckTypeMatchup
	add_predef Predef_ConvertMon_1to2
	add_predef Predef_NewPokedexEntry
	add_predef UnusedPredef_AnimateMon_Slow_Normal
	add_predef Predef_PlaceStatusString
	add_predef Predef_LoadMonAnimation
	add_predef Predef_AnimateFrontpic
	add_predef UnusedPredef48 ; $48
	add_predef Predef_HOF_AnimateFrontpic
	dbw -1, InexplicablyEmptyFunction ; ???
; 864c
