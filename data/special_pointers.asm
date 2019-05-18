; Special routines can be used with the "special" map script command.
; They often use wScriptVar for arguments and return values.

add_special: MACRO
\1Special::
	dba \1
ENDM

SpecialsPointers::
	add_special WarpToSpawnPoint ; $0

; Communications
	add_special SetBitsForLinkTradeRequest
	add_special WaitForLinkedFriend
	add_special CheckLinkTimeout
	add_special TryQuickSave
	add_special CheckBothSelectedSameRoom
	add_special FailedLinkToPast
	add_special CloseLink
	add_special WaitForOtherPlayerToExit ; $8
	add_special SetBitsForBattleRequest
	add_special SetBitsForTimeCapsuleRequest
	add_special CheckTimeCapsuleCompatibility
	add_special EnterTimeCapsule
	add_special TradeCenter
	add_special Colosseum
	add_special TimeCapsule
	add_special CableClubCheckWhichChris ; $10
	add_special CheckMysteryGift
	add_special GetMysteryGiftItem
	add_special UnlockMysteryGift

; Map events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special GiveParkBalls ; $18
	add_special CheckMagikarpLength
	add_special MagikarpHouseSign
	add_special HealParty ; this is both a special and a predef
	add_special PokemonCenterPC
	add_special PlayersHousePC
	add_special DayCareMan
	add_special DayCareLady
	add_special DayCareManOutside ; $20
	add_special MoveDeletion
	add_special BankOfMom
	add_special MagnetTrain
	add_special NameRival
	add_special SetDayOfWeek
	add_special OverworldTownMap
	add_special UnownPrinter
	add_special MapRadio ; $28
	add_special UnownPuzzle
	add_special SlotMachine
	add_special CardFlip
	add_special DummyNonfunctionalGameCornerGame
	add_special ClearBGPalettesBufferScreen
	add_special FadeOutPalettes
	add_special BattleTowerFade
	add_special FadeBlackQuickly ; $30
	add_special FadeInPalettes
	add_special FadeInQuickly
	add_special ReloadSpritesNoPalettes ; bank 0
	add_special ClearBGPalettes ; bank 0
	add_special UpdateTimePals ; bank 0
	add_special ClearTileMap ; bank 0
	add_special UpdateSprites ; bank 0
	add_special ReplaceKrisSprite ; $38 ; bank 0
	add_special GameCornerPrizeMonCheckDex
	add_special UnusedSetSeenMon
	add_special WaitSFX ; bank 0
	add_special PlayMapMusic ; bank 0
	add_special RestartMapMusic ; bank 0
	add_special HealMachineAnim
	add_special SurfStartStep
	add_special FindPartyMonAboveLevel ; $40
	add_special FindPartyMonAtLeastThatHappy
	add_special FindPartyMonThatSpecies
	add_special FindPartyMonThatSpeciesYourTrainerID
	add_special UnusedCheckUnusedTwoDayTimer
	add_special DayCareMon1
	add_special DayCareMon2
	add_special SelectRandomBugContestContestants
	add_special ActivateFishingSwarm ; $48
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special GiveShuckle
	add_special ReturnShuckle
	add_special BillsGrandfather
	add_special CheckPokerus
	add_special DisplayCoinCaseBalance
	add_special DisplayMoneyAndCoinBalance ; $50
	add_special PlaceMoneyTopRight
	add_special CheckForLuckyNumberWinners
	add_special CheckLuckyNumberShowFlag
	add_special ResetLuckyNumberShowFlag
	add_special PrintTodaysLuckyNumber
	add_special SelectApricornForKurt
	add_special NameRater
	add_special DisplayLinkRecord ; $58
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special RandomUnseenWildMon
	add_special RandomPhoneWildMon
	add_special RandomPhoneMon
	add_special LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SnorlaxAwake ; $60
	add_special OlderHaircutBrother
	add_special YoungerHaircutBrother
	add_special DaisysGrooming
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special GameboyCheck
	add_special TrainerHouse
	add_special PhotoStudio ; $68
	add_special InitRoamMons
	add_special FadeOutMusic
	add_special Diploma
	add_special PrintDiploma

; Crystal only
	add_special Function11ac3e
	add_special Function11b444
	add_special Function11b5e8
	add_special Function11b7e5 ; $70
	add_special Function11b879
	add_special Function11b920
	add_special Function11b93b
	add_special BattleTowerRoomMenu
	add_special Function1700ba
	add_special Function170114
	add_special BattleTowerBattle
	add_special Function1704e1 ; $78
	add_special DummySpecial_17021d
	add_special LoadOpponentTrainerAndPokemonWithOTSprite
	add_special Function11ba38
	add_special CheckForBattleTowerRules
	add_special GiveOddEgg
	add_special Reset ; bank 0
	add_special Function1011f1
	add_special Function101220 ; $80
	add_special Function101225
	add_special Function101231
	add_special MoveTutor
	add_special OmanyteChamber
	add_special Function11c1ab
	add_special BattleTowerAction
	add_special DisplayUnownWords
	add_special Menu_ChallengeExplanationCancel ; $88
	add_special Function17d2b6
	add_special Function17d2ce
	add_special BattleTowerMobileError
	add_special AskMobileOrCable
	add_special HoOhChamber
	add_special Function102142
	add_special CelebiShrineEvent
	add_special CheckCaughtCelebi ; $90
	add_special PokeSeer
	add_special BuenasPassword
	add_special BuenaPrize
	add_special GiveDratini
	add_special SampleKenjiBreakCountdown
	add_special BeastsCheck
	add_special MonCheck
	add_special SetPlayerPalette ; $98
	add_special DummySpecial_170bd2
	add_special Mobile_SelectThreeMons
	add_special Function1037eb
	add_special Function10383c
	add_special StubbedTrainerRankings_Healings
	add_special RefreshSprites
	add_special Function1037c2
	add_special Mobile_DummyReturnFalse ; $a0
	add_special Function103780
	add_special Function10387b
	add_special AskRememberPassword
	add_special LoadMapPalettes
	add_special UnusedFindItemInPCOrBag
	add_special InitialSetDSTFlag
	add_special InitialClearDSTFlag
	add_special DummySpecial_c224 ; $a8
