Special:: ; c01b
; Run script special de.
	ld hl, SpecialsPointers
	add hl, de
	add hl, de
	add hl, de
	ld b, [hl]
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	rst FarCall
	ret
; c029

INCLUDE "data/special_pointers.asm"

DummySpecial_c224: ; c224
	ret
; c225

SetPlayerPalette: ; c225
	ld a, [wScriptVar]
	ld d, a
	farcall _SetPlayerPalette
	ret
; c230

GameCornerPrizeMonCheckDex: ; c230
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wd265], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret
; c252

UnusedSetSeenMon: ; c252
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret
; c25a

FindPartyMonAboveLevel: ; c25a
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy: ; c268
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies: ; c276
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID: ; c284
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne: ; c292
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone: ; c298
	xor a
	ld [wScriptVar], a
	ret
; c29d

NameRival: ; 0xc29d
	ld b, $2 ; rival
	ld de, wRivalName
	farcall _NamingScreen
	; default to "SILVER"
	ld hl, wRivalName
	ld de, .default
	call InitName
	ret

.default
	db "SILVER@"
; 0xc2b9

NameRater: ; c2b9
	farcall _NameRater
	ret
; c2c0

OverworldTownMap: ; c2c0
	call FadeToMenu
	farcall _TownMap
	call ExitAllMenus
	ret
; c2cd

UnownPrinter: ; c2cd
	call FadeToMenu
	farcall _UnownPrinter
	call ExitAllMenus
	ret
; c2da

DisplayLinkRecord: ; c2da
	call FadeToMenu
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret
; c2e7

PlayersHousePC: ; c2e7
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret
; c2f6

CheckMysteryGift: ; c2f6
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	and a
	jr z, .no
	inc a

.no
	ld [wScriptVar], a
	call CloseSRAM
	ret
; c309

GetMysteryGiftItem: ; c309
	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld a, [sMysteryGiftItem]
	ld [wCurItem], a
	ld a, 1
	ld [wItemQuantityChangeBuffer], a
	ld hl, wNumItems
	call ReceiveItem
	jr nc, .no_room
	xor a
	ld [sMysteryGiftItem], a
	call CloseSRAM
	ld a, [wCurItem]
	ld [wd265], a
	call GetItemName
	ld hl, .ReceiveItemText
	call PrintText
	ld a, TRUE
	ld [wScriptVar], a
	ret

.no_room
	call CloseSRAM
	xor a
	ld [wScriptVar], a
	ret
; c345

.ReceiveItemText: ; 0xc345
	; received item
	text_jump UnknownText_0x1bd3be
	db "@"
; 0xc34a

BugContestJudging: ; c34a
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret
; c355

MapRadio: ; c355
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret
; c360

UnownPuzzle: ; c360
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret
; c373

SlotMachine: ; c373
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret
; c380

CardFlip: ; c380
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret
; c38d

DummyNonfunctionalGameCornerGame: ; c38d
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_DummyGame)
	ld hl, _DummyGame
	call StartGameCornerGame
	ret
; c39a

StartGameCornerGame: ; c39a
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

CheckCoinsAndCoinCase: ; c3ae
	ld hl, wCoins
	ld a, [hli]
	or [hl]
	jr z, .no_coins
	ld a, COIN_CASE
	ld [wCurItem], a
	ld hl, wNumItems
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

ClearBGPalettesBufferScreen: ; c3db
	call ClearBGPalettes
	call BufferScreen
	ret
; c3e2

ScriptReturnCarry: ; c3e2
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret
; c3ef

UnusedCheckUnusedTwoDayTimer: ; c3ef
	farcall CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret
; c3fc

ActivateFishingSwarm: ; c3fc
	ld a, [wScriptVar]
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


CheckPokerus: ; c419
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry
; c422

ResetLuckyNumberShowFlag: ; c422
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	farcall LoadOrRegenerateLuckyIDNumber
	ret
; c434

CheckLuckyNumberShowFlag: ; c434
	farcall _CheckLuckyNumberShowFlag
	jp ScriptReturnCarry
; c43d

SnorlaxAwake: ; 0xc43d
; Check if the Poké Flute channel is playing, and if the player is standing
; next to Snorlax.

; outputs:
; wScriptVar is 1 if the conditions are met, otherwise 0.

; check background music
	ld a, [wMapMusic]
	cp MUSIC_POKE_FLUTE_CHANNEL
	jr nz, .nope

	ld a, [wXCoord]
	ld b, a
	ld a, [wYCoord]
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
	ld [wScriptVar], a
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
	ld a, [wCurPartySpecies]
	jp PlayMonCry
; c478


GameboyCheck: ; c478
	ld a, [hCGB]
	and a
	jr nz, .cgb

	ld a, [hSGB]
	and a
	jr nz, .sgb

.gb
	xor a ; GBCHECK_GB
	jr .done
.sgb
	ld a, GBCHECK_SGB
	jr .done
.cgb
	ld a, GBCHECK_CGB
.done
	ld [wScriptVar], a
	ret


FadeOutMusic: ; c48f
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret
; c49f

Diploma: ; c49f
	call FadeToMenu
	farcall _Diploma
	call ExitAllMenus
	ret
; c4ac

PrintDiploma: ; c4ac
	call FadeToMenu
	farcall _PrintDiploma
	call ExitAllMenus
	ret
; c4b9

TrainerHouse: ; 0xc4b9
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM
