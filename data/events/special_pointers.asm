; Special routines can be used with the "special" map script command.
; They often use wScriptVar for arguments and return values.

MACRO add_special
\1Special::
	dba \1
ENDM

SpecialsPointers::
	add_special WarpToSpawnPoint

; Communications
	add_special SetBitsForLinkTradeRequest
	add_special WaitForLinkedFriend
	add_special CheckLinkTimeout_Receptionist
	add_special TryQuickSave
	add_special CheckBothSelectedSameRoom
	add_special FailedLinkToPast
	add_special CloseLink
	add_special WaitForOtherPlayerToExit
	add_special SetBitsForBattleRequest
	add_special SetBitsForTimeCapsuleRequest
	add_special CheckTimeCapsuleCompatibility
	add_special EnterTimeCapsule
	add_special TradeCenter
	add_special Colosseum
	add_special TimeCapsule
	add_special CableClubCheckWhichChris
	add_special CheckMysteryGift
	add_special GetMysteryGiftItem
	add_special UnlockMysteryGift

; Map events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special GiveParkBalls
	add_special CheckMagikarpLength
	add_special MagikarpHouseSign
	add_special HealParty ; this is both a special and a predef
	add_special PokemonCenterPC
	add_special PlayersHousePC
	add_special DayCareMan
	add_special DayCareLady
	add_special DayCareManOutside
	add_special MoveDeletion
	add_special BankOfMom
	add_special MagnetTrain
	add_special NameRival
	add_special SetDayOfWeek
	add_special OverworldTownMap
	add_special UnownPrinter
	add_special MapRadio
	add_special UnownPuzzle
	add_special SlotMachine
	add_special CardFlip
	add_special UnusedMemoryGame ; unused
	add_special ClearBGPalettesBufferScreen ; unused
	add_special FadeOutPalettes
	add_special BattleTowerFade
	add_special FadeBlackQuickly
	add_special FadeInPalettes
	add_special FadeInQuickly
	add_special ReloadSpritesNoPalettes ; bank 0
	add_special ClearBGPalettes ; bank 0
	add_special UpdateTimePals ; bank 0
	add_special ClearTilemap ; bank 0; unused as special
	add_special UpdateSprites ; bank 0
	add_special UpdatePlayerSprite ; bank 0
	add_special GameCornerPrizeMonCheckDex
	add_special UnusedSetSeenMon ; unused
	add_special WaitSFX ; bank 0
	add_special PlayMapMusic ; bank 0
	add_special RestartMapMusic ; bank 0
	add_special HealMachineAnim
	add_special SurfStartStep
	add_special FindPartyMonAboveLevel ; unused
	add_special FindPartyMonAtLeastThatHappy ; unused
	add_special FindPartyMonThatSpecies
	add_special FindPartyMonThatSpeciesYourTrainerID
	add_special UnusedCheckUnusedTwoDayTimer ; unused
	add_special DayCareMon1
	add_special DayCareMon2
	add_special SelectRandomBugContestContestants
	add_special ActivateFishingSwarm
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special GiveShuckle
	add_special ReturnShuckie
	add_special BillsGrandfather
	add_special CheckPokerus
	add_special DisplayCoinCaseBalance
	add_special DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special CheckForLuckyNumberWinners
	add_special CheckLuckyNumberShowFlag
	add_special ResetLuckyNumberShowFlag
	add_special PrintTodaysLuckyNumber
	add_special SelectApricornForKurt
	add_special NameRater
	add_special DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special RandomUnseenWildMon
	add_special RandomPhoneWildMon
	add_special RandomPhoneMon
	add_special LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SnorlaxAwake
	add_special OlderHaircutBrother
	add_special YoungerHaircutBrother
	add_special DaisysGrooming
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special GameboyCheck
	add_special TrainerHouse
	add_special PhotoStudio
	add_special InitRoamMons
	add_special FadeOutMusic
	add_special Diploma
	add_special PrintDiploma

; Crystal only
	add_special Function11ac3e
	add_special TradeCornerHoldMon
	add_special Function11b5e8
	add_special Function11b7e5
	add_special Function11b879
	add_special Function11b920
	add_special Function11b93b
	add_special BattleTowerRoomMenu
	add_special Function1700ba
	add_special Function170114
	add_special BattleTowerBattle
	add_special Function1704e1
	add_special UnusedBattleTowerDummySpecial1
	add_special LoadOpponentTrainerAndPokemonWithOTSprite
	add_special Function11ba38
	add_special CheckForBattleTowerRules
	add_special GiveOddEgg
	add_special Reset ; bank 0
	add_special Function1011f1
	add_special Function101220
	add_special Function101225
	add_special Function101231
	add_special MoveTutor
	add_special OmanyteChamber
	add_special Function11c1ab
	add_special BattleTowerAction
	add_special DisplayUnownWords
	add_special Menu_ChallengeExplanationCancel
	add_special Function17d2b6
	add_special Function17d2ce
	add_special BattleTowerMobileError
	add_special AskMobileOrCable
	add_special HoOhChamber
	add_special Function102142
	add_special CelebiShrineEvent
	add_special CheckCaughtCelebi
	add_special PokeSeer
	add_special BuenasPassword
	add_special BuenaPrize
	add_special GiveDratini
	add_special SampleKenjiBreakCountdown
	add_special BeastsCheck
	add_special MonCheck
	add_special SetPlayerPalette
	add_special UnusedBattleTowerDummySpecial2
	add_special Mobile_SelectThreeMons
	add_special Function1037eb
	add_special Function10383c
	add_special StubbedTrainerRankings_Healings
	add_special RefreshSprites
	add_special Function1037c2
	add_special Mobile_DummyReturnFalse
	add_special Function103780
	add_special Function10387b
	add_special AskRememberPassword
	add_special LoadMapPalettes
	add_special UnusedFindItemInPCOrBag

	add_special InitialSetDSTFlag
	add_special InitialClearDSTFlag
	add_special UnusedDummySpecial ; unused
