
Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
rept 3
	add hl,de
endr
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
	add_special Special_AbortLink
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

; Bug Catching Contest
	add_special BugContestJudging
	add_special CheckPartyFullAfterContest
	add_special CheckFirstMonFainted
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
	add_special Special_WhiteBGMapBufferScreen
	add_special FadeBlackBGMap
	add_special Special_BattleTowerFade
	add_special Special_FadeBlackQuickly
	add_special FadeInBGMap
	add_special Special_FadeInQuickly
	add_special Special_ReloadSpritesNoPalettes
	add_special WhiteBGMap
	add_special UpdateTimePals
	add_special ClearTileMap
	add_special DrawOnMap
	add_special Special_ReplaceKrisSprite
	add_special Special_GameCornerPrizeMonCheckDex
	add_special SpecialSeenMon
	add_special WaitSFX
	add_special PlayMapMusic
	add_special RestartMapMusic
	add_special HealMachineAnim
	add_special Function8379
	add_special Functionc25a
	add_special Functionc268
	add_special Functionc276
	add_special Functionc284
	add_special Functionc3ef
	add_special Function17421
	add_special Function17440
	add_special Special_SelectRandomBugContestContestants
	add_special Functionc3fc
	add_special ToggleMaptileDecorations
	add_special ToggleDecorationsVisibility
	add_special SpecialGiveShuckle
	add_special SpecialReturnShuckle
	add_special Function73f7
	add_special SpecialCheckPokerus
	add_special Function24b25
	add_special Function24b4e
	add_special Function24ae8
	add_special Function4d87a
	add_special Functionc434
	add_special Functionc422
	add_special Function4d9d3
	add_special Function88018
	add_special SpecialNameRater
	add_special Functionc2da
	add_special GetFirstPokemonHappiness
	add_special Function71ac
	add_special Function2a4ab
	add_special Function2a51f
	add_special RandomPhoneMon
	add_special RunCallback_04
	add_special Functionfb841
	add_special SpecialSnorlaxAwake
	add_special Function7413
	add_special Function7418
	add_special Function741d
	add_special Functionc472
	add_special ProfOaksPCBoot
	add_special SpecialGameboyCheck
	add_special SpecialTrainerHouse
	add_special Function16dc7
	add_special InitRoamMons
	add_special Functionc48f
	add_special Functionc49f
	add_special Functionc4ac
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
	add_special Function170215
	add_special Function1704e1
	add_special Function17021d
	add_special Function170b44
	add_special Function11ba38
	add_special Function170bd3
	add_special Function117656
	add_special Reset
	add_special Function1011f1
	add_special Function101220
	add_special Function101225
	add_special Function101231
	add_special Function4925b
	add_special SpecialOmanyteChamber
	add_special Function11c1ab
	add_special Function170687
	add_special Special_DisplayUnownWords
	add_special Function17d224
	add_special Function17d2b6
	add_special Function17d2ce
	add_special Function17f53d
	add_special Function103612
	add_special SpecialHoOhChamber
	add_special Function102142
	add_special Function4989a
	add_special Function49bf9
	add_special SpecialPokeSeer
	add_special SpecialBuenasPassword
	add_special SpecialBuenaPrize
	add_special SpecialDratini
	add_special Function11485
	add_special SpecialBeastsCheck
	add_special SpecialMonCheck
	add_special Functionc225
	add_special Function170bd2
	add_special Mobile_SelectThreeMons
	add_special Function1037eb
	add_special Function10383c
	add_special Mobile_HealParty
	add_special Function14168
	add_special Function1037c2
	add_special Function10630f
	add_special Function103780
	add_special Function10387b
	add_special Function4ae12
	add_special LoadMapPalettes
	add_special Function4a927
	add_special Function90a54
	add_special Function90a88
	add_special SpecialNone
; c224

SpecialNone: ; c224
	ret
; c225

Functionc225: ; c225
	ld a, [ScriptVar]
	ld d, a
	callba Function57e2
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
	callba Functionfb877
	call Function2b4d
	ret
; c252

SpecialSeenMon: ; c252
	ld a, [ScriptVar]
	dec a
	call SetSeenMon
	ret
; c25a

Functionc25a: ; c25a
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbd2
	jr z, Functionc298
	jr Functionc292

Functionc268: ; c268
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbd9
	jr z, Functionc298
	jr Functionc292

Functionc276: ; c276
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbe0
	jr z, Functionc298
	jr Functionc292

Functionc284: ; c284
	ld a, [ScriptVar]
	ld b, a
	callba Function4dbe6
	jr z, Functionc298
	jr Functionc292

Functionc292: ; c292
	ld a, $1
	ld [ScriptVar], a
	ret

Functionc298: ; c298
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
	callba Function9191c
	call Function2b4d
	ret
; c2cd

Special_UnownPrinter: ; c2cd
	call FadeToMenu
	callba Function16be4
	call Function2b4d
	ret
; c2da

Functionc2da: ; c2da
	call FadeToMenu
	callba Function3f836
	call Function2b4d
	ret
; c2e7

Special_KrissHousePC: ; c2e7
	xor a
	ld [ScriptVar], a
	callba Function156d9
	ld a, c
	ld [ScriptVar], a
	ret
; c2f6

Special_CheckMysteryGift: ; c2f6
	ld a, $0
	call GetSRAMBank
	ld a, [$abe2]
	and a
	jr z, .no
	inc a

.no
	ld [ScriptVar], a
	call CloseSRAM
	ret
; c309

Special_GetMysteryGiftItem: ; c309
	ld a, $0
	call GetSRAMBank
	ld a, [$abe2]
	ld [CurItem], a
	ld a, $1
	ld [wd10c], a
	ld hl, NumItems
	call ReceiveItem
	jr nc, .asm_c33d
	xor a
	ld [$abe2], a
	call CloseSRAM
	ld a, [CurItem]
	ld [wd265], a
	call GetItemName
	ld hl, UnknownText_0xc345
	call PrintText
	ld a, $1
	ld [ScriptVar], a
	ret

.asm_c33d
	call CloseSRAM
	xor a
	ld [ScriptVar], a
	ret
; c345

UnknownText_0xc345: ; 0xc345
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
	callba Functione1190
	ld a, [wd0ec]
	ld [ScriptVar], a
	call Function2b4d
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
	call Function31cf
	call FadeToMenu
	ld hl, wd0e8
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	rst FarCall
	call Function2b4d
	ret
; c3ae

Special_CheckCoins: ; c3ae
	ld hl, Coins
	ld a, [hli]
	or [hl]
	jr z, .asm_c3c4
	ld a, COIN_CASE
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr nc, .asm_c3c9
	and a
	ret

.asm_c3c4
	ld hl, UnknownText_0xc3d1
	jr .asm_c3cc

.asm_c3c9
	ld hl, UnknownText_0xc3d6

.asm_c3cc
	call PrintText
	scf
	ret
; c3d1

UnknownText_0xc3d1: ; 0xc3d1
	; You have no coins.
	text_jump UnknownText_0x1bd3d7
	db "@"
; 0xc3d6

UnknownText_0xc3d6: ; 0xc3d6
	; You don't have a COIN CASE.
	text_jump UnknownText_0x1bd3eb
	db "@"
; 0xc3db

Special_WhiteBGMapBufferScreen: ; c3db
	call WhiteBGMap
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

Functionc3ef: ; c3ef
	callba Function1150c
	ld a, [wdc3a]
	ld [ScriptVar], a
	ret
; c3fc

Functionc3fc: ; c3fc
	ld a, [ScriptVar]
	ld [wdfce], a
	ret
; c403


LoadWildData:: ; c403
	ld a, c
	and a
	jr nz, .swarm_route35
; swarm dark cave violet entrance
	ld a, d
	ld [wdfcc], a
	ld a, e
	ld [wdfcd], a
	ret

.swarm_route35
	ld a, d
	ld [wdc5a], a
	ld a, e
	ld [wdc5b], a
	ret
; c419


SpecialCheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	callba CheckPokerus
	jp ScriptReturnCarry
; c422

Functionc422: ; c422
	callba Function1152b
	ld hl, wdc9d
	res 0, [hl]
	callba Function5d33
	ret
; c434

Functionc434: ; c434
	callba Function11542
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
	cp $ff
	jr z, .nope
	cp b
	jr nz, .nextcoord
	ld a, [hli]
	cp c
	jr nz, .loop

	ld a, $1
	jr .done

.nextcoord
	inc hl
	jr .loop

.nope
	xor a
.done
	ld [ScriptVar], a
	ret

.ProximityCoords
	;   x,  y
	db 33,  8 ; left
	db 34, 10 ; below
	db 35, 10 ; below
	db 36,  8 ; right
	db 36,  9 ; right
	db $ff


Functionc472: ; c472
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


Functionc48f: ; c48f
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, $2
	ld [MusicFade], a
	ret
; c49f

Functionc49f: ; c49f
	call FadeToMenu
	callba Function1dd702
	call Function2b4d
	ret
; c4ac

Functionc4ac: ; c4ac
	call FadeToMenu
	callba Function84688
	call Function2b4d
	ret
; c4b9

SpecialTrainerHouse: ; 0xc4b9
	ld a, 0
	call GetSRAMBank
	ld a, [$abfd] ; XXX what is this memory location?
	ld [ScriptVar], a
	jp CloseSRAM
