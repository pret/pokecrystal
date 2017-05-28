
Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
	add hl,de
	add hl,de
	add hl,de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; c029

SpecialsPointers:: ; c029
	add_special WarpToSpawnPoint

; Communications
	add_special Special_SetBitsForLinkTradeRequest
	add_special Special_WaitForLinkedFriend
	add_special Special_CheckLinkTimeout
	add_special Special_TryQuickSave
	add_special Special_CheckBothSelectedSameRoom
	add_special Special_FailedLinkToPast
	add_special Special_CloseLink
	add_special WaitForOtherPlayerToExit
	add_special Special_SetBitsForBattleRequest
	add_special Special_SetBitsForTimeCapsuleRequest
	add_special Special_CheckTimeCapsuleCompatibility
	add_special Special_EnterTimeCapsule
	add_special Special_TradeCenter
	add_special Special_Colosseum
	add_special Special_TimeCapsule
	add_special Special_CableClubCheckWhichChris
	add_special Special_CheckMysteryGift
	add_special Special_GetMysteryGiftItem
	add_special Special_UnlockMysteryGift

; Map Events
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special ContestDropOffMons
	add_special ContestReturnMons
	add_special Special_GiveParkBalls
	add_special Special_CheckMagikarpLength
	add_special Special_MagikarpHouseSign
	add_special HealParty
	add_special PokemonCenterPC
	add_special Special_KrissHousePC
	add_special Special_DayCareMan
	add_special Special_DayCareLady
	add_special Special_DayCareManOutside
	add_special MoveDeletion
	add_special Special_BankOfMom
	add_special Special_MagnetTrain
	add_special SpecialNameRival
	add_special Special_SetDayOfWeek
	add_special Special_TownMap
	add_special Special_UnownPrinter
	add_special MapRadio
	add_special Special_UnownPuzzle
	add_special Special_SlotMachine
	add_special Special_CardFlip
	add_special Special_DummyNonfunctionalGameCornerGame
	add_special Special_ClearBGPalettesBufferScreen
	add_special FadeOutPalettes
	add_special Special_BattleTowerFade
	add_special Special_FadeBlackQuickly
	add_special FadeInPalettes
	add_special Special_FadeInQuickly
	add_special Special_ReloadSpritesNoPalettes
	add_special ClearBGPalettes
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special UpdateSprites
	add_special ReplaceKrisSprite
	add_special Special_GameCornerPrizeMonCheckDex
	add_special SpecialSeenMon
	add_special WaitSFX
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special Special_SurfStartStep
	add_special Special_FindGreaterThanThatLevel
	add_special Special_FindAtLeastThatHappy
	add_special Special_FindThatSpecies
	add_special Special_FindThatSpeciesYourTrainerID
	add_special Special_CheckUnusedTwoDayTimer ; unreferenced
	add_special Special_DayCareMon1
	add_special Special_DayCareMon2
	add_special Special_SelectRandomBugContestContestants
	add_special Special_ActivateFishingSwarm
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special SpecialGiveShuckle
	add_special SpecialReturnShuckle
	add_special Special_BillsGrandfather
	add_special SpecialCheckPokerus
	add_special Special_DisplayCoinCaseBalance
	add_special Special_DisplayMoneyAndCoinBalance
	add_special PlaceMoneyTopRight
	add_special Special_CheckForLuckyNumberWinners
	add_special Special_CheckLuckyNumberShowFlag
	add_special Special_ResetLuckyNumberShowFlag
	add_special Special_PrintTodaysLuckyNumber
	add_special Special_SelectApricornForKurt
	add_special SpecialNameRater
	add_special Special_DisplayLinkRecord
	add_special GetFirstPokemonHappiness
	add_special CheckFirstMonIsEgg
	add_special RandomPhoneRareWildMon
	add_special RandomPhoneWildMon
	add_special RandomPhoneMon
	add_special MapCallbackSprites_LoadUsedSpritesGFX
	add_special PlaySlowCry
	add_special SpecialSnorlaxAwake
	add_special Special_YoungerHaircutBrother
	add_special Special_OlderHaircutBrother
	add_special Special_DaisyMassage
	add_special PlayCurMonCry
	add_special ProfOaksPCBoot
	add_special SpecialGameboyCheck
	add_special SpecialTrainerHouse
	add_special PhotoStudio
	add_special InitRoamMons
	add_special Special_FadeOutMusic
	add_special Diploma
	add_special PrintDiploma

	; Crystal
	add_special Function11ac3e
	add_special Function11b444
	add_special Function11b5e8
	add_special Function11b7e5
	add_special Function11b879
	add_special Function11b920
	add_special Function11b93b
	add_special Function1700b0
	add_special Function1700ba
	add_special Function170114
	add_special BattleTowerBattle
	add_special Function1704e1
	add_special EmptySpecial_17021d
	add_special Function_LoadOpponentTrainerAndPokemonsWithOTSprite
	add_special Function11ba38
	add_special SpecialCheckForBattleTowerRules
	add_special Special_GiveOddEgg
	add_special Reset
	add_special Function1011f1
	add_special Function101220
	add_special Function101225
	add_special Function101231
	add_special Special_MoveTutor
	add_special SpecialOmanyteChamber
	add_special Function11c1ab
	add_special BattleTowerAction
	add_special Special_DisplayUnownWords
	add_special Special_Menu_ChallengeExplanationCancel
	add_special Function17d2b6
	add_special Function17d2ce
	add_special Function17f53d
	add_special AskMobileOrCable
	add_special SpecialHoOhChamber
	add_special Function102142
	add_special Special_CelebiShrineEvent
	add_special CheckCaughtCelebi
	add_special SpecialPokeSeer
	add_special SpecialBuenasPassword
	add_special SpecialBuenaPrize
	add_special SpecialDratini
	add_special Special_SampleKenjiBreakCountdown
	add_special SpecialBeastsCheck
	add_special SpecialMonCheck
	add_special Special_SetPlayerPalette
	add_special ret_170bd2
	add_special Mobile_SelectThreeMons
	add_special Function1037eb
	add_special Function10383c
	add_special TrainerRankings_Healings
	add_special RefreshSprites
	add_special Function1037c2
	add_special Mobile_DummyReturnFalse
	add_special Function103780
	add_special Function10387b
	add_special AskRememberPassword
	add_special LoadMapPalettes
	add_special FindItemInPCOrBag
	add_special Special_InitialSetDSTFlag
	add_special Special_InitialClearDSTFlag
	add_special SpecialNone
; c224

SpecialNone: ; c224
	ret
; c225

Special_SetPlayerPalette: ; c225
	ld a, [ScriptVar]
	ld d, a
	callba SetPlayerPalette
	ret
; c230

Special_GameCornerPrizeMonCheckDex: ; c230
	ld a, [ScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [ScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [ScriptVar]
	ld [wd265], a
	callba NewPokedexEntry
	call ExitAllMenus
	ret
; c252

SpecialSeenMon: ; c252
	ld a, [ScriptVar]
	dec a
	call SetSeenMon
	ret
; c25a

Special_FindGreaterThanThatLevel: ; c25a
	ld a, [ScriptVar]
	ld b, a
	callba _FindGreaterThanThatLevel
	jr z, FoundNone
	jr FoundOne

Special_FindAtLeastThatHappy: ; c268
	ld a, [ScriptVar]
	ld b, a
	callba _FindAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpecies: ; c276
	ld a, [ScriptVar]
	ld b, a
	callba _FindThatSpecies
	jr z, FoundNone
	jr FoundOne

Special_FindThatSpeciesYourTrainerID: ; c284
	ld a, [ScriptVar]
	ld b, a
	callba _FindThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne: ; c292
	ld a, TRUE
	ld [ScriptVar], a
	ret

FoundNone: ; c298
	xor a
	ld [ScriptVar], a
	ret
; c29d

SpecialNameRival: ; 0xc29d
	ld b, $2 ; rival
	ld de, RivalName
	callba _NamingScreen
	; default to "SILVER"
	ld hl, RivalName
	ld de, DefaultRivalName
	call InitName
	ret
; 0xc2b2

DefaultRivalName: ; 0xc2b2
	db "SILVER@"

SpecialNameRater: ; c2b9
	callba NameRater
	ret
; c2c0

Special_TownMap: ; c2c0
	call FadeToMenu
	callba _TownMap
	call ExitAllMenus
	ret
; c2cd

Special_UnownPrinter: ; c2cd
	call FadeToMenu
	callba UnownPrinter
	call ExitAllMenus
	ret
; c2da

Special_DisplayLinkRecord: ; c2da
	call FadeToMenu
	callba DisplayLinkRecord
	call ExitAllMenus
	ret
; c2e7

Special_KrissHousePC: ; c2e7
	xor a
	ld [ScriptVar], a
	callba _KrissHousePC
	ld a, c
	ld [ScriptVar], a
	ret
; c2f6

Special_CheckMysteryGift: ; c2f6
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a

.no
	ld [ScriptVar], a
	call CloseSRAM
	ret
; c309

Special_GetMysteryGiftItem: ; c309
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	ld [CurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [CurItem]
	ld [wd265], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [ScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [ScriptVar], a
	ret
; c345

.ReceiveItemText: ; 0xc345
	; received item
	text_jump UnknownText_0x1bd3be
	db "@"
; 0xc34a

BugContestJudging: ; c34a
	callba _BugContestJudging
	ld a, b
	ld [ScriptVar], a
	ret
; c355

MapRadio: ; c355
	ld a, [ScriptVar]
	ld e, a
	callba PlayRadio
	ret
; c360

Special_UnownPuzzle: ; c360
	call FadeToMenu
	callba UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [ScriptVar], a
	call ExitAllMenus
	ret
; c373

Special_SlotMachine: ; c373
	call Special_CheckCoins
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call Special_StartGameCornerGame
	ret
; c380

Special_CardFlip: ; c380
	call Special_CheckCoins
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call Special_StartGameCornerGame
	ret
; c38d

Special_DummyNonfunctionalGameCornerGame: ; c38d
	call Special_CheckCoins
	ret c
	ld a, BANK(_DummyGame)
	ld hl, _DummyGame
	call Special_StartGameCornerGame
	ret
; c39a

Special_StartGameCornerGame: ; c39a
	call FarQueueScript
	call FadeToMenu
	ld hl, wQueuedScriptBank
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call ExitAllMenus
	ret
; c3ae

Special_CheckCoins: ; c3ae
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr nc, .no_coin_case
	and a
	ret

.no_coins
	ld hl, .NoCoinsText
	jr .print

.no_coin_case
	ld hl, .NoCoinCaseText

.print
	call PrintText
	scf
	ret
; c3d1

.NoCoinsText: ; 0xc3d1
	; You have no coins.
	text_jump UnknownText_0x1bd3d7
	db "@"
; 0xc3d6

.NoCoinCaseText: ; 0xc3d6
	; You don't have a COIN CASE.
	text_jump UnknownText_0x1bd3eb
	db "@"
; 0xc3db

Special_ClearBGPalettesBufferScreen: ; c3db
	call ClearBGPalettes
	call BufferScreen
	ret
; c3e2

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [ScriptVar], a
	ret
.carry
	ld a, 1
	ld [ScriptVar], a
	ret
; c3ef

Special_CheckUnusedTwoDayTimer: ; c3ef
	callba CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [ScriptVar], a
	ret
; c3fc

Special_ActivateFishingSwarm: ; c3fc
	ld a, [ScriptVar]
	ld [wFishingSwarmFlag], a
	ret
; c403


StoreSwarmMapIndices:: ; c403
	ld a, c
	and a
	jr nz, .yanma
; swarm dark cave violet entrance
	ld a, d
	ld [wDunsparceMapGroup], a
	ld a, e
	ld [wDunsparceMapNumber], a
	ret

.yanma
	ld a, d
	ld [wYanmaMapGroup], a
	ld a, e
	ld [wYanmaMapNumber], a
	ret
; c419


SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	callba CheckPokerus
	jp ScriptReturnCarry
; c422

Special_ResetLuckyNumberShowFlag: ; c422
	callba RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res 0, [hl]
	callba LoadOrRegenerateLuckyIDNumber
	ret
; c434

Special_CheckLuckyNumberShowFlag: ; c434
	callba CheckLuckyNumberShowFlag
	jp ScriptReturnCarry
; c43d

SpecialSnorlaxAwake: ; 0xc43d
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; ScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [XCoord]
	ld b, a
	ld a, [YCoord]
	ld c, a

	ld hl, .ProximityCoords
.loop
	ld a, [hli]
	cp -1
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, TRUE
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [ScriptVar], a
	ret

.ProximityCoords:
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db -1


PlayCurMonCry: ; c472
	ld a, [CurPartySpecies]
	jp PlayCry
; c478


SpecialGameboyCheck: ; c478
	ld a, [hCGB]
	and a
	jr nz, .cgb

	ld a, [hSGB]
	and a
	jr nz, .sgb

.gb
	xor a
	jr .done
.sgb
	ld a, 1
	jr .done
.cgb
	ld a, 2
.done
	ld [ScriptVar], a
	ret


Special_FadeOutMusic: ; c48f
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, $2
	ld [MusicFade], a
	ret
; c49f

Diploma: ; c49f
	call FadeToMenu
	callba _Diploma
	call ExitAllMenus
	ret
; c4ac

PrintDiploma: ; c4ac
	call FadeToMenu
	callba _PrintDiploma
	call ExitAllMenus
	ret
; c4b9

SpecialTrainerHouse: ; 0xc4b9
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [ScriptVar], a
	jp CloseSRAM
