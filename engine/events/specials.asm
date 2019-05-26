INCLUDE "charmap.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/rst.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/item_constants.inc"
INCLUDE "constants/menu_constants.inc"
INCLUDE "constants/misc_constants.inc"
INCLUDE "constants/music_constants.inc"
INCLUDE "constants/script_constants.inc"


SECTION "engine/events/specials.asm", ROMX

Special::
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

INCLUDE "data/special_pointers.inc"


SECTION "engine/events/specials.asm@DummySpecial_c224", ROMX

DummySpecial_c224:
	ret


SECTION "engine/events/specials.asm@SetPlayerPalette", ROMX

SetPlayerPalette:
	ld a, [wScriptVar]
	ld d, a
	farcall _SetPlayerPalette
	ret


SECTION "engine/events/specials.asm@GameCornerPrizeMonCheckDex", ROMX

GameCornerPrizeMonCheckDex:
	ld a, [wScriptVar]
	dec a
	call CheckCaughtMon
	ret nz
	ld a, [wScriptVar]
	dec a
	call SetSeenAndCaughtMon
	call FadeToMenu
	ld a, [wScriptVar]
	ld [wNamedObjectIndexBuffer], a
	farcall NewPokedexEntry
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@UnusedSetSeenMon", ROMX

UnusedSetSeenMon:
	ld a, [wScriptVar]
	dec a
	call SetSeenMon
	ret


SECTION "engine/events/specials.asm@FindPartyMon", ROMX

FindPartyMonAboveLevel:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAboveLevel
	jr z, FoundNone
	jr FoundOne

FindPartyMonAtLeastThatHappy:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonAtLeastThatHappy
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpecies:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpecies
	jr z, FoundNone
	jr FoundOne

FindPartyMonThatSpeciesYourTrainerID:
	ld a, [wScriptVar]
	ld b, a
	farcall _FindPartyMonThatSpeciesYourTrainerID
	jr z, FoundNone
	jr FoundOne

FoundOne:
	ld a, TRUE
	ld [wScriptVar], a
	ret

FoundNone:
	xor a
	ld [wScriptVar], a
	ret


SECTION "engine/events/specials.asm@NameRival", ROMX

NameRival:
	ld b, NAME_RIVAL
	ld de, wRivalName
	farcall _NamingScreen
	; default to "SILVER"
	ld hl, wRivalName
	ld de, .default
	call InitName
	ret

.default
	db "SILVER@"


SECTION "engine/events/specials.asm@NameRater", ROMX

NameRater:
	farcall _NameRater
	ret


SECTION "engine/events/specials.asm@OverworldTownMap", ROMX

OverworldTownMap:
	call FadeToMenu
	farcall _TownMap
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@UnownPrinter", ROMX

UnownPrinter:
	call FadeToMenu
	farcall _UnownPrinter
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@DisplayLinkRecord", ROMX

DisplayLinkRecord:
	call FadeToMenu
	farcall _DisplayLinkRecord
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@PlayersHousePC", ROMX

PlayersHousePC:
	xor a
	ld [wScriptVar], a
	farcall _PlayersHousePC
	ld a, c
	ld [wScriptVar], a
	ret


SECTION "engine/events/specials.asm@CheckMysteryGift", ROMX

CheckMysteryGift:
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


SECTION "engine/events/specials.asm@GetMysteryGiftItem", ROMX

GetMysteryGiftItem:
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
	ld [wNamedObjectIndexBuffer], a
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

.ReceiveItemText:
	; received item
	text_far _ReceiveItemText
	text_end


SECTION "engine/events/specials.asm@BugContestJudging", ROMX

BugContestJudging:
	farcall _BugContestJudging
	ld a, b
	ld [wScriptVar], a
	ret


SECTION "engine/events/specials.asm@MapRadio", ROMX

MapRadio:
	ld a, [wScriptVar]
	ld e, a
	farcall PlayRadio
	ret


SECTION "engine/events/specials.asm@UnownPuzzle", ROMX

UnownPuzzle:
	call FadeToMenu
	farcall _UnownPuzzle
	ld a, [wSolvedUnownPuzzle]
	ld [wScriptVar], a
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@StartGameCornerGame", ROMX

SlotMachine:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_SlotMachine)
	ld hl, _SlotMachine
	call StartGameCornerGame
	ret

CardFlip:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_CardFlip)
	ld hl, _CardFlip
	call StartGameCornerGame
	ret

DummyNonfunctionalGameCornerGame:
	call CheckCoinsAndCoinCase
	ret c
	ld a, BANK(_DummyGame)
	ld hl, _DummyGame
	call StartGameCornerGame
	ret

StartGameCornerGame:
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

CheckCoinsAndCoinCase:
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

.NoCoinsText:
	; You have no coins.
	text_far _NoCoinsText
	text_end

.NoCoinCaseText:
	; You don't have a COIN CASE.
	text_far _NoCoinCaseText
	text_end


SECTION "engine/events/specials.asm@ClearBGPalettesBufferScreen", ROMX

ClearBGPalettesBufferScreen:
	call ClearBGPalettes
	call BufferScreen
	ret


SECTION "engine/events/specials.asm@Misc", ROMX

ScriptReturnCarry:
	jr c, .carry
	xor a
	ld [wScriptVar], a
	ret
.carry
	ld a, 1
	ld [wScriptVar], a
	ret

UnusedCheckUnusedTwoDayTimer:
	farcall CheckUnusedTwoDayTimer
	ld a, [wUnusedTwoDayTimer]
	ld [wScriptVar], a
	ret

ActivateFishingSwarm:
	ld a, [wScriptVar]
	ld [wFishingSwarmFlag], a
	ret

StoreSwarmMapIndices::
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

CheckPokerus:
; Check if a monster in your party has Pokerus
	farcall _CheckPokerus
	jp ScriptReturnCarry

ResetLuckyNumberShowFlag::
	farcall RestartLuckyNumberCountdown
	ld hl, wLuckyNumberShowFlag
	res LUCKYNUMBERSHOW_GAME_OVER_F, [hl]
	farcall LoadOrRegenerateLuckyIDNumber
	ret

CheckLuckyNumberShowFlag::
	farcall _CheckLuckyNumberShowFlag
	jp ScriptReturnCarry


SECTION "engine/events/specials.asm@SnorlaxAwake", ROMX

SnorlaxAwake:
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


SECTION "engine/events/specials.asm@PlayCurMonCry", ROMX

PlayCurMonCry:
	ld a, [wCurPartySpecies]
	jp PlayMonCry


SECTION "engine/events/specials.asm@GameboyCheck", ROMX

GameboyCheck:
	ldh a, [hCGB]
	and a
	jr nz, .cgb

	ldh a, [hSGB]
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


SECTION "engine/events/specials.asm@FadeOutMusic", ROMX

FadeOutMusic:
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld a, $2
	ld [wMusicFade], a
	ret


SECTION "engine/events/specials.asm@Diploma", ROMX

Diploma:
	call FadeToMenu
	farcall _Diploma
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@PrintDiploma", ROMX

PrintDiploma:
	call FadeToMenu
	farcall _PrintDiploma
	call ExitAllMenus
	ret


SECTION "engine/events/specials.asm@TrainerHouse", ROMX

TrainerHouse:
	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	ld [wScriptVar], a
	jp CloseSRAM
