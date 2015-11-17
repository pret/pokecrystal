INCLUDE "includes.asm"


SECTION "bank1", ROMX, BANK[$1]


Function4000:: ; 4000
	hlcoord 3, 10
	ld b, 1
	ld c, 11

	ld a, [wBattleMode]
	and a
	jr z, .notinbattle

	call TextBox
	jr .incave

.notinbattle
	predef Function28eef

.incave
	hlcoord 4, 11
	ld de, .Waiting
	call PlaceString
	ld c, 50
	jp DelayFrames
; 4025

.Waiting ; 4025
	db "Waiting...!@"
; 4031

LoadPushOAM:: ; 4031
	ld c, hPushOAM - $ff00
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.loop
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .loop
	ret
; 403f

PushOAM: ; 403f
	ld a, Sprites >> 8
	ld [rDMA], a
	ld a, $28
.loop
	dec a
	jr nz, .loop
	ret
PushOAMEnd
; 4049


INCLUDE "engine/map_objects.asm"


Function5ae8: ; 5ae8
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_MAIN_MENU
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	callba MainMenu
	jp Function6219
; 5b04

; unreferenced
	ret
; 5b05

PrintDayOfWeek: ; 5b05
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret
; 5b1c

.Days ; 5b1c
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
; 5b40

.Day ; 5b40
	db "DAY@"
; 5b44

NewGame_ClearTileMapEtc: ; 5b44
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ResetTextRelatedRAM
	ret
; 5b54

MysteryGift: ; 5b54
	call UpdateTime
	callba DoMysteryGiftIfDayHasPassed
	callba DoMysteryGift
	ret
; 5b64

OptionsMenu: ; 5b64
	callba _OptionsMenu
	ret
; 5b6b

NewGame: ; 5b6b
	xor a
	ld [wc2cc], a
	call ResetWRAM
	call NewGame_ClearTileMapEtc
	call AreYouABoyOrAreYouAGirl
	call OakSpeech
	call InitializeWorld
	ld a, 1
	ld [wPreviousLandmark], a

	ld a, SPAWN_HOME
	ld [DefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	jp FinishContinueFunction
; 5b8f

AreYouABoyOrAreYouAGirl: ; 5b8f
	callba Function10632f ; some mobile stuff
	jr c, .ok
	callba InitGender
	ret

.ok
	ld c, 0
	callba Function4802f
	ret
; 5ba7

ResetWRAM: ; 5ba7
	xor a
	ld [hBGMapMode], a
	call _ResetWRAM
	ret
; 5bae

_ResetWRAM: ; 5bae

	ld hl, Sprites
	ld bc, Options - Sprites
	xor a
	call ByteFill

	ld hl, wd000
	ld bc, wGameData - wd000
	xor a
	call ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	call ByteFill

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomSub]
	ld [PlayerID], a

	ld a, [rLY]
	ld [hSecondsBackup], a
	call DelayFrame
	ld a, [hRandomAdd]
	ld [PlayerID + 1], a

	call Random
	ld [wSecretID], a
	call DelayFrame
	call Random
	ld [wSecretID + 1], a

	ld hl, PartyCount
	call InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call InitList
	call CloseSRAM

	ld hl, NumItems
	call InitList

	ld hl, NumKeyItems
	call InitList

	ld hl, NumBalls
	call InitList

	ld hl, PCItems
	call InitList

	xor a
	ld [wRoamMon1Species], a
	ld [wRoamMon2Species], a
	ld [wRoamMon3Species], a
	ld a, -1
	ld [wRoamMon1MapGroup], a
	ld [wRoamMon2MapGroup], a
	ld [wRoamMon3MapGroup], a
	ld [wRoamMon1MapNumber], a
	ld [wRoamMon2MapNumber], a
	ld [wRoamMon3MapNumber], a

	ld a, BANK(sMysteryGiftItem)
	call GetSRAMBank
	ld hl, sMysteryGiftItem
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	call CloseSRAM

	call LoadOrRegenerateLuckyIDNumber
	call InitializeMagikarpHouse

	xor a
	ld [MonType], a

	ld [JohtoBadges], a
	ld [KantoBadges], a

	ld [Coins], a
	ld [Coins + 1], a

START_MONEY EQU 3000

IF START_MONEY / $10000
	ld a, START_MONEY / $10000
ENDC
	ld [Money], a
	ld a, START_MONEY / $100 % $100
	ld [Money + 1], a
	ld a, START_MONEY % $100
	ld [Money + 2], a

	xor a
	ld [wdc17], a

	ld hl, wdc19
	ld [hl], 2300 / $10000
	inc hl
	ld [hl], 2300 / $100 % $100
	inc hl
	ld [hl], 2300 % $100

	call InitializeNPCNames

	callba InitDecorations

	callba DeleteScratchmons

	callba DeleteMobileEventIndex

	call ResetGameTime
	ret
; 5ca1

InitList: ; 5ca1
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret
; 5ca6

SetDefaultBoxNames: ; 5ca6
	ld hl, wBoxNames
	ld c, 0
.loop
	push hl
	ld de, .Box
	call CopyName2
	dec hl
	ld a, c
	inc a
	cp 10
	jr c, .less
	sub 10
	ld [hl], "1"
	inc hl

.less
	add "0"
	ld [hli], a
	ld [hl], "@"
	pop hl
	ld de, 9
	add hl, de
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .loop
	ret

.Box
	db "BOX@"
; 5cd3

InitializeMagikarpHouse: ; 5cd3
	ld hl, wBestMagikarpLengthFeet
	ld a, $3
	ld [hli], a
	ld a, $6
	ld [hli], a
	ld de, .Ralph
	call CopyName2
	ret
; 5ce3

.Ralph ; 5ce3
	db "RALPH@"
; 5ce9

InitializeNPCNames: ; 5ce9
	ld hl, .Rival
	ld de, RivalName
	call .Copy

	ld hl, .Mom
	ld de, MomsName
	call .Copy

	ld hl, .Red
	ld de, RedsName
	call .Copy

	ld hl, .Green
	ld de, GreensName

.Copy
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.Rival  db "???@"
.Red    db "RED@"
.Green  db "GREEN@"
.Mom    db "MOM@"
; 5d23

InitializeWorld: ; 5d23
	call ShrinkPlayer
	callba GetSpawnCoord
	callba _InitializeStartDay
	ret
; 5d33

LoadOrRegenerateLuckyIDNumber: ; 5d33
	ld a, BANK(sLuckyIDNumber)
	call GetSRAMBank
	ld a, [CurDay]
	inc a
	ld b, a
	ld a, [sLuckyNumberDay]
	cp b
	ld a, [sLuckyIDNumber + 1]
	ld c, a
	ld a, [sLuckyIDNumber]
	jr z, .skip
	ld a, b
	ld [sLuckyNumberDay], a
	call Random
	ld c, a
	call Random

.skip
	ld [wLuckyIDNumber], a
	ld [sLuckyIDNumber], a
	ld a, c
	ld [wLuckyIDNumber + 1], a
	ld [sLuckyIDNumber + 1], a
	jp CloseSRAM
; 5d65

Continue: ; 5d65
	callba TryLoadSaveFile
	jr c, .FailToLoad
	callba Function150b9
	call LoadStandardMenuDataHeader
	call Function5e85
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jr nc, .Check1Pass
	call WriteBackup
	jr .FailToLoad

.Check1Pass
	call Function5e48
	jr nc, .Check2Pass
	call WriteBackup
	jr .FailToLoad

.Check2Pass
	ld a, $8
	ld [MusicFade], a
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	call ClearBGPalettes
	call Function5df0
	call WriteBackup
	call ClearTileMap
	ld c, 20
	call DelayFrames
	callba JumpRoamMons
	callba Function105091
	callba Function140ae ; time-related
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

.FailToLoad
	ret

.SpawnAfterE4
	ld a, SPAWN_NEW_BARK
	ld [wd001], a
	call PostCreditsSpawn
	jp FinishContinueFunction
; 5de2

SpawnAfterRed: ; 5de2
	ld a, SPAWN_MT_SILVER
	ld [wd001], a
; 5de7

PostCreditsSpawn: ; 5de7
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ret
; 5df0

Function5df0: ; 5df0
	callba Function10632f
	ret nc
	ld hl, wd479
	bit 1, [hl]
	ret nz
	ld a, $5
	ld [MusicFade], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU / $100
	ld [MusicFadeIDHi], a
	ld c, 20
	call DelayFrames
	ld c, $1
	callba Function4802f
	callba Function1509a
	ld a, $8
	ld [MusicFade], a
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld c, 35
	call DelayFrames
	ret
; 5e34

ConfirmContinue: ; 5e34
.loop
	call DelayFrame
	call GetJoypad
	ld hl, hJoyPressed
	bit 0, [hl]
	jr nz, .PressA
	bit 1, [hl]
	jr z, .loop
	scf
	ret

.PressA
	ret
; 5e48

Function5e48: ; 5e48
	call Function6e3
	and %10000000 ; Day count exceeded 16383
	jr z, .pass
	callba RestartClock
	ld a, c
	and a
	jr z, .pass
	scf
	ret

.pass
	xor a
	ret
; 5e5d

FinishContinueFunction: ; 5e5d
.loop
	xor a
	ld [wc2c1], a
	ld [wLinkMode], a
	ld hl, GameTimerPause
	set 0, [hl]
	res 7, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	callba OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_RED
	jr z, .AfterRed
	jp Reset

.AfterRed
	call SpawnAfterRed
	jr .loop
; 5e85

Function5e85: ; 5e85
	call Function6e3
	and $80
	jr z, .asm_5e93
	lb de, 4, 8
	call Function5eaf
	ret

.asm_5e93
	lb de, 4, 8
	call Function5e9f
	ret
; 5e9a

Function5e9a: ; 5e9a
	lb de, 4, 0
	jr Function5e9f
; 5e9f

Function5e9f: ; 5e9f
	call Function5ebf
	call Function5f1c
	call Function5f40
	call LoadFontsExtra
	call UpdateSprites
	ret
; 5eaf

Function5eaf: ; 5eaf
	call Function5ebf
	call Function5f1c
	call Function5f48
	call LoadFontsExtra
	call UpdateSprites
	ret
; 5ebf

Function5ebf: ; 5ebf
	xor a
	ld [hBGMapMode], a
	ld hl, MenuDataHeader_0x5ed9
	ld a, [StatusFlags]
	bit 0, a ; pokedex
	jr nz, .asm_5ecf
	ld hl, MenuDataHeader_0x5efb

.asm_5ecf
	call Function1e35
	call MenuBox
	call Function1c89
	ret
; 5ed9

MenuDataHeader_0x5ed9: ; 5ed9
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw MenuData2_0x5ee1
	db 1 ; default option
; 5ee1

MenuData2_0x5ee1: ; 5ee1
	db $00 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"
; 5efb

MenuDataHeader_0x5efb: ; 5efb
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw MenuData2_0x5f03
	db 1 ; default option
; 5f03

MenuData2_0x5f03: ; 5f03
	db $00 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"
; 5f1c


Function5f1c: ; 5f1c
	call MenuBoxCoord2Tile
	push hl
	ld de, $5d
	add hl, de
	call DisplayBadgeCount
	pop hl
	push hl
	ld de, $84
	add hl, de
	call DisplayPokedexNumCaught
	pop hl
	push hl
	ld de, $30
	add hl, de
	ld de, .Player
	call PlaceString
	pop hl
	ret

.Player
	db "<PLAYER>@"
; 5f40

Function5f40: ; 5f40
	ld de, $a9
	add hl, de
	call DisplayGameTime
	ret
; 5f48

Function5f48: ; 5f48
	ld de, $a9
	add hl, de
	ld de, .text_5f53
	call PlaceString
	ret

.text_5f53
	db " ???@"
; 5f58

DisplayBadgeCount: ; 5f58
	push hl
	ld hl, JohtoBadges
	ld b, $2
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 2
	jp PrintNum
; 5f6b

DisplayPokedexNumCaught: ; 5f6b
	ld a, [StatusFlags]
	bit 0, a
	ret z
	push hl
	ld hl, PokedexCaught
	ld b, $20
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum
; 5f84

DisplayGameTime: ; 5f84
	ld de, GameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], $6d
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 5f99


OakSpeech: ; 0x5f99
	callba InitClock
	call Function4dd
	call ClearTileMap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call Function4a3
	call FadeToWhite
	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_1C
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText1
	call PrintText
	call FadeToWhite
	call ClearTileMap

	ld a, WOOPER
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [TempMonDVs], a
	ld [TempMonDVs + 1], a

	ld b, SCGB_1C
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText
	ld hl, OakText4
	call PrintText
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_1C
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText5
	call PrintText
	call FadeToWhite
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	callba DrawIntroPlayerPic

	ld b, SCGB_1C
	call GetSGBLayout
	call Intro_FadeInFrontpic

	ld hl, OakText6
	call PrintText
	call NamePlayer
	ld hl, OakText7
	call PrintText
	ret

OakText1: ; 0x6045
	text_jump _OakText1
	db "@"

OakText2: ; 0x604a
	text_jump _OakText2
	start_asm
	ld a, WOOPER
	call PlayCry
	call WaitSFX
	ld hl, OakText3
	ret

OakText3: ; 0x605b
	text_jump _OakText3
	db "@"

OakText4: ; 0x6060
	text_jump _OakText4
	db "@"

OakText5: ; 0x6065
	text_jump _OakText5
	db "@"

OakText6: ; 0x606a
	text_jump _OakText6
	db "@"

OakText7: ; 0x606f
	text_jump _OakText7
	db "@"

NamePlayer: ; 0x6074
	callba MovePlayerPicRight
	callba ShowPlayerNamingChoices
	ld a, [MenuSelection2]
	dec a
	jr z, .NewName
	call StorePlayerName
	callba Function8c1d
	callba MovePlayerPicLeft
	ret

.NewName
	ld b, 1
	ld de, PlayerName
	callba NamingScreen

	call FadeToWhite
	call ClearTileMap

	call LoadFontsExtra
	call WaitBGMap

	xor a
	ld [CurPartySpecies], a
	callba DrawIntroPlayerPic

	ld b, SCGB_1C
	call GetSGBLayout
	call Function4f0

	ld hl, PlayerName
	ld de, .Chris
	ld a, [PlayerGender]
	bit 0, a
	jr z, .Male
	ld de, .Kris
.Male
	call InitName
	ret

.Chris
	db "CHRIS@@@@@@"
.Kris
	db "KRIS@@@@@@@"
; 60e9

Function60e9: ; Unreferenced
	call LoadMenuDataHeader
	call InterpretMenu2
	ld a, [MenuSelection2]
	dec a
	call CopyNameFromMenu
	call WriteBackup
	ret
; 60fa

StorePlayerName: ; 60fa
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, PlayerName
	call ByteFill
	ld hl, PlayerName
	ld de, StringBuffer2
	call CopyName2
	ret
; 610f

ShrinkPlayer: ; 610f

	ld a, [hROMBank]
	push af

	ld a, 0 << 7 | 32 ; fade out
	ld [MusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a

	ld de, SFX_ESCAPE_ROPE
	call PlaySFX
	pop af
	rst Bankswitch

	ld c, 8
	call DelayFrames

	ld hl, Shrink1Pic
	ld b, BANK(Shrink1Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	ld hl, Shrink2Pic
	ld b, BANK(Shrink2Pic)
	call ShrinkFrame

	ld c, 8
	call DelayFrames

	hlcoord 6, 5
	ld b, 7
	ld c, 7
	call ClearBox

	ld c, 3
	call DelayFrames

	call Intro_PlacePlayerSprite
	call LoadFontsExtra

	ld c, 50
	call DelayFrames

	call FadeToWhite
	call ClearTileMap
	ret
; 616a

Intro_FadeInFrontpic: ; 616a
	ld hl, IntroFadePalettes
	ld b, IntroFadePalettesEnd - IntroFadePalettes
.loop
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret
; 617c

IntroFadePalettes: ; 0x617c
	db %01010100
	db %10101000
	db %11111100
	db %11111000
	db %11110100
	db %11100100
IntroFadePalettesEnd
; 6182

Intro_WipeInFrontpic: ; 6182
	ld a, $77
	ld [hWX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
.loop
	call DelayFrame
	ld a, [hWX]
	sub $8
	cp -1
	ret z
	ld [hWX], a
	jr .loop
; 619c

Intro_PrepTrainerPic: ; 619c
	ld de, VTiles2
	callba GetTrainerPic
	xor a
	ld [hFillBox], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef FillBox
	ret
; 61b4

ShrinkFrame: ; 61b4
	ld de, VTiles2
	ld c, $31
	predef DecompressPredef
	xor a
	ld [hFillBox], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef FillBox
	ret
; 61cd

Intro_PlacePlayerSprite: ; 61cd

	callba GetPlayerIcon
	ld c, $c
	ld hl, VTiles0
	call Request2bpp

	ld hl, Sprites
	ld de, .sprites
	ld a, [de]
	inc de

	ld c, a
.loop
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a

	ld b, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .male
	ld b, 1
.male
	ld a, b

	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 61fe

.sprites ; 61fe
	db 4
	db $4c, $48, 0
	db $4c, $50, 1
	db $54, $48, 2
	db $54, $50, 3
; 620b


Function620b: ; 620b
	callab Functione4579
	jr c, Function6219
	callba CrystalIntro

Function6219: ; 6219
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call TitleScreen
	call DelayFrame
.loop
	call Function627b
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

	pop af
	ld [rSVBK], a

	ld hl, rLCDC
	res 2, [hl]
	call ClearScreen
	call Function3200
	xor a
	ld [hLCDStatCustom], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld b, SCGB_08
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wcf64]
	cp $5
	jr c, .ok
	xor a
.ok
	ld e, a
	ld d, 0
	ld hl, .jumptable_626a
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 626a

.jumptable_626a
	dw Function5ae8
	dw Function6389
	dw Function620b
	dw Function620b
	dw ResetClock
; 6274


TitleScreen: ; 6274
	callba _TitleScreen
	ret
; 627b

Function627b: ; 627b
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	callba SuicuneFrameIterator
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret
; 6292

Function6292: ; 6292 ; unreferenced
	ld a, [hVBlankCounter]
	and $7
	ret nz
	ld hl, LYOverrides + $5f
	ld a, [hl]
	dec a
	ld bc, 2 * SCREEN_WIDTH
	call ByteFill
	ret
; 62a3

TitleScreenScene: ; 62a3
	ld e, a
	ld d, 0
	ld hl, .scenes
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 62af

.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd
; 62b7

Function62b7: ; Unreferenced
	ld hl, wJumptableIndex
	inc [hl]
	ret
; 62bc


TitleScreenEntrance: ; 62bc

; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ld a, [hSCX]
	and a
	jr z, .done
	sub 4
	ld [hSCX], a

; Lay out a base (all lines scrolling together).
	ld e, a
	ld hl, LYOverrides
	ld bc, 8 * 10 ; logo height
	call ByteFill

; Reversed signage for every other line's position.
; This is responsible for the interlaced effect.
	ld a, e
	xor -1
	inc a

	ld b, 8 * 10 / 2 ; logo height / 2
	ld hl, LYOverrides + 1
.loop
	ld [hli], a
	inc hl
	dec b
	jr nz, .loop

	callba AnimateTitleCrystal
	ret

.done
; Next scene
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ld [hLCDStatCustom], a

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

	ld a, $88
	ld [hWY], a
	ret
; 62f6


TitleScreenTimer: ; 62f6

; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wcf65
	ld de, $1140 ; 73.6 seconds
	ld [hl], e
	inc hl
	ld [hl], d
	ret
; 6304

TitleScreenMain: ; 6304

; Run the timer down.
	ld hl, wcf65
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld a, e
	or d
	jr z, .end

	dec de
	ld [hl], d
	dec hl
	ld [hl], e

; Save data can be deleted by pressing Up + B + Select.
	call GetJoypad
	ld hl, hJoyDown
	ld a, [hl]
	and D_UP + B_BUTTON + SELECT
	cp  D_UP + B_BUTTON + SELECT
	jr z, .delete_save_data

; To bring up the clock reset dialog:

; Hold Down + B + Select to initiate the sequence.
	ld a, [$ffeb]
	cp $34
	jr z, .check_clock_reset

	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr nz, .check_start

	ld a, $34
	ld [$ffeb], a
	jr .check_start

; Keep Select pressed, and hold Left + Up.
; Then let go of Select.
.check_clock_reset
	bit 2, [hl] ; SELECT
	jr nz, .check_start

	xor a
	ld [$ffeb], a

	ld a, [hl]
	and D_LEFT + D_UP
	cp  D_LEFT + D_UP
	jr z, .clock_reset

; Press Start or A to start the game.
.check_start
	ld a, [hl]
	and START | A_BUTTON
	jr nz, .incave
	ret

.incave
	ld a, 0
	jr .done

.delete_save_data
	ld a, 1

.done
	ld [wcf64], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a
	ld [MusicFadeIDLo], a
	ld [MusicFadeIDHi], a
	ld hl, MusicFade
	ld [hl], 8 ; 1 second

	ld hl, wcf65
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wcf64], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6375

TitleScreenEnd: ; 6375

; Wait until the music is done fading.

	ld hl, wcf65
	inc [hl]

	ld a, [MusicFade]
	and a
	ret nz

	ld a, 2
	ld [wcf64], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 6389

Function6389: ; 6389
	callba Function4d54c
	jp Init
; 6392

ResetClock: ; 6392
	callba _ResetClock
	jp Init
; 639b

Function639b: ; unreferenced
	; If bit 0 or 1 of [wcf65] is set, we don't need to be here.
	ld a, [wcf65]
	and $3
	ret nz
	ld bc, SpriteAnim10
	ld hl, SpriteAnim10FrameIndex - SpriteAnim10
	add hl, bc ; over-the-top compicated way to load wc3ae into hl
	ld l, [hl]
	ld h, 0
rept 2
	add hl, hl
endr
	ld de, Data63ca
	add hl, de
	; If bit 2 of [wcf65] is set, get the second dw; else, get the first dw
	ld a, [wcf65]
	and %00000100
rept 2
	srl a
endr
	ld e, a
	ld d, 0
rept 2
	add hl, de
endr
	ld a, [hli]
	and a
	ret z
	ld e, a
	ld d, [hl]
	ld a, SPRITE_ANIM_INDEX_01
	call _InitSpriteAnimStruct
	ret
; 63ca

Data63ca: ; 63ca
; frame 0 y, x; frame 1 y, x
	db $5c, $50, $00, $00
	db $5c, $68, $5c, $58
	db $5c, $68, $5c, $78
	db $5c, $88, $5c, $78
	db $00, $00, $5c, $78
	db $00, $00, $5c, $58
; 63e2

Copyright: ; 63e2
	call ClearTileMap
	call LoadFontsExtra
	ld de, CopyrightGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(CopyrightGFX), $1d
	call Request2bpp
	hlcoord 2, 7
	ld de, CopyrightString
	jp PlaceString
; 63fd

CopyrightString: ; 63fd
	; ©1995-2001 Nintendo
	db $60, $61, $62, $63, $64, $65, $66
	db $67, $68, $69, $6a, $6b, $6c

	db $4e

	; ©1995-2001 Creatures inc.
	db $60, $61, $62, $63, $64, $65, $66, $6d
	db $6e, $6f, $70, $71, $72, $7a, $7b, $7c

	db $4e

	; ©1995-2001 GAME FREAK inc.
	db $60, $61, $62, $63, $64, $65, $66, $73, $74
	db $75, $76, $77, $78, $79, $7a, $7b, $7c

	db "@"
; 642e

GameInit:: ; 642e
	callba Function14f1c
	call ResetTextRelatedRAM
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	jp Function620b
; 6454

Function6454:: ; 6454
	call DelayFrame
	ld a, [hOAMUpdate]
	push af

	ld a, $1
	ld [hOAMUpdate], a
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	call Function6473

	pop af
	ld [hBGMapMode], a
	pop af
	ld [hOAMUpdate], a
	ld hl, VramState
	set 6, [hl]
	ret
; 6473

Function6473: ; 6473
	xor a
	ld [hLCDStatCustom], a
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	call OverworldTextModeSwitch
	ld a, VBGMap1 / $100
	call Function64b9
	call Function2e20
	callba Function49409
	callba Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	callba Function64db ; no need to farcall
	ld a, VBGMap0 / $100
	call Function64b9
	xor a
	ld [wBGMapAnchor], a
	ld a, VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	call Function5958
	ret
; 64b9

Function64b9: ; 64b9
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ret
; 64bf

Function64bf:: ; 64bf
	ld a, [hOAMUpdate]
	push af
	ld a, $1
	ld [hOAMUpdate], a

	call Function64cd

	pop af
	ld [hOAMUpdate], a
	ret
; 64cd

Function64cd: ; 64cd
	call LoadFontsExtra
	ld a, $90
	ld [hWY], a
	call Function2e31
	call LoadStandardFont
	ret
; 64db

Function64db: ; 64db
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, $60
	ld hl, w6_d000
	lb bc, 4, 0
	call ByteFill
	ld a, w6_d000 / $100
	ld [rHDMA1], a
	ld a, w6_d000 % $100
	ld [rHDMA2], a
	ld a, (VBGMap0 % $8000) / $100
	ld [rHDMA3], a
	ld a, (VBGMap0 % $8000) % $100
	ld [rHDMA4], a
	ld a, $3f
	ld [hDMATransfer], a
	call DelayFrame

	pop af
	ld [rSVBK], a
	ret
; 6508

LearnMove: ; 6508
	call LoadTileMapToTempTileMap
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.loop
	ld hl, PartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld b, NUM_MOVES
.next
	ld a, [hl]
	and a
	jr z, .learn
	inc hl
	dec b
	jr nz, .next

	push de
	call ForgetMove
	pop de
	jp c, .cancel

	push hl
	push de
	ld [wd265], a

	ld b, a
	ld a, [wBattleMode]
	and a
	jr z, .not_disabled
	ld a, [DisabledMove]
	cp b
	jr nz, .not_disabled
	xor a
	ld [DisabledMove], a
	ld [PlayerDisableCount], a
.not_disabled

	call GetMoveName
	ld hl, UnknownText_0x6684
	call PrintText
	pop de
	pop hl

.learn
	ld a, [wd262]
	ld [hl], a
	ld bc, MON_PP - MON_MOVES
	add hl, bc

	push hl
	push de
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop de
	pop hl

	ld [hl], a

	ld a, [wBattleMode]
	and a
	jp z, .learned

	ld a, [CurPartyMon]
	ld b, a
	ld a, [CurBattleMon]
	cp b
	jp nz, .learned

	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	jp nz, .learned

	ld h, d
	ld l, e
	ld de, BattleMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld bc, PartyMon1PP - (PartyMon1Moves + NUM_MOVES)
	add hl, bc
	ld de, BattleMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	jp .learned

.cancel
	ld hl, UnknownText_0x6675
	call PrintText
	call YesNoBox
	jp c, .loop

	ld hl, UnknownText_0x667a
	call PrintText
	ld b, 0
	ret

.learned
	ld hl, UnknownText_0x666b
	call PrintText
	ld b, 1
	ret
; 65d3

ForgetMove: ; 65d3
	push hl
	ld hl, UnknownText_0x667f
	call PrintText
	call YesNoBox
	pop hl
	ret c
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
.loop
	push hl
	ld hl, UnknownText_0x6670
	call PrintText
	hlcoord 5, 2
	ld b, NUM_MOVES * 2
	ld c, MOVE_NAME_LENGTH
	call TextBox
	hlcoord 5 + 2, 2 + 2
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	predef ListMoves
	ld a, $4
	ld [wcfa1], a
	ld a, $6
	ld [wcfa2], a
	ld a, [wd0eb]
	inc a
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld [MenuSelection2], a
	ld [wcfaa], a
	ld a, $3
	ld [wcfa8], a
	ld a, $20
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	ld a, $20
	ld [wcfa7], a
	call Function1bc9
	push af
	call Call_LoadTempTileMapToTileMap
	pop af
	pop hl
	bit 1, a
	jr nz, .cancel
	push hl
	ld a, [MenuSelection2]
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsHMMove
	pop bc
	pop de
	ld a, d
	jr c, .hmmove
	pop hl
	add hl, bc
	and a
	ret

.hmmove
	ld hl, UnknownText_0x669a
	call PrintText
	pop hl
	jr .loop

.cancel
	scf
	ret
; 666b

UnknownText_0x666b: ; 666b
	text_jump UnknownText_0x1c5660
	db "@"
; 6670

UnknownText_0x6670: ; 6670
	text_jump UnknownText_0x1c5678
	db "@"
; 6675

UnknownText_0x6675: ; 6675
	text_jump UnknownText_0x1c5699
	db "@"
; 667a

UnknownText_0x667a: ; 667a
	text_jump UnknownText_0x1c56af
	db "@"
; 667f

UnknownText_0x667f: ; 667f
	text_jump UnknownText_0x1c56c9
	db "@"
; 6684

UnknownText_0x6684: ; 6684
	text_jump UnknownText_0x1c5740
	start_asm
	push de
	ld de, SFX_SWITCH_POKEMON
	call PlaySFX
	pop de
	ld hl, UnknownText_0x6695
	ret
; 6695

UnknownText_0x6695: ; 6695
	text_jump UnknownText_0x1c574e
	db "@"
; 669a

UnknownText_0x669a: ; 669a
	text_jump UnknownText_0x1c5772
	db "@"
; 669f


CheckNickErrors:: ; 669f
; error-check monster nick before use
; must be a peace offering to gamesharkers

; input: de = nick location

	push bc
	push de
	ld b, PKMN_NAME_LENGTH

.checkchar
; end of nick?
	ld a, [de]
	cp "@" ; terminator
	jr z, .end

; check if this char is a text command
	ld hl, .textcommands
	dec hl
.loop
; next entry
	inc hl
; reached end of commands table?
	ld a, [hl]
	cp a, -1
	jr z, .done

; is the current char between this value (inclusive)...
	ld a, [de]
	cp [hl]
	inc hl
	jr c, .loop
; ...and this one?
	cp [hl]
	jr nc, .loop

; replace it with a "?"
	ld a, "?"
	ld [de], a
	jr .loop

.done
; next char
	inc de
; reached end of nick without finding a terminator?
	dec b
	jr nz, .checkchar

; change nick to "?@"
	pop de
	push de
	ld a, "?"
	ld [de], a
	inc de
	ld a, "@"
	ld [de], a
.end
; if the nick has any errors at this point it's out of our hands
	pop de
	pop bc
	ret
; 66cf

.textcommands ; 66cf
; table defining which characters are actually text commands
; format:
	;   ≥    <
	db $00, $05
	db $14, $19
	db $1d, $26
	db $35, $3a
	db $3f, $40
	db $49, $5d
	db $5e, $7f
	db $ff ; end
; 66de


_Multiply:: ; 66de

; hMultiplier is one byte.
	ld a, 8
	ld b, a

	xor a
	ld [hMultiplicand - 1], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a


.loop
	ld a, [hMultiplier]
	srl a
	ld [hMultiplier], a
	jr nc, .next

	ld a, [hMathBuffer + 4]
	ld c, a
	ld a, [hMultiplicand + 2]
	add c
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	ld c, a
	ld a, [hMultiplicand + 1]
	adc c
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	ld c, a
	ld a, [hMultiplicand + 0]
	adc c
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	ld c, a
	ld a, [hMultiplicand - 1]
	adc c
	ld [hMathBuffer + 1], a

.next
	dec b
	jr z, .done


; hMultiplicand <<= 1

	ld a, [hMultiplicand + 2]
	add a
	ld [hMultiplicand + 2], a

	ld a, [hMultiplicand + 1]
	rla
	ld [hMultiplicand + 1], a

	ld a, [hMultiplicand + 0]
	rla
	ld [hMultiplicand + 0], a

	ld a, [hMultiplicand - 1]
	rla
	ld [hMultiplicand - 1], a

	jr .loop


.done
	ld a, [hMathBuffer + 4]
	ld [hProduct + 3], a

	ld a, [hMathBuffer + 3]
	ld [hProduct + 2], a

	ld a, [hMathBuffer + 2]
	ld [hProduct + 1], a

	ld a, [hMathBuffer + 1]
	ld [hProduct + 0], a

	ret
; 673e


_Divide:: ; 673e
	xor a
	ld [hMathBuffer + 0], a
	ld [hMathBuffer + 1], a
	ld [hMathBuffer + 2], a
	ld [hMathBuffer + 3], a
	ld [hMathBuffer + 4], a

	ld a, 9
	ld e, a

.loop
	ld a, [hMathBuffer + 0]
	ld c, a
	ld a, [hDividend + 1]
	sub c
	ld d, a

	ld a, [hDivisor]
	ld c, a
	ld a, [hDividend + 0]
	sbc c
	jr c, .asm_6767

	ld [hDividend + 0], a

	ld a, d
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 4]
	inc a
	ld [hMathBuffer + 4], a

	jr .loop

.asm_6767
	ld a, b
	cp 1
	jr z, .done

	ld a, [hMathBuffer + 4]
	add a
	ld [hMathBuffer + 4], a

	ld a, [hMathBuffer + 3]
	rla
	ld [hMathBuffer + 3], a

	ld a, [hMathBuffer + 2]
	rla
	ld [hMathBuffer + 2], a

	ld a, [hMathBuffer + 1]
	rla
	ld [hMathBuffer + 1], a

	dec e
	jr nz, .asm_6798

	ld e, 8
	ld a, [hMathBuffer + 0]
	ld [hDivisor], a
	xor a
	ld [hMathBuffer + 0], a

	ld a, [hDividend + 1]
	ld [hDividend + 0], a

	ld a, [hDividend + 2]
	ld [hDividend + 1], a

	ld a, [hDividend + 3]
	ld [hDividend + 2], a

.asm_6798
	ld a, e
	cp 1
	jr nz, .asm_679e
	dec b

.asm_679e
	ld a, [hDivisor]
	srl a
	ld [hDivisor], a

	ld a, [hMathBuffer + 0]
	rr a
	ld [hMathBuffer + 0], a

	jr .loop

.done
	ld a, [hDividend + 1]
	ld [hDivisor], a

	ld a, [hMathBuffer + 4]
	ld [hDividend + 3], a

	ld a, [hMathBuffer + 3]
	ld [hDividend + 2], a

	ld a, [hMathBuffer + 2]
	ld [hDividend + 1], a

	ld a, [hMathBuffer + 1]
	ld [hDividend + 0], a

	ret
; 67c1


ItemAttributes: ; 67c1
INCLUDE "items/item_attributes.asm"
; 6ec1


Function6ec1: ; 6ec1

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 5, [hl]
	jr z, .not_bit_5

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 4, [hl] ; lost
	push hl
	push bc
	call Function6f2c
	pop bc
	pop hl
	ret c
	jr .resume

.not_bit_5
	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 4, [hl]
	jr nz, .resume
	push hl
	push bc
	call Function6f07
	pop bc
	pop hl
	ret c

.resume
	bit 6, [hl]
	jr nz, .bit_6

	push hl
	push bc
	call WillPersonBumpIntoSomeoneElse
	pop bc
	pop hl
	ret c

.bit_6
	bit 5, [hl]
	jr nz, .bit_5
	push hl
	call HasPersonReachedMovementLimit
	pop hl
	ret c

	push hl
	call IsPersonMovingOffEdgeOfScreen
	pop hl
	ret c

.bit_5
	and a
	ret
; 6f07


Function6f07: ; 6f07
	call Function6f5f
	ret c
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 7, [hl]
	jp nz, Function6fa1
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	ld d, a
	call GetTileCollision
	and a
	jr z, Function6f3e
	scf
	ret
; 6f2c

Function6f2c: ; 6f2c
	call Function6f5f
	ret c
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call GetTileCollision
	cp $1
	jr z, Function6f3e
	scf
	ret
; 6f3e

Function6f3e: ; 6f3e
	ld hl, OBJECT_NEXT_TILE
	add hl, bc
	ld a, [hl]
	call Function6f7f
	ret nc
	push af
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and 3
	ld e, a
	ld d, 0
	ld hl, .data_6f5b
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret
; 6f5b

.data_6f5b
	db 1 << DOWN, 1 << UP, 1 << RIGHT, 1 << LEFT
; 6f5f

Function6f5f: ; 6f5f
	ld hl, OBJECT_STANDING_TILE
	add hl, bc
	ld a, [hl]
	call Function6f7f
	ret nc
	push af
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	and 3
	ld e, a
	ld d, 0
	ld hl, .data_6f7b
	add hl, de
	pop af
	and [hl]
	ret z
	scf
	ret
; 6f7b

.data_6f7b
	db 1 << UP, 1 << DOWN, 1 << LEFT, 1 << RIGHT
; 6f7f

Function6f7f: ; 6f7f
	ld d, a
	and $f0
	cp $b0
	jr z, .done
	cp $c0
	jr z, .done
	xor a
	ret

.done
	ld a, d
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_6f99
	add hl, de
	ld a, [hl]
	scf
	ret
; 6f99

.data_6f99
	db 8, 4, 1, 2
	db 10, 6, 9, 5
; 6fa1

Function6fa1: ; 6fa1
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	and 3
	jr z, .asm_6fb2
	dec a
	jr z, .asm_6fb7
	dec a
	jr z, .asm_6fbb
	jr .asm_6fbf

.asm_6fb2
	inc e
	push de
	inc d
	jr .asm_6fc2

.asm_6fb7
	push de
	inc d
	jr .asm_6fc2

.asm_6fbb
	push de
	inc e
	jr .asm_6fc2

.asm_6fbf
	inc d
	push de
	inc e

.asm_6fc2
	call GetCoordTile
	call GetTileCollision
	pop de
	and a
	jr nz, .asm_6fd7
	call GetCoordTile
	call GetTileCollision
	and a
	jr nz, .asm_6fd7
	xor a
	ret

.asm_6fd7
	scf
	ret
; 6fd9



CheckFacingObject:: ; 6fd9

	call GetFacingTileCoord

; Double the distance for counter tiles.
	call CheckCounterTile
	jr nz, .asm_6ff1

	ld a, [PlayerNextMapX]
	sub d
	cpl
	inc a
	add d
	ld d, a

	ld a, [PlayerNextMapY]
	sub e
	cpl
	inc a
	add e
	ld e, a

.asm_6ff1
	ld bc, ObjectStructs ; redundant
	ld a, 0
	ld [hMapObjectIndexBuffer], a
	call IsNPCAtCoord
	ret nc
	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .standing
	xor a
	ret

.standing
	scf
	ret
; 7009


WillPersonBumpIntoSomeoneElse: ; 7009
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	jr IsNPCAtCoord
; 7015

Function7015: ; unreferenced
	ld a, [hMapObjectIndexBuffer]
	call GetObjectStruct
	call .CheckWillBeFacingNPC
	call IsNPCAtCoord
	ret

.CheckWillBeFacingNPC: ; 7021
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	call GetSpriteDirection
	and a
	jr z, .down
	cp OW_UP
	jr z, .up
	cp OW_LEFT
	jr z, .left
	inc d
	ret

.down
	inc e
	ret

.up
	dec e
	ret

.left
	dec d
	ret
; 7041

IsNPCAtCoord: ; 7041
	ld bc, ObjectStructs
	xor a
.loop
	ld [hObjectStructIndexBuffer], a
	call GetObjectSprite
	jr z, .next

	ld hl, OBJECT_FLAGS1
	add hl, bc
	bit 7, [hl]
	jr nz, .next

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 7, [hl]
	jr z, .got

	call Function7171
	jr nc, .ok
	jr .ok2

.got
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .ok
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .ok

.ok2
	ld a, [hMapObjectIndexBuffer]
	ld l, a
	ld a, [hObjectStructIndexBuffer]
	cp l
	jr nz, .setcarry

.ok
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ld a, [hMapObjectIndexBuffer]
	ld l, a
	ld a, [hObjectStructIndexBuffer]
	cp l
	jr nz, .setcarry

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	and a
	ret

.setcarry
	scf
	ret
; 70a4

HasPersonReachedMovementLimit: ; 70a4
	ld hl, OBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	and a
	jr z, .nope
	and $f
	jr z, .check_y
	ld e, a
	ld d, a
	ld hl, OBJECT_INIT_X
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .yes
	cp e
	jr z, .yes

.check_y
	ld hl, OBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	swap a
	and $f
	jr z, .nope
	ld e, a
	ld d, a
	ld hl, OBJECT_INIT_Y
	add hl, bc
	ld a, [hl]
	sub d
	ld d, a
	ld a, [hl]
	add e
	ld e, a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp d
	jr z, .yes
	cp e
	jr z, .yes

.nope
	xor a
	ret

.yes
	scf
	ret
; 70ed

IsPersonMovingOffEdgeOfScreen: ; 70ed
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [XCoord]
	cp [hl]
	jr z, .check_y
	jr nc, .yes
	add $9
	cp [hl]
	jr c, .yes

.check_y
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [YCoord]
	cp [hl]
	jr z, .nope
	jr nc, .yes
	add $8
	cp [hl]
	jr c, .yes

.nope
	and a
	ret

.yes
	scf
	ret
; 7113

Function7113: ; unreferenced
	ld a, [PlayerNextMapX]
	ld d, a
	ld a, [PlayerNextMapY]
	ld e, a
	ld bc, ObjectStructs
	xor a
.loop
	ld [hObjectStructIndexBuffer], a
	call GetObjectSprite
	jr z, .next
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, bc
	ld a, [hl]
	cp SPRITEMOVEDATA_SNORLAX
	jr nz, .not_snorlax
	call Function7171
	jr c, .yes
	jr .next

.not_snorlax
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .check_current_coords
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .check_current_coords
	ld a, [hObjectStructIndexBuffer]
	cp $0
	jr z, .next
	jr .yes

.check_current_coords
	ld hl, OBJECT_MAP_Y
	add hl, bc
	ld a, [hl]
	cp e
	jr nz, .next
	ld hl, OBJECT_MAP_X
	add hl, bc
	ld a, [hl]
	cp d
	jr nz, .next
	jr .yes

.next
	ld hl, OBJECT_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	xor a
	ret

.yes
	scf
	ret
; 7171


Function7171: ; 7171
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, d
	sub [hl]
	jr c, .nope
	cp $2
	jr nc, .nope
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, e
	sub [hl]
	jr c, .nope
	cp $2
	jr nc, .nope
	scf
	ret

.nope
	and a
	ret
; 718d

GetFirstPokemonHappiness: ; 718d
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, PartySpecies
.loop
	ld a, [de]
	cp EGG
	jr nz, .done
	inc de
	add hl, bc
	jr .loop

.done
	ld [wd265], a
	ld a, [hl]
	ld [ScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3
; 71ac

CheckFirstMonIsEgg: ; 71ac
	ld a, [PartySpecies]
	ld [wd265], a
	cp EGG
	ld a, $1
	jr z, .egg
	xor a

.egg
	ld [ScriptVar], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3
; 71c2


ChangeHappiness: ; 71c2
; Perform happiness action c on CurPartyMon

	ld a, [CurPartyMon]
	inc a
	ld e, a
	ld d, 0
	ld hl, PartySpecies - 1
	add hl, de
	ld a, [hl]
	cp EGG
	ret z

	push bc
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	pop bc

	ld d, h
	ld e, l

	push de
	ld a, [de]
	cp 100
	ld e, 0
	jr c, .ok
	inc e
	cp 200
	jr c, .ok
	inc e

.ok
	dec c
	ld b, 0
	ld hl, .Actions
rept 3
	add hl, bc
endr
	ld d, 0
	add hl, de
	ld a, [hl]
	cp 100
	pop de

	ld a, [de]
	jr nc, .negative
	add [hl]
	jr nc, .done
	ld a, -1
	jr .done

.negative
	add [hl]
	jr c, .done
	xor a

.done
	ld [de], a
	ld a, [wBattleMode]
	and a
	ret z
	ld a, [CurPartyMon]
	ld b, a
	ld a, [wd0d8]
	cp b
	ret nz
	ld a, [de]
	ld [BattleMonHappiness], a
	ret
; 7221

.Actions
	db  +5,  +3,  +2 ; Gained a level
	db  +5,  +3,  +2 ; Vitamin
	db  +1,  +1,  +0 ; X Item
	db  +3,  +2,  +1 ; Battled a Gym Leader
	db  +1,  +1,  +0 ; Learned a move
	db  -1,  -1,  -1 ; Lost to an enemy
	db  -5,  -5, -10 ; Fainted due to poison
	db  -5,  -5, -10 ; Lost to a much stronger enemy
	db  +1,  +1,  +1 ; Haircut (Y1)
	db  +3,  +3,  +1 ; Haircut (Y2)
	db  +5,  +5,  +2 ; Haircut (Y3)
	db  +1,  +1,  +1 ; Haircut (O1)
	db  +3,  +3,  +1 ; Haircut (O2)
	db +10, +10,  +4 ; Haircut (O3)
	db  -5,  -5, -10 ; Used Heal Powder or Energypowder (bitter)
	db -10, -10, -15 ; Used Energy Root (bitter)
	db -15, -15, -20 ; Used Revival Herb (bitter)
	db  +3,  +3,  +1 ; Grooming
	db +10,  +6,  +4 ; Gained a level in the place where it was caught
; 725a


StepHappiness:: ; 725a
; Raise the party's happiness by 1 point every other step cycle.

	ld hl, wdc77
	ld a, [hl]
	inc a
	and 1
	ld [hl], a
	ret nz

	ld de, PartyCount
	ld a, [de]
	and a
	ret z

	ld c, a
	ld hl, PartyMon1Happiness
.loop
	inc de
	ld a, [de]
	cp EGG
	jr z, .next
	inc [hl]
	jr nz, .next
	ld [hl], $ff

.next
	push de
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	pop de
	dec c
	jr nz, .loop
	ret
; 7282


DaycareStep:: ; 7282

	ld a, [wDaycareMan]
	bit 0, a
	jr z, .asm_72a4

	ld a, [wBreedMon1Level] ; level
	cp 100
	jr nc, .asm_72a4
	ld hl, wBreedMon1Exp + 2 ; exp
	inc [hl]
	jr nz, .asm_72a4
	dec hl
	inc [hl]
	jr nz, .asm_72a4
	dec hl
	inc [hl]
	ld a, [hl]
	cp $50
	jr c, .asm_72a4
	ld a, $50
	ld [hl], a

.asm_72a4
	ld a, [wDaycareLady]
	bit 0, a
	jr z, .asm_72c6

	ld a, [wBreedMon2Level] ; level
	cp 100
	jr nc, .asm_72c6
	ld hl, wBreedMon2Exp + 2 ; exp
	inc [hl]
	jr nz, .asm_72c6
	dec hl
	inc [hl]
	jr nz, .asm_72c6
	dec hl
	inc [hl]
	ld a, [hl]
	cp $50
	jr c, .asm_72c6
	ld a, $50
	ld [hl], a

.asm_72c6
	ld hl, wDaycareMan
	bit 5, [hl] ; egg
	ret z
	ld hl, wStepsToEgg
	dec [hl]
	ret nz

	call Random
	ld [hl], a
	callab Function16e1d
	ld a, [wd265]
	cp $e6
	ld b, $50
	jr nc, .asm_72f8
	ld a, [wd265]
	cp $aa
	ld b, $28
	jr nc, .asm_72f8
	ld a, [wd265]
	cp $6e
	ld b, $1e
	jr nc, .asm_72f8
	ld b, $a

.asm_72f8
	call Random
	cp b
	ret nc
	ld hl, wDaycareMan
	res 5, [hl]
	set 6, [hl]
	ret
; 7305


SpecialGiveShuckle: ; 7305

; Adding to the party.
	xor a
	ld [MonType], a

; Level 15 Shuckle.
	ld a, SHUCKLE
	ld [CurPartySpecies], a
	ld a, 15
	ld [CurPartyLevel], a

	predef TryAddMonToParty
	jr nc, .NotGiven

; Caught data.
	ld b, 0
	callba SetPartymonCaughtData

; Holding a Berry.
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	dec a
	push af
	push bc
	ld hl, PartyMon1Item
	call AddNTimes
	ld [hl], BERRY
	pop bc
	pop af

; OT ID.
	ld hl, PartyMon1ID
	call AddNTimes
	ld a, $2
	ld [hli], a
	ld [hl], $6

; Nickname.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld de, SpecialShuckleNick
	call CopyName2

; OT.
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
	call CopyName2

; Engine flag for this event.
	ld hl, DailyFlags
	set 5, [hl]
; setflag ENGINE_SHUCKLE_GIVEN
	ld a, 1
	ld [ScriptVar], a
	ret

.NotGiven
	xor a
	ld [ScriptVar], a
	ret

SpecialShuckleOT:
	db "MANIA@"
SpecialShuckleNick:
	db "SHUCKIE@"
; 737e


SpecialReturnShuckle: ; 737e
	callba SelectMonFromParty
	jr c, .refused

	ld a, [CurPartySpecies]
	cp SHUCKLE
	jr nz, .DontReturn

	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

; OT ID
; 00518
	ld a, [hli]
	cp 00518 / $100
	jr nz, .DontReturn
	ld a, [hl]
	cp 00518 % $100
	jr nz, .DontReturn

; OT
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld de, SpecialShuckleOT
.CheckOT
	ld a, [de]
	cp [hl]
	jr nz, .DontReturn
	cp "@"
	jr z, .done
	inc de
	inc hl
	jr .CheckOT

.done
	callba CheckCurPartyMonFainted
	jr c, .fainted
	ld a, [CurPartyMon]
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp 150
	ld a, $3
	jr nc, .HappyToStayWithYou
	xor a ; take from pc
	ld [wPokemonWithdrawDepositParameter], a
	callab Functione039
	ld a, $2

.HappyToStayWithYou
	ld [ScriptVar], a
	ret

.refused
	ld a, $1
	ld [ScriptVar], a
	ret

.DontReturn
	xor a
	ld [ScriptVar], a
	ret

.fainted
	ld a, $4
	ld [ScriptVar], a
	ret
; 73f7

Special_BillsGrandfather: ; 73f7
	callba SelectMonFromParty
	jr c, .cancel
	ld a, [CurPartySpecies]
	ld [ScriptVar], a
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	jp CopyPokemonName_Buffer1_Buffer3

.cancel
	xor a
	ld [ScriptVar], a
	ret
; 7413

Special_YoungerHaircutBrother: ; 7413
	ld hl, Data_YoungerHaircutBrother
	jr MassageOrHaircut

Special_OlderHaircutBrother: ; 7418
	ld hl, Data_OlderHaircutBrother
	jr MassageOrHaircut

Special_DaisyMassage: ; 741d
	ld hl, Data_DaisyMassage

MassageOrHaircut: ; 7420
	push hl
	callba SelectMonFromParty
	pop hl
	jr c, .nope
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	push hl
	call GetCurNick
	call CopyPokemonName_Buffer1_Buffer3
	pop hl
	call Random
; Bug: Subtracting $ff from $ff fails to set c.
; This can result in overflow into the next data array.
; In the case of getting a massage from Daisy, we bleed
; into CopyPokemonName_Buffer1_Buffer3, which passes
; $d0 to ChangeHappiness and returns $73 to the script.
; The end result is that there is a 0.4% chance your
; Pokemon's happiness will not change at all.
.loop
	sub [hl]
	jr c, .ok
rept 3
	inc hl
endr
	jr .loop

.ok
	inc hl
	ld a, [hli]
	ld [ScriptVar], a
	ld c, [hl]
	call ChangeHappiness
	ret

.nope
	xor a
	ld [ScriptVar], a
	ret

.egg
	ld a, 1
	ld [ScriptVar], a
	ret
; 7459

Data_YoungerHaircutBrother: ; 7459
	db $4c, 2, HAPPINESS_YOUNGCUT1 ; 30% chance
	db $80, 3, HAPPINESS_YOUNGCUT2 ; 20% chance
	db $ff, 4, HAPPINESS_YOUNGCUT3 ; 50% chance

Data_OlderHaircutBrother: ; 7462
	db $9a, 2, HAPPINESS_OLDERCUT1 ; 60% chance
	db $4c, 3, HAPPINESS_OLDERCUT2 ; 10% chance
	db $ff, 4, HAPPINESS_OLDERCUT3 ; 30% chance

Data_DaisyMassage: ; 746b
	db $ff, 2, HAPPINESS_MASSAGE ; 99.6% chance
; 746e

CopyPokemonName_Buffer1_Buffer3: ; 746e
	ld hl, StringBuffer1
	ld de, StringBuffer3
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
; 747a

Predef1: ; 747a
; not used
	ret
; 747b


SECTION "bank2", ROMX, BANK[$2]

Function8000: ; 8000
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, TileMapEnd - TileMap
	ld a, " "
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, AttrMapEnd - AttrMap
	ld a, $7
	call ByteFill
	call Function3200
	call SetPalettes
	ret
; 8029

GetSpawnCoord: ; 8029
	ld a, -1
	ld [wObjectFollow_Leader], a
	ld [wObjectFollow_Follower], a
	ld a, $0
	ld hl, PlayerObjectTemplate
	call Function19a6
	ld b, $0
	call PlayerSpawn_ConvertCoords
	ld a, $0
	call GetMapObject
	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ln e, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT
	ld a, [wPlayerSpriteSetupFlags]
	bit 2, a
	jr nz, .ok
	ld a, [PlayerGender]
	bit 0, a
	jr z, .ok
	ln e, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT

.ok
	ld [hl], e
	ld a, $0
	ld [hMapObjectIndexBuffer], a
	ld bc, MapObjects
	ld a, $0
	ld [hObjectStructIndexBuffer], a
	ld de, ObjectStructs
	call CopyMapObjectToObjectStruct
	ld a, PLAYER
	ld [wCenteredObject], a
	ret
; 8071

PlayerObjectTemplate: ; 8071
; A dummy map object used to initialize the player object.
; Shorter than the actual amount copied by two bytes.
; Said bytes seem to be unused.
	person_event SPRITE_CHRIS, -4, -4, SPRITEMOVEDATA_PLAYER, 15, 15, -1, -1, 0, PERSONTYPE_SCRIPT, 0, 0, -1
; 807e

CopyDECoordsToMapObject:: ; 807e
	push de
	ld a, b
	call GetMapObject
	pop de
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld [hl], d
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld [hl], e
	ret
; 808f

PlayerSpawn_ConvertCoords: ; 808f
	push bc
	ld a, [XCoord]
	add 4
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	pop bc
	call CopyDECoordsToMapObject
	ret
; 80a1


WritePersonXY:: ; 80a1
	ld a, b
	call CheckObjectVisibility
	ret c

	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [hMapObjectIndexBuffer]
	ld b, a
	call CopyDECoordsToMapObject
	and a
	ret
; 80b8

RefreshPlayerCoords: ; 80b8
	ld a, [XCoord]
	add 4
	ld d, a
	ld hl, PlayerNextMapX
	sub [hl]
	ld [hl], d
	ld hl, MapObjects + MAPOBJECT_X_COORD
	ld [hl], d
	ld hl, PlayerMapX
	ld [hl], d
	ld d, a
	ld a, [YCoord]
	add 4
	ld e, a
	ld hl, PlayerNextMapY
	sub [hl]
	ld [hl], e
	ld hl, MapObjects + MAPOBJECT_Y_COORD
	ld [hl], e
	ld hl, PlayerMapY
	ld [hl], e
	ld e, a
	ld a, [wObjectFollow_Leader]
	cp $0
	ret nz ; wtf
	ret
; 80e7


CopyObjectStruct:: ; 80e7
	call CheckObjectMask
	and a
	ret nz ; masked

	ld hl, ObjectStructs + OBJECT_STRUCT_LENGTH * 1
	ld a, 1
	ld de, OBJECT_STRUCT_LENGTH
.loop
	ld [hObjectStructIndexBuffer], a
	ld a, [hl]
	and a
	jr z, .done
	add hl, de
	ld a, [hObjectStructIndexBuffer]
	inc a
	cp NUM_OBJECT_STRUCTS
	jr nz, .loop
	scf
	ret ; overflow

.done
	ld d, h
	ld e, l
	call CopyMapObjectToObjectStruct
	ld hl, VramState
	bit 7, [hl]
	ret z

	ld hl, OBJECT_FLAGS2
	add hl, de
	set 5, [hl]
	ret
; 8116

CopyMapObjectToObjectStruct: ; 8116
	call .CopyMapObjectToTempObject
	call CopyTempObjectToObjectStruct
	ret
; 811d

.CopyMapObjectToTempObject: ; 811d
	ld a, [hObjectStructIndexBuffer]
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld [hl], a

	ld a, [hMapObjectIndexBuffer]
	ld [wTempObjectCopyMapObjectIndex], a

	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopySprite], a

	call GetSpriteVTile
	ld [wTempObjectCopySpriteVTile], a

	ld a, [hl]
	call GetSpritePalette
	ld [wTempObjectCopyPalette], a

	ld hl, MAPOBJECT_COLOR
	add hl, bc
	ld a, [hl]
	and $f0
	jr z, .skip_color_override
	swap a
	and $7 ; OAM_PALETTE
	ld [wTempObjectCopyPalette], a

.skip_color_override
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyMovement], a

	ld hl, MAPOBJECT_RANGE
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRange], a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyX], a

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyY], a

	ld hl, MAPOBJECT_RADIUS
	add hl, bc
	ld a, [hl]
	ld [wTempObjectCopyRadius], a
	ret
; 8177

InitializeVisibleSprites: ; 8177
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next

	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next

	ld a, [XCoord]
	ld d, a
	ld a, [YCoord]
	ld e, a

	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next

	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next

	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next

	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next

	push bc
	call CopyObjectStruct
	pop bc
	jp c, .ret

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 81c9

.ret: ; 81c9
	ret
; 81ca

Function81ca:: ; 81ca
	nop
	ld a, [wPlayerStepDirection]
	cp $ff
	ret z
	ld hl, .jumptable
	rst JumpTable
	ret
; 81d6

.jumptable: ; 81d6
	dw Function81e5
	dw Function81de
	dw Function8232
	dw Function8239
; 81de

Function81de: ; 81de
	ld a, [YCoord]
	sub $1
	jr Function81ea

Function81e5: ; 81e5
	ld a, [YCoord]
	add $9

Function81ea: ; 81ea
	ld d, a
	ld a, [XCoord]
	ld e, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, d
	cp [hl]
	jr nz, .next
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub e
	jr c, .next
	cp MAPOBJECT_SCREEN_WIDTH
	jr nc, .next
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 8232

Function8232: ; 8232
	ld a, [XCoord]
	sub 1
	jr Function823e

Function8239: ; 8239
	ld a, [XCoord]
	add $a

Function823e: ; 823e
	ld e, a
	ld a, [YCoord]
	ld d, a
	ld bc, MapObjects + OBJECT_LENGTH
	ld a, 1
.loop
	ld [hMapObjectIndexBuffer], a
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .next
	ld hl, MAPOBJECT_X_COORD
	add hl, bc
	ld a, e
	cp [hl]
	jr nz, .next
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp -1
	jr nz, .next
	ld hl, MAPOBJECT_Y_COORD
	add hl, bc
	ld a, [hl]
	add 1
	sub d
	jr c, .next
	cp MAPOBJECT_SCREEN_HEIGHT
	jr nc, .next
	push de
	push bc
	call CopyObjectStruct
	pop bc
	pop de

.next
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	ld a, [hMapObjectIndexBuffer]
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret
; 8286


CopyTempObjectToObjectStruct: ; 8286
	ld a, [wTempObjectCopyMapObjectIndex]
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopyMovement]
	call CopySpriteMovementData

	ld a, [wTempObjectCopyPalette]
	ld hl, OBJECT_PALETTE
	add hl, de
	or [hl]
	ld [hl], a

	ld a, [wTempObjectCopyY]
	call .InitYCoord

	ld a, [wTempObjectCopyX]
	call .InitXCoord

	ld a, [wTempObjectCopySprite]
	ld hl, OBJECT_SPRITE
	add hl, de
	ld [hl], a

	ld a, [wTempObjectCopySpriteVTile]
	ld hl, OBJECT_SPRITE_TILE
	add hl, de
	ld [hl], a

	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00

	ld hl, OBJECT_FACING_STEP
	add hl, de
	ld [hl], STANDING

	ld a, [wTempObjectCopyRadius]
	call .InitRadius

	ld a, [wTempObjectCopyRange]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a

	and a
	ret
; 82d5

.InitYCoord: ; 82d5
	ld hl, OBJECT_INIT_Y
	add hl, de
	ld [hl], a

	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], a

	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14d
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ret
; 82f1

.InitXCoord: ; 82f1
	ld hl, OBJECT_INIT_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], a
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14c
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ret
; 830d

.InitRadius: ; 830d
	ld h, a
	inc a
	and $f
	ld l, a
	ld a, h
	add $10
	and $f0
	or l
	ld hl, OBJECT_RADIUS
	add hl, de
	ld [hl], a
	ret
; 831e

TrainerWalkToPlayer: ; 831e
	ld a, [hLastTalked]
	call InitMovementBuffer
	ld a, movement_step_sleep_1
	call AppendToMovementBuffer
	ld a, [wd03f]
	dec a
	jr z, .TerminateStep
	ld a, [hLastTalked]
	ld b, a
	ld c, PLAYER
	ld d, 1
	call .GetPathToPlayer
	call DecrementMovementBufferCount

.TerminateStep
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret
; 8341

.GetPathToPlayer: ; 8341
	push de
	push bc
; get player object struct, load to de
	ld a, c
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct
	ld d, b
	ld e, c

; get last talked object struct, load to bc
	pop bc
	ld a, b
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	call GetObjectStruct

; get last talked coords, load to bc
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

; get player coords, load to de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld e, [hl]
	ld d, a

	pop af
	call ComputePathToWalkToPlayer
	ret
; 8379

Special_SurfStartStep: ; 8379
	call InitMovementBuffer
	call .GetMovementData
	call AppendToMovementBuffer
	ld a, movement_step_end
	call AppendToMovementBuffer
	ret
; 8388

.GetMovementData: ; 8388
	ld a, [PlayerDirection]
	srl a
	srl a
	and 3
	ld e, a
	ld d, 0
	ld hl, .movement_data
	add hl, de
	ld a, [hl]
	ret
; 839a

.movement_data
	slow_step_down
	slow_step_up
	slow_step_left
	slow_step_right
; 839e


FollowNotExact:: ; 839e
	push bc
	ld a, c
	call CheckObjectVisibility
	ld d, b
	ld e, c
	pop bc
	ret c

	ld a, b
	call CheckObjectVisibility
	ret c

; Person 2 is now in bc, person 1 is now in de
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a

	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld a, [hl]
	cp b
	jr z, .same_x
	jr c, .to_the_left
	inc b
	jr .continue

.to_the_left
	dec b
	jr .continue

.same_x
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld a, [hl]
	cp c
	jr z, .continue
	jr c, .below
	inc c
	jr .continue

.below
	dec c

.continue
	ld hl, OBJECT_NEXT_MAP_X
	add hl, de
	ld [hl], b
	ld a, b
	ld hl, XCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14c
	sub [hl]
	ld hl, OBJECT_SPRITE_X
	add hl, de
	ld [hl], a
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, de
	ld [hl], c
	ld a, c
	ld hl, YCoord
	sub [hl]
	and $f
	swap a
	ld hl, wd14d
	sub [hl]
	ld hl, OBJECT_SPRITE_Y
	add hl, de
	ld [hl], a
	ld a, [hObjectStructIndexBuffer]
	ld hl, OBJECT_RANGE
	add hl, de
	ld [hl], a
	ld hl, OBJECT_MOVEMENTTYPE
	add hl, de
	ld [hl], SPRITEMOVEDATA_FOLLOWNOTEXACT
	ld hl, OBJECT_STEP_TYPE
	add hl, de
	ld [hl], STEP_TYPE_00
	ret
; 8417

GetRelativeFacing:: ; 8417
; Determines which way map object e would have to turn to face map object d.  Returns carry if it's impossible for whatever reason.
	ld a, d
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld d, a
	ld a, e
	call GetMapObject
	ld hl, MAPOBJECT_OBJECT_STRUCT_ID
	add hl, bc
	ld a, [hl]
	cp NUM_OBJECT_STRUCTS
	jr nc, .carry
	ld e, a
	call .GetFacing_e_relativeto_d
	ret

.carry
	scf
	ret
; 8439

.GetFacing_e_relativeto_d: ; 8439
; Determines which way object e would have to turn to face object d.  Returns carry if it's impossible.
; load the coordinates of object d into bc
	ld a, d
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld c, [hl]
	ld b, a
	push bc
; load the coordinates of object e into de
	ld a, e
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	pop bc
; |x1 - x2|
	ld a, b
	sub d
	jr z, .same_x_1
	jr nc, .b_right_of_d_1
	cpl
	inc a

.b_right_of_d_1
; |y1 - y2|
	ld h, a
	ld a, c
	sub e
	jr z, .same_y_1
	jr nc, .c_below_e_1
	cpl
	inc a

.c_below_e_1
; |y1 - y2| - |x1 - x2|
	sub h
	jr c, .same_y_1

.same_x_1
; compare the y coordinates
	ld a, c
	cp e
	jr z, .same_x_and_y
	jr c, .c_directly_below_e
; c directly above e
	ld d, DOWN
	and a
	ret

.c_directly_below_e
	ld d, UP
	and a
	ret

.same_y_1
	ld a, b
	cp d
	jr z, .same_x_and_y
	jr c, .b_directly_right_of_d
; b directly left of d
	ld d, RIGHT
	and a
	ret

.b_directly_right_of_d
	ld d, LEFT
	and a
	ret

.same_x_and_y
	scf
	ret
; 848a

Function848a: ; 848a
	call Function849d
	jr c, .same
	ld [wd4d1], a
	xor a
	ld [wd4d0], a
	ret

.same
	ld a, -1
	ld [wd4d0], a
	ret
; 849d

Function849d: ; 849d
	ld a, [wObjectFollow_Leader]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld d, [hl]
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld e, [hl]
	ld a, [wObjectFollow_Follower]
	call GetObjectStruct
	ld hl, OBJECT_NEXT_MAP_X
	add hl, bc
	ld a, d
	cp [hl]
	jr z, .check_y
	jr c, .left
	and a
	ld a, $c + RIGHT
	ret

.left
	and a
	ld a, $c + LEFT
	ret

.check_y
	ld hl, OBJECT_NEXT_MAP_Y
	add hl, bc
	ld a, e
	cp [hl]
	jr z, .same_xy
	jr c, .up
	and a
	ld a, $c + DOWN
	ret

.up
	and a
	ld a, $c + UP
	ret

.same_xy
	scf
	ret
; 84d9

_Sine:: ; 84d9
; A simple sine function.
; Return d * sin(e) in hl.

; e is a signed 6-bit value.
	ld a, e
	and %111111
	cp  %100000
	jr nc, .negative

	call Function84ef
	ld a, h
	ret

.negative
	and %011111
	call Function84ef
	ld a, h
	xor -1
	inc a
	ret
; 84ef

Function84ef: ; 84ef
	ld e, a
	ld a, d
	ld d, 0
	ld hl, SineWave
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0

; Factor amplitude
.multiply
	srl a
	jr nc, .even
	add hl, de
.even
	sla e
	rl d
	and a
	jr nz, .multiply
	ret
; 850b

SineWave: ; 850b
; A $20-word table representing a sine wave.
; 90 degrees is index $10 at a base amplitude of $100.
	sine_wave $100
; 854b


INCLUDE "engine/predef.asm"


INCLUDE "engine/color.asm"


SECTION "bank3", ROMX, BANK[$3]

CheckTime:: ; c000
	ld a, [TimeOfDay]
	ld hl, TimeOfDayTable
	ld de, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c

	xor a
	ld c, a
	ret
; c012

TimeOfDayTable: ; c012
	db MORN, 1 << MORN
	db DAY,  1 << DAY
	db NITE, 1 << NITE
	db NITE, 1 << NITE
	db -1
; c01b


INCLUDE "engine/specials.asm"


_PrintNum:: ; c4c7
; Print c digits of the b-byte value from de to hl.
; Allows 2 to 7 digits. For 1-digit numbers, add
; the value to char "0" instead of calling PrintNum.
; Some extra flags can be given in bits 5-7 of b.
; Bit 5: money if set (unless left-aligned without leading zeros)
; Bit 6: right-aligned if set
; Bit 7: print leading zeros if set

	push bc

	bit 5, b
	jr z, .main
	bit 7, b
	jr nz, .moneyflag
	bit 6, b
	jr z, .main

.moneyflag ; 101xxxxx or 011xxxxx
	ld a, "¥"
	ld [hli], a
	res 5, b ; 100xxxxx or 010xxxxx

.main
	xor a
	ld [hPrintNum1], a
	ld [hPrintNum2], a
	ld [hPrintNum3], a
	ld a, b
	and $f
	cp 1
	jr z, .byte
	cp 2
	jr z, .word
; maximum 3 bytes
.long
	ld a, [de]
	ld [hPrintNum2], a
	inc de
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.word
	ld a, [de]
	ld [hPrintNum3], a
	inc de
	ld a, [de]
	ld [hPrintNum4], a
	jr .start

.byte
	ld a, [de]
	ld [hPrintNum4], a

.start
	push de

	ld d, b
	ld a, c
	swap a
	and $f
	ld e, a
	ld a, c
	and $f
	ld b, a
	ld c, 0
	cp 2
	jr z, .two
	cp 3
	jr z, .three
	cp 4
	jr z, .four
	cp 5
	jr z, .five
	cp 6
	jr z, .six

.seven
	ld a, 1000000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 1000000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 1000000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.six
	ld a, 100000 / $10000 % $100
	ld [hPrintNum5], a
	ld a, 100000 / $100 % $100
	ld [hPrintNum6], a
	ld a, 100000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.five
	xor a
	ld [hPrintNum5], a
	ld a, 10000 / $100
	ld [hPrintNum6], a
	ld a, 10000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.four
	xor a
	ld [hPrintNum5], a
	ld a, 1000 / $100
	ld [hPrintNum6], a
	ld a, 1000 % $100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.three
	xor a
	ld [hPrintNum5], a
	xor a
	ld [hPrintNum6], a
	ld a, 100
	ld [hPrintNum7], a
	call .PrintDigit
	call .AdvancePointer

.two
	dec e
	jr nz, .two_skip
	ld a, "0"
	ld [hPrintNum1], a
.two_skip

	ld c, 0
	ld a, [hPrintNum4]
.mod_10
	cp 10
	jr c, .modded_10
	sub 10
	inc c
	jr .mod_10
.modded_10

	ld b, a
	ld a, [hPrintNum1]
	or c
	jr nz, .money
	call .PrintLeadingZero
	jr .money_leading_zero

.money
	call .PrintYen
	push af
	ld a, "0"
	add c
	ld [hl], a
	pop af
	ld [hPrintNum1], a
	inc e
	dec e
	jr nz, .money_leading_zero
	inc hl
	ld [hl], $f2 ; XXX

.money_leading_zero
	call .AdvancePointer
	call .PrintYen
	ld a, "0"
	add b
	ld [hli], a

	pop de
	pop bc
	ret
; c5ba

.PrintYen: ; c5ba
	push af
	ld a, [hPrintNum1]
	and a
	jr nz, .stop
	bit 5, d
	jr z, .stop
	ld a, "¥"
	ld [hli], a
	res 5, d

.stop
	pop af
	ret
; c5cb

.PrintDigit: ; c5cb (3:45cb)
	dec e
	jr nz, .ok
	ld a, "0"
	ld [hPrintNum1], a
.ok
	ld c, 0
.loop
	ld a, [hPrintNum5]
	ld b, a
	ld a, [hPrintNum2]
	ld [$ffba], a
	cp b
	jr c, .skip1
	sub b
	ld [hPrintNum2], a
	ld a, [hPrintNum6]
	ld b, a
	ld a, [hPrintNum3]
	ld [hPrintNum9], a
	cp b
	jr nc, .skip2
	ld a, [hPrintNum2]
	or 0
	jr z, .skip3
	dec a
	ld [hPrintNum2], a
	ld a, [hPrintNum3]
.skip2
	sub b
	ld [hPrintNum3], a
	ld a, [hPrintNum7]
	ld b, a
	ld a, [hPrintNum4]
	ld [hPrintNum10], a
	cp b
	jr nc, .skip4
	ld a, [hPrintNum3]
	and a
	jr nz, .skip5
	ld a, [hPrintNum2]
	and a
	jr z, .skip6
	dec a
	ld [hPrintNum2], a
	xor a
.skip5
	dec a
	ld [hPrintNum3], a
	ld a, [hPrintNum4]
.skip4
	sub b
	ld [hPrintNum4], a
	inc c
	jr .loop
.skip6
	ld a, [hPrintNum9]
	ld [hPrintNum3], a
.skip3
	ld a, [$ffba]
	ld [hPrintNum2], a
.skip1
	ld a, [hPrintNum1]
	or c
	jr z, .PrintLeadingZero
	ld a, [hPrintNum1]
	and a
	jr nz, .done
	bit 5, d
	jr z, .done
	ld a, $f0
	ld [hli], a
	res 5, d
.done
	ld a, "0"
	add c
	ld [hl], a
	ld [hPrintNum1], a
	inc e
	dec e
	ret nz
	inc hl
	ld [hl], $f2
	ret

.PrintLeadingZero: ; c644
; prints a leading zero unless they are turned off in the flags
	bit 7, d ; print leading zeroes?
	ret z
	ld [hl], "0"
	ret

.AdvancePointer: ; c64a
; increments the pointer unless leading zeroes are not being printed,
; the number is left-aligned, and no nonzero digits have been printed yet
	bit 7, d ; print leading zeroes?
	jr nz, .inc
	bit 6, d ; left alignment or right alignment?
	jr z, .inc
	ld a, [hPrintNum1]
	and a
	ret z
.inc
	inc hl
	ret
; c658


HealParty: ; c658
	xor a
	ld [CurPartyMon], a
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr z, .next

	push hl
	call HealPartyMon
	pop hl

.next
	ld a, [CurPartyMon]
	inc a
	ld [CurPartyMon], a
	jr .loop

.done
	ret
; c677

HealPartyMon: ; c677
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld d, h
	ld e, l

	ld hl, MON_STATUS
	add hl, de
	xor a
	ld [hli], a
	ld [hl], a

	ld hl, MON_MAXHP
	add hl, de

	; bc = MON_HP
	ld b, h
	ld c, l
rept 2
	dec bc
endr

	ld a, [hli]
	ld [bc], a
	inc bc
	ld a, [hl]
	ld [bc], a

	callba Functionf8b9
	ret
; c699

DrawPartyMenuHPBar: ; c699
	ld a, b
	or c
	jr z, .zero
	push hl
	xor a
	ld [hMultiplicand + 0], a
	ld a, b
	ld [hMultiplicand + 1], a
	ld a, c
	ld [hMultiplicand + 2], a
	ld a, $30
	ld [hMultiplier], a
	call Multiply
	ld a, d
	and a
	jr z, .divide
	srl d
	rr e
	srl d
	rr e
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	srl b
	rr a
	srl b
	rr a
	ld [hDividend + 3], a
	ld a, b
	ld [hDividend + 2], a

.divide
	ld a, e
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 2]
	ld e, a
	pop hl
	and a
	ret nz
	ld e, $1
	ret

.zero
	ld e, $0
	ret
; c6e0

AnimateHPBar: ; c6e0
	call WaitBGMap
	call _AnimateHPBar
	call WaitBGMap
	ret
; c6ea


ClearBuffer1: ; c6ea
	xor a
	ld hl, Buffer1
	ld bc, 7
	call ByteFill
	ret
; c6f5

FieldMoveJumptable: ; c6f5
	ld a, [Buffer1]
	rst JumpTable
	ld [Buffer1], a
	bit 7, a
	jr nz, .okay
	and a
	ret

.okay
	and $7f
	scf
	ret
; c706


GetPartyNick: ; c706
; write CurPartyMon nickname to StringBuffer1-3
	ld hl, PartyMonNicknames
	ld a, BOXMON
	ld [MonType], a
	ld a, [CurPartyMon]
	call GetNick
	call CopyName1
; copy text from StringBuffer2 to StringBuffer3
	ld de, StringBuffer2
	ld hl, StringBuffer3
	call CopyName2
	ret
; c721


CheckEngineFlag: ; c721
; Check engine flag de
; Return carry if flag is not set
	ld b, CHECK_FLAG
	callba EngineFlagAction
	ld a, c
	and a
	jr nz, .isset
	scf
	ret
.isset
	xor a
	ret
; c731

CheckBadge: ; c731
; Check engine flag a (ENGINE_ZEPHYRBADGE thru ENGINE_EARTHBADGE)
; Display "Badge required" text and return carry if the badge is not owned
	call CheckEngineFlag
	ret nc
	ld hl, BadgeRequiredText
	call MenuTextBoxBackup ; push text to queue
	scf
	ret
; c73d

BadgeRequiredText: ; c73d
	; Sorry! A new BADGE
	; is required.
	text_jump _BadgeRequiredText
	db "@"
; c742


CheckPartyMove: ; c742
; Check if a monster in your party has move d.

	ld e, 0
	xor a
	ld [CurPartyMon], a
.loop
	ld c, e
	ld b, 0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	and a
	jr z, .no
	cp a, -1
	jr z, .no
	cp a, EGG
	jr z, .next

	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Moves
	ld a, e
	call AddNTimes
	ld b, NUM_MOVES
.check
	ld a, [hli]
	cp d
	jr z, .yes
	dec b
	jr nz, .check

.next
	inc e
	jr .loop

.yes
	ld a, e
	ld [CurPartyMon], a ; which mon has the move
	xor a
	ret
.no
	scf
	ret
; c779


FieldMoveFailed: ; c779
	ld hl, UnknownText_0xc780
	call MenuTextBoxBackup
	ret
; c780

UnknownText_0xc780: ; 0xc780
	text_jump UnknownText_0x1c05c8
	db "@"
; 0xc785

CutFunction: ; c785
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; c796


.Jumptable: ; c796 (3:4796)
	dw .CheckAble
	dw .DoCut
	dw .FailCut


.CheckAble: ; c79c (3:479c)
	ld de, ENGINE_HIVEBADGE
	call CheckBadge
	jr c, .nohivebadge
	call CheckMapForSomethingToCut
	jr c, .nothingtocut
	ld a, $1
	ret
.nohivebadge
	ld a, $80
	ret
.nothingtocut
	ld a, $2
	ret

.DoCut: ; c7b2 (3:47b2)
	ld hl, Script_CutFromMenu
	call QueueScript
	ld a, $81
	ret

.FailCut: ; c7bb (3:47bb)
	ld hl, UnknownText_0xc7c9
	call MenuTextBoxBackup
	ld a, $80
	ret

UnknownText_0xc7c4: ; 0xc7c4
	; used CUT!
	text_jump UnknownText_0x1c05dd
	db "@"
; 0xc7c9

UnknownText_0xc7c9: ; 0xc7c9
	; There's nothing to CUT here.
	text_jump UnknownText_0x1c05ec
	db "@"
; 0xc7ce

CheckMapForSomethingToCut: ; c7ce
	call GetFacingTileCoord
	ld c, a
	push de
	callba CheckCutCollision
	pop de
	jr nc, .fail
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, CutTreeBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .fail
	ld a, l
	ld [wd1ec], a
	ld a, h
	ld [wd1ed], a
	ld a, b
	ld [wd1ee], a
	ld a, c
	ld [wd1ef], a
	xor a
	ret

.fail
	scf
	ret
; c7fe

Script_CutFromMenu: ; c7fe
	reloadmappart
	special UpdateTimePals

Script_Cut: ; 0xc802
	callasm GetPartyNick
	writetext UnknownText_0xc7c4
	reloadmappart
	callasm CutDownTreeOrGrass
	loadmovesprites
	end
; 0xc810

CutDownTreeOrGrass: ; c810
	ld hl, wd1ec
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1ee]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call UpdateSprites
	call DelayFrame
	ld a, [wd1ef]
	ld e, a
	callba OWCutAnimation
	call BufferScreen
	call Function2914
	call UpdateSprites
	call DelayFrame
	call LoadStandardFont
	ret
; c840

CheckOverworldTileArrays: ; c840
	push bc
	ld a, [wTileset]
	ld de, 3
	call IsInArray
	pop bc
	jr nc, .nope
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, 3
	ld a, c
	call IsInArray
	jr nc, .nope
	inc hl
	ld b, [hl]
	inc hl
	ld c, [hl]
	scf
	ret

.nope
	xor a
	ret
; c862

CutTreeBlockPointers: ; c862
; Which tileset are we in?
	dbw TILESET_JOHTO_1, .one
	dbw TILESET_JOHTO_2, .two
	dbw TILESET_KANTO, .three
	dbw TILESET_PARK, .twentyfive
	dbw TILESET_ILEX_FOREST, .thirtyone
	db -1
; c872

.one: ; Johto OW
; Which meta tile are we facing, which should we replace it with, and does it affect encounters?
	db $03, $02, $01 ; grass
	db $5b, $3c, $00 ; tree
	db $5f, $3d, $00 ; tree
	db $63, $3f, $00 ; tree
	db $67, $3e, $00 ; tree
	db -1
; c882

.two: ; Goldenrod area
	db $03, $02, $01 ; grass
	db -1
; c886

.three: ; Kanto OW
	db $0b, $0a, $01 ; grass
	db $32, $6d, $00 ; tree
	db $33, $6c, $00 ; tree
	db $34, $6f, $00 ; tree
	db $35, $4c, $00 ; tree
	db $60, $6e, $00 ; tree
	db -1
; c899

.twentyfive: ; National Park
	db $13, $03, $01 ; grass
	db $03, $04, $01 ; grass
	db -1
; c8a0

.thirtyone: ; Ilex Forest
	db $0f, $17, $00
	db -1
; c8a4

WhirlpoolBlockPointers: ; c8a4
	dbw TILESET_JOHTO_1, .one
	db -1
; c8a8

.one: ; c8a8
	db $07, $36, $00
	db -1
; c8ac

Functionc8ac: ; c8ac
	call Functionc8b5
	and $7f
	ld [wd0ec], a
	ret
; c8b5

Functionc8b5: ; c8b5
; Flash
	ld de, ENGINE_ZEPHYRBADGE
	callba CheckBadge
	jr c, .nozephyrbadge
	push hl
	callba SpecialAerodactylChamber
	pop hl
	jr c, .useflash
	ld a, [wd847]
	cp -1
	jr nz, .notadarkcave

.useflash
	call UseFlash
	ld a, $81
	ret

.notadarkcave
	call FieldMoveFailed
	ld a, $80
	ret

.nozephyrbadge
	ld a, $80
	ret
; c8e0

UseFlash: ; c8e0
	ld hl, Script_UseFlash
	jp QueueScript
; c8e6

Script_UseFlash: ; 0xc8e6
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xc8f3
	callasm BlindingFlash
	loadmovesprites
	end
; 0xc8f3

UnknownText_0xc8f3: ; 0xc8f3
	text_jump UnknownText_0x1c0609
	start_asm
	call WaitSFX
	ld de, SFX_FLASH
	call PlaySFX
	call WaitSFX
	ld hl, UnknownText_0xc908
	ret
; c908

UnknownText_0xc908: ; 0xc908
	db "@"
; 0xc909

SurfFunction: ; c909
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; c91a


.Jumptable: ; c91a (3:491a)
	dw .TrySurf
	dw .DoSurf
	dw .FailSurf
	dw .AlreadySurfing


.TrySurf: ; c922 (3:4922)
	ld de, ENGINE_FOGBADGE
	call CheckBadge
	jr c, .asm_c956
	ld hl, BikeFlags
	bit 1, [hl] ; always on bike
	jr nz, .cannotsurf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .alreadysurfing
	cp PLAYER_SURF_PIKA
	jr z, .alreadysurfing
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr nz, .cannotsurf
	call CheckDirection
	jr c, .cannotsurf
	callba CheckFacingObject
	jr c, .cannotsurf
	ld a, $1
	ret
.asm_c956
	ld a, $80
	ret
.alreadysurfing
	ld a, $3
	ret
.cannotsurf
	ld a, $2
	ret

.DoSurf: ; c95f (3:495f)
	call GetSurfType
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	call GetPartyNick
	ld hl, SurfFromMenuScript
	call QueueScript
	ld a, $81
	ret

.FailSurf: ; c971 (3:4971)
	ld hl, CantSurfText
	call MenuTextBoxBackup
	ld a, $80
	ret

.AlreadySurfing: ; c97a (3:497a)
	ld hl, AlreadySurfingText
	call MenuTextBoxBackup
	ld a, $80
	ret
; c983 (3:4983)

SurfFromMenuScript: ; c983
	special UpdateTimePals

UsedSurfScript: ; c986
	writetext UsedSurfText ; "used SURF!"
	closetext
	loadmovesprites

	callasm Functionc9a2 ; empty function

	copybytetovar Buffer2
	writevarcode VAR_MOVEMENT

	special ReplaceKrisSprite
	special PlayMapMusic
; step into the water
	special Special_SurfStartStep ; (slow_step_x, step_end)
	applymovement PLAYER, MovementBuffer ; PLAYER, MovementBuffer
	end
; c9a2

Functionc9a2: ; c9a2
	callba MobileFn_1060bb ; empty
	ret
; c9a9

UsedSurfText: ; c9a9
	text_jump _UsedSurfText
	db "@"
; c9ae

CantSurfText: ; c9ae
	text_jump _CantSurfText
	db "@"
; c9b3

AlreadySurfingText: ; c9b3
	text_jump _AlreadySurfingText
	db "@"
; c9b8


GetSurfType: ; c9b8
; Surfing on Pikachu uses an alternate sprite.
; This is done by using a separate movement type.

	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	ld hl, PartySpecies
	add hl, de

	ld a, [hl]
	cp PIKACHU
	ld a, PLAYER_SURF_PIKA
	ret z
	ld a, PLAYER_SURF
	ret
; c9cb


CheckDirection: ; c9cb
; Return carry if a tile permission prevents you
; from moving in the direction you're facing.

; Get player direction
	ld a, [PlayerDirection]
	and a, %00001100 ; bits 2 and 3 contain direction
	rrca
	rrca
	ld e, a
	ld d, 0
	ld hl, .Directions
	add hl, de

; Can you walk in this direction?
	ld a, [TilePermissions]
	and [hl]
	jr nz, .quit
	xor a
	ret

.quit
	scf
	ret

.Directions
	db FACE_DOWN
	db FACE_UP
	db FACE_LEFT
	db FACE_RIGHT
; c9e7


TrySurfOW:: ; c9e7
; Checking a tile in the overworld.
; Return carry if surfing is allowed.

; Don't ask to surf if already surfing.
	ld a, [PlayerState]
	cp PLAYER_SURF_PIKA
	jr z, .quit
	cp PLAYER_SURF
	jr z, .quit

; Must be facing water.
	ld a, [EngineBuffer1]
	call GetTileCollision
	cp 1 ; surfable
	jr nz, .quit

; Check tile permissions.
	call CheckDirection
	jr c, .quit

	ld de, ENGINE_FOGBADGE
	call CheckEngineFlag
	jr c, .quit

	ld d, SURF
	call CheckPartyMove
	jr c, .quit

	ld hl, BikeFlags
	bit 1, [hl] ; always on bike (can't surf)
	jr nz, .quit

	call GetSurfType
	ld [MovementType], a
	call GetPartyNick

	ld a, BANK(AskSurfScript)
	ld hl, AskSurfScript
	call CallScript

	scf
	ret

.quit
	xor a
	ret
; ca2c


AskSurfScript: ; ca2c
	loadfont
	writetext AskSurfText
	yesorno
	iftrue UsedSurfScript
	loadmovesprites
	end
; ca36

AskSurfText: ; ca36
	text_jump _AskSurfText ; The water is calm.
	db "@"              ; Want to SURF?
; ca3b


FlyFunction: ; ca3b
	call ClearBuffer1
.asm_ca3e
	ld hl, .data_ca4c
	call FieldMoveJumptable
	jr nc, .asm_ca3e
	and $7f
	ld [wd0ec], a
	ret
; ca4c

.data_ca4c
 	dw .TryFly
 	dw .DoFly
 	dw .FailFly
; ca52


.TryFly: ; ca52
; Fly
	ld de, ENGINE_STORMBADGE
	call CheckBadge
	jr c, .nostormbadge
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .outdoors
	jr .indoors

.outdoors
	xor a
	ld [hMapAnims], a
	call LoadStandardMenuDataHeader
	call ClearSprites
	callba _FlyMap
	ld a, e
	cp -1
	jr z, .illegal
	cp $1c ; NUM_SPAWNS
	jr nc, .illegal

	ld [wd001], a
	call WriteBackup
	ld a, $1
	ret

.nostormbadge
	ld a, $82
	ret

.indoors
	ld a, $2
	ret

.illegal
	call WriteBackup
	call WaitBGMap
	ld a, $80
	ret
; ca94

.DoFly: ; ca94
	ld hl, .FlyScript
	call QueueScript
	ld a, $81
	ret
; ca9d

.FailFly: ; ca9d
	call FieldMoveFailed
	ld a, $82
	ret
; caa3

.FlyScript: ; 0xcaa3
	reloadmappart
	callasm HideSprites
	special UpdateTimePals
	callasm Function8caed
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	callasm DelayLoadingNewSprites
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_FLY
	callasm Function8cb33
	special WaitSFX
	callasm .ReturnFromFly
	end
; 0xcacb

.ReturnFromFly: ; cacb
	callba Function561d
	call DelayFrame
	call ReplaceKrisSprite
	callba Function106594
	ret
; cade

Functioncade: ; cade
	call AttemptToWaterfall
	and $7f
	ld [wd0ec], a
	ret
; cae7

AttemptToWaterfall: ; cae7
; Waterfall
	ld de, ENGINE_RISINGBADGE
	callba CheckBadge
	ld a, $80
	ret c
	call CheckMapCanWaterfall
	jr c, .failed
	ld hl, Script_WaterfallFromMenu
	call QueueScript
	ld a, $81
	ret

.failed
	call FieldMoveFailed
	ld a, $80
	ret
; cb07

CheckMapCanWaterfall: ; cb07
	ld a, [PlayerDirection]
	and $c
	cp FACE_UP
	jr nz, .failed
	ld a, [TileUp]
	call CheckWaterfallTile
	jr nz, .failed
	xor a
	ret

.failed
	scf
	ret
; cb1c

Script_WaterfallFromMenu: ; 0xcb1c
	reloadmappart
	special UpdateTimePals

Script_UsedWaterfall: ; 0xcb20
	callasm GetPartyNick
	writetext UnknownText_0xcb51
	closetext
	loadmovesprites
	playsound SFX_BUBBLEBEAM
.loop
	applymovement PLAYER, WaterfallStep
	callasm CheckContinueWaterfall
	iffalse .loop
	end
; 0xcb38

CheckContinueWaterfall: ; cb38
	xor a
	ld [ScriptVar], a
	ld a, [PlayerNextTile]
	call CheckWaterfallTile
	ret z
	callba MobileFn_1060c1
	ld a, $1
	ld [ScriptVar], a
	ret
; cb4f

WaterfallStep: ; cb4f
	turn_waterfall_up
	step_end
; cb51

UnknownText_0xcb51: ; 0xcb51
	text_jump UnknownText_0x1c068e
	db "@"
; 0xcb56

TryWaterfallOW:: ; cb56
	ld d, WATERFALL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_RISINGBADGE
	call CheckEngineFlag
	jr c, .failed
	call CheckMapCanWaterfall
	jr c, .failed
	ld a, BANK(Script_AskWaterfall)
	ld hl, Script_AskWaterfall
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_CantDoWaterfall)
	ld hl, Script_CantDoWaterfall
	call CallScript
	scf
	ret
; cb7e

Script_CantDoWaterfall: ; 0xcb7e
	jumptext UnknownText_0xcb81
; 0xcb81

UnknownText_0xcb81: ; 0xcb81
	text_jump UnknownText_0x1c06a3
	db "@"
; 0xcb86

Script_AskWaterfall: ; 0xcb86
	loadfont
	writetext UnknownText_0xcb90
	yesorno
	iftrue Script_UsedWaterfall
	loadmovesprites
	end
; 0xcb90

UnknownText_0xcb90: ; 0xcb90
	text_jump UnknownText_0x1c06bf
	db "@"
; 0xcb95


EscapeRopeFunction: ; cb95
	call ClearBuffer1
	ld a, $1
	jr dig_incave

DigFunction: ; cb9c
	call ClearBuffer1
	ld a, $2

dig_incave
	ld [Buffer2], a
.loop
	ld hl, .DigTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cbb2

.DigTable: ; cbb2
	dw .CheckCanDig
	dw .DoDig
	dw .FailDig
; cbb8

.CheckCanDig: ; cbb8
	call GetMapPermission
	cp $4
	jr z, .incave
	cp $7
	jr z, .incave
.fail
	ld a, $2
	ret

.incave
	ld hl, wdca9
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hli]
	and a
	jr z, .fail
	ld a, [hl]
	and a
	jr z, .fail
	ld a, $1
	ret
; cbd8

.DoDig: ; cbd8
	ld hl, wdca9
	ld de, wd146
	ld bc, 3
	call CopyBytes
	call GetPartyNick
	ld a, [Buffer2]
	cp $2
	jr nz, .escaperope
	ld hl, UsedDigScript
	call QueueScript
	ld a, $81
	ret

.escaperope
	callba SpecialKabutoChamber
	ld hl, UsedEscapeRopeScript
	call QueueScript
	ld a, $81
	ret
; cc06

.FailDig: ; cc06
	ld a, [Buffer2]
	cp $2
	jr nz, .failescaperope
	ld hl, UnknownText_0xcc26
	call MenuTextBox
	call WaitPressAorB_BlinkCursor
	call WriteBackup

.failescaperope
	ld a, $80
	ret
; cc1c

UnknownText_0xcc1c: ; 0xcc1c
	; used DIG!
	text_jump UnknownText_0x1c06de
	db "@"
; 0xcc21

UnknownText_0xcc21: ; 0xcc21
	; used an ESCAPE ROPE.
	text_jump UnknownText_0x1c06ed
	db "@"
; 0xcc26

UnknownText_0xcc26: ; 0xcc26
	; Can't use that here.
	text_jump UnknownText_0x1c0705
	db "@"
; 0xcc2b

UsedEscapeRopeScript: ; 0xcc2b
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xcc21
	jump UsedDigOrEscapeRopeScript
; 0xcc35

UsedDigScript: ; 0xcc35
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xcc1c

UsedDigOrEscapeRopeScript: ; 0xcc3c
	closetext
	loadmovesprites
	playsound SFX_WARP_TO
	applymovement PLAYER, .DigOut
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_DOOR
	playsound SFX_WARP_FROM
	applymovement PLAYER, .DigReturn
	end
; 0xcc59

.DigOut: ; 0xcc59
	step_dig 32
	hide_person
	step_end
; 0xcc5d

.DigReturn: ; 0xcc5d
	show_person
	return_dig 32
	step_end
; 0xcc61

TeleportFunction: ; cc61
	call ClearBuffer1
.loop
	ld hl, .Jumptable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cc72

.Jumptable: ; cc72
	dw .TryTeleport
	dw .DoTeleport
	dw .FailTeleport
; cc78

.TryTeleport: ; cc78
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .CheckIfSpawnPoint
	jr .nope

.CheckIfSpawnPoint
	ld a, [wdcb2]
	ld d, a
	ld a, [wdcb3]
	ld e, a
	callba IsSpawnPoint
	jr nc, .nope
	ld a, c
	ld [wd001], a
	ld a, $1
	ret

.nope
	ld a, $2
	ret
; cc9c

.DoTeleport: ; cc9c
	call GetPartyNick
	ld hl, Script_UsedTeleport
	call QueueScript
	ld a, $81
	ret
; cca8

.FailTeleport: ; cca8
	ld hl, UnknownText_0xccb6
	call MenuTextBoxBackup
	ld a, $80
	ret
; ccb1

UnknownText_0xccb1: ; 0xccb1
	; Return to the last #MON CENTER.
	text_jump UnknownText_0x1c071a
	db "@"
; 0xccb6

UnknownText_0xccb6: ; 0xccb6
	; Can't use that here.
	text_jump UnknownText_0x1c073b
	db "@"
; 0xccbb

Script_UsedTeleport: ; 0xccbb
	reloadmappart
	special UpdateTimePals
	writetext UnknownText_0xccb1
	pause 60
	reloadmappart
	loadmovesprites
	playsound SFX_WARP_TO
	applymovement PLAYER, .TeleportFrom
	farscall Script_AbortBugContest
	special WarpToSpawnPoint
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	newloadmap MAPSETUP_TELEPORT
	playsound SFX_WARP_FROM
	applymovement PLAYER, .TeleportTo
	end
; 0xcce1

.TeleportFrom: ; cce1
	teleport_from
	step_end
; cce3

.TeleportTo: ; cce3
	teleport_to
	step_end
; cce5

StrengthFunction: ; cce5
	call .TryStrength
	and $7f
	ld [wd0ec], a
	ret
; ccee

.TryStrength: ; ccee
; Strength
	ld de, ENGINE_PLAINBADGE
	call CheckBadge
	jr c, FailedStrength
	jr StartToUseStrength
; ccf8

AlreadyUsingStrength: ; unreferenced
	ld hl, UnknownText_0xcd01
	call MenuTextBoxBackup
	ld a, $80
	ret
; cd01

UnknownText_0xcd01: ; 0xcd01
	text_jump UnknownText_0x1c0751
	db "@"
; 0xcd06

FailedStrength: ; cd06
	ld a, $80
	ret
; cd09

StartToUseStrength: ; cd09
	ld hl, Script_StrengthFromMenu
	call QueueScript
	ld a, $81
	ret
; cd12

Functioncd12: ; cd12
	ld hl, BikeFlags
	set 0, [hl]
	ld a, [CurPartyMon]
	ld e, a
	ld d, 0
	; fallthrough
; cd1d

Functioncd1d: ; cd1d
	ld hl, PartySpecies
	add hl, de
	ld a, [hl]
	ld [wd1ef], a
	call GetPartyNick
	ret
; cd29

Script_StrengthFromMenu: ; 0xcd29
	reloadmappart
	special UpdateTimePals

Script_UsedStrength: ; 0xcd2d
	callasm Functioncd12
	writetext UnknownText_0xcd41
	copybytetovar wd1ef
	cry 0
	pause 3
	writetext UnknownText_0xcd46
	loadmovesprites
	end
; 0xcd41

UnknownText_0xcd41: ; 0xcd41
	text_jump UnknownText_0x1c0774
	db "@"
; 0xcd46

UnknownText_0xcd46: ; 0xcd46
	text_jump UnknownText_0x1c0788
	db "@"
; 0xcd4b

AskStrengthScript:
	callasm TryStrengthOW
	iffalse .AskStrength
	if_equal $1, .DontMeetRequirements
	jump .AlreadyUsedStrength
; 0xcd59

.DontMeetRequirements: ; 0xcd59
	jumptext UnknownText_0xcd73
; 0xcd5c

.AlreadyUsedStrength: ; 0xcd5c
	jumptext UnknownText_0xcd6e
; 0xcd5f

.AskStrength: ; 0xcd5f
	loadfont
	writetext UnknownText_0xcd69
	yesorno
	iftrue Script_UsedStrength
	loadmovesprites
	end
; 0xcd69

UnknownText_0xcd69: ; 0xcd69
	; A #MON may be able to move this. Want to use STRENGTH?
	text_jump UnknownText_0x1c07a0
	db "@"
; 0xcd6e

UnknownText_0xcd6e: ; 0xcd6e
	; Boulders may now be moved!
	text_jump UnknownText_0x1c07d8
	db "@"
; 0xcd73

UnknownText_0xcd73: ; 0xcd73
	; A #MON may be able to move this.
	text_jump UnknownText_0x1c07f4
	db "@"
; 0xcd78

TryStrengthOW: ; cd78
	ld d, STRENGTH
	call CheckPartyMove
	jr c, .nope

	ld de, ENGINE_PLAINBADGE
	call CheckEngineFlag
	jr c, .nope

	ld hl, BikeFlags
	bit 0, [hl]
	jr z, .already_using

	ld a, 2
	jr .done

.nope
	ld a, 1
	jr .done

.already_using
	xor a
	jr .done

.done
	ld [ScriptVar], a
	ret
; cd9d

WhirlpoolFunction: ; cd9d
	call ClearBuffer1
.loop
	ld hl, Jumptable_cdae
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cdae

Jumptable_cdae: ; cdae
	dw .TryWhirlpool
	dw .DoWhirlpool
	dw .FailWhirlpool
; cdb4

.TryWhirlpool: ; cdb4
	ld de, ENGINE_GLACIERBADGE
	call CheckBadge
	jr c, .noglacierbadge
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, $1
	ret

.failed
	ld a, $2
	ret

.noglacierbadge
	ld a, $80
	ret
; cdca

.DoWhirlpool: ; cdca
	ld hl, Script_WhirlpoolFromMenu
	call QueueScript
	ld a, $81
	ret
; cdd3

.FailWhirlpool: ; cdd3
	call FieldMoveFailed
	ld a, $80
	ret
; cdd9

UnknownText_0xcdd9: ; 0xcdd9
	; used WHIRLPOOL!
	text_jump UnknownText_0x1c0816
	db "@"
; 0xcdde

TryWhirlpoolMenu: ; cdde
	call GetFacingTileCoord
	ld c, a
	push de
	call CheckWhirlpoolTile
	pop de
	jr c, .failed
	call GetBlockLocation
	ld c, [hl]
	push hl
	ld hl, WhirlpoolBlockPointers
	call CheckOverworldTileArrays
	pop hl
	jr nc, .failed
	ld a, l
	ld [wd1ec], a
	ld a, h
	ld [wd1ed], a
	ld a, b
	ld [wd1ee], a
	ld a, c
	ld [wd1ef], a
	xor a
	ret

.failed
	scf
	ret
; ce0b

Script_WhirlpoolFromMenu: ; 0xce0b
	reloadmappart
	special UpdateTimePals

Script_UsedWhirlpool: ; 0xce0f
	callasm GetPartyNick
	writetext UnknownText_0xcdd9
	reloadmappart
	callasm DisappearWhirlpool
	loadmovesprites
	end
; 0xce1d

DisappearWhirlpool: ; ce1d
	ld hl, wd1ec
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd1ee]
	ld [hl], a
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	ld a, [wd1ef]
	ld e, a
	callba PlayWhirlpoolSound
	call BufferScreen
	call Function2914
	ret
; ce3e

TryWhirlpoolOW:: ; ce3e
	ld d, WHIRLPOOL
	call CheckPartyMove
	jr c, .failed
	ld de, ENGINE_GLACIERBADGE
	call CheckEngineFlag
	jr c, .failed
	call TryWhirlpoolMenu
	jr c, .failed
	ld a, BANK(Script_AskWhirlpoolOW)
	ld hl, Script_AskWhirlpoolOW
	call CallScript
	scf
	ret

.failed
	ld a, BANK(Script_MightyWhirlpool)
	ld hl, Script_MightyWhirlpool
	call CallScript
	scf
	ret
; ce66

Script_MightyWhirlpool: ; 0xce66
	jumptext UnknownText_0xce69
; 0xce69

UnknownText_0xce69: ; 0xce69
	text_jump UnknownText_0x1c082b
	db "@"
; 0xce6e

Script_AskWhirlpoolOW: ; 0xce6e
	loadfont
	writetext UnknownText_0xce78
	yesorno
	iftrue Script_UsedWhirlpool
	loadmovesprites
	end
; 0xce78

UnknownText_0xce78: ; 0xce78
	text_jump UnknownText_0x1c0864
	db "@"
; 0xce7d


HeadbuttFunction: ; ce7d
	call TryHeadbuttFromMenu
	and $7f
	ld [wd0ec], a
	ret
; ce86

TryHeadbuttFromMenu: ; ce86
	call GetFacingTileCoord
	call CheckHeadbuttTreeTile
	jr nz, .no_tree

	ld hl, HeadbuttFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_tree
	call FieldMoveFailed
	ld a, $80
	ret
; ce9d

UnknownText_0xce9d: ; 0xce9d
	; did a HEADBUTT!
	text_jump UnknownText_0x1c0897
	db "@"
; 0xcea2

UnknownText_0xcea2: ; 0xcea2
	; Nope. Nothing…
	text_jump UnknownText_0x1c08ac
	db "@"
; 0xcea7

HeadbuttFromMenuScript: ; 0xcea7
	reloadmappart
	special UpdateTimePals

HeadbuttScript: ; 0xceab
	callasm GetPartyNick
	writetext UnknownText_0xce9d

	reloadmappart
	callasm ShakeHeadbuttTree

	callasm TreeMonEncounter
	iffalse .no_battle
	loadmovesprites
	battlecheck
	startbattle
	returnafterbattle
	end

.no_battle
	writetext UnknownText_0xcea2
	closetext
	loadmovesprites
	end
; 0xcec9

TryHeadbuttOW:: ; cec9
	ld d, HEADBUTT
	call CheckPartyMove
	jr c, .no

	ld a, BANK(AskHeadbuttScript)
	ld hl, AskHeadbuttScript
	call CallScript
	scf
	ret

.no
	xor a
	ret
; cedc

AskHeadbuttScript: ; 0xcedc
	loadfont
	writetext UnknownText_0xcee6
	yesorno
	iftrue HeadbuttScript
	loadmovesprites
	end
; 0xcee6

UnknownText_0xcee6: ; 0xcee6
	; A #MON could be in this tree. Want to HEADBUTT it?
	text_jump UnknownText_0x1c08bc
	db "@"
; 0xceeb


RockSmashFunction: ; ceeb
	call TryRockSmashFromMenu
	and $7f
	ld [wd0ec], a
	ret
; cef4

TryRockSmashFromMenu: ; cef4
	call GetFacingObject
	jr c, .no_rock
	ld a, d
	cp $18
	jr nz, .no_rock

	ld hl, RockSmashFromMenuScript
	call QueueScript
	ld a, $81
	ret

.no_rock
	call FieldMoveFailed
	ld a, $80
	ret
; cf0d

GetFacingObject: ; cf0d
	callba CheckFacingObject
	jr nc, .fail

	ld a, [hObjectStructIndexBuffer]
	call GetObjectStruct
	ld hl, OBJECT_MAP_OBJECT_INDEX
	add hl, bc
	ld a, [hl]
	ld [hLastTalked], a
	call GetMapObject
	ld hl, MAPOBJECT_MOVEMENT
	add hl, bc
	ld a, [hl]
	ld d, a
	and a
	ret

.fail
	scf
	ret
; cf2e

RockSmashFromMenuScript: ; 0xcf2e
	reloadmappart
	special UpdateTimePals

RockSmashScript: ; cf32
	callasm GetPartyNick
	writetext UnknownText_0xcf58
	loadmovesprites
	special WaitSFX
	playsound SFX_STRENGTH
	earthquake 84
	applymovement2 MovementData_0xcf55
	disappear -2

	callasm RockMonEncounter
	copybytetovar TempWildMonSpecies
	iffalse .done
	battlecheck
	startbattle
	returnafterbattle
.done
	end
; 0xcf55

MovementData_0xcf55: ; 0xcf55
	rock_smash 10
	step_end

UnknownText_0xcf58: ; 0xcf58
	text_jump UnknownText_0x1c08f0
	db "@"
; 0xcf5d

AskRockSmashScript: ; 0xcf5d
	callasm HasRockSmash
	if_equal 1, .no

	loadfont
	writetext UnknownText_0xcf77
	yesorno
	iftrue RockSmashScript
	loadmovesprites
	end
.no
	jumptext UnknownText_0xcf72
; 0xcf72

UnknownText_0xcf72: ; 0xcf72
	; Maybe a #MON can break this.
	text_jump UnknownText_0x1c0906
	db "@"
; 0xcf77

UnknownText_0xcf77: ; 0xcf77
	; This rock looks breakable. Want to use ROCK SMASH?
	text_jump UnknownText_0x1c0924
	db "@"
; 0xcf7c

HasRockSmash: ; cf7c
	ld d, ROCK_SMASH
	call CheckPartyMove
	jr nc, .yes
.no
	ld a, 1
	jr .done
.yes
	xor a
	jr .done
.done
	ld [ScriptVar], a
	ret


FishFunction: ; cf8e
	ld a, e
	push af
	call ClearBuffer1
	pop af
	ld [Buffer2], a
.loop
	ld hl, .FishTable
	call FieldMoveJumptable
	jr nc, .loop
	and $7f
	ld [wd0ec], a
	ret
; cfa5

.FishTable: ; cfa5
	dw .TryFish
	dw .FishNoBite
	dw .FishGotSomething
	dw .SurfingFish
	dw .FailFish
; cfaf

.TryFish: ; cfaf
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, .surfing
	cp PLAYER_SURF_PIKA
	jr z, .surfing
	call GetFacingTileCoord
	call GetTileCollision
	cp $1
	jr z, .facingwater

.surfing
	ld a, $3
	ret

.facingwater
	call GetFishingGroup
	and a
	jr nz, .goodtofish
	ld a, $4
	ret

.goodtofish
	ld d, a
	ld a, [Buffer2]
	ld e, a
	callba FishAction
	ld a, d
	and a
	jr z, .nonibble
	ld [TempWildMonSpecies], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, BATTLETYPE_FISH
	ld [BattleType], a
	ld a, $2
	ret

.nonibble
	ld a, $1
	ret
; cff1

.SurfingFish: ; cff1
	ld a, $80
	ret
; cff4

.FishGotSomething: ; cff4
	ld a, $1
	ld [wd1ef], a
	ld hl, Script_GotABite
	call QueueScript
	ld a, $81
	ret
; d002

.FishNoBite: ; d002
	ld a, $2
	ld [wd1ef], a
	ld hl, Script_NotEvenANibble
	call QueueScript
	ld a, $81
	ret
; d010

.FailFish: ; d010
	ld a, $0
	ld [wd1ef], a
	ld hl, Script_NotEvenANibble2
	call QueueScript
	ld a, $81
	ret
; d01e

Script_NotEvenANibble: ; 0xd01e
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9
	jump Script_NotEvenANibble_FallThrough
; 0xd027

Script_NotEvenANibble2: ; 0xd027
	scall Script_FishCastRod
	writetext UnknownText_0xd0a9

Script_NotEvenANibble_FallThrough: ; 0xd02d
	loademote EMOTE_SHADOW
	callasm PutTheRodAway
	loadmovesprites
	end
; 0xd035

Script_GotABite: ; 0xd035
	scall Script_FishCastRod
	callasm Fishing_CheckFacingUp
	iffalse .NotFacingUp
	applymovement PLAYER, .Movement_FacingUp
	jump .FightTheHookedPokemon
; 0xd046

.NotFacingUp: ; 0xd046
	applymovement PLAYER, .Movement_NotFacingUp

.FightTheHookedPokemon: ; 0xd04a
	pause 40
	applymovement PLAYER, .Movement_RestoreRod
	writetext UnknownText_0xd0a4
	callasm PutTheRodAway
	loadmovesprites
	battlecheck
	startbattle
	returnafterbattle
	end
; 0xd05c

.Movement_NotFacingUp: ; d05c
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	show_emote
	step_end
; d062

.Movement_FacingUp: ; d062
	fish_got_bite
	fish_got_bite
	fish_got_bite
	fish_got_bite
	step_sleep_1
	show_emote
	step_end
; d069

.Movement_RestoreRod: ; d069
	hide_emote
	fish_cast_rod
	step_end
; d06c

Fishing_CheckFacingUp: ; d06c
	ld a, [PlayerDirection]
	and $c
	cp OW_UP
	ld a, $1
	jr z, .up
	xor a

.up
	ld [ScriptVar], a
	ret
; d07c

Script_FishCastRod: ; 0xd07c
	reloadmappart
	loadvar hBGMapMode, $0
	special UpdateTimePals
	loademote EMOTE_ROD
	callasm LoadFishingGFX
	loademote EMOTE_SHOCK
	applymovement PLAYER, MovementData_0xd093
	pause 40
	end
; 0xd093

MovementData_0xd093: ; d093
	fish_cast_rod
	step_end
; d095

PutTheRodAway: ; d095
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [PlayerAction], a
	call UpdateSprites
	call ReplaceKrisSprite
	ret
; d0a4

UnknownText_0xd0a4: ; 0xd0a4
	; Oh! A bite!
	text_jump UnknownText_0x1c0958
	db "@"
; 0xd0a9

UnknownText_0xd0a9: ; 0xd0a9
	; Not even a nibble!
	text_jump UnknownText_0x1c0965
	db "@"
; 0xd0ae

UnknownText_0xd0ae: ; unused
	; Looks like there's nothing here.
	text_jump UnknownText_0x1c0979
	db "@"
; 0xd0b3

BikeFunction: ; d0b3
	call .TryBike
	and $7f
	ld [wd0ec], a
	ret
; d0bc

.TryBike: ; d0bc
	call .CheckEnvironment
	jr c, .CannotUseBike
	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .GetOnBike
	cp PLAYER_BIKE
	jr z, .GetOffBike
	jr .CannotUseBike

.GetOnBike
	ld hl, Script_GetOnBike
	ld de, Script_GetOnBike_Register
	call .CheckIfRegistered
	call QueueScript
	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume
	ld de, MUSIC_BICYCLE
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	ld a, $1
	ret

.GetOffBike
	ld hl, BikeFlags
	bit 1, [hl]
	jr nz, .CantGetOffBike
	ld hl, Script_GetOffBike
	ld de, Script_GetOffBike_Register
	call .CheckIfRegistered
	ld a, $3
	jr .done

.CantGetOffBike
	ld hl, UnknownScript_0xd171
	jr .done

.CannotUseBike
	ld a, $0
	ret

.done
	call QueueScript
	ld a, $1
	ret
; d119

.CheckIfRegistered: ; d119
	ld a, [wd0ef]
	and a
	ret z
	ld h, d
	ld l, e
	ret
; d121

.CheckEnvironment: ; d121
	call GetMapPermission
	call CheckOutdoorMap
	jr z, .ok
	cp CAVE
	jr z, .ok
	cp GATE
	jr z, .ok
	jr .nope

.ok
	call Function184a
	and $f
	jr nz, .nope
	xor a
	ret

.nope
	scf
	ret
; d13e

Script_GetOnBike: ; 0xd13e
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_BIKE
	writetext UnknownText_0xd17c
	closetext
	loadmovesprites
	special ReplaceKrisSprite
	end
; 0xd14e

Script_GetOnBike_Register: ; 0xd14e
	writecode VAR_MOVEMENT, PLAYER_BIKE
	loadmovesprites
	special ReplaceKrisSprite
	end
; 0xd156

Functiond156: ; unreferenced
	nop
	ret

Script_GetOffBike: ; 0xd158
	reloadmappart
	special UpdateTimePals
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	writetext UnknownText_0xd181
	closetext

FinishGettingOffBike:
	loadmovesprites
	special ReplaceKrisSprite
	special PlayMapMusic
	end
; 0xd16b

Script_GetOffBike_Register: ; 0xd16b
	writecode VAR_MOVEMENT, PLAYER_NORMAL
	jump FinishGettingOffBike
; 0xd171

UnknownScript_0xd171: ; 0xd171
	writetext UnknownText_0xd177
	closetext
	loadmovesprites
	end
; 0xd177

UnknownText_0xd177: ; 0xd177
	; You can't get off here!
	text_jump UnknownText_0x1c099a
	db "@"
; 0xd17c

UnknownText_0xd17c: ; 0xd17c
	; got on the @ .
	text_jump UnknownText_0x1c09b2
	db "@"
; 0xd181

UnknownText_0xd181: ; 0xd181
	; got off the @ .
	text_jump UnknownText_0x1c09c7
	db "@"
; 0xd186


TryCutOW:: ; d186
	ld d, CUT
	call CheckPartyMove
	jr c, .cant_cut

	ld de, ENGINE_HIVEBADGE
	call CheckEngineFlag
	jr c, .cant_cut

	ld a, BANK(AskCutScript)
	ld hl, AskCutScript
	call CallScript
	scf
	ret

.cant_cut
	ld a, BANK(CantCutScript)
	ld hl, CantCutScript
	call CallScript
	scf
	ret
; d1a9

AskCutScript: ; 0xd1a9
	loadfont
	writetext UnknownText_0xd1c8
	yesorno
	iffalse .script_d1b8
	callasm .CheckMap
	iftrue Script_Cut
.script_d1b8
	loadmovesprites
	end
; 0xd1ba

.CheckMap: ; d1ba
	xor a
	ld [ScriptVar], a
	call CheckMapForSomethingToCut
	ret c
	ld a, 1
	ld [ScriptVar], a
	ret
; d1c8

UnknownText_0xd1c8: ; 0xd1c8
	text_jump UnknownText_0x1c09dd
	db "@"
; 0xd1cd

CantCutScript: ; 0xd1cd
	jumptext UnknownText_0xd1d0
; 0xd1d0

UnknownText_0xd1d0: ; 0xd1d0
	text_jump UnknownText_0x1c0a05
	db "@"
; 0xd1d5


_ReceiveItem:: ; d1d5
	call DoesHLEqualNumItems
	jp nz, PutItemInPocket
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret
; d1e9

.Pockets: ; d1e9
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d1f1

.Item: ; d1f1
	ld h, d
	ld l, e
	jp PutItemInPocket
; d1f6

.KeyItem: ; d1f6
	ld h, d
	ld l, e
	jp ReceiveKeyItem
; d1fb

.Ball: ; d1fb
	ld hl, NumBalls
	jp PutItemInPocket
; d201

.TMHM: ; d201
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp ReceiveTMHM
; d20d


_TossItem:: ; d20d
	call DoesHLEqualNumItems
	jr nz, .remove
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d228

.Ball ; d228
	ld hl, NumBalls
	jp RemoveItemFromPocket
; d22e

.TMHM ; d22e
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp TossTMHM
; d23a

.KeyItem ; d23a
	ld h, d
	ld l, e
	jp TossKeyItem
; d23f

.Item ; d23f
	ld h, d
	ld l, e
; d241

.remove
	jp RemoveItemFromPocket
; d244

_CheckItem:: ; d244
	call DoesHLEqualNumItems
	jr nz, .nope
	push hl
	call CheckItemPocket
	pop de
	ld a, [wItemAttributeParamBuffer]
	dec a
	ld hl, .Pockets
	rst JumpTable
	ret

.Pockets
	dw .Item
	dw .KeyItem
	dw .Ball
	dw .TMHM
; d25f

.Ball ; d25f
	ld hl, NumBalls
	jp CheckTheItem
; d265

.TMHM ; d265
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	call GetTMHMNumber
	jp CheckTMHM
; d271

.KeyItem ; d271
	ld h, d
	ld l, e
	jp CheckKeyItems
; d276

.Item ; d276
	ld h, d
	ld l, e
; d278

.nope
	jp CheckTheItem
; d27b

DoesHLEqualNumItems: ; d27b
	ld a, l
	cp NumItems % $100
	ret nz
	ld a, h
	cp NumItems / $100
	ret
; d283

GetPocketCapacity: ; d283
	ld c, MAX_ITEMS
	ld a, e
	cp NumItems % $100
	jr nz, .not_bag
	ld a, d
	cp NumItems / $100
	ret z

.not_bag
	ld c, MAX_PC_ITEMS
	ld a, e
	cp PCItems % $100
	jr nz, .not_pc
	ld a, d
	cp PCItems / $100
	ret z

.not_pc
	ld c, MAX_BALLS
	ret
; d29c

PutItemInPocket: ; d29c
	ld d, h
	ld e, l
	inc hl
	ld a, [CurItem]
	ld c, a
	ld b, 0
.loop
	ld a, [hli]
	cp -1
	jr z, .terminator
	cp c
	jr nz, .next
	ld a, 99
	sub [hl]
	add b
	ld b, a
	ld a, [wItemQuantityChangeBuffer]
	cp b
	jr z, .ok
	jr c, .ok

.next
	inc hl
	jr .loop

.terminator
	call GetPocketCapacity
	ld a, [de]
	cp c
	jr c, .ok
	and a
	ret

.ok
	ld h, d
	ld l, e
	ld a, [CurItem]
	ld c, a
	ld a, [wItemQuantityChangeBuffer]
	ld [wItemQuantityBuffer], a
.loop2
	inc hl
	ld a, [hli]
	cp -1
	jr z, .terminator2
	cp c
	jr nz, .loop2
	ld a, [wItemQuantityBuffer]
	add [hl]
	cp 100
	jr nc, .newstack
	ld [hl], a
	jr .done

.newstack
	ld [hl], 99
	sub 99
	ld [wItemQuantityBuffer], a
	jr .loop2

.terminator2
	dec hl
	ld a, [CurItem]
	ld [hli], a
	ld a, [wItemQuantityBuffer]
	ld [hli], a
	ld [hl], -1
	ld h, d
	ld l, e
	inc [hl]

.done
	scf
	ret
; d2ff

RemoveItemFromPocket: ; d2ff
	ld d, h
	ld e, l
	ld a, [hli]
	ld c, a
	ld a, [ItemCountBuffer]
	cp c
	jr nc, .ok ; memory
	ld c, a
	ld b, $0
rept 2
	add hl, bc
endr
	ld a, [CurItem]
	cp [hl]
	inc hl
	jr z, .skip
	ld h, d
	ld l, e
	inc hl

.ok
	ld a, [CurItem]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .skip
	cp -1
	jr z, .nope
	inc hl
	jr .loop

.skip
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	and a
	jr nz, .yup
	dec hl
	ld b, h
	ld c, l
rept 2
	inc hl
endr
.loop2
	ld a, [hli]
	ld [bc], a
	inc bc
	cp -1
	jr nz, .loop2
	ld h, d
	ld l, e
	dec [hl]

.yup
	scf
	ret

.nope
	and a
	ret
; d349

CheckTheItem: ; d349
	ld a, [CurItem]
	ld c, a
.loop
	inc hl
	ld a, [hli]
	cp -1
	jr z, .done
	cp c
	jr nz, .loop
	scf
	ret

.done
	and a
	ret
; d35a

ReceiveKeyItem: ; d35a
	ld hl, NumKeyItems
	ld a, [hli]
	cp MAX_KEY_ITEMS
	jr nc, .nope
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurItem]
	ld [hli], a
	ld [hl], -1
	ld hl, NumKeyItems
	inc [hl]
	scf
	ret

.nope
	and a
	ret
; d374

TossKeyItem: ; d374
	ld a, [wd107]
	ld e, a
	ld d, 0
	ld hl, NumKeyItems
	ld a, [hl]
	cp e
	jr nc, .ok
	call .Toss
	ret nc
	jr .ok2

.ok
	dec [hl]
	inc hl
	add hl, de

.ok2
	ld d, h
	ld e, l
	inc hl
.loop
	ld a, [hli]
	ld [de], a
	inc de
	cp -1
	jr nz, .loop
	scf
	ret
; d396

.Toss: ; d396
	ld hl, NumKeyItems
	ld a, [CurItem]
	ld c, a
.loop3
	inc hl
	ld a, [hl]
	cp c
	jr z, .ok3
	cp -1
	jr nz, .loop3
	xor a
	ret

.ok3
	ld a, [NumKeyItems]
	dec a
	ld [NumKeyItems], a
	scf
	ret
; d3b1

CheckKeyItems: ; d3b1
	ld a, [CurItem]
	ld c, a
	ld hl, KeyItems
.loop
	ld a, [hli]
	cp c
	jr z, .done
	cp -1
	jr nz, .loop
	and a
	ret

.done
	scf
	ret
; d3c4



ReceiveTMHM: ; d3c4
	dec c
	ld b, 0
	ld hl, TMsHMs
	add hl, bc
	ld a, [wItemQuantityChangeBuffer]
	add [hl]
	cp 100
	jr nc, .toomany
	ld [hl], a
	scf
	ret

.toomany
	and a
	ret
; d3d8

TossTMHM: ; d3d8
	dec c
	ld b, 0
	ld hl, TMsHMs
	add hl, bc
	ld a, [wItemQuantityChangeBuffer]
	ld b, a
	ld a, [hl]
	sub b
	jr c, .nope
	ld [hl], a
	ld [wItemQuantityBuffer], a
	jr nz, .yup
	ld a, [wd0e2]
	and a
	jr z, .yup
	dec a
	ld [wd0e2], a

.yup
	scf
	ret

.nope
	and a
	ret
; d3fb

CheckTMHM: ; d3fb
	dec c
	ld b, $0
	ld hl, TMsHMs
	add hl, bc
	ld a, [hl]
	and a
	ret z
	scf
	ret
; d407



GetTMHMNumber:: ; d407
; Return the number of a TM/HM by item id c.

	ld a, c

; Skip any dummy items.
	cp ITEM_C3 ; TM04-05
	jr c, .done
	cp ITEM_DC ; TM28-29
	jr c, .skip

	dec a
.skip
	dec a
.done
	sub TM01
	inc a
	ld c, a
	ret
; d417


GetNumberedTMHM: ; d417
; Return the item id of a TM/HM by number c.

	ld a, c

; Skip any gaps.
	cp ITEM_C3 - (TM01 - 1)
	jr c, .done
	cp ITEM_DC - (TM01 - 1) - 1
	jr c, .skip_one

.skip_two
	inc a
.skip_one
	inc a
.done
	add TM01
	dec a
	ld c, a
	ret
; d427


_CheckTossableItem:: ; d427
; Return 1 in wItemAttributeParamBuffer and carry if CurItem can't be removed from the bag.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit 7, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret
; d432

CheckSelectableItem: ; d432
; Return 1 in wItemAttributeParamBuffer and carry if CurItem can't be selected.
	ld a, ITEMATTR_PERMISSIONS
	call GetItemAttr
	bit 6, a
	jr nz, ItemAttr_ReturnCarry
	and a
	ret
; d43d

CheckItemPocket:: ; d43d
; Return the pocket for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_POCKET
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d448

CheckItemContext: ; d448
; Return the context for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d453

CheckItemMenu: ; d453
; Return the menu for CurItem in wItemAttributeParamBuffer.
	ld a, ITEMATTR_HELP
	call GetItemAttr
	swap a
	and $f
	ld [wItemAttributeParamBuffer], a
	ret
; d460

GetItemAttr: ; d460
; Get attribute a of CurItem.

	push hl
	push bc

	ld hl, ItemAttributes
	ld c, a
	ld b, 0
	add hl, bc

	xor a
	ld [wItemAttributeParamBuffer], a

	ld a, [CurItem]
	dec a
	ld c, a
	ld a, NUM_ITEMATTRS
	call AddNTimes
	ld a, BANK(ItemAttributes)
	call GetFarByte

	pop bc
	pop hl
	ret
; d47f

ItemAttr_ReturnCarry: ; d47f
	ld a, 1
	ld [wItemAttributeParamBuffer], a
	scf
	ret
; d486


GetItemPrice: ; d486
; Return the price of CurItem in de.
	push hl
	push bc
	ld a, ITEMATTR_PRICE
	call GetItemAttr
	ld e, a
	ld a, ITEMATTR_PRICE_HI
	call GetItemAttr
	ld d, a
	pop bc
	pop hl
	ret
; d497


Functiond497:: ; d497 (3:5497)
	ld a, [wPlayerStepFlags]
	and a
	ret z
	bit 7, a
	jr nz, .asm_d4a9
	bit 6, a
	jr nz, .asm_d4b3
	bit 5, a
	jr nz, .asm_d4b8
	ret
.asm_d4a9
	ld a, $4
	ld [wd13f], a
	call Functiond536
	jr .asm_d4b8
.asm_d4b3
	call Functiond511
	jr .asm_d4b8
.asm_d4b8
	call Functiond4e5
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [wd14c]
	sub d
	ld [wd14c], a
	ld a, [wd14d]
	sub e
	ld [wd14d], a
	ret

Functiond4d2:: ; d4d2 (3:54d2)
	ld a, [wPlayerStepVectorX]
	ld d, a
	ld a, [wPlayerStepVectorY]
	ld e, a
	ld a, [hSCX]
	add d
	ld [hSCX], a
	ld a, [hSCY]
	add e
	ld [hSCY], a
	ret

Functiond4e5: ; d4e5 (3:54e5)
	ld hl, wd13f
	ld a, [hl]
	and a
	ret z
	dec [hl]
	ld a, [hl]
	ld hl, Jumptable_d4f2
	rst JumpTable
	ret

Jumptable_d4f2: ; d4f2 (3:54f2)
	dw Function2914
	dw BufferScreen
	dw .mobile
	dw .fail2
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1
	dw .fail1


.fail1: ; d508 (3:5508)
	ret

.mobile: ; d509 (3:5509)
	callba MobileFn_10602e
	ret

.fail2: ; d510 (3:5510)
	ret

Functiond511: ; d511 (3:5511)
	ld a, [wPlayerStepDirection]
	and a
	jr nz, .asm_d51c
	ld hl, YCoord
	inc [hl]
	ret
.asm_d51c
	cp $1
	jr nz, .asm_d525
	ld hl, YCoord
	dec [hl]
	ret
.asm_d525
	cp $2
	jr nz, .asm_d52e
	ld hl, XCoord
	dec [hl]
	ret
.asm_d52e
	cp $3
	ret nz
	ld hl, XCoord
	inc [hl]
	ret

Functiond536: ; d536 (3:5536)
	ld a, [wPlayerStepDirection]
	and a
	jr z, .asm_d549
	cp $1
	jr z, .asm_d553
	cp $2
	jr z, .asm_d55d
	cp $3
	jr z, .asm_d567
	ret

.asm_d549
	call Functiond571
	call LoadMapPart
	call ScrollMapUp
	ret

.asm_d553
	call Functiond5a2
	call LoadMapPart
	call ScrollMapDown
	ret

.asm_d55d
	call Functiond5d5
	call LoadMapPart
	call ScrollMapLeft
	ret

.asm_d567
	call Functiond5fe
	call LoadMapPart
	call ScrollMapRight
	ret

Functiond571: ; d571 (3:5571)
	ld a, [wBGMapAnchor]
	add $40
	ld [wBGMapAnchor], a
	jr nc, .not_overflowed
	ld a, [wBGMapAnchor + 1]
	inc a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_overflowed
	ld hl, wd196
	inc [hl]
	ld a, [hl]
	cp $2 ; was 1
	jr nz, .skip
	ld [hl], $0
	call Functiond595
.skip
	ret

Functiond595: ; d595 (3:5595)
	ld hl, wd194
	ld a, [MapWidth]
	add $6
	add [hl]
	ld [hli], a
	ret nc
	inc [hl]
	ret

Functiond5a2: ; d5a2 (3:55a2)
	ld a, [wBGMapAnchor]
	sub $40
	ld [wBGMapAnchor], a
	jr nc, .not_underflowed
	ld a, [wBGMapAnchor + 1]
	dec a
	and $3
	or VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
.not_underflowed
	ld hl, wd196
	dec [hl]
	ld a, [hl]
	cp $ff ; was 0
	jr nz, .skip
	ld [hl], $1
	call Functiond5c6
.skip
	ret

Functiond5c6: ; d5c6 (3:55c6)
	ld hl, wd194
	ld a, [MapWidth]
	add $6
	ld b, a
	ld a, [hl]
	sub b
	ld [hli], a
	ret nc
	dec [hl]
	ret

Functiond5d5: ; d5d5 (3:55d5)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	sub $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wd197
	dec [hl]
	ld a, [hl]
	cp $ff
	jr nz, .asm_d5f3
	ld [hl], $1
	call Functiond5f4
.asm_d5f3
	ret

Functiond5f4: ; d5f4 (3:55f4)
	ld hl, wd194
	ld a, [hl]
	sub $1
	ld [hli], a
	ret nc
	dec [hl]
	ret

Functiond5fe: ; d5fe (3:55fe)
	ld a, [wBGMapAnchor]
	ld e, a
	and $e0
	ld d, a
	ld a, e
	add $2
	and $1f
	or d
	ld [wBGMapAnchor], a
	ld hl, wd197
	inc [hl]
	ld a, [hl]
	cp $2
	jr nz, .asm_d61c
	ld [hl], $0
	call .Incrementwd194
.asm_d61c
	ret

.Incrementwd194: ; d61d (3:561d)
	ld hl, wd194
	ld a, [hl]
	add $1
	ld [hli], a
	ret nc
	inc [hl]
	ret

_AnimateHPBar: ; d627
	call Functiond65f
	jr c, .do_player
	call Functiond670
.enemy_loop
	push bc
	push hl
	call Functiond6e2
	pop hl
	pop bc
	push af
	push bc
	push hl
	call Functiond730
	call Functiond7c9
	pop hl
	pop bc
	pop af
	jr nc, .enemy_loop
	ret

.do_player
	call Functiond670
.player_loop
	push bc
	push hl
	call Functiond6f5
	pop hl
	pop bc
	ret c
	push af
	push bc
	push hl
	call Functiond749
	call Functiond7c9
	pop hl
	pop bc
	pop af
	jr nc, .player_loop
	ret
; d65f

Functiond65f: ; d65f
	ld a, [Buffer2]
	and a
	jr nz, .player
	ld a, [Buffer1]
	cp $30
	jr nc, .player
	and a
	ret

.player
	scf
	ret
; d670

Functiond670: ; d670
	push hl
	ld hl, Buffer1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	pop hl
	call DrawPartyMenuHPBar
	ld a, e
	ld [wd1f1], a
	ld a, [wd1ee]
	ld c, a
	ld a, [wd1ef]
	ld b, a
	ld a, [Buffer1]
	ld e, a
	ld a, [Buffer2]
	ld d, a
	call DrawPartyMenuHPBar
	ld a, e
	ld [wd1f2], a
	push hl
	ld hl, wd1ec
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	pop hl
	ld a, e
	sub c
	ld e, a
	ld a, d
	sbc b
	ld d, a
	jr c, .asm_d6c1
	ld a, [wd1ec]
	ld [wd1f5], a
	ld a, [wd1ee]
	ld [wd1f6], a
	ld bc, 1
	jr .asm_d6d9

.asm_d6c1
	ld a, [wd1ec]
	ld [wd1f6], a
	ld a, [wd1ee]
	ld [wd1f5], a
	ld a, e
	xor $ff
	inc a
	ld e, a
	ld a, d
	xor $ff
	ld d, a
	ld bc, rIE

.asm_d6d9
	ld a, d
	ld [wd1f3], a
	ld a, e
	ld [wd1f4], a
	ret
; d6e2

Functiond6e2: ; d6e2
	ld hl, wd1f1
	ld a, [wd1f2]
	cp [hl]
	jr nz, .asm_d6ed
	scf
	ret

.asm_d6ed
	ld a, c
	add [hl]
	ld [hl], a
	call Functiond839
	and a
	ret
; d6f5

Functiond6f5: ; d6f5
.asm_d6f5
	ld hl, wd1ec
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, e
	cp [hl]
	jr nz, .asm_d707
	inc hl
	ld a, d
	cp [hl]
	jr nz, .asm_d707
	scf
	ret

.asm_d707
	ld l, e
	ld h, d
	add hl, bc
	ld a, l
	ld [wd1ec], a
	ld a, h
	ld [wd1ed], a
	push hl
	push de
	push bc
	ld hl, Buffer1
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call DrawPartyMenuHPBar
	pop bc
	pop de
	pop hl
	ld a, e
	ld hl, wd1f1
	cp [hl]
	jr z, .asm_d6f5
	ld [hl], a
	and a
	ret
; d730

Functiond730: ; d730
	call Functiond784
	ld d, $6
	ld a, [wd10a]
	and $1
	ld b, a
	ld a, [wd1f1]
	ld e, a
	ld c, a
	push de
	call Functiond771
	pop de
	call Functiond7b4
	ret
; d749

Functiond749: ; d749
	call Functiond784
	ld a, [wd1ec]
	ld c, a
	ld a, [wd1ed]
	ld b, a
	ld a, [Buffer1]
	ld e, a
	ld a, [Buffer2]
	ld d, a
	call DrawPartyMenuHPBar
	ld c, e
	ld d, $6
	ld a, [wd10a]
	and $1
	ld b, a
	push de
	call Functiond771
	pop de
	call Functiond7b4
	ret
; d771

Functiond771: ; d771
	ld a, [wd10a]
	cp $2
	jr nz, .asm_d780
	ld a, $28
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a

.asm_d780
	call DrawBattleHPBar
	ret
; d784

Functiond784: ; d784
	ld a, [wd10a]
	and a
	ret z
	cp $1
	jr z, .load_15
	ld de, $16
	jr .loaded_de

.load_15
	ld de, $15

.loaded_de
	push hl
	add hl, de
	ld a, " "
rept 2
	ld [hli], a
endr
	ld [hld], a
	dec hl
	ld a, [wd1ec]
	ld [StringBuffer2 + 1], a
	ld a, [wd1ed]
	ld [StringBuffer2], a
	ld de, StringBuffer2
	lb bc, 2, 3
	call PrintNum
	pop hl
	ret
; d7b4

Functiond7b4: ; d7b4
	ld a, [hCGB]
	and a
	ret z
	ld hl, wd1f0
	call SetHPPal
	ld a, [wd1f0]
	ld c, a
	callba Function8c43
	ret
; d7c9

Functiond7c9: ; d7c9
	ld a, [hCGB]
	and a
	jr nz, .cgb
	call DelayFrame
	call DelayFrame
	ret

.cgb
	ld a, [wd10a]
	and a
	jr z, .load_0
	cp $1
	jr z, .load_1
	ld a, [CurPartyMon]
	cp $3
	jr nc, .c_is_1
	ld c, $0
	jr .c_is_0

.c_is_1
	ld c, $1

.c_is_0
	push af
	cp $2
	jr z, .skip_delay
	cp $5
	jr z, .skip_delay
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame

.skip_delay
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	pop af
	cp $2
	jr z, .two_frames
	cp $5
	jr z, .two_frames
	ret

.two_frames
	inc c
	ld a, $2
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ld a, $1
	ld [hBGMapMode], a
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret

.load_0
	ld c, $0
	jr .finish

.load_1
	ld c, $1

.finish
	call DelayFrame
	ld a, c
	ld [hBGMapThird], a
	call DelayFrame
	ret
; d839

Functiond839: ; d839
	ld a, [Buffer1]
	ld c, a
	ld b, $0
	ld hl, 0
	ld a, [wd1f1]
	cp $30
	jr nc, .coppy_buffer
	and a
	jr z, .return_zero
	call AddNTimes
	ld b, $0
.loop
	ld a, l
	sub $30
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .done
	inc b
	jr .loop

.done
	push bc
	ld bc, $80
	add hl, bc
	pop bc
	ld a, l
	sub $30
	ld l, a
	ld a, h
	sbc $0
	ld h, a
	jr c, .no_carry
	inc b

.no_carry
	ld a, [wd1f5]
	cp b
	jr nc, .finish
	ld a, [wd1f6]
	cp b
	jr c, .finish
	ld a, b

.finish
	ld [wd1ec], a
	ret

.return_zero
	xor a
	ld [wd1ec], a
	ret

.coppy_buffer
	ld a, [Buffer1]
	ld [wd1ec], a
	ret
; d88c


TryAddMonToParty: ; d88c
; Check if to copy wild Pkmn or generate new Pkmn
	; Whose is it?
	ld de, PartyCount
	ld a, [MonType]
	and $f
	jr z, .getpartylocation ; PARTYMON
	ld de, OTPartyCount

.getpartylocation
	; Do we have room for it?
	ld a, [de]
	inc a
	cp PARTY_LENGTH + 1
	ret nc
	; Increase the party count
	ld [de], a
	ld a, [de] ; Why are we doing this?
	ld [$ffae], a ; HRAM backup
	add e
	ld e, a
	jr nc, .loadspecies
	inc d

.loadspecies
	; Load the species of the Pokemon into the party list.
	; The terminator is usually here, but it'll be back.
	ld a, [CurPartySpecies]
	ld [de], a
	; Load the terminator into the next slot.
	inc de
	ld a, -1
	ld [de], a
	; Now let's load the OT name.
	ld hl, PartyMonOT
	ld a, [MonType]
	and $f
	jr z, .loadOTname
	ld hl, OTPartyMonOT

.loadOTname
	ld a, [$ffae] ; Restore index from backup
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [MonType]
	and a
	jr nz, .skipnickname
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, PartyMonNicknames
	ld a, [$ffae]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

.skipnickname
	ld hl, PartyMon1Species
	ld a, [MonType]
	and $f
	jr z, .initializeStats
	ld hl, OTPartyMon1Species

.initializeStats
	ld a, [$ffae]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
GeneratePartyMonStats: ; d906
	ld e, l
	ld d, h
	push hl
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld a, [BaseDexNo]
	ld [de], a
	inc de
	ld a, [wBattleMode]
	and a
	ld a, $0
	jr z, .skipitem
	ld a, [EnemyMonItem]

.skipitem
	ld [de], a
	inc de
	push de
	ld h, d
	ld l, e
	ld a, [wBattleMode]
	and a
	jr z, .randomlygeneratemoves
	ld a, [MonType]
	and a
	jr nz, .randomlygeneratemoves
	ld de, EnemyMonMoves
	rept NUM_MOVES + -1
	ld a, [de]
	inc de
	ld [hli], a
	endr
	ld a, [de]
	ld [hl], a
	jr .next

.randomlygeneratemoves
	xor a
	rept NUM_MOVES + -1
	ld [hli], a
	endr
	ld [hl], a
	ld [Buffer1], a
	predef FillMoves

.next
	pop de
rept 4
	inc de
endr
	ld a, [PlayerID]
	ld [de], a
	inc de
	ld a, [PlayerID + 1]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hMultiplicand]
	ld [de], a
	inc de
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de
	xor a
	ld b, $a
.loop
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop hl
	push hl
	ld a, [MonType]
	and $f
	jr z, .generateDVs
	push hl
	callba GetTrainerDVs
	pop hl
	jr .initializetrainermonstats

.generateDVs
	ld a, [CurPartySpecies]
	ld [wd265], a
	dec a
	push de
	call CheckCaughtMon
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon
	pop de
	pop hl
	push hl
	ld a, [wBattleMode]
	and a
	jr nz, .copywildmonstats
	call Random
	ld b, a
	call Random
	ld c, a

.initializetrainermonstats
	ld a, b
	ld [de], a
	inc de
	ld a, c
	ld [de], a
	inc de
	push hl
	push de
rept 2
	inc hl
endr
	call FillPP
	pop de
	pop hl
rept 4
	inc de
endr
	ld a, 70
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld bc, 10
	add hl, bc
	ld a, $1
	ld c, a
	ld b, $0
	call CalcPkmnStatC
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de
	jr .next2

.copywildmonstats
	ld a, [EnemyMonDVs]
	ld [de], a
	inc de
	ld a, [EnemyMonDVs + 1]
	ld [de], a
	inc de

	push hl
	ld hl, EnemyMonPP
	ld b, NUM_MOVES
.wildmonpploop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .wildmonpploop
	pop hl

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	inc de
	ld hl, EnemyMonStatus
    ; Copy EnemyMonStatus
	ld a, [hli]
	ld [de], a
	inc de
    ; Copy EnemyMonUnused
	ld a, [hli]
	ld [de], a
	inc de
    ; Copy EnemyMonHP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

.next2
	ld a, [wBattleMode]
	dec a
	jr nz, .generatestats
	ld hl, EnemyMonMaxHP
	ld bc, 2*6 ; MaxHP + 5 Stats
	call CopyBytes
	pop hl
	jr .next3

.generatestats
	pop hl
	ld bc, 2*5 ; 5 Stats
	add hl, bc
	ld b, $0 ; if b = 1, then the Stats of the Pkmn are calculated
             ; only the current HP aren't set to MaxHP after this
	call CalcPkmnStats

.next3
	ld a, [MonType]
	and $f
	jr nz, .done
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab Functionfba18

.done
	scf ; When this function returns, the carry flag indicates success vs failure.
	ret
; da6d


FillPP: ; da6d
	push bc
	ld b, NUM_MOVES
.loop
	ld a, [hli]
	and a
	jr z, .next
	dec a
	push hl
	push de
	push bc
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, StringBuffer1
	ld a, BANK(Moves)
	call FarCopyBytes
	pop bc
	pop de
	pop hl
	ld a, [StringBuffer1 + MOVE_PP]

.next
	ld [de], a
	inc de
	dec b
	jr nz, .loop
	pop bc
	ret
; da96

Functionda96: ; da96
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	scf
	ret z

	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
	ld [hli], a
	ld [hl], $ff
	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, TempMonSpecies
	call CopyBytes
	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonOT
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	ld hl, OTPartyMonNicknames
	ld a, [CurPartyMon]
	call SkipNames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	cp EGG
	jr z, .owned
	dec a
	call SetSeenAndCaughtMon
	ld hl, PartyMon1Happiness
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], BASE_HAPPINESS
.owned

	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .done
	ld hl, PartyMon1DVs
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	predef GetUnownLetter
	callab Functionfba18
	ld a, [wdef4]
	and a
	jr nz, .done
	ld a, [UnownLetter]
	ld [wdef4], a
.done

	and a
	ret


SentGetPkmnIntoFromBox: ; db3f
; Sents/Gets Pkmn into/from Box depending on Parameter
; wPokemonWithdrawDepositParameter == 0: get Pkmn into Party
; wPokemonWithdrawDepositParameter == 1: sent Pkmn into Box
; wPokemonWithdrawDepositParameter == 2: get Pkmn from DayCare
; wPokemonWithdrawDepositParameter == 3: put Pkmn into DayCare

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .check_IfPartyIsFull
	cp DAYCARE_WITHDRAW
	jr z, .check_IfPartyIsFull
	cp DAYCARE_DEPOSIT
	ld hl, wBreedMon1Species
	jr z, .breedmon

    ; we want to sent a Pkmn into the Box
    ; so check if there's enough space
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	jr nz, .there_is_room
	jp CloseSRAM_And_SetCarryFlag

.check_IfPartyIsFull
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jp z, CloseSRAM_And_SetCarryFlag

.there_is_room
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_WITHDRAW
	ld a, [wBreedMon1Species]
	jr z, .okay1
	ld a, [CurPartySpecies]

.okay1
	ld [hli], a
	ld [hl], $ff
	ld a, [wPokemonWithdrawDepositParameter]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [PartyCount]
	jr nz, .okay2
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	ld a, [sBoxCount]

.okay2
	dec a ; PartyCount - 1
	call AddNTimes

.breedmon
	push hl
	ld e, l
	ld d, h
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld hl, sBoxMon1Species
	ld bc, BOXMON_STRUCT_LENGTH
	jr z, .okay3
	cp DAYCARE_WITHDRAW
	ld hl, wBreedMon1Species
	jr z, .okay4
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH

.okay3
	ld a, [CurPartyMon]
	call AddNTimes

.okay4
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1OT
	jr z, .okay5
	dec a
	ld hl, PartyMonOT
	ld a, [PartyCount]
	jr nz, .okay6
	ld hl, sBoxMonOT
	ld a, [sBoxCount]

.okay6
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay5
	ld hl, sBoxMonOT
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay7
	ld hl, wBreedMon1OT
	cp DAYCARE_WITHDRAW
	jr z, .okay8
	ld hl, PartyMonOT

.okay7
	ld a, [CurPartyMon]
	call SkipNames

.okay8
	ld bc, NAME_LENGTH
	call CopyBytes
	ld a, [wPokemonWithdrawDepositParameter]
	cp DAYCARE_DEPOSIT
	ld de, wBreedMon1Nick
	jr z, .okay9
	dec a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	jr nz, .okay10
	ld hl, sBoxMonNicknames
	ld a, [sBoxCount]

.okay10
	dec a
	call SkipNames
	ld d, h
	ld e, l

.okay9
	ld hl, sBoxMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay11
	ld hl, wBreedMon1Nick
	cp DAYCARE_WITHDRAW
	jr z, .okay12
	ld hl, PartyMonNicknames

.okay11
	ld a, [CurPartyMon]
	call SkipNames

.okay12
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop hl

	ld a, [wPokemonWithdrawDepositParameter]
	cp PC_DEPOSIT
	jr z, .took_out_of_box
	cp DAYCARE_DEPOSIT
	jp z, .CloseSRAM_And_ClearCarryFlag

	push hl
	srl a
	add $2
	ld [MonType], a
	predef CopyPkmnToTempMon
	callab CalcLevel
	ld a, d
	ld [CurPartyLevel], a
	pop hl

	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EXP + 2
	add hl, bc

	push bc
	ld b, $1
	call CalcPkmnStats
	pop bc

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr nz, .CloseSRAM_And_ClearCarryFlag
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hl], a
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
rept 2
	inc hl
endr
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.egg
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .CloseSRAM_And_ClearCarryFlag

.took_out_of_box
	ld a, [sBoxCount]
	dec a
	ld b, a
	call Functiondcb6

.CloseSRAM_And_ClearCarryFlag
	call CloseSRAM
	and a
	ret
; dcb1

CloseSRAM_And_SetCarryFlag: ; dcb1
	call CloseSRAM
	scf
	ret
; dcb6


Functiondcb6: ; dcb6
	ld a, b
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	ld hl, MON_PP
	add hl, bc
	push hl
	push bc
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	ld hl, MON_MOVES
	add hl, bc
	push hl
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	pop hl
	pop de

	ld a, [MenuSelection2]
	push af
	ld a, [MonType]
	push af
	ld b, 0
.asm_dcec
	ld a, [hli]
	and a
	jr z, .asm_dd18
	ld [TempMonMoves+0], a
	ld a, BOXMON
	ld [MonType], a
	ld a, b
	ld [MenuSelection2], a
	push bc
	push hl
	push de
	callba GetMaxPPOfMove
	pop de
	pop hl
	ld a, [wd265]
	ld b, a
	ld a, [de]
	and %11000000
	add b
	ld [de], a
	pop bc
	inc de
	inc b
	ld a, b
	cp NUM_MOVES
	jr c, .asm_dcec

.asm_dd18
	pop af
	ld [MonType], a
	pop af
	ld [MenuSelection2], a
	ret
; dd21


Functiondd21: ; dd21
	ld a, [wBreedMon1Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call Functione698
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd42

Functiondd42: ; dd42
	ld a, [wBreedMon2Species]
	ld [CurPartySpecies], a
	ld de, SFX_TRANSACTION
	call PlaySFX
	call WaitSFX
	call Functione6b3
	ld a, b
	ld [wd002], a
	ld a, e
	ld [CurPartyLevel], a
	ld a, PC_DEPOSIT
	ld [wPokemonWithdrawDepositParameter], a
	jp Functiondd64
; dd64

Functiondd64: ; dd64
	ld hl, PartyCount
	ld a, [hl]
	cp PARTY_LENGTH
	jr nz, .room_in_party
	scf
	ret

.room_in_party
	inc a
	ld [hl], a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	ld a, [wBreedMon1Species]
	ld de, wBreedMon1Nick
	jr z, .okay
	ld a, [wBreedMon2Species]
	ld de, wBreedMon2Nick

.okay
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	call SkipNames
	push hl
	ld h, d
	ld l, e
	pop de
	call CopyBytes
	push hl
	ld hl, PartyMonOT
	ld a, [PartyCount]
	dec a
	call SkipNames
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	push hl
	call Functionde1a
	pop hl
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	call GetBaseData
	call Functionde1a
	ld b, d
	ld c, e
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [CurPartyLevel]
	ld [hl], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, $a
	add hl, bc
	push bc
	ld b, $1
	call CalcPkmnStats
	ld hl, PartyMon1Moves
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld a, $1
	ld [Buffer1], a
	predef FillMoves
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	callba HealPartyMon
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop bc
	ld hl, $8
	add hl, bc
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [hMultiplicand + 1]
	ld [hli], a
	ld a, [hMultiplicand + 2]
	ld [hl], a
	and a
	ret
; de1a

Functionde1a: ; de1a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ret
; de2a

Functionde2a: ; de2a
	ld de, wBreedMon1Nick
	call Functionde44
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functione039
; de37

Functionde37: ; de37
	ld de, wBreedMon2Nick
	call Functionde44
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	jp Functione039
; de44

Functionde44: ; de44
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	call CopyBytes
	ld a, [CurPartyMon]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld bc, BOXMON_STRUCT_LENGTH
	jp CopyBytes


SentPkmnIntoBox: ; de6e
; Sents the Pkmn into one of Bills Boxes
; the data comes mainly from 'EnemyMon:'
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld de, sBoxCount
	ld a, [de]
	cp MONS_PER_BOX
	jp nc, Functiondf42
	inc a
	ld [de], a

	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	ld c, a
.asm_de85
	inc de
	ld a, [de]
	ld b, a
	ld a, c
	ld c, b
	ld [de], a
	inc a
	jr nz, .asm_de85

	call GetBaseData
	call ShiftBoxMon

	ld hl, PlayerName
	ld de, sBoxMonOT
	ld bc, NAME_LENGTH
	call CopyBytes

	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName

	ld de, sBoxMonNicknames
	ld hl, StringBuffer1
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes

	ld hl, EnemyMon
	ld de, sBoxMon1
	ld bc, 1 + 1 + NUM_MOVES ; species + item + moves
	call CopyBytes

	ld hl, PlayerID
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	push de
	ld a, [CurPartyLevel]
	ld d, a
	callab CalcExpAtLevel
	pop de
	ld a, [hMultiplicand]
	ld [de], a
	inc de
	ld a, [$ffb5]
	ld [de], a
	inc de
	ld a, [$ffb6]
	ld [de], a
	inc de

    ; Set all 5 Experience Values to 0
	xor a
	ld b, 2*5
.asm_dee5
	ld [de], a
	inc de
	dec b
	jr nz, .asm_dee5

	ld hl, EnemyMonDVs
	ld b, 2 + NUM_MOVES ; DVs and PP ; EnemyMonHappiness - EnemyMonDVs
.asm_deef
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_deef

	ld a, BASE_HAPPINESS
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld a, [CurPartyLevel]
	ld [de], a
	ld a, [CurPartySpecies]
	dec a
	call SetSeenAndCaughtMon
	ld a, [CurPartySpecies]
	cp UNOWN
	jr nz, .asm_df20
	ld hl, sBoxMon1DVs
	predef GetUnownLetter
	callab Functionfba18

.asm_df20
	ld hl, sBoxMon1Moves
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes

	ld hl, sBoxMon1PP
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes

	ld b, 0
	call Functiondcb6

	call CloseSRAM
	scf
	ret
; df42


Functiondf42: ; df42
	call CloseSRAM
	and a
	ret
; df47

ShiftBoxMon: ; df47
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	call .asm_df5f

	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call .asm_df5f

	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH

.asm_df5f
	ld a, [sBoxCount]
	cp 2
	ret c

	push hl
	call AddNTimes
	dec hl
	ld e, l
	ld d, h
	pop hl

	ld a, [sBoxCount]
	dec a
	call AddNTimes
	dec hl

	push hl
	ld a, [sBoxCount]
	dec a
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
.loop
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret
; df8c

GiveEgg:: ; df8c
	ld a, [CurPartySpecies]
	push af
	callab GetPreEvolution
	callab GetPreEvolution
	ld a, [CurPartySpecies]
	dec a
	push af
	call CheckCaughtMon
	pop af
	push bc
	call CheckSeenMon
	push bc
	call TryAddMonToParty
	pop bc
	ld a, c
	and a
	jr nz, .asm_dfc3
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexCaught
	ld b, $0
	predef FlagPredef

.asm_dfc3
	pop bc
	ld a, c
	and a
	jr nz, .asm_dfd9
	ld a, [CurPartySpecies]
	dec a
	ld c, a
	ld d, $0
	ld hl, PokedexSeen
	ld b, $0
	predef FlagPredef

.asm_dfd9
	pop af
	ld [CurPartySpecies], a
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1Species
	call AddNTimes
	ld a, [CurPartySpecies]
	ld [hl], a
	ld hl, PartyCount
	ld a, [hl]
	ld b, 0
	ld c, a
	add hl, bc
	ld a, EGG
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld de, String_Egg
	call CopyName2
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Happiness
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [wc2cc]
	bit 1, a
	ld a, $1
	jr nz, .asm_e022
	ld a, [BaseEggSteps]

.asm_e022
	ld [hl], a
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1HP
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	xor a
	ld [hli], a
	ld [hl], a
	and a
	ret
; e035

String_Egg: ; e035
	db "EGG@"
; e039

Functione039: ; e039
	ld hl, PartyCount

	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .okay

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount

.okay
	ld a, [hl]
	dec a
	ld [hli], a
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld e, l
	ld d, h
	inc de
.asm_e057
	ld a, [de]
	inc de
	ld [hli], a
	inc a
	jr nz, .asm_e057
	ld hl, PartyMonOT
	ld d, PARTY_LENGTH - 1
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e06d
	ld hl, sBoxMonOT
	ld d, MONS_PER_BOX - 1

.asm_e06d
	ld a, [CurPartyMon]
	call SkipNames
	ld a, [CurPartyMon]
	cp d
	jr nz, .asm_e07e
	ld [hl], $ff
	jp .asm_60f0

.asm_e07e
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e090
	ld bc, sBoxMonNicknames
.asm_e090
	call CopyDataUntil

	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0a5
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH

.asm_e0a5
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	ld bc, sBoxMonOT
	jr .asm_e0c3

.asm_e0bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld bc, PartyMonOT

.asm_e0c3
	call CopyDataUntil
	ld hl, PartyMonNicknames
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0d2
	ld hl, sBoxMonNicknames

.asm_e0d2
	ld bc, PKMN_NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	ld bc, PKMN_NAME_LENGTH
	add hl, bc
	ld bc, PartyMonNicknamesEnd
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jr z, .asm_e0ed
	ld bc, sBoxMonNicknamesEnd

.asm_e0ed
	call CopyDataUntil

.asm_60f0
	ld a, [wPokemonWithdrawDepositParameter]
	and a
	jp nz, CloseSRAM
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	ld hl, PartyCount
	ld a, [CurPartyMon]
	cp [hl]
	jr z, .asm_e131
	ld hl, sPartyScratch1
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	ld a, [CurPartyMon]
	ld b, a
.asm_e11a
	push bc
	push hl
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	pop hl
	push hl
	ld bc, SCRATCHMON_STRUCT_LENGTH
	add hl, bc
	pop de
	pop bc
	inc b
	ld a, [PartyCount]
	cp b
	jr nz, .asm_e11a

.asm_e131
	jp CloseSRAM
; e134

Functione134: ; e134
	ld a, MON_LEVEL
	call GetPartyParamLocation
	ld a, [hl]
	ld [MON_LEVEL], a ; wow
	ld a, MON_SPECIES
	call GetPartyParamLocation
	ld a, [hl]
	ld [CurSpecies], a
	call GetBaseData
	ld a, MON_MAXHP
	call GetPartyParamLocation
	ld d, h
	ld e, l
	push de
	ld a, MON_EXP + 2
	call GetPartyParamLocation
	ld b, $1
	call CalcPkmnStats
	pop de
	ld a, MON_HP
	call GetPartyParamLocation
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret
; e167

CalcPkmnStats: ; e167
; Calculates all 6 Stats of a Pkmn
; b = 0 or 1
; 'c' counts from 1-6 and points with 'BaseStats' to the base value
; results in $ffb5 and $ffb6 are saved in [de]

	ld c, $0
.loop
	inc c
	call CalcPkmnStatC
	ld a, [hMultiplicand + 1]
	ld [de], a
	inc de
	ld a, [hMultiplicand + 2]
	ld [de], a
	inc de
	ld a, c
	cp STAT_SDEF
	jr nz, .loop
	ret
; e17b

CalcPkmnStatC: ; e17b
; 'c' is 1-6 and points to the BaseStat
; 1: HP
; 2: Attack
; 3: Defense
; 4: Speed
; 5: SpAtk
; 6: SpDef
	push hl
	push de
	push bc
	ld a, b
	ld d, a
	push hl
	ld hl, BaseStats
	dec hl ; has to be decreased, because 'c' begins with 1
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld e, a
	pop hl
	push hl
	ld a, c
	cp STAT_SDEF
	jr nz, .not_spdef
rept 2
	dec hl
endr

.not_spdef
	sla c
	ld a, d
	and a
	jr z, .SkipSqrt
	add hl, bc
	push de
	ld a, [hld]
	ld e, a
	ld d, [hl]
	callba GetSquareRoot
	pop de

.SkipSqrt
	srl c
	pop hl
	push bc
	ld bc, MON_DVS - MON_HP_EXP + 1
	add hl, bc
	pop bc
	ld a, c
	cp STAT_ATK
	jr z, .Attack
	cp STAT_DEF
	jr z, .Defense
	cp STAT_SPD
	jr z, .Speed
	cp STAT_SATK
	jr z, .Special
	cp STAT_SDEF
	jr z, .Special
; DV_HP = (DV_ATK & 1) << 3 + (DV_DEF & 1) << 2 + (DV_SPD & 1) << 1 + (DV_SPC & 1)
	push bc
	ld a, [hl]
	swap a
	and $1
rept 3
	add a
endr
	ld b, a
	ld a, [hli]
	and $1
rept 2
	add a
endr
	add b
	ld b, a
	ld a, [hl]
	swap a
	and $1
	add a
	add b
	ld b, a
	ld a, [hl]
	and $1
	add b
	pop bc
	jr .GotDV

.Attack
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Defense
	ld a, [hl]
	and $f
	jr .GotDV

.Speed
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr .GotDV

.Special
	inc hl
	ld a, [hl]
	and $f

.GotDV
	ld d, 0
	add e
	ld e, a
	jr nc, .no_overflow_1
	inc d

.no_overflow_1
	sla e
	rl d
	srl b
	srl b
	ld a, b
	add e
	jr nc, .no_overflow_2
	inc d

.no_overflow_2
	ld [hMultiplicand + 2], a
	ld a, d
	ld [hMultiplicand + 1], a
	xor a
	ld [hMultiplicand + 0], a
	ld a, [CurPartyLevel]
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 1]
	ld [hDividend + 0], a
	ld a, [hProduct + 2]
	ld [hDividend + 1], a
	ld a, [hProduct + 3]
	ld [hDividend + 2], a
	ld a, 100
	ld [hDivisor], a
	ld a, 3
	ld b, a
	call Divide
	ld a, c
	cp STAT_HP
	ld a, 5
	jr nz, .not_hp
	ld a, [CurPartyLevel]
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_3
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_3
	ld a, 10

.not_hp
	ld b, a
	ld a, [hQuotient + 2]
	add b
	ld [hMultiplicand + 2], a
	jr nc, .no_overflow_4
	ld a, [hQuotient + 1]
	inc a
	ld [hMultiplicand + 1], a

.no_overflow_4
	ld a, [hQuotient + 1]
	cp (1000 / $100) + 1
	jr nc, .max_stat
	cp 1000 / $100
	jr c, .stat_value_okay
	ld a, [hQuotient + 2]
	cp 1000 % $100
	jr c, .stat_value_okay

.max_stat
	ld a, 999 / $100
	ld [hMultiplicand + 1], a
	ld a, 999 % $100
	ld [hMultiplicand + 2], a

.stat_value_okay
	pop bc
	pop de
	pop hl
	ret
; e277

GivePoke:: ; e277
	push de
	push bc
	xor a ; PARTYMON
	ld [MonType], a
	call TryAddMonToParty
	jr nc, .failed
	ld hl, PartyMonNicknames
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	call SkipNames
	ld d, h
	ld e, l
	pop bc
	ld a, b
	ld b, $0
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [CurItem]
	ld [hl], a
	jr .done

.failed
	ld a, [CurPartySpecies]
	ld [TempEnemyMonSpecies], a
	callab LoadEnemyMon
	call SentPkmnIntoBox
	jp nc, Functione3d4
	ld a, $2
	ld [MonType], a
	xor a
	ld [CurPartyMon], a
	ld de, wd050
	pop bc
	ld a, b
	ld b, $1
	push bc
	push de
	push af
	ld a, [CurItem]
	and a
	jr z, .done
	ld a, [CurItem]
	ld [sBoxMon1Item], a

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [TempEnemyMonSpecies], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	pop af
	and a
	jp z, .asm_e390
	pop de
	pop bc
	pop hl
	push bc
	push hl
	ld a, [ScriptBank]
	call GetFarHalfword
	ld bc, PKMN_NAME_LENGTH
	ld a, [ScriptBank]
	call FarCopyBytes
	pop hl
rept 2
	inc hl
endr
	ld a, [ScriptBank]
	call GetFarHalfword
	pop bc
	ld a, b
	and a
	push de
	push bc
	jr nz, .asm_e35e

	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	pop hl
.otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .otnameloop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, 01001 / $100
	ld [hli], a
	ld [hl], 01001 % $100
	pop bc
	callba SetPartymonCaughtData
	jr .skip_nickname

.asm_e35e
	ld a, BANK(sBoxMonOT)
	call GetSRAMBank
	ld de, sBoxMonOT
.loop
	ld a, [ScriptBank]
	call GetFarByte
	ld [de], a
	inc hl
	inc de
	cp "@"
	jr nz, .loop
	ld a, [ScriptBank]
	call GetFarByte
	ld b, a
	ld hl, sBoxMon1ID
	call Random
	ld [hli], a
	call Random
	ld [hl], a
	call CloseSRAM
	callba SetBoxMonCaughtData
	jr .skip_nickname

.asm_e390
	pop de
	pop bc
	push bc
	push de
	ld a, b
	and a
	jr z, .asm_e3a0
	callba Function4db83
	jr .asm_e3a6

.asm_e3a0
	callba Function4db49

.asm_e3a6
	callba GiveANickname_YesNo
	pop de
	jr c, .skip_nickname
	call InitNickname

.skip_nickname
	pop bc
	pop de
	ld a, b
	and a
	ret z
	ld hl, TextJump_WasSentToBillsPC
	call PrintText
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld hl, wd050
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM
	ld b, $1
	ret
; e3d4

Functione3d4: ; e3d4
	pop bc
	pop de
	ld b, $2
	ret
; e3d9


TextJump_WasSentToBillsPC: ; 0xe3d9
	; was sent to BILL's PC.
	text_jump Text_WasSentToBillsPC
	db "@"
; 0xe3de

InitNickname: ; e3de
	push de
	call LoadStandardMenuDataHeader
	call DisableSpriteUpdates
	pop de
	push de
	ld b, $0
	callba NamingScreen
	pop hl
	ld de, StringBuffer1
	call InitName
	ld a, $4 ; XXX could this be in bank 4 in pokered?
	ld hl, Function2b4d
	rst FarCall
	ret
; e3fd

_BillsPC: ; e3fd
	call Functione40a
	ret c
	call Functione41c
	call Functione443
	jp Functione43f

Functione40a: ; e40a (3:640a)
	ld a, [PartyCount]
	and a
	ret nz
	ld hl, UnknownText_0xe417
	call MenuTextBoxBackup
	scf
	ret
; e417 (3:6417)

UnknownText_0xe417: ; 0xe417
	; You gotta have #MON to call!
	text_jump UnknownText_0x1c1006
	db "@"
; 0xe41c

Functione41c: ; e41c (3:641c)
	xor a
	ld [hBGMapMode], a
	call LoadStandardMenuDataHeader
	call ClearPCItemScreen
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	ld hl, UnknownText_0xe43a
	call PrintText
	pop af
	ld [Options], a
	call LoadFontsBattleExtra
	ret
; e43a (3:643a)

UnknownText_0xe43a: ; 0xe43a
	; What?
	text_jump UnknownText_0x1c1024
	db "@"
; 0xe43f

Functione43f: ; e43f (3:643f)
	call Function2b3c
	ret

Functione443: ; e443 (3:6443)
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	ld a, $1
.loop
	ld [wMenuCursorBuffer], a
	call SetPalettes
	xor a
	ld [wcf76], a
	ld [hBGMapMode], a
	call DoNthMenu
	jr c, .cancel
	ld a, [wMenuCursorBuffer]
	push af
	ld a, [MenuSelection]
	ld hl, .Jumptable
	rst JumpTable
	pop bc
	ld a, b
	jr nc, .loop
.cancel
	call WriteBackup
	ret
; e46f (3:646f)

.MenuDataHeader: ; 0xe46f
	db $40 ; flags
	db 00, 00 ; start coords
	db 17, 19 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0xe477

.MenuData2: ; 0xe477
	db $80 ; flags
	db 0 ; items
	dw .items
	dw Function1f79
	dw .strings
; 0xe47f

.strings: ; e47f
	db "WITHDRAW <PK><MN>@"
	db "DEPOSIT <PK><MN>@"
	db "CHANGE BOX@"
	db "MOVE <PK><MN> W/O MAIL@"
	db "SEE YA!@"

.Jumptable: ; e4ba (3:64ba)
	dw BillsPC_WithdrawMenu
	dw BillsPC_DepositMenu
	dw BillsPC_ChangeBoxMenu
	dw BillsPC_MovePKMNMenu
	dw BillsPC_SeeYa
; e4c4

.items: ; e4c4
	db 5
	db 0 ; WITHDRAW
	db 1;  DEPOSIT
	db 2 ; CHANGE BOX
	db 3 ; MOVE PKMN
	db 4 ; SEE YA!
	db -1
; e4cb

BillsPC_SeeYa: ; e4cb
	scf
	ret
; e4cd

BillsPC_MovePKMNMenu: ; e4cd
	call LoadStandardMenuDataHeader
	callba Function44781
	jr nc, .no_mail
	ld hl, UnknownText_0xe4f9
	call PrintText
	jr .quit

.no_mail
	callba Function14b34
	jr c, .quit
	callba _MovePKMNWithoutMail
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen

.quit
	call WriteBackup
	and a
	ret
; e4f9

UnknownText_0xe4f9: ; 0xe4f9
	; There is a #MON holding MAIL. Please remove the MAIL.
	text_jump UnknownText_0x1c102b
	db "@"
; 0xe4fe

BillsPC_DepositMenu: ; e4fe (3:64fe)
	call LoadStandardMenuDataHeader
	callba _DepositPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call WriteBackup
	and a
	ret
; e512 (3:6512)

Functione512: ; unused
	ld a, [PartyCount]
	and a
	jr z, .asm_e51e
	cp 2
	jr c, .asm_e526
	and a
	ret

.asm_e51e
	ld hl, UnknownText_0xe52e
	call MenuTextBoxBackup
	scf
	ret

.asm_e526
	ld hl, UnknownText_0xe533
	call MenuTextBoxBackup
	scf
	ret
; e52e

UnknownText_0xe52e: ; 0xe52e
	; You don't have a single #MON!
	text_jump UnknownText_0x1c1062
	db "@"
; 0xe533

UnknownText_0xe533: ; 0xe533
	; You can't deposit your last #MON!
	text_jump UnknownText_0x1c1080
	db "@"
; 0xe538


CheckCurPartyMonFainted: ; e538
	ld hl, PartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH
	ld b, $0
.loop
	ld a, [CurPartyMon]
	cp b
	jr z, .skip
	ld a, [hli]
	or [hl]
	jr nz, .notfainted
	dec hl

.skip
	inc b
	ld a, [PartyCount]
	cp b
	jr z, .done
	add hl, de
	jr .loop

.done
	scf
	ret

.notfainted
	and a
	ret
; e559


BillsPC_WithdrawMenu: ; e559 (3:6559)
	call LoadStandardMenuDataHeader
	callba _WithdrawPKMN
	call ReturnToMapFromSubmenu
	call ClearPCItemScreen
	call WriteBackup
	and a
	ret
; e56d (3:656d)

Functione56d: ; unused
	ld a, [PartyCount]
	cp PARTY_LENGTH
	jr nc, .asm_e576
	and a
	ret

.asm_e576
	ld hl, UnknownText_0xe57e
	call MenuTextBoxBackup
	scf
	ret
; e57e

UnknownText_0xe57e: ; 0xe57e
	; You can't take any more #MON.
	text_jump UnknownText_0x1c10a2
	db "@"
; 0xe583

BillsPC_ChangeBoxMenu: ; e583 (3:6583)
	callba _ChangeBox
	and a
	ret

ClearPCItemScreen: ; e58b
	call DisableSpriteUpdates
	xor a
	ld [hBGMapMode], a
	call ClearBGPalettes
	call ClearSprites
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 0,0
	lb bc, 10, 18
	call TextBox
	hlcoord 0,12
	lb bc, 4, 18
	call TextBox
	call Function3200
	call SetPalettes ; load regular palettes?
	ret
; 0xe5bb

Functione5bb: ; e5bb
	ld a, [CurPartyMon]
	ld hl, sBoxMon1Species
	ld bc, $20
	call AddNTimes
	ld de, TempMonSpecies
	ld bc, $20
	ld a, BANK(sBoxMon1Species)
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ret
; e5d9

Functione5d9: ; unreferenced
	ld a, [wCurBox]
	cp b
	jr z, .asm_e5f1
	ld a, b
	ld hl, Unknown_e66e
	ld bc, 3
	call AddNTimes
	ld a, [hli]
	push af
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	jr .asm_e5f6

.asm_e5f1
	ld a, BANK(sBoxCount)
	ld hl, sBoxCount

.asm_e5f6
	call GetSRAMBank
	ld a, [hl]
	ld bc, $16
	add hl, bc
	ld b, a
	ld c, $0
	ld de, wc608
	ld a, b
	and a
	jr z, .asm_e66a
.asm_e608
	push hl
	push bc
	ld a, c
	ld bc, 0
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	ld [CurSpecies], a
	call GetBaseData
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $35c
	add hl, bc
	call SkipNames
	call CopyBytes
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $1f
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hl]
	ld [de], a
	inc de
	pop bc
	pop hl
	push hl
	push bc
	ld a, c
	ld bc, $15
	add hl, bc
	ld bc, $20
	call AddNTimes
	ld a, [hli]
	and $f0
	ld b, a
	ld a, [hl]
	and $f0
	swap a
	or b
	ld b, a
	ld a, [BaseGender]
	cp b
	ld a, $1
	jr c, .asm_e662
	xor a

.asm_e662
	ld [de], a
	inc de
	pop bc
	pop hl
	inc c
	dec b
	jr nz, .asm_e608

.asm_e66a
	call CloseSRAM
	ret
; e66e

Unknown_e66e: ; e66e
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; e698

Functione698: ; e698
	ld hl, wBreedMon1Stats
	ld de, TempMon
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
; e6b3

Functione6b3: ; e6b3
	ld hl, wBreedMon2Stats
	ld de, TempMon
	ld bc, $20
	call CopyBytes
	callab CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
; e6ce


BugContest_SetCaughtContestMon: ; e6ce
	ld a, [wContestMon]
	and a
	jr z, .firstcatch
	ld [wd265], a
	callba DisplayAlreadyCaughtText
	callba DisplayCaughtContestMonStats
	lb bc, 14, 7
	call PlaceYesNoBox
	ret c

.firstcatch
	call .generatestats
	ld a, [TempEnemyMonSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, .caughttext
	call PrintText
	ret
; e6fd

.generatestats: ; e6fd
	ld a, [TempEnemyMonSpecies]
	ld [CurSpecies], a
	ld [CurPartySpecies], a
	call GetBaseData
	xor a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wContestMon
	call ByteFill
	xor a
	ld [MonType], a
	ld hl, wContestMon
	jp GeneratePartyMonStats
; e71d

.caughttext: ; 0xe71d
	; Caught @ !
	text_jump UnknownText_0x1c10c0
	db "@"
; 0xe722


INCLUDE "items/item_effects.asm"


GetPokeBallWobble: ; f971 (3:7971)
; Returns whether a Poke Ball will wobble in the catch animation.
; Whether a Pokemon is caught is determined beforehand.

	push de

	ld a, [rSVBK]
	ld d, a
	push de

	ld a, 1 ; BANK(Buffer2)
	ld [rSVBK], a

	ld a, [Buffer2]
	inc a
	ld [Buffer2], a

; Wobble up to 3 times.
	cp 3 + 1
	jr z, .finished

	ld a, [wc64e]
	and a
	ld c, 0 ; next
	jr nz, .done

	ld hl, WobbleChances
	ld a, [Buffer1]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr nc, .checkwobble
	inc hl
	jr .loop

.checkwobble
	ld b, [hl]
	call Random
	cp b
	ld c, 0 ; next
	jr c, .done
	ld c, 2 ; escaped
	jr .done

.finished
	ld a, [wc64e]
	and a
	ld c, 1 ; caught
	jr nz, .done
	ld c, 2 ; escaped

.done
	pop de
	ld e, a
	ld a, d
	ld [rSVBK], a
	ld a, e
	pop de
	ret
; f9ba (3:79ba)

WobbleChances: ; f9ba
; catch rate, chance of wobbling / 255
	db   1,  63
	db   2,  75
	db   3,  84
	db   4,  90
	db   5,  95
	db   7, 103
	db  10, 113
	db  15, 126
	db  20, 134
	db  30, 149
	db  40, 160
	db  50, 169
	db  60, 177
	db  80, 191
	db 100, 201
	db 120, 211
	db 140, 220
	db 160, 227
	db 180, 234
	db 200, 240
	db 220, 246
	db 240, 251
	db 254, 253
	db 255, 255
; f9ea


KnowsMove: ; f9ea
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld a, [wd262]
	ld b, a
	ld c, NUM_MOVES
.asm_f9f5
	ld a, [hli]
	cp b
	jr z, .asm_f9fe
	dec c
	jr nz, .asm_f9f5
	and a
	ret

.asm_f9fe
	ld hl, UnknownText_0xfa06
	call PrintText
	scf
	ret
; fa06

UnknownText_0xfa06: ; 0xfa06
	; knows @ .
	text_jump UnknownText_0x1c5ea8
	db "@"
; 0xfa0b


SECTION "bank4", ROMX, BANK[$4]

INCLUDE "engine/pack.asm"

INCLUDE "engine/time.asm"

INCLUDE "engine/tmhm.asm"

INCLUDE "engine/namingscreen.asm"

Function11e75: ; 11e75 (4:5e75)
	ld hl, wc6d0
	ld [hl], e
	inc hl
	ld [hl], d
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call Function11e9a
	call DelayFrame
.asm_11e8e
	call Function11fc0
	jr nc, .asm_11e8e
	pop af
	ld [hInMenu], a
	pop af
	ld [hMapAnims], a
	ret

Function11e9a: ; 11e9a (4:5e9a)
	call ClearBGPalettes
	call DisableLCD
	call Function11c51
	ld de, VTiles0 tile $00
	ld hl, GFX_11ef4
	ld bc, $80
	ld a, BANK(GFX_11ef4)
	call FarCopyBytes
	xor a
	ld hl, wc300
	ld [hli], a
	ld [hl], a
	lb de, $18, $10
	ld a, SPRITE_ANIM_INDEX_00
	call _InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	call Function11f84
	ld a, $e3
	ld [rLCDC], a
	call Function11f74
	ld b, SCGB_08
	call GetSGBLayout
	call WaitBGMap
	call WaitTop
	ld a, %11100100
	call DmgToCgbBGPals
	ld a, %11100100
	call Functioncf8
	call Function11be0
	ld hl, wc6d0
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, $10
	add hl, de
	ld [hl], $4e
	ret
; 11ef4 (4:5ef4)

GFX_11ef4: ; 11ef4
INCBIN "gfx/unknown/011ef4.2bpp"
; 11f74

Function11f74: ; 11f74 (4:5f74)
	ld a, $21
	ld [wc6d3], a
	ret
; 11f7a (4:5f7a)

String_11f7a: ; dummied out
	db "メールを かいてね@"
; 11f84

Function11f84: ; 11f84 (4:5f84)
	call WaitTop
	hlcoord 0, 0
	ld bc, 6 * SCREEN_WIDTH
	ld a, $60
	call ByteFill
	hlcoord 0, 6
	ld bc, 12 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	hlcoord 1, 1
	lb bc, 4, SCREEN_WIDTH - 2
	call ClearBox
	ld de, String_121dd

Function11fa9: ; 11fa9 (4:5fa9)
	hlcoord 1, 7
	ld b, 6
.next
	ld c, SCREEN_WIDTH - 1
.loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .loop
	push de
	ld de, 21
	add hl, de
	pop de
	dec b
	jr nz, .next
	ret

Function11fc0: ; 11fc0 (4:5fc0)
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_11fdb
	call Function12008
	callba Function8cf62
	call Function11feb
	call DelayFrame
	and a
	ret
.asm_11fdb
	callab Function8cf53
	call ClearSprites
	xor a
	ld [hSCX], a
	ld [hSCY], a
	scf
	ret

Function11feb: ; 11feb (4:5feb)
	xor a
	ld [hBGMapMode], a
	hlcoord 1, 1
	lb bc, 4, 18
	call ClearBox
	ld hl, wc6d0
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 2, 2
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	ret

Function12008: ; 12008 (4:6008)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_12017
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_12017: ; 12017 (4:6017)
	dw Function1201b
	dw Function1203a


Function1201b: ; 1201b (4:601b)
	lb de, $48, $10
	ld a, SPRITE_ANIM_INDEX_09
	call _InitSpriteAnimStruct
	ld a, c
	ld [wc6d5], a
	ld a, b
	ld [wc6d6], a
	ld hl, $1
	add hl, bc
	ld a, [hl]
	ld hl, $e
	add hl, bc
	ld [hl], a
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function1203a: ; 1203a (4:603a)
	ld hl, hJoyPressed ; $ffa7
	ld a, [hl]
	and A_BUTTON
	jr nz, .a
	ld a, [hl]
	and B_BUTTON
	jr nz, .b
	ld a, [hl]
	and START
	jr nz, .start
	ld a, [hl]
	and SELECT
	jr nz, .select
	ret

.a
	call Function12185
	cp $1
	jr z, .select
	cp $2
	jr z, .b
	cp $3
	jr z, .asm_120a1
	call Function11c11
	call Function121ac
	jr c, .start
	ld hl, wc6d2
	ld a, [hl]
	cp $10
	ret nz
	inc [hl]
	call Function11bd0
	ld [hl], $f2
	dec hl
	ld [hl], $4e
	ret

.start
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld hl, $c
	add hl, bc
	ld [hl], $9
	ld hl, $d
	add hl, bc
	ld [hl], $5
	ret

.b
	call Function11bbc
	ld hl, wc6d2
	ld a, [hl]
	cp $10
	ret nz
	dec [hl]
	call Function11bd0
	ld [hl], $f2
	inc hl
	ld [hl], $4e
	ret

.asm_120a1
	call Function11bf7
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.select
	ld hl, wcf64
	ld a, [hl]
	xor $1
	ld [hl], a
	jr nz, .asm_120ba
	ld de, String_121dd
	call Function11fa9
	ret
.asm_120ba
	ld de, String_1224f
	call Function11fa9
	ret

Function120c1: ; 120c1 (4:60c1)
	call Function1210c
	ld hl, $d
	add hl, bc
	ld a, [hl]
	ld e, a
	swap e
	ld hl, $7
	add hl, bc
	ld [hl], e
	cp $5
	ld de, Unknown_120f8
	ld a, $0
	jr nz, .asm_120df
	ld de, Unknown_12102
	ld a, $1
.asm_120df
	ld hl, $e
	add hl, bc
	add [hl]
	ld hl, $1
	add hl, bc
	ld [hl], a
	ld hl, $c
	add hl, bc
	ld l, [hl]
	ld h, $0
	add hl, de
	ld a, [hl]
	ld hl, $6
	add hl, bc
	ld [hl], a
	ret
; 120f8 (4:60f8)

Unknown_120f8: ; 120f8
	db $00, $10, $20, $30, $40, $50, $60, $70, $80, $90
Unknown_12102: ; 12102
	db $00, $00, $00, $30, $30, $30, $60, $60, $60, $60
; 1210c

Function1210c: ; 1210c (4:610c)
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .up
	ld a, [hl]
	and D_DOWN
	jr nz, .down
	ld a, [hl]
	and D_LEFT
	jr nz, .left
	ld a, [hl]
	and D_RIGHT
	jr nz, .right
	ret
.right
	call Function1218b
	and a
	jr nz, .asm_12138
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $9
	jr nc, .asm_12135
	inc [hl]
	ret
.asm_12135
	ld [hl], $0
	ret
.asm_12138
	cp $3
	jr nz, .asm_1213d
	xor a
.asm_1213d
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.left
	call Function1218b
	and a
	jr nz, .asm_12159
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_12156
	dec [hl]
	ret
.asm_12156
	ld [hl], $9
	ret
.asm_12159
	cp $1
	jr nz, .asm_1215f
	ld a, $4
.asm_1215f
rept 2
	dec a
endr
	ld e, a
	add a
	add e
	ld hl, $c
	add hl, bc
	ld [hl], a
	ret
.down
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nc, .asm_12175
	inc [hl]
	ret
.asm_12175
	ld [hl], $0
	ret
.up
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_12182
	dec [hl]
	ret
.asm_12182
	ld [hl], $5
	ret

Function12185: ; 12185 (4:6185)
	ld hl, wc6d5
	ld c, [hl]
	inc hl
	ld b, [hl]

Function1218b: ; 1218b (4:618b)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $5
	jr nz, .asm_121aa
	ld hl, $c
	add hl, bc
	ld a, [hl]
	cp $3
	jr c, .asm_121a4
	cp $6
	jr c, .asm_121a7
	ld a, $3
	ret
.asm_121a4
	ld a, $1
	ret
.asm_121a7
	ld a, $2
	ret
.asm_121aa
	xor a
	ret

Function121ac: ; 121ac (4:61ac)
	ld a, [wc6d7]
	jp Function11b17
; 121b2 (4:61b2)

Function121b2: ; unreferenced
	ld a, [wc6d2]
	and a
	ret z
	cp $11
	jr nz, .asm_121c3
	push hl
	ld hl, wc6d2
rept 2
	dec [hl]
endr
	jr .asm_121c8

.asm_121c3
	push hl
	ld hl, wc6d2
	dec [hl]

.asm_121c8
	call Function11bd0
	ld c, [hl]
	pop hl
.asm_121cd
	ld a, [hli]
	cp $ff
	jp z, Function11b27
	cp c
	jr z, .asm_121d9
	inc hl
	jr .asm_121cd

.asm_121d9
	ld a, [hl]
	jp Function11b23
; 121dd

String_121dd: ; 122dd
	db "A B C D E F G H I J"
	db "K L M N O P Q R S T"
	db "U V W X Y Z   , ? !"
	db "1 2 3 4 5 6 7 8 9 0"
	db "<PK> <MN> <PO> <KE> é ♂ ♀ ¥ … ×"
	db "lower  DEL   END   "
; 1224f

String_1224f: ; 1224f
	db "a b c d e f g h i j"
	db "k l m n o p q r s t"
	db "u v w x y z   . - /"
	db "'d 'l 'm 'r 's 't 'v & ( )"
	db "<``> <''> [ ] ' : ;      "
	db "UPPER  DEL   END   "
; 122c1

Script_AbortBugContest: ; 0x122c1
	checkflag ENGINE_BUG_CONTEST_TIMER
	iffalse .finish
	setflag ENGINE_DAILY_BUG_CONTEST
	special ContestReturnMons
.finish
	end
; 0x122ce

INCLUDE "event/itemball.asm"
INCLUDE "engine/healmachineanim.asm"
INCLUDE "event/whiteout.asm"
INCLUDE "event/forced_movement.asm"
INCLUDE "event/itemfinder.asm"
INCLUDE "engine/startmenu.asm"
INCLUDE "engine/selectmenu.asm"
INCLUDE "event/elevator.asm"

Special_GiveParkBalls: ; 135db
	xor a
	ld [wContestMon], a
	ld a, 20
	ld [wParkBallsRemaining], a
	callba StartBugContestTimer
	ret
; 135eb

BugCatchingContestBattleScript:: ; 0x135eb
	writecode VAR_BATTLETYPE, BATTLETYPE_CONTEST
	battlecheck
	startbattle
	returnafterbattle
	copybytetovar wParkBallsRemaining
	iffalse BugCatchingContestOutOfBallsScript
	end
; 0x135f8

BugCatchingContestOverScript:: ; 0x135f8
	playsound SFX_ELEVATOR_END
	loadfont
	writetext UnknownText_0x1360f
	closetext
	jump BugCatchingContestReturnToGateScript
; 0x13603

BugCatchingContestOutOfBallsScript: ; 0x13603
	playsound SFX_ELEVATOR_END
	loadfont
	writetext UnknownText_0x13614
	closetext

BugCatchingContestReturnToGateScript: ; 0x1360b
	loadmovesprites
	jumpstd bugcontestresultswarp
; 0x1360f

UnknownText_0x1360f: ; 0x1360f
	; ANNOUNCER: BEEEP! Time's up!
	text_jump UnknownText_0x1bd2ca
	db "@"
; 0x13614

UnknownText_0x13614: ; 0x13614
	; ANNOUNCER: The Contest is over!
	text_jump UnknownText_0x1bd2e7
	db "@"
; 0x13619

RepelWoreOffScript:: ; 0x13619
	loadfont
	writetext .text
	closetext
	loadmovesprites
	end
; 0x13620

.text: ; 0x13620
	; REPEL's effect wore off.
	text_jump UnknownText_0x1bd308
	db "@"
; 0x13625

SignpostItemScript:: ; 0x13625
	loadfont
	copybytetovar EngineBuffer3
	itemtotext 0, 0
	writetext .found_text
	giveitem ITEM_FROM_MEM
	iffalse .bag_full
	callasm SetMemEvent
	specialsound
	itemnotify
	jump .finish
; 0x1363e

.bag_full: ; 0x1363e
	keeptextopen
	writetext .no_room_text
	closetext

.finish: ; 13643
	loadmovesprites
	end
; 0x13645

.found_text: ; 0x13645
	; found @ !
	text_jump UnknownText_0x1bd321
	db "@"
; 0x1364a

.no_room_text: ; 0x1364a
	; But   has no space left…
	text_jump UnknownText_0x1bd331
	db "@"
; 0x1364f

SetMemEvent: ; 1364f
	ld hl, EngineBuffer1 ; wd03e (aliases: MenuItemsList, CurFruitTree, CurInput)
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld b, SET_FLAG
	call EventFlagAction
	ret


CheckFacingTileForStd:: ; 1365b
; Checks to see if the tile you're facing has a std script associated with it.  If so, executes the script and returns carry.
	ld a, c
	ld de, 3
	ld hl, .table1
	call IsInArray
	jr nc, .notintable

	ld a, jumpstd_command
	ld [wJumpStdScriptBuffer], a
	inc hl
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 1], a
	ld a, [hli]
	ld [wJumpStdScriptBuffer + 2], a
	ld a, BANK(Script_JumpStdFromRAM)
	ld hl, Script_JumpStdFromRAM
	call CallScript
	scf
	ret

.notintable
	xor a
	ret
; 13681

.table1
	dbw $91, magazinebookshelf
	dbw $93, pcscript
	dbw $94, radio1
	dbw $95, townmap
	dbw $96, merchandiseshelf
	dbw $97, tv
	dbw $9d, window
	dbw $9f, incenseburner
	db $ff ; end
; 1369a

Script_JumpStdFromRAM: ; 0x1369a
	jump wJumpStdScriptBuffer
; 0x1369d

INCLUDE "event/bug_contest_judging.asm"

; decreases all pokemon's pokerus counter by b. if the lower nybble reaches zero, the pokerus is cured.
ApplyPokerusTick: ; 13988
	ld hl, PartyMon1PokerusStatus ; PartyMon1 + MON_PKRS
	ld a, [PartyCount]
	and a
	ret z
	ld c, a
.loop
	ld a, [hl]
	and $f
	jr z, .does_not_have_pokerus
	sub b
	jr nc, .ok
	xor a

.ok
	ld d, a
	ld a, [hl]
	and $f0
	add d
	ld [hl], a

.does_not_have_pokerus
	ld de, PARTYMON_STRUCT_LENGTH
	add hl, de
	dec c
	jr nz, .loop
	ret
; 139a8

INCLUDE "event/bug_contest_2.asm"

INCLUDE "unknown/013a47.asm"

GetSquareRoot: ; 13b87
; Return the square root of de in b.

; Rather than calculating the result, we take the index of the
; first value in a table of squares that isn't lower than de.

	ld hl, Squares
	ld b, 0
.loop
; Make sure we don't go past the end of the table.
	inc b
	ld a, b
	cp $ff
	ret z

; Iterate over the table until b**2 >= de.
	ld a, [hli]
	sub e
	ld a, [hli]
	sbc d

	jr c, .loop
	ret

Squares: ; 13b98
root	set 1
	rept $ff
	dw root*root
root	set root+1
	endr
; 13d96


SECTION "bank5", ROMX, BANK[$5]


StopRTC: ; Unreferenced???
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	call LatchClock
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	set 6, a ; halt
	ld [MBC3RTC], a
	call CloseSRAM
	ret
; 14019

StartRTC: ; 14019
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	call LatchClock
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	res 6, a ; halt
	ld [MBC3RTC], a
	call CloseSRAM
	ret
; 14032


GetTimeOfDay:: ; 14032
; get time of day based on the current hour
	ld a, [hHours] ; hour
	ld hl, TimesOfDay

.check
; if we're within the given time period,
; get the corresponding time of day
	cp [hl]
	jr c, .match
; else, get the next entry
rept 2
	inc hl
endr
; try again
	jr .check

.match
; get time of day
	inc hl
	ld a, [hl]
	ld [TimeOfDay], a
	ret
; 14044

TimesOfDay: ; 14044
; hours for the time of day
; 04-09 morn | 10-17 day | 18-03 nite
	db 04, NITE
	db 10, MORN
	db 18, DAY
	db 24, NITE
	db -1, MORN
; 1404e

Unknown_1404e: ; Unreferenced
	db 20, 2
	db 40, 0
	db 60, 1
	db -1, 0
; 14056


Function14056: ; 14056
	call UpdateTime
	ld hl, wRTC
	ld a, [CurDay]
	ld [hli], a
	ld a, [hHours]
	ld [hli], a
	ld a, [hMinutes]
	ld [hli], a
	ld a, [hSeconds]
	ld [hli], a
	ret
; 1406a

Function1406a: ; 1406a
	ld a, $a
	ld [MBC3SRamEnable], a
	call LatchClock
	ld hl, MBC3RTC
	ld a, $c
	ld [MBC3SRamBank], a
	res 7, [hl]
	ld a, BANK(s0_ac60)
	ld [MBC3SRamBank], a
	xor a
	ld [s0_ac60], a
	call CloseSRAM
	ret
; 14089



StartClock:: ; 14089
	call GetClock
	call Function1409b
	call FixDays
	jr nc, .skip_set
	; bit 5: Day count exceeds 139
	; bit 6: Day count exceeds 255
	call Function6d3 ; set flag on s0_ac60

.skip_set
	call StartRTC
	ret
; 1409b

Function1409b: ; 1409b
	ld hl, hRTCDayHi
	bit 7, [hl]
	jr nz, .set_bit_7
	bit 6, [hl]
	jr nz, .set_bit_7
	xor a
	ret

.set_bit_7
	; Day count exceeds 16383
	ld a, %10000000
	call Function6d3 ; set bit 7 on s0_ac60
	ret
; 140ae

Function140ae: ; 140ae
	call Function6e3
	ld c, a
	and %11000000 ; Day count exceeded 255 or 16383
	jr nz, .time_overflow

	ld a, c
	and %00100000 ; Day count exceeded 139
	jr z, .dont_update

	call UpdateTime
	ld a, [wRTC + 0]
	ld b, a
	ld a, [CurDay]
	cp b
	jr c, .dont_update

.time_overflow
	callba ClearDailyTimers
	callba Function170923
; mobile
	ld a, $5
	call GetSRAMBank
	ld a, [$aa8c]
	inc a
	ld [$aa8c], a
	ld a, [$b2fa]
	inc a
	ld [$b2fa], a
	call CloseSRAM
	ret

.dont_update
	xor a
	ret
; 140ed



Function140ed:: ; 140ed
	call GetClock
	call FixDays
	ld hl, hRTCSeconds
	ld de, StartSecond

	ld a, [StringBuffer2 + 3]
	sub [hl]
	dec hl
	jr nc, .asm_14102
	add 60
.asm_14102
	ld [de], a
	dec de

	ld a, [StringBuffer2 + 2]
	sbc [hl]
	dec hl
	jr nc, .asm_1410d
	add 60
.asm_1410d
	ld [de], a
	dec de

	ld a, [StringBuffer2 + 1]
	sbc [hl]
	dec hl
	jr nc, .asm_14118
	add 24
.asm_14118
	ld [de], a
	dec de

	ld a, [StringBuffer2]
	sbc [hl]
	dec hl
	jr nc, .asm_14128
	add 140
	ld c, 7
	call SimpleDivide

.asm_14128
	ld [de], a
	ret
; 1412a

INCLUDE "engine/overworld.asm"

Function1499a:: ; 1499a
	ld a, [PlayerNextTile]
	cp $60
	jr z, .asm_149ad
	cp $68
	jr z, .asm_149ad
	and $f0
	cp $70
	jr z, .asm_149ad
	and a
	ret

.asm_149ad
	scf
	ret
; 149af

Function149af:: ; 149af
	ld a, [PlayerNextTile]
	cp $70
	jr z, .asm_149c4
	cp $76
	jr z, .asm_149c4
	cp $78
	jr z, .asm_149c4
	cp $7e
	jr z, .asm_149c4
	scf
	ret

.asm_149c4
	xor a
	ret
; 149c6

CheckWarpCollision: ; 149c6
	ld de, 1
	ld hl, .blocks
	ld a, [PlayerNextTile]
	call IsInArray
	ret
; 149d3

.blocks: ; 149d3
	db $71 ; door
	db $79
	db $7a ; stairs
	db $73
	db $7b ; cave entrance
	db $74
	db $7c ; warp pad
	db $75
	db $7d
	db -1
; 149dd

CheckGrassCollision:: ; 149dd
	ld a, [PlayerNextTile]
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret
; 149ea

.blocks: ; 149ea
	db $08
	db $18 ; tall grass
	db $14 ; tall grass
	db $28
	db $29
	db $48
	db $49
	db $4a
	db $4b
	db $4c
	db -1
; 149f5

CheckCutCollision: ; 149f5
	ld a, c
	ld hl, .blocks
	ld de, 1
	call IsInArray
	ret
; 14a00

.blocks: ; 14a00
	db $12 ; cut tree
	db $1a ; cut tree
	db $10 ; tall grass
	db $18 ; tall grass
	db $14 ; tall grass
	db $1c ; tall grass
	db -1
; 14a07

Function14a07:: ; 14a07
	ld a, [PlayerNextTile]
	ld de, $1f
	cp $71 ; door
	ret z
	ld de, $13
	cp $7c ; warp pad
	ret z
	ld de, $23
	ret
; 14a1a

INCLUDE "engine/save.asm"

INCLUDE "engine/spawn_points.asm"

INCLUDE "engine/map_setup.asm"

INCLUDE "engine/pokecenter_pc.asm"

INCLUDE "engine/mart.asm"

INCLUDE "engine/money.asm"

INCLUDE "items/marts.asm"

INCLUDE "event/mom.asm"

INCLUDE "event/daycare.asm"

Function16be4: ; 16be4
	ld a, [UnownDex]
	and a
	ret z

	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	ld a, [Options]
	push af
	set NO_TEXT_SCROLL, a
	ld [Options], a
	call ClearBGPalettes
	call ClearTileMap

	ld de, UnownDexATile
	ld hl, VTiles1 tile $6f
	lb bc, BANK(UnownDexBTile), 1
	call Request1bpp

	ld de, UnownDexBTile
	ld hl, VTiles1 tile $75
	lb bc, BANK(UnownDexBTile), 1
	call Request1bpp

	hlcoord 0, 0
	lb bc, 3, 18
	call TextBox

	hlcoord 0, 5
	lb bc, 7, 7
	call TextBox

	hlcoord 0, 14
	lb bc, 2, 18
	call TextBox

	hlcoord 1, 2
	ld de, AlphRuinsStampString
	call PlaceString

	hlcoord 1, 16
	ld de, UnownDexDoWhatString
	call PlaceString

	hlcoord 10, 6
	ld de, UnownDexMenuString
	call PlaceString

	xor a
	ld [wJumptableIndex], a
	call Function16cc8
	call WaitBGMap

	ld a, UNOWN
	ld [CurPartySpecies], a
	xor a
	ld [TempMonDVs], a
	ld [TempMonDVs + 1], a

	ld b, SCGB_1C
	call GetSGBLayout
	call SetPalettes

.joy_loop
	call JoyTextDelay

	ld a, [hJoyPressed]
	and B_BUTTON
	jr nz, .pressed_b

	ld a, [hJoyPressed]
	and A_BUTTON
	jr nz, .pressed_a

	call Function16ca0
	call DelayFrame
	jr .joy_loop

.pressed_a
	ld a, [wJumptableIndex]
	push af
	callba Function84560
	call RestartMapMusic
	pop af
	ld [wJumptableIndex], a
	jr .joy_loop

.pressed_b
	pop af
	ld [Options], a
	pop af
	ld [hInMenu], a
	call ReturnToMapFromSubmenu
	ret
; 16ca0

Function16ca0: ; 16ca0
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .press_right
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .press_left
	ret

.press_left
	ld hl, wJumptableIndex
	ld a, [hl]
	and a
	jr nz, .wrap_around_left
	ld [hl], $1b

.wrap_around_left
	dec [hl]
	jr .return

.press_right
	ld hl, wJumptableIndex
	ld a, [hl]
	cp $1a
	jr c, .wrap_around_right
	ld [hl], $ff

.wrap_around_right
	inc [hl]

.return
	call Function16cc8
	ret
; 16cc8

Function16cc8: ; 16cc8
	ld a, [wJumptableIndex]
	cp 26
	jr z, Function16d20
	inc a
	ld [UnownLetter], a
	ld a, UNOWN
	ld [CurPartySpecies], a
	xor a
	ld [wc2c6], a
	ld de, VTiles2
	predef GetFrontpic
	call Function16cff
	hlcoord 1, 6
	xor a
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	ld de, VTiles2 tile $31
	callba Functione0000
	ret
; 16cff

Function16cff: ; 16cff
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld a, BANK(sScratch)
	call GetSRAMBank
	ld de, w6_d000
	ld hl, sScratch
	ld a, [hROMBank]
	ld b, a
	ld c, $31
	call Get2bpp
	call CloseSRAM

	pop af
	ld [rSVBK], a
	ret
; 16d20

Function16d20: ; 16d20
	hlcoord 1, 6
	lb bc, 7, 7
	call ClearBox
	hlcoord 1, 9
	ld de, UnownDexVacantString
	call PlaceString
	xor a
	call GetSRAMBank
	ld hl, sScratch
	ld bc, $31 tiles
	xor a
	call ByteFill
	ld hl, VTiles2 tile $31
	ld de, sScratch
	ld c, $31
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ld c, 20
	call DelayFrames
	ret
; 16d57

AlphRuinsStampString:
	db " ALPH RUINS STAMP@"

UnownDexDoWhatString:
	db "Do what?@"

UnownDexMenuString:
	db   "♂ PRINT"
	next "♀ CANCEL"
	next "← PREVIOUS"
	next "→ NEXT"
	db   "@"

UnownDexVacantString:
	db "VACANT@"
; 16d9c

UnownDexATile: ; 16d9c
INCBIN "gfx/unknown/016d9c.1bpp"
UnownDexBTile: ; 16da4
INCBIN "gfx/unknown/016da4.1bpp"
; 16dac

Function16dac: ; 16dac
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 7, 11
	ld a, $31
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	ret
; 16dc7

PhotoStudio: ; 16dc7
	ld hl, .Text_AskWhichMon
	call PrintText
	callba SelectMonFromParty
	jr c, .cancel
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg

	ld hl, .Text_HoldStill
	call PrintText
	call DisableSpriteUpdates
	callba Function8461a
	call Function2b74
	ld a, [$ffac]
	and a
	jr nz, .cancel
	ld hl, .Text_Presto
	jr .print_text

.cancel
	ld hl, .Text_NoPicture
	jr .print_text

.egg
	ld hl, .Text_Egg

.print_text
	call PrintText
	ret
; 16e04

.Text_AskWhichMon: ; 0x16e04
	; Which #MON should I photo- graph?
	text_jump UnknownText_0x1be024
	db "@"
; 0x16e09

.Text_HoldStill: ; 0x16e09
	; All righty. Hold still for a bit.
	text_jump UnknownText_0x1be047
	db "@"
; 0x16e0e

.Text_Presto: ; 0x16e0e
	; Presto! All done. Come again, OK?
	text_jump UnknownText_0x1be06a
	db "@"
; 0x16e13

.Text_NoPicture: ; 0x16e13
	; Oh, no picture? Come again, OK?
	text_jump UnknownText_0x1c0000
	db "@"
; 0x16e18

.Text_Egg: ; 0x16e18
	; An EGG? My talent is worth more…
	text_jump UnknownText_0x1c0021
	db "@"
; 0x16e1d

INCLUDE "engine/breeding/egg.asm"

SECTION "Tileset Data 1", ROMX, BANK[TILESETS_1]

INCLUDE "tilesets/data_1.asm"


SECTION "Roofs", ROMX, BANK[ROOFS]

INCLUDE "tilesets/roofs.asm"


SECTION "Tileset Data 2", ROMX, BANK[TILESETS_2]

INCLUDE "tilesets/data_2.asm"



SECTION "bank8", ROMX, BANK[$8]

INCLUDE "engine/clock_reset.asm"

SECTION "Tileset Data 3", ROMX, BANK[TILESETS_3]

INCLUDE "tilesets/data_3.asm"


SECTION "bank9", ROMX, BANK[$9]

StringBufferPointers:: ; 24000
	dw StringBuffer3
	dw StringBuffer4
	dw StringBuffer5
	dw StringBuffer2
	dw StringBuffer1
	dw EnemyMonNick
	dw BattleMonNick
; 2400e

INCLUDE "engine/menu.asm"

_BackUpTiles:: ; 24374
	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a

	ld hl, wcf71
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de

	ld b, $10
	ld hl, wMenuFlags
.loop
	ld a, [hli]
	ld [de], a
	dec de
	dec b
	jr nz, .loop

; If bit 6 or 7 of the menu flags is set, set bit 0 of the address
; at 7:[wcf71], and draw the menu using the coordinates from the header.
; Otherwise, reset bit 0 of 7:[wcf71].
	ld a, [wMenuFlags]
	bit 6, a
	jr nz, .bit_6
	bit 7, a
	jr z, .not_bit_7

.bit_6
	ld hl, wcf71
	ld a, [hli]
	ld h, [hl]
	ld l, a
	set 0, [hl]
	call MenuBoxCoord2Tile
	call .copy
	call MenuBoxCoord2Attr
	call .copy
	jr .done

.not_bit_7
	pop hl ; last-pushed register was de
	push hl
	ld a, [hld]
	ld l, [hl]
	ld h, a
	res 0, [hl]

.done
	pop hl
	call .ret ; empty function
	ld a, h
	ld [de], a
	dec de
	ld a, l
	ld [de], a
	dec de
	ld hl, wcf71
	ld [hl], e
	inc hl
	ld [hl], d

	pop af
	ld [rSVBK], a
	ld hl, wcf78
	inc [hl]
	ret
; 243cd

.copy: ; 243cd
	call GetMenuBoxDims
	inc b
	inc c
	call .ret ; empty function

.row
	push bc
	push hl

.col
	ld a, [hli]
	ld [de], a
	dec de
	dec c
	jr nz, .col

	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row

	ret
; 243e7

.ret: ; 243e7
	ret
; 243e8

Function243e8:: ; 243e8
	xor a
	ld [hBGMapMode], a

	ld a, [rSVBK]
	push af
	ld a, $7
	ld [rSVBK], a

	call Function1c7e
	ld a, l
	or h
	jp z, Function2445d
	ld a, l
	ld [wcf71], a
	ld a, h
	ld [wcf72], a
	call Function1c47
	ld a, [wMenuFlags]
	bit 0, a
	jr z, .next
	ld d, h
	ld e, l
	call RestoreTileBackup

.next
	call Function1c7e
	ld a, h
	or l
	jr z, .done
	call Function1c47

.done
	pop af
	ld [rSVBK], a
	ld hl, wcf78
	dec [hl]
	ret
; 24423


Function24423: ; 24423
	ld a, [VramState]
	bit 0, a
	ret z
	xor a
	call GetSRAMBank
	hlcoord 0, 0
	ld de, sScratch
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	call CloseSRAM
	call OverworldTextModeSwitch
	xor a
	call GetSRAMBank
	ld hl, sScratch
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
.asm_2444c
	ld a, [hl]
	cp $61
	jr c, .asm_24452
	ld [de], a

.asm_24452
	inc hl
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_2444c
	call CloseSRAM
	ret
; 2445d

Function2445d: ; 2445d
	ld hl, UnknownText_0x24468
	call PrintText
	call WaitBGMap
.asm_24466
	jr .asm_24466
; 24468

UnknownText_0x24468: ; 24468
	text_jump UnknownText_0x1c46b7
	db "@"
; 2446d

Function2446d:: ; 2446d
	ld a, [wMenuData2Flags]
	ld b, a
	ld hl, wcfa1
	ld a, [wMenuBorderTopCoord]
	inc a
	bit 6, b
	jr nz, .asm_2447d
	inc a

.asm_2447d
	ld [hli], a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld [hli], a
	ld a, [wMenuData2Items]
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	bit 5, b
	jr z, .asm_24492
	set 5, [hl]

.asm_24492
	ld a, [wMenuFlags]
	bit 4, a
	jr z, .asm_2449b
	set 6, [hl]

.asm_2449b
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	bit 0, b
	jr nz, .asm_244a9
	add $2

.asm_244a9
	ld [hli], a
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .asm_244b7
	ld c, a
	ld a, [wMenuData2Items]
	cp c
	jr nc, .asm_244b9

.asm_244b7
	ld c, $1

.asm_244b9
	ld [hl], c
	inc hl
	ld a, $1
	ld [hli], a
	xor a
rept 3
	ld [hli], a
endr
	ret
; 244c3


Function244c3: ; 0x244c3
	ld a, [MenuSelection]
	ld [CurSpecies], a
	hlcoord 0, 12
	ld b, 4
	ld c, SCREEN_WIDTH - 2
	call TextBox
	ld a, [MenuSelection]
	cp -1
	ret z
	decoord 1, 14
	callba PrintItemDescription
	ret
; 0x244e3

Pokepic:: ; 244e3
	ld hl, MenuDataHeader_0x24547
	call CopyMenuDataHeader
	call MenuBox
	call UpdateSprites
	call Function321c
	ld b, SCGB_12
	call GetSGBLayout
	xor a
	ld [hBGMapMode], a
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld de, VTiles1
	predef GetFrontpic
	ld a, [wMenuBorderTopCoord]
	inc a
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	inc a
	ld c, a
	call Coord2Tile
	ld a, $80
	ld [hFillBox], a
	lb bc, 7, 7
	predef FillBox
	call WaitBGMap
	ret
; 24528

PokepicYesOrNo:: ; 24528
	ld hl, MenuDataHeader_0x24547
	call CopyMenuDataHeader
	call ClearMenuBoxInterior
	call WaitBGMap
	call ClearSGB
	xor a
	ld [hBGMapMode], a
	call OverworldTextModeSwitch
	call Function321c
	call UpdateSprites
	call LoadStandardFont
	ret
; 24547

MenuDataHeader_0x24547: ; 0x24547
	db $40 ; flags
	db 04, 06 ; start coords
	db 13, 14 ; end coords
	dw NULL
	db 1 ; default option
; 0x2454f

LoadObjectMasks: ; 2454f
	ld hl, wObjectMasks
	xor a
	ld bc, NUM_OBJECTS
	call ByteFill
	nop
	ld bc, MapObjects
	ld de, wObjectMasks
	xor a
.loop
	push af
	push bc
	push de
	call GetObjectTimeMask
	jr c, .next
	call CheckObjectFlag
.next
	pop de
	ld [de], a
	inc de
	pop bc
	ld hl, OBJECT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop af
	inc a
	cp NUM_OBJECTS
	jr nz, .loop
	ret

CheckObjectFlag: ; 2457d (9:457d)
	ld hl, MAPOBJECT_SPRITE
	add hl, bc
	ld a, [hl]
	and a
	jr z, .masked
	ld hl, MAPOBJECT_EVENT_FLAG
	add hl, bc
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld d, a
	cp -1
	jr nz, .check
	ld a, e
	cp -1
	jr z, .unmasked
	jr .masked
.check
	ld b, CHECK_FLAG
	call EventFlagAction
	ld a, c
	and a
	jr nz, .masked
.unmasked
	xor a
	ret

.masked
	ld a, -1
	scf
	ret

GetObjectTimeMask: ; 245a7 (9:45a7)
	call CheckObjectTime
	ld a, -1
	ret c
	xor a
	ret


Function245af:: ; 245af
	xor a
	ld [wcf73], a
	ld [hBGMapMode], a
	inc a
	ld [hInMenu], a
	call ClearObjectStructsa
	call Function24764
	call Function247dd
	call Function245f1
	call Function321c
	xor a
	ld [hBGMapMode], a
	ret
; 245cb

Function245cb:: ; 245cb
.loop
	call MenuJoyAction
	jp c, .exit
	call z, .zero
	jr .loop
; 245d6

.exit: ; 245d6
	call Function1ff8
	ld [wcf73], a
	ld a, 0
	ld [hInMenu], a
	ret
; 245e1

.zero: ; 245e1
	call Function245f1
	ld a, 1
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ret
; 245f1

Function245f1: ; 245f1
	xor a
	ld [hBGMapMode], a
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	call Function247f0
	call Function2488b
	call Function248b8
	pop af
	ld [Options], a
	ret
; 24609

MenuJoyAction: ; 24609
.loop
	call Function1bd3
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyPressed]
	and BUTTONS
	or b
	bit 0, a ; A
	jp nz, .a_button
	bit 1, a ; B
	jp nz, .b_button
	bit 2, a ; Select
	jp nz, .select
	bit 3, a ; Start
	jp nz, .start
	bit 4, a ; Right
	jp nz, .d_right
	bit 5, a ; Left
	jp nz, .d_left
	bit 6, a ; Up
	jp nz, .d_up
	bit 7, a ; Down
	jp nz, .d_down
	jr .loop
; 24640

.unreferenced: ; unreferenced
	ld a, -1
	and a
	ret
; 24644


.a_button: ; 24644
	call Function1bee
	ld a, [MenuSelection2]
	dec a
	call Function248d5
	ld a, [MenuSelection]
	ld [CurItem], a
	ld a, [wcf75]
	ld [wItemQuantityBuffer], a
	call Function246fc
	dec a
	ld [wcf77], a
	ld [wd107], a
	ld a, [MenuSelection]
	cp -1
	jr z, .b_button
	ld a, A_BUTTON
	scf
	ret
; 2466f

.b_button: ; 2466f
	ld a, B_BUTTON
	scf
	ret
; 24673

.select: ; 24673
	ld a, [wMenuData2Flags]
	bit 7, a
	jp z, xor_a_dec_a
	ld a, [MenuSelection2]
	dec a
	call Function248d5
	ld a, [MenuSelection]
	cp -1
	jp z, xor_a_dec_a
	call Function246fc
	dec a
	ld [wcf77], a
	ld a, SELECT
	scf
	ret
; 24695

.start: ; 24695
	ld a, [wMenuData2Flags]
	bit 6, a
	jp z, xor_a_dec_a
	ld a, START
	scf
	ret
; 246a1

.d_left: ; 246a1
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 3, a
	jp z, xor_a_dec_a
	ld a, D_LEFT
	scf
	ret
; 246b5

.d_right: ; 246b5
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a_dec_a
	ld a, [wMenuData2Flags]
	bit 2, a
	jp z, xor_a_dec_a
	ld a, D_RIGHT
	scf
	ret
; 246c9

.d_up: ; 246c9
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a
	ld hl, wd0e4
	ld a, [hl]
	and a
	jr z, .xor_dec_up
	dec [hl]
	jp xor_a

.xor_dec_up
	jp xor_a_dec_a
; 246df

.d_down: ; 246df
	ld hl, wcfa6
	bit 7, [hl]
	jp z, xor_a
	ld hl, wd0e4
	ld a, [wMenuData2Items]
	add [hl]
	ld b, a
	ld a, [wd144]
	cp b
	jr c, .xor_dec_down
	inc [hl]
	jp xor_a

.xor_dec_down
	jp xor_a_dec_a
; 246fc

Function246fc: ; 246fc
	ld a, [wd0e4]
	ld c, a
	ld a, [MenuSelection2]
	add c
	ld c, a
	ret
; 24706

Function24706: ; 24706 (9:4706)
	call MenuBoxCoord2Tile
	ld de, SCREEN_WIDTH
	add hl, de
	ld de, 2 * SCREEN_WIDTH
	ld a, [wMenuData2Items]
.asm_24713
	ld [hl], " "
	add hl, de
	dec a
	jr nz, .asm_24713
	ret

ClearObjectStructsa: ; 2471a
; Get the value of (wcf95):(wcf96,wcf97) and store it in wd144.
	ld hl, wcf96
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcf95]
	call GetFarByte
	ld [wd144], a
; if ([wd144] + 1) < [wMenuData2Items] + [wd0e4]: [wd0e4] = max(([wd144] + 1) - [wMenuData2Items], 0)
	ld a, [wMenuData2Items]
	ld c, a
	ld a, [wd0e4]
	add c
	ld c, a
	ld a, [wd144]
	inc a
	cp c
	jr nc, .skip
	ld a, [wMenuData2Items]
	ld c, a
	ld a, [wd144]
	inc a
	sub c
	jr nc, .store
	xor a

.store
	ld [wd0e4], a

.skip
	ld a, [wd0e4]
	ld c, a
	ld a, [wMenuCursorBuffer]
	add c
	ld b, a
	ld a, [wd144]
	inc a
	cp b
	jr c, .asm_2475a
	jr nc, .asm_24763

.asm_2475a
	xor a
	ld [wd0e4], a
	ld a, $1
	ld [wMenuCursorBuffer], a

.asm_24763
	ret
; 24764

Function24764: ; 24764
	ld a, [wMenuData2Flags]
	ld c, a
	ld a, [wd144]
	ld b, a
	ld a, [wMenuBorderTopCoord]
	add $1
	ld [wcfa1], a
	ld a, [wMenuBorderLeftCoord]
	add $0
	ld [wcfa2], a
	ld a, [wMenuData2Items]
	cp b
	jr c, .asm_24786
	jr z, .asm_24786
	ld a, b
	inc a

.asm_24786
	ld [wcfa3], a
	ld a, $1
	ld [wcfa4], a
	ld a, $8c
	bit 2, c
	jr z, .asm_24796
	set 0, a

.asm_24796
	bit 3, c
	jr z, .asm_2479c
	set 1, a

.asm_2479c
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	ld a, $20
	ld [wcfa7], a
	ld a, $c3
	bit 7, c
	jr z, .asm_247b0
	add $4

.asm_247b0
	bit 6, c
	jr z, .asm_247b6
	add $8

.asm_247b6
	ld [wcfa8], a
	ld a, [wcfa3]
	ld b, a
	ld a, [wMenuCursorBuffer]
	and a
	jr z, .asm_247c8
	cp b
	jr z, .asm_247ca
	jr c, .asm_247ca

.asm_247c8
	ld a, $1

.asm_247ca
	ld [MenuSelection2], a
	ld a, $1
	ld [wcfaa], a
	xor a
	ld [wcfac], a
	ld [wcfad], a
	ld [wcfab], a
	ret
; 247dd

Function247dd: ; 247dd
	ld a, [wd144]
	ld c, a
	ld a, [wd0e3]
	and a
	jr z, .asm_247ef
	dec a
	cp c
	jr c, .asm_247ef
	xor a
	ld [wd0e3], a

.asm_247ef
	ret
; 247f0

Function247f0: ; 247f0
	call ClearWholeMenuBox
	ld a, [wMenuData2Flags]
	bit 4, a
	jr z, .asm_2480d
	ld a, [wd0e4]
	and a
	jr z, .asm_2480d
	ld a, [wMenuBorderTopCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], $61

.asm_2480d
	call MenuBoxCoord2Tile
	ld bc, $15
	add hl, bc
	ld a, [wMenuData2Items]
	ld b, a
	ld c, $0
.asm_2481a
	ld a, [wd0e4]
	add c
	ld [wcf77], a
	ld a, c
	call Function248d5
	ld a, [MenuSelection]
	cp $ff
	jr z, .asm_24851
	push bc
	push hl
	call Function2486e
	pop hl
	ld bc, $28
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp b
	jr nz, .asm_2481a
	ld a, [wMenuData2Flags]
	bit 4, a
	jr z, .asm_24850
	ld a, [wMenuBorderBottomCoord]
	ld b, a
	ld a, [wMenuBorderRightCoord]
	ld c, a
	call Coord2Tile
	ld [hl], $ee

.asm_24850
	ret

.asm_24851
	ld a, [wMenuData2Flags]
	bit 0, a
	jr nz, .asm_24866
	ld de, .string_2485f
	call PlaceString
	ret

.string_2485f
	db "CANCEL@"

.asm_24866
	ld d, h
	ld e, l
	ld hl, wcf98
	jp CallPointerAt
; 2486e

Function2486e: ; 2486e
	push hl
	ld d, h
	ld e, l
	ld hl, wcf98
	call CallPointerAt
	pop hl
	ld a, [wcf93]
	and a
	jr z, .asm_2488a
	ld e, a
	ld d, $0
	add hl, de
	ld d, h
	ld e, l
	ld hl, wcf9b
	call CallPointerAt

.asm_2488a
	ret
; 2488b

Function2488b: ; 2488b
	ld a, [wd0e3]
	and a
	jr z, .asm_248b7
	ld b, a
	ld a, [wd0e4]
	cp b
	jr nc, .asm_248b7
	ld c, a
	ld a, [wMenuData2Items]
	add c
	cp b
	jr c, .asm_248b7
	ld a, b
	sub c
	dec a
	add a
	add $1
	ld c, a
	ld a, [wMenuBorderTopCoord]
	add c
	ld b, a
	ld a, [wMenuBorderLeftCoord]
	add $0
	ld c, a
	call Coord2Tile
	ld [hl], $ec

.asm_248b7
	ret
; 248b8

Function248b8: ; 248b8
	ld a, [wMenuData2Flags]
	bit 5, a
	ret z
	bit 1, a
	jr z, .asm_248c7
	ld a, [wd0e3]
	and a
	ret nz

.asm_248c7
	ld a, [MenuSelection2]
	dec a
	call Function248d5
	ld hl, wcf9e
	call CallPointerAt
	ret
; 248d5

Function248d5: ; 248d5
	push de
	push hl
	ld e, a
	ld a, [wd0e4]
	add e
	ld e, a
	ld d, $0
	ld hl, wcf96
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [wcf94]
	cp $1
	jr z, .asm_248f2
	cp $2
	jr z, .asm_248f1

.asm_248f1
	add hl, de

.asm_248f2
	add hl, de
	ld a, [wcf95]
	call GetFarByte
	ld [MenuSelection], a
	ld [CurItem], a
	inc hl
	ld a, [wcf95]
	call GetFarByte
	ld [wcf75], a
	pop hl
	pop de
	ret
; 2490c


Function2490c: ; 2490c (9:490c)
	ld a, [wd0e3]
	and a
	jr z, .asm_2493d
	ld b, a
	ld a, [wcf77]
	inc a
	cp b
	jr z, .asm_24945
	ld a, [wcf77]
	call Function24a5c
	ld a, [hl]
	cp $ff
	ret z
	ld a, [wd0e3]
	dec a
	ld [wd0e3], a
	call Function249a7
	jp c, Function249d1
	ld a, [wcf77]
	ld c, a
	ld a, [wd0e3]
	cp c
	jr c, .asm_2497a
	jr .asm_2494a
.asm_2493d
	ld a, [wcf77]
	inc a
	ld [wd0e3], a
	ret
.asm_24945
	xor a
	ld [wd0e3], a
	ret
.asm_2494a
	ld a, [wd0e3]
	call Function24a40
	ld a, [wcf77]
	ld d, a
	ld a, [wd0e3]
	ld e, a
	call Function24a6c
	push bc
	ld a, [wd0e3]
	call Function24a5c
	dec hl
	push hl
	call Function24a80
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	pop bc
	call Function24aab
	ld a, [wcf77]
	call Function24a4d
	xor a
	ld [wd0e3], a
	ret
.asm_2497a
	ld a, [wd0e3]
	call Function24a40
	ld a, [wcf77]
	ld d, a
	ld a, [wd0e3]
	ld e, a
	call Function24a6c
	push bc
	ld a, [wd0e3]
	call Function24a5c
	ld d, h
	ld e, l
	call Function24a80
	add hl, bc
	pop bc
	call CopyBytes
	ld a, [wcf77]
	call Function24a4d
	xor a
	ld [wd0e3], a
	ret

Function249a7: ; 249a7 (9:49a7)
	ld a, [wd0e3]
	call Function24a5c
	ld d, h
	ld e, l
	ld a, [wcf77]
	call Function24a5c
	ld a, [de]
	cp [hl]
	jr nz, .asm_249cd
	ld a, [wcf77]
	call Function24a97
	cp $63
	jr z, .asm_249cd
	ld a, [wd0e3]
	call Function24a97
	cp $63
	jr nz, .asm_249cf
.asm_249cd
	and a
	ret
.asm_249cf
	scf
	ret

Function249d1: ; 249d1 (9:49d1)
	ld a, [wd0e3]
	call Function24a5c
	inc hl
	push hl
	ld a, [wcf77]
	call Function24a5c
	inc hl
	ld a, [hl]
	pop hl
	add [hl]
	cp $64
	jr c, .asm_24a01
	sub $63
	push af
	ld a, [wcf77]
	call Function24a5c
	inc hl
	ld [hl], $63
	ld a, [wd0e3]
	call Function24a5c
	inc hl
	pop af
	ld [hl], a
	xor a
	ld [wd0e3], a
	ret
.asm_24a01
	push af
	ld a, [wcf77]
	call Function24a5c
	inc hl
	pop af
	ld [hl], a
	ld hl, wcf96
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wd0e3]
	cp [hl]
	jr nz, .asm_24a25
	dec [hl]
	ld a, [wd0e3]
	call Function24a5c
	ld [hl], $ff
	xor a
	ld [wd0e3], a
	ret
.asm_24a25
	dec [hl]
	call Function24a80
	push bc
	ld a, [wd0e3]
	call Function24a5c
	pop bc
	push hl
	add hl, bc
	pop de
.asm_24a34
	ld a, [hli]
	ld [de], a
	inc de
	cp $ff
	jr nz, .asm_24a34
	xor a
	ld [wd0e3], a
	ret

Function24a40: ; 24a40 (9:4a40)
	call Function24a5c
	ld de, wd002
	call Function24a80
	call CopyBytes
	ret

Function24a4d: ; 24a4d (9:4a4d)
	call Function24a5c
	ld d, h
	ld e, l
	ld hl, wd002
	call Function24a80
	call CopyBytes
	ret

Function24a5c: ; 24a5c (9:4a5c)
	push af
	call Function24a80
	ld hl, wcf96
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	pop af
	call AddNTimes
	ret

Function24a6c: ; 24a6c (9:4a6c)
	push hl
	call Function24a80
	ld a, d
	sub e
	jr nc, .asm_24a76
	dec a
	cpl
.asm_24a76
	ld hl, 0
	call AddNTimes
	ld b, h
	ld c, l
	pop hl
	ret

Function24a80: ; 24a80 (9:4a80)
	push hl
	ld a, [wcf94]
	ld c, a
	ld b, 0
	ld hl, Unknown_24a91
rept 2
	add hl, bc
endr
	ld c, [hl]
	inc hl
	ld b, [hl]
	pop hl
	ret
; 24a91 (9:4a91)

Unknown_24a91: ; 24a91
	dw 0, 1, 2
; 24a97

Function24a97: ; 24a97 (9:4a97)
	push af
	call Function24a80
	ld a, c
	cp $2
	jr nz, .asm_24aa7
	pop af
	call Function24a5c
	inc hl
	ld a, [hl]
	ret
.asm_24aa7
	pop af
	ld a, $1
	ret

Function24aab: ; 24aab (9:4aab)
	ld a, [hld]
	ld [de], a
	dec de
	dec bc
	ld a, b
	or c
	jr nz, Function24aab
	ret

PlaceMenuItemName: ; 0x24ab4
	push de
	ld a, [MenuSelection]
	ld [wNamedObjectIndexBuffer], a
	call GetItemName
	pop hl
	call PlaceString
	ret
; 0x24ac3

PlaceMenuItemQuantity: ; 0x24ac3
	push de
	ld a, [MenuSelection]
	ld [CurItem], a
	callba _CheckTossableItem
	ld a, [wItemAttributeParamBuffer]
	pop hl
	and a
	jr nz, .done
	ld de, $15
	add hl, de
	ld [hl], "×"
	inc hl
	ld de, wcf75
	lb bc, 1, 2
	call PrintNum

.done
	ret
; 0x24ae8

Function24ae8: ; 24ae8
	ld hl, MenuDataHeader_0x24b15
	call CopyMenuDataHeader
	jr Function24b01

Function24af0: ; 24af0
	ld hl, MenuDataHeader_0x24b1d
	call CopyMenuDataHeader
	jr Function24b01

Function24af8: ; 24af8
	ld hl, MenuDataHeader_0x24b15
	ld de, $b
	call Function1e2e

Function24b01: ; 24b01
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, $15
	add hl, de
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	ret
; 24b15

MenuDataHeader_0x24b15: ; 0x24b15
	db $40 ; flags
	db 00, 11 ; start coords
	db 02, 19 ; end coords
	dw NULL
	db 1 ; default option
; 0x24b1d

MenuDataHeader_0x24b1d: ; 0x24b1d
	db $40 ; flags
	db 11, 00 ; start coords
	db 13, 08 ; end coords
	dw NULL
	db 1 ; default option
; 0x24b25

Special_DisplayCoinCaseBalance: ; 24b25
	; Place a text box of size 1x7 at 11, 0.
	hlcoord 11, 0
	ld b, 1
	ld c, 7
	call TextBox
	hlcoord 12, 0
	ld de, CoinString
	call PlaceString
	hlcoord 17, 1
	ld de, ShowMoney_TerminatorString
	call PlaceString
	ld de, Coins
	lb bc, 2, 4
	hlcoord 13, 1
	call PrintNum
	ret
; 24b4e

Special_DisplayMoneyAndCoinBalance: ; 24b4e
	hlcoord 5, 0
	ld b, 3
	ld c, 13
	call TextBox
	hlcoord 6, 1
	ld de, MoneyString
	call PlaceString
	hlcoord 12, 1
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 6, 3
	ld de, CoinString
	call PlaceString
	hlcoord 15, 3
	ld de, Coins
	lb bc, 2, 4
	call PrintNum
	ret
; 24b83

MoneyString: ; 24b83
	db "MONEY@"
CoinString: ; 24b89
	db "COIN@"
ShowMoney_TerminatorString: ; 24b8e
	db "@"
; 24b8f

Function24b8f: ; 24b8f
; unreferenced, related to safari?
	ld hl, Options
	ld a, [hl]
	push af
	set NO_TEXT_SCROLL, [hl]
	hlcoord 0, 0
	ld b, 3
	ld c, 7
	call TextBox
	hlcoord 1, 1
	ld de, wSafariTimeRemaining
	lb bc, 2, 3
	call PrintNum
	hlcoord 4, 1
	ld de, .slash_500
	call PlaceString
	hlcoord 1, 3
	ld de, .booru_ko
	call PlaceString
	hlcoord 5, 3
	ld de, wSafariBallsRemaining
	lb bc, 1, 2
	call PrintNum
	pop af
	ld [Options], a
	ret
; 24bcf

.slash_500: ; 24bcf
	db "/500@"
.booru_ko: ; 24bd4
	db "ボール   こ@"
; 24bdc

Function24bdc: ; 24bdc
	hlcoord 0, 0
	ld b, $5
	ld c, $11
	call TextBox
	ret
; 24be7

Function24be7: ; 24be7
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function24bdc
	hlcoord 1, 5
	ld de, String24c52
	call PlaceString
	hlcoord 8, 5
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	hlcoord 1, 1
	ld de, String24c4b
	call PlaceString
	ld a, [wContestMon]
	and a
	ld de, String24c59
	jr z, .asm_24c1e
	ld [wd265], a
	call GetPokemonName

.asm_24c1e
	hlcoord 8, 1
	call PlaceString
	ld a, [wContestMon]
	and a
	jr z, .asm_24c3e
	hlcoord 1, 3
	ld de, String24c5e
	call PlaceString
	ld a, [wContestMonLevel]
	ld h, b
	ld l, c
	inc hl
	ld c, $3
	call Function3842

.asm_24c3e
	pop af
	ld [Options], a
	ret
; 24c43

String24c43: ; 24c43
	db "ボール   こ@"
String24c4b: ; 24c4b
	db "CAUGHT@"
String24c52: ; 24c52
	db "BALLS:@"
String24c59: ; 24c59
	db "None@"
String24c5e: ; 24c5e
	db "LEVEL@"
; 24c64


FindApricornsInBag: ; 24c64
; Checks the bag for Apricorns.
	ld hl, Buffer1
	xor a
	ld [hli], a
	dec a
	ld bc, 10
	call ByteFill

	ld hl, .ApricornBalls
.loop
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	pop hl
	jr nc, .nope
	ld a, [hl]
	call .addtobuffer
.nope
rept 2
	inc hl
endr
	jr .loop

.done
	ld a, [Buffer1]
	and a
	ret nz
	scf
	ret
; 24c94

.addtobuffer: ; 24c94
	push hl
	ld hl, Buffer1
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	pop hl
	ret
; 24ca0

.ApricornBalls: ; 24ca0
	db RED_APRICORN, LEVEL_BALL
	db BLU_APRICORN, LURE_BALL
	db YLW_APRICORN, MOON_BALL
	db GRN_APRICORN, FRIEND_BALL
	db WHT_APRICORN, FAST_BALL
	db BLK_APRICORN, HEAVY_BALL
	db PNK_APRICORN, LOVE_BALL
	db -1
; 24caf


MonMenuOptionStrings: ; 24caf
	db "STATS@"
	db "SWITCH@"
	db "ITEM@"
	db "CANCEL@"
	db "MOVE@"
	db "MAIL@"
	db "ERROR!@"
; 24cd9

MonMenuOptions: ; 24cd9

; Moves
	db MONMENU_FIELD_MOVE, MONMENU_CUT,        CUT
	db MONMENU_FIELD_MOVE, MONMENU_FLY,        FLY
	db MONMENU_FIELD_MOVE, MONMENU_SURF,       SURF
	db MONMENU_FIELD_MOVE, MONMENU_STRENGTH,   STRENGTH
	db MONMENU_FIELD_MOVE, MONMENU_FLASH,      FLASH
	db MONMENU_FIELD_MOVE, MONMENU_WATERFALL,  WATERFALL
	db MONMENU_FIELD_MOVE, MONMENU_WHIRLPOOL,  WHIRLPOOL
	db MONMENU_FIELD_MOVE, MONMENU_DIG,        DIG
	db MONMENU_FIELD_MOVE, MONMENU_TELEPORT,   TELEPORT
	db MONMENU_FIELD_MOVE, MONMENU_SOFTBOILED, SOFTBOILED
	db MONMENU_FIELD_MOVE, MONMENU_HEADBUTT,   HEADBUTT
	db MONMENU_FIELD_MOVE, MONMENU_ROCKSMASH,  ROCK_SMASH
	db MONMENU_FIELD_MOVE, MONMENU_MILKDRINK,  MILK_DRINK
	db MONMENU_FIELD_MOVE, MONMENU_SWEETSCENT, SWEET_SCENT

; Options
	db MONMENU_MENUOPTION, MONMENU_STATS,      1 ; STATS
	db MONMENU_MENUOPTION, MONMENU_SWITCH,     2 ; SWITCH
	db MONMENU_MENUOPTION, MONMENU_ITEM,       3 ; ITEM
	db MONMENU_MENUOPTION, MONMENU_CANCEL,     4 ; CANCEL
	db MONMENU_MENUOPTION, MONMENU_MOVE,       5 ; MOVE
	db MONMENU_MENUOPTION, MONMENU_MAIL,       6 ; MAIL
	db MONMENU_MENUOPTION, MONMENU_ERROR,      7 ; ERROR!

	db -1
; 24d19

MonSubmenu: ; 24d19
	xor a
	ld [hBGMapMode], a
	call GetMonSubmenuItems
	callba Function8ea4a
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call .GetTopCoord
	call PopulateMonMenu

	ld a, 1
	ld [hBGMapMode], a
	call MonMenuLoop
	ld [MenuSelection], a

	call ExitMenu
	ret
; 24d3f

.MenuDataHeader: ; 24d3f
	db $40 ; tile backup
	db 00, 06 ; start coords
	db 17, 19 ; end coords
	dw 0
	db 1 ; default option
; 24d47

.GetTopCoord: ; 24d47
; TopCoord = 1 + BottomCoord - 2 * (NumSubmenuItems + 1)
	ld a, [Buffer1]
	inc a
	add a
	ld b, a
	ld a, [wMenuBorderBottomCoord]
	sub b
	inc a
	ld [wMenuBorderTopCoord], a
	call MenuBox
	ret
; 24d59

MonMenuLoop: ; 24d59
.loop
	ld a, $a0 ; flags
	ld [wMenuData2Flags], a
	ld a, [Buffer1] ; items
	ld [wMenuData2Items], a
	call Function1c10
	ld hl, wcfa5
	set 6, [hl]
	call Function1bc9
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit 0, a ; A
	jr nz, .select
	bit 1, a ; B
	jr nz, .cancel
	jr .loop

.cancel
	ld a, MONMENU_CANCEL ; CANCEL
	ret

.select
	ld a, [MenuSelection2]
	dec a
	ld c, a
	ld b, 0
	ld hl, Buffer2
	add hl, bc
	ld a, [hl]
	ret
; 24d91

PopulateMonMenu: ; 24d91
	call MenuBoxCoord2Tile
	ld bc, $2a ; 42
	add hl, bc
	ld de, Buffer2
.loop
	ld a, [de]
	inc de
	cp -1
	ret z
	push de
	push hl
	call GetMonMenuString
	pop hl
	call PlaceString
	ld bc, $28 ; 40
	add hl, bc
	pop de
	jr .loop
; 24db0

GetMonMenuString: ; 24db0
	ld hl, MonMenuOptions + 1
	ld de, 3
	call IsInArray
	dec hl
	ld a, [hli]
	cp 1
	jr z, .NotMove
	inc hl
	ld a, [hl]
	ld [wd265], a
	call GetMoveName
	ret

.NotMove
	inc hl
	ld a, [hl]
	dec a
	ld hl, MonMenuOptionStrings
	call GetNthString
	ld d, h
	ld e, l
	ret
; 24dd4

GetMonSubmenuItems: ; 24dd4
	call ResetMonSubmenu
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	ld a, [wLinkMode]
	and a
	jr nz, .skip_moves
	ld a, MON_MOVES
	call GetPartyParamLocation
	ld d, h
	ld e, l
	ld c, NUM_MOVES
.loop
	push bc
	push de
	ld a, [de]
	and a
	jr z, .next
	push hl
	call IsFieldMove
	pop hl
	jr nc, .next
	call AddMonMenuItem

.next
	pop de
	inc de
	pop bc
	dec c
	jr nz, .loop

.skip_moves
	ld a, MONMENU_STATS
	call AddMonMenuItem
	ld a, MONMENU_SWITCH
	call AddMonMenuItem
	ld a, MONMENU_MOVE
	call AddMonMenuItem
	ld a, [wLinkMode]
	and a
	jr nz, .skip2
	push hl
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	callba ItemIsMail
	pop hl
	ld a, MONMENU_MAIL
	jr c, .ok
	ld a, MONMENU_ITEM

.ok
	call AddMonMenuItem

.skip2
	ld a, [Buffer1]
	cp NUM_MON_SUBMENU_ITEMS
	jr z, .ok2
	ld a, MONMENU_CANCEL
	call AddMonMenuItem

.ok2
	call TerminateMonSubmenu
	ret

.egg
	ld a, MONMENU_STATS
	call AddMonMenuItem
	ld a, MONMENU_SWITCH
	call AddMonMenuItem
	ld a, MONMENU_CANCEL
	call AddMonMenuItem
	call TerminateMonSubmenu
	ret
; 24e52

IsFieldMove: ; 24e52
	ld b, a
	ld hl, MonMenuOptions
.next
	ld a, [hli]
	cp -1
	jr z, .nope
	cp MONMENU_MENUOPTION
	jr z, .nope
	ld d, [hl]
	inc hl
	ld a, [hli]
	cp b
	jr nz, .next
	ld a, d
	scf

.nope
	ret
; 24e68

ResetMonSubmenu: ; 24e68
	xor a
	ld [Buffer1], a
	ld hl, Buffer2
	ld bc, NUM_MON_SUBMENU_ITEMS + 1
	call ByteFill
	ret
; 24e76

TerminateMonSubmenu: ; 24e76
	ld a, [Buffer1]
	ld e, a
	ld d, $0
	ld hl, Buffer2
	add hl, de
	ld [hl], -1
	ret
; 24e83

AddMonMenuItem: ; 24e83
	push hl
	push de
	push af
	ld a, [Buffer1]
	ld e, a
	inc a
	ld [Buffer1], a
	ld d, $0
	ld hl, Buffer2
	add hl, de
	pop af
	ld [hl], a
	pop de
	pop hl
	ret
; 24e99

Function24e99: ; 24e99
; BattleMonMenu
	ld hl, MenuDataHeader_0x24ed4
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call MenuBox
	call UpdateSprites
	call Function1c89
	call WaitBGMap
	call CopyMenuData2
	ld a, [wMenuData2Flags]
	bit 7, a
	jr z, .asm_24ed0
	call Function1c10
	ld hl, wcfa5
	set 6, [hl]
	call Function1bc9
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit 1, a
	jr z, .asm_24ed2
	ret z

.asm_24ed0
	scf
	ret

.asm_24ed2
	and a
	ret
; 24ed4

MenuDataHeader_0x24ed4: ; 24ed4
	db $00 ; flags
	db 11, 11 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_0x24edc
	db 1 ; default option
; 24edc

MenuData2_0x24edc: ; 24edc
	db $c0 ; flags
	db 3 ; items
	db "SWITCH@"
	db "STATS@"
	db "CANCEL@"
; 24ef2


LoadBattleMenu: ; 24ef2
	ld hl, BattleMenuDataHeader
	call LoadMenuDataHeader
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call Function2039
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call ExitMenu
	ret
; 24f0b


SafariBattleMenu: ; 24f0b
; untranslated
	ld hl, MenuDataHeader_0x24f4e
	call LoadMenuDataHeader
	jr Function24f19
; 24f13

ContestBattleMenu: ; 24f13
	ld hl, MenuDataHeader_0x24f89
	call LoadMenuDataHeader
; 24f19

Function24f19: ; 24f19
	ld a, [wd0d2]
	ld [wMenuCursorBuffer], a
	call InterpretMenu
	ld a, [wMenuCursorBuffer]
	ld [wd0d2], a
	call ExitMenu
	ret
; 24f2c


BattleMenuDataHeader: ; 24f2c
	db $40 ; flags
	db 12, 08 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f34
	db 1 ; default option
; 24f34

MenuData_0x24f34: ; 0x24f34
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 6 ; spacing
	dba Strings24f3d
	dbw $09, 0
; 0x24f3d

Strings24f3d: ; 0x24f3d
	db "FIGHT@"
	db $4a, "@"
	db "PACK@"
	db "RUN@"
; 24f4e


MenuDataHeader_0x24f4e: ; 24f4e
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f56
	db 1 ; default option
; 24f56

MenuData_0x24f56: ; 24f56
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 11 ; spacing
	dba Strings24f5f
	dba Function24f7c
; 24f5f

Strings24f5f: ; 24f5f
	db "サファりボール×  @" ; "SAFARI BALL×  @"
	db "エサをなげる@" ; "THROW BAIT"
	db "いしをなげる@" ; "THROW ROCK"
	db "にげる@" ; "RUN"
; 24f7c

Function24f7c: ; 24f7c
	hlcoord 17, 13
	ld de, wSafariBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 24f89


MenuDataHeader_0x24f89: ; 24f89
	db $40 ; flags
	db 12, 02 ; start coords
	db 17, 19 ; end coords
	dw MenuData_0x24f91
	db 1 ; default option
; 24f91

MenuData_0x24f91: ; 24f91
	db $81 ; flags
	dn 2, 2 ; rows, columns
	db 12 ; spacing
	dba Strings24f9a
	dba Function24fb2
; 24f9a

Strings24f9a: ; 24f9a
	db "FIGHT@"
	db "<PKMN>", "@"
	db "PARKBALL×  @"
	db "RUN@"
; 24fb2

Function24fb2: ; 24fb2
	hlcoord 13, 16
	ld de, wParkBallsRemaining
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 24fbf


Function24fbf: ; 24fbf
	ld hl, MenuDataHeader_0x250ed
	call LoadMenuDataHeader
	call Function24ff9
	ret
; 24fc9


Function24fc9: ; 24fc9
	callba GetItemPrice
Function24fcf: ; 24fcf
	ld a, d
	ld [Buffer1], a
	ld a, e
	ld [Buffer2], a
	ld hl, MenuDataHeader_0x250f5
	call LoadMenuDataHeader
	call Function24ff9
	ret
; 24fe1

Function24fe1: ; 24fe1
	callba GetItemPrice
	ld a, d
	ld [Buffer1], a
	ld a, e
	ld [Buffer2], a
	ld hl, MenuDataHeader_0x250fd
	call LoadMenuDataHeader
	call Function24ff9
	ret
; 24ff9

Function24ff9: ; 24ff9
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
.asm_24ffe
	call Function25072
	call Function2500e
	jr nc, .asm_24ffe
	cp $ff
	jr nz, .asm_2500c
	scf
	ret

.asm_2500c
	and a
	ret
; 2500e

Function2500e: ; 2500e
	call Function354b
	bit 1, c
	jr nz, .asm_2502b
	bit 0, c
	jr nz, .asm_2502f
	bit 7, c
	jr nz, .asm_25033
	bit 6, c
	jr nz, .asm_2503f
	bit 5, c
	jr nz, .asm_2504d
	bit 4, c
	jr nz, .asm_2505f
	and a
	ret

.asm_2502b
	ld a, $ff
	scf
	ret

.asm_2502f
	ld a, $0
	scf
	ret

.asm_25033
	ld hl, wItemQuantityChangeBuffer
	dec [hl]
	jr nz, .asm_2503d
	ld a, [wItemQuantityBuffer]
	ld [hl], a

.asm_2503d
	and a
	ret

.asm_2503f
	ld hl, wItemQuantityChangeBuffer
	inc [hl]
	ld a, [wItemQuantityBuffer]
	cp [hl]
	jr nc, .asm_2504b
	ld [hl], $1

.asm_2504b
	and a
	ret

.asm_2504d
	ld a, [wItemQuantityChangeBuffer]
	sub $a
	jr c, .asm_25058
	jr z, .asm_25058
	jr .asm_2505a

.asm_25058
	ld a, $1

.asm_2505a
	ld [wItemQuantityChangeBuffer], a
	and a
	ret

.asm_2505f
	ld a, [wItemQuantityChangeBuffer]
	add $a
	ld b, a
	ld a, [wItemQuantityBuffer]
	cp b
	jr nc, .asm_2506c
	ld b, a

.asm_2506c
	ld a, b
	ld [wItemQuantityChangeBuffer], a
	and a
	ret
; 25072

Function25072: ; 25072
	call MenuBox
	call MenuBoxCoord2Tile
	ld de, $15
	add hl, de
	ld [hl], $f1
	inc hl
	ld de, wItemQuantityChangeBuffer
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [wMenuData2Pointer]
	ld e, a
	ld a, [wMenuData2Pointer + 1]
	ld d, a
	ld a, [wMenuDataBank]
	call FarCall_de
	ret
; 25097


Function25097: ; 25097
	ret
; 25098

Function25098: ; 25098
	call Function250a9
	call Function250d1
	ret
; 2509f

Function2509f: ; 2509f
	call Function250a9
	call Function250c1
	call Function250d1
	ret
; 250a9

Function250a9: ; 250a9
	xor a
	ld [hMultiplicand + 0], a
	ld a, [Buffer1]
	ld [hMultiplicand + 1], a
	ld a, [Buffer2]
	ld [hMultiplicand + 2], a
	ld a, [wItemQuantityChangeBuffer]
	ld [hMultiplier], a
	push hl
	call Multiply
	pop hl
	ret
; 250c1

Function250c1: ; 250c1
	push hl
	ld hl, hMultiplicand
	ld a, [hl]
	srl a
	ld [hli], a
	ld a, [hl]
	rra
	ld [hli], a
	ld a, [hl]
	rra
	ld [hl], a
	pop hl
	ret
; 250d1

Function250d1: ; 250d1
	push hl
	ld hl, hMoneyTemp
	ld a, [hMultiplicand]
	ld [hli], a
	ld a, [$ffb5]
	ld [hli], a
	ld a, [$ffb6]
	ld [hl], a
	pop hl
	inc hl
	ld de, hMoneyTemp
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	call WaitBGMap
	ret
; 250ed

MenuDataHeader_0x250ed: ; 0x250ed
	db $40 ; flags
	db 09, 15 ; start coords
	db 11, 19 ; end coords
	dw Function25097
	db 0 ; default option
; 0x250f5

MenuDataHeader_0x250f5: ; 0x250f5
	db $40 ; flags
	db 15, 07 ; start coords
	db 17, 19 ; end coords
	dw Function25098
	db -1 ; default option
; 0x250fd

MenuDataHeader_0x250fd: ; 0x250fd
	db $40 ; flags
	db 15, 07 ; start coords
	db 17, 19 ; end coords
	dw Function2509f
	db 0 ; default option
; 0x25105

Function25105: ; 25105
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function2513b
.asm_25117
	call UpdateTime
	call JoyTextDelay
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_25132
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_25132
	call Function2518e
	call DelayFrame
	jr .asm_25117
.asm_25132
	pop af
	ld [Options], a
	pop af
	ld [VramState], a
	ret

Function2513b: ; 2513b (9:513b)
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	callba Function8833e
	ld hl, CardRightCornerGFX
	ld de, VTiles2 tile $1c
	ld bc, $10
	ld a, BANK(CardRightCornerGFX)
	call FarCopyBytes
	ld hl, CardStatusGFX
	ld de, VTiles2 tile $29
	ld bc, $60 + $500
	ld a, BANK(CardStatusGFX)
	call FarCopyBytes
	call Function25299
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_15
	call GetSGBLayout
	call SetPalettes
	call WaitBGMap
	ld hl, wJumptableIndex
	xor a
rept 3
	ld [hli], a
endr
	ld [hl], a
	ret

Function2518e: ; 2518e (9:518e)
	ld a, [wJumptableIndex]
	ld e, a
	ld d, $0
	ld hl, Jumptable_2519d
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Jumptable_2519d: ; 2519d (9:519d)
	dw Function251b6
	dw Function251d7
	dw Function251f4
	dw Function25221
	dw Function2524c
	dw Function25279
	dw Function251b0


Function251ab: ; 251ab (9:51ab)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function251b0: ; 251b0 (9:51b0)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function251b6: ; 251b6 (9:51b6)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, CardStatusGFX
	ld hl, VTiles2 tile $29
	lb bc, BANK(CardStatusGFX), $6 + $50
	call Request2bpp
	call Function2530a
	call Function251ab
	ret

Function251d7: ; 251d7 (9:51d7)
	call Function25415
	ld hl, hJoyLast
	ld a, [hl]
	and D_RIGHT | A_BUTTON
	jr nz, .asm_251e3
	ret
.asm_251e3
	ld a, $2
	ld [wJumptableIndex], a
	ret
; 251e9 (9:51e9)

Function251e9: ; 251e9
	ld a, [KantoBadges]
	and a
	ret z
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 251f4

Function251f4: ; 251f4 (9:51f4)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, LeaderGFX
	ld hl, VTiles2 tile $29
	lb bc, BANK(LeaderGFX), $56
	call Request2bpp
	ld de, BadgeGFX
	ld hl, VTiles0 tile $00
	lb bc, BANK(BadgeGFX), $2c
	call Request2bpp
	call Function2536c
	call Function251ab
	ret

Function25221: ; 25221 (9:5221)
	ld hl, Unknown_254c9
	call Function25438
	ld hl, hJoyLast
	ld a, [hl]
	and A_BUTTON
	jr nz, Function25246
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_25235
	ret
.asm_25235
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 2523b (9:523b)

Function2523b: ; 2523b
	ld a, [KantoBadges]
	and a
	ret z
	ld a, $4
	ld [wJumptableIndex], a
	ret
; 25246

Function25246: ; 25246
	ld a, $6
	ld [wJumptableIndex], a
	ret

Function2524c: ; 2524c (9:524c)
	call ClearSprites
	hlcoord 0, 8
	ld d, $6
	call Function253b0
	call WaitBGMap
	ld de, LeaderGFX2
	ld hl, VTiles2 tile $29
	lb bc, BANK(LeaderGFX2), $56
	call Request2bpp
	ld de, BadgeGFX2
	ld hl, VTiles0 tile $00
	lb bc, BANK(BadgeGFX2), $2c
	call Request2bpp
	call Function2536c
	call Function251ab
	ret

Function25279: ; 25279 (9:5279)
	ld hl, Unknown_254c9
	call Function25438
	ld hl, hJoyLast
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_2528d
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_25293
	ret
.asm_2528d
	ld a, $2
	ld [wJumptableIndex], a
	ret
.asm_25293
	ld a, $0
	ld [wJumptableIndex], a
	ret

Function25299: ; 25299 (9:5299)
	hlcoord 0, 0
	ld d, $5
	call Function253b0
	hlcoord 2, 2
	ld de, String_252ec
	call PlaceString
	hlcoord 2, 4
	ld de, Tilemap_252f9
	call Function253a8
	hlcoord 7, 2
	ld de, PlayerName
	call PlaceString
	hlcoord 5, 4
	ld de, PlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 7, 6
	ld de, Money
	lb bc, PRINTNUM_MONEY | 3, 6
	call PrintNum
	hlcoord 1, 3
	ld de, Tilemap_252fc
	call Function253a8
	hlcoord 14, 1
	lb bc, 5, 7
	xor a
	ld [hFillBox], a
	predef FillBox
	ret
; 252ec (9:52ec)

String_252ec: ; 252ec
	db   "NAME/"
	next ""
	next "MONEY@"

Tilemap_252f9: ; 252f9
	db $27, $28, $ff ; ID NO

Tilemap_252fc: ; 252fc
	db $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $25, $26, $ff ; ____________>
; 2530a

Function2530a: ; 2530a (9:530a)
	hlcoord 2, 10
	ld de, String_2534c
	call PlaceString
	hlcoord 10, 15
	ld de, String_2535c
	call PlaceString
	ld hl, PokedexCaught
	ld b, $20
	call CountSetBits
	ld de, wd265
	hlcoord 15, 10
	lb bc, 1, 3
	call PrintNum
	call Function25415
	hlcoord 2, 8
	ld de, Tilemap_25366
	call Function253a8
	ld a, [StatusFlags] ; pokedex
	bit 0, a
	ret nz
	hlcoord 1, 9
	lb bc, 2, 17
	call ClearBox
	ret
; 2534c (9:534c)

String_2534c: ; 2534c
	db   "#DEX"
	next "PLAY TIME"
	db   "@"

String_2535b: ; 2535b
	db "@"

String_2535c: ; 2535c
	db "  BADGES▶@"

Tilemap_25366: ; 25366
	db $29, $2a, $2b, $2c, $2d, $ff
; 2536c

Function2536c: ; 2536c (9:536c)
	hlcoord 2, 8
	ld de, Tilemap_253a2
	call Function253a8
	hlcoord 2, 10
	ld a, $29
	ld c, $4
.asm_2537c
	call Function253f4
rept 4
	inc hl
endr
	dec c
	jr nz, .asm_2537c
	hlcoord 2, 13
	ld a, $51
	ld c, $4
.asm_2538d
	call Function253f4
rept 4
	inc hl
endr
	dec c
	jr nz, .asm_2538d
	xor a
	ld [wcf64], a
	ld hl, Unknown_254c9
	call Function25448
	ret
; 253a2 (9:53a2)

Tilemap_253a2: ; 253a2
	db $79, $7a, $7b, $7c, $7d, $ff ; "BADGES"
; 253a8

Function253a8: ; 253a8 (9:53a8)
	ld a, [de]
	cp $ff
	ret z
	ld [hli], a
	inc de
	jr Function253a8

Function253b0: ; 253b0 (9:53b0)
	ld e, $14
.asm_253b2
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .asm_253b2
	ld a, $23
	ld [hli], a
	ld e, $11
	ld a, $7f
.asm_253bf
	ld [hli], a
	dec e
	jr nz, .asm_253bf
	ld a, $1c
	ld [hli], a
	ld a, $23
	ld [hli], a
.asm_253c9
	ld a, $23
	ld [hli], a
	ld e, $12
	ld a, $7f
.asm_253d0
	ld [hli], a
	dec e
	jr nz, .asm_253d0
	ld a, $23
	ld [hli], a
	dec d
	jr nz, .asm_253c9
	ld a, $23
	ld [hli], a
	ld a, $24
	ld [hli], a
	ld e, $11
	ld a, $7f
.asm_253e4
	ld [hli], a
	dec e
	jr nz, .asm_253e4
	ld a, $23
	ld [hli], a
	ld e, $14
.asm_253ed
	ld a, $23
	ld [hli], a
	dec e
	jr nz, .asm_253ed
	ret

Function253f4: ; 253f4 (9:53f4)
	push de
	push hl
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, $11
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld de, $11
	add hl, de
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	pop hl
	pop de
	ret

Function25415: ; 25415 (9:5415)
	hlcoord 11, 12
	ld de, GameTimeHours
	lb bc, 2, 4
	call PrintNum
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ld a, [hVBlankCounter]
	and $1f
	ret nz
	hlcoord 15, 12
	ld a, [hl]
	xor $51
	ld [hl], a
	ret

Function25438: ; 25438 (9:5438)
	ld a, [hVBlankCounter]
	and $7
	ret nz
	ld a, [wcf64]
	inc a
	and $7
	ld [wcf64], a
	jr Function25448

Function25448: ; 25448 (9:5448)
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [de]
	ld c, a
	ld de, Sprites
	ld b, 8
.asm_25453
	srl c
	push bc
	jr nc, .asm_25472
	push hl
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld [wcf66], a
	ld a, [wcf64]
	add l
	ld l, a
	ld a, 0
	adc h
	ld h, a
	ld a, [hl]
	ld [wcf65], a
	call Function2547b
	pop hl
.asm_25472
	ld bc, $b
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_25453
	ret

Function2547b: ; 2547b (9:547b)
	ld a, [wcf65]
	and $80
	jr nz, .asm_25487
	ld hl, Unknown_254a7
	jr .asm_2548a
.asm_25487
	ld hl, Unknown_254b8
.asm_2548a
	ld a, [hli]
	cp $ff
	ret z
	add b
	ld [de], a
	inc de
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [wcf65]
	and $7f
	add [hl]
	ld [de], a
	inc hl
	inc de
	ld a, [wcf66]
	add [hl]
	ld [de], a
	inc hl
	inc de
	jr .asm_2548a
; 254a7 (9:54a7)

Unknown_254a7: ; 254a7
	db $00, $00, $00, $00
	db $00, $08, $01, $00
	db $08, $00, $02, $00
	db $08, $08, $03, $00
	db $ff

Unknown_254b8: ; 254b8
	db $00, $00, $01, $20
	db $00, $08, $00, $20
	db $08, $00, $03, $20
	db $08, $08, $02, $20
	db $ff

Unknown_254c9: ; 254c9
; Template OAM data for each badge on the trainer card.
; Format:
	; y, x, palette
	; cycle 1: face tile, in1 tile, in2 tile, in3 tile
	; cycle 2: face tile, in1 tile, in2 tile, in3 tile

	dw JohtoBadges

	; Zephyrbadge
	db $68, $18, $00
	db $00, $20, $24, $20 | $80
	db $00, $20, $24, $20 | $80

	; Hivebadge
	db $68, $38, $00
	db $04, $20, $24, $20 | $80
	db $04, $20, $24, $20 | $80

	; Plainbadge
	db $68, $58, $00
	db $08, $20, $24, $20 | $80
	db $08, $20, $24, $20 | $80

	; Fogbadge
	db $68, $78, $00
	db $0c, $20, $24, $20 | $80
	db $0c, $20, $24, $20 | $80

	; Mineralbadge
	db $80, $38, $00
	db $10, $20, $24, $20 | $80
	db $10, $20, $24, $20 | $80

	; Stormbadge
	db $80, $18, $00
	db $14, $20, $24, $20 | $80
	db $14, $20, $24, $20 | $80

	; Glacierbadge
	db $80, $58, $00
	db $18, $20, $24, $20 | $80
	db $18, $20, $24, $20 | $80

	; Risingbadge
	; X-flips on alternate cycles.
	db $80, $78, $00
	db $1c, $20, $24, $20 | $80
	db $1c | $80, $20, $24, $20 | $80
; 25523

CardStatusGFX: INCBIN "gfx/misc/card_status.2bpp"

LeaderGFX:  INCBIN "gfx/misc/leaders.w24.2bpp"
LeaderGFX2: INCBIN "gfx/misc/leaders.w24.2bpp"
BadgeGFX:   INCBIN "gfx/misc/badges.2bpp"
BadgeGFX2:  INCBIN "gfx/misc/badges.2bpp"

CardRightCornerGFX: INCBIN "gfx/misc/card_right_corner.2bpp"


ProfOaksPC: ; 0x265d3
	ld hl, OakPCText1
	call MenuTextBox
	call YesNoBox
	jr c, .shutdown
	call ProfOaksPCBoot ; player chose "yes"?
.shutdown
	ld hl, OakPCText4
	call PrintText
	call JoyWaitAorB
	call ExitMenu
	ret
; 0x265ee

ProfOaksPCBoot ; 0x265ee
	ld hl, OakPCText2
	call PrintText
	call Rate
	call PlaySFX ; sfx loaded by previous Rate function call
	call JoyWaitAorB
	call WaitSFX
	ret
; 0x26601

Function26601: ; 0x26601
	call Rate
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	pop de
	call PlaySFX
	call JoyWaitAorB
	call WaitSFX
	ret
; 0x26616

Rate: ; 0x26616
; calculate Seen/Owned
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld [wd002], a
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld [wd003], a

; print appropriate rating
	call ClearOakRatingBuffers
	ld hl, OakPCText3
	call PrintText
	call JoyWaitAorB
	ld a, [wd003]
	ld hl, OakRatings
	call FindOakRating
	push de
	call PrintText
	pop de
	ret
; 0x26647

ClearOakRatingBuffers: ; 0x26647
	ld hl, StringBuffer3
	ld de, wd002
	call ClearOakRatingBuffer
	ld hl, StringBuffer4
	ld de, wd003
	call ClearOakRatingBuffer
	ret
; 0x2665a

ClearOakRatingBuffer: ; 0x2665a
	push hl
	ld a, "@"
	ld bc, ITEM_NAME_LENGTH
	call ByteFill
	pop hl
	lb bc, PRINTNUM_RIGHTALIGN | 1, 3
	call PrintNum
	ret
; 0x2666b

FindOakRating: ; 0x2666b
; return sound effect in de
; return text pointer in hl
	nop
	ld c, a
.loop
	ld a, [hli]
	cp c
	jr nc, .match
rept 4
	inc hl
endr
	jr .loop

.match
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 0x2667f

OakRatings: ; 0x2667f
; db count (if number caught ≤ this number, then this entry is used)
; dw sound effect
; dw text pointer

	db 9
	dw SFX_DEX_FANFARE_LESS_THAN_20
	dw OakRating01

	db 19
	dw SFX_DEX_FANFARE_LESS_THAN_20
	dw OakRating02

	db 34
	dw SFX_DEX_FANFARE_20_49
	dw OakRating03

	db 49
	dw SFX_DEX_FANFARE_20_49
	dw OakRating04

	db 64
	dw SFX_DEX_FANFARE_50_79
	dw OakRating05

	db 79
	dw SFX_DEX_FANFARE_50_79
	dw OakRating06

	db 94
	dw SFX_DEX_FANFARE_80_109
	dw OakRating07

	db 109
	dw SFX_DEX_FANFARE_80_109
	dw OakRating08

	db 124
	dw SFX_CAUGHT_MON
	dw OakRating09

	db 139
	dw SFX_CAUGHT_MON
	dw OakRating10

	db 154
	dw SFX_DEX_FANFARE_140_169
	dw OakRating11

	db 169
	dw SFX_DEX_FANFARE_140_169
	dw OakRating12

	db 184
	dw SFX_DEX_FANFARE_170_199
	dw OakRating13

	db 199
	dw SFX_DEX_FANFARE_170_199
	dw OakRating14

	db 214
	dw SFX_DEX_FANFARE_200_229
	dw OakRating15

	db 229
	dw SFX_DEX_FANFARE_200_229
	dw OakRating16

	db 239
	dw SFX_DEX_FANFARE_230_PLUS
	dw OakRating17

	db 248
	dw SFX_DEX_FANFARE_230_PLUS
	dw OakRating18

	db 255
	dw SFX_DEX_FANFARE_230_PLUS
	dw OakRating19

OakPCText1: ; 0x266de
	text_jump _OakPCText1
	db "@"

OakPCText2: ; 0x266e3
	text_jump _OakPCText2
	db "@"

OakPCText3: ; 0x266e8
	text_jump _OakPCText3
	db "@"

OakRating01:
	text_jump _OakRating01
	db "@"

OakRating02:
	text_jump _OakRating02
	db "@"

OakRating03:
	text_jump _OakRating03
	db "@"

OakRating04:
	text_jump _OakRating04
	db "@"

OakRating05:
	text_jump _OakRating05
	db "@"

OakRating06:
	text_jump _OakRating06
	db "@"

OakRating07:
	text_jump _OakRating07
	db "@"

OakRating08:
	text_jump _OakRating08
	db "@"

OakRating09:
	text_jump _OakRating09
	db "@"

OakRating10:
	text_jump _OakRating10
	db "@"

OakRating11:
	text_jump _OakRating11
	db "@"

OakRating12:
	text_jump _OakRating12
	db "@"

OakRating13:
	text_jump _OakRating13
	db "@"

OakRating14:
	text_jump _OakRating14
	db "@"

OakRating15:
	text_jump _OakRating15
	db "@"

OakRating16:
	text_jump _OakRating16
	db "@"

OakRating17:
	text_jump _OakRating17
	db "@"

OakRating18:
	text_jump _OakRating18
	db "@"

OakRating19:
	text_jump _OakRating19
	db "@"

OakPCText4: ; 0x2674c
	text_jump _OakPCText4
	db "@"


InitDecorations: ; 26751 (9:6751)
	ld a, DECO_FEATHERY_BED
	ld [Bed], a
	ld a, DECO_TOWN_MAP
	ld [Poster], a
	ret

_KrisDecorationMenu: ; 0x2675c
	ld a, [wcf76]
	push af
	ld hl, MenuDataHeader_0x2679a
	call LoadMenuDataHeader
	xor a
	ld [wd1ee], a
	ld a, $1
	ld [wd1ef], a
.asm_2676f
	ld a, [wd1ef]
	ld [wMenuCursorBuffer], a
	call Function26806
	call DoNthMenu
	ld a, [MenuSelection2]
	ld [wd1ef], a
	jr c, .asm_2678e
	ld a, [MenuSelection]
	ld hl, Unknown_267aa
	call MenuJumptable
	jr nc, .asm_2676f

.asm_2678e
	call ExitMenu
	pop af
	ld [wcf76], a
	ld a, [wd1ee]
	ld c, a
	ret
; 0x2679a

MenuDataHeader_0x2679a: ; 0x2679a
	db $40 ; flags
	db 00, 05 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_0x267a2
	db 1 ; default option
; 0x267a2

MenuData2_0x267a2: ; 0x267a2
	db $a0 ; flags
	db 0 ; items
	dw wd002
	dw PlaceNthMenuStrings
	dw Unknown_267aa
; 0x267aa

Unknown_267aa: ; 267aa
	dw Function268b5, .bed
	dw Function268ca, .carpet
	dw Function268df, .plant
	dw Function268f3, .poster
	dw Function26908, .game
	dw Function2691d, .ornament
	dw Function26945, .big_doll
	dw Function26959, .exit

.bed      db "BED@"
.carpet   db "CARPET@"
.plant    db "PLANT@"
.poster   db "POSTER@"
.game     db "GAME CONSOLE@"
.ornament db "ORNAMENT@"
.big_doll db "BIG DOLL@"
.exit     db "EXIT@"
; 26806

Function26806: ; 26806
	xor a
	ld [wcf76], a
	call Function26822
	call Function2683a
	ld a, $7
	call Function26830
	ld hl, StringBuffer2
	ld de, wd002
	ld bc, $d
	call CopyBytes
	ret

Function26822: ; 26822 (9:6822)
	ld hl, StringBuffer2
	xor a
	ld [hli], a
	ld bc, ITEM_NAME_LENGTH - 1
	ld a, -1
	call ByteFill
	ret

Function26830: ; 26830 (9:6830)
	ld hl, StringBuffer2
	inc [hl]
	ld e, [hl]
	ld d, 0
	add hl, de
	ld [hl], a
	ret

Function2683a: ; 2683a (9:683a)
	ld hl, Jumptable_26855
.loop
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	or e
	jr z, .done
	push hl
	call _de_
	pop hl
	jr nc, .next
	ld a, [hl]
	push hl
	call Function26830
	pop hl
.next
	inc hl
	jr .loop
.done
	ret
; 26855 (9:6855)

Jumptable_26855: ; 26855
	dwb Function268bd, 0 ; bed
	dwb Function268d2, 1 ; carpet
	dwb Function268e7, 2 ; plant
	dwb Function268fb, 3 ; poster
	dwb Function26910, 4 ; game console
	dwb Function26925, 5 ; ornament
	dwb Function2694d, 6 ; big doll
	dw 0 ; end
; 2686c

Function2686c: ; 2686c
	xor a
	ld hl, wd002
	ld [hli], a
	ld a, -1
	ld bc, $10
	call ByteFill
	ret
; 2687a

CheckAllDecorationFlags: ; 2687a
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	push af
	ld b, CHECK_FLAG
	call DecorationFlagAction
	ld a, c
	and a
	pop bc
	ld a, b
	call nz, Function26891
	pop hl
	jr .loop

.done
	ret
; 26891

Function26891: ; 26891
	ld hl, wd002
	inc [hl]
	ld e, [hl]
	ld d, $0
	add hl, de
	ld [hl], a
	ret
; 2689b

Function2689b: ; 2689b
	push bc
	push hl
	call Function2686c
	pop hl
	call CheckAllDecorationFlags
	pop bc
	ld a, [wd002]
	and a
	ret z
	ld a, c
	call Function26891
	ld a, $0
	call Function26891
	scf
	ret
; 268b5

Function268b5: ; 268b5
	call Function268bd
	call Function2695b
	xor a
	ret
; 268bd

Function268bd: ; 268bd
	ld hl, Unknown_268c5
	ld c, 1
	jp Function2689b
; 268c5

Unknown_268c5: ; 268c5
	db 2, 3, 4, 5, $ff
; 268ca

Function268ca: ; 268ca
	call Function268d2
	call Function2695b
	xor a
	ret
; 268d2

Function268d2: ; 268d2
	ld hl, Unknown_268da
	ld c, 6
	jp Function2689b
; 268da

Unknown_268da: ; 268da
	db 7, 8, 9, 10, $ff
; 268df

Function268df: ; 268df
	call Function268e7
	call Function2695b
	xor a
	ret
; 268e7

Function268e7: ; 268e7
	ld hl, Unknown_268ef
	ld c, 11
	jp Function2689b
; 268ef

Unknown_268ef: ; 268ef
	db 12, 13, 14, $ff
; 268f3

Function268f3: ; 268f3
	call Function268fb
	call Function2695b
	xor a
	ret
; 268fb

Function268fb: ; 268fb
	ld hl, Unknown_26903
	ld c, 15
	jp Function2689b
; 26903

Unknown_26903: ; 26903
	db 16, 17, 18, 19, $ff
; 26908

Function26908: ; 26908
	call Function26910
	call Function2695b
	xor a
	ret
; 26910

Function26910: ; 26910
	ld hl, Unknown_26918
	ld c, 20
	jp Function2689b
; 26918

Unknown_26918: ; 26918
	db 21, 22, 23, 24, $ff
; 2691d

Function2691d: ; 2691d
	call Function26925
	call Function2695b
	xor a
	ret
; 26925

Function26925: ; 26925
	ld hl, Unknown_2692d
	ld c, 29
	jp Function2689b
; 2692d

Unknown_2692d: ; 2692d
	db 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
	db 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
	db 50, 51, 52, -1
; 26945

Function26945: ; 26945
	call Function2694d
	call Function2695b
	xor a
	ret
; 2694d

Function2694d: ; 2694d
	ld hl, Unknown_26955
	ld c, 25
	jp Function2689b
; 26955

Unknown_26955: ; 26955
	db 26, 27, 28, -1
; 26959

Function26959: ; 26959
	scf
	ret
; 2695b

Function2695b: ; 2695b
	ld a, [wd002]
	and a
	jr z, .empty
	cp 8
	jr nc, .beyond_eight
	xor a
	ld [wcf76], a
	ld hl, MenuDataHeader_0x269b5
	call LoadMenuDataHeader
	call DoNthMenu
	jr c, .no_action_1
	call DoDecorationAction2

.no_action_1
	call ExitMenu
	ret

.beyond_eight
	ld hl, wd002
	ld e, [hl]
	dec [hl]
	ld d, 0
	add hl, de
	ld [hl], -1
	call LoadStandardMenuDataHeader
	ld hl, MenuDataHeader_0x269c5
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call Function352f
	xor a
	ld [wd0e4], a
	call HandleScrollingMenu
	ld a, [wcf73]
	cp 2
	jr z, .no_action_2
	call DoDecorationAction2

.no_action_2
	call ExitMenu
	ret

.empty
	ld hl, UnknownText_0x269b0
	call MenuTextBoxBackup
	ret
; 269b0

UnknownText_0x269b0: ; 0x269b0
	; There's nothing to choose.
	text_jump UnknownText_0x1bc471
	db "@"
; 0x269b5

MenuDataHeader_0x269b5: ; 0x269b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 17, 19 ; end coords
	dw MenuData2_0x269bd
	db 1 ; default option
; 0x269bd

MenuData2_0x269bd: ; 0x269bd
	db $a0 ; flags
	db 0 ; items
	dw wd002
	dw DecorationMenuFunction
	dw DecorationAttributes
; 0x269c5

MenuDataHeader_0x269c5: ; 0x269c5
	db $40 ; flags
	db 01, 01 ; start coords
	db 16, 18 ; end coords
	dw MenuData2_0x269cd
	db 1 ; default option
; 0x269cd

MenuData2_0x269cd: ; 0x269cd
	db $10 ; flags
	db 8, 0 ; rows, columns
	db 1 ; horizontal spacing
	dbw 0, wd002 ; text pointer
	dba DecorationMenuFunction
	dbw 0, 0
	dbw 0, 0
; 269dd


GetDecorationData: ; 269dd
	ld hl, DecorationAttributes
	ld bc, 6
	call AddNTimes
	ret
; 269e7

GetDecorationName: ; 269e7
	push hl
	call GetDecorationData
	call GetDecoName
	pop hl
	call CopyName2
	ret
; 269f3

DecorationMenuFunction: ; 269f3
	ld a, [MenuSelection]
	push de
	call GetDecorationData
	call GetDecoName
	pop hl
	call PlaceString
	ret
; 26a02

DoDecorationAction2: ; 26a02
	ld a, [MenuSelection]
	call GetDecorationData
	ld de, 2 ; function 2
	add hl, de
	ld a, [hl]
	ld hl, .DecoActions
	rst JumpTable
	ret
; 26a12

.DecoActions: ; 26a12
	dw DecoAction_nothing
	dw DecoAction_setupbed
	dw DecoAction_putawaybed
	dw DecoAction_setupcarpet
	dw DecoAction_putawaycarpet
	dw DecoAction_setupplant
	dw DecoAction_putawayplant
	dw DecoAction_setupposter
	dw DecoAction_putawayposter
	dw DecoAction_setupconsole
	dw DecoAction_putawayconsole
	dw DecoAction_setupbigdoll
	dw DecoAction_putawaybigdoll
	dw DecoAction_setupornament
	dw DecoAction_putawayornament
; 26a30


GetDecorationFlag: ; 26a30
	call GetDecorationData
	ld de, 3 ; event flag
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 26a3b

DecorationFlagAction: ; 26a3b
	push bc
	call GetDecorationFlag
	pop bc
	call EventFlagAction
	ret
; 26a44

GetDecorationSprite: ; 26a44
	ld a, c
	call GetDecorationData
	ld de, 5 ; sprite
	add hl, de
	ld a, [hl]
	ld c, a
	ret
; 26a4f

decoration: MACRO
	; type, name, command, event flag, tile/sprite
	db \1, \2, \3
	dw \4
	db \5
ENDM

DecorationAttributes: ; 26a4f
	decoration DECO_PLANT,    $00,               $0,                 EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BED,       EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_BED,      FEATHERY_BED,      SET_UP_BED,         EVENT_DECO_BED_1,                  $1b
	decoration DECO_BED,      PINK_BED,          SET_UP_BED,         EVENT_DECO_BED_2,                  $1c
	decoration DECO_BED,      POLKADOT_BED,      SET_UP_BED,         EVENT_DECO_BED_3,                  $1d
	decoration DECO_BED,      PIKACHU_BED,       SET_UP_BED,         EVENT_DECO_BED_4,                  $1e
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CARPET,    EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_CARPET,   RED_CARPET,        SET_UP_CARPET,      EVENT_DECO_CARPET_1,               $08
	decoration DECO_CARPET,   BLUE_CARPET,       SET_UP_CARPET,      EVENT_DECO_CARPET_2,               $0b
	decoration DECO_CARPET,   YELLOW_CARPET,     SET_UP_CARPET,      EVENT_DECO_CARPET_3,               $0e
	decoration DECO_CARPET,   GREEN_CARPET,      SET_UP_CARPET,      EVENT_DECO_CARPET_4,               $11
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_PLANT,     EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_PLANT,    MAGNAPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_1,                $20
	decoration DECO_PLANT,    TROPICPLANT,       SET_UP_PLANT,       EVENT_DECO_PLANT_2,                $21
	decoration DECO_PLANT,    JUMBOPLANT,        SET_UP_PLANT,       EVENT_DECO_PLANT_3,                $22
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_POSTER,    EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_PLANT,    TOWN_MAP_D,        SET_UP_POSTER,      EVENT_DECO_PLANT_4,                $1f
	decoration DECO_POSTER,   PIKACHU,           SET_UP_POSTER,      EVENT_DECO_POSTER_1,               $23
	decoration DECO_POSTER,   CLEFAIRY,          SET_UP_POSTER,      EVENT_DECO_POSTER_2,               $24
	decoration DECO_POSTER,   JIGGLYPUFF,        SET_UP_POSTER,      EVENT_DECO_POSTER_3,               $25
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_CONSOLE,   EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_PLANT,    FAMICOM,           SET_UP_CONSOLE,     EVENT_DECO_FAMICOM,                SPRITE_FAMICOM
	decoration DECO_PLANT,    SUPER_NES,         SET_UP_CONSOLE,     EVENT_DECO_SNES,                   SPRITE_SNES
	decoration DECO_PLANT,    NINTENDO_64,       SET_UP_CONSOLE,     EVENT_DECO_N64,                    SPRITE_N64
	decoration DECO_PLANT,    VIRTUAL_BOY,       SET_UP_CONSOLE,     EVENT_DECO_VIRTUAL_BOY,            SPRITE_VIRTUAL_BOY
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_BIG_DOLL,  EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_BIGDOLL,  SNORLAX,           SET_UP_BIG_DOLL,    EVENT_DECO_BIG_SNORLAX_DOLL,       SPRITE_BIG_SNORLAX
	decoration DECO_BIGDOLL,  ONIX,              SET_UP_BIG_DOLL,    EVENT_DECO_BIG_ONIX_DOLL,          SPRITE_BIG_ONIX
	decoration DECO_BIGDOLL,  LAPRAS,            SET_UP_BIG_DOLL,    EVENT_DECO_BIG_LAPRAS_DOLL,        SPRITE_BIG_LAPRAS
	decoration DECO_PLANT,    PUT_IT_AWAY,       PUT_AWAY_DOLL,      EVENT_GAVE_KURT_APRICORNS,                         $00
	decoration DECO_DOLL,     PIKACHU,           SET_UP_DOLL,        EVENT_DECO_PIKACHU_DOLL,           SPRITE_PIKACHU
	decoration DECO_PLANT,    SURF_PIKA_DOLL,    SET_UP_DOLL,        EVENT_DECO_SURFING_PIKACHU_DOLL,   SPRITE_SURFING_PIKACHU
	decoration DECO_DOLL,     CLEFAIRY,          SET_UP_DOLL,        EVENT_DECO_CLEFAIRY_DOLL,          SPRITE_CLEFAIRY
	decoration DECO_DOLL,     JIGGLYPUFF,        SET_UP_DOLL,        EVENT_DECO_JIGGLYPUFF_DOLL,        SPRITE_JIGGLYPUFF
	decoration DECO_DOLL,     BULBASAUR,         SET_UP_DOLL,        EVENT_DECO_BULBASAUR_DOLL,         SPRITE_BULBASAUR
	decoration DECO_DOLL,     CHARMANDER,        SET_UP_DOLL,        EVENT_DECO_CHARMANDER_DOLL,        SPRITE_CHARMANDER
	decoration DECO_DOLL,     SQUIRTLE,          SET_UP_DOLL,        EVENT_DECO_SQUIRTLE_DOLL,          SPRITE_SQUIRTLE
	decoration DECO_DOLL,     POLIWAG,           SET_UP_DOLL,        EVENT_DECO_POLIWAG_DOLL,           SPRITE_POLIWAG
	decoration DECO_DOLL,     DIGLETT,           SET_UP_DOLL,        EVENT_DECO_DIGLETT_DOLL,           SPRITE_DIGLETT
	decoration DECO_DOLL,     STARYU,            SET_UP_DOLL,        EVENT_DECO_STARMIE_DOLL,           SPRITE_STARMIE
	decoration DECO_DOLL,     MAGIKARP,          SET_UP_DOLL,        EVENT_DECO_MAGIKARP_DOLL,          SPRITE_MAGIKARP
	decoration DECO_DOLL,     ODDISH,            SET_UP_DOLL,        EVENT_DECO_ODDISH_DOLL,            SPRITE_ODDISH
	decoration DECO_DOLL,     GENGAR,            SET_UP_DOLL,        EVENT_DECO_GENGAR_DOLL,            SPRITE_GENGAR
	decoration DECO_DOLL,     SHELLDER,          SET_UP_DOLL,        EVENT_DECO_SHELLDER_DOLL,          SPRITE_SHELLDER
	decoration DECO_DOLL,     GRIMER,            SET_UP_DOLL,        EVENT_DECO_GRIMER_DOLL,            SPRITE_GRIMER
	decoration DECO_DOLL,     VOLTORB,           SET_UP_DOLL,        EVENT_DECO_VOLTORB_DOLL,           SPRITE_VOLTORB
	decoration DECO_DOLL,     WEEDLE,            SET_UP_DOLL,        EVENT_DECO_WEEDLE_DOLL,            SPRITE_WEEDLE
	decoration DECO_DOLL,     UNOWN,             SET_UP_DOLL,        EVENT_DECO_UNOWN_DOLL,             SPRITE_UNOWN
	decoration DECO_DOLL,     GEODUDE,           SET_UP_DOLL,        EVENT_DECO_GEODUDE_DOLL,           SPRITE_GEODUDE
	decoration DECO_DOLL,     MACHOP,            SET_UP_DOLL,        EVENT_DECO_MACHOP_DOLL,            SPRITE_MACHOP
	decoration DECO_DOLL,     TENTACOOL,         SET_UP_DOLL,        EVENT_DECO_TENTACOOL_DOLL,         SPRITE_TENTACOOL
	decoration DECO_PLANT,    GOLD_TROPHY,       SET_UP_DOLL,        EVENT_DECO_GOLD_TROPHY,            SPRITE_GOLD_TROPHY
	decoration DECO_PLANT,    SILVER_TROPHY,     SET_UP_DOLL,        EVENT_DECO_SILVER_TROPHY,          SPRITE_SILVER_TROPHY
; 26b8d


DecorationNames: ; 26b8d
	db "CANCEL@"
	db "PUT IT AWAY@"
	db "MAGNAPLANT@"
	db "TROPICPLANT@"
	db "JUMBOPLANT@"
	db "TOWN MAP@"
	db "NES@"
	db "SUPER NES@"
	db "NINTENDO 64@"
	db "VIRTUAL BOY@"
	db "GOLD TROPHY@"
	db "SILVER TROPHY@"
	db "SURF PIKACHU DOLL@"
	db " BED@"
	db " CARPET@"
	db " POSTER@"
	db " DOLL@"
	db "BIG @"
	db "FEATHERY@"
	db "PIKACHU@"
	db "PINK@"
	db "POLKADOT@"
	db "RED@"
	db "BLUE@"
	db "YELLOW@"
	db "GREEN@"
; 26c72

GetDecoName: ; 26c72
	ld a, [hli]
	ld e, [hl]
	ld bc, StringBuffer2
	push bc
	ld hl, .NameFunctions
	rst JumpTable
	pop de
	ret
; 26c7e

.NameFunctions: ; 26c7e
	dw .invalid
	dw .plant
	dw .bed
	dw .carpet
	dw .poster
	dw .doll
	dw .bigdoll
; 26c8c


.invalid: ; 26c8c
	ret
; 26c8d

.plant: ; 26c8d
	ld a, e
	jr .getdeconame

.bed: ; 26c90
	call .plant
	ld a, _BED
	jr .getdeconame

.carpet: ; 26c97
	call .plant
	ld a, _CARPET
	jr .getdeconame

.poster: ; 26c9e
	ld a, e
	call .getpokename
	ld a, _POSTER
	jr .getdeconame

.doll: ; 26ca6
	ld a, e
	call .getpokename
	ld a, _DOLL
	jr .getdeconame

.bigdoll: ; 26cae
	push de
	ld a, BIG_
	call .getdeconame
	pop de
	ld a, e
	jr .getpokename

.unused: ; 26cb8
	push de
	call .getdeconame
	pop de
	ld a, e
	jr .getdeconame

.getpokename: ; 26cc0
	push bc
	ld [wd265], a
	call GetPokemonName
	pop bc
	jr .copy

.getdeconame: ; 26cca
	call ._getdeconame
	jr .copy

._getdeconame: ; 26ccf
	push bc
	ld hl, DecorationNames
	call GetNthString
	ld d, h
	ld e, l
	pop bc
	ret

.copy: ; 26cda
	ld h, b
	ld l, c
	call CopyName2
	dec hl
	ld b, h
	ld c, l
	ret
; 26ce3

DecoAction_nothing: ; 26ce3
	scf
	ret
; 26ce5

DecoAction_setupbed: ; 26ce5
	ld hl, Bed
	jp DecoAction_TrySetItUp
; 26ceb

DecoAction_putawaybed: ; 26ceb
	ld hl, Bed
	jp DecoAction_TryPutItAway
; 26cf1

DecoAction_setupcarpet: ; 26cf1
	ld hl, Carpet
	jp DecoAction_TrySetItUp
; 26cf7

DecoAction_putawaycarpet: ; 26cf7
	ld hl, Carpet
	jp DecoAction_TryPutItAway
; 26cfd

DecoAction_setupplant: ; 26cfd
	ld hl, Plant
	jp DecoAction_TrySetItUp
; 26d03

DecoAction_putawayplant: ; 26d03
	ld hl, Plant
	jp DecoAction_TryPutItAway
; 26d09

DecoAction_setupposter: ; 26d09
	ld hl, Poster
	jp DecoAction_TrySetItUp
; 26d0f

DecoAction_putawayposter: ; 26d0f
	ld hl, Poster
	jp DecoAction_TryPutItAway
; 26d15

DecoAction_setupconsole: ; 26d15
	ld hl, Console
	jp DecoAction_TrySetItUp
; 26d1b

DecoAction_putawayconsole: ; 26d1b
	ld hl, Console
	jp DecoAction_TryPutItAway
; 26d21

DecoAction_setupbigdoll: ; 26d21
	ld hl, BigDoll
	jp DecoAction_TrySetItUp
; 26d27

DecoAction_putawaybigdoll: ; 26d27
	ld hl, BigDoll
	jp DecoAction_TryPutItAway
; 26d2d

DecoAction_TrySetItUp: ; 26d2d
	ld a, [hl]
	ld [Buffer1], a
	push hl
	call DecoAction_SetItUp
	jr c, .failed
	ld a, 1
	ld [wd1ee], a
	pop hl
	ld a, [MenuSelection]
	ld [hl], a
	xor a
	ret

.failed
	pop hl
	xor a
	ret
; 26d46

DecoAction_SetItUp: ; 26d46
; See if there's anything of the same type already out
	ld a, [Buffer1]
	and a
	jr z, .nothingthere
; See if that item is already out
	ld b, a
	ld a, [MenuSelection]
	cp b
	jr z, .alreadythere
; Put away the item that's already out, and set up the new one
	ld a, [MenuSelection]
	ld hl, StringBuffer4
	call GetDecorationName
	ld a, [Buffer1]
	ld hl, StringBuffer3
	call GetDecorationName
	ld hl, UnknownText_0x26ee0
	call MenuTextBoxBackup
	xor a
	ret

.nothingthere
	ld a, [MenuSelection]
	ld hl, StringBuffer3
	call GetDecorationName
	ld hl, UnknownText_0x26edb
	call MenuTextBoxBackup
	xor a
	ret

.alreadythere
	ld hl, UnknownText_0x26ee5
	call MenuTextBoxBackup
	scf
	ret
; 26d86

DecoAction_TryPutItAway: ; 26d86
; If there is no item of that type already set, there is nothing to put away.
	ld a, [hl]
	ld [Buffer1], a
	xor a
	ld [hl], a
	ld a, [Buffer1]
	and a
	jr z, .nothingthere
; Put it away.
	ld a, $1
	ld [wd1ee], a
	ld a, [Buffer1]
	ld [MenuSelection], a
	ld hl, StringBuffer3
	call GetDecorationName
	ld hl, UnknownText_0x26ed1
	call MenuTextBoxBackup
	xor a
	ret

.nothingthere
	ld hl, UnknownText_0x26ed6
	call MenuTextBoxBackup
	xor a
	ret
; 26db3

DecoAction_setupornament: ; 26db3
	ld hl, UnknownText_0x26e41
	call DecoAction_AskWhichSide
	jr c, .cancel
	call DecoAction_SetItUp_Ornament
	jr c, .cancel
	ld a, $1
	ld [wd1ee], a
	jr DecoAction_FinishUp_Ornament

.cancel
	xor a
	ret

DecoAction_putawayornament: ; 26dc9
	ld hl, UnknownText_0x26e6b
	call DecoAction_AskWhichSide
	jr nc, .incave
	xor a
	ret

.incave
	call DecoAction_PutItAway_Ornament

DecoAction_FinishUp_Ornament: ; 26dd6
	call QueryWhichSide
	ld a, [wd1ec]
	ld [hl], a
	ld a, [wd1ed]
	ld [de], a
	xor a
	ret
; 26de3

DecoAction_SetItUp_Ornament: ; 26de3
	ld a, [wd1ec]
	and a
	jr z, .nothingthere
	ld b, a
	ld a, [MenuSelection]
	cp b
	jr z, .failed
	ld a, b
	ld hl, StringBuffer3
	call GetDecorationName
	ld a, [MenuSelection]
	ld hl, StringBuffer4
	call GetDecorationName
	ld a, [MenuSelection]
	ld [wd1ec], a
	call .getwhichside
	ld hl, UnknownText_0x26ee0
	call MenuTextBoxBackup
	xor a
	ret

.nothingthere
	ld a, [MenuSelection]
	ld [wd1ec], a
	call .getwhichside
	ld a, [MenuSelection]
	ld hl, StringBuffer3
	call GetDecorationName
	ld hl, UnknownText_0x26edb
	call MenuTextBoxBackup
	xor a
	ret

.failed
	ld hl, UnknownText_0x26ee5
	call MenuTextBoxBackup
	scf
	ret
; 26e33

.getwhichside: ; 26e33
	ld a, [MenuSelection]
	ld b, a
	ld a, [wd1ed]
	cp b
	ret nz
	xor a
	ld [wd1ed], a
	ret
; 26e41

UnknownText_0x26e41: ; 0x26e41
	; Which side do you want to put it on?
	text_jump UnknownText_0x1bc48c
	db "@"
; 0x26e46

DecoAction_PutItAway_Ornament: ; 26e46
	ld a, [wd1ec]
	and a
	jr z, .nothingthere
	ld hl, StringBuffer3
	call GetDecorationName
	ld a, $1
	ld [wd1ee], a
	xor a
	ld [wd1ec], a
	ld hl, UnknownText_0x26ed1
	call MenuTextBoxBackup
	xor a
	ret

.nothingthere
	ld hl, UnknownText_0x26ed6
	call MenuTextBoxBackup
	xor a
	ret
; 26e6b

UnknownText_0x26e6b: ; 0x26e6b
	; Which side do you want to put away?
	text_jump UnknownText_0x1bc4b2
	db "@"
; 0x26e70

DecoAction_AskWhichSide: ; 26e70
	call MenuTextBox
	ld hl, MenuDataHeader_0x26eab
	call GetMenu2
	call ExitMenu
	call CopyMenuData2
	jr c, .nope
	ld a, [MenuSelection2]
	cp 3
	jr z, .nope
	ld [Buffer2], a
	call QueryWhichSide
	ld a, [hl]
	ld [wd1ec], a
	ld a, [de]
	ld [wd1ed], a
	xor a
	ret

.nope
	scf
	ret
; 26e9a

QueryWhichSide: ; 26e9a
	ld hl, RightOrnament
	ld de, LeftOrnament
	ld a, [Buffer2]
	cp 1
	ret z
	push hl
	ld h, d
	ld l, e
	pop de
	ret
; 26eab

MenuDataHeader_0x26eab: ; 0x26eab
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 13 ; end coords
	dw MenuData2_0x26eb3
	db 1 ; default option
; 0x26eb3

MenuData2_0x26eb3: ; 0x26eb3
	db $80 ; flags
	db 3 ; items
	db "RIGHT SIDE@"
	db "LEFT SIDE@"
	db "CANCEL@"
; 0x26ed1

UnknownText_0x26ed1: ; 0x26ed1
	; Put away the @ .
	text_jump UnknownText_0x1bc4d7
	db "@"
; 0x26ed6

UnknownText_0x26ed6: ; 0x26ed6
	; There's nothing to put away.
	text_jump UnknownText_0x1bc4ec
	db "@"
; 0x26edb

UnknownText_0x26edb: ; 0x26edb
	; Set up the @ .
	text_jump UnknownText_0x1bc509
	db "@"
; 0x26ee0

UnknownText_0x26ee0: ; 0x26ee0
	; Put away the @ and set up the @ .
	text_jump UnknownText_0x1bc51c
	db "@"
; 0x26ee5

UnknownText_0x26ee5: ; 0x26ee5
	; That's already set up.
	text_jump UnknownText_0x1bc546
	db "@"
; 0x26eea

GetDecorationName_c_de: ; 26eea
	ld a, c
	ld h, d
	ld l, e
	call GetDecorationName
	ret
; 26ef1

DecorationFlagAction_c: ; 26ef1
	ld a, c
	jp DecorationFlagAction
; 26ef5


GetDecorationName_c: ; 26ef5 (9:6ef5)
	ld a, c
	call GetDecorationID
	ld hl, StringBuffer1
	push hl
	call GetDecorationName
	pop de
	ret


SetSpecificDecorationFlag: ; 26f02
	ld a, c
	call GetDecorationID
	ld b, SET_FLAG
	call DecorationFlagAction
	ret
; 26f0c

GetDecorationID: ; 26f0c
	push hl
	push de
	ld e, a
	ld d, 0
	ld hl, DecorationIDs
	add hl, de
	ld a, [hl]
	pop de
	pop hl
	ret
; 26f19

SetAllDecorationFlags: ; 26f19
	ld hl, DecorationIDs
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push hl
	ld b, SET_FLAG
	call DecorationFlagAction
	pop hl
	jr .loop

.done
	ret
; 26f2b

DecorationIDs: ; 26f2b
	db DECO_FEATHERY_BED ; 2
	db DECO_PINK_BED ; 3
	db DECO_POLKADOT_BED ; 4
	db DECO_PIKACHU_BED ; 5

	db DECO_RED_CARPET ; 7
	db DECO_BLUE_CARPET ; 8
	db DECO_YELLOW_CARPET ; 9
	db DECO_GREEN_CARPET ; a

	db DECO_MAGNAPLANT ; c
	db DECO_TROPICPLANT ; d
	db DECO_JUMBOPLANT ; e

	db DECO_TOWN_MAP ; 10
	db DECO_PIKACHU_POSTER ; 11
	db DECO_CLEFAIRY_POSTER ; 12
	db DECO_JIGGLYPUFF_POSTER ; 13

	db DECO_FAMICOM ; 15
	db DECO_SNES ; 16
	db DECO_N64 ; 17
	db DECO_VIRTUAL_BOY ; 18

	db DECO_PIKACHU_DOLL ; 1e
	db DECO_SURF_PIKACHU_DOLL ; 1f
	db DECO_CLEFAIRY_DOLL ; 20
	db DECO_JIGGLYPUFF_DOLL ; 21
	db DECO_BULBASAUR_DOLL ; 22
	db DECO_CHARMANDER_DOLL ; 23
	db DECO_SQUIRTLE_DOLL ; 24
	db DECO_POLIWAG_DOLL ; 25
	db DECO_DIGLETT_DOLL ; 26
	db DECO_STARMIE_DOLL ; 27
	db DECO_MAGIKARP_DOLL ; 28
	db DECO_ODDISH_DOLL ; 29
	db DECO_GENGAR_DOLL ; 2a
	db DECO_SHELLDER_DOLL ; 2b
	db DECO_GRIMER_DOLL ; 2c
	db DECO_VOLTORB_DOLL ; 2d
	db DECO_WEEDLE_DOLL ; 2e
	db DECO_UNOWN_DOLL ; 2f
	db DECO_GEODUDE_DOLL ; 30
	db DECO_MACHOP_DOLL ; 31
	db DECO_TENTACOOL_DOLL ; 32
	db DECO_BIG_SNORLAX_DOLL ; 1a
	db DECO_BIG_ONIX_DOLL ; 1b
	db DECO_BIG_LAPRAS_DOLL ; 1c
	db DECO_GOLD_TROPHY_DOLL ; 33
	db DECO_SILVER_TROPHY_DOLL ; 34
	db -1
; 26f59

DescribeDecoration:: ; 26f59
	ld a, b
	ld hl, JumpTable_DecorationDesc
	rst JumpTable
	ret
; 26f5f

JumpTable_DecorationDesc: ; 26f5f
	dw DecorationDesc_Poster
	dw DecorationDesc_LeftOrnament
	dw DecorationDesc_RightOrnament
	dw DecorationDesc_GiantDoll
	dw DecorationDesc_Console
; 26f69

DecorationDesc_Poster: ; 26f69
	ld a, [Poster]
	ld hl, DecorationDesc_PosterPointers
	ld de, 3
	call IsInArray
	jr c, .nope
	ld de, DecorationDesc_NullPoster
	ld b, BANK(DecorationDesc_NullPoster)
	ret

.nope
	ld b, BANK(DecorationDesc_TownMapPoster)
	inc hl
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret
; 26f84

DecorationDesc_PosterPointers: ; 26f84
	dbw DECO_TOWN_MAP, DecorationDesc_TownMapPoster
	dbw DECO_PIKACHU_POSTER, DecorationDesc_PikachuPoster
	dbw DECO_CLEFAIRY_POSTER, DecorationDesc_ClefairyPoster
	dbw DECO_JIGGLYPUFF_POSTER, DecorationDesc_JigglypuffPoster
	db -1
; 26f91

DecorationDesc_TownMapPoster: ; 0x26f91
	loadfont
	writetext UnknownText_0x26f9b
	closetext
	special Special_TownMap
	loadmovesprites
	end
; 0x26f9b

UnknownText_0x26f9b: ; 0x26f9b
	; It's the TOWN MAP.
	text_jump UnknownText_0x1bc55d
	db "@"
; 0x26fa0

DecorationDesc_PikachuPoster: ; 0x26fa0
	jumptext UnknownText_0x26fa3
; 0x26fa3

UnknownText_0x26fa3: ; 0x26fa3
	; It's a poster of a cute PIKACHU.
	text_jump UnknownText_0x1bc570
	db "@"
; 0x26fa8

DecorationDesc_ClefairyPoster: ; 0x26fa8
	jumptext UnknownText_0x26fab
; 0x26fab

UnknownText_0x26fab: ; 0x26fab
	; It's a poster of a cute CLEFAIRY.
	text_jump UnknownText_0x1bc591
	db "@"
; 0x26fb0

DecorationDesc_JigglypuffPoster: ; 0x26fb0
	jumptext UnknownText_0x26fb3
; 0x26fb3

UnknownText_0x26fb3: ; 0x26fb3
	; It's a poster of a cute JIGGLYPUFF.
	text_jump UnknownText_0x1bc5b3
	db "@"
; 0x26fb8

DecorationDesc_NullPoster: ; 26fb8
	end
; 26fb9

DecorationDesc_LeftOrnament: ; 26fb9
	ld a, [LeftOrnament]
	jr DecorationDesc_OrnamentOrConsole

DecorationDesc_RightOrnament: ; 26fbe
	ld a, [RightOrnament]
	jr DecorationDesc_OrnamentOrConsole

DecorationDesc_Console: ; 26fc3
	ld a, [Console]
	jr DecorationDesc_OrnamentOrConsole

DecorationDesc_OrnamentOrConsole: ; 26fc8
	ld c, a
	ld de, StringBuffer3
	call GetDecorationName_c_de
	ld b, BANK(Unknown_26fd5)
	ld de, Unknown_26fd5
	ret
; 26fd5

Unknown_26fd5: ; 26fd5
	dbw $53, UnknownText_0x26fd8
; 26fd8

UnknownText_0x26fd8: ; 0x26fd8
	; It's an adorable @ .
	text_jump UnknownText_0x1bc5d7
	db "@"
; 0x26fdd

DecorationDesc_GiantDoll: ; 26fdd
	ld b, BANK(Unknown_26fe3)
	ld de, Unknown_26fe3
	ret
; 26fe3

Unknown_26fe3: ; 26fe3
	dbw $53, UnknownText_0x26fe6
; 26fe6

UnknownText_0x26fe6: ; 0x26fe6
	; A giant doll! It's fluffy and cuddly.
	text_jump UnknownText_0x1bc5ef
	db "@"
; 0x26feb

ToggleMaptileDecorations: ; 26feb
	lb de, 0, 4
	ld a, [Bed]
	call SetDecorationTile
	lb de, 7, 4
	ld a, [Plant]
	call SetDecorationTile
	lb de, 6, 0
	ld a, [Poster]
	call SetDecorationTile
	call SetPosterVisibility
	lb de, 0, 0
	call PadCoords_de
	ld a, [Carpet]
	and a
	ret z
	call _GetDecorationSprite
	ld [hl], a
	push af
	lb de, 0, 2
	call PadCoords_de
	pop af
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	dec a
	ld [hl], a
	ret
; 27027

SetPosterVisibility: ; 27027
	ld b, SET_FLAG
	ld a, [Poster]
	and a
	jr nz, .ok
	ld b, RESET_FLAG

.ok
	ld de, EVENT_KRISS_ROOM_POSTER
	jp EventFlagAction
; 27037

SetDecorationTile: ; 27037
	push af
	call PadCoords_de
	pop af
	and a
	ret z
	call _GetDecorationSprite
	ld [hl], a
	ret
; 27043

ToggleDecorationsVisibility: ; 27043
	ld de, EVENT_KRISS_HOUSE_2F_CONSOLE
	ld hl, VariableSprites + SPRITE_CONSOLE - SPRITE_VARS
	ld a, [Console]
	call ToggleDecorationVisibility
	ld de, EVENT_KRISS_HOUSE_2F_DOLL_1
	ld hl, VariableSprites + SPRITE_DOLL_1 - SPRITE_VARS
	ld a, [LeftOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_KRISS_HOUSE_2F_DOLL_2
	ld hl, VariableSprites + SPRITE_DOLL_2 - SPRITE_VARS
	ld a, [RightOrnament]
	call ToggleDecorationVisibility
	ld de, EVENT_KRISS_HOUSE_2F_BIG_DOLL
	ld hl, VariableSprites + SPRITE_BIG_DOLL - SPRITE_VARS
	ld a, [BigDoll]
	call ToggleDecorationVisibility
	ret
; 27074

ToggleDecorationVisibility: ; 27074
	and a
	jr z, .hide
	call _GetDecorationSprite
	ld [hl], a
	ld b, RESET_FLAG
	jp EventFlagAction

.hide
	ld b, SET_FLAG
	jp EventFlagAction
; 27085

_GetDecorationSprite: ; 27085
	ld c, a
	push de
	push hl
	callba GetDecorationSprite
	pop hl
	pop de
	ld a, c
	ret
; 27092

PadCoords_de: ; 27092
	ld a, d
	add 4
	ld d, a
	ld a, e
	add 4
	ld e, a
	call GetBlockLocation
	ret
; 2709e


LevelUpHappinessMod: ; 2709e
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $7f
	ld d, a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	call GetWorldMapLocation
	cp d
	ld c, HAPPINESS_GAINLEVEL
	jr nz, .ok
	ld c, HAPPINESS_GAINLEVELATHOME

.ok
	callab ChangeHappiness
	ret
; 270c4

INCLUDE "trainers/dvs.asm"

Function2715c: ; 2715c
	call ClearBGPalettes
	call ClearTileMap
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jr z, .gettutorialbackpic
	callba GetMonBackpic
	jr .continue

.gettutorialbackpic
	callba GetTrainerBackpic

.continue
	callba GetMonFrontpic
	callba _LoadBattleFontsHPBar
	call ClearSGB
	call WriteBackup
	call LoadStandardMenuDataHeader
	call WaitBGMap
	jp SetPalettes
; 27192

ConsumeHeldItem: ; 27192
	push hl
	push de
	push bc
	ld a, [hBattleTurn]
	and a
	ld hl, OTPartyMon1Item
	ld de, EnemyMonItem
	ld a, [CurOTMon]
	jr z, .theirturn
	ld hl, PartyMon1Item
	ld de, BattleMonItem
	ld a, [CurBattleMon]

.theirturn
	push hl
	push af
	ld a, [de]
	ld b, a
	callba GetItemHeldEffect
	ld hl, .ConsumableEffects
.loop
	ld a, [hli]
	cp b
	jr z, .ok
	inc a
	jr nz, .loop
	pop af
	pop hl
	pop bc
	pop de
	pop hl
	ret

.ok
	xor a
	ld [de], a
	pop af
	pop hl
	call GetPartyLocation
	ld a, [hBattleTurn]
	and a
	jr nz, .ourturn
	ld a, [wBattleMode]
	dec a
	jr z, .done

.ourturn
	ld [hl], $0

.done
	pop bc
	pop de
	pop hl
	ret
; 271de

.ConsumableEffects: ; 271de
; Consumable items?
	db HELD_BERRY
	db HELD_2
	db HELD_5
	db HELD_HEAL_POISON
	db HELD_HEAL_FREEZE
	db HELD_HEAL_BURN
	db HELD_HEAL_SLEEP
	db HELD_HEAL_PARALYZE
	db HELD_HEAL_STATUS
	db HELD_30
	db HELD_ATTACK_UP
	db HELD_DEFENSE_UP
	db HELD_SPEED_UP
	db HELD_SP_ATTACK_UP
	db HELD_SP_DEFENSE_UP
	db HELD_ACCURACY_UP
	db HELD_EVASION_UP
	db HELD_38
	db HELD_71
	db HELD_ESCAPE
	db HELD_CRITICAL_UP
	db -1
; 271f4

MoveEffectsPointers: ; 271f4
INCLUDE "battle/moves/move_effects_pointers.asm"

MoveEffects: ; 2732e
INCLUDE "battle/moves/move_effects.asm"

Function27a28: ; 27a28
	call Function2500e
	ld b, a
	ret
; 27a2d


SECTION "bankA", ROMX, BANK[$A]

INCLUDE "engine/link.asm"

Function29fe4: ; unreferenced
	ld a, $0
	call GetSRAMBank
	ld d, $0
	ld b, $2
	predef FlagPredef
	call CloseSRAM
	ld a, c
	and a
	ret
; 29ff8

INCLUDE "engine/wildmons.asm"

DetermineLinkBattleResult: ; 2b930
	callba UpdateEnemyMonInParty
	ld hl, PartyMon1HP
	call .CountMonsRemaining
	push bc
	ld hl, OTPartyMon1HP
	call .CountMonsRemaining
	ld a, c
	pop bc
	cp c
	jr z, .even_number_of_mons_remaining
	jr c, .defeat
	jr .victory

.even_number_of_mons_remaining
	call .BothSides_CheckNumberMonsAtFullHealth
	jr z, .drawn
	ld a, e
	cp $1
	jr z, .victory
	cp $2
	jr z, .defeat
	ld hl, PartyMon1HP
	call .CalcPercentHPRemaining
	push de
	ld hl, OTPartyMon1HP
	call .CalcPercentHPRemaining
	pop hl
	ld a, d
	cp h
	jr c, .victory
	jr z, .compare_lo
	jr .defeat

.compare_lo
	ld a, e
	cp l
	jr z, .drawn
	jr nc, .defeat

.victory
	ld a, [wBattleResult]
	and $f0
	ld [wBattleResult], a
	ret

.defeat
	ld a, [wBattleResult]
	and $f0
	add $1
	ld [wBattleResult], a
	ret

.drawn
	ld a, [wBattleResult]
	and $f0
	add $2
	ld [wBattleResult], a
	ret
; 2b995

.CountMonsRemaining: ; 2b995
	ld c, 0
	ld b, 3
	ld de, PARTYMON_STRUCT_LENGTH - 1
.loop
	ld a, [hli]
	or [hl]
	jr nz, .not_fainted
	inc c

.not_fainted
	add hl, de
	dec b
	jr nz, .loop
	ret
; 2b9a6

.CalcPercentHPRemaining: ; 2b9a6
	ld de, 0
	ld c, $3
.loop2
	ld a, [hli]
	or [hl]
	jr z, .next
	dec hl
	xor a
	ld [hDividend + 0], a
	ld a, [hli]
	ld [hDividend + 1], a
	ld a, [hli]
	ld [hDividend + 2], a
	xor a
	ld [hDividend + 3], a
	ld a, [hli]
	ld b, a
	ld a, [hld]
	srl b
	rr a
	srl b
	rr a
	ld [hDivisor], a
	ld b, $4
	call Divide
	ld a, [hQuotient + 2]
	add e
	ld e, a
	ld a, [hQuotient + 1]
	adc d
	ld d, a
	dec hl

.next
	push de
	ld de, $2f
	add hl, de
	pop de
	dec c
	jr nz, .loop2
	ret
; 2b9e1

.BothSides_CheckNumberMonsAtFullHealth: ; 2b9e1
	ld hl, PartyMon1HP
	call .CheckFaintedOrFullHealth
	jr nz, .finish ; we have a pokemon that's neither fainted nor at full health
	ld hl, OTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $1
	ret

.finish
	ld hl, OTPartyMon1HP
	call .CheckFaintedOrFullHealth
	ld e, $0
	ret nz ; we both have pokemon that are neither fainted nor at full health
	ld e, $2
	ld a, $1
	and a
	ret
; 2ba01

.CheckFaintedOrFullHealth: ; 2ba01
	ld d, 3
.loop3
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	or b
	jr z, .fainted_or_full_health
	ld a, [hli]
	cp b
	ret nz
	ld a, [hld]
	cp c
	ret nz

.fainted_or_full_health
	push de
	ld de, PARTYMON_STRUCT_LENGTH - 2
	add hl, de
	pop de
	dec d
	jr nz, .loop3
	ret
; 2ba1a


ChrisBackpic: ; 2ba1a
INCBIN "gfx/misc/player.6x6.2bpp.lz"
; 2bbaa

DudeBackpic: ; 2bbaa
INCBIN "gfx/misc/dude.6x6.2bpp.lz"
; 2bcea


SECTION "bankB", ROMX, BANK[$B]

Function2c000: ; 2c000
	ld a, $e4
	ld [rOBP0], a
	call Function2c165
	call Function2c01c
	ld a, [wBattleMode]
	dec a
	ret z
	jp Function2c03a
; 2c012



Function2c012: ; 2c012
	ld a, $e4
	ld [rOBP0], a
	call Function2c165
	jp Function2c03a
; 2c01c

Function2c01c: ; 2c01c
	call Function2c0ad
	ld hl, PartyMon1HP
	ld de, PartyCount
	call Function2c059
	ld a, $60
	ld hl, wcfc4
	ld [hli], a
	ld [hl], a
	ld a, $8
	ld [wd003], a
	ld hl, Sprites
	jp Function2c143
; 2c03a



Function2c03a: ; 2c03a
	call Function2c0c5
	ld hl, OTPartyMon1HP
	ld de, OTPartyCount
	call Function2c059
	ld hl, wcfc4
	ld a, $48
	ld [hli], a
	ld [hl], $20
	ld a, $f8
	ld [wd003], a
	ld hl, Sprites + $18
	jp Function2c143
; 2c059


Function2c059: ; 2c059
	ld a, [de]
	push af
	ld de, Buffer1
	ld c, $6
	ld a, $34
.asm_2c062
	ld [de], a
	inc de
	dec c
	jr nz, .asm_2c062
	pop af
	ld de, Buffer1
.asm_2c06b
	push af
	call Function2c075
	inc de
	pop af
	dec a
	jr nz, .asm_2c06b
	ret
; 2c075

Function2c075: ; 2c075
	ld a, [hli]
	and a
	jr nz, .asm_2c07f
	ld a, [hl]
	and a
	ld b, $33
	jr z, .asm_2c08b

.asm_2c07f
rept 3
	dec hl
endr
	ld a, [hl]
	and a
	ld b, $32
	jr nz, .asm_2c08e
	dec b
	jr .asm_2c08e

.asm_2c08b
rept 3
	dec hl
endr

.asm_2c08e
	ld a, b
	ld [de], a
	ld bc, $32
	add hl, bc
	ret
; 2c095

DrawPlayerExpBar: ; 2c095
	ld hl, .data_2c0a9
	ld de, wd004
	ld bc, 4
	call CopyBytes
	hlcoord 18, 10
	ld de, -1
	jr Function2c0f1

.data_2c0a9
	db $73
	db $77
	db $6f
	db $76
; 2c0ad

Function2c0ad: ; 2c0ad
	ld hl, .data_2c0c1
	ld de, wd004
	ld bc, 4
	call CopyBytes
	hlcoord 18, 10
	ld de, -1
	jr Function2c0f1

.data_2c0c1
	db $73, $5c, $6f, $76
; 2c0c5

Function2c0c5: ; 2c0c5
	ld hl, .data_2c0ed
	ld de, wd004
	ld bc, 4
	call CopyBytes
	hlcoord 1, 2
	ld de, 1
	call Function2c0f1
	ld a, [wBattleMode]
	dec a
	ret nz
	ld a, [TempEnemyMonSpecies]
	dec a
	call CheckCaughtMon
	ret z
	hlcoord 1, 1
	ld [hl], $5d
	ret

.data_2c0ed
	db $6d
	db $74
	db $78
	db $76
; 2c0f1

Function2c0f1: ; 2c0f1
	ld a, [wd004]
	ld [hl], a
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld a, [StartFlypoint]
	ld [hl], a
	ld b, $8
.asm_2c0ff
	add hl, de
	ld a, [MovementBuffer]
	ld [hl], a
	dec b
	jr nz, .asm_2c0ff
	add hl, de
	ld a, [EndFlypoint]
	ld [hl], a
	ret
; 2c10d


Function2c10d: ; 2c10d
	call Function2c165
	ld hl, PartyMon1HP
	ld de, PartyCount
	call Function2c059
	ld hl, wcfc4
	ld a, $50
	ld [hli], a
	ld [hl], $40
	ld a, $8
	ld [wd003], a
	ld hl, Sprites
	call Function2c143
	ld hl, OTPartyMon1HP
	ld de, OTPartyCount
	call Function2c059
	ld hl, wcfc4
	ld a, "@"
	ld [hli], a
	ld [hl], $68
	ld hl, Sprites + $18
	jp Function2c143
; 2c143

Function2c143: ; 2c143
	ld de, Buffer1
	ld c, $6
.loop
	ld a, [wcfc5]
	ld [hli], a
	ld a, [wcfc4]
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, [wcfc4]
	ld b, a
	ld a, [wd003]
	add b
	ld [wcfc4], a
	inc de
	dec c
	jr nz, .loop
	ret
; 2c165

Function2c165: ; 2c165
	ld de, GFX_2c172
	ld hl, VTiles0 tile $31
	lb bc, BANK(GFX_2c172), 4
	call Get2bpp_2
	ret
; 2c172

GFX_2c172: ; 2c172
INCBIN "gfx/battle/balls.2bpp"
; 2c1b2

_ShowLinkBattleParticipants: ; 2c1b2
	call ClearBGPalettes
	call LoadFontsExtra
	hlcoord 2, 3
	ld b, 9
	ld c, 14
	call TextBox
	hlcoord 4, 5
	ld de, PlayerName
	call PlaceString
	hlcoord 4, 10
	ld de, OTPlayerName
	call PlaceString
	hlcoord 9, 8
	ld a, $69
	ld [hli], a
	ld [hl], $6a
	callba Function2c10d ; no need to callba
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ld a, $e4
	ld [rOBP0], a
	ret
; 2c1ef


TrainerClassNames:: ; 2c1ef
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "RIVAL@"
	db "#MON PROF.@"
	db "ELITE FOUR@"
	db "<PKMN> TRAINER@"
	db "ELITE FOUR@"
	db "ELITE FOUR@"
	db "ELITE FOUR@"
	db "CHAMPION@"
	db "LEADER@"
	db "LEADER@"
	db "LEADER@"
	db "SCIENTIST@"
	db "LEADER@"
	db "YOUNGSTER@"
	db "SCHOOLBOY@"
	db "BIRD KEEPER@"
	db "LASS@"
	db "LEADER@"
	db "COOLTRAINER@"
	db "COOLTRAINER@"
	db "BEAUTY@"
	db "#MANIAC@"
	db "ROCKET@"
	db "GENTLEMAN@"
	db "SKIER@"
	db "TEACHER@"
	db "LEADER@"
	db "BUG CATCHER@"
	db "FISHER@"
	db "SWIMMER♂@"
	db "SWIMMER♀@"
	db "SAILOR@"
	db "SUPER NERD@"
	db "RIVAL@"
	db "GUITARIST@"
	db "HIKER@"
	db "BIKER@"
	db "LEADER@"
	db "BURGLAR@"
	db "FIREBREATHER@"
	db "JUGGLER@"
	db "BLACKBELT@"
	db "ROCKET@"
	db "PSYCHIC@"
	db "PICNICKER@"
	db "CAMPER@"
	db "ROCKET@"
	db "SAGE@"
	db "MEDIUM@"
	db "BOARDER@"
	db "#FAN@"
	db "KIMONO GIRL@"
	db "TWINS@"
	db "#FAN@"
	db "<PKMN> TRAINER@"
	db "LEADER@"
	db "OFFICER@"
	db "ROCKET@"
	db "MYSTICALMAN@"



AI_Redundant: ; 2c41a
; Check if move effect c will fail because it's already been used.
; Return z if the move is a good choice.
; Return nz if the move is a bad choice.
	ld a, c
	ld de, 3
	ld hl, .Moves
	call IsInArray
	jp nc, .NotRedundant
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Moves: ; 2c42c
	dbw EFFECT_DREAM_EATER,  .DreamEater
	dbw EFFECT_HEAL,         .Heal
	dbw EFFECT_LIGHT_SCREEN, .LightScreen
	dbw EFFECT_MIST,         .Mist
	dbw EFFECT_FOCUS_ENERGY, .FocusEnergy
	dbw EFFECT_CONFUSE,      .Confuse
	dbw EFFECT_TRANSFORM,    .Transform
	dbw EFFECT_REFLECT,      .Reflect
	dbw EFFECT_SUBSTITUTE,   .Substitute
	dbw EFFECT_LEECH_SEED,   .LeechSeed
	dbw EFFECT_DISABLE,      .Disable
	dbw EFFECT_ENCORE,       .Encore
	dbw EFFECT_SNORE,        .Snore
	dbw EFFECT_SLEEP_TALK,   .SleepTalk
	dbw EFFECT_MEAN_LOOK,    .MeanLook
	dbw EFFECT_NIGHTMARE,    .Nightmare
	dbw EFFECT_SPIKES,       .Spikes
	dbw EFFECT_FORESIGHT,    .Foresight
	dbw EFFECT_PERISH_SONG,  .PerishSong
	dbw EFFECT_SANDSTORM,    .Sandstorm
	dbw EFFECT_ATTRACT,      .Attract
	dbw EFFECT_SAFEGUARD,    .Safeguard
	dbw EFFECT_RAIN_DANCE,   .RainDance
	dbw EFFECT_SUNNY_DAY,    .SunnyDay
	dbw EFFECT_TELEPORT,     .Teleport
	dbw EFFECT_MORNING_SUN,  .MorningSun
	dbw EFFECT_SYNTHESIS,    .Synthesis
	dbw EFFECT_MOONLIGHT,    .Moonlight
	dbw EFFECT_SWAGGER,      .Swagger
	dbw EFFECT_FUTURE_SIGHT, .FutureSight
	db -1

.LightScreen: ; 2c487
	ld a, [EnemyScreens]
	bit SCREENS_LIGHT_SCREEN, a
	ret

.Mist: ; 2c48d
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_MIST, a
	ret

.FocusEnergy: ; 2c493
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_FOCUS_ENERGY, a
	ret

.Confuse: ; 2c499
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret nz
	ld a, [PlayerScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.Transform: ; 2c4a5
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_TRANSFORMED, a
	ret

.Reflect: ; 2c4ab
	ld a, [EnemyScreens]
	bit SCREENS_REFLECT, a
	ret

.Substitute: ; 2c4b1
	ld a, [EnemySubStatus4]
	bit SUBSTATUS_SUBSTITUTE, a
	ret

.LeechSeed: ; 2c4b7
	ld a, [PlayerSubStatus4]
	bit SUBSTATUS_LEECH_SEED, a
	ret

.Disable: ; 2c4bd
	ld a, [PlayerDisableCount]
	and a
	ret

.Encore: ; 2c4c2
	ld a, [PlayerSubStatus5]
	bit SUBSTATUS_ENCORED, a
	ret

.Snore:
.SleepTalk: ; 2c4c8
	ld a, [EnemyMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.MeanLook: ; 2c4d1
	ld a, [EnemySubStatus5]
	bit SUBSTATUS_CANT_RUN, a
	ret

.Nightmare: ; 2c4d7
	ld a, [BattleMonStatus]
	and a
	jr z, .Redundant
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_NIGHTMARE, a
	ret

.Spikes: ; 2c4e3
	ld a, [PlayerScreens]
	bit SCREENS_SPIKES, a
	ret

.Foresight: ; 2c4e9
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_IDENTIFIED, a
	ret

.PerishSong: ; 2c4ef
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_PERISH, a
	ret

.Sandstorm: ; 2c4f5
	ld a, [Weather]
	cp WEATHER_SANDSTORM
	jr z, .Redundant
	jr .NotRedundant

.Attract: ; 2c4fe
	callba CheckOppositeGender
	jr c, .Redundant
	ld a, [PlayerSubStatus1]
	bit SUBSTATUS_IN_LOVE, a
	ret

.Safeguard: ; 2c50c
	ld a, [EnemyScreens]
	bit SCREENS_SAFEGUARD, a
	ret

.RainDance: ; 2c512
	ld a, [Weather]
	cp WEATHER_RAIN
	jr z, .Redundant
	jr .NotRedundant

.SunnyDay: ; 2c51b
	ld a, [Weather]
	cp WEATHER_SUN
	jr z, .Redundant
	jr .NotRedundant

.DreamEater: ; 2c524
	ld a, [BattleMonStatus]
	and SLP
	jr z, .Redundant
	jr .NotRedundant

.Swagger: ; 2c52d
	ld a, [PlayerSubStatus3]
	bit SUBSTATUS_CONFUSED, a
	ret

.FutureSight: ; 2c533
	ld a, [EnemyScreens]
	bit 5, a
	ret

.Heal:
.MorningSun:
.Synthesis:
.Moonlight: ; 2c539
	callba AICheckEnemyMaxHP
	jr nc, .NotRedundant

.Teleport:
.Redundant: ; 2c541
	ld a, 1
	and a
	ret

.NotRedundant: ; 2c545
	xor a
	ret


INCLUDE "event/move_deleter.asm"


Function2c642: ; 2c642 (b:4642)
	ld de, OverworldMap
	ld a, $1
	ld [de], a
	inc de
	ld a, BANK(sGameData)
	call GetSRAMBank
	ld hl, sPlayerData + PlayerID - wPlayerData
	ld a, [hli]
	ld [de], a
	ld b, a
	inc de
	ld a, [hl]
	ld [de], a
	ld c, a
	inc de
	push bc
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld bc, NAME_LENGTH
	call CopyBytes
	push de
	ld hl, sPokemonData + PokedexCaught - wPokemonData
	ld b, (NUM_POKEMON + 7) / 8
	call CountSetBits
	pop de
	pop bc
	ld a, [wd265]
	ld [de], a
	inc de
	call CloseSRAM
	call Random
	and $1
	ld [de], a
	inc de
	call Function2c6ac
	ld [de], a
	inc de
	ld a, c
	ld c, b
	ld b, a
	call Function2c6ac
	ld [de], a
	inc de
	ld a, BANK(s0_abe4)
	call GetSRAMBank
	ld a, [s0_abe4]
	ld [de], a
	inc de
	ld a, [s0_abe4 + 1]
	ld [de], a
	ld a, $14
	ld [wca00], a
	call CloseSRAM
	ld hl, OverworldMap
	ld de, wc950
	ld bc, SCREEN_WIDTH
	jp CopyBytes

Function2c6ac: ; 2c6ac (b:46ac)
	push de
	call Random
	cp $19 ; 10 percent
	jr c, .tenpercent
	call Random
	and $7
	ld d, a
	rl d
	ld e, $80
.loop
	rlc e
	dec a
	jr nz, .loop
	ld a, e
	and c
	jr z, .skip
	ld a, $1
.skip
	add d
	jr .done

.tenpercent
	call Random
	cp $32 ; 20 percent
	jr c, .twopercent
	call Random
	and $3
	ld d, a
	rl d
	ld e, $80
.loop2
	rlc e
	dec a
	jr nz, .loop2
	ld a, e
	and b
	jr z, .skip2
	ld a, $1
.skip2
	add d
	add $10
	jr .done

.twopercent
	call Random
	cp $32 ; 50 ; 20 percent
	jr c, .pointfourpercent
	ld a, b
	swap a
	and $7
	add $18
	jr .done

.pointfourpercent
	ld a, b
	and $80
	ld a, $20
	jr z, .done
	ld a, $21

.done
	pop de
	ret

MysteryGiftGetItemHeldEffect: ; 2c708 (b:4708)
	ld a, c
	cp $25 ; 37
	jr nc, Function2c722
	ld hl, Unknown_2c725
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

MysteryGiftGetDecoration: ; 2c715 (b:4715)
	ld a, c
	cp $25 ; 37
	jr nc, Function2c722
	ld hl, Unknown_2c74a
	ld b, 0
	add hl, bc
	ld c, [hl]
	ret

Function2c722: ; 2c722 (b:4722)
	ld c, DECO_POLKADOT_BED ; GREAT_BALL
	ret
; 2c725 (b:4725)

Unknown_2c725: ; 2c725
; May or may not be items.
	db BERRY
	db PRZCUREBERRY
	db MINT_BERRY
	db ICE_BERRY
	db BURNT_BERRY
	db PSNCUREBERRY
	db GUARD_SPEC
	db X_DEFEND
	db X_ATTACK
	db BITTER_BERRY
	db DIRE_HIT
	db X_SPECIAL
	db X_ACCURACY
	db EON_MAIL
	db MORPH_MAIL
	db MUSIC_MAIL
	db MIRACLEBERRY
	db GOLD_BERRY
	db REVIVE
	db GREAT_BALL
	db SUPER_REPEL
	db MAX_REPEL
	db ELIXER
	db ETHER
	db WATER_STONE
	db FIRE_STONE
	db LEAF_STONE
	db THUNDERSTONE
	db MAX_ETHER
	db MAX_ELIXER
	db MAX_REVIVE
	db SCOPE_LENS
	db HP_UP
	db PP_UP
	db RARE_CANDY
	db BLUESKY_MAIL
	db MIRAGE_MAIL
; 2c74a

Unknown_2c74a: ; 2c74a
; May or may not be items.
	db DECO_SNES
	db DECO_BIG_SNORLAX_DOLL
	db DECO_BIG_ONIX_DOLL
	db DECO_BIG_LAPRAS_DOLL
	db DECO_1D
	db DECO_PIKACHU_DOLL
	db DECO_SURF_PIKACHU_DOLL
	db DECO_CLEFAIRY_DOLL
	db DECO_JIGGLYPUFF_DOLL
	db DECO_BULBASAUR_DOLL
	db DECO_TROPICPLANT
	db DECO_JUMBOPLANT
	db DECO_TOWN_MAP
	db DECO_CHARMANDER_DOLL
	db DECO_POLIWAG_DOLL
	db DECO_DIGLETT_DOLL
	db DECO_BLUE_CARPET
	db DECO_YELLOW_CARPET
	db DECO_0F
	db DECO_PIKACHU_POSTER
	db DECO_N64
	db DECO_19
	db DECO_01
	db DECO_FEATHERY_BED
	db DECO_POLKADOT_BED
	db DECO_PIKACHU_BED
	db DECO_06
	db DECO_RED_CARPET
	db DECO_GREEN_CARPET
	db DECO_CLEFAIRY_POSTER
	db DECO_ODDISH_DOLL
	db DECO_MAGNAPLANT
	db DECO_GENGAR_DOLL
	db DECO_14
	db DECO_PINK_BED
	db DECO_SQUIRTLE_DOLL
	db DECO_STARMIE_DOLL
; 2c76f

Function2c76f: ; 2c76f (b:476f)
	ld a, $1
	ld [hInMenu], a
	call Function2c8d3
	ld a, $0
	ld [hInMenu], a
	ret nc
	call Function1bee
	call WaitBGMap
	ld a, [CurItem]
	dec a
	ld [wd107], a
	ld hl, TMsHMs
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [wItemQuantityBuffer], a
	call Function2c798
	scf
	ret

Function2c798: ; 2c798 (b:4798)
	ld a, [CurItem]
	ld c, a
	callab GetNumberedTMHM
	ld a, c
	ld [CurItem], a
	ret

ConvertCurItemIntoCurTMHM: ; 2c7a7 (b:47a7)
	ld a, [CurItem]
	ld c, a
	callab GetTMHMNumber
	ld a, c
	ld [wCurTMHM], a
	ret

GetTMHMItemMove: ; 2c7b6 (b:47b6)
	call ConvertCurItemIntoCurTMHM
	predef GetTMHMMove
	ret

Function2c7bf: ; 2c7bf (b:47bf)
	ld hl, Options
	ld a, [hl]
	push af
	res 4, [hl]
	ld a, [CurItem]
	cp TM01
	jr c, .NotTMHM
	call GetTMHMItemMove
	ld a, [wCurTMHM]
	ld [wd262], a
	call GetMoveName
	call CopyName1
	ld hl, UnknownText_0x2c8bf ; Booted up a TM
	ld a, [CurItem]
	cp HM01
	jr c, .TM
	ld hl, UnknownText_0x2c8c4 ; Booted up an HM
.TM
	call PrintText
	ld hl, UnknownText_0x2c8c9
	call PrintText
	call YesNoBox
.NotTMHM
	pop bc
	ld a, b
	ld [Options], a
	ret


Function2c7fb: ; 2c7fb
	ld hl, StringBuffer2
	ld de, wd066
	ld bc, $c
	call CopyBytes
	call ClearBGPalettes

Function2c80a: ; 2c80a
	callba Function5004f
	callba Function50405
	callba Function503e0
	ld a, $3
	ld [PartyMenuActionText], a
.loopback
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	callba PartyMenuSelect
	push af
	ld a, [CurPartySpecies]
	cp EGG
	pop bc ; now contains the former contents of af
	jr z, .egg
	push bc
	ld hl, wd066
	ld de, StringBuffer2
	ld bc, $c
	call CopyBytes
	pop af ; now contains the original contents of af
	ret

.egg
	push hl
	push de
	push bc
	push af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	pop af
	pop bc
	pop de
	pop hl
	jr .loopback
; 2c867

Function2c867: ; 2c867
	predef CanLearnTMHMMove

	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .compatible
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld hl, UnknownText_0x2c8ce
	call PrintText
	jr .nope

.compatible
	callab KnowsMove
	jr c, .nope

	predef LearnMove
	ld a, b
	and a
	jr z, .nope

	callba MobileFn_106049
	ld a, [CurItem]
	call IsHM
	ret c

	ld c, HAPPINESS_LEARNMOVE
	callab ChangeHappiness
	call Function2cb0c
	jr .asm_2c8bd

.nope
	and a
	ret

.asm_2c8b8
	ld a, $2
	ld [wd0ec], a

.asm_2c8bd
	scf
	ret
; 2c8bf (b:48bf)

UnknownText_0x2c8bf: ; 0x2c8bf
	; Booted up a TM.
	text_jump UnknownText_0x1c0373
	db "@"
; 0x2c8c4

UnknownText_0x2c8c4: ; 0x2c8c4
	; Booted up an HM.
	text_jump UnknownText_0x1c0384
	db "@"
; 0x2c8c9

UnknownText_0x2c8c9: ; 0x2c8c9
	; It contained @ . Teach @ to a #MON?
	text_jump UnknownText_0x1c0396
	db "@"
; 0x2c8ce

UnknownText_0x2c8ce: ; 0x2c8ce
	; is not compatible with @ . It can't learn @ .
	text_jump UnknownText_0x1c03c2
	db "@"
; 0x2c8d3

Function2c8d3: ; 2c8d3 (b:48d3)
	xor a
	ld [hBGMapMode], a
	call Function2c9e2
	ld a, $2
	ld [wcfa1], a
	ld a, $7
	ld [wcfa2], a
	ld a, $1
	ld [wcfa4], a
	ld a, $5
	sub d
	inc a
	cp $6
	jr nz, .asm_2c8f1
	dec a
.asm_2c8f1
	ld [wcfa3], a
	ld a, $c
	ld [wcfa5], a
	xor a
	ld [wcfa6], a
	ld a, $20
	ld [wcfa7], a
	ld a, $f3
	ld [wcfa8], a
	ld a, [wTMHMPocketCursor]
	inc a
	ld [MenuSelection2], a
	ld a, $1
	ld [wcfaa], a
	jr Function2c946

Function2c915: ; 2c915 (b:4915)
	call Function2c9e2
	call Function1bc9
	ld b, a
	ld a, [MenuSelection2]
	dec a
	ld [wTMHMPocketCursor], a
	xor a
	ld [hBGMapMode], a
	ld a, [wcfa6]
	bit 7, a
	jp nz, Function2c9b1
	ld a, b
	ld [wcf73], a
	bit 0, a
	jp nz, Function2c974
	bit 1, a
	jp nz, Function2c9a5
	bit 4, a
	jp nz, Function2c9af
	bit 5, a
	jp nz, Function2c9af

Function2c946: ; 2c946 (b:4946)
	call Function2c98a
	jp nc, Function2c9af
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	ld a, [CurItem]
	cp $3a
	jr nc, Function2c915
	ld [wd265], a
	predef GetTMHMMove
	ld a, [wd265]
	ld [CurSpecies], a
	hlcoord 1, 14
	call PrintMoveDesc
	jp Function2c915

Function2c974: ; 2c974 (b:4974)
	call Function2cad6
	call Function2cb2a
	ld a, [MenuSelection2]
	dec a
	ld b, a
	ld a, [wd0e2]
	add b
	ld b, a
	ld a, [wd265]
	cp b
	jr z, asm_2c9a8

Function2c98a: ; 2c98a (b:498a)
	call Function2cab5
	ld a, [MenuSelection2]
	ld b, a
.asm_2c991
	inc c
	ld a, c
	cp $3a
	jr nc, .asm_2c99f
	ld a, [hli]
	and a
	jr z, .asm_2c991
	dec b
	jr nz, .asm_2c991
	ld a, c
.asm_2c99f
	ld [CurItem], a
	cp $ff
	ret

Function2c9a5: ; 2c9a5 (b:49a5)
	call Function2cad6

asm_2c9a8: ; 2c9a8 (b:49a8)
	ld a, $2
	ld [wcf73], a
	and a
	ret

Function2c9af: ; 2c9af (b:49af)
	and a
	ret

Function2c9b1: ; 2c9b1 (b:49b1)
	ld a, b
	bit 7, a
	jr nz, .skip
	ld hl, wd0e2
	ld a, [hl]
	and a
	jp z, Function2c915
	dec [hl]
	call Function2c9e2
	jp Function2c946

.skip
	call Function2cab5
	ld b, $5
.loop
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jp nc, Function2c915
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	ld hl, wd0e2
	inc [hl]
	call Function2c9e2
	jp Function2c946

Function2c9e2: ; 2c9e2 (b:49e2)
	ld a, [BattleType]
	cp BATTLETYPE_TUTORIAL
	jp z, Function2caca

	hlcoord 5, 2
	lb bc, 10, 15
	ld a, " "
	call ClearBox
	call Function2cab5
	ld d, $5
.loop2
	inc c
	ld a, c
	cp NUM_TMS + NUM_HMS + 1
	jr nc, .NotTMHM
	ld a, [hli]
	and a
	jr z, .loop2
	ld b, a
	ld a, c
	ld [wd265], a
	push hl
	push de
	push bc
	call Function2ca86
	push hl
	ld a, [wd265]
	cp NUM_TMS + 1
	jr nc, .HM
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	jr .okay

.HM
	push af
	sub NUM_TMS
	ld [wd265], a
	ld [hl], "H"
	inc hl
	ld de, wd265
	lb bc, PRINTNUM_RIGHTALIGN | 1, 2
	call PrintNum
	pop af
	ld [wd265], a
.okay
	predef GetTMHMMove
	ld a, [wd265]
	ld [wd262], a
	call GetMoveName
	pop hl
	ld bc, $3
	add hl, bc
	push hl
	call PlaceString
	pop hl
	pop bc
	ld a, c
	push bc
	cp NUM_TMS + 1
	jr nc, .hm2
	ld bc, $1d
	add hl, bc
	ld [hl], $f1
	inc hl
	ld a, "0" ; why are we doing this?
	pop bc
	push bc
	ld a, b
	ld [wd265], a
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
.hm2
	pop bc
	pop de
	pop hl
	dec d
	jr nz, .loop2
	jr .done

.NotTMHM
	call Function2ca86
rept 3
	inc hl
endr
	push de
	ld de, String_2caae
	call PlaceString
	pop de
.done
	ret

Function2ca86: ; 2ca86 (b:4a86)
	hlcoord 5, 0
	ld bc, $28
	ld a, 6
	sub d
	ld e, a
.loop
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 2ca95 (b:4a95)

Function2ca95: ; 2ca95
	pop hl
	ld bc, 3
	add hl, bc
	predef GetTMHMMove
	ld a, [wd265]
	ld [wd262], a
	call GetMoveName
	push hl
	call PlaceString
	pop hl
	ret
; 2caae

String_2caae: ; 2caae
	db "CANCEL@"
; 2cab5

Function2cab5: ; 2cab5 (b:4ab5)
	ld hl, TMsHMs
	ld a, [wd0e2]
	ld b, a
	inc b
	ld c, 0
.loop
	inc c
	ld a, [hli]
	and a
	jr z, .loop
	dec b
	jr nz, .loop
	dec hl
	dec c
	ret

Function2caca: ; 2caca (b:4aca)
	hlcoord 9, 3
	push de
	ld de, String_2caae
	call PlaceString
	pop de
	ret

Function2cad6: ; 2cad6 (b:4ad6)
	push de
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	pop de
	ret
; 2cadf (b:4adf)

Function2cadf: ; 2cadf
	call ConvertCurItemIntoCurTMHM
	call Function2cafa
	ld hl, UnknownText_0x2caf0
	jr nc, .asm_2caed
	ld hl, UnknownText_0x2caf5

.asm_2caed
	jp PrintText
; 2caf0

UnknownText_0x2caf0: ; 0x2caf0
	; You have no room for any more @ S.
	text_jump UnknownText_0x1c03fa
	db "@"
; 0x2caf5

UnknownText_0x2caf5: ; 0x2caf5
	; You received @ !
	text_jump UnknownText_0x1c0421
	db "@"
; 0x2cafa

Function2cafa: ; 2cafa
	ld a, [wd265]
	dec a
	ld hl, TMsHMs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	inc a
	cp NUM_TMS * 2
	ret nc
	ld [hl], a
	ret
; 2cb0c

Function2cb0c: ; 2cb0c (b:4b0c)
	call ConvertCurItemIntoCurTMHM
	ld a, [wd265]
	dec a
	ld hl, TMsHMs
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	and a
	ret z
	dec a
	ld [hl], a
	ret nz
	ld a, [wd0e2]
	and a
	ret z
	dec a
	ld [wd0e2], a
	ret

Function2cb2a: ; 2cb2a (b:4b2a)
	ld b, $0
	ld c, $39
	ld hl, TMsHMs
.asm_2cb31
	ld a, [hli]
	and a
	jr z, .asm_2cb36
	inc b
.asm_2cb36
	dec c
	jr nz, .asm_2cb31
	ld a, b
	ld [wd265], a
	ret


PrintMoveDesc: ; 2cb3e
	push hl
	ld hl, MoveDescriptions
	ld a, [CurSpecies]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString
; 2cb52

MoveDescriptions:: ; 2cb52
INCLUDE "battle/moves/move_descriptions.asm"
; 2ed44


Function2ed44: ; 2ed44
	call ConvertBerriesToBerryJuice
	ld hl, PartyMon1PokerusStatus
	ld a, [PartyCount]
	ld b, a
	ld de, PARTYMON_STRUCT_LENGTH
.loopMons
	ld a, [hl]
	and $f
	jr nz, .monHasActivePokerus
	add hl, de
	dec b
	jr nz, .loopMons
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	ld a, [hRandomAdd]
	and a
	ret nz
	ld a, [hRandomSub]
	cp $3
	ret nc                 ; 3/65536 chance (00 00, 00 01 or 00 02)
	ld a, [PartyCount]
	ld b, a
.randomMonSelectLoop
	call Random
	and $7
	cp b
	jr nc, .randomMonSelectLoop
	ld hl, PartyMon1PokerusStatus
	call GetPartyLocation  ; get pokerus byte of random mon
	ld a, [hl]
	and $f0
	ret nz                 ; if it already has pokerus, do nothing
.randomPokerusLoop
	call Random
	and a
	jr z, .randomPokerusLoop
	ld b, a
	and $f0
	jr z, .asm_2ed91
	ld a, b
	and $7
	inc a

.asm_2ed91
	ld b, a
	swap b
	and $3
	inc a
	add b
	ld [hl], a
	ret

.monHasActivePokerus
	call Random
	cp $55
	ret nc              ; 1/3 chance
	ld a, [PartyCount]
	cp $1
	ret z               ; only one mon, nothing to do
	ld c, [hl]
	ld a, b
	cp $2
	jr c, .checkPreviousMonsLoop    ; no more mons after this one, go backwards
	call Random
	cp $80
	jr c, .checkPreviousMonsLoop    ; 1/2 chance, go backwards
.checkFollowingMonsLoop
	add hl, de
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	dec b               ; go on to next mon
	ld a, b
	cp $1
	jr nz, .checkFollowingMonsLoop ; no more mons left
	ret

.checkPreviousMonsLoop
	ld a, [PartyCount]
	cp b
	ret z               ; no more mons
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	ld a, [hl]
	and a
	jr z, .infectMon
	ld c, a
	and $3
	ret z               ; if mon has cured pokerus, stop searching
	inc b               ; go on to next mon
	jr .checkPreviousMonsLoop

.infectMon
	ld a, c
	and $f0
	ld b, a
	ld a, c
	swap a
	and $3
	inc a
	add b
	ld [hl], a
	ret
; 2ede6

; any berry held by a Shuckle may be converted to berry juice
ConvertBerriesToBerryJuice: ; 2ede6
	ld hl, StatusFlags2
	bit 6, [hl]
	ret z
	call Random
	cp $10
	ret nc              ; 1/16 chance
	ld hl, PartyMons
	ld a, [PartyCount]
.partyMonLoop
	push af
	push hl
	ld a, [hl]
	cp SHUCKLE
	jr nz, .loopMon
	ld bc, MON_ITEM
	add hl, bc
	ld a, [hl]
	cp BERRY
	jr z, .convertToJuice

.loopMon
	pop hl
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop af
	dec a
	jr nz, .partyMonLoop
	ret

.convertToJuice
	ld a, BERRY_JUICE
	ld [hl], a
	pop hl
	pop af
	ret
; 2ee18

ShowLinkBattleParticipants: ; 2ee18
; If we're not in a communications room,
; we don't need to be here.
	ld a, [wLinkMode]
	and a
	ret z

	callba _ShowLinkBattleParticipants
	ld c, 150
	call DelayFrames
	call ClearTileMap
	call ClearSprites
	ret
; 2ee2f


FindFirstAliveMon: ; 2ee2f
	xor a
	ld [hMapAnims], a
	call DelayFrame
	ld b, 6
	ld hl, PartyMon1HP
	ld de, PARTYMON_STRUCT_LENGTH - 1

.loop
	ld a, [hli]
	or [hl]
	jr nz, .okay
	add hl, de
	dec b
	jr nz, .loop

.okay
	ld de, MON_LEVEL - MON_HP
	add hl, de
	ld a, [hl]
	ld [BattleMonLevel], a
	predef Predef_StartBattle
	callba _LoadBattleFontsHPBar
	ld a, 1
	ld [hBGMapMode], a
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hWY], a
	ld [rWY], a
	ld [hMapAnims], a
	ret
; 2ee6c


PlayBattleMusic: ; 2ee6c

	push hl
	push de
	push bc

	xor a
	ld [MusicFade], a
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	call MaxVolume

	ld a, [BattleType]
	cp BATTLETYPE_SUICUNE
	ld de, MUSIC_SUICUNE_BATTLE
	jp z, .done
	cp BATTLETYPE_ROAMING
	jp z, .done

	; Are we fighting a trainer?
	ld a, [OtherTrainerClass]
	and a
	jr nz, .trainermusic

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantowild

	ld de, MUSIC_JOHTO_WILD_BATTLE
	ld a, [TimeOfDay]
	cp NITE
	jr nz, .done
	ld de, MUSIC_JOHTO_WILD_BATTLE_NIGHT
	jr .done

.kantowild
	ld de, MUSIC_KANTO_WILD_BATTLE
	jr .done

.trainermusic
	ld de, MUSIC_CHAMPION_BATTLE
	cp CHAMPION
	jr z, .done
	cp RED
	jr z, .done

	; really, they should have included admins and scientists here too...
	ld de, MUSIC_ROCKET_BATTLE
	cp GRUNTM
	jr z, .done
	cp GRUNTF
	jr z, .done

	ld de, MUSIC_KANTO_GYM_LEADER_BATTLE
	callba IsKantoGymLeader
	jr c, .done

	ld de, MUSIC_JOHTO_GYM_LEADER_BATTLE
	callba IsJohtoGymLeader
	jr c, .done

	ld de, MUSIC_RIVAL_BATTLE
	ld a, [OtherTrainerClass]
	cp RIVAL1
	jr z, .done
	cp RIVAL2
	jr nz, .othertrainer

	ld a, [OtherTrainerID]
	cp 4 ; Rival in Indigo Plateau
	jr c, .done
	ld de, MUSIC_CHAMPION_BATTLE
	jr .done

.othertrainer
	ld a, [wLinkMode]
	and a
	jr nz, .johtotrainer

	callba RegionCheck
	ld a, e
	and a
	jr nz, .kantotrainer

.johtotrainer
	ld de, MUSIC_JOHTO_TRAINER_BATTLE
	jr .done

.kantotrainer
	ld de, MUSIC_KANTO_TRAINER_BATTLE

.done
	call PlayMusic

	pop bc
	pop de
	pop hl
	ret
; 2ef18


ClearBattleRAM: ; 2ef18
	xor a
	ld [wd0ec], a
	ld [wBattleResult], a

	ld hl, wd0d8
rept 3
	ld [hli], a
endr
	ld [hl], a

	ld [wd0e4], a
	ld [CriticalHit], a
	ld [BattleMonSpecies], a
	ld [wBattleParticipantsNotFainted], a
	ld [CurBattleMon], a
	ld [wForcedSwitch], a
	ld [TimeOfDayPal], a
	ld [PlayerTurnsTaken], a
	ld [EnemyTurnsTaken], a
	ld [EvolvableFlags], a

	ld hl, PlayerHPPal
	ld [hli], a
	ld [hl], a

	ld hl, BattleMonDVs
	ld [hli], a
	ld [hl], a

	ld hl, EnemyMonDVs
	ld [hli], a
	ld [hl], a

; Clear the entire BattleMons area
	ld hl, wBattle
	ld bc, wBattleEnd - wBattle
	xor a
	call ByteFill

	callab ResetEnemyStatLevels

	call ResetTextRelatedRAM

	ld hl, hBGMapAddress
	xor a
	ld [hli], a
	ld [hl], $98
	ret
; 2ef6e


FillBox: ; 2ef6e
; Fill wc2c6-aligned box width b height c
; with iterating tile starting from hFillBox at hl.
; Predef $13

	ld de, 20

	ld a, [wc2c6]
	and a
	jr nz, .left

	ld a, [hFillBox]
.x1
	push bc
	push hl

.y1
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y1

	pop hl
	inc hl
	pop bc
	dec b
	jr nz, .x1
	ret

.left
; Right-aligned.
	push bc
	ld b, 0
	dec c
	add hl, bc
	pop bc

	ld a, [hFillBox]
.x2
	push bc
	push hl

.y2
	ld [hl], a
	add hl, de
	inc a
	dec c
	jr nz, .y2

	pop hl
	dec hl
	pop bc
	dec b
	jr nz, .x2
	ret
; 2ef9f


SECTION "Tileset Data 4", ROMX, BANK[TILESETS_4]

INCLUDE "tilesets/data_4.asm"


SECTION "bankD", ROMX, BANK[$D]

INCLUDE "battle/effect_commands.asm"


SECTION "bankE", ROMX, BANK[$E]

INCLUDE "battle/ai/items.asm"

AIScoring: ; 38591
INCLUDE "battle/ai/scoring.asm"


GetTrainerClassName: ; 3952d
	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .rival

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	ret

.rival
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret
; 39550

Function39550: ; 39550
	ld hl, wd26b
	ld a, [wLinkMode]
	and a
	jr nz, .ok

	ld hl, RivalName
	ld a, c
	cp RIVAL1
	jr z, .ok

	ld [CurSpecies], a
	ld a, TRAINER_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld hl, StringBuffer1

.ok
	ld bc, TRAINER_CLASS_NAME_LENGTH
	ld de, OTName
	push de
	call CopyBytes
	pop de
	ret
; 3957b

Function3957b: ; 3957b
	ld a, [TrainerClass]
	ld c, a
	call Function39550
	ld a, [TrainerClass]
	dec a
	ld hl, TrainerClassAttributes
	ld bc, NUM_TRAINER_ATTRIBUTES
	call AddNTimes
	ld de, wEnemyTrainerItem1
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hl]
	ld [wc652], a
	ret
; 3959c

INCLUDE "trainers/attributes.asm"


ReadTrainerParty: ; 39771
	ld a, [InBattleTowerBattle]
	bit 0, a
	ret nz

	ld a, [wLinkMode]
	and a
	ret nz

	ld hl, OTPartyCount
	xor a
	ld [hli], a
	dec a
	ld [hl], a

	ld hl, OTPartyMons
	ld bc, OTPartyMonsEnd - OTPartyMons
	xor a
	call ByteFill

	ld a, [OtherTrainerClass]
	cp CAL
	jr nz, .not_cal2
	ld a, [OtherTrainerID]
	cp CAL2
	jr z, .cal2
	ld a, [OtherTrainerClass]
.not_cal2

	dec a
	ld c, a
	ld b, 0
	ld hl, TrainerGroups
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [OtherTrainerID]
	ld b, a
.skip_trainer
	dec b
	jr z, .got_trainer
.loop
	ld a, [hli]
	cp $ff
	jr nz, .loop
	jr .skip_trainer
.got_trainer

.skip_name
	ld a, [hli]
	cp "@"
	jr nz, .skip_name

	ld a, [hli]
	ld c, a
	ld b, 0
	ld d, h
	ld e, l
	ld hl, TrainerTypes
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, .done
	push bc
	jp [hl]

.done
	jp Function3991b

.cal2
	ld a, BANK(sMysteryGiftTrainer)
	call GetSRAMBank
	ld de, sMysteryGiftTrainer
	call TrainerType2
	call CloseSRAM
	jr .done
; 397e3

TrainerTypes: ; 397e3
	dw TrainerType1 ; level, species
	dw TrainerType2 ; level, species, moves
	dw TrainerType3 ; level, species, item
	dw TrainerType4 ; level, species, item, moves
; 397eb

TrainerType1: ; 397eb
; normal (level, species)
	ld h, d
	ld l, e
.loop
	ld a, [hli]
	cp $ff
	ret z

	ld [CurPartyLevel], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld a, OTPARTYMON
	ld [MonType], a
	push hl
	predef TryAddMonToParty
	pop hl
	jr .loop
; 39806

TrainerType2: ; 39806
; moves
	ld h, d
	ld l, e
.loop
	ld a, [hli]
	cp $ff
	ret z

	ld [CurPartyLevel], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld a, OTPARTYMON
	ld [MonType], a

	push hl
	predef TryAddMonToParty
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de
	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
	jr .loop
; 39871

TrainerType3: ; 39871
; item
	ld h, d
	ld l, e
.loop
	ld a, [hli]
	cp $ff
	ret z

	ld [CurPartyLevel], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld a, OTPARTYMON
	ld [MonType], a
	push hl
	predef TryAddMonToParty
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	ld a, [hli]
	ld [de], a
	jr .loop
; 3989d (e:589d)

TrainerType4: ; 3989d
; item + moves
	ld h, d
	ld l, e
.loop
	ld a, [hli]
	cp $ff
	ret z

	ld [CurPartyLevel], a
	ld a, [hli]
	ld [CurPartySpecies], a

	ld a, OTPARTYMON
	ld [MonType], a

	push hl
	predef TryAddMonToParty
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld a, [hli]
	ld [de], a

	push hl
	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl

	ld b, NUM_MOVES
.copy_moves
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy_moves

	push hl

	ld a, [OTPartyCount]
	dec a
	ld hl, OTPartyMon1
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, MON_PP
	add hl, de

	push hl
	ld hl, MON_MOVES
	add hl, de
	pop de

	ld b, NUM_MOVES
.copy_pp
	ld a, [hli]
	and a
	jr z, .copied_pp

	push hl
	push bc
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop bc
	pop hl

	ld [de], a
	inc de
	dec b
	jr nz, .copy_pp
.copied_pp

	pop hl
	jr .loop
; 3991b

Function3991b: ; 3991b (e:591b)
	ld hl, hMultiplicand - 1
	xor a
rept 3
	ld [hli], a
endr
	ld a, [wc652] ; base reward
	ld [hli], a
	ld a, [CurPartyLevel]
	ld [hl], a
	call Multiply
	ld hl, wc686
	xor a
	ld [hli], a
	ld a, [hProduct + 2]
	ld [hli], a
	ld a, [hProduct + 3]
	ld [hl], a
	ret


Battle_GetTrainerName:: ; 39939
	ld a, [InBattleTowerBattle]
	bit 0, a
	ld hl, wd26b
	jp nz, CopyTrainerName

	ld a, [OtherTrainerID]
	ld b, a
	ld a, [OtherTrainerClass]
	ld c, a

GetTrainerName:: ; 3994c
	ld a, c
	cp CAL
	jr nz, .not_cal2

	ld a, BANK(sMysteryGiftTrainerHouseFlag)
	call GetSRAMBank
	ld a, [sMysteryGiftTrainerHouseFlag]
	and a
	call CloseSRAM
	jr z, .not_cal2

	ld a, BANK(s0_abfe)
	call GetSRAMBank
	ld hl, s0_abfe
	call CopyTrainerName
	jp CloseSRAM

.not_cal2
	dec c
	push bc
	ld b, 0
	ld hl, TrainerGroups
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop bc

.loop
	dec b
	jr z, CopyTrainerName

.skip
	ld a, [hli]
	cp $ff
	jr nz, .skip
	jr .loop

CopyTrainerName: ; 39984
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	call CopyBytes
	pop de
	ret
; 39990

Function39990: ; 39990
; This function is useless.
	ld de, StringBuffer1
	push de
	ld bc, NAME_LENGTH
	pop de
	ret
; 39999

INCLUDE "trainers/trainer_pointers.asm"

INCLUDE "trainers/trainers.asm"


SECTION "bankF", ROMX, BANK[$F]

INCLUDE "battle/core.asm"

INCLUDE "battle/effect_command_pointers.asm"


SECTION "bank10", ROMX, BANK[$10]


INCLUDE "engine/pokedex.asm"


Function41a7f: ; 41a7f
	xor a
	ld [hBGMapMode], a
	callba Function1de247
	call Function41af7
	call DisableLCD
	call LoadStandardFont
	call LoadFontsExtra
	call Function414b7
	call Function4147b
	ld a, [wd265]
	ld [CurPartySpecies], a
	call Function407fd
	call Function40ba0
	hlcoord 0, 17
	ld [hl], $3b
	inc hl
	ld bc, $13
	ld a, " "
	call ByteFill
	callba Function4424d
	call EnableLCD
	call WaitBGMap
	call GetBaseData
	ld de, VTiles2
	predef GetFrontpic
	ld a, $4
	call Function41423
	ld a, [CurPartySpecies]
	call PlayCry
	ret
; 41ad7


Function41ad7: ; 41ad7 (10:5ad7)
	ld a, $3
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret

Function41ae1: ; 41ae1 (10:5ae1)
	ld a, $4
	ld [hBGMapMode], a
	ld c, 4
	call DelayFrames
	ret

Function41aeb: ; 41aeb (10:5aeb)
	ld a, [hCGB]
	and a
	jr z, .asm_41af3
	call Function41ae1
.asm_41af3
	call Function41ad7
	ret


Function41af7: ; 41af7
	xor a
	ld [hBGMapMode], a
	ret
; 41afb


INCLUDE "battle/moves/moves.asm"


Function421d8: ; 421d8
	ld hl, EvolvableFlags
	xor a
	ld [hl], a
	ld a, [CurPartyMon]
	ld c, a
	ld b, $1
	call Function42577

Function421e6: ; 421e6
	xor a
	ld [wd268], a
	dec a
	ld [CurPartyMon], a
	push hl
	push bc
	push de
	ld hl, PartyCount

	push hl

Function421f5: ; 421f5
	ld hl, CurPartyMon
	inc [hl]

	pop hl

	inc hl
	ld a, [hl]
	cp $ff
	jp z, Function423ff

	ld [Buffer1], a

	push hl
	ld a, [CurPartyMon]
	ld c, a
	ld hl, EvolvableFlags
	ld b, 2
	call Function42577
	ld a, c
	and a
	jp z, Function421f5

	ld a, [Buffer1]
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push hl
	xor a
	ld [MonType], a
	predef CopyPkmnToTempMon
	pop hl

.asm_42230
	ld a, [hli]
	and a
	jr z, Function421f5

	ld b, a

	cp EVOLVE_TRADE
	jr z, .trade

	ld a, [wLinkMode]
	and a
	jp nz, .asm_423f9

	ld a, b
	cp EVOLVE_ITEM
	jp z, .item

	ld a, [wd1e9]
	and a
	jp nz, .asm_423f9

	ld a, b
	cp EVOLVE_LEVEL
	jp z, .level

	cp EVOLVE_HAPPINESS
	jr z, .happiness


; EVOLVE_STAT
	ld a, [TempMonLevel]
	cp [hl]
	jp c, .asm_423f8

	call Function42461
	jp z, .asm_423f8

	push hl
	ld de, TempMonAttack
	ld hl, TempMonDefense
	ld c, 2
	call StringCmp
	ld a, ATK_EQ_DEF
	jr z, .asm_4227a
	ld a, ATK_LT_DEF
	jr c, .asm_4227a
	ld a, ATK_GT_DEF
.asm_4227a
	pop hl

	inc hl
	cp [hl]
	jp nz, .asm_423f9

	inc hl
	jr .asm_422fd


.happiness
	ld a, [TempMonHappiness]
	cp 220
	jp c, .asm_423f9

	call Function42461
	jp z, .asm_423f9

	ld a, [hli]
	cp TR_ANYTIME
	jr z, .asm_422fd
	cp TR_MORNDAY
	jr z, .asm_422a4

; TR_NITE
	ld a, [TimeOfDay]
	cp NITE
	jp nz, .asm_423fa
	jr .asm_422fd

.asm_422a4
	ld a, [TimeOfDay]
	cp NITE
	jp z, .asm_423fa
	jr .asm_422fd


.trade
	ld a, [wLinkMode]
	and a
	jp z, .asm_423f9

	call Function42461
	jp z, .asm_423f9

	ld a, [hli]
	ld b, a
	inc a
	jr z, .asm_422fd

	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jp z, .asm_423fa

	ld a, [TempMonItem]
	cp b
	jp nz, .asm_423fa

	xor a
	ld [TempMonItem], a
	jr .asm_422fd


.item
	ld a, [hli]
	ld b, a
	ld a, [CurItem]
	cp b
	jp nz, .asm_423fa

	ld a, [wd1e9]
	and a
	jp z, .asm_423fa
	ld a, [wLinkMode]
	and a
	jp nz, .asm_423fa
	jr .asm_422fd


.level
	ld a, [hli]
	ld b, a
	ld a, [TempMonLevel]
	cp b
	jp c, .asm_423fa
	call Function42461
	jp z, .asm_423fa

.asm_422fd
	ld a, [TempMonLevel]
	ld [CurPartyLevel], a
	ld a, $1
	ld [wd268], a

	push hl

	ld a, [hl]
	ld [Buffer2], a
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	call CopyName1
	ld hl, UnknownText_0x42482
	call PrintText

	ld c, 50
	call DelayFrames

	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	lb bc, 12, 20
	call ClearBox

	ld a, $1
	ld [hBGMapMode], a
	call ClearSprites

	callba EvolutionAnimation

	push af
	call ClearSprites
	pop af
	jp c, Function42454

	ld hl, UnknownText_0x42473
	call PrintText

	pop hl

	ld a, [hl]
	ld [CurSpecies], a
	ld [TempMonSpecies], a
	ld [Buffer2], a
	ld [wd265], a
	call GetPokemonName

	push hl
	ld hl, UnknownText_0x42478
	call PrintTextBoxText
	callba MobileFn_106094

	ld de, MUSIC_NONE
	call PlayMusic
	ld de, SFX_CAUGHT_MON
	call PlaySFX
	call WaitSFX

	ld c, 40
	call DelayFrames

	call ClearTileMap
	call Function42414
	call GetBaseData

	ld hl, TempMonExp + 2
	ld de, TempMonMaxHP
	ld b, $1
	predef CalcPkmnStats

	ld a, [CurPartyMon]
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld e, l
	ld d, h
	ld bc, MON_MAXHP
	add hl, bc
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, TempMonMaxHP + 1
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a
	ld hl, TempMonHP + 1
	ld a, [hl]
	add c
	ld [hld], a
	ld a, [hl]
	adc b
	ld [hl], a

	ld hl, TempMonSpecies
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

	ld a, [CurSpecies]
	ld [wd265], a
	xor a
	ld [MonType], a
	call LearnLevelMoves
	ld a, [wd265]
	dec a
	call SetSeenAndCaughtMon

	ld a, [wd265]
	cp UNOWN
	jr nz, .asm_423ec

	ld hl, TempMonDVs
	predef GetUnownLetter
	callab Functionfba18

.asm_423ec
	pop de
	pop hl
	ld a, [TempMonSpecies]
	ld [hl], a
	push hl
	ld l, e
	ld h, d
	jp Function421f5
; 423f8

.asm_423f8
	inc hl
.asm_423f9
	inc hl
.asm_423fa
	inc hl
	jp .asm_42230
; 423fe

Function423fe: ; 423fe
	pop hl

Function423ff: ; 423ff
	pop de
	pop bc
	pop hl
	ld a, [wLinkMode]
	and a
	ret nz
	ld a, [wBattleMode]
	and a
	ret nz
	ld a, [wd268]
	and a
	call nz, RestartMapMusic
	ret
; 42414

Function42414: ; 42414
	ld a, [CurSpecies]
	push af
	ld a, [BaseDexNo]
	ld [wd265], a
	call GetPokemonName
	pop af
	ld [CurSpecies], a
	ld hl, StringBuffer1
	ld de, StringBuffer2
.asm_4242b
	ld a, [de]
	inc de
	cp [hl]
	inc hl
	ret nz
	cp "@"
	jr nz, .asm_4242b
	ld a, [CurPartyMon]
	ld bc, PKMN_NAME_LENGTH
	ld hl, PartyMonNicknames
	call AddNTimes
	push hl
	ld a, [CurSpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	pop de
	ld bc, PKMN_NAME_LENGTH
	jp CopyBytes
; 42454

Function42454: ; 42454
	ld hl, UnknownText_0x4247d
	call PrintText
	call ClearTileMap
	pop hl
	jp Function421f5
; 42461

Function42461: ; 42461
	push hl
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	cp EVERSTONE
	pop hl
	ret
; 42473

UnknownText_0x42473: ; 0x42473
	; Congratulations! Your @ @
	text_jump UnknownText_0x1c4b92
	db "@"
; 0x42478

UnknownText_0x42478: ; 0x42478
	; evolved into @ !
	text_jump UnknownText_0x1c4baf
	db "@"
; 0x4247d

UnknownText_0x4247d: ; 0x4247d
	; Huh? @ stopped evolving!
	text_jump UnknownText_0x1c4bc5
	db "@"
; 0x42482

UnknownText_0x42482: ; 0x42482
	; What? @ is evolving!
	text_jump UnknownText_0x1c4be3
	db "@"
; 0x42487


LearnLevelMoves: ; 42487
	ld a, [wd265]
	ld [CurPartySpecies], a
	dec a
	ld b, 0
	ld c, a
	ld hl, EvosAttacksPointers
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

.skip_evos
	ld a, [hli]
	and a
	jr nz, .skip_evos

.find_move
	ld a, [hli]
	and a
	jr z, .done

	ld b, a
	ld a, [CurPartyLevel]
	cp b
	ld a, [hli]
	jr nz, .find_move

	push hl
	ld d, a
	ld hl, PartyMon1Moves
	ld a, [CurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes

	ld b, NUM_MOVES
.check_move
	ld a, [hli]
	cp d
	jr z, .has_move
	dec b
	jr nz, .check_move
	jr .learn
.has_move

	pop hl
	jr .find_move

.learn
	ld a, d
	ld [wd262], a
	ld [wd265], a
	call GetMoveName
	call CopyName1
	predef LearnMove
	pop hl
	jr .find_move

.done
	ld a, [CurPartySpecies]
	ld [wd265], a
	ret
; 424e1


FillMoves: ; 424e1
; Fill in moves at de for CurPartySpecies at CurPartyLevel

	push hl
	push de
	push bc
	ld hl, EvosAttacksPointers
	ld b, 0
	ld a, [CurPartySpecies]
	dec a
	add a
	rl b
	ld c, a
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
.GoToAttacks
	ld a, [hli]
	and a
	jr nz, .GoToAttacks
	jr .GetLevel

.NextMove
	pop de
.GetMove
	inc hl
.GetLevel
	ld a, [hli]
	and a
	jp z, .done
	ld b, a
	ld a, [CurPartyLevel]
	cp b
	jp c, .done
	ld a, [Buffer1]
	and a
	jr z, .CheckMove
	ld a, [wd002]
	cp b
	jr nc, .GetMove

.CheckMove
	push de
	ld c, NUM_MOVES
.CheckRepeat
	ld a, [de]
	inc de
	cp [hl]
	jr z, .NextMove
	dec c
	jr nz, .CheckRepeat
	pop de
	push de
	ld c, NUM_MOVES
.CheckSlot
	ld a, [de]
	and a
	jr z, .LearnMove
	inc de
	dec c
	jr nz, .CheckSlot
	pop de
	push de
	push hl
	ld h, d
	ld l, e
	call ShiftMoves
	ld a, [Buffer1]
	and a
	jr z, .ShiftedMove
	push de
	ld bc, PartyMon1PP - (PartyMon1Moves + NUM_MOVES - 1)
	add hl, bc
	ld d, h
	ld e, l
	call ShiftMoves
	pop de

.ShiftedMove
	pop hl

.LearnMove
	ld a, [hl]
	ld [de], a
	ld a, [Buffer1]
	and a
	jr z, .NextMove
	push hl
	ld a, [hl]
	ld hl, MON_PP - MON_MOVES
	add hl, de
	push hl
	dec a
	ld hl, Moves + MOVE_PP
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld a, BANK(Moves)
	call GetFarByte
	pop hl
	ld [hl], a
	pop hl
	jr .NextMove

.done
	pop bc
	pop de
	pop hl
	ret
; 4256e

ShiftMoves: ; 4256e
	ld c, NUM_MOVES - 1
.loop
	inc de
	ld a, [de]
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 42577


Function42577: ; 42577
	push de
	ld d, $0
	predef FlagPredef
	pop de
	ret
; 42581

GetPreEvolution: ; 42581
; Find the first mon to evolve into CurPartySpecies.

; Return carry and the new species in CurPartySpecies
; if a pre-evolution is found.

	ld c, 0
.loop ; For each Pokemon...
	ld hl, EvosAttacksPointers
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
.loop2 ; For each evolution...
	ld a, [hli]
	and a
	jr z, .no_evolve ; If we jump, this Pokemon does not evolve into CurPartySpecies.
	cp EVOLVE_STAT ; This evolution type has the extra parameter of stat comparison.
	jr nz, .not_tyrogue
	inc hl

.not_tyrogue
	inc hl
	ld a, [CurPartySpecies]
	cp [hl]
	jr z, .found_preevo
	inc hl
	ld a, [hl]
	and a
	jr nz, .loop2

.no_evolve
	inc c
	ld a, c
	cp NUM_POKEMON
	jr c, .loop
	and a
	ret

.found_preevo
	inc c
	ld a, c
	ld [CurPartySpecies], a
	scf
	ret
; 425b1



SECTION "bank11", ROMX, BANK[$11]

INCLUDE "engine/fruit_trees.asm"


AIChooseMove: ; 440ce
; Score each move in EnemyMonMoves starting from Buffer1. Lower is better.
; Pick the move with the lowest score.

; Wildmons attack at random.
	ld a, [wBattleMode]
	dec a
	ret z

	ld a, [wLinkMode]
	and a
	ret nz

; No use picking a move if there's no choice.
	callba CheckSubstatus_RechargeChargedRampageBideRollout
	ret nz


; The default score is 20. Unusable moves are given a score of 80.
	ld a, 20
	ld hl, Buffer1
rept 3
	ld [hli], a
endr
	ld [hl], a

; Don't pick disabled moves.
	ld a, [EnemyDisabledMove]
	and a
	jr z, .CheckPP

	ld hl, EnemyMonMoves
	ld c, 0
.CheckDisabledMove
	cp [hl]
	jr z, .ScoreDisabledMove
	inc c
	inc hl
	jr .CheckDisabledMove
.ScoreDisabledMove
	ld hl, Buffer1
	ld b, 0
	add hl, bc
	ld [hl], 80

; Don't pick moves with 0 PP.
.CheckPP
	ld hl, Buffer1 - 1
	ld de, EnemyMonPP
	ld b, 0
.CheckMovePP
	inc b
	ld a, b
	cp EnemyMonMovesEnd - EnemyMonMoves + 1
	jr z, .ApplyLayers
	inc hl
	ld a, [de]
	inc de
	and $3f
	jr nz, .CheckMovePP
	ld [hl], 80
	jr .CheckMovePP


; Apply AI scoring layers depending on the trainer class.
.ApplyLayers
	ld hl, TrainerClassAttributes + 3

	; If we have a battle in BattleTower just load the Attributes of the first TrainerClass (Falkner)
	; so we have always the same AI, regardless of the loaded class of trainer
	ld a, [InBattleTowerBattle]
	bit 0, a
	jr nz, .battle_tower_skip

	ld a, [TrainerClass]
	dec a
	ld bc, 7 ; Trainer2AI - Trainer1AI
	call AddNTimes

.battle_tower_skip
	lb bc, CHECK_FLAG, 0
	push bc
	push hl

.CheckLayer
	pop hl
	pop bc

	ld a, c
	cp 16 ; up to 16 scoring layers
	jr z, .DecrementScores

	push bc
	ld d, BANK(TrainerClassAttributes)
	predef FlagPredef
	ld d, c
	pop bc

	inc c
	push bc
	push hl

	ld a, d
	and a
	jr z, .CheckLayer

	ld hl, AIScoringPointers
	dec c
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, BANK(AIScoring)
	call FarCall_hl

	jr .CheckLayer

; Decrement the scores of all moves one by one until one reaches 0.
.DecrementScores
	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld c, EnemyMonMovesEnd - EnemyMonMoves

.DecrementNextScore
	; If the enemy has no moves, this will infinite.
	ld a, [de]
	inc de
	and a
	jr z, .DecrementScores

	; We are done whenever a score reaches 0
	dec [hl]
	jr z, .PickLowestScoreMoves

	; If we just decremented the fourth move's score, go back to the first move
	inc hl
	dec c
	jr z, .DecrementScores

	jr .DecrementNextScore

; In order to avoid bias towards the moves located first in memory, increment the scores
; that were decremented one more time than the rest (in case there was a tie).
; This means that the minimum score will be 1.
.PickLowestScoreMoves
	ld a, c

.move_loop
	inc [hl]
	dec hl
	inc a
	cp NUM_MOVES + 1
	jr nz, .move_loop

	ld hl, Buffer1
	ld de, EnemyMonMoves
	ld c, NUM_MOVES

; Give a score of 0 to a blank move	
.loop2
	ld a, [de]
	and a
	jr nz, .skip_load
	ld [hl], a

; Disregard the move if its score is not 1	
.skip_load
	ld a, [hl]
	dec a
	jr z, .keep
	xor a
	ld [hli], a
	jr .after_toss

.keep
	ld a, [de]
	ld [hli], a
.after_toss
	inc de
	dec c
	jr nz, .loop2

; Randomly choose one of the moves with a score of 1 	
.ChooseMove
	ld hl, Buffer1
	call Random
	and 3
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	and a
	jr z, .ChooseMove

	ld [CurEnemyMove], a
	ld a, c
	ld [CurEnemyMoveNum], a
	ret
; 441af


AIScoringPointers: ; 441af
	dw AI_Basic
	dw AI_Setup
	dw AI_Types
	dw AI_Offensive
	dw AI_Smart
	dw AI_Opportunist
	dw AI_Aggressive
	dw AI_Cautious
	dw AI_Status
	dw AI_Risky
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
	dw AI_None
; 441cf


Function441cf: ; 441cf
	ld hl, Unknown_441fc
	ld b, 25
.loop
	ld a, [hli]

	; Wrap around
	cp $fe
	jr nz, .ok
	ld hl, Unknown_441fc
	ld a, [hli]
.ok

	ld [wc7db], a
	ld a, [hli]
	ld c, a
	push bc
	push hl
	call Function44207
	pop hl
	pop bc
	call DelayFrames
	dec b
	jr nz, .loop
	xor a
	ld [wc7db], a
	call Function44207
	ld c, 32
	call DelayFrames
	ret
; 441fc

Unknown_441fc: ; 441fc
	db 0, 7
	db 1, 7
	db 2, 7
	db 3, 7
	db 4, 7
	db $fe
; 44207


Function44207: ; 44207
	ld a, [wc7db]
	ld hl, Unknown_44228
	ld de, Sprites
.asm_44210
	ld a, [hli]
	cp $ff
	ret z
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [wc7db]
	ld b, a
	add a
	add b
	add [hl]
	inc hl
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	jr .asm_44210
; 44228

Unknown_44228: ; 44228
	db $58, $48, $00, $00
	db $58, $50, $01, $00
	db $58, $58, $02, $00
	db $60, $48, $10, $00
	db $60, $50, $11, $00
	db $60, $58, $12, $00
	db $68, $48, $20, $00
	db $68, $50, $21, $00
	db $68, $58, $22, $00
	db $ff
; 4424d

Function4424d: ; 4424d
	call GetPokemonName
	hlcoord 9, 3
	call PlaceString
	ld a, [wd265]
	ld b, a
	call Function44333
	ld a, b
	push af
	hlcoord 9, 5
	call FarString
	ld h, b
	ld l, c
	push de
	hlcoord 2, 8
	ld a, $5c
	ld [hli], a
	ld a, $5d
	ld [hli], a
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	pop hl
	pop bc
	ret z
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	inc hl
	ld a, b
	push af
	push hl
	call GetFarHalfword
	ld d, l
	ld e, h
	pop hl
rept 2
	inc hl
endr
	ld a, d
	or e
	jr z, .asm_442b0
	push hl
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 12, 7
	lb bc, 2, 36
	call PrintNum
	hlcoord 14, 7
	ld [hl], "<ROCKET>"
	pop af
	pop hl

.asm_442b0
	pop af
	push af
	inc hl
	push hl
	dec hl
	call GetFarHalfword
	ld d, l
	ld e, h
	ld a, e
	or d
	jr z, .skip
	push de
	ld hl, [sp+$0]
	ld d, h
	ld e, l
	hlcoord 11, 9
	lb bc, 2, 69
	call PrintNum
	pop de

.skip
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, $13
	ld a, $61
	call ByteFill
	hlcoord 1, 9
	ld [hl], "<CONT>"
	inc hl
	ld [hl], "<CONT>"
	hlcoord 1, 10
	ld [hl], "<......>"
	inc hl
	ld [hl], "<DONE>"
	pop de
	inc de
	pop af
	hlcoord 2, 11
	push af
	call FarString
	pop bc
	ld a, [wPokedexStatus]
	or a
	ret z
	push bc
	push de
	lb bc, 5, SCREEN_WIDTH - 2
	hlcoord 2, 11
	call ClearBox
	hlcoord 1, 10
	ld bc, $13
	ld a, $61
	call ByteFill
	hlcoord 1, 9
	ld [hl], "<CONT>"
	inc hl
	ld [hl], "<CONT>"
	hlcoord 1, 10
	ld [hl], "<......>"
	inc hl
	ld [hl], "<PROMPT>"
	pop de
	inc de
	pop af
	hlcoord 2, 11
	call FarString
	ret
; 44331

String_44331: ; 44331
	db "#@"
; 44333

Function44333: ; 44333
	push hl
	ld hl, PokedexDataPointerTable
	ld a, b
	dec a
	ld d, 0
	ld e, a
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	push de
	rlca
	rlca
	and $3
	ld hl, PokedexEntryBanks
	ld d, 0
	ld e, a
	add hl, de
	ld b, [hl]
	pop de
	pop hl
	ret
; 44351

PokedexEntryBanks: ; 44351

GLOBAL PokedexEntries1
GLOBAL PokedexEntries2
GLOBAL PokedexEntries3
GLOBAL PokedexEntries4

	db BANK(PokedexEntries1)
	db BANK(PokedexEntries2)
	db BANK(PokedexEntries3)
	db BANK(PokedexEntries4)
; 44355

Function44355: ; 44355
	call Function44333
	push hl
	ld h, d
	ld l, e
.loop1
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop1
rept 4
	inc hl
endr
	dec c
	jr z, .done
.loop2
	ld a, b
	call GetFarByte
	inc hl
	cp "@"
	jr nz, .loop2

.done
	ld d, h
	ld e, l
	pop hl
	ret
; 44378


PokedexDataPointerTable: ; 0x44378
INCLUDE "data/pokedex/entry_pointers.asm"


Function4456e: ; 4456e
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld d, [hl]
	callba ItemIsMail
	jr nc, .asm_445be
	call Function44648
	cp $a
	jr nc, .asm_445be
	ld bc, SCRATCHMON_STRUCT_LENGTH
	ld hl, s0_a835
	call AddNTimes
	ld d, h
	ld e, l
	ld a, [CurPartyMon]
	ld bc, SCRATCHMON_STRUCT_LENGTH
	ld hl, sPartyScratch1
	call AddNTimes
	push hl
	ld a, BANK(s0_a834)
	call GetSRAMBank
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	pop hl
	xor a
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call ByteFill
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld [hl], $0
	ld hl, s0_a834
	inc [hl]
	call CloseSRAM
	xor a
	ret

.asm_445be
	scf
	ret
; 445c0

Function445c0: ; 445c0 (11:45c0)
	ld a, BANK(s0_a834)
	call GetSRAMBank
	ld a, b
	push bc
	ld hl, s0_a835
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	add hl, bc
	pop de
	pop bc
.loop
	ld a, b
	cp $9
	jr z, .done
	push bc
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	pop bc
	inc b
	jr .loop
.done
	ld h, d
	ld l, e
	xor a
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call ByteFill
	ld hl, s0_a834
	dec [hl]
	jp CloseSRAM
; 445f4 (11:45f4)

ReadMailMessage: ; 445f4
	ld a, b
	ld hl, s0_a835
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	callba ReadAnyMail
	ret

Function44607: ; 44607
	ld a, BANK(s0_a834)
	call GetSRAMBank
	push bc
	ld a, b
	ld bc, SCRATCHMON_STRUCT_LENGTH
	ld hl, s0_a835
	call AddNTimes
	push hl
	ld a, [CurPartyMon]
	ld bc, SCRATCHMON_STRUCT_LENGTH
	ld hl, sPartyScratch1
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	push hl
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	pop hl
	ld de, PARTYMON_STRUCT_LENGTH - MON_MOVES
	add hl, de
	ld d, [hl]
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld [hl], d
	call CloseSRAM
	pop bc
	jp Function445c0
; 44648 (11:4648)

Function44648: ; 44648
	ld a, BANK(s0_a834)
	call GetSRAMBank
	ld a, [s0_a834]
	ld c, a
	jp CloseSRAM
; 44654

Function44654:: ; 44654
	push bc
	push de
	callba SelectMonFromParty
	ld a, $2
	jr c, .asm_446c6
	ld a, [CurPartyMon]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, [hl]
	callba ItemIsMail
	ld a, $3
	jr nc, .asm_446c6
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	ld a, [CurPartyMon]
	ld hl, sPartyScratch1
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	pop bc

	ld a, $20
	ld [wd265], a
.asm_44691
	ld a, [de]
	ld c, a
	ld a, b
	call GetFarByte
	cp "@"
	jr z, .asm_446ab
	cp c
	ld a, $0
	jr nz, .asm_446c1
	inc hl
	inc de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr nz, .asm_44691

.asm_446ab
	callba CheckCurPartyMonFainted
	ld a, $4
	jr c, .asm_446c1
	xor a
	ld [wPokemonWithdrawDepositParameter], a
	callba Functione039
	ld a, $1

.asm_446c1
	call CloseSRAM
	jr .asm_446c8

.asm_446c6
	pop de
	pop bc

.asm_446c8
	ld [ScriptVar], a
	ret
; 446cc

GivePokeItem:: ; 446cc
	ld a, [PartyCount]
	dec a
	push af
	push bc
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld [hl], b
	pop af
	push bc
	push af
	ld hl, sPartyScratch1
	ld bc, $2f
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wd002
	ld bc, $21
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	call CopyBytes
	pop af
	push af
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call AddNTimes
	ld bc, $a
	call CopyBytes
	pop af
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [CurPartySpecies]
	ld [de], a
	inc de
	pop bc
	ld a, b
	ld [de], a
	jp CloseSRAM
; 44725


BackupScratchmons: ; 44725
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	ld hl, sPartyScratch1
	ld de, sPartyScratch2
	ld bc, 6 * SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, s0_a834
	ld de, s0_aa0b
	ld bc, 1 + 10 * SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM
; 44745

RestoreScratchmons: ; 44745 (11:4745)
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	ld hl, sPartyScratch2
	ld de, sPartyScratch1
	ld bc, 6 * SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, s0_aa0b
	ld de, s0_a834
	ld bc, 1 + 10 * SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	jp CloseSRAM

DeleteScratchmons: ; 44765 (11:4765)
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	xor a
	ld hl, sPartyScratch1
	ld bc, 6 * SCRATCHMON_STRUCT_LENGTH
	call ByteFill
	xor a
	ld hl, s0_a834
	ld bc, 1 + 10 * SCRATCHMON_STRUCT_LENGTH
	call ByteFill
	jp CloseSRAM
; 44781 (11:4781)


Function44781: ; 44781
	ld a, [PartyCount]
	and a
	jr z, .asm_4479e
	ld e, a
	ld hl, PartyMon1Item
.asm_4478b
	ld d, [hl]
	push hl
	push de
	callba ItemIsMail
	pop de
	pop hl
	ret c
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	dec e
	jr nz, .asm_4478b

.asm_4479e
	and a
	ret
; 447a0

_KrisMailBoxMenu: ; 0x447a0
	call InitMail
	jr z, .nomail
	call LoadStandardMenuDataHeader
	call Function44806
	jp WriteBackup

.nomail
	ld hl, .EmptyMailboxText
	jp MenuTextBoxBackup
; 0x447b4

.EmptyMailboxText ; 0x447b4
	text_jump _EmptyMailboxText
	db "@"

InitMail: ; 0x447b9
; initialize wd0f2 and beyond with incrementing values, one per mail
; set z if no mail
	ld a, BANK(s0_a834)
	call GetSRAMBank
	ld a, [s0_a834]
	call CloseSRAM
	ld hl, wd0f2
	ld [hli], a
	and a

	jr z, .done ; if no mail, we're done

	; load values in memory with incrementing values starting at wd0f2
	ld b, a
	ld a, $1
.loop
	ld [hli], a
	inc a
	dec b
	jr nz, .loop
.done
	ld [hl], $ff ; terminate

	ld a, [wd0f2]
	and a
	ret
; 0x447da

Function447da: ; 0x447da
	dec a
	ld hl, s0_a835 + MON_HP - 1
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	ld a, BANK(s0_a834)
	call GetSRAMBank
	ld de, StringBuffer2
	push de
	ld bc, NAME_LENGTH - 1
	call CopyBytes
	ld a, "@"
	ld [de], a
	call CloseSRAM
	pop de
	ret
; 0x447fb

Function447fb: ; 0x447fb
	push de
	ld a, [MenuSelection]
	call Function447da
	pop hl
	jp PlaceString
; 0x44806

Function44806: ; 0x44806
	xor a
	ld [OBPals + 8 * 6], a
	ld a, $1
	ld [wd0f1], a
.asm_4480f
	call InitMail
	ld hl, MenuData4494c
	call CopyMenuDataHeader
	xor a
	ld [hBGMapMode], a
	call Function352f
	call UpdateSprites
	ld a, [wd0f1]
	ld [wMenuCursorBuffer], a
	ld a, [OBPals + 8 * 6]
	ld [wd0e4], a
	call HandleScrollingMenu
	ld a, [wd0e4]
	ld [OBPals + 8 * 6], a
	ld a, [MenuSelection2]
	ld [wd0f1], a
	ld a, [wcf73]
	cp $2
	jr z, .asm_44848
	call Function4484a
	jr .asm_4480f

.asm_44848
	xor a
	ret
; 0x4484a

Function4484a: ; 0x4484a
	ld hl, MenuData44964
	call LoadMenuDataHeader
	call InterpretMenu2
	call ExitMenu
	jr c, .asm_44860
	ld a, [MenuSelection2]
	dec a
	ld hl, .JumpTable
	rst JumpTable

.asm_44860
	ret
; 0x44861

.JumpTable
	dw .ReadMail
	dw .PutInPack
	dw .AttachMail
	dw .Cancel

.ReadMail ; 0x44869
	call FadeToMenu
	ld a, [MenuSelection]
	dec a
	ld b, a
	call ReadMailMessage
	jp Function2b3c
; 0x44877

.PutInPack ; 0x44877
	ld hl, .MessageLostText
	call MenuTextBox
	call YesNoBox
	call ExitMenu
	ret c
	ld a, [MenuSelection]
	dec a
	call .Function448bb
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, NumItems
	call ReceiveItem
	jr c, .asm_4489e
	ld hl, .PackFullText
	jp MenuTextBoxBackup

.asm_4489e
	ld a, [MenuSelection]
	dec a
	ld b, a
	call Function445c0
	ld hl, .PutAwayText
	jp MenuTextBoxBackup
; 0x448ac

.PutAwayText ; 0x448ac
	text_jump ClearedMailPutAwayText
	db "@"

.PackFullText ; 0x448b1
	text_jump MailPackFullText
	db "@"

.MessageLostText ; 0x448b6
	text_jump MailMessageLostText
	db "@"

.Function448bb: ; 0x448bb
	push af
	ld a, BANK(s0_a834)
	call GetSRAMBank
	pop af
	ld hl, s0_a835 + $2e
	ld bc, $2f
	call AddNTimes
	ld a, [hl]
	ld [CurItem], a
	jp CloseSRAM
; 0x448d2

.AttachMail ; 0x448d2
	call FadeToMenu
	xor a
	ld [PartyMenuActionText], a
	call ClearBGPalettes
.asm_448dc
	callba Function5004f
	callba Function50405
	callba Function503e0
	callba WritePartyMenuTilemap
	callba PrintPartyMenuText
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	callba PartyMenuSelect
	jr c, .asm_44939
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_44923
	ld a, MON_ITEM
	call GetPartyParamLocation
	ld a, [hl]
	and a
	jr z, .asm_4492b
	ld hl, .HoldingMailText
	call PrintText
	jr .asm_448dc

.asm_44923
	ld hl, .EggText
	call PrintText
	jr .asm_448dc

.asm_4492b
	ld a, [MenuSelection]
	dec a
	ld b, a
	call Function44607
	ld hl, .MailMovedText
	call PrintText

.asm_44939
	jp Function2b3c
; 0x4493c

.HoldingMailText ; 0x4493c
	text_jump MailAlreadyHoldingItemText
	db "@"

.EggText ; 0x44941
	text_jump MailEggText
	db "@"

.MailMovedText ; 0x44946
	text_jump MailMovedFromBoxText
	db "@"

.Cancel
	ret

MenuData4494c: ; 0x4494c
	db %01000000 ; flags
	db 1, 8 ; start coords
	db $a, $12 ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %00010000 ; flags
	db 4, 0 ; rows/columns?
	db 1 ; horizontal spacing?
	dbw 0,wd0f2 ; text pointer
	dba Function447fb
	dbw 0,0
	dbw 0,0

MenuData44964: ; 0x44964
	db %01000000 ; flags
	db 0, 0 ; start coords
	db 9, $d ; end coords
	dw .MenuData2
	db 1 ; default option

.MenuData2
	db %10000000 ; flags
	db 4 ; items
	db "READ MAIL@"
	db "PUT IN PACK@"
	db "ATTACH MAIL@"
	db "CANCEL@"


SECTION "bank12", ROMX, BANK[$12]

Function48000: ; 48000
	ld a, $1
	ld [wd474], a
	xor a
	ld [wd473], a
	ld [PlayerGender], a
	ld [wd475], a
	ld [wd476], a
	ld [wd477], a
	ld [wd478], a
	ld [wd002], a
	ld [wd003], a
	; could have done "ld a, [wd479] \ and -4", saved four operations
	ld a, [wd479]
	res 0, a
	ld [wd479], a
	ld a, [wd479]
	res 1, a
	ld [wd479], a
	ret
; 4802f


Function4802f: ; 4802f (12:402f)
	xor a
	set 6, a
	ld [wd002], a
	ld hl, wd003
	set 0, [hl]
	ld a, c
	and a
	call z, Function48000
	call ClearBGPalettes
	call Function48d3d
	ld a, [wd479]
	bit 1, a
	jr z, .asm_4805a
	ld a, [wd003]
	set 0, a
	set 1, a
	set 2, a
	set 3, a
	ld [wd003], a
.asm_4805a
	call Function486bf
	call LoadFontsExtra
	ld de, GFX_488c3
	ld hl, VTiles2 tile $10
	lb bc, BANK(GFX_488c3), 1
	call Request1bpp
	ld de, GFX_488cb
	ld hl, VTiles2 tile $11
	lb bc, BANK(GFX_488cb), 1
	call Request1bpp
	call Function4a3a7
	call ClearBGPalettes
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4808a
	call Function48689
	jr .asm_480d7
.asm_4808a
	ld a, $5
	ld [MusicFade], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU / $100
	ld [MusicFadeIDHi], a
	ld c, 20
	call DelayFrames
	ld b, $1
	call Function4930f
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, $2
	ld c, $14
	call ClearBox
	hlcoord 0, 1
	ld a, $c
	ld [hl], a
	ld bc, $13
	add hl, bc
	ld [hl], a
	ld de, MobileProfileString
	hlcoord 1, 1
	call PlaceString
	hlcoord 0, 2
	ld b, $a
	ld c, $12
	call Function48cdc
	hlcoord 2, 4
	ld de, String_48482
	call PlaceString
.asm_480d7
	hlcoord 2, 6
	ld de, String_48489
	call PlaceString
	hlcoord 2, 8
	ld de, String_4848d
	call PlaceString
	hlcoord 2, 10
	ld de, String_48495
	call PlaceString
	hlcoord 2, 12
	ld de, String_4849e
	call PlaceString
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_48113
	ld a, [PlayerGender]
	ld hl, Strings_484fb
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 11, 4
	call PlaceString
.asm_48113
	hlcoord 11, 6
	call Function487ec
	ld a, [wd474]
	dec a
	ld hl, Prefectures
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 11, 8
	call PlaceString
	hlcoord 11, 10
	call Function489ea
	hlcoord 0, 14
	ld b, $2
	ld c, $12
	call TextBox
	hlcoord 1, 16
	ld de, String_48275
	call PlaceString
	call Function48187
	call Function3200
	call SetPalettes
	call Function1bc9
	ld hl, MenuSelection2
	ld b, [hl]
	push bc
	jr asm_4815f

Function48157: ; 48157 (12:4157)
	call Function1bd3
	ld hl, MenuSelection2
	ld b, [hl]
	push bc

asm_4815f: ; 4815f (12:415f)
	bit 0, a
	jp nz, Function4820d
	ld b, a
	ld a, [wd002]
	bit 6, a
	jr z, .asm_48177
	ld hl, wd479
	bit 1, [hl]
	jr z, .asm_48177
	bit 1, b
	jr nz, .asm_4817a
.asm_48177
	jp Function48272
.asm_4817a
	call ClearBGPalettes
	call Function48d30
	pop bc
	call ClearTileMap
	ld a, $ff
	ret

Function48187: ; 48187 (12:4187)
	ld a, [wd479]
	bit 1, a
	jr nz, .asm_481f1
	ld a, [wd003]
	ld d, a
	call Function48725
	jr c, .asm_481a2
	lb bc, 1, 4
	hlcoord 2, 12
	call ClearBox
	jr .asm_481ad
.asm_481a2
	push de
	hlcoord 2, 12
	ld de, String_4849e
	call PlaceString
	pop de
.asm_481ad
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_481c1
	bit 0, d
	jr nz, .asm_481c1
	lb bc, 1, 8
	hlcoord 11, 4
	call ClearBox
.asm_481c1
	bit 1, d
	jr nz, .asm_481ce
	lb bc, 1, 8
	hlcoord 11, 6
	call ClearBox
.asm_481ce
	bit 2, d
	jr nz, .asm_481db
	lb bc, 2, 8
	hlcoord 11, 7
	call ClearBox
.asm_481db
	bit 3, d
	jr nz, .asm_481f1
	ld a, [wd479]
	bit 0, a
	jr nz, .asm_481f8
	lb bc, 1, 8
	hlcoord 11, 10
	call ClearBox
	jr .asm_48201
.asm_481f1
	ld a, [wd479]
	bit 0, a
	jr nz, .asm_48201
.asm_481f8
	hlcoord 11, 10
	ld de, String_48202
	call PlaceString
.asm_48201
	ret
; 48202 (12:4202)

String_48202: ; 48202
	db "Tell Later@"
; 4820d

Function4820d: ; 4820d (12:420d)
	call Function1bee
	ld hl, MenuSelection2
	ld a, [hl]
	push af
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4821f
	pop af
	inc a
	push af
.asm_4821f
	pop af
	cp $1
	jr z, asm_4828d
	cp $2
	jp z, Function4876f
	cp $3
	jp z, Function48304
	cp $4
	jp z, Function488d3
	ld a, $2
	call Function1ff8
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4825c
	jr .asm_4825c
; 48241 (12:4241)

	hlcoord 1, 15
	ld b, $2
	ld c, $12
	call ClearBox
	ld de, String_484a1
	hlcoord 1, 16
	call PlaceString
	call WaitBGMap
	ld c, 48
	call DelayFrames

.asm_4825c
	call ClearBGPalettes
	call Function48d30
	pop bc
	call ClearTileMap
	ld b, SCGB_08
	call GetSGBLayout
	ld hl, wd479
	set 1, [hl]
	xor a
	ret

Function48272: ; 48272 (12:4272)
	jp Function4840c
; 48275 (12:4275)

String_48275: ; 48275
	db "Personal Info@"
; 48283

Function48283: ; 48283 (12:4283)
	lb bc, 2, 18
	hlcoord 1, 15
	call ClearBox
	ret

asm_4828d: ; 4828d (12:428d)
	call Function48283
	hlcoord 1, 16
	ld de, String_484b1
	call PlaceString
	ld hl, MenuDataHeader_0x484f1
	call LoadMenuDataHeader
	call Function4873c
	hlcoord 11, 2
	ld b, $4
	ld c, $7
	call Function48cdc
	hlcoord 13, 4
	ld de, String_484fb
	call PlaceString
	hlcoord 13, 6
	ld de, String_484ff
	call PlaceString
	call WaitBGMap
	ld a, [PlayerGender]
	inc a
	ld [wMenuCursorBuffer], a
	call Function1bc9
	call PlayClickSFX
	call ExitMenu
	bit 0, a
	jp z, Function4840c
	ld hl, MenuSelection2
	ld a, [hl]
	ld hl, Strings_484fb
	cp $1
	jr z, .asm_482ed
.asm_482e1
	ld a, [hli]
	cp $50
	jr nz, .asm_482e1
	ld a, $1
	ld [PlayerGender], a
	jr .asm_482f1
.asm_482ed
	xor a
	ld [PlayerGender], a
.asm_482f1
	ld d, h
	ld e, l
	hlcoord 11, 4
	call PlaceString
	ld a, [wd003]
	set 0, a
	ld [wd003], a
	jp Function4840c

Function48304: ; 48304 (12:4304)
	call Function48283
	hlcoord 1, 16
	ld de, String_484cf
	call PlaceString
	ld hl, MenuDataHeader_0x48504
	call LoadMenuDataHeader
	ld hl, MenuDataHeader_0x48513
	call LoadMenuDataHeader
	hlcoord 10, 0
	ld b, $c
	ld c, $8
	call Function48cdc
	ld a, [wMenuCursorBuffer]
	ld b, a
	ld a, [wd0e4]
	ld c, a
	push bc
	ld a, [wd474]
	dec a
	cp $29
	jr c, .asm_4833f
	sub $29
	inc a
	ld [wMenuCursorBuffer], a
	ld a, $29
.asm_4833f
	ld [wd0e4], a
	callba Function104148
.asm_48348
	call HandleScrollingMenu
	ld de, $629
	call Function48383
	jr c, .asm_48348
	ld d, a
	pop bc
	ld a, b
	ld [wMenuCursorBuffer], a
	ld a, c
	ld [wd0e4], a
	ld a, d
	push af
	call ExitMenu
	call ExitMenu
	pop af
	ld a, [hJoyPressed]
	bit 0, a
	jr z, .asm_48377
	call Function483bb
	ld a, [wd003]
	set 2, a
	ld [wd003], a
.asm_48377
	call Function48187
	callba Function104148
	jp Function4840c

Function48383: ; 48383 (12:4383)
	push bc
	push af
	bit 5, a
	jr nz, .asm_48390
	bit 4, a
	jr nz, .asm_4839f
	and a
	jr .asm_483b7
.asm_48390
	ld a, [wd0e4]
	sub d
	ld [wd0e4], a
	jr nc, .asm_483af
	xor a
	ld [wd0e4], a
	jr .asm_483af
.asm_4839f
	ld a, [wd0e4]
	add d
	ld [wd0e4], a
	cp e
	jr c, .asm_483af
	ld a, e
	ld [wd0e4], a
	jr .asm_483af
.asm_483af
	ld hl, MenuSelection2
	ld a, [hl]
	ld [wMenuCursorBuffer], a
	scf
.asm_483b7
	pop bc
	ld a, b
	pop bc
	ret

Function483bb: ; 483bb (12:43bb)
	ld hl, wcf77
	ld a, [hl]
	inc a
	ld [wd474], a
	dec a
	ld b, a
	ld hl, Prefectures
.asm_483c8
	and a
	jr z, .asm_483d5
.asm_483cb
	ld a, [hli]
	cp "@"
	jr nz, .asm_483cb
	ld a, b
	dec a
	ld b, a
	jr .asm_483c8
.asm_483d5
	ld d, h
	ld e, l
	ld b, $2
	ld c, $8
	hlcoord 11, 7
	call ClearBox
	hlcoord 11, 8
	call PlaceString
	ret
; 483e8 (12:43e8)

Function483e8: ; 483e8
	push de
	ld hl, Prefectures
	ld a, [MenuSelection]
	cp $ff
	jr nz, .asm_483f8
	ld hl, Wakayama ; last string
	jr .asm_48405

.asm_483f8
	ld d, a
	and a
	jr z, .asm_48405
.asm_483fc
	ld a, [hli]
	cp "@"
	jr nz, .asm_483fc
	ld a, d
	dec a
	jr .asm_483f8

.asm_48405
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ret
; 4840c

Function4840c: ; 4840c (12:440c)
	call Function48187
	call Function48283
	hlcoord 1, 16
	ld de, String_48275
	call PlaceString
	call Function486bf
	pop bc
	ld hl, MenuSelection2
	ld [hl], b
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_48437
	ld b, $9
	ld c, $1
	hlcoord 1, 4
	call ClearBox
	jp Function48157
.asm_48437
	ld b, $7
	ld c, $1
	hlcoord 1, 6
	call ClearBox
	jp Function48157

Function48444: ; 48444 (12:4444)
	push bc
	push af
	push de
	push hl
	ld hl, Unknown_4845d
.asm_4844b
	and a
	jr z, .asm_48453
rept 2
	inc hl
endr
	dec a
	jr .asm_4844b
.asm_48453
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	pop de
	pop af
	pop bc
	ret
; 4845d (12:445d)

Unknown_4845d: ; 4845d
; 4845d
	db "0@"
	db "1@"
	db "2@"
	db "3@"
	db "4@"
	db "5@"
	db "6@"
	db "7@"
	db "8@"
	db "9@"
; 48471

MobileProfileString: db "  Mobile Profile@"
String_48482: db "Gender@"
String_48489: db "Age@"
String_4848d: db "Address@"
String_48495: db "Zip Code@"
String_4849e: db "OK@"
String_484a1: db "Profile Changed@"
String_484b1: db "Boy or girl?@"
String_484be: db "How old are you?@"
String_484cf: db "Where do you live?@"
String_484e2: db "Your zip code?@"
; 484f1

MenuDataHeader_0x484f1: ; 0x484f1
	db $40 ; flags
	db 02, 11 ; start coords
	db 07, 19 ; end coords
	dw MenuData2_0x484f9
	db 1 ; default option
; 0x484f9

MenuData2_0x484f9: ; 0x484f9
	db $a0 ; flags
	db 2 ; items
Strings_484fb:
String_484fb: db "Boy@"
String_484ff: db "Girl@"
; 0x48504

MenuDataHeader_0x48504: ; 0x48504
	db $40 ; flags
	db 00, 10 ; start coords
	db 17, 19 ; end coords

MenuDataHeader_0x48509: ; 0x48509
	db $40 ; flags
	db 05, 10 ; start coords
	db 07, 19 ; end coords

MenuDataHeader_0x4850e: ; 0x4850e
	db $40 ; flags
	db 09, 10 ; start coords
	db 11, 19 ; end coords

MenuDataHeader_0x48513: ; 0x48513
	db $40 ; flags
	db 01, 11 ; start coords
	db 12, 18 ; end coords
	dw MenuData2_0x4851b
	db 1 ; default option
; 0x4851b

MenuData2_0x4851b: ; 0x4851b
	db $1d ; flags
	db 6 ; items

Unknown_4851d: ; 4851d
	db $00, $01, $12, $2b, $45, $12, $e8, $43, $00, $00, $00, $00, $00, $00, $2e, $00, $01, $02, $03, $04
	db $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f, $10, $11, $12, $13, $14, $15, $16, $17, $18
	db $19, $1a, $1b, $1c, $1d, $1e, $1f, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c
	db $2d, $ff

Prefectures:
Aichi:     db "あいちけん@"   ; Aichi
Aomori:    db "あおもりけん@" ; Aomori
Akita:     db "あきたけん@"   ; Akita
Ishikawa:  db "いしかわけん@" ; Ishikawa
Ibaraki:   db "いばらきけん@" ; Ibaraki
Iwate:     db "いわてけん@"   ; Iwate
Ehime:     db "えひめけん@"   ; Ehime
Oita:      db "おおいたけん@" ; Oita
Osakafu:   db "おおさかふ@"   ; Osakafu
Okayama:   db "おかやまけん@" ; Okayama
Okinawa:   db "おきなわけん@" ; Okinawa
Kagawa:    db "かがわけん@"   ; Kagawa
Kagoshima: db "かごしまけん@" ; Kagoshima
Kanagawa:  db "かながわけん@" ; Kanagawa
Gifu:      db "ぎふけん@"     ; Gifu
Kyotofu:   db "きょうとふ@"   ; Kyotofu
Kumamoto:  db "くまもとけん@" ; Kumamoto
Gunma:     db "ぐんまけん@"   ; Gunma
Kochi:     db "こうちけん@"   ; Kochi
Saitama:   db "さいたまけん@" ; Saitama
Saga:      db "さがけん@"     ; Saga
Shiga:     db "しがけん@"     ; Shiga
Shizuoka:  db "しずおかけん@" ; Shizuoka
Shimane:   db "しまねけん@"   ; Shimane
Chiba:     db "ちばけん@"     ; Chiba
Tokyo:     db "とうきょうと@" ; Tokyo
Tokushima: db "とくしまけん@" ; Tokushima
Tochigi:   db "とちぎけん@"   ; Tochigi
Tottori:   db "とっとりけん@" ; Tottori
Toyama:    db "とやまけん@"   ; Toyama
Nagasaki:  db "ながさきけん@" ; Nagasaki
Nagano:    db "ながのけん@"   ; Nagano
Naraken:   db "ならけん@"     ; Naraken
Niigata:   db "にいがたけん@" ; Niigata
Hyogo:     db "ひょうごけん@" ; Hyogo
Hiroshima: db "ひろしまけん@" ; Hiroshima
Fukui:     db "ふくいけん@"   ; Fukui
Fukuoka:   db "ふくおかけん@" ; Fukuoka
Fukushima: db "ふくしまけん@" ; Fukushima
Hokkaido:  db "ほっかいどう@" ; Hokkaido
Mie:       db "みえけん@"     ; Mie
Miyagi:    db "みやぎけん@"   ; Miyagi
Miyazaki:  db "みやざきけん@" ; Miyazaki
Yamagata:  db "やまがたけん@" ; Yamagata
Yamaguchi: db "やまぐちけん@" ; Yamaguchi
Yamanashi: db "やまなしけん@" ; Yamanashi
Wakayama:  db "わかやまけん@" ; Wakayama
; 48689

Function48689: ; 48689 (12:4689)
	ld c, 7
	call DelayFrames
	ld b, $1
	call Function4930f
	call ClearBGPalettes
	hlcoord 0, 0
	ld b, $4
	ld c, $14
	call ClearBox
	hlcoord 0, 2
	ld a, $c
	ld [hl], a
	ld bc, $13
	add hl, bc
	ld [hl], a
	ld de, MobileProfileString
	hlcoord 1, 2
	call PlaceString
	hlcoord 0, 4
	ld b, $8
	ld c, $12
	call Function48cdc
	ret

Function486bf: ; 486bf (12:46bf)
	ld hl, wcfa1
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_486ce
	ld a, $4
	ld [hli], a
	jr .asm_486d1
.asm_486ce
	ld a, $6
	ld [hli], a
.asm_486d1
	ld a, $1
	ld [hli], a
	ld a, [wd002]
	bit 6, a
	jr nz, .asm_486e7
	call Function48725
	ld a, $4
	jr nc, .asm_486e4
	ld a, $5
.asm_486e4
	ld [hli], a
	jr .asm_486fb
.asm_486e7
	ld a, [wd479]
	bit 1, a
	jr nz, .asm_486f8
	call Function48725
	jr c, .asm_486f8
	ld a, $3
	ld [hli], a
	jr .asm_486fb
.asm_486f8
	ld a, $4
	ld [hli], a
.asm_486fb
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	push af
	ld a, [wd002]
	bit 6, a
	jr z, .asm_4871a
	pop af
	add $2
	push af
.asm_4871a
	pop af
	ld [hli], a
	ld a, $1
rept 2
	ld [hli], a
endr
	xor a
rept 3
	ld [hli], a
endr
	ret

Function48725: ; 48725 (12:4725)
	ld a, [wd003]
	bit 0, a
	jr z, .asm_4873a
	bit 1, a
	jr z, .asm_4873a
	bit 2, a
	jr z, .asm_4873a
	bit 3, a
	jr z, .asm_4873a
	scf
	ret
.asm_4873a
	and a
	ret

Function4873c: ; 4873c (12:473c)
	ld hl, wcfa1
	ld a, $4
	ld [hli], a
	ld a, $c
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $2
	ld [hli], a
	ld a, [PlayerGender]
	and a
	jr z, .asm_48764
	ld a, $2
	jr .asm_48766
.asm_48764
	ld a, $1
.asm_48766
	ld [hli], a
	ld a, $1
	ld [hli], a
	xor a
rept 3
	ld [hli], a
endr
	ret

Function4876f: ; 4876f (12:476f)
	call Function48283
	hlcoord 1, 16
	ld de, String_484be
	call PlaceString
	ld hl, MenuDataHeader_0x48509
	call LoadMenuDataHeader
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	call WaitBGMap
	ld a, [wd473]
	and a
	jr z, .asm_487ab
	cp $64
	jr z, .asm_487b2
	hlcoord 12, 5
	ld [hl], $10
	hlcoord 12, 7
	ld [hl], $11
	jr .asm_487b7
.asm_487ab
	hlcoord 12, 5
	ld [hl], $10
	jr .asm_487b7
.asm_487b2
	hlcoord 12, 7
	ld [hl], $11
.asm_487b7
	hlcoord 11, 6
	call Function487ec
	ld c, 10
	call DelayFrames
	ld a, [wd473]
	push af
.asm_487c6
	call JoyTextDelay
	call Function4880e
	jr nc, .asm_487c6
	ld a, $1
	call Function1ff8
	pop bc
	jr nz, .asm_487da
	ld a, b
	ld [wd473], a
.asm_487da
	ld a, [wd473]
	call ExitMenu
	hlcoord 11, 6
	call Function487ec
	pop af
	ld [hInMenu], a
	jp Function4840c

Function487ec: ; 487ec (12:47ec)
	push hl
	ld de, wd473
	call Function487ff
	pop hl
rept 4
	inc hl
endr
	ld de, String_4880d
	call PlaceString
	ret

Function487ff: ; 487ff (12:47ff)
	push hl
	ld a, " "
	ld [hli], a
	ld [hl], a
	pop hl
	ld b, PRINTNUM_LEADINGZEROS | 1
	ld c, 3
	call PrintNum
	ret
; 4880d (12:480d)

String_4880d: ; 4880d
	db "@"
; 4880e

Function4880e: ; 4880e (12:480e)
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, Function488b9
	ld a, [hJoyPressed]
	and B_BUTTON
	jp nz, Function488b4
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_48843
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_48838
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_4884f
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_4885f
	call DelayFrame
	and a
	ret
.asm_48838
	ld hl, wd473
	ld a, [hl]
	and a
	jr z, .asm_48840
	dec a
.asm_48840
	ld [hl], a
	jr .asm_4886f
.asm_48843
	ld hl, wd473
	ld a, [hl]
	cp $64
	jr nc, .asm_4884c
	inc a
.asm_4884c
	ld [hl], a
	jr .asm_4886f
.asm_4884f
	ld a, [wd473]
	cp $5b
	jr c, .asm_48858
	ld a, $5a
.asm_48858
	add $a
	ld [wd473], a
	jr .asm_4886f
.asm_4885f
	ld a, [wd473]
	cp $a
	jr nc, .asm_48868
	ld a, $a
.asm_48868
	sub $a
	ld [wd473], a
	jr .asm_4886f
.asm_4886f
	ld a, [wd473]
	and a
	jr z, .asm_48887
	cp $64
	jr z, .asm_48898
	jr z, .asm_488a7
	hlcoord 12, 5
	ld [hl], $10
	hlcoord 12, 7
	ld [hl], $11
	jr .asm_488a7
.asm_48887
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 5
	ld [hl], $10
	jr .asm_488a7
.asm_48898
	hlcoord 10, 5
	ld b, $1
	ld c, $8
	call Function48cdc
	hlcoord 12, 7
	ld [hl], $11
.asm_488a7
	hlcoord 11, 6
	call Function487ec
	call WaitBGMap
	ld a, $1
	and a
	ret

Function488b4: ; 488b4 (12:48b4)
	ld a, $0
	and a
	scf
	ret

Function488b9: ; 488b9 (12:48b9)
	ld a, [wd003]
	set 1, a
	ld [wd003], a
	scf
	ret
; 488c3 (12:48c3)

GFX_488c3: ; 488c3
INCBIN "gfx/unknown/0488c3.2bpp"

GFX_488cb: ; 488cb
INCBIN "gfx/unknown/0488cb.2bpp"

Function488d3: ; 488d3 (12:48d3)
	call Function48283
	hlcoord 1, 16
	ld de, String_484e2
	call PlaceString
	call Function48a3a
	jp c, Function4840c
	ld hl, MenuDataHeader_0x4850e
	call LoadMenuDataHeader
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	ld a, [wd475]
	and $f
	ld d, $0
	hlcoord 11, 10
	call Function489ea
	call WaitBGMap
	ld a, [wd475]
	ld b, a
	ld a, [wd476]
	ld c, a
	ld a, [wd477]
	ld d, a
	ld a, [wd478]
	ld e, a
	push de
	push bc
	ld d, $0
	ld b, $0

asm_48922: ; 48922 (12:4922)
	push bc
	call JoyTextDelay
	ld a, [hJoyDown]
	and a
	jp z, Function4896e
	bit 0, a
	jp nz, Function4896e
	bit 1, a
	jp nz, Function4896e
	ld a, [wd002]
	and %11001111
	res 7, a
	ld [wd002], a
	pop bc
	inc b
	ld a, b
	cp $5
	push bc
	jr c, .asm_4894c
	pop bc
	ld b, $4
	push bc
.asm_4894c
	pop bc
	push bc
	ld a, b
	cp $4
	jr nz, asm_48972
	ld c, 10
	call DelayFrames
	jr asm_48972
; 4895a (12:495a)

Function4895a: ; 4895a
	ld a, [hJoyPressed]
	and a
	jr z, .asm_48965
	pop bc
	ld b, $1
	push bc
	jr asm_48972

.asm_48965
	ld a, [hJoyLast]
	and a
	jr z, asm_48972

	pop bc
	ld b, $1
	push bc

Function4896e: ; 4896e (12:496e)
	pop bc
	ld b, $0
	push bc

asm_48972: ; 48972 (12:4972)
	call Function48ab5
	push af
	cp $f0
	jr z, .asm_48994
	cp $f
	jr nz, .asm_48988
	ld a, [wd002]
	set 7, a
	and $cf
	ld [wd002], a
.asm_48988
	hlcoord 11, 10
	ld b, $0
	ld c, d
	add hl, bc
	ld b, $3
	call Function48c11
.asm_48994
	call WaitBGMap
	pop af
	pop bc
	jr nc, asm_48922
	jr nz, .asm_489b1
	pop bc
	ld a, b
	ld [wd475], a
	ld a, c
	ld [wd476], a
	pop bc
	ld a, b
	ld [wd477], a
	ld a, c
	ld [wd478], a
	jr .asm_489c5
.asm_489b1
	push af
	ld a, [wd479]
	set 0, a
	ld [wd479], a
	ld a, [wd003]
	set 3, a
	ld [wd003], a
	pop af
	pop bc
	pop bc
.asm_489c5
	push af
	push bc
	push de
	push hl
	ld a, $1
	call Function1ff8
	pop hl
	pop de
	pop bc
	pop af
	call ExitMenu
	hlcoord 11, 10
	call Function489ea
	hlcoord 11, 9
	lb bc, 1, 8
	call ClearBox
	pop af
	ld [hInMenu], a
	jp Function4840c

Function489ea: ; 489ea (12:49ea)
	push de
	ld a, [wd475]
	and $f
	call Function48444
	ld a, [wd476]
	and $f0
	swap a
	inc hl
	call Function48444
	ld a, [wd476]
	and $f
	inc hl
	call Function48444
	inc hl
	ld de, String_48a38
	call PlaceString
	ld a, [wd477]
	and $f0
	swap a
	inc hl
	call Function48444
	ld a, [wd477]
	and $f
	inc hl
	call Function48444
	ld a, [wd478]
	and $f0
	swap a
	inc hl
	call Function48444
	ld a, [wd478]
	and $f
	inc hl
	call Function48444
	pop de
	ret
; 48a38 (12:4a38)

String_48a38: ; 48a38
	db "-@"
; 48a3a

Function48a3a: ; 48a3a (12:4a3a)
	ld hl, MenuDataHeader_0x48a9c
	call LoadMenuDataHeader
	call Function4873c
	ld a, $a
	ld [wcfa1], a
	ld a, $b
	ld [wcfa2], a
	ld a, $1
	ld [MenuSelection2], a
	hlcoord 10, 8
	ld b, $4
	ld c, $8
	call Function48cdc
	hlcoord 12, 10
	ld de, String_48aa1
	call PlaceString
	call Function1bc9
	push af
	call PlayClickSFX
	call ExitMenu
	pop af
	bit 1, a
	jp nz, Function48a9a
	ld a, [MenuSelection2]
	cp $1
	jr z, .asm_48a98
	ld a, [wd003]
	set 3, a
	ld [wd003], a
	ld a, [wd479]
	res 0, a
	ld [wd479], a
	xor a
	ld bc, $4
	ld hl, wd475
	call ByteFill
	jr Function48a9a
.asm_48a98
	and a
	ret

Function48a9a: ; 48a9a (12:4a9a)
	scf
	ret
; 48a9c (12:4a9c)

MenuDataHeader_0x48a9c: ; 0x48a9c
	db $40 ; flags
	db 08, 10 ; start coords
	db 13, 19 ; end coord

String_48aa1: ; 48aa1
	db   "Tell Now"
	next "Tell Later@"
; 48ab5


Function48ab5: ; 48ab5 (12:4ab5)
	ld a, [hJoyPressed]
	and A_BUTTON
	jp nz, Function48c0f
	ld a, [hJoyPressed]
	and B_BUTTON
	jp nz, Function48c0d
	ld a, d
	and a
	jr z, .asm_48adf
	cp $1
	jr z, .asm_48ae7
	cp $2
	jr z, .asm_48af1
	cp $3
	jr z, .asm_48af9
	cp $4
	jr z, .asm_48b03
	cp $5
	jr z, .asm_48b0b
	cp $6
	jr .asm_48b15
.asm_48adf
	ld hl, wd475
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48ae7
	ld hl, wd476
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48af1
	ld hl, wd476
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48af9
	ld hl, wd477
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48b03
	ld hl, wd477
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48b0b
	ld hl, wd478
	ld a, [hl]
	swap a
	or $f0
	jr .asm_48b1d
.asm_48b15
	ld hl, wd478
	ld a, [hl]
	and $f
	jr .asm_48b1d
.asm_48b1d
	push hl
	push af
	ld e, $0
	hlcoord 11, 10
	ld a, d
.asm_48b25
	and a
	jr z, .asm_48b2c
	inc e
	dec a
	jr .asm_48b25
.asm_48b2c
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_48b8d
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_48b55
	ld a, [hl]
	and D_LEFT
	jp nz, Function48bd7
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_48b9d
	hlcoord 11, 10
	call Function489ea
	ld a, [wd002]
	bit 7, a
	jr nz, .asm_48b51
.asm_48b51
	pop bc
	pop bc
	and a
	ret
.asm_48b55
	pop af
	ld b, a
	and $f
	and a
	ld a, b
	jr nz, .asm_48b61
	and $f0
	add $a
.asm_48b61
	dec a
.asm_48b62
	push de
	push af
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop af
	pop de
	hlcoord 11, 10
	ld b, a
	ld a, d
	cp $3
	jr c, .asm_48b7a
	inc hl
.asm_48b7a
	ld a, b
	pop hl
	bit 7, a
	jr z, .asm_48b85
	call Function48c4d
	jr .asm_48b88
.asm_48b85
	call Function48c5a
.asm_48b88
	ld a, $f0
	jp Function48c00
.asm_48b8d
	pop af
	ld b, a
	and $f
	cp $9
	ld a, b
	jr c, .asm_48b9a
	and $f0
	add $ff
.asm_48b9a
	inc a
	jr .asm_48b62
.asm_48b9d
	push de
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop de
	ld a, d
	cp $6
	jr nc, .asm_48baf
	inc d
.asm_48baf
	pop af
	pop hl
	ld b, a
	ld a, d
	cp $6
	ld a, b
	jr z, .asm_48bc4
	bit 7, a
	jr nz, .asm_48bc4
	inc hl
	ld a, [hl]
	swap a
	and $f
	jr asm_48bc7
.asm_48bc4
	ld a, [hl]
	and $f

asm_48bc7: ; 48bc7 (12:4bc7)
	hlcoord 11, 10
	push af
	ld a, d
	cp $3
	pop bc
	ld a, b
	jr c, .asm_48bd3
	inc hl
.asm_48bd3
	ld a, $f
	jr Function48c00

Function48bd7: ; 48bd7 (12:4bd7)
	push de
	hlcoord 10, 9
	ld b, $1
	ld c, $8
	call Function48cdc
	pop de
	ld a, d
	and a
	pop af
	pop hl
	ld b, a
	ld a, d
	and a
	ld a, b
	jr z, .asm_48bf3
	bit 7, a
	jr z, .asm_48bf8
	dec d
	dec hl
.asm_48bf3
	ld a, [hl]
	and $f
	jr asm_48bc7
.asm_48bf8
	dec d
	ld a, [hl]
	swap a
	and $f
	jr asm_48bc7

Function48c00: ; 48c00 (12:4c00)
	push af
	hlcoord 11, 10
	call Function489ea
	ld a, $1
	and a
	pop bc
	ld a, b
	ret

Function48c0d: ; 48c0d (12:4c0d)
	xor a
	and a

Function48c0f: ; 48c0f (12:4c0f)
	scf
	ret

Function48c11: ; 48c11 (12:4c11)
	ld a, [wd002]
	bit 7, a
	jr z, .asm_48c20
	ld a, d
	cp $3
	jr c, .asm_48c1e
	inc hl
.asm_48c1e
	ld [hl], $7f
.asm_48c20
	ld a, [wd002]
	swap a
	and $3
	inc a
	cp b
	jr nz, .asm_48c40
	ld a, [wd002]
	bit 7, a
	jr z, .asm_48c3a
	res 7, a
	ld [wd002], a
	xor a
	jr .asm_48c40
.asm_48c3a
	set 7, a
	ld [wd002], a
	xor a
.asm_48c40
	swap a
	ld b, a
	ld a, [wd002]
	and $cf
	or b
	ld [wd002], a
	ret

Function48c4d: ; 48c4d (12:4c4d)
	swap a
	and $f0
	push af
	ld a, [hl]
	and $f
	ld [hl], a
	pop af
	or [hl]
	ld [hl], a
	ret

Function48c5a: ; 48c5a (12:4c5a)
	push af
	ld a, [hl]
	and $f0
	ld [hl], a
	pop af
	or [hl]
	ld [hl], a
	ret

Function48c63: ; 48c63
	ld a, "@"
	ld [de], a
	ld a, c
	cp $30
	jr nc, .asm_48c8c
	and a
	jr z, .asm_48c8c
	dec c
	push de
	ld h, d
	ld l, e
	ld a, "@"
	ld b, 7
.asm_48c76
	ld [hli], a
	dec b
	jr nz, .asm_48c76
	ld hl, Prefectures
	ld a, c
	call GetNthString
.asm_48c81
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	cp "@"
	jr nz, .asm_48c81
	and a
	pop de
	ret

.asm_48c8c
	scf
	ret
; 48c8e

Function48c8e: ; 48c8e
	ld hl, wd02a
	ld d, h
	ld e, l
	callba Function48c63
	hlcoord 10, 7
	call PlaceString
	call WaitBGMap
	ret
; 48ca3

Function48ca3: ; 48ca3
	push af
	push bc
	push de
	push hl
	ld b, 0
	ld c, 0
	ld d, 0
.asm_48cad
	cp 100
	jr c, .asm_48cb6
	sub 100
	inc b
	jr .asm_48cad

.asm_48cb6
	cp 10
	jr c, .asm_48cbf
	sub 10
	inc c
	jr .asm_48cb6

.asm_48cbf
	cp 1
	jr c, .asm_48cc7
	dec a
	inc d
	jr .asm_48cbf

.asm_48cc7
	ld a, b
	call Function48444
	inc hl
	ld a, c
	call Function48444
	inc hl
	ld a, d
	call Function48444
	pop hl
	pop de
	pop bc
	pop af
	ret
; 48cda

Function48cda: ; 48cda (12:4cda)
	ld h, d
	ld l, e

Function48cdc: ; 48cdc (12:4cdc)
	push bc
	push hl
	call Function48cfd
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, $0
.asm_48ced
	push bc
	push hl
.asm_48cef
	ld [hli], a
	dec c
	jr nz, .asm_48cef
	pop hl
	ld de, $14
	add hl, de
	pop bc
	dec b
	jr nz, .asm_48ced
	ret

Function48cfd: ; 48cfd (12:4cfd)
	push hl
	ld a, $4
	ld [hli], a
	inc a
	call Function48d2a
	inc a
	ld [hl], a
	pop hl
	ld de, $14
	add hl, de
.asm_48d0c
	push hl
	ld a, $7
	ld [hli], a
	ld a, $7f
	call Function48d2a
	ld [hl], $8
	pop hl
	ld de, $14
	add hl, de
	dec b
	jr nz, .asm_48d0c
	ld a, $9
	ld [hli], a
	ld a, $a
	call Function48d2a
	ld [hl], $b
	ret

Function48d2a: ; 48d2a (12:4d2a)
	ld d, c
.asm_48d2b
	ld [hli], a
	dec d
	jr nz, .asm_48d2b
	ret

Function48d30: ; 48d30 (12:4d30)
	ld hl, wd475
	call Function48d4a
	ld hl, wd477
	call Function48d4a
	ret

Function48d3d: ; 48d3d (12:4d3d)
	ld hl, wd475
	call Function48d94
	ld hl, wd477
	call Function48d94
	ret

Function48d4a: ; 48d4a (12:4d4a)
	inc hl
	ld a, [hl]
	ld b, a
	and $f
	ld c, a
	srl b
	srl b
	srl b
	srl b
	push bc
	ld c, 10
	ld a, b
	call SimpleMultiply
	pop bc
	add c
	ld [hld], a
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, [hl]
	srl a
	srl a
	srl a
	srl a
	ld c, 10
	call SimpleMultiply
	ld b, a
	ld a, [hli]
	and $f
	add b
	ld [hMultiplicand + 2], a
	ld a, 100
	ld [hMultiplier], a
	call Multiply
	ld a, [hProduct + 2]
	ld b, a
	ld a, [hProduct + 3]
	ld c, a
	ld e, [hl]
	add e
	ld c, a
	ld a, b
	adc $0
	ld b, a
	ld a, c
	ld [hld], a
	ld [hl], b
	ret

Function48d94: ; 48d94 (12:4d94)
	xor a
	ld [hDividend + 0], a
	ld [hDividend + 1], a
	ld a, [hli]
	ld [hDividend + 0], a
	ld a, [hl]
	ld [hDividend + 1], a
	ld a, 100
	ld [hDivisor], a
	ld b, 2
	call Divide
	ld a, [hDivisor]
	ld c, $a
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hld], a
	ld a, [hQuotient + 2]
	ld c, 10
	call SimpleDivide
	sla b
	sla b
	sla b
	sla b
	or b
	ld [hl], a
	ret

InitGender: ; 48dcb (12:4dcb)
	call Function48e14
	call Function48e47
	call Function48e64
	call Function3200
	call SetPalettes
	ld hl, TextJump_AreYouABoyOrAreYouAGirl
	call PrintText
	ld hl, .MenuDataHeader
	call LoadMenuDataHeader
	call Function3200
	call InterpretMenu2
	call WriteBackup
	ld a, [MenuSelection2]
	dec a
	ld [PlayerGender], a
	ld c, 10
	call DelayFrames
	ret
; 48dfc (12:4dfc)

.MenuDataHeader: ; 0x48dfc
	db $40 ; flags
	db 04, 06 ; start coords
	db 09, 12 ; end coords
	dw .MenuData2
	db 1 ; default option
; 0x48e04

.MenuData2: ; 0x48e04
	db $a1 ; flags
	db 2 ; items
	db "Boy@"
	db "Girl@"
; 0x48e0f

TextJump_AreYouABoyOrAreYouAGirl: ; 0x48e0f
	; Are you a boy? Or are you a girl?
	text_jump Text_AreYouABoyOrAreYouAGirl
	db "@"
; 0x48e14

Function48e14: ; 48e14 (12:4e14)
	ld a, $10
	ld [MusicFade], a
	ld a, $0
	ld [MusicFadeIDLo], a
	ld a, $0
	ld [MusicFadeIDHi], a
	ld c, 8
	call DelayFrames
	call ClearBGPalettes
	call Function48000
	call LoadFontsExtra
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

Function48e47: ; 48e47 (12:4e47)
	ld hl, Palette_48e5c
	ld de, wMapPals
	ld bc, $8
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 48e5c (12:4e5c)

Palette_48e5c: ; 48e5c
	RGB 31, 31, 31
	RGB 09, 30, 31
	RGB 01, 11, 31
	RGB 00, 00, 00
; 48e64

Function48e64: ; 48e64 (12:4e64)
	ld de, GFX_48e71
	ld hl, VTiles2 tile $00
	lb bc, BANK(GFX_48e71), 1
	call Get2bpp
	ret
; 48e71 (12:4e71)

GFX_48e71: ; 48e71
INCBIN "gfx/unknown/048e71.2bpp"


DrawKrisPackGFX: ; 48e81
	ld hl, PackFGFXPointers
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, VTiles2 tile $50
	lb bc, BANK(PackFGFX), 15
	call Request2bpp
	ret
; 48e93

PackFGFXPointers: ; 48e93
	dw PackFGFX + $f0 * 1
	dw PackFGFX + $f0 * 3
	dw PackFGFX + $f0 * 0
	dw PackFGFX + $f0 * 2
; 48e9b

PackFGFX: ; 48e9b
INCBIN "gfx/misc/pack_f.2bpp"
; 4925b

Function4925b: ; 4925b
	call FadeToMenu
	call ClearBGPalettes
	call ClearScreen
	call DelayFrame
	ld b, SCGB_14
	call GetSGBLayout
	xor a
	ld [wItemAttributeParamBuffer], a
	call Function492a5
	ld [wd265], a
	ld [wd262], a
	call GetMoveName
	call CopyName1
	callba Function2c7fb
	jr c, .asm_4929c
	jr .asm_49291

.asm_49289
	callba Function2c80a
	jr c, .asm_4929c

.asm_49291
	call Function492b9
	jr nc, .asm_49289
	xor a
	ld [ScriptVar], a
	jr .asm_492a1

.asm_4929c
	ld a, $ff
	ld [ScriptVar], a

.asm_492a1
	call Function2b3c
	ret
; 492a5

Function492a5: ; 492a5
	ld a, [ScriptVar]
	cp $1
	jr z, .asm_492b3
	cp $2
	jr z, .asm_492b6
	ld a, ICE_BEAM
	ret

.asm_492b3
	ld a, FLAMETHROWER
	ret

.asm_492b6
	ld a, THUNDERBOLT
	ret
; 492b9

Function492b9: ; 492b9
	ld hl, MenuDataHeader_0x4930a
	call LoadMenuDataHeader

	predef CanLearnTMHMMove

	push bc
	ld a, [CurPartyMon]
	ld hl, PartyMonNicknames
	call GetNick
	pop bc

	ld a, c
	and a
	jr nz, .can_learn
	push de
	ld de, SFX_WRONG
	call PlaySFX
	pop de
	ld a, BANK(UnknownText_0x2c8ce)
	ld hl, UnknownText_0x2c8ce
	call FarPrintText
	jr .didnt_learn
.can_learn

	callab KnowsMove
	jr c, .didnt_learn

	predef LearnMove
	ld a, b
	and a
	jr z, .didnt_learn

	ld c, HAPPINESS_LEARNMOVE
	callab ChangeHappiness
	jr .learned

.didnt_learn
	call ExitMenu
	and a
	ret

.learned
	call ExitMenu
	scf
	ret
; 4930a

MenuDataHeader_0x4930a: ; 0x4930a
	db $40 ; flags
	db 12, 00 ; start coords
	db 17, 19 ; end coords
; 4930f

Function4930f: ; 4930f (mobile)
	ld a, b
	cp $ff
	jr nz, .asm_49317
	ld a, [SGBPredef]
.asm_49317
	push af
	callba Function9673
	pop af
	ld l, a
	ld h, 0
	add hl, hl
	ld de, Jumptable_49330
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	push de
	jp [hl]
.done
	ret
; 49330 (12:5330)

Jumptable_49330: ; 49330
	dw Function4936e
	dw Function4942f
	dw Function49706
; 49336

Function49336: ; 49336
.asm_49336
	push bc
	push hl
.asm_49338
	ld [hli], a
	dec c
	jr nz, .asm_49338
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_49336
	ret
; 49346


Function49346: ; 49346 (12:5346)
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	xor a
	call ByteFill
	ret

Function49351: ; 49351 (12:5351)
	ld de, wMapPals
	ld hl, Palette_493e1
	ld bc, $28
	ld a, $5 ; BANK(wMapPals)
	call FarCopyWRAM
	ld de, wMapPals + $38
	ld hl, Palette_49418
	ld bc, $8
	ld a, $5 ; BANK(wMapPals)
	call FarCopyWRAM
	ret

Function4936e: ; 4936e (12:536e)
	call Function49351
	call Function49346
	call Function49384
	callba Function96b3
	callba Function96a4
	ret

Function49384: ; 49384 (12:5384)
	hlcoord 0, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call Function49336
	lb bc, 2, 1
	ld a, $2
	call Function49336
	lb bc, 6, 1
	ld a, $3
	call Function49336
	hlcoord 1, 0, AttrMap
	ld a, $1
	lb bc, 3, 18
	call Function49336
	lb bc, 2, 18
	ld a, $2
	call Function49336
	lb bc, 12, 18
	ld a, $3
	call Function49336
	hlcoord 19, 0, AttrMap
	lb bc, 4, 1
	ld a, $1
	call Function49336
	lb bc, 2, 1
	ld a, $2
	call Function49336
	lb bc, 6, 1
	ld a, $3
	call Function49336
	hlcoord 0, 12, AttrMap
	ld bc, 6 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ret
; 493e1 (12:53e1)

Palette_493e1: ; 493e1
	RGB 03, 07, 09
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 31, 31, 31

	RGB 13, 24, 29
	RGB 11, 16, 30
	RGB 07, 11, 22
	RGB 05, 06, 18

	RGB 31, 31, 31
	RGB 20, 26, 31
	RGB 13, 24, 29
	RGB 11, 16, 30

	RGB 31, 31, 31
	RGB 20, 26, 31
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 20, 16, 08
	RGB 31, 00, 00
	RGB 00, 00, 00
; 49409


Function49409:: ; 49409
	ld hl, Palette_49418
	ld de, wMapPals + 8 * 7
	ld bc, 8
	ld a, $5
	call FarCopyWRAM
	ret
; 49418

Palette_49418: ; 49418
	RGB 31, 31, 31
	RGB 08, 19, 28
	RGB 05, 05, 16
	RGB 00, 00, 00
; 49420

Function49420:: ; 49420 (12:5420)
	ld hl, MansionPalette4
	ld de, wMapPals + $30
	ld bc, $8
	ld a, $5 ; BANK(wMapPals)
	call FarCopyWRAM
	ret
; 4942f (12:542f)

Function4942f: ; 4942f
	call Function49351
	ld de, wMapPals + $38
	ld hl, Palette_49478
	ld bc, $8
	ld a, $5 ; BANK(wMapPals)
	call FarCopyWRAM
	call Function49346
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 14, AttrMap
	ld bc, 4 * SCREEN_WIDTH
	ld a, $7
	call ByteFill
	ld a, [wd002]
	bit 6, a
	jr z, .asm_49464
	call Function49480
	jr .asm_49467

.asm_49464
	call Function49496

.asm_49467
	callba Function96b3
	callba Function96a4
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; 49478

Palette_49478: ; 49478
	RGB 31, 31, 31
	RGB 26, 31, 00
	RGB 20, 16, 03
	RGB 00, 00, 00
; 49480

Function49480: ; 49480
	hlcoord 0, 0, AttrMap
	lb bc, 4, SCREEN_WIDTH
	ld a, $7
	call Function49336
	hlcoord 0, 2, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 2, AttrMap
	ld [hl], a
	ret
; 49496

Function49496: ; 49496
	hlcoord 0, 0, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $7
	call Function49336
	hlcoord 0, 1, AttrMap
	ld a, $4
	ld [hl], a
	hlcoord 19, 1, AttrMap
	ld [hl], a
	ret
; 494ac

LoadSpecialMapPalette: ; 494ac
	ld a, [wTileset]
	cp TILESET_POKECOM_CENTER
	jr z, .pokecom_2f
	cp TILESET_BATTLE_TOWER
	jr z, .battle_tower
	cp TILESET_ICE_PATH
	jr z, .ice_path
	cp TILESET_HOUSE_1
	jr z, .house
	cp TILESET_RADIO_TOWER
	jr z, .radio_tower
	cp TILESET_CELADON_MANSION
	jr z, .mansion_mobile
	jr .do_nothing

.pokecom_2f
	call LoadPokeComPalette
	scf
	ret

.battle_tower
	call LoadBattleTowerPalette
	scf
	ret

.ice_path
	ld a, [wPermission] ; permission
	and 7
	cp 3 ; Hall of Fame
	jr z, .do_nothing
	call LoadIcePathPalette
	scf
	ret

.house
	call LoadHousePalette
	scf
	ret

.radio_tower
	call LoadRadioTowerPalette
	scf
	ret

.mansion_mobile
	call LoadMansionPalette
	scf
	ret

.do_nothing
	and a
	ret
; 494f2

LoadPokeComPalette: ; 494f2
	ld a, $5
	ld de, wMapPals
	ld hl, PokeComPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49501

PokeComPalette: ; 49501
INCLUDE "tilesets/pokecom.pal"
; 49541

LoadBattleTowerPalette: ; 49541
	ld a, $5
	ld de, wMapPals
	ld hl, BattleTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 49550

BattleTowerPalette: ; 49550
INCLUDE "tilesets/battle_tower.pal"
; 49590

LoadIcePathPalette: ; 49590
	ld a, $5
	ld de, wMapPals
	ld hl, IcePathPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4959f

IcePathPalette: ; 4959f
INCLUDE "tilesets/ice_path.pal"
; 495df

LoadHousePalette: ; 495df
	ld a, $5
	ld de, wMapPals
	ld hl, HousePalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 495ee

HousePalette: ; 495ee
INCLUDE "tilesets/house.pal"
; 4962e

LoadRadioTowerPalette: ; 4962e
	ld a, $5
	ld de, wMapPals
	ld hl, RadioTowerPalette
	ld bc, 8 palettes
	call FarCopyWRAM
	ret
; 4963d

RadioTowerPalette: ; 4963d
INCLUDE "tilesets/radio_tower.pal"
; 4967d

MansionPalette1: ; 4967d
	RGB 30, 28, 26
	RGB 19, 19, 19
	RGB 13, 13, 13
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 19, 24
	RGB 30, 10, 06
	RGB 07, 07, 07

	RGB 18, 24, 09
	RGB 15, 20, 01
	RGB 09, 13, 00
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 15, 16, 31
	RGB 09, 09, 31
	RGB 07, 07, 07

	RGB 30, 28, 26
	RGB 31, 31, 07
	RGB 31, 16, 01
	RGB 07, 07, 07

	RGB 26, 24, 17
	RGB 21, 17, 07
	RGB 16, 13, 03
	RGB 07, 07, 07

MansionPalette3: ; 496ad
	RGB 30, 28, 26
	RGB 17, 19, 31
	RGB 14, 16, 31
	RGB 07, 07, 07

	RGB 31, 31, 16
	RGB 31, 31, 16
	RGB 14, 09, 00
	RGB 00, 00, 00
; 496bd

MansionPalette4: ; 496bd
	RGB 05, 05, 16
	RGB 08, 19, 28
	RGB 00, 00, 00
	RGB 31, 31, 31
; 496c5

LoadMansionPalette: ; 496c5
	ld a, $5
	ld de, wMapPals
	ld hl, MansionPalette1
	ld bc, 8 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, wMapPals + 4 palettes
	ld hl, MansionPalette2
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, wMapPals + 3 palettes
	ld hl, MansionPalette3
	ld bc, 1 palettes
	call FarCopyWRAM
	ld a, $5
	ld de, wMapPals + 6 palettes
	ld hl, MansionPalette4
	ld bc, 1 palettes
	call FarCopyWRAM
	ret
; 496fe

MansionPalette2: ; 496fe
	RGB 25, 24, 23
	RGB 20, 19, 19
	RGB 14, 16, 31
	RGB 07, 07, 07
; 49706

Function49706: ; 49706
	ld hl, Palette_49732
	ld de, wMapPals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	call Function49346
	callba Function96b3
	ld hl, Palette_4973a
	ld de, Unkn2Pals
	ld bc, 1 palettes
	ld a, $5
	call FarCopyWRAM
	ret
; 49732

Palette_49732: ; 49732
	RGB 31, 31, 31
	RGB 23, 16, 07
	RGB 23, 07, 07
	RGB 03, 07, 20
; 4973a

Palette_4973a: ; 4973a
	RGB 00, 00, 00
	RGB 07, 05, 31
	RGB 14, 18, 31
	RGB 31, 31, 31
; 49742

Function49742: ; 49742
	ld hl, Palette_49757
	ld de, wMapPals
	ld bc, $40
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 49757

Palette_49757: ; 49757
	RGB 31, 31, 63
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 31, 31, 63
	RGB 00, 00, 00
	RGB 00, 00, 00
	RGB 00, 00, 00

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 31, 00, 00
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 30, 16, 26
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 16, 16, 16
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 31, 12, 12
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 07, 08, 31
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 21, 00, 21
	RGB 29, 28, 09
	RGB 31, 31, 31
; 49797

Function49797: ; 49797
	hlcoord 0, 0, AttrMap
	lb bc, 16, 2
	ld a, $4
	call Function49336
	ld a, $3
	ldcoord_a 0, 1, AttrMap
	ldcoord_a 0, 14, AttrMap
	hlcoord 2, 0, AttrMap
	lb bc, 8, 18
	ld a, $5
	call Function49336
	hlcoord 2, 8, AttrMap
	lb bc, 8, 18
	ld a, $6
	call Function49336
	hlcoord 0, 16, AttrMap
	lb bc, 2, SCREEN_WIDTH
	ld a, $4
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 1, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 1, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 6, 9, AttrMap
	call Function49336
	ld a, $3
	lb bc, 6, 1
	hlcoord 17, 9, AttrMap
	call Function49336
	ld a, $2
	hlcoord 2, 16, AttrMap
	ld [hli], a
	ld a, $7
rept 3
	ld [hli], a
endr
	ld a, $2
	ld [hl], a
	hlcoord 2, 17, AttrMap
	ld a, $3
	ld bc, 6
	call ByteFill
	ret
; 49811

Function49811: ; 49811
	ld hl, Palette_49826
	ld de, wMapPals + $10
	ld bc, $30
	ld a, $5
	call FarCopyWRAM
	callba Function96a4
	ret
; 49826

Palette_49826: ; 49826
	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 31, 00, 00
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 15, 23, 30
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 16, 16, 16
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 25, 07, 04
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 03, 22, 08
	RGB 31, 31, 31

	RGB 04, 02, 15
	RGB 07, 09, 31
	RGB 29, 28, 09
	RGB 31, 31, 31
; 49856

Function49856: ; 49856
	call Function49797
	ret
; 4985a

Unknown_4985a: ; unreferenced
	db $ab, $03, $57, $24, $ac, $0e, $13, $32
	db $be, $30, $5b, $4c, $47, $60, $ed, $f2
	db $ab, $03, $55, $26, $aa, $0a, $13, $3a
	db $be, $28, $33, $24, $6e, $71, $df, $b0
	db $a8, $00, $e5, $e0, $9a, $fc, $f4, $2c
	db $fe, $4c, $a3, $5e, $c6, $3a, $ab, $4d
	db $a8, $00, $b5, $b0, $de, $e8, $fc, $1c
	db $ba, $66, $f7, $0e, $ba, $5e, $43, $bd

Special_CelebiShrineEvent: ; 4989a
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call LoadCelebiGFX
	lb de, $07, $50
	ld a, SPRITE_ANIM_INDEX_2C
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld hl, $2
	add hl, bc
	ld [hl], $1f
	ld hl, $f
	add hl, bc
	ld a, $80
	ld [hl], a
	ld a, $a0
	ld [wcf64], a
	ld d, $0
.loop
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	push bc
	call Function49bae
	inc d
	push de
	ld a, $90
	ld [wc3b5], a
	callba Function8cf7a
	call Function49935
	ld c, 2
	call DelayFrames
	pop de
	pop bc
	jr .loop

.done
	pop af
	ld [VramState], a
	call Function498f9
	call Function49bf3
	ret
; 498f9

Function498f9: ; 498f9
	ld hl, Sprites + 2
	xor a
	ld c, $4
.loop
	ld [hli], a
rept 3
	inc hl
endr
	inc a
	dec c
	jr nz, .loop
	ld hl, Sprites + $10
	ld bc, $90
	xor a
	call ByteFill
	ret
; 49912

LoadCelebiGFX: ; 49912
	callba Function8cf53
	ld de, SpecialCelebiLeafGFX
	ld hl, VTiles1
	lb bc, BANK(SpecialCelebiLeafGFX), 4
	call Request2bpp
	ld de, SpecialCelebiGFX
	ld hl, VTiles1 tile $04
	lb bc, BANK(SpecialCelebiGFX), $10
	call Request2bpp
	xor a
	ld [wJumptableIndex], a
	ret
; 49935

Function49935: ; 49935
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_4993e
	dec [hl]
	ret

.asm_4993e
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 49944

Function49944: ; 49944
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [hl]
	and $18
	sla a
	add $40
	ld d, a
	ld e, $0
	ld a, SPRITE_ANIM_INDEX_18 ; fly land
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $80
	ret
; 49962

SpecialCelebiLeafGFX: ; 49962
INCBIN "gfx/special/celebi/leaf.2bpp"
SpecialCelebiGFX: ; 499a2
INCBIN "gfx/special/celebi/1.2bpp"
INCBIN "gfx/special/celebi/2.2bpp"
INCBIN "gfx/special/celebi/3.2bpp"
INCBIN "gfx/special/celebi/4.2bpp"


Function49aa2: ; 49aa2 (12:5aa2)
	ld hl, $6
	add hl, bc
	ld a, [hl]
	push af
	ld hl, $5
	add hl, bc
	ld a, [hl]
	cp $52
	jp nc, Function49b30
	ld hl, $5
	add hl, bc
	inc [hl]
	ld hl, $f
	add hl, bc
	ld a, [hl]
	ld d, a
	cp $3a
	jr c, .asm_49ac6
	jr z, .asm_49ac6
	sub $3
	ld [hl], a
.asm_49ac6
	ld hl, $e
	add hl, bc
	ld a, [hl]
	inc [hl]
	call Function49b3b
	ld hl, $6
	add hl, bc
	ld [hl], a
	ld d, a
	ld hl, $4
	add hl, bc
	add [hl]
	cp $5c
	jr nc, .asm_49ae2
	cp $44
	jr nc, .asm_49b0d
.asm_49ae2
	pop af
	push af
	cp d
	jr nc, .asm_49af2
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr c, .asm_49b05
	jr .asm_49afb
.asm_49af2
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr nc, .asm_49b05
.asm_49afb
	ld hl, $5
	add hl, bc
	ld a, [hl]
	sub $2
	ld [hl], a
	jr .asm_49b0d
.asm_49b05
	ld hl, $5
	add hl, bc
	ld a, [hl]
	add $1
	ld [hl], a
.asm_49b0d
	pop af
	ld hl, $4
	add hl, bc
	add [hl]
	cp $50
	jr c, .asm_49b26
	cp $e6
	jr nc, .asm_49b26
	ld hl, $1
	add hl, bc
	ld a, $41
	call Function3b3c
	jr .asm_49b2f
.asm_49b26
	ld hl, $1
	add hl, bc
	ld a, $40
	call Function3b3c
.asm_49b2f
	ret

Function49b30: ; 49b30 (12:5b30)
	pop af
	ld hl, $1
	add hl, bc
	ld a, $40
	call Function3b3c
	ret

Function49b3b: ; 49b3b (12:5b3b)
	add $10
	and $3f
	cp $20
	jr nc, .asm_49b48
	call Function49b52
	ld a, h
	ret
.asm_49b48
	and $1f
	call Function49b52
	ld a, h
	xor $ff
	inc a
	ret

Function49b52: ; 49b52 (12:5b52)
	ld e, a
	ld a, d
	ld d, $0
	ld hl, Unknown_49b6e
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	ld hl, 0
.asm_49b61
	srl a
	jr nc, .asm_49b66
	add hl, de
.asm_49b66
	sla e
	rl d
	and a
	jr nz, .asm_49b61
	ret
; 49b6e (12:5b6e)

Unknown_49b6e: ; 49b6e
	sine_wave $100
; 49bae

Function49bae: ; 49bae
	push hl
	push bc
	push de
	ld a, d
	ld d, $3
	ld e, d
	cp $0
	jr z, .asm_49bd0
	cp d
	jr z, .asm_49bd4
	call Function49bed
	cp d
	jr z, .asm_49bd8
	call Function49bed
	cp d
	jr z, .asm_49bdc
	call Function49bed
	cp d
	jr c, .asm_49be9
	jr .asm_49be5

.asm_49bd0
	ld a, $84
	jr .asm_49bde

.asm_49bd4
	ld a, $88
	jr .asm_49bde

.asm_49bd8
	ld a, $8c
	jr .asm_49bde

.asm_49bdc
	ld a, $90

.asm_49bde
	ld hl, $3
	add hl, bc
	ld [hl], a
	jr .asm_49be9

.asm_49be5
	pop de
	ld d, $ff
	push de

.asm_49be9
	pop de
	pop bc
	pop hl
	ret
; 49bed

Function49bed: ; 49bed
	push af
	ld a, d
	add e
	ld d, a
	pop af
	ret
; 49bf3

Function49bf3: ; 49bf3
	ld a, BATTLETYPE_CELEBI
	ld [BattleType], a
	ret
; 49bf9

Function49bf9: ; 49bf9
	ld a, [wBattleResult]
	bit 6, a
	jr z, .asm_49c07
	ld a, $1
	ld [ScriptVar], a
	jr .asm_49c0b

.asm_49c07
	xor a
	ld [ScriptVar], a

.asm_49c0b
	ret
; 49c0c

GFX_49c0c: ; 49c0c
INCBIN "gfx/unknown/049c0c.2bpp"
; 49cdc

MainMenu: ; 49cdc
	xor a
	ld [wc2d7], a
	call Function49ed0
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ld hl, GameTimerPause
	res 0, [hl]
	call Function49da4
	ld [wcf76], a
	call Function49e09
	ld hl, MenuDataHeader_0x49d14
	call LoadMenuDataHeader
	call Function49de4
	call WriteBackup
	jr c, .quit
	call ClearTileMap
	ld a, [MenuSelection]
	ld hl, Jumptable_49d60
	rst JumpTable
	jr MainMenu

.quit
	ret
; 49d14

MenuDataHeader_0x49d14: ; 49d14
	db $40 ; flags
	db 00, 00 ; start coords
	db 07, 16 ; end coords
	dw MenuData2_0x49d1c
	db 1 ; default option
; 49d1c

MenuData2_0x49d1c: ; 49d1c
	db $80 ; flags
	db 0 ; items
	dw MainMenuItems
	dw Function1f79
	dw MainMenuText
; 49d20

MainMenuText: ; 49d24
	db "CONTINUE@"
	db "NEW GAME@"
	db "OPTION@"
	db "MYSTERY GIFT@"
	db "MOBILE@"
	db "MOBILE STUDIUM@"

Jumptable_49d60: ; 0x49d60
	dw MainMenu_Continue
	dw MainMenu_NewGame
	dw MainMenu_Options
	dw MainMenu_MysteryGift
	dw MainMenu_Mobile
	dw MainMenu_MobileStudium
; 0x49d6c

CONTINUE       EQU 0
NEW_GAME       EQU 1
OPTION         EQU 2
MYSTERY_GIFT   EQU 3
MOBILE         EQU 4
MOBILE_STUDIUM EQU 5

MainMenuItems:

NewGameMenu: ; 0x49d6c
	db 2
	db NEW_GAME
	db OPTION
	db $ff

ContinueMenu: ; 0x49d70
	db 3
	db CONTINUE
	db NEW_GAME
	db OPTION
	db $ff

MobileMysteryMenu: ; 0x49d75
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db $ff

MobileMenu: ; 0x49d7c
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db $ff

MobileStudiumMenu: ; 0x49d82
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE
	db MOBILE_STUDIUM
	db $ff

MysteryMobileStudiumMenu: ; 0x49d89
	db 6
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE
	db MOBILE_STUDIUM
	db $ff

MysteryMenu: ; 0x49d91
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db $ff

MysteryStudiumMenu: ; 0x49d97
	db 5
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MYSTERY_GIFT
	db MOBILE_STUDIUM
	db $ff

StudiumMenu: ; 0x49d9e
	db 4
	db CONTINUE
	db NEW_GAME
	db OPTION
	db MOBILE_STUDIUM
	db $ff


Function49da4: ; 49da4
	nop
	nop
	nop
	ld a, [wcfcd]
	and a
	jr nz, .next
	ld a, $0
	ret

.next
	ld a, [hCGB]
	cp $1
	ld a, $1
	ret nz
	ld a, BANK(s0_abe5)
	call GetSRAMBank
	ld a, [s0_abe5]
	cp $ff
	call CloseSRAM
	jr nz, .done
	ld a, [StatusFlags]
	bit 7, a
	ld a, $1
	jr z, .ok
	jr .ok

.ok
	jr .ok2

.ok2
	ld a, $1
	ret

.done
	ld a, [StatusFlags]
	bit 7, a
	jr z, .ok3
	jr .ok3

.ok3
	jr .ok4

.ok4
	ld a, $6
	ret
; 49de4

Function49de4: ; 49de4
	call SetUpMenu
.asm_49de7
	call Function49e09
	ld a, [wcfa5]
	set 5, a
	ld [wcfa5], a
	call Function1f1a
	ld a, [wcf73]
	cp $2
	jr z, .asm_49e07
	cp $1
	jr z, .asm_49e02
	jr .asm_49de7

.asm_49e02
	call PlayClickSFX
	and a
	ret

.asm_49e07
	scf
	ret
; 49e09

Function49e09: ; 49e09
	ld a, [wcfcd]
	and a
	ret z
	xor a
	ld [hBGMapMode], a
	call Function49e27
	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]
	call Function49e3d
	pop af
	ld [Options], a
	ld a, $1
	ld [hBGMapMode], a
	ret
; 49e27


Function49e27: ; 49e27
	call Function6e3
	and $80
	jr nz, .asm_49e39
	hlcoord 0, 14
	ld b, $2
	ld c, $12
	call TextBox
	ret

.asm_49e39
	call SpeechTextBox
	ret
; 49e3d


Function49e3d: ; 49e3d
	ld a, [wcfcd]
	and a
	ret z
	call Function6e3
	and $80
	jp nz, Function49e75
	call UpdateTime
	call GetWeekday
	ld b, a
	decoord 1, 15
	call Function49e91
	decoord 4, 16
	ld a, [hHours]
	ld c, a
	callba PrintHour
	ld [hl], ":"
	inc hl
	ld de, hMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	ret
; 49e70

; 49e70
	db "min.@"
; 49e75

Function49e75: ; 49e75
	hlcoord 1, 14
	ld de, .TimeNotSet
	call PlaceString
	ret
; 49e7f

.TimeNotSet ; 49e7f
	db "TIME NOT SET@"
; 49e8c

UnknownText_0x49e8c: ; 49e8c
	text_jump UnknownText_0x1c5182
	db "@"
; 49e91

Function49e91: ; 49e91
	push de
	ld hl, .Days
	ld a, b
	call GetNthString
	ld d, h
	ld e, l
	pop hl
	call PlaceString
	ld h, b
	ld l, c
	ld de, .Day
	call PlaceString
	ret
; 49ea8

.Days
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
.Day
	db "DAY@"
; 49ed0

Function49ed0: ; 49ed0
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ResetTextRelatedRAM
	ret
; 49ee0


MainMenu_NewGame: ; 49ee0
	callba NewGame
	ret
; 49ee7

MainMenu_Options: ; 49ee7
	callba OptionsMenu
	ret
; 49eee

MainMenu_Continue: ; 49eee
	callba Continue
	ret
; 49ef5

MainMenu_MysteryGift: ; 49ef5
	callba MysteryGift
	ret
; 49efc

MainMenu_Mobile: ; 49efc
	call ClearBGPalettes
	ld a, MUSIC_MOBILE_ADAPTER_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MOBILE_ADAPTER_MENU
	call Function4a6c5
Function49f0a: ; 49f0a
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call ClearBGPalettes
Function49f16: ; 49f16
	call Function4a071
	ld c, 12
	call DelayFrames
	hlcoord 4, 0
	ld b, $a
	ld c, $a
	call Function48cdc
	hlcoord 6, 2
	ld de, MobileString1
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	xor a
	ld de, String_0x49fe9
	hlcoord 1, 14
	call PlaceString
	call Function3200
	call SetPalettes
	call Function1bc9
	ld hl, MenuSelection2
	ld b, [hl]
	push bc
	jr .asm_49f5d

.asm_49f55
	call Function1bd3
	ld hl, MenuSelection2
	ld b, [hl]
	push bc

.asm_49f5d
	bit 0, a
	jr nz, .asm_49f67
	bit 1, a
	jr nz, .asm_49f84
	jr .asm_49f97

.asm_49f67
	ld hl, MenuSelection2
	ld a, [hl]
	cp $1
	jp z, Function4a098
	cp $2
	jp z, Function4a0b9
	cp $3
	jp z, Function4a0c2
	cp $4
	jp z, Function4a100
	ld a, $1
	call Function1ff8

.asm_49f84
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	ld a, MUSIC_MAIN_MENU
	ld [wMapMusic], a
	ld de, MUSIC_MAIN_MENU
	call Function4a6c5
	ret

.asm_49f97
	ld hl, MenuSelection2
	ld a, [hl]
	dec a
	ld hl, MobileStrings2
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jp .asm_49fb7

.asm_49fb7
	call Function4a071
	pop bc
	ld hl, MenuSelection2
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 5, 1
	call ClearBox
	jp .asm_49f55
; 49fcc


MobileString1: ; 49fcc
	db   "めいしフ,ルダー"
	next "あいさつ"
	next "プロフィール"
	next "せ", $1e, "い"
	next "もどる"
	db   "@"
; 49fe9


MobileStrings2:

String_0x49fe9: ; 49fe9
	db   "めいし¯つくったり"
	next "ほぞんしておける フ,ルダーです@"
; 4a004

String_0x4a004: ; 4a004
	db   "モバイルたいせんや じぶんのめいしで"
	next "つかう あいさつ¯つくります@"
; 4a026

String_0x4a026: ; 4a026
	db   "あなた%じゅうしょや ねんれいの"
	next "せ", $1e, "い¯かえられます@"
; 4a042

String_0x4a042: ; 4a042
	db  "モバイルセンター", $1d, "せつぞくするとき"
	next "ひつような こと¯きめます@"
; 4a062

String_0x4a062: ; 4a062
	db   "まえ%がめん ", $1d, "もどります"
	next "@"
; 4a071



Function4a071: ; 4a071 (12:6071)
	ld hl, wcfa1
	ld a, $2
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
rept 2
	ld [hli], a
endr
	ret

Function4a098: ; 4a098 (12:6098)
	ld a, $2
	call Function1ff8
	call Function1bee
	call WaitBGMap
	call LoadStandardMenuDataHeader
	callba Function89de0
	call Call_ExitMenu
	call Function49351
	call Function4a485
	pop bc
	jp Function49f16

Function4a0b9: ; 4a0b9 (12:60b9)
	ld a, $2
	call Function1ff8
	pop bc
	jp Function4a4c4

Function4a0c2: ; 4a0c2 (12:60c2)
	ld a, $2
	call Function1ff8
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld de, PlayerName
	ld bc, $6
	call CopyBytes
	call CloseSRAM
	callba Function150b9
	ld c, 2
	call DelayFrames
	ld c, $1
	call Function4802f
	push af
	call ClearBGPalettes
	pop af
	and a
	jr nz, .asm_4a0f9
	callba Function1509a
.asm_4a0f9
	ld c, 5
	call DelayFrames
	jr asm_4a111

Function4a100: ; 4a100 (12:6100)
	ld a, $2
	call Function1ff8
	call ClearBGPalettes
	call Function4a13b
	call ClearBGPalettes
	call ClearTileMap

asm_4a111: ; 4a111 (12:6111)
	pop bc
	call LoadFontsExtra
	jp Function49f0a

Function4a118: ; 4a118 (12:6118)
	ld hl, wcfa1
	ld a, $1
	ld [hli], a
	ld a, $d
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $2
	ld [hli], a
	ld a, $1
rept 2
	ld [hli], a
endr
	ret

Function4a13b: ; 4a13b (12:613b)
	call Function4a3a7
	call Function4a492
	call Function4a373
	ld c, 10
	call DelayFrames

Function4a149: ; 4a149 (12:6149)
	hlcoord 1, 2
	ld b, $6
	ld c, $10
	call Function48cdc
	hlcoord 3, 4
	ld de, String_4a1ef
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	ld a, [MenuSelection2]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	callba Function104148
	call SetPalettes
	call Function1bc9
	ld hl, MenuSelection2
	ld b, [hl]
	push bc
	jr asm_4a19d

Function4a195: ; 4a195 (12:6195)
	call Function1bd3
	ld hl, MenuSelection2
	ld b, [hl]
	push bc

asm_4a19d: ; 4a19d (12:619d)
	bit 0, a
	jr nz, .asm_4a1a7
	bit 1, a
	jr nz, .asm_4a1ba
	jr .asm_4a1bc
.asm_4a1a7
	ld hl, MenuSelection2
	ld a, [hl]
	cp $1
	jp z, Function4a20e
	cp $2
	jp z, Function4a221
	ld a, $1
	call Function1ff8
.asm_4a1ba
	pop bc
	ret
.asm_4a1bc
	ld hl, MenuSelection2
	ld a, [hl]
	dec a
	ld hl, Strings_4a23d
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	jr .asm_4a1db
.asm_4a1db
	call Function4a373
	pop bc
	ld hl, MenuSelection2
	ld [hl], b
	lb bc, 6, 1
	hlcoord 2, 3
	call ClearBox
	jp Function4a195
; 4a1ef (12:61ef)

String_4a1ef: ; 4a1ef
	db   "モバイルセンター¯えらぶ"
	next "ログインパスワード¯いれる"
	next "もどる@"
; 4a20e

Function4a20e: ; 4a20e (12:620e)
	ld a, $1
	call Function1ff8
	callba Function1719c8
	call ClearBGPalettes
	call DelayFrame
	jr Function4a239

Function4a221: ; 4a221 (12:6221)
	ld a, $1
	call Function1ff8
	call Function4a28a
	jr c, Function4a239
	call Function4a373
	ld a, $2
	ld [MenuSelection2], a
	jr .asm_4a235
.asm_4a235
	pop bc
	jp Function4a149

Function4a239: ; 4a239 (12:6239)
	pop bc
	jp Function4a13b
; 4a23d (12:623d)

Strings_4a23d: ; 4a23d
	db   "いつも せつぞく¯する"
	next "モバイルセンター¯えらびます@"

	db   "モバイルセンター", $1d, "せつぞくするとき"
	next "つかうパスワード¯ほぞんできます@"

	db   "まえ%がめん ", $1d, "もどります@"

	db   "@"
; 4a28a

Function4a28a: ; 4a28a (12:628a)
	hlcoord 2, 3
	lb bc, 6, 1
	ld a, " "
	call Function4a6d8
	call Function1bee
	call WaitBGMap
	call LoadStandardMenuDataHeader
	ld a, $5
	call GetSRAMBank
	ld a, [$aa4b]
	call CloseSRAM
	and a
	jr z, .asm_4a2df
	hlcoord 12, 0
	ld b, $5
	ld c, $6
	call Function48cdc
	hlcoord 14, 1
	ld de, String_4a34b
	call PlaceString
	callba Function104148
	call Function4a118
	call Function1bd3
	push af
	call PlayClickSFX
	pop af
	bit 1, a
	jr nz, .asm_4a33b
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_4a2f0
	cp $3
	jr z, .asm_4a33b
.asm_4a2df
	callba Function11765d
	call ClearBGPalettes
	call Call_ExitMenu
	call LoadFontsExtra
	scf
	ret
.asm_4a2f0
	call Function1bee
	ld hl, UnknownText_0x4a358
	call PrintText
	hlcoord 14, 7
	ld b, $3
	ld c, $4
	call TextBox
	callba Function104148
	ld hl, MenuDataHeader_0x4a362
	call LoadMenuDataHeader
	call InterpretMenu2
	bit 1, a
	jr nz, .asm_4a338
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_4a338
	ld a, $5
	call GetSRAMBank
	ld hl, $aa4b
	xor a
	ld bc, $11
	call ByteFill
	call CloseSRAM
	ld hl, UnknownText_0x4a35d
	call PrintText
	call JoyWaitAorB
.asm_4a338
	call ExitMenu
.asm_4a33b
	call Call_ExitMenu
	callba Function104148
	xor a
	ret
; 4a346 (12:6346)

MenuDataHeader_0x4a346: ; 0x4a346
	db $40 ; flags
	db 00, 12 ; start coords
	db 06, 19 ; end coords

String_4a34b: ; 4a34b
	db   "いれなおす"
	next "けす"
	next "もどる@"
; 4a358

UnknownText_0x4a358: ; 0x4a358
	; Delete the saved LOG-IN PASSWORD?
	text_jump UnknownText_0x1c5196
	db "@"
; 0x4a35d

UnknownText_0x4a35d: ; 0x4a35d
	; Deleted the LOG-IN PASSWORD.
	text_jump UnknownText_0x1c51b9
	db "@"
; 0x4a362

MenuDataHeader_0x4a362: ; 0x4a362
	db $40 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x4a36a
	db 2 ; default option
; 0x4a36a

MenuData2_0x4a36a: ; 0x4a36a
	db $e0 ; flags
	db 2 ; items
	db "はい@"
	db "いいえ@"
; 0x4a373

Function4a373: ; 4a373 (12:6373)
	ld hl, wcfa1
	ld a, $4
	ld [hli], a
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
rept 2
	ld [hli], a
endr
	ret
; 4a39a (12:639a)

Function4a39a: ; 4a39a
	call Function4a485
	call Function4a492
	call Function4a3aa
	call SetPalettes
	ret
; 4a3a7

Function4a3a7: ; 4a3a7 (12:63a7)
	call Function4a485
Function4a3aa: ; 4a3aa
	hlcoord 0, 0
	lb bc, 3, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	hlcoord 1, 0
	ld a, $1
	lb bc, 3, 18
	call Function4a6d8
	lb bc, 1, 18
	ld a, $0
	call Function4a6d8
	lb bc, 1, 18
	ld a, $1
	call Function4a6d8
	lb bc, 1, 18
	ld a, $2
	call Function4a6d8
	lb bc, 11, 18
	ld a, " "
	call Function4a6d8
	hlcoord 19, 0
	lb bc, 3, 1
	ld a, $0
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 1, 1
	xor a
	call Function4a6d8
	lb bc, 1, 1
	ld a, $1
	call Function4a6d8
	lb bc, 4, 1
	ld a, $2
	call Function4a6d8
	lb bc, 1, 1
	ld a, $3
	call Function4a6d8
	lb bc, 1, 1
	ld a, " "
	call Function4a6d8
	ret
; 4a449 (12:6449)

Function4a449: ; 4a449
	ld bc, 3 * SCREEN_WIDTH
	ld a, $0
	hlcoord 0, 0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $0
	call ByteFill
	ld bc, 2 * SCREEN_WIDTH
	ld a, $1
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $2
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, $3
	call ByteFill
	ld bc, SCREEN_WIDTH
	ld a, " "
	call ByteFill
	ret
; 4a485

Function4a485: ; 4a485 (12:6485)
	ld de, GFX_49c0c
	ld hl, VTiles2 tile $00
	lb bc, BANK(GFX_49c0c), $d
	call Get2bpp
	ret

Function4a492: ; 4a492 (12:6492)
	call Function4936e
	ret


MainMenu_MobileStudium: ; 4a496
	ld a, [StartDay]
	ld b, a
	ld a, [StartHour]
	ld c, a
	ld a, [StartMinute]
	ld d, a
	ld a, [StartSecond]
	ld e, a
	push bc
	push de
	callba MobileStudium
	call ClearBGPalettes
	pop de
	pop bc
	ld a, b
	ld [StartDay], a
	ld a, c
	ld [StartHour], a
	ld a, d
	ld [StartMinute], a
	ld a, e
	ld [StartSecond], a
	ret
; 4a4c4


Function4a4c4: ; 4a4c4 (12:64c4)
	call ClearBGPalettes
	call Function4a3a7
	call Function4a492
	call Function4a680
	call ClearBGPalettes
	ld c, 20
	call DelayFrames
	hlcoord 2, 0
	ld b, $a
	ld c, $e
	call Function48cdc
	hlcoord 4, 2
	ld de, String_4a5c5
	call PlaceString
	hlcoord 4, 4
	ld de, String_4a5cd
	call PlaceString
	hlcoord 4, 6
	ld de, String_4a5da
	call PlaceString
	hlcoord 4, 8
	ld de, String_4a5e6
	call PlaceString
	hlcoord 4, 10
	ld de, String_4a5f2
	call PlaceString
	hlcoord 0, 12
	ld b, $4
	ld c, $12
	call TextBox
	xor a
	ld hl, Strings_4a5f6
	ld d, h
	ld e, l
	hlcoord 1, 14
	call PlaceString
	ld a, $1
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	call Function3200
	call SetPalettes
	call Function1bc9
	ld hl, MenuSelection2
	ld b, [hl]
	push bc
	jr asm_4a54d

Function4a545: ; 4a545 (12:6545)
	call Function1bd3
	ld hl, MenuSelection2
	ld b, [hl]
	push bc

asm_4a54d: ; 4a54d (12:654d)
	bit 0, a
	jr nz, .asm_4a557
	bit 1, a
	jr nz, .asm_4a574
	jr .asm_4a57e
.asm_4a557
	ld hl, MenuSelection2
	ld a, [hl]
	cp $1
	jp z, Function4a6ab
	cp $2
	jp z, Function4a6ab
	cp $3
	jp z, Function4a6ab
	cp $4
	jp z, Function4a6ab
	ld a, $1
	call Function1ff8
.asm_4a574
	pop bc
	call ClearBGPalettes
	call ClearTileMap
	jp Function49f0a
.asm_4a57e
	ld hl, MenuSelection2
	ld a, [hl]
	dec a
	add a
	push af
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 13
	ld b, $4
	ld c, $12
	call ClearBox
	hlcoord 1, 14
	call PlaceString
	pop af
	inc a
	ld hl, Strings_4a5f6
	call GetNthString
	ld d, h
	ld e, l
	hlcoord 1, 16
	call PlaceString
	jp Function4a5b0

Function4a5b0: ; 4a5b0 (12:65b0)
	call Function4a680
	pop bc
	ld hl, MenuSelection2
	ld [hl], b
	ld b, $a
	ld c, $1
	hlcoord 3, 1
	call ClearBox
	jp Function4a545
; 4a5c5 (12:65c5)

String_4a5c5: ; 4a5c5
	db "じこしょうかい@"
String_4a5cd: ; 4a5cd
	db "たいせん ", $4a, "はじまるとき@"
String_4a5da: ; 4a5da
	db "たいせん ", $1d, "かったとき@"
String_4a5e6: ; 4a5e6
	db "たいせん ", $1d, "まけたとき@"
String_4a5f2: ; 4a5f2
	db "もどる@"
; 4a5f6

Strings_4a5f6: ; 4a5f6
	db "めいし や ニュース ", $1d, "のせる@"
	db "あなた%あいさつです@"
	db "モバイル たいせん", $4a, "はじまるとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "モバイル たいせんで かったとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "モバイル たいせんで まけたとき@"
	db "あいて", $1d, "みえる あいさつです@"
	db "まえ%がめん ", $1d, "もどります@"
	db "@"
; 4a680

Function4a680: ; 4a680 (12:6680)
	ld hl, wcfa1
	ld a, $2
	ld [hli], a
	ld a, $3
	ld [hli], a
	ld a, $5
	ld [hli], a
	ld a, $1
	ld [hli], a
	ld [hl], $0
	set 5, [hl]
	inc hl
	xor a
	ld [hli], a
	ld a, $20
	ld [hli], a
	ld a, $1
	add $40
	add $80
	add $2
	ld [hli], a
	ld a, $1
rept 2
	ld [hli], a
endr
	xor a
rept 3
	ld [hli], a
endr
	ret

Function4a6ab: ; 4a6ab (12:66ab)
	ld a, $2
	call Function1ff8
	call ClearBGPalettes
	ld b, SCGB_08
	call GetSGBLayout
	callba Function11c1ab
	pop bc
	call LoadFontsExtra
	jp Function4a4c4

Function4a6c5: ; 4a6c5 (12:66c5)
	ld a, $5
	ld [MusicFade], a
	ld a, e
	ld [MusicFadeIDLo], a
	ld a, d
	ld [MusicFadeIDHi], a
	ld c, 22
	call DelayFrames
	ret

Function4a6d8: ; 4a6d8 (12:66d8)
	push bc
	push hl
.asm_4a6da
	ld [hli], a
	dec c
	jr nz, .asm_4a6da
	pop hl
	ld bc, $14
	add hl, bc
	pop bc
	dec b
	jr nz, Function4a6d8
	ret


SpecialBeastsCheck: ; 0x4a6e8
; Check if the player owns all three legendary beasts.
; They must exist in either party or PC, and have the player's OT and ID.
; Return the result in ScriptVar.

	ld a, RAIKOU
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	ld a, ENTEI
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	ld a, SUICUNE
	ld [ScriptVar], a
	call CheckOwnMonAnywhere
	jr nc, .notexist

	; they exist
	ld a, 1
	ld [ScriptVar], a
	ret

.notexist
	xor a
	ld [ScriptVar], a
	ret


SpecialMonCheck: ; 0x4a711
; Check if the player owns any monsters of the species in ScriptVar.
; Return the result in ScriptVar.

	call CheckOwnMonAnywhere
	jr c, .exists

	; doesn't exist
	xor a
	ld [ScriptVar], a
	ret

.exists
	ld a, 1
	ld [ScriptVar], a
	ret


CheckOwnMonAnywhere: ; 0x4a721
; Check if the player owns any monsters of the species in ScriptVar.
; It must exist in either party or PC, and have the player's OT and ID.

	; If there are no monsters in the party,
	; the player must not own any yet.
	ld a, [PartyCount]
	and a
	ret z

	ld d, a
	ld e, 0
	ld hl, PartyMon1Species
	ld bc, PartyMonOT

	; Run CheckOwnMon on each Pokémon in the party.
.partymon
	call CheckOwnMon
	ret c ; found!

	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .partymon

	; Run CheckOwnMon on each Pokémon in the PC.
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .boxes

	ld d, a
	ld hl, sBoxMon1Species
	ld bc, sBoxMonOT
.openboxmon
	call CheckOwnMon
	jr nc, .loop

	; found!
	call CloseSRAM
	ret

.loop
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .openboxmon

	; Run CheckOwnMon on each monster in the other 13 PC boxes.
.boxes
	call CloseSRAM

	ld c, 0
.box
	; Don't search the current box again.
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .loopbox

	; Load the box.
	ld hl, BoxAddressTable1
	ld b, 0
rept 3
	add hl, bc
endr
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a

	; Number of monsters in the box
	ld a, [hl]
	and a
	jr z, .loopbox

	push bc

	push hl
	ld de, sBoxMons - sBoxCount
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, sBoxMonOT - sBoxCount
	add hl, de
	ld b, h
	ld c, l
	pop hl

	ld d, a

.boxmon
	call CheckOwnMon
	jr nc, .loopboxmon

	; found!
	pop bc
	call CloseSRAM
	ret

.loopboxmon
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call UpdateOTPointer
	dec d
	jr nz, .boxmon
	pop bc

.loopbox
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .box

	; not found
	call CloseSRAM
	and a
	ret


CheckOwnMon: ; 0x4a7ba
; Check if a Pokémon belongs to the player and is of a specific species.

; inputs:
; hl, pointer to PartyMonNSpecies
; bc, pointer to PartyMonNOT
; ScriptVar should contain the species we're looking for

; outputs:
; sets carry if monster matches species, ID, and OT name.

	push bc
	push hl
	push de
	ld d, b
	ld e, c

; check species
	ld a, [ScriptVar] ; species we're looking for
	ld b, [hl] ; species we have
	cp b
	jr nz, .notfound ; species doesn't match

; check ID number
	ld bc, MON_ID
	add hl, bc ; now hl points to ID number
	ld a, [PlayerID]
	cp [hl]
	jr nz, .notfound ; ID doesn't match
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	jr nz, .notfound ; ID doesn't match

; check OT
; This only checks five characters, which is fine for the Japanese version,
; but in the English version the player name is 7 characters, so this is wrong.

	ld hl, PlayerName

	rept 4
	ld a, [de]
	cp [hl]
	jr nz, .notfound
	cp "@"
	jr z, .found ; reached end of string
	inc hl
	inc de
	endr

	ld a, [de]
	cp [hl]
	jr z, .found

.notfound
	pop de
	pop hl
	pop bc
	and a
	ret

.found
	pop de
	pop hl
	pop bc
	scf
	ret
; 0x4a810

BoxAddressTable1: ; 4a810
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; 4a83a

UpdateOTPointer: ; 0x4a83a
	push hl
	ld hl, NAME_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret
; 0x4a843


MobileCheckOwnMonAnywhere: ; 4a843
; Like CheckOwnMonAnywhere, but only check for species.
; OT/ID don't matter.

	ld a, [PartyCount]
	and a
	ret z

	ld d, a
	ld e, 0
	ld hl, PartyMon1Species
	ld bc, PartyMonOT
.asm_4a851
	call Function4a8dc
	ret c
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call Function4a91e
	dec d
	jr nz, .asm_4a851
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .asm_4a888
	ld d, a
	ld hl, sBoxMon1Species
	ld bc, sBoxMonOT
.asm_4a873
	call Function4a8dc
	jr nc, .asm_4a87c
	call CloseSRAM
	ret

.asm_4a87c
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call Function4a91e
	dec d
	jr nz, .asm_4a873

.asm_4a888
	call CloseSRAM
	ld c, 0
.asm_4a88d
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .asm_4a8d1
	ld hl, BoxAddressTable2
	ld b, 0
rept 3
	add hl, bc
endr
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	and a
	jr z, .asm_4a8d1
	push bc
	push hl
	ld de, sBoxMons - sBoxCount
	add hl, de
	ld d, h
	ld e, l
	pop hl
	push de
	ld de, sBoxMonOT - sBoxCount
	add hl, de
	ld b, h
	ld c, l
	pop hl
	ld d, a
.asm_4a8ba
	call Function4a8dc
	jr nc, .asm_4a8c4
	pop bc
	call CloseSRAM
	ret

.asm_4a8c4
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	call Function4a91e
	dec d
	jr nz, .asm_4a8ba
	pop bc

.asm_4a8d1
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .asm_4a88d
	call CloseSRAM
	and a
	ret
; 4a8dc

Function4a8dc: ; 4a8dc
	push bc
	push hl
	push de
	ld d, b
	ld e, c
	ld a, [ScriptVar]
	ld b, [hl]
	cp b
	jr nz, .no_match
	jr .match

.no_match
	pop de
	pop hl
	pop bc
	and a
	ret

.match
	pop de
	pop hl
	pop bc
	scf
	ret
; 4a8f4

BoxAddressTable2: ; 4a8f4
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; 4a91e

Function4a91e: ; 4a91e
	push hl
	ld hl, NAME_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	ret
; 4a927


Function4a927: ; 4a927
	ld a, [ScriptVar]
	ld [CurItem], a
	ld hl, PCItems
	call CheckItem
	jr c, .asm_4a948

	ld a, [ScriptVar]
	ld [CurItem], a
	ld hl, NumItems
	call CheckItem
	jr c, .asm_4a948

	xor a
	ld [ScriptVar], a
	ret

.asm_4a948
	ld a, 1
	ld [ScriptVar], a
	ret
; 4a94e

Function4a94e: ; 4a94e
	call FadeToMenu
	ld a, -1
	ld hl, wd002
	ld bc, 3
	call ByteFill
	xor a
	ld [wd018], a
	ld [wd019], a
	ld b, SCGB_14
	call GetSGBLayout
	call SetPalettes
	call Function4aa22
	jr c, .asm_4a985
	jr z, .asm_4a9a1
	jr .asm_4a97b

.asm_4a974
	call Function4aa25
	jr c, .asm_4a985
	jr z, .asm_4a9a1

.asm_4a97b
	call Function4ac58
	ld hl, wd019
	res 1, [hl]
	jr .asm_4a974

.asm_4a985
	ld a, [wd018]
	and a
	jr nz, .asm_4a990
	call Function4aba8
	jr c, .asm_4a974

.asm_4a990
	call Function2b3c
	ld hl, wd002
	ld a, -1
	ld bc, 3
	call ByteFill
	scf
	jr .asm_4a9af

.asm_4a9a1
	call Function4a9c3
	jr c, .asm_4a9b0
	call Function4a9d7
	jr c, .asm_4a974
	call Function2b3c
	and a

.asm_4a9af
	ret

.asm_4a9b0
	ld de, SFX_WRONG
	call PlaySFX
	ld hl, UnknownText_0x4a9be
	call PrintText
	jr .asm_4a974
; 4a9be

UnknownText_0x4a9be: ; 0x4a9be
	; Pick three #MON for battle.
	text_jump UnknownText_0x1c51d7
	db "@"
; 0x4a9c3

Function4a9c3: ; 4a9c3
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	inc hl
	cp [hl]
	jr z, .asm_4a9d5
	and a
	ret

.asm_4a9d5
	scf
	ret
; 4a9d7

Function4a9d7: ; 4a9d7
	ld a, [wd002]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, EndFlypoint
	ld bc, 6
	call CopyBytes
	ld a, [wd003]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, wd00c
	ld bc, 6
	call CopyBytes
	ld a, [wd004]
	ld hl, PartyMonNicknames
	call GetNick
	ld h, d
	ld l, e
	ld de, wd012
	ld bc, 6
	call CopyBytes
	ld hl, UnknownText_0x4aa1d
	call PrintText
	call YesNoBox
	ret
; 4aa1d

UnknownText_0x4aa1d: ; 0x4aa1d
	; , @  and @ . Use these three?
	text_jump UnknownText_0x1c51f4
	db "@"
; 0x4aa22

Function4aa22: ; 4aa22
	call ClearBGPalettes

Function4aa25: ; 4aa25
	callba Function5004f
	callba Function50405
	call Function4aad3

Function4aa34: ; 4aa34
	ld a, $9
	ld [PartyMenuActionText], a
	callba WritePartyMenuTilemap
	xor a
	ld [PartyMenuActionText], a
	callba PrintPartyMenuText
	call Function4aab6
	call WaitBGMap
	call SetPalettes
	call DelayFrame
	call Function4ab1a
	jr z, .asm_4aa66
	push af
	call Function4aafb
	jr c, .asm_4aa67
	call Function4ab06
	jr c, .asm_4aa67
	pop af

.asm_4aa66
	ret

.asm_4aa67
	ld hl, wd019
	set 1, [hl]
	pop af
	ret
; 4aa6e

Function4aa6e: ; 4aa6e
	pop af
	ld de, SFX_WRONG
	call PlaySFX
	call WaitSFX
	jr Function4aa34
; 4aa7a

Function4aa7a: ; 4aa7a
	ld hl, wd002
	ld d, $3
.loop
	ld e, PARTY_LENGTH
	ld a, [hli]
	push de
	push hl
	cp -1
	jr z, .done
	ld hl, wc314
	inc a
	ld d, a
.inner_loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .same_as_d
	jr .next

	ld a, $3
	jr .proceed

.same_as_d
	ld a, $2

.proceed
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .inner_loop
	pop hl
	pop de
	dec d
	jr nz, .loop
	jr .finished

.done
	pop hl
	pop de

.finished
	ret
; 4aab6

Function4aab6: ; 4aab6
	ld hl, wd002
	ld d, $3
.loop
	ld a, [hli]
	cp -1
	jr z, .done
	push de
	push hl
	hlcoord 0, 1
	ld bc, $28
	call AddNTimes
	ld [hl], $ec
	pop hl
	pop de
	dec d
	jr nz, .loop

.done
	ret
; 4aad3

Function4aad3: ; 4aad3
	ld hl, PartyCount
	ld a, [hli]
	and a
	ret z ; Nothing in your party

	ld c, a
	xor a
	ld [hObjectStructIndexBuffer], a
.loop
	push bc
	push hl
	ld e, 0
	callba Function8e83f
	ld a, [hObjectStructIndexBuffer]
	inc a
	ld [hObjectStructIndexBuffer], a
	pop hl
	pop bc
	dec c
	jr nz, .loop

	call Function4aa7a
	callba Function8cf69
	ret
; 4aafb

Function4aafb: ; 4aafb
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .egg
	and a
	ret

.egg
	scf
	ret
; 4ab06

Function4ab06: ; 4ab06
	ld a, [CurPartyMon]
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, PartyMon1HP
	call AddNTimes
	ld a, [hli]
	ld b, a
	ld a, [hl]
	or b
	jr nz, .NotFainted
	scf

.NotFainted
	ret
; 4ab1a

Function4ab1a: ; 4ab1a
.asm_4ab1a
	ld a, $fb
	ld [wcfa8], a
	ld a, $26
	ld [wcfa7], a
	ld a, $2
	ld [wcfa4], a
	call Function4adf7
	call Function1bc9
	call Function4abc3
	jr c, .asm_4ab1a
	push af
	call Function4ab99
	call nc, Function1bee
	pop af
	bit 1, a
	jr nz, .asm_4ab6d
	ld a, [PartyCount]
	inc a
	ld b, a
	ld a, [MenuSelection2]
	ld [wd0d8], a
	cp b
	jr z, .asm_4ab7e
	ld a, [MenuSelection2]
	dec a
	ld [CurPartyMon], a
	ld c, a
	ld b, $0
	ld hl, PartySpecies
	add hl, bc
	ld a, [hl]
	ld [CurPartySpecies], a
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	ld a, $1
	and a
	ret

.asm_4ab6d
	ld a, [MenuSelection2]
	ld [wd0d8], a
.asm_4ab73
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	scf
	ret

.asm_4ab7e
	ld a, $1
	ld [wd018], a
	ld a, [wcfaa]
	cp $2
	jr z, .asm_4ab73
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	call WaitSFX
	xor a
	ld [wd018], a
	and a
	ret
; 4ab99

Function4ab99: ; 4ab99
	bit 1, a
	jr z, .asm_4aba6
	ld a, [wd002]
	cp $ff
	jr z, .asm_4aba6
	scf
	ret

.asm_4aba6
	and a
	ret
; 4aba8

Function4aba8: ; 4aba8
	ld hl, wd004
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	dec hl
	ld a, [hl]
	cp $ff
	jr nz, .asm_4abbe
	and a
	ret

.asm_4abbe
	ld a, $ff
	ld [hl], a
	scf
	ret
; 4abc3

Function4abc3: ; 4abc3
	bit 3, a
	jr z, .asm_4abd5
	ld a, [PartyCount]
	inc a
	ld [MenuSelection2], a
	ld a, $1
	ld [wcfaa], a
	jr .asm_4ac29

.asm_4abd5
	bit 6, a
	jr z, .asm_4abeb
	ld a, [MenuSelection2]
	ld [MenuSelection2], a
	and a
	jr nz, .asm_4ac29
	ld a, [PartyCount]
	inc a
	ld [MenuSelection2], a
	jr .asm_4ac29

.asm_4abeb
	bit 7, a
	jr z, .asm_4ac08
	ld a, [MenuSelection2]
	ld [MenuSelection2], a
	ld a, [PartyCount]
rept 2
	inc a
endr
	ld b, a
	ld a, [MenuSelection2]
	cp b
	jr nz, .asm_4ac29
	ld a, $1
	ld [MenuSelection2], a
	jr .asm_4ac29

.asm_4ac08
	bit 4, a
	jr nz, .asm_4ac10
	bit 5, a
	jr z, .asm_4ac56

.asm_4ac10
	ld a, [MenuSelection2]
	ld b, a
	ld a, [PartyCount]
	inc a
	cp b
	jr nz, .asm_4ac29
	ld a, [wcfaa]
	cp $1
	jr z, .asm_4ac26
	ld a, $1
	jr .asm_4ac29

.asm_4ac26
	ld [wcfaa], a

.asm_4ac29
	hlcoord 0, 1
	lb bc, 13, 1
	call ClearBox
	call Function4aab6
	ld a, [PartyCount]
	hlcoord 6, 1
.asm_4ac3b
	ld bc, $28
	add hl, bc
	dec a
	jr nz, .asm_4ac3b
	ld [hl], $7f
	ld a, [MenuSelection2]
	ld b, a
	ld a, [PartyCount]
	inc a
	cp b
	jr z, .asm_4ac54
	ld a, $1
	ld [wcfaa], a

.asm_4ac54
	scf
	ret

.asm_4ac56
	and a
	ret
; 4ac58

Function4ac58: ; 4ac58
	lb bc, 2, 18
	hlcoord 1, 15
	call ClearBox
	callba Function8ea4a
	ld hl, MenuDataHeader_0x4aca2
	call LoadMenuDataHeader
	ld hl, wd019
	bit 1, [hl]
	jr z, .asm_4ac89
	hlcoord 11, 13
	ld b, $3
	ld c, $7
	call TextBox
	hlcoord 13, 14
	ld de, String_4ada7
	call PlaceString
	jr .asm_4ac96

.asm_4ac89
	hlcoord 11, 9
	ld b, $7
	ld c, $7
	call TextBox
	call Function4ad68

.asm_4ac96
	ld a, $1
	ld [hBGMapMode], a
	call Function4acaa
	call ExitMenu
	and a
	ret
; 4aca2

MenuDataHeader_0x4aca2: ; 0x4aca2
	db $40 ; flags
	db 09, 11 ; start coords
	db 17, 19 ; end coords
	dw NULL
	db 1 ; default option
; 0x4acaa

Function4acaa: ; 4acaa
.asm_4acaa
	ld a, $a0
	ld [wMenuData2Flags], a
	ld a, [wd019]
	bit 1, a
	jr z, .asm_4acc2
	ld a, $2
	ld [wMenuData2Items], a
	ld a, $c
	ld [wMenuBorderTopCoord], a
	jr .asm_4accc

.asm_4acc2
	ld a, $4
	ld [wMenuData2Items], a
	ld a, $8
	ld [wMenuBorderTopCoord], a

.asm_4accc
	ld a, $b
	ld [wMenuBorderLeftCoord], a
	ld a, $1
	ld [wMenuCursorBuffer], a
	call Function1c10
	ld hl, wcfa5
	set 6, [hl]
	call Function1bc9
	ld de, SFX_READ_TEXT_2
	call PlaySFX
	ld a, [hJoyPressed]
	bit 0, a
	jr nz, .asm_4acf4
	bit 1, a
	jr nz, .asm_4acf3
	jr .asm_4acaa

.asm_4acf3
	ret

.asm_4acf4
	ld a, [wd019]
	bit 1, a
	jr nz, .asm_4ad0e
	ld a, [MenuSelection2]
	cp $1
	jr z, Function4ad17
	cp $2
	jp z, Function4ad56
	cp $3
	jp z, Function4ad60
	jr .asm_4acf3

.asm_4ad0e
	ld a, [MenuSelection2]
	cp $1
	jr z, Function4ad56
	jr .asm_4acf3

Function4ad17: ; 4ad17
	call Function4adb2
	jr z, .asm_4ad4a
	ld hl, wd002
	ld a, $ff
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	inc hl
	cp [hl]
	jr z, .asm_4ad39
	ld de, SFX_WRONG
	call WaitPlaySFX
	ld hl, UnknownText_0x4ad51
	call PrintText
	ret

.asm_4ad39
	ld a, [CurPartyMon]
	ld [hl], a
	call Function4a9c3
	ret c
	ld a, [wd019]
	set 0, a
	ld [wd019], a
	ret

.asm_4ad4a
	ld a, $ff
	ld [hl], a
	call Function4adc2
	ret

UnknownText_0x4ad51: ; 0x4ad51
	; Only three #MON may enter.
	text_jump UnknownText_0x1c521c
	db "@"
; 0x4ad56

Function4ad56: ; 4ad56
	callba OpenPartyStats
	call Function3200
	ret
; 4ad60

Function4ad60: ; 4ad60
	callba ManagePokemonMoves
	ret
; 4ad67

Function4ad67: ; 4ad67
	ret
; 4ad68

Function4ad68: ; 4ad68
	hlcoord 13, 12
	ld de, String_4ad88
	call PlaceString
	call Function4adb2
	jr c, .asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ada0
	jr .asm_4ad84

.asm_4ad7e
	hlcoord 13, 10
	ld de, String_4ad9a

.asm_4ad84
	call PlaceString
	ret
; 4ad88

String_4ad88: ; 4ad88
	db   "つよさをみる"
	next "つかえるわざ"
	next "もどる@"
; 4ad9a

String_4ad9a: ; 4ad9a
	db   "さんかする@"
; 4ada0

String_4ada0: ; 4ada0
	db   "さんかしない@"
; 4ada7

String_4ada7: ; 4ada7
	db   "つよさをみる"
	next "もどる@" ; BACK
; 4adb2

Function4adb2: ; 4adb2
	ld hl, wd002
	ld a, [CurPartyMon]
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	inc hl
	cp [hl]
	ret z
	scf
	ret
; 4adc2

Function4adc2: ; 4adc2
	ld a, [wd002]
	cp $ff
	jr nz, .asm_4ade5
	ld a, [wd003]
	cp $ff
	jr nz, .asm_4addd
	ld a, [wd004]
	ld [wd002], a
	ld a, $ff
	ld [wd004], a
	jr .asm_4ade5

.asm_4addd
	ld [wd002], a
	ld a, $ff
	ld [wd003], a

.asm_4ade5
	ld a, [wd003]
	cp $ff
	ret nz
	ld b, a
	ld a, [wd004]
	ld [wd003], a
	ld a, b
	ld [wd004], a
	ret
; 4adf7

Function4adf7: ; 4adf7
	ld a, [wd019]
	bit 0, a
	ret z
	ld a, [PartyCount]
	inc a
	ld [MenuSelection2], a
	ld a, $1
	ld [wcfaa], a
	ld a, [wd019]
	res 0, a
	ld [wd019], a
	ret
; 4ae12

Function4ae12: ; 4ae12
	call Function4ae1f
	ld a, $0
	jr c, .asm_4ae1b
	ld a, $1

.asm_4ae1b
	ld [ScriptVar], a
	ret
; 4ae1f

Function4ae1f: ; 4ae1f
	lb bc, 14, 7
	push bc
	ld hl, YesNoMenuDataHeader
	call CopyMenuDataHeader
	pop bc
	ld a, b
	ld [wMenuBorderLeftCoord], a
	add $5
	ld [wMenuBorderRightCoord], a
	ld a, c
	ld [wMenuBorderTopCoord], a
	add $4
	ld [wMenuBorderBottomCoord], a
	call BackUpTiles
	call InterpretMenu2
	push af
	ld c, 15
	call DelayFrames
	call Function4ae5e
	pop af
	jr c, .asm_4ae57
	ld a, [MenuSelection2]
	cp $2
	jr z, .asm_4ae57
	and a
	ret

.asm_4ae57
	ld a, $2
	ld [MenuSelection2], a
	scf
	ret
; 4ae5e

Function4ae5e: ; 4ae5e
	ld a, [hOAMUpdate]
	push af
	call ExitMenu
	call UpdateSprites
	xor a
	ld [hOAMUpdate], a
	call DelayFrame
	ld a, $1
	ld [hOAMUpdate], a
	call Function321c
	pop af
	ld [hOAMUpdate], a
	ret
; 4ae78


SECTION "bank13", ROMX, BANK[$13]

SwapTextboxPalettes:: ; 4c000
	hlcoord 0, 0
	decoord 0, 0, AttrMap
	ld b, $12
.loop
	push bc
	ld c, SCREEN_WIDTH
.innerloop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .innerloop
	pop bc
	dec b
	jr nz, .loop
	ret
; 4c03f

ScrollBGMapPalettes:: ; 4c03f
	ld hl, BGMapBuffer
	ld de, BGMapPalBuffer
.loop
	ld a, [hl]
	push hl
	srl a
	jr c, .UpperNybble

; .LowerNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	and $f
	jr .next

.UpperNybble
	ld hl, TilesetPalettes
	add [hl]
	ld l, a
	ld a, [TilesetPalettes + 1]
	adc $0
	ld h, a
	ld a, [hl]
	swap a
	and $f

.next
	pop hl
	ld [de], a
	res 7, [hl]
	inc hl
	inc de
	dec c
	jr nz, .loop
	ret
; 4c075


INCLUDE "tilesets/palette_maps.asm"


TileCollisionTable:: ; 4ce1f
; 00 land
; 01 water
; 0f wall
; 11 talkable water
; 1f talkable wall

	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, TALK + WATRTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WALLTILE, NULL + WALLTILE, TALK + WALLTILE, NULL + LANDTILE, TALK + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WATRTILE
	db NULL + WALLTILE, NULL + WALLTILE, TALK + WALLTILE, NULL + LANDTILE, TALK + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WATRTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE

	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE

	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE
	db NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE, NULL + WATRTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE

	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE, NULL + WALLTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE
	db NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + LANDTILE, NULL + WATRTILE
; 4cf1f

EmptyAllSRAMBanks: ; 4cf1f
	ld a, $0
	call .EmptyBank
	ld a, $1
	call .EmptyBank
	ld a, $2
	call .EmptyBank
	ld a, $3
	call .EmptyBank
	ret
; 4cf34

.EmptyBank: ; 4cf34
	call GetSRAMBank
	ld hl, SRAM_Begin
	ld bc, SRAM_End - SRAM_Begin
	xor a
	call ByteFill
	call CloseSRAM
	ret
; 4cf45


Function4cf45: ; 4cf45 (13:4f45)
	ld a, [hCGB]
	and a
	jp z, WaitBGMap

; The following is a modified version of Function3246.
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.WaitLY
	ld a, [rLY]
	cp $60
	jr c, .WaitLY

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call Function4cf80
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call Function4cf80
.WaitLY2
	ld a, [rLY]
	cp $60
	jr c, .WaitLY2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret

Function4cf80: ; 4cf80 (13:4f80)
	ld [hSPBuffer], sp ; $ffd9
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret


CheckSave:: ; 4cffe
	ld a, BANK(s1_a008)
	call GetSRAMBank
	ld a, [s1_a008]
	ld b, a
	ld a, [s1_ad0f]
	ld c, a
	call CloseSRAM
	ld a, b
	cp 99
	jr nz, .ok
	ld a, c
	cp " "
	jr nz, .ok
	ld c, $1
	ret

.ok
	ld c, $0
	ret
; 4d01e


INCLUDE "engine/map_triggers.asm"


Function4d15b:: ; 4d15b
	ld hl, wc608
	ld a, [wd196]
	and a
	jr z, .skip
	ld bc, $30
	add hl, bc

.skip
	ld a, [wd197]
	and a
	jr z, .next_dw
rept 2
	inc hl
endr

.next_dw
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.loop
	ld c, SCREEN_WIDTH
.loop2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop2
	ld a, l
	add 4
	ld l, a
	jr nc, .carry
	inc h

.carry
	dec b
	jr nz, .loop
	ret
; 4d188

Function4d188: ; 4d188
	ld a, [hCGB]
	and a
	jp z, WaitBGMap
	ld a, [wc2ce]
	cp $0
	jp z, WaitBGMap

; What follows is a modified version of Function3246 (LoadEDTile).
	ld a, [hBGMapMode]
	push af
	xor a
	ld [hBGMapMode], a
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
.wait
	ld a, [rLY]
	cp $8f
	jr c, .wait

	di
	ld a, 1 ; BANK(VBGMap2)
	ld [rVBK], a
	hlcoord 0, 0, AttrMap
	call Function4d1cb
	ld a, 0 ; BANK(VBGMap0)
	ld [rVBK], a
	hlcoord 0, 0
	call Function4d1cb
.wait2
	ld a, [rLY]
	cp $8f
	jr c, .wait2
	ei

	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 4d1cb

Function4d1cb: ; 4d1cb
	ld [hSPBuffer], sp
	ld sp, hl
	ld a, [hBGMapAddress + 1]
	ld h, a
	ld l, 0
	ld a, SCREEN_HEIGHT
	ld [hTilesPerCycle], a
	ld b, 1 << 1 ; not in v/hblank
	ld c, rSTAT % $100

.loop
rept SCREEN_WIDTH / 2
	pop de
.loop\@
	ld a, [$ff00+c]
	and b
	jr nz, .loop\@
	ld [hl], e
	inc l
	ld [hl], d
	inc l
endr

	ld de, $20 - SCREEN_WIDTH
	add hl, de
	ld a, [hTilesPerCycle]
	dec a
	ld [hTilesPerCycle], a
	jr nz, .loop

	ld a, [hSPBuffer]
	ld l, a
	ld a, [hSPBuffer + 1]
	ld h, a
	ld sp, hl
	ret
; 4d249

Shrink1Pic: ; 4d249
INCBIN "gfx/shrink1.2bpp.lz"

Shrink2Pic: ; 4d2d9
INCBIN "gfx/shrink2.2bpp.lz"
; 4d319

Function4d319: ; 4d319
	ld a, [MenuSelection2]
	dec a
	ld [CurPartyMon], a
	call LowVolume
	predef StatsScreenInit
	ld a, [CurPartyMon]
	inc a
	ld [MenuSelection2], a
	call ClearScreen
	call ClearBGPalettes
	call MaxVolume
	callba Function28ef8
	callba Function4d354
	callba Function16d673
	callba Function28eff
	call Function3200
	ret
; 4d354

Function4d354: ; 4d354
	call WaitBGMap
	call Function3200
	ret
; 4d35b


Function4d35b: ; 4d35b
	ld h, d
	ld l, e
	push bc
	push hl
	call Function4d37e
	pop hl
	pop bc
	ld de, AttrMap - TileMap
	add hl, de
rept 2
	inc b
endr
rept 2
	inc c
endr
	ld a, $7
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop bc
	dec b
	jr nz, .row
	ret
; 4d37e

Function4d37e: ; 4d37e
	push hl
	ld a, $76
	ld [hli], a
	inc a
	call Function4d3ab
	inc a
	ld [hl], a
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
.loop
	push hl
	ld a, "┌"
	ld [hli], a
	ld a, " "
	call Function4d3ab
	ld [hl], "─"
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec b
	jr nz, .loop
	ld a, "┐"
	ld [hli], a
	ld a, "│"
	call Function4d3ab
	ld [hl], "└"
	ret
; 4d3ab

Function4d3ab: ; 4d3ab
	ld d, c
.loop
	ld [hli], a
	dec d
	jr nz, .loop
	ret
; 4d3b1

_ResetClock: ; 4d3b1
	callba Function8000
	ld b, SCGB_08
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, .text_askreset
	call PrintText
	ld hl, .NoYes_MenuDataHeader
	call CopyMenuDataHeader
	call InterpretMenu2
	ret c
	ld a, [MenuSelection2]
	cp $1
	ret z
	call ClockResetPassword
	jr c, .wrongpassword
	ld a, BANK(s0_ac60)
	call GetSRAMBank
	ld a, $80
	ld [s0_ac60], a
	call CloseSRAM
	ld hl, .text_okay
	call PrintText
	ret

.wrongpassword
	ld hl, .text_wrong
	call PrintText
	ret
; 4d3fe

.text_okay: ; 0x4d3fe
	; Password OK. Select CONTINUE & reset settings.
	text_jump UnknownText_0x1c55db
	db "@"
; 0x4d403

.text_wrong: ; 0x4d403
	; Wrong password!
	text_jump UnknownText_0x1c560b
	db "@"
; 0x4d408

.text_askreset: ; 0x4d408
	; Reset the clock?
	text_jump UnknownText_0x1c561c
	db "@"
; 0x4d40d

.NoYes_MenuDataHeader: ; 0x4d40d
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw .NoYes_MenuData2
	db 1 ; default option
; 0x4d415

.NoYes_MenuData2: ; 0x4d415
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
; 0x4d41e

ClockResetPassword: ; 4d41e
	call .CalculatePassword
	push de
	ld hl, StringBuffer2
	ld bc, 5
	xor a
	call ByteFill
	ld a, $4
	ld [StringBuffer2 + 5], a
	ld hl, .pleaseenterpasswordtext
	call PrintText
.loop
	call .updateIDdisplay
.loop2
	call JoyTextDelay
	ld a, [hJoyLast]
	ld b, a
	and A_BUTTON
	jr nz, .confirm
	ld a, b
	and D_PAD
	jr z, .loop2
	call .dpadinput
	ld c, 3
	call DelayFrames
	jr .loop

.confirm
	call .ConvertDecIDToBytes
	pop de
	ld a, e
	cp l
	jr nz, .nope
	ld a, d
	cp h
	jr nz, .nope
	and a
	ret

.nope
	scf
	ret
; 4d463

.pleaseenterpasswordtext: ; 0x4d463
	; Please enter the password.
	text_jump UnknownText_0x1c562e
	db "@"
; 0x4d468

.updateIDdisplay: ; 4d468
	hlcoord 14, 15
	ld de, StringBuffer2
	ld c, 5
.loop3
	ld a, [de]
	add "0"
	ld [hli], a
	inc de
	dec c
	jr nz, .loop3
	hlcoord 14, 16
	ld bc, 5
	ld a, " "
	call ByteFill
	hlcoord 14, 16
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $61
	ret
; 4d490

.dpadinput: ; 4d490
	ld a, b
	and D_LEFT
	jr nz, .left
	ld a, b
	and D_RIGHT
	jr nz, .right
	ld a, b
	and D_UP
	jr nz, .up
	ld a, b
	and D_DOWN
	jr nz, .down
	ret

.left
	ld a, [StringBuffer2 + 5]
	and a
	ret z
	dec a
	ld [StringBuffer2 + 5], a
	ret

.right
	ld a, [StringBuffer2 + 5]
	cp $4
	ret z
	inc a
	ld [StringBuffer2 + 5], a
	ret

.up
	call .getcurrentdigit
	ld a, [hl]
	cp 9
	jr z, .wraparound_up
	inc a
	ld [hl], a
	ret

.wraparound_up
	ld [hl], $0
	ret

.down
	call .getcurrentdigit
	ld a, [hl]
	and a
	jr z, .wraparound_down
	dec a
	ld [hl], a
	ret

.wraparound_down
	ld [hl], 9
	ret
; 4d4d5

.getcurrentdigit: ; 4d4d5
	ld a, [StringBuffer2 + 5]
	ld e, a
	ld d, $0
	ld hl, StringBuffer2
	add hl, de
	ret
; 4d4e0

.ConvertDecIDToBytes: ; 4d4e0
	ld hl, 0
	ld de, StringBuffer2 + 4
	ld bc, 1
	call .ConvertToBytes
	ld bc, 10
	call .ConvertToBytes
	ld bc, 100
	call .ConvertToBytes
	ld bc, 1000
	call .ConvertToBytes
	ld bc, 10000
.ConvertToBytes: ; 4d501
	ld a, [de]
	dec de
	push hl
	ld hl, 0
	call AddNTimes
	ld c, l
	ld b, h
	pop hl
	add hl, bc
	ret
; 4d50f

.CalculatePassword: ; 4d50f
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld de, 0
	ld hl, sPlayerData + (PlayerID - wPlayerData)
	ld c, $2
	call .ComponentFromNumber
	ld hl, sPlayerData + (PlayerName - wPlayerData)
	ld c, $5
	call .ComponentFromString
	ld hl, sPlayerData + (Money - wPlayerData)
	ld c, $3
	call .ComponentFromNumber
	call CloseSRAM
	ret
; 4d533

.ComponentFromNumber: ; 4d533
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromNumber
	ret
; 4d53e

.ComponentFromString: ; 4d53e
	ld a, [hli]
	cp "@"
	ret z
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec c
	jr nz, .ComponentFromString
	ret
; 4d54c

Function4d54c: ; 4d54c
	callba Function8000
	ld b, SCGB_08
	call GetSGBLayout
	call LoadStandardFont
	call LoadFontsExtra
	ld de, MUSIC_MAIN_MENU
	call PlayMusic
	ld hl, UnknownText_0x4d580
	call PrintText
	ld hl, MenuDataHeader_0x4d585
	call CopyMenuDataHeader
	call InterpretMenu2
	ret c
	ld a, [MenuSelection2]
	cp $1
	ret z
	callba EmptyAllSRAMBanks
	ret
; 4d580

UnknownText_0x4d580: ; 0x4d580
	; Clear all save data?
	text_jump UnknownText_0x1c564a
	db "@"
; 0x4d585

MenuDataHeader_0x4d585: ; 0x4d585
	db $00 ; flags
	db 07, 14 ; start coords
	db 11, 19 ; end coords
	dw MenuData2_0x4d58d
	db 1 ; default option
; 0x4d58d

MenuData2_0x4d58d: ; 0x4d58d
	db $c0 ; flags
	db 2 ; items
	db "NO@"
	db "YES@"
; 0x4d596

Tilesets::
INCLUDE "tilesets/tileset_headers.asm"


FlagPredef: ; 4d7c1
; Perform action b on flag c in flag array hl.
; If checking a flag, check flag array d:hl unless d is 0.

; For longer flag arrays, see FlagAction.

	push hl
	push bc

; Divide by 8 to get the byte we want.
	push bc
	srl c
	srl c
	srl c
	ld b, 0
	add hl, bc
	pop bc

; Which bit we want from the byte
	ld a, c
	and 7
	ld c, a

; Shift left until we can mask the bit
	ld a, 1
	jr z, .shifted
.shift
	add a
	dec c
	jr nz, .shift
.shifted
	ld c, a

; What are we doing to this flag?
	dec b
	jr z, .set ; 1
	dec b
	jr z, .check ; 2

.reset
	ld a, c
	cpl
	and [hl]
	ld [hl], a
	jr .done

.set
	ld a, [hl]
	or c
	ld [hl], a
	jr .done

.check
	ld a, d
	cp 0
	jr nz, .farcheck

	ld a, [hl]
	and c
	jr .done

.farcheck
	call GetFarByte
	and c

.done
	pop bc
	pop hl
	ld c, a
	ret
; 4d7fd

Function4d7fd: ; 4d7fd
	ld a, [wc702]
	ld hl, wEnemyTrappingMove
	ld de, VTiles2
	push de
	push af
	predef GetUnownLetter
	pop af
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	pop de
	predef Function5108b
	ret
; 4d81e

Function4d81e: ; 4d81e
	ld a, [wc702]
	call IsAPokemon
	ret c
	callba Function29549
	ld a, [wc702]
	ld [CurPartySpecies], a
	ld a, [wEnemyTrappingMove]
	ld [TempMonDVs], a
	ld a, [wPlayerWrapCount]
	ld [TempMonDVs + 1], a
	ld b, SCGB_1A
	call GetSGBLayout
	ld a, $e4
	call DmgToCgbBGPals
	callba Function294c0
	ld a, [wc702]
	ld [CurPartySpecies], a
	hlcoord 7, 2
	ld d, $0
	ld e, ANIM_MON_TRADE
	predef AnimateFrontpic
	ret
; 4d860

CheckPokerus: ; 4d860
; Return carry if a monster in your party has Pokerus

; Get number of monsters to iterate over
	ld a, [PartyCount]
	and a
	jr z, .NoPokerus
	ld b, a
; Check each monster in the party for Pokerus
	ld hl, PartyMon1PokerusStatus
	ld de, PARTYMON_STRUCT_LENGTH
.Check
	ld a, [hl]
	and $0f ; only the bottom nybble is used
	jr nz, .HasPokerus
; Next PartyMon
	add hl, de
	dec b
	jr nz, .Check
.NoPokerus
	and a
	ret
.HasPokerus
	scf
	ret
; 4d87a

Special_CheckForLuckyNumberWinners: ; 4d87a
	xor a
	ld [ScriptVar], a
	ld [wFoundMatchingIDInParty], a
	ld a, [PartyCount]
	and a
	ret z
	ld d, a
	ld hl, PartyMon1ID
	ld bc, PartySpecies
.PartyLoop
	ld a, [bc]
	inc bc
	cp EGG
	call nz, .CompareLuckyNumberToMonID
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .PartyLoop
	ld a, BANK(sBox)
	call GetSRAMBank
	ld a, [sBoxCount]
	and a
	jr z, .SkipOpenBox
	ld d, a
	ld hl, sBoxMon1ID
	ld bc, sBoxSpecies
.OpenBoxLoop
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipOpenBoxMon
	call .CompareLuckyNumberToMonID
	jr nc, .SkipOpenBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipOpenBoxMon
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .OpenBoxLoop

.SkipOpenBox
	call CloseSRAM
	ld c, $0
.BoxesLoop
	ld a, [wCurBox]
	and $f
	cp c
	jr z, .SkipBox
	ld hl, .BoxBankAddresses
	ld b, 0
rept 3
	add hl, bc
endr
	ld a, [hli]
	call GetSRAMBank
	ld a, [hli]
	ld h, [hl]
	ld l, a ; hl now contains the address of the loaded box in SRAM
	ld a, [hl]
	and a
	jr z, .SkipBox ; no mons in this box
	push bc
	ld b, h
	ld c, l
	inc bc
	ld de, sBoxMon1ID - sBox
	add hl, de
	ld d, a
.BoxNLoop
	ld a, [bc]
	inc bc
	cp EGG
	jr z, .SkipBoxMon

	call .CompareLuckyNumberToMonID ; sets ScriptVar and CurPartySpecies appropriately
	jr nc, .SkipBoxMon
	ld a, 1
	ld [wFoundMatchingIDInParty], a

.SkipBoxMon
	push bc
	ld bc, BOXMON_STRUCT_LENGTH
	add hl, bc
	pop bc
	dec d
	jr nz, .BoxNLoop
	pop bc

.SkipBox
	inc c
	ld a, c
	cp NUM_BOXES
	jr c, .BoxesLoop

	call CloseSRAM
	ld a, [ScriptVar]
	and a
	ret z ; found nothing
	callba MobileFn_1060cd
	ld a, [wFoundMatchingIDInParty]
	and a
	push af
	ld a, [CurPartySpecies]
	ld [wNamedObjectIndexBuffer], a
	call GetPokemonName
	ld hl, .FoundPartymonText
	pop af
	jr z, .print
	ld hl, .FoundBoxmonText

.print
	jp PrintText
; 4d939

.CompareLuckyNumberToMonID: ; 4d939
	push bc
	push de
	push hl
	ld d, h
	ld e, l
	ld hl, Buffer1
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld hl, LuckyNumberDigit1Buffer
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld b, 5
	ld c, 0
	ld hl, LuckyNumberDigit5Buffer
	ld de, Buffer5
.loop
	ld a, [de]
	cp [hl]
	jr nz, .done
	dec de
	dec hl
	inc c
	dec b
	jr nz, .loop

.done
	pop hl
	push hl
	ld de, -6
	add hl, de
	ld a, [hl]
	pop hl
	pop de
	push af
	ld a, c
	ld b, 1
	cp 5
	jr z, .okay
	ld b, 2
	cp 3
	jr nc, .okay
	ld b, 3
	cp 2
	jr nz, .nomatch

.okay
	inc b
	ld a, [ScriptVar]
	and a
	jr z, .bettermatch
	cp b
	jr c, .nomatch

.bettermatch
	dec b
	ld a, b
	ld [ScriptVar], a
	pop bc
	ld a, b
	ld [CurPartySpecies], a
	pop bc
	scf
	ret

.nomatch
	pop bc
	pop bc
	and a
	ret
; 4d99f

.BoxBankAddresses: ; 4d99f
	dba sBox1
	dba sBox2
	dba sBox3
	dba sBox4
	dba sBox5
	dba sBox6
	dba sBox7
	dba sBox8
	dba sBox9
	dba sBox10
	dba sBox11
	dba sBox12
	dba sBox13
	dba sBox14
; 4d9c9

.FoundPartymonText: ; 0x4d9c9
	; Congratulations! We have a match with the ID number of @  in your party.
	text_jump UnknownText_0x1c1261
	db "@"
; 0x4d9ce

.FoundBoxmonText: ; 0x4d9ce
	; Congratulations! We have a match with the ID number of @  in your PC BOX.
	text_jump UnknownText_0x1c12ae
	db "@"
; 0x4d9d3

Special_PrintTodaysLuckyNumber: ; 4d9d3
	ld hl, StringBuffer3
	ld de, wLuckyIDNumber
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ld a, "@"
	ld [StringBuffer3 + 5], a
	ret
; 4d9e5

CheckPartyFullAfterContest: ; 4d9e5
	ld a, [wContestMon]
	and a
	jp z, .DidntCatchAnything
	ld [CurPartySpecies], a
	ld [CurSpecies], a
	call GetBaseData
	ld hl, PartyCount
	ld a, [hl]
	cp 6
	jp nc, .TryAddToBox
	inc a
	ld [hl], a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [wContestMon]
	ld [hli], a
	ld [CurSpecies], a
	ld a, $ff
	ld [hl], a
	ld hl, PartyMon1Species
	ld a, [PartyCount]
	dec a
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, wContestMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonOT
	call SkipNames
	ld d, h
	ld e, l
	ld hl, PlayerName
	call CopyBytes
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	ld hl, StringBuffer1
	ld de, wd050
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call GiveANickname_YesNo
	jr c, .Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	xor a
	ld [MonType], a
	ld de, wd050
	callab InitNickname

.Party_SkipNickname
	ld a, [PartyCount]
	dec a
	ld hl, PartyMonNicknames
	call SkipNames
	ld d, h
	ld e, l
	ld hl, wd050
	call CopyBytes
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1Level
	call GetPartyLocation
	ld a, [hl]
	ld [CurPartyLevel], a
	call Function4db49
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLocation
	call GetPartyLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	xor a
	ld [wContestMon], a
	and a
	ld [ScriptVar], a
	ret
; 4daa3

.TryAddToBox: ; 4daa3
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, [hl]
	cp MONS_PER_BOX
	call CloseSRAM
	jr nc, .BoxFull
	xor a
	ld [CurPartyMon], a
	ld hl, wContestMon
	ld de, wd018
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	ld hl, PlayerName
	ld de, wd00d
	ld bc, NAME_LENGTH
	call CopyBytes
	callab Function51322
	ld a, [CurPartySpecies]
	ld [wd265], a
	call GetPokemonName
	call GiveANickname_YesNo
	ld hl, StringBuffer1
	jr c, .Box_SkipNickname
	ld a, BOXMON
	ld [MonType], a
	ld de, wd050
	callab InitNickname
	ld hl, wd050

.Box_SkipNickname
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	ld de, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call CopyBytes
	call CloseSRAM

.BoxFull
	ld a, BANK(sBoxMon1Level)
	call GetSRAMBank
	ld a, [sBoxMon1Level]
	ld [CurPartyLevel], a
	call CloseSRAM
	call Function4db83
	ld a, BANK(sBoxMon1CaughtLocation)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLocation
	ld a, [hl]
	and $80
	ld b, $13
	or b
	ld [hl], a
	call CloseSRAM
	xor a
	ld [wContestMon], a
	ld a, $1
	ld [ScriptVar], a
	ret
; 4db35

.DidntCatchAnything: ; 4db35
	ld a, $2
	ld [ScriptVar], a
	ret
; 4db3b


GiveANickname_YesNo: ; 4db3b
	ld hl, TextJump_GiveANickname
	call PrintText
	jp YesNoBox
; 4db44

TextJump_GiveANickname: ; 0x4db44
	; Give a nickname to the @  you received?
	text_jump UnknownText_0x1c12fc
	db "@"
; 0x4db49


Function4db49: ; 4db49
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
Function4db53: ; 4db53
	ld a, [TimeOfDay]
	inc a
	rrca
	rrca
	ld b, a
	ld a, [CurPartyLevel]
	or b
	ld [hli], a
	ld a, [MapGroup]
	ld b, a
	ld a, [MapNumber]
	ld c, a
	cp MAP_POKECENTER_2F
	jr nz, .NotPokeCenter2F
	ld a, b
	cp GROUP_POKECENTER_2F
	jr nz, .NotPokeCenter2F

	ld a, [BackupMapGroup]
	ld b, a
	ld a, [BackupMapNumber]
	ld c, a

.NotPokeCenter2F
	call GetWorldMapLocation
	ld b, a
	ld a, [PlayerGender]
	rrca
	or b
	ld [hl], a
	ret
; 4db83

Function4db83: ; 4db83
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	call Function4db53
	call CloseSRAM
	ret
; 4db92

SetBoxMonCaughtData: ; 4db92
	push bc
	ld a, BANK(sBoxMon1CaughtLevel)
	call GetSRAMBank
	ld hl, sBoxMon1CaughtLevel
	pop bc
	call SetPkmnCaughtData
	call CloseSRAM
	ret
; 4dba3

SetPartymonCaughtData: ; 4dba3
	ld a, [PartyCount]
	dec a
	ld hl, PartyMon1CaughtLevel
	push bc
	call GetPartyLocation
	pop bc
SetPkmnCaughtData: ; 4dbaf
	xor a
	ld [hli], a
	ld a, $7e
	rrc b
	or b
	ld [hl], a
	ret
; 4dbb8


Function4dbb8: ; 4dbb8 (13:5bb8)
	ld a, [CurPartyMon]
	ld hl, PartyMon1CaughtLevel
	call GetPartyLocation
	ld a, [CurPartyLevel]
	push af
	ld a, $1
	ld [CurPartyLevel], a
	call Function4db53
	pop af
	ld [CurPartyLevel], a
	ret

_FindGreaterThanThatLevel: ; 4dbd2
	ld hl, PartyMon1Level
	call FindGreaterThanThatLevel
	ret
; 4dbd9

_FindAtLeastThatHappy: ; 4dbd9
	ld hl, PartyMon1Happiness
	call FindAtLeastThatHappy
	ret
; 4dbe0

_FindThatSpecies: ; 4dbe0
	ld hl, PartyMon1Species
	jp FindThatSpecies
; 4dbe6

_FindThatSpeciesYourTrainerID: ; 4dbe6
	ld hl, PartyMon1Species
	call FindThatSpecies
	ret z
	ld a, c
	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [PlayerID]
	cp [hl]
	jr nz, .nope
	inc hl
	ld a, [PlayerID + 1]
	cp [hl]
	jr nz, .nope
	ld a, $1
	and a
	ret

.nope
	xor a
	ret
; 4dc0a

FindAtLeastThatHappy: ; 4dc0a
; Sets the bits for the Pokemon that have a happiness greater than or equal to b.
; The lowest bits are used.  Sets z if no Pokemon in your party is at least that happy.
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr z, .greater_equal
	jr nc, .lower

.greater_equal
	ld a, c
	or $1
	ld c, a

.lower
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret
; 4dc31

FindGreaterThanThatLevel: ; 4dc31
	ld c, $0
	ld a, [PartyCount]
	ld d, a
.loop
	ld a, d
	dec a
	push hl
	push bc
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, b
	cp [hl]
	pop hl
	jr c, .greater
	ld a, c
	or $1
	ld c, a

.greater
	sla c
	dec d
	jr nz, .loop
	call RetroactivelyIgnoreEggs
	ld a, c
	and a
	ret
; 4dc56

FindThatSpecies: ; 4dc56
; Find species b in your party.
; If you have no Pokemon, returns c = -1 and z.
; If that species is in your party, returns its location in c, and nz.
; Otherwise, returns z.
	ld c, -1
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	inc c
	cp b
	jr nz, .loop
	ld a, $1
	and a
	ret
; 4dc67

RetroactivelyIgnoreEggs: ; 4dc67
	ld e, -2
	ld hl, PartySpecies
.loop
	ld a, [hli]
	cp -1
	ret z
	cp EGG
	jr nz, .skip_notegg
	ld a, c
	and e
	ld c, a

.skip_notegg
	rlc e
	jr .loop
; 4dc7b


Function4dc7b: ; 4dc7b (13:5c7b)
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jr nz, StatsScreenInit

	ld a, [wBattleMode] ; wd22d (aliases: EnemyMonEnd)
	and a
	jr z, StatsScreenInit
	jr Function4dc8f

StatsScreenInit: ; 4dc8a
	ld hl, StatsScreenMain
	jr StatsScreenInit_gotaddress

Function4dc8f: ; 4dc8f
	ld hl, StatsScreenBattle
	jr StatsScreenInit_gotaddress

StatsScreenInit_gotaddress: ; 4dc94
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a ; disable overworld tile animations
	ld a, [wc2c6] ; whether sprite is to be mirrorred
	push af
	ld a, [wJumptableIndex]
	ld b, a
	ld a, [wcf64]
	ld c, a

	push bc
	push hl
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	callba Functionfb53e
	pop hl
	call _hl_
	call ClearBGPalettes
	call ClearTileMap
	pop bc

	; restore old values
	ld a, b
	ld [wJumptableIndex], a
	ld a, c
	ld [wcf64], a
	pop af
	ld [wc2c6], a
	pop af
	ld [hMapAnims], a
	ret
; 0x4dcd2

StatsScreenMain: ; 0x4dcd2
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and $fc
	or $1
	ld [wcf64], a
.loop ; 4dce3
	ld a, [wJumptableIndex]
	and $7f
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call Function4dd3a ; check for keys?
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop
	ret
; 0x4dcf7

StatsScreenBattle: ; 4dcf7
	xor a
	ld [wJumptableIndex], a
	; stupid interns
	ld [wcf64], a
	ld a, [wcf64]
	and $fc
	or $1
	ld [wcf64], a
.loop
	callba Function100dd2
	ld a, [wJumptableIndex]
	and $7f
	ld hl, StatsScreenPointerTable
	rst JumpTable
	call Function4dd3a
	callba Function100dfd
	jr c, .exit
	ld a, [wJumptableIndex]
	bit 7, a
	jr z, .loop

.exit
	ret
; 4dd2a

StatsScreenPointerTable: ; 4dd2a
	dw MonStatsInit ; regular pokémon
	dw EggStatsInit ; egg
	dw StatsScreenWaitCry
	dw Function4ddac
	dw Function4ddc6
	dw StatsScreenWaitCry
	dw Function4ddd6
	dw Function4dd6c
; 4dd3a


Function4dd3a: ; 4dd3a (13:5d3a)
	ld hl, wcf64
	bit 6, [hl]
	jr nz, .asm_4dd49
	bit 5, [hl]
	jr nz, .asm_4dd56
	call DelayFrame
	ret
.asm_4dd49
	callba Functiond00b4
	jr nc, .asm_4dd56
	ld hl, wcf64
	res 6, [hl]
.asm_4dd56
	ld hl, wcf64
	res 5, [hl]
	callba Function10402d
	ret

Function4dd62: ; 4dd62 (13:5d62)
	ld a, [wJumptableIndex]
	and $80
	or h
	ld [wJumptableIndex], a
	ret

Function4dd6c: ; 4dd6c (13:5d6c)
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

MonStatsInit: ; 4dd72 (13:5d72)
	ld hl, wcf64
	res 6, [hl]
	call ClearBGPalettes
	call ClearTileMap
	callba Function10402d
	call Function4ddf2
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_4dd9b
	call Function4deea
	ld hl, wcf64
	set 4, [hl]
	ld h, $4
	call Function4dd62
	ret
.asm_4dd9b
	ld h, $1
	call Function4dd62
	ret

EggStatsInit: ; 4dda1
	call EggStatsScreen
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret
; 0x4ddac


Function4ddac: ; 4ddac (13:5dac)
	call Function4de2c
	jr nc, .asm_4ddb7
	ld h, $0
	call Function4dd62
	ret
.asm_4ddb7
	bit 0, a
	jr nz, .asm_4ddc0
	and $c3
	jp Function4de54
.asm_4ddc0
	ld h, $7
	call Function4dd62
	ret

Function4ddc6: ; 4ddc6 (13:5dc6)
	call Function4dfb6
	ld hl, wcf64
	res 4, [hl]
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

Function4ddd6: ; 4ddd6 (13:5dd6)
	call Function4de2c
	jr nc, .asm_4dde1
	ld h, $0
	call Function4dd62
	ret

.asm_4dde1
	and $f3
	jp Function4de54

StatsScreenWaitCry: ; 4dde6 (13:5de6)
	call IsSFXPlaying
	ret nc
	ld a, [wJumptableIndex]
	inc a
	ld [wJumptableIndex], a
	ret

Function4ddf2: ; 4ddf2 (13:5df2)
	ld a, [MonType]
	cp BREEDMON
	jr nz, .asm_4de10
	ld a, [wd018]
	ld [CurSpecies], a
	call GetBaseData
	ld hl, wd018
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	jr .asm_4de2a
.asm_4de10
	callba CopyPkmnToTempMon
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_4de2a
	ld a, [MonType]
	cp BOXMON
	jr c, .asm_4de2a
	callba Function50890
.asm_4de2a
	and a
	ret

Function4de2c: ; 4de2c (13:5e2c)
	call GetJoypad
	ld a, [MonType]
	cp BREEDMON
	jr nz, .notbreedmon
	push hl
	push de
	push bc
	callba Functione2f95
	pop bc
	pop de
	pop hl
	ld a, [wcf73]
	and $c0
	jr nz, .set_carry
	ld a, [wcf73]
	jr .clear_flags

.notbreedmon
	ld a, [hJoyPressed]
.clear_flags
	and a
	ret

.set_carry
	scf
	ret

Function4de54: ; 4de54 (13:5e54)
	push af
	ld a, [wcf64]
	and $3
	ld c, a
	pop af
	bit 1, a
	jp nz, Function4dee4
	bit 5, a
	jr nz, .asm_4dec7
	bit 4, a
	jr nz, .asm_4debd
	bit 0, a
	jr nz, .asm_4deb8
	bit 6, a
	jr nz, .asm_4dea0
	bit 7, a
	jr nz, .asm_4de77
	jr .asm_4dece
.asm_4de77
	ld a, [MonType]
	cp BOXMON
	jr nc, .asm_4dece
	and a
	ld a, [PartyCount]
	jr z, .asm_4de87
	ld a, [OTPartyCount]
.asm_4de87
	ld b, a
	ld a, [CurPartyMon]
	inc a
	cp b
	jr z, .asm_4dece
	ld [CurPartyMon], a
	ld b, a
	ld a, [MonType]
	and a
	jr nz, .asm_4dede
	ld a, b
	inc a
	ld [wd0d8], a
	jr .asm_4dede
.asm_4dea0
	ld a, [CurPartyMon]
	and a
	jr z, .asm_4dece
	dec a
	ld [CurPartyMon], a
	ld b, a
	ld a, [MonType]
	and a
	jr nz, .asm_4dede
	ld a, b
	inc a
	ld [wd0d8], a
	jr .asm_4dede
.asm_4deb8
	ld a, c
	cp $3
	jr z, Function4dee4
.asm_4debd
	inc c
	ld a, $3
	cp c
	jr nc, .asm_4decf
	ld c, $1
	jr .asm_4decf
.asm_4dec7
	dec c
	jr nz, .asm_4decf
	ld c, $3
	jr .asm_4decf
.asm_4dece
	ret
.asm_4decf
	ld a, [wcf64]
	and $fc
	or c
	ld [wcf64], a
	ld h, $4
	call Function4dd62
	ret
.asm_4dede
	ld h, $0
	call Function4dd62
	ret

Function4dee4: ; 4dee4 (13:5ee4)
	ld h, $7
	call Function4dd62
	ret

Function4deea: ; 4deea (13:5eea)
	call Function4df45
	xor a
	ld [hBGMapMode], a
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	ld [CurSpecies], a
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	hlcoord 10, 0
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	ld de, wd265
	call PrintNum
	hlcoord 14, 0
	call PrintLevel
	ld hl, Unknown_4df77
	call Function4e528
	call Function4e505
	hlcoord 8, 2
	call PlaceString
	hlcoord 18, 0
	call Function4df66
	hlcoord 9, 4
	ld a, "/"
	ld [hli], a
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	call GetPokemonName
	call PlaceString
	call Function4df8f
	call Function4df9b
	call Function4dfa6
	ret

Function4df45: ; 4df45 (13:5f45)
	ld hl, TempMonHP
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld hl, TempMonMaxHP
	ld a, [hli]
	ld d, a
	ld e, [hl]
	callba DrawPartyMenuHPBar
	ld hl, wcda1
	call SetHPPal
	ld b, SCGB_03
	call GetSGBLayout
	call DelayFrame
	ret

Function4df66: ; 4df66 (13:5f66)
	push hl
	callba GetGender
	pop hl
	ret c
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"
.got_gender
	ld [hl], a
	ret
; 4df77 (13:5f77)

Unknown_4df77: ; 4df77
	dw PartyMonNicknames
	dw OTPartyMonNicknames
	dw sBoxMonNicknames
	dw wd002
; 4df7f

Function4df7f: ; 4df7f
	hlcoord 7, 0
	ld bc, SCREEN_WIDTH
	ld d, SCREEN_HEIGHT
.loop
	ld a, $31
	ld [hl], a
	add hl, bc
	dec d
	jr nz, .loop
	ret
; 4df8f

Function4df8f: ; 4df8f (13:5f8f)
	hlcoord 0, 7
	ld b, SCREEN_WIDTH
	ld a, "_"
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ret

Function4df9b: ; 4df9b (13:5f9b)
	hlcoord 12, 6
	ld [hl], "◀"
	hlcoord 19, 6
	ld [hl], "▶"
	ret

Function4dfa6: ; 4dfa6 (13:5fa6)
	ld bc, TempMonDVs
	callba CheckShininess
	ret nc
	hlcoord 19, 0
	ld [hl], "<SHINY>"
	ret

Function4dfb6: ; 4dfb6 (13:5fb6)
	ld a, [CurBaseData] ; wd236 (aliases: BaseDexNo)
	ld [wd265], a
	ld [CurSpecies], a
	xor a
	ld [hBGMapMode], a
	call Function4dfda
	call Function4e002
	call Function4dfed
	ld hl, wcf64
	bit 4, [hl]
	jr nz, .asm_4dfd6
	call SetPalettes
	ret

.asm_4dfd6
	call Function4e226
	ret

Function4dfda: ; 4dfda (13:5fda)
	ld a, [wcf64]
	and $3
	ld c, a
	call Function4e4cd
	hlcoord 0, 8
	lb bc, 10, 20
	call ClearBox
	ret

Function4dfed: ; 4dfed (13:5fed)
	ld a, [wcf64]
	and $3
	ld c, a
	callba Function8c8a
	call DelayFrame
	ld hl, wcf64
	set 5, [hl]
	ret

Function4e002: ; 4e002 (13:6002)
	ld a, [wcf64]
	and $3
	dec a
	ld hl, Jumptable_4e00d
	rst JumpTable
	ret

Jumptable_4e00d: ; 4e00d (13:600d)
	dw Function4e013
	dw Function4e147
	dw Function4e1ae


Function4e013: ; 4e013 (13:6013)
	hlcoord 0, 9
	ld b, $0
	predef DrawPlayerHP
	hlcoord 8, 9
	ld [hl], $41
	ld de, String_4e119
	hlcoord 0, 12
	call PlaceString
	ld a, [TempMonPokerusStatus]
	ld b, a
	and $f
	jr nz, .asm_4e055
	ld a, b
	and $f0
	jr z, .asm_4e03d
	hlcoord 8, 8
	ld [hl], $e8
.asm_4e03d
	ld a, [MonType]
	cp $2
	jr z, .asm_4e060
	hlcoord 6, 13
	push hl
	ld de, TempMonStatus
	predef PlaceStatusString
	pop hl
	jr nz, .asm_4e066
	jr .asm_4e060
.asm_4e055
	ld de, String_4e142
	hlcoord 1, 13
	call PlaceString
	jr .asm_4e066
.asm_4e060
	ld de, String_4e127
	call PlaceString
.asm_4e066
	hlcoord 1, 15
	predef PrintMonTypes
	hlcoord 9, 8
	ld de, $14
	ld b, $a
	ld a, $31
.asm_4e078
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4e078
	ld de, String_4e12b
	hlcoord 10, 9
	call PlaceString
	hlcoord 17, 14
	call Function4e0d3
	hlcoord 13, 10
	lb bc, 3, 7
	ld de, TempMonExp
	call PrintNum
	call Function4e0e7
	hlcoord 13, 13
	lb bc, 3, 7
	ld de, Buffer1 ; wd1ea (aliases: MagikarpLength)
	call PrintNum
	ld de, String_4e136
	hlcoord 10, 12
	call PlaceString
	ld de, String_4e13f
	hlcoord 14, 14
	call PlaceString
	hlcoord 11, 16
	ld a, [TempMonLevel]
	ld b, a
	ld de, TempMonExp + 2
	predef FillInExpBar
	hlcoord 10, 16
	ld [hl], $40
	hlcoord 19, 16
	ld [hl], $41
	ret

Function4e0d3: ; 4e0d3 (13:60d3)
	ld a, [TempMonLevel]
	push af
	cp MAX_LEVEL
	jr z, .asm_4e0df
	inc a
	ld [TempMonLevel], a
.asm_4e0df
	call PrintLevel
	pop af
	ld [TempMonLevel], a
	ret

Function4e0e7: ; 4e0e7 (13:60e7)
	ld a, [TempMonLevel]
	cp MAX_LEVEL
	jr z, .asm_4e111
	inc a
	ld d, a
	callba CalcExpAtLevel
rept 2
	ld hl, TempMonExp + 2
endr
	ld a, [$ffb6]
	sub [hl]
	dec hl
	ld [wd1ec], a
	ld a, [$ffb5]
	sbc [hl]
	dec hl
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	ld a, [hQuotient]
	sbc [hl]
	ld [Buffer1], a ; wd1ea (aliases: MagikarpLength)
	ret
.asm_4e111
	ld hl, Buffer1 ; wd1ea (aliases: MagikarpLength)
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	ret
; 4e119 (13:6119)

String_4e119: ; 4e119
	db   "STATUS/"
	next "TYPE/@"
; 4e127

String_4e127: ; 4e127
	db "OK @"
; 4e12b

String_4e12b: ; 4e12b
	db "EXP POINTS@"
; 4e136

String_4e136: ; 4e136
	db "LEVEL UP@"
; 4e13f

String_4e13f: ; 4e13f
	db "TO@"
; 4e142

String_4e142: ; 4e142
	db "#RUS@"
; 4e147

Function4e147: ; 4e147 (13:6147)
	ld de, String_4e1a0
	hlcoord 0, 8
	call PlaceString
	call Function4e189
	hlcoord 8, 8
	call PlaceString
	ld de, String_4e1a9
	hlcoord 0, 10
	call PlaceString
	ld hl, TempMonMoves
	ld de, wListMoves_MoveIndicesBuffer
	ld bc, NUM_MOVES
	call CopyBytes
	hlcoord 8, 10
	ld a, SCREEN_WIDTH * 2
	ld [Buffer1], a
	predef ListMoves
	hlcoord 12, 11
	ld a, $28
	ld [Buffer1], a
	predef Function50c50
	ret

Function4e189: ; 4e189 (13:6189)
	ld de, String_4e1a5
	ld a, [TempMonItem]
	and a
	ret z
	ld b, a
	callba Function28771
	ld a, b
	ld [wd265], a
	call GetItemName
	ret
; 4e1a0 (13:61a0)

String_4e1a0: ; 4e1a0
	db "ITEM@"
; 4e1a5

String_4e1a5: ; 4e1a5
	db "---@"
; 4e1a9

String_4e1a9: ; 4e1a9
	db "MOVE@"
; 4e1ae

Function4e1ae: ; 4e1ae (13:61ae)
	call Function4e1cc
	hlcoord 10, 8
	ld de, $14
	ld b, $a
	ld a, $31
.asm_4e1bb
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_4e1bb
	hlcoord 11, 8
	ld bc, $6
	predef PrintTempMonStats
	ret

Function4e1cc: ; 4e1cc (13:61cc)
	ld de, IDNoString
	hlcoord 0, 9
	call PlaceString
	ld de, OTString
	hlcoord 0, 12
	call PlaceString
	hlcoord 2, 10
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	ld de, TempMonID
	call PrintNum
	ld hl, Unknown_4e216
	call Function4e528
	call Function4e505
	callba CheckNickErrors
	hlcoord 2, 13
	call PlaceString
	ld a, [TempMonCaughtGender]
	and a
	jr z, .asm_4e215
	cp $7f
	jr z, .asm_4e215
	and $80
	ld a, "♂"
	jr z, .asm_4e211
	ld a, "♀"
.asm_4e211
	hlcoord 9, 13
	ld [hl], a
.asm_4e215
	ret
; 4e216 (13:6216)

Unknown_4e216: ; 4e216
	dw PartyMonOT
	dw OTPartyMonOT
	dw sBoxMonOT
	dw wd00d
; 4e21e

IDNoString: ; 4e21e
	db $73, "№.@"

OTString: ; 4e222
	db "OT/@"
; 4e226


Function4e226: ; 4e226 (13:6226)
	ld hl, TempMonDVs
	predef GetUnownLetter
	call Function4e2ad
	jr c, .asm_4e238
	and a
	jr z, .asm_4e23f
	jr .asm_4e246
.asm_4e238
	call Function4e271
	call SetPalettes
	ret
.asm_4e23f
	call Function4e253
	call SetPalettes
	ret
.asm_4e246
	call SetPalettes
	call Function4e253
	ld a, [CurPartySpecies]
	call PlayCry2
	ret

Function4e253: ; 4e253 (13:6253)
	ld hl, wcf64
	set 5, [hl]
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_4e266
	hlcoord 0, 0
	call PrepMonFrontpic
	ret
.asm_4e266
	xor a
	ld [wc2c6], a
	hlcoord 0, 0
	call _PrepMonFrontpic
	ret

Function4e271: ; 4e271 (13:6271)
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_4e281
	ld a, $1
	ld [wc2c6], a
	call Function4e289
	ret
.asm_4e281
	xor a
	ld [wc2c6], a
	call Function4e289
	ret

Function4e289: ; 4e289 (13:6289)
	ld a, [CurPartySpecies]
	call IsAPokemon
	ret c
	call Function4e307
	ld de, VTiles2 tile $00
	predef Function5108b
	hlcoord 0, 0
	ld d, $0
	ld e, $2
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

Function4e2ad: ; 4e2ad (13:62ad)
	ld a, [MonType]
	ld hl, Jumptable_4e2b5
	rst JumpTable
	ret

Jumptable_4e2b5: ; 4e2b5 (13:62b5)
	dw Function4e2bf
	dw Function4e2cf
	dw Function4e2d1
	dw Function4e2ed
	dw Function4e301


Function4e2bf: ; 4e2bf (13:62bf)
	ld a, [CurPartyMon]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld b, h
	ld c, l
	jr Function4e2f2

Function4e2cf: ; 4e2cf (13:62cf)
	xor a
	ret

Function4e2d1: ; 4e2d1 (13:62d1)
	ld hl, sBoxMons
	ld bc, $30
	ld a, [CurPartyMon]
	call AddNTimes
	ld b, h
	ld c, l
	ld a, $1
	call GetSRAMBank
	call Function4e2f2
	push af
	call CloseSRAM
	pop af
	ret

Function4e2ed: ; 4e2ed (13:62ed)
	ld bc, TempMonSpecies ; wd10e (aliases: TempMon)
	jr Function4e2f2

Function4e2f2: ; 4e2f2 (13:62f2)
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_4e2fe
	call CheckFaintedFrzSlp
	jr c, Function4e305
.asm_4e2fe
	xor a
	scf
	ret

Function4e301: ; 4e301 (13:6301)
	ld a, $1
	and a
	ret
Function4e305: ; 4e305 (13:6305)
	xor a
	ret

Function4e307: ; 4e307 (13:6307)
	nop
	push hl
	push de
	push bc
	push af
	call DelayFrame
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	ld hl, VTiles2 tile $7f
	call Get2bpp
	pop af
	ld [rVBK], a
	pop af
	pop bc
	pop de
	pop hl
	ret
; 4e32a (13:632a)

Unknown_4e32a: ; 4e32a
; A blank tile?
	ds 16
; 4e33a

EggStatsScreen: ; 4e33a
	xor a
	ld [hBGMapMode], a
	ld hl, wcda1
	call SetHPPal
	ld b, SCGB_03
	call GetSGBLayout
	call Function4df8f
	ld de, EggString
	hlcoord 8, 1
	call PlaceString
	ld de, IDNoString
	hlcoord 8, 3
	call PlaceString
	ld de, OTString
	hlcoord 8, 5
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 3
	call PlaceString
	ld de, FiveQMarkString
	hlcoord 11, 5
	call PlaceString
	ld a, [TempMonHappiness] ; egg status
	ld de, EggSoonString
	cp $6
	jr c, .picked
	ld de, EggCloseString
	cp $b
	jr c, .picked
	ld de, EggMoreTimeString
	cp $29
	jr c, .picked
	ld de, EggALotMoreTimeString
.picked
	hlcoord 1, 9
	call PlaceString
	ld hl, wcf64
	set 5, [hl]
	call SetPalettes ; pals
	call DelayFrame
	hlcoord 0, 0
	call PrepMonFrontpic
	callba Function10402d
	call Function4e497

	ld a, [TempMonHappiness]
	cp 6
	ret nc
	ld de, SFX_2_BOOPS
	call PlaySFX
	ret
; 0x4e3c0

EggString: ; 4e3c0
	db "EGG@"

FiveQMarkString: ; 4e3c4
	db "?????@"

EggSoonString: ; 0x4e3ca
	db   "It's making sounds"
	next "inside. It's going"
	next "to hatch soon!@"

EggCloseString: ; 0x4e3fd
	db   "It moves around"
	next "inside sometimes."
	next "It must be close"
	next "to hatching.@"

EggMoreTimeString: ; 0x4e43d
	db   "Wonder what's"
	next "inside? It needs"
	next "more time, though.@"

EggALotMoreTimeString: ; 0x4e46e
	db   "This EGG needs a"
	next "lot more time to"
	next "hatch.@"
; 0x4e497


Function4e497: ; 4e497 (13:6497)
	call Function4e2ad
	ret nc
	ld a, [TempMonHappiness]
	ld e, $7
	cp $6
	jr c, .asm_4e4ab
	ld e, $8
	cp $b
	jr c, .asm_4e4ab
	ret
.asm_4e4ab
	push de
	ld a, $1
	ld [wc2c6], a
	call Function4e307
	ld de, VTiles2 tile $00
	predef Function5108b
	pop de
	hlcoord 0, 0
	ld d, $0
	predef LoadMonAnimation
	ld hl, wcf64
	set 6, [hl]
	ret

Function4e4cd: ; 4e4cd (13:64cd)
	hlcoord 13, 5
	ld a, $36
	call Function4e4f7
	hlcoord 15, 5
	ld a, $36
	call Function4e4f7
	hlcoord 17, 5
	ld a, $36
	call Function4e4f7
	ld a, c
	cp $2
	ld a, $3a
	hlcoord 13, 5
	jr c, Function4e4f7
	hlcoord 15, 5
	jr z, Function4e4f7
	hlcoord 17, 5

Function4e4f7: ; 4e4f7 (13:64f7)
	push bc
	ld [hli], a
	inc a
	ld [hld], a
	ld bc, $14
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop bc
	ret

Function4e505: ; 4e505 (13:6505)
	ld de, StringBuffer1
	ld bc, $b
	jr .asm_4e50d
.asm_4e50d
	ld a, [MonType]
	cp BOXMON
	jr nz, .asm_4e522
	ld a, BANK(sBoxMonNicknames)
	call GetSRAMBank
	push de
	call CopyBytes
	pop de
	call CloseSRAM
	ret
.asm_4e522
	push de
	call CopyBytes
	pop de
	ret

Function4e528: ; 4e528 (13:6528)
	ld a, [MonType]
	add a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [MonType]
	cp $3
	ret z
	ld a, [CurPartyMon]
	jp SkipNames


CheckFaintedFrzSlp: ; 4e53f
	ld hl, MON_HP
	add hl, bc
	ld a, [hli]
	or [hl]
	jr z, .fainted_frz_slp
	ld hl, MON_STATUS
	add hl, bc
	ld a, [hl]
	and (1 << FRZ) | SLP
	jr nz, .fainted_frz_slp
	and a
	ret

.fainted_frz_slp
	scf
	ret
; 4e554


CatchTutorial:: ; 4e554
	ld a, [BattleType]
	dec a
	ld c, a
	ld hl, .jumptable
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 4e564

.jumptable: ; 4e564 (13:6564)
	dw .DudeTutorial
	dw .DudeTutorial
	dw .DudeTutorial

.DudeTutorial: ; 4e56a (13:656a)
; Back up your name to your Mom's name.
	ld hl, PlayerName
	ld de, MomsName
	ld bc, NAME_LENGTH
	call CopyBytes
; Copy Dude's name to your name
	ld hl, .Dude
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes

	call .LoadDudeData

	xor a
	ld [hJoyDown], a
	ld [hJoyPressed], a
	ld a, [Options]
	push af
	and $f8
	add $3
	ld [Options], a
	ld hl, .AutoInput
	ld a, BANK(.AutoInput)
	call StartAutoInput
	callab StartBattle
	call StopAutoInput
	pop af

	ld [Options], a
	ld hl, MomsName
	ld de, PlayerName
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.LoadDudeData: ; 4e5b7 (13:65b7)
	ld hl, OTPartyMon1
	ld [hl], BULBASAUR
	inc hl
	ld [hl], POTION
	inc hl
	ld [hl], POUND
	inc hl
	ld [hl], $ff
	ld hl, OTPartyMon1Exp + 2
	ld [hl], $0
	inc hl
	ld [hl], $ff
	ld hl, OTPartyMon1CaughtGender
	ld a, $1
	ld [hli], a
	ld a, $5
rept 2
	ld [hli], a
endr
	ld [hl], $ff
	ret
; 4e5da (13:65da)

.Dude: ; 4e5da
	db "DUDE@"
; 4e5df

.AutoInput: ; 4e5df
	db NO_INPUT, $ff ; end
; 4e5e1

INCLUDE "engine/evolution_animation.asm"

Function4e929: ; mobile function
	ld h, b
	ld l, c
	call Function4e930
	ld c, a
	ret
; 4e930

Function4e930: ; 4e930
	ld a, [hli]
	xor [hl]
	ld c, a
	jr z, .skip_male_trainers
	srl c
	srl c
.male_trainer_loop
	srl c
	ld a, c
	cp MaleTrainersEnd - MaleTrainers - 1
	jr nc, .male_trainer_loop
	inc c

.skip_male_trainers
	ld a, [de]
	cp $1
	ld hl, MaleTrainers
	jr nz, .finished

	ld hl, FemaleTrainers
	ld a, c
	and a
	jr z, .finished

.female_trainer_loop
	srl c
	ld a, c
	cp FemaleTrainersEnd - FemaleTrainers - 1
	jr nc, .female_trainer_loop
	inc c

.finished
	ld b, $0
	add hl, bc
	ld a, [hl]
	ret
; 4e95d

MaleTrainers: ; 4e95d
	db BURGLAR
	db YOUNGSTER
	db SCHOOLBOY
	db BIRD_KEEPER
	db POKEMANIAC
	db GENTLEMAN
	db BUG_CATCHER
	db FISHER
	db SWIMMERM
	db SAILOR
	db SUPER_NERD
	db GUITARIST
	db HIKER
	db FIREBREATHER
	db BLACKBELT_T
	db PSYCHIC_T
	db CAMPER
	db COOLTRAINERM
	db BOARDER
	db JUGGLER
	db POKEFANM
	db OFFICER
	db SAGE
	db BIKER
	db SCIENTIST
MaleTrainersEnd:
; 4e976

FemaleTrainers: ; 4e976
	db MEDIUM
	db LASS
	db BEAUTY
	db SKIER
	db TEACHER
	db SWIMMERF
	db PICNICKER
	db KIMONO_GIRL
	db POKEFANF
	db COOLTRAINERF
FemaleTrainersEnd:
; 4e980


INCLUDE "battle/sliding_intro.asm"


Function4ea0a: ; 4ea0a
	ld a, c
	push af
	call SpeechTextBox
	call MobileTextBorder
	pop af
	dec a
	ld bc, $c
	ld hl, w5_dc1a
	call AddNTimes
	ld de, wcd53
	ld bc, $c
	ld a, $5 ; BANK(w5_dc1a)
	call FarCopyWRAM

	ld a, [rSVBK]
	push af
	ld a, $1
	ld [rSVBK], a

	ld bc, wcd53
	decoord 1, 14
	callba Function11c0c6

	pop af
	ld [rSVBK], a

	ld c, 180
	call DelayFrames
	ret
; 4ea44



CheckBattleScene: ; 4ea44
; Return carry if battle scene is turned off.

	ld a, 0
	ld hl, wLinkMode
	call GetFarWRAMByte
	cp LINK_MOBILE
	jr z, .mobile

	ld a, [Options]
	bit BATTLE_SCENE, a
	jr nz, .off

	and a
	ret

.mobile
	ld a, [wcd2f]
	and a
	jr nz, .asm_4ea72

	ld a, $4
	call GetSRAMBank
	ld a, [$a60c]
	ld c, a
	call CloseSRAM

	ld a, c
	bit 0, c
	jr z, .off

	and a
	ret

.asm_4ea72
	ld a, $5
	ld hl, wdc00
	call GetFarWRAMByte
	bit 0, a
	jr z, .off

	and a
	ret

.off
	scf
	ret
; 4ea82


INCLUDE "misc/gbc_only.asm"

INCLUDE "event/poke_seer.asm"


SECTION "bank14", ROMX, BANK[$14]

INCLUDE "engine/party_menu.asm"
INCLUDE "event/poisonstep.asm"
INCLUDE "event/sweet_scent.asm"
INCLUDE "event/squirtbottle.asm"
INCLUDE "event/card_key.asm"
INCLUDE "event/basement_key.asm"
INCLUDE "event/sacred_ash.asm"

CopyPkmnToTempMon: ; 5084a
; gets the BaseData of a Pkmn
; and copys the PkmnStructure to TempMon

	ld a, [CurPartyMon]
	ld e, a
	call GetPkmnSpecies
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call GetBaseData

	ld a, [MonType]
	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	and a
	jr z, .copywholestruct
	ld hl, OTPartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	cp OTPARTYMON
	jr z, .copywholestruct
	ld bc, BOXMON_STRUCT_LENGTH
	callab Functione5bb
	jr .done

.copywholestruct
	ld a, [CurPartyMon]
	call AddNTimes
	ld de, TempMon
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes

.done
	ret
; 5088b


Function5088b: ; 5088b
	ld bc, wd018
	jr Function50893
; 50890

Function50890: ; 50890
	ld bc, TempMon
	; fallthrough
; 50893

Function50893: ; 50893
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [CurPartyLevel], a
	ld hl, MON_MAXHP
	add hl, bc
	ld d, h
	ld e, l
	ld hl, MON_EXP + 2
	add hl, bc
	push bc
	ld b, $1
	predef CalcPkmnStats
	pop bc
	ld hl, MON_HP
	add hl, bc
	ld d, h
	ld e, l
	ld a, [CurPartySpecies]
	cp EGG
	jr nz, .asm_508c1
	xor a
	ld [de], a
	inc de
	ld [de], a
	jr .asm_508cd

.asm_508c1
	push bc
	ld hl, MON_MAXHP
	add hl, bc
	ld bc, 2
	call CopyBytes
	pop bc

.asm_508cd
	ld hl, MON_STATUS
	add hl, bc
	xor a
	ld [hli], a
	ld [hl], a
	ret
; 508d5

GetPkmnSpecies: ; 508d5
; [MonType] has the type of the Pkmn
; e = Nr. of Pkmn (i.e. [CurPartyMon])

	ld a, [MonType]
	and a ; PARTYMON
	jr z, .partymon
	cp OTPARTYMON
	jr z, .otpartymon
	cp BOXMON
	jr z, .boxmon
	cp BREEDMON
	jr z, .breedmon
	; WILDMON

.partymon
	ld hl, PartySpecies
	jr .done

.otpartymon
	ld hl, OTPartySpecies
	jr .done

.boxmon
	ld a, BANK(sBoxSpecies)
	call GetSRAMBank
	ld hl, sBoxSpecies
	call .done
	call CloseSRAM
	ret

.breedmon
	ld a, [wBreedMon1Species]
	jr .done2

.done
	ld d, 0
	add hl, de
	ld a, [hl]

.done2
	ld [CurPartySpecies], a
	ret
; 5090d


INCLUDE "text/types.asm"


Function50a28: ; 50a28
	ld hl, Strings50a42
	ld a, [TrainerClass]
	dec a
	ld c, a
	ld b, 0
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, StringBuffer1
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "@"
	jr nz, .copy
	ret
; 50a42

Strings50a42: ; 50a42
; Untranslated trainer class names from Red.

	dw .Youngster
	dw .BugCatcher
	dw .Lass
	dw OTName
	dw .JrTrainerM
	dw .JrTrainerF
	dw .Pokemaniac
	dw .SuperNerd
	dw OTName
	dw OTName
	dw .Burglar
	dw .Engineer
	dw .Jack
	dw OTName
	dw .Swimmer
	dw OTName
	dw OTName
	dw .Beauty
	dw OTName
	dw .Rocker
	dw .Juggler
	dw OTName
	dw OTName
	dw .Blackbelt
	dw OTName
	dw .ProfOak
	dw .Chief
	dw .Scientist
	dw OTName
	dw .Rocket
	dw .CooltrainerM
	dw .CooltrainerF
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName
	dw OTName

.Youngster    db "たんパン@"
.BugCatcher   db "むしとり@"
.Lass         db "ミニスカ@"
.JrTrainerM   db "ボーイ@"
.JrTrainerF   db "ガール@"
.Pokemaniac   db "マニア@"
.SuperNerd    db "りかけい@"
.Burglar      db "どろぼう@"
.Engineer     db "ォヤジ@"
.Jack         db "ジャック@"
.Swimmer      db "かいパン@"
.Beauty       db "おねえさん@"
.Rocker       db "グループ@"
.Juggler      db "ジャグラー@"
.Blackbelt    db "からて@"
.ProfOak      db "ォーキド@"
.Chief        db "チーフ@"
.Scientist    db "けんきゅういん@"
.Rocket       db "だんいん@"
.CooltrainerM db "エりート♂@"
.CooltrainerF db "エりート♀@"
; 50b0a


DrawPlayerHP: ; 50b0a
	ld a, $1
	jr DrawHP

DrawEnemyHP: ; 50b0e
	ld a, $2

DrawHP: ; 50b10
	ld [wd10a], a
	push hl
	push bc
	ld a, [MonType]
	cp BOXMON
	jr z, .asm_50b30

	ld a, [TempMonHP]
	ld b, a
	ld a, [TempMonHP + 1]
	ld c, a

; Any HP?
	or b
	jr nz, .asm_50b30

	xor a
	ld c, a
	ld e, a
	ld a, 6
	ld d, a
	jp .asm_50b4a

.asm_50b30
	ld a, [TempMonMaxHP]
	ld d, a
	ld a, [TempMonMaxHP + 1]
	ld e, a
	ld a, [MonType]
	cp BOXMON
	jr nz, .asm_50b41

	ld b, d
	ld c, e

.asm_50b41
	predef DrawPartyMenuHPBar
	ld a, 6
	ld d, a
	ld c, a

.asm_50b4a
	ld a, c
	pop bc
	ld c, a
	pop hl
	push de
	push hl
	push hl
	call DrawBattleHPBar
	pop hl

; Print HP
	ld bc, $15 ; move (1,1)
	add hl, bc
	ld de, TempMonHP
	ld a, [MonType]
	cp BOXMON
	jr nz, .asm_50b66
	ld de, TempMonMaxHP
.asm_50b66
	lb bc, 2, 3
	call PrintNum

	ld a, "/"
	ld [hli], a

; Print max HP
	ld de, TempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	pop hl
	pop de
	ret
; 50b7b


PrintTempMonStats: ; 50b7b
; Print TempMon's stats at hl, with spacing bc.
	push bc
	push hl
	ld de, .StatNames
	call PlaceString
	pop hl
	pop bc
	add hl, bc
	ld bc, SCREEN_WIDTH
	add hl, bc
	ld de, TempMonAttack
	lb bc, 2, 3
	call .PrintStat
	ld de, TempMonDefense
	call .PrintStat
	ld de, TempMonSpclAtk
	call .PrintStat
	ld de, TempMonSpclDef
	call .PrintStat
	ld de, TempMonSpeed
	jp PrintNum
; 50bab

.PrintStat: ; 50bab
	push hl
	call PrintNum
	pop hl
	ld de, SCREEN_WIDTH * 2
	add hl, de
	ret
; 50bb5

.StatNames: ; 50bb5
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	next "@"
; 50bdd


GetGender: ; 50bdd
; Return the gender of a given monster (CurPartyMon/CurOTMon/CurWildMon).
; When calling this function, a should be set to an appropriate MonType value.

; return values:
; a = 1: f = nc|nz; male
; a = 0: f = nc|z;  female
;        f = c:  genderless

; This is determined by comparing the Attack and Speed DVs
; with the species' gender ratio.


; Figure out what type of monster struct we're looking at.

; 0: PartyMon
	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [MonType]
	and a
	jr z, .PartyMon

; 1: OTPartyMon
	ld hl, OTPartyMon1DVs
	dec a
	jr z, .PartyMon

; 2: sBoxMon
	ld hl, sBoxMon1DVs
	ld bc, BOXMON_STRUCT_LENGTH
	dec a
	jr z, .sBoxMon

; 3: Unknown
	ld hl, TempMonDVs
	dec a
	jr z, .DVs

; else: WildMon
	ld hl, EnemyMonDVs
	jr .DVs


; Get our place in the party/box.

.PartyMon
.sBoxMon
	ld a, [CurPartyMon]
	call AddNTimes


.DVs

; sBoxMon data is read directly from SRAM.
	ld a, [MonType]
	cp BOXMON
	ld a, 1
	call z, GetSRAMBank

; Attack DV
	ld a, [hli]
	and $f0
	ld b, a
; Speed DV
	ld a, [hl]
	and $f0
	swap a

; Put our DVs together.
	or b
	ld b, a

; Close SRAM if we were dealing with a sBoxMon.
	ld a, [MonType]
	cp BOXMON
	call z, CloseSRAM


; We need the gender ratio to do anything with this.
	push bc
	ld a, [CurPartySpecies]
	dec a
	ld hl, BaseData + BaseGender - CurBaseData
	ld bc, BaseData1 - BaseData
	call AddNTimes
	pop bc

	ld a, BANK(BaseData)
	call GetFarByte


; The higher the ratio, the more likely the monster is to be female.

	cp $ff
	jr z, .Genderless

	and a
	jr z, .Male

	cp $fe
	jr z, .Female

; Values below the ratio are male, and vice versa.
	cp b
	jr c, .Male

.Female
	xor a
	ret

.Male
	ld a, 1
	and a
	ret

.Genderless
	scf
	ret
; 50c50

Function50c50: ; 50c50
	ld a, [wd0eb]
	inc a
	ld c, a
	ld a, $4
	sub c
	ld b, a
	push hl
	ld a, [Buffer1]
	ld e, a
	ld d, $0
	ld a, $3e
	call Function50cc9
	ld a, b
	and a
	jr z, .asm_50c6f
	ld c, a
	ld a, $e3
	call Function50cc9

.asm_50c6f
	pop hl
rept 3
	inc hl
endr
	ld d, h
	ld e, l
	ld hl, TempMonMoves
	ld b, 0
.asm_50c7a
	ld a, [hli]
	and a
	jr z, .asm_50cc8
	push bc
	push hl
	push de
	ld hl, MenuSelection2
	ld a, [hl]
	push af
	ld [hl], b
	push hl
	callab GetMaxPPOfMove
	pop hl
	pop af
	ld [hl], a
	pop de
	pop hl
	push hl
	ld bc, TempMonPP - (TempMonMoves + 1)
	add hl, bc
	ld a, [hl]
	and $3f
	ld [StringBuffer1 + 4], a
	ld h, d
	ld l, e
	push hl
	ld de, StringBuffer1 + 4
	lb bc, 1, 2
	call PrintNum
	ld a, $f3
	ld [hli], a
	ld de, wd265
	lb bc, 1, 2
	call PrintNum
	pop hl
	ld a, [Buffer1]
	ld e, a
	ld d, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc b
	ld a, b
	cp NUM_MOVES
	jr nz, .asm_50c7a

.asm_50cc8
	ret
; 50cc9

Function50cc9: ; 50cc9
.asm_50cc9
	ld [hli], a
	ld [hld], a
	add hl, de
	dec c
	jr nz, .asm_50cc9
	ret
; 50cd0

Function50cd0: ; 50cd0
.asm_50cd0
	ld [hl], $32
	inc hl
	ld [hl], $3e
	dec hl
	add hl, de
	dec c
	jr nz, .asm_50cd0
	ret
; 50cdb

Function50cdb: ; unreferenced predef
	push hl
	push hl
	ld hl, PartyMonNicknames
	ld a, [CurPartyMon]
	call GetNick
	pop hl
	call PlaceString
	call CopyPkmnToTempMon
	pop hl
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .asm_50d09
	push hl
	ld bc, -12
	add hl, bc
	ld b, $0
	call DrawEnemyHP
	pop hl
	ld bc, 5
	add hl, bc
	push de
	call PrintLevel
	pop de

.asm_50d09
	ret
; 50d0a


PlaceStatusString: ; 50d0a
	push de
rept 2
	inc de
endr
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	or b
	pop de
	jr nz, PlaceNonFaintStatus
	push de
	ld de, FntString
	call CopyStatusString
	pop de
	ld a, $1
	and a
	ret
; 50d22

FntString: ; 50d22
	db "FNT@"
; 50d25

CopyStatusString: ; 50d25
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret
; 50d2e

PlaceNonFaintStatus: ; 50d2e
	push de
	ld a, [de]
	ld de, PsnString
	bit PSN, a
	jr nz, .place
	ld de, BrnString
	bit BRN, a
	jr nz, .place
	ld de, FrzString
	bit FRZ, a
	jr nz, .place
	ld de, ParString
	bit PAR, a
	jr nz, .place
	ld de, SlpString
	and SLP
	jr z, .no_status

.place
	call CopyStatusString
	ld a, $1
	and a

.no_status
	pop de
	ret
; 50d5b

SlpString: db "SLP@"
PsnString: db "PSN@"
BrnString: db "BRN@"
FrzString: db "FRZ@"
ParString: db "PAR@"
; 50d6f

ListMoves: ; 50d6f
; List moves at hl, spaced every [Buffer1] tiles.
	ld de, wListMoves_MoveIndicesBuffer
	ld b, $0
.moves_loop
	ld a, [de]
	inc de
	and a
	jr z, .no_more_moves
	push de
	push hl
	push hl
	ld [CurSpecies], a
	ld a, MOVE_NAME
	ld [wNamedObjectTypeBuffer], a
	call GetName
	ld de, StringBuffer1
	pop hl
	push bc
	call PlaceString
	pop bc
	ld a, b
	ld [wd0eb], a
	inc b
	pop hl
	push bc
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop bc
	pop de
	ld a, b
	cp NUM_MOVES
	jr z, .done
	jr .moves_loop

.no_more_moves
	ld a, b
.nonmove_loop
	push af
	ld [hl], "-"
	ld a, [Buffer1]
	ld c, a
	ld b, 0
	add hl, bc
	pop af
	inc a
	cp NUM_MOVES
	jr nz, .nonmove_loop

.done
	ret
; 50db9

Function50db9: ; 50db9
	ld a, [wd263]

	cp $1
	jr nz, .check_party_ot_name
	ld hl, OTPartyCount
	ld de, OTPartyMonOT
	ld a, ENEMY_OT_NAME
	jr .done
.check_party_ot_name

	cp $4
	jr nz, .check_mon_name
	ld hl, PartyCount
	ld de, PartyMonOT
	ld a, PARTY_OT_NAME
	jr .done
.check_mon_name

	cp $5
	jr nz, .check_item_name
	ld hl, CurMart
	ld de, PokemonNames
	ld a, PKMN_NAME
	jr .done
.check_item_name

	cp $2
	jr nz, .check_ob_item_name
	ld hl, NumItems
	ld de, ItemNames
	ld a, ITEM_NAME
	jr .done
.check_ob_item_name

	ld hl, CurMart
	ld de, ItemNames
	ld a, ITEM_NAME

.done
	ld [wNamedObjectTypeBuffer], a
	ld a, l
	ld [wd100], a
	ld a, h
	ld [wd101], a
	ld a, e
	ld [wd102], a
	ld a, d
	ld [wd103], a
	ld bc, ItemAttributes
	ld a, c
	ld [wd104], a
	ld a, b
	ld [wd105], a
	ret
; 50e1b


CalcLevel: ; 50e1b
	ld a, [TempMonSpecies]
	ld [CurSpecies], a
	call GetBaseData
	ld d, 1
.next_level
	inc d
	ld a, d
	cp (MAX_LEVEL + 1) % $100
	jr z, .got_level
	call CalcExpAtLevel
	push hl
	ld hl, TempMonExp + 2
	ld a, [hProduct + 3]
	ld c, a
	ld a, [hld]
	sub c
	ld a, [hProduct + 2]
	ld c, a
	ld a, [hld]
	sbc c
	ld a, [hProduct + 1]
	ld c, a
	ld a, [hl]
	sbc c
	pop hl
	jr nc, .next_level

.got_level
	dec d
	ret
; 50e47



CalcExpAtLevel: ; 50e47
; (a/b)*n**3 + c*n**2 + d*n - e
	ld a, [BaseGrowthRate]
rept 2
	add a
endr
	ld c, a
	ld b, 0
	ld hl, GrowthRates
	add hl, bc
; Cube the level
	call .LevelSquared
	ld a, d
	ld [hMultiplier], a
	call Multiply

; Multiply by a
	ld a, [hl]
	and $f0
	swap a
	ld [hMultiplier], a
	call Multiply
; Divide by b
	ld a, [hli]
	and $f
	ld [hDivisor], a
	ld b, 4
	call Divide
; Push the cubic term to the stack
	ld a, [hQuotient + 0]
	push af
	ld a, [hQuotient + 1]
	push af
	ld a, [hQuotient + 2]
	push af
; Square the level and multiply by the lower 7 bits of c
	call .LevelSquared
	ld a, [hl]
	and $7f
	ld [hMultiplier], a
	call Multiply
; Push the absolute value of the quadratic term to the stack
	ld a, [hProduct + 1]
	push af
	ld a, [hProduct + 2]
	push af
	ld a, [hProduct + 3]
	push af
	ld a, [hli]
	push af
; Multiply the level by d
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld a, [hli]
	ld [hMultiplier], a
	call Multiply
; Subtract e
	ld b, [hl]
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	ld b, $0
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a
; If bit 7 of c is set, c is negative; otherwise, it's positive
	pop af
	and $80
	jr nz, .subtract
; Add c*n**2 to (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	jr .done_quadratic

.subtract
; Subtract c*n**2 from (d*n - e)
	pop bc
	ld a, [hProduct + 3]
	sub b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	sbc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	sbc b
	ld [hMultiplicand], a

.done_quadratic
; Add (a/b)*n**3 to (d*n - e +/- c*n**2)
	pop bc
	ld a, [hProduct + 3]
	add b
	ld [hMultiplicand + 2], a
	pop bc
	ld a, [hProduct + 2]
	adc b
	ld [hMultiplicand + 1], a
	pop bc
	ld a, [hProduct + 1]
	adc b
	ld [hMultiplicand], a
	ret
; 50eed

.LevelSquared: ; 50eed
	xor a
	ld [hMultiplicand + 0], a
	ld [hMultiplicand + 1], a
	ld a, d
	ld [hMultiplicand + 2], a
	ld [hMultiplier], a
	jp Multiply
; 50efa

GrowthRates: ; 50efa

growth_rate: MACRO
; [1]/[2]*n**3 + [3]*n**2 + [4]*n - [5]
	dn \1, \2
	if \3 & $80 ; signed
		db -\3 | $80
	else
		db \3
	endc
	db \4, \5
ENDM

	growth_rate 1, 1,   0,   0,   0 ; Medium Fast
	growth_rate 3, 4,  10,   0,  30 ; Slightly Fast
	growth_rate 3, 4,  20,   0,  70 ; Slightly Slow
	growth_rate 6, 5, -15, 100, 140 ; Medium Slow
	growth_rate 4, 5,   0,   0,   0 ; Fast
	growth_rate 5, 4,   0,   0,   0 ; Slow
; 50f12

_SwitchPartyMons:
	ld a, [wd0e3]
	dec a
	ld [wd1ec], a
	ld b, a
	ld a, [MenuSelection2]
	dec a
	ld [Buffer2], a ; wd1eb (aliases: MovementType)
	cp b
	jr z, .skip
	call .SwapPartymonViaSRAM
	ld a, [wd1ec]
	call .ClearSprite
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call .ClearSprite
.skip
	ret

.ClearSprite: ; 50f34 (14:4f34)
	push af
	hlcoord 0, 1
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld bc, 2 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	pop af
	ld hl, Sprites
	ld bc, $10
	call AddNTimes
	ld de, $4
	ld c, $4
.gfx_loop
	ld [hl], $a0
	add hl, de
	dec c
	jr nz, .gfx_loop
	ld de, SFX_SWITCH_POKEMON
	call WaitPlaySFX
	ret

.SwapPartymonViaSRAM: ; 50f62 (14:4f62)
	push hl
	push de
	push bc
	ld bc, PartySpecies
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld l, a
	ld h, $0
	add hl, bc
	ld d, h
	ld e, l
	ld a, [Buffer3]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, [hl]
	push af
	ld a, [de]
	ld [hl], a
	pop af
	ld [de], a
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer3]
	ld hl, PartyMons ; wdcdf (aliases: PartyMon1, PartyMon1Species)
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, PARTYMON_STRUCT_LENGTH
	call CopyBytes
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld hl, PartyMonOT
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld a, [Buffer3]
	ld hl, PartyMonOT
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, PartyMonNicknames
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	call SkipNames
	push hl
	call .CopyNameTowd002
	ld hl, PartyMonNicknames
	ld a, [Buffer3]
	call SkipNames
	pop de
	push hl
	call .CopyName
	pop de
	ld hl, wd002
	call .CopyName
	ld hl, sPartyScratch1
	ld a, [Buffer2] ; wd1eb (aliases: MovementType)
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	push hl
	ld de, wd002
	ld bc, SCRATCHMON_STRUCT_LENGTH
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	call CopyBytes
	ld hl, sPartyScratch1
	ld a, [Buffer3]
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	pop de
	push hl
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	pop de
	ld hl, wd002
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call CopyBytes
	call CloseSRAM
	pop bc
	pop de
	pop hl
	ret

.CopyNameTowd002: ; 51036 (14:5036)
	ld de, wd002

.CopyName: ; 51039 (14:5039)
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

GetUnownLetter: ; 51040
; Return Unown letter in UnownLetter based on DVs at hl

; Take the middle 2 bits of each DV and place them in order:
;	atk  def  spd  spc
;	.ww..xx.  .yy..zz.

	; atk
	ld a, [hl]
	and %01100000
	sla a
	ld b, a
	; def
	ld a, [hli]
	and %00000110
	swap a
	srl a
	or b
	ld b, a

	; spd
	ld a, [hl]
	and %01100000
	swap a
	sla a
	or b
	ld b, a
	; spc
	ld a, [hl]
	and %00000110
	srl a
	or b

; Divide by 10 to get 0-25
	ld [hDividend + 3], a
	xor a
	ld [hDividend], a
	ld [hDividend + 1], a
	ld [hDividend + 2], a
	ld a, 10
	ld [hDivisor], a
	ld b, 4
	call Divide

; Increment to get 1-26
	ld a, [hQuotient + 2]
	inc a
	ld [UnownLetter], a
	ret
; 51077


GetFrontpic: ; 51077
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	call _GetFrontpic
	pop af
	ld [rSVBK], a
	ret
; 5108b

Function5108b: ; 5108b
	ld a, [CurPartySpecies]
	ld [CurSpecies], a
	call IsAPokemon
	ret c
	ld a, [rSVBK]
	push af
	xor a
	ld [hBGMapMode], a
	call _GetFrontpic
	call Function51103
	pop af
	ld [rSVBK], a
	ret
; 510a5

_GetFrontpic: ; 510a5
	push de
	call GetBaseData
	ld a, [BasePicSize]
	and $f
	ld b, a
	push bc
	call GetFrontpicPointer
	ld a, $6
	ld [rSVBK], a
	ld a, b
	ld de, w6_d000 + $800
	call FarDecompress
	pop bc
	ld hl, w6_d000
	ld de, w6_d000 + $800
	call Function512ab
	pop hl
	push hl
	ld de, w6_d000
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ret
; 510d7

GetFrontpicPointer: ; 510d7
GLOBAL PicPointers, UnownPicPointers

	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .unown
	ld a, [CurPartySpecies]
	ld d, BANK(PicPointers)
	jr .ok

.unown
	ld a, [UnownLetter]
	ld d, BANK(UnownPicPointers)

.ok
	ld hl, PicPointers ; UnownPicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	pop bc
	ret
; 51103

Function51103: ; 51103
	ld a, $1
	ld [rVBK], a
	push hl
	ld de, w6_d000
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop hl
	ld de, 7 * 7 * $10
	add hl, de
	push hl
	ld a, $1
	ld hl, BasePicSize
	call GetFarWRAMByte
	pop hl
	and $f
	ld de, w6_d000 + $800 + 5 * 5 * $10
	ld c, 5 * 5
	cp 5
	jr z, .asm_5113b
	ld de, w6_d000 + $800 + 6 * 6 * $10
	ld c, 6 * 6
	cp 6
	jr z, .asm_5113b
	ld de, w6_d000 + $800 + 7 * 7 * $10
	ld c, 7 * 7
.asm_5113b

	push hl
	push bc
	call Function5114f
	pop bc
	pop hl
	ld de, w6_d000
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	xor a
	ld [rVBK], a
	ret
; 5114f

Function5114f: ; 5114f
	ld hl, w6_d000
	swap c
	ld a, c
	and $f
	ld b, a
	ld a, c
	and $f0
	ld c, a
	push bc
	call Function512f2
	pop bc
.asm_51161
	push bc
	ld c, $0
	call Function512f2
	pop bc
	dec b
	jr nz, .asm_51161
	ret
; 5116c

GetBackpic: ; 5116c
	ld a, [CurPartySpecies]
	call IsAPokemon
	ret c

	ld a, [CurPartySpecies]
	ld b, a
	ld a, [UnownLetter]
	ld c, a
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de

	; These are assumed to be at the same
	; address in their respective banks.
	GLOBAL PicPointers,  UnownPicPointers
	ld hl, PicPointers ; UnownPicPointers
	ld a, b
	ld d, BANK(PicPointers)
	cp UNOWN
	jr nz, .ok
	ld a, c
	ld d, BANK(UnownPicPointers)
.ok
	dec a
	ld bc, 6
	call AddNTimes
	ld bc, 3
	add hl, bc
	ld a, d
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, d
	call GetFarHalfword
	ld de, w6_d000
	pop af
	call FarDecompress
	ld hl, w6_d000
	ld c, 6 * 6
	call Function5127c
	pop hl
	ld de, w6_d000
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	ret
; 511c5


FixPicBank: ; 511c5
; This is a thing for some reason.
	push hl
	push bc
	sub PICS_1 - $36
	ld c, a
	ld b, 0
	ld hl, Unknown_511d4
	add hl, bc
	ld a, [hl]
	pop bc
	pop hl
	ret
; 511d4

Unknown_511d4: ; 511d4
	db PICS_1
	db PICS_2
	db PICS_3
	db PICS_4
	db PICS_5
	db PICS_6
	db PICS_7
	db PICS_8
	db PICS_9
	db PICS_10
	db PICS_11
	db PICS_12
	db PICS_13
	db PICS_14
	db PICS_15
	db PICS_16
	db PICS_17
	db PICS_18
	db PICS_19
	db PICS_19 + 1
	db PICS_19 + 2
	db PICS_19 + 3
	db PICS_19 + 4
	db PICS_19 + 5

Function511ec: ; 511ec
	ld a, c
	push de
	ld hl, PicPointers
	dec a
	ld bc, 6
	call AddNTimes
	ld a, BANK(PicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(PicPointers)
	call GetFarHalfword
	pop af
	pop de
	call FarDecompress
	ret
; 0x5120d


GetTrainerPic: ; 5120d
	ld a, [TrainerClass]
	and a
	ret z
	cp NUM_TRAINER_CLASSES
	ret nc
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld hl, TrainerPicPointers
	ld a, [TrainerClass]
	dec a
	ld bc, 3
	call AddNTimes
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld a, BANK(TrainerPicPointers)
	call GetFarByte
	call FixPicBank
	push af
	inc hl
	ld a, BANK(TrainerPicPointers)
	call GetFarHalfword
	pop af
	ld de, w6_d000
	call FarDecompress
	pop hl
	ld de, w6_d000
	ld c, 7 * 7
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	pop af
	ld [rSVBK], a
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret
; 5125d



DecompressPredef: ; 5125d
; Decompress lz data from b:hl to scratch space at 6:d000, then copy it to address de.

	ld a, [rSVBK]
	push af
	ld a, 6
	ld [rSVBK], a

	push de
	push bc
	ld a, b
	ld de, w6_d000
	call FarDecompress
	pop bc
	ld de, w6_d000
	pop hl
	ld a, [hROMBank]
	ld b, a
	call Get2bpp

	pop af
	ld [rSVBK], a
	ret
; 5127c


Function5127c: ; 5127c
	push de
	push bc
	ld a, [wc2c6]
	and a
	jr z, .asm_512a8
	ld a, c
	cp 7 * 7
	ld de, 7 * 7 * $10
	jr z, .asm_51296
	cp 6 * 6
	ld de, 6 * 6 * $10
	jr z, .asm_51296
	ld de, 5 * 5 * $10

.asm_51296
	ld a, [hl]
	ld b, $0
	ld c, $8
.asm_5129b
	rra
	rl b
	dec c
	jr nz, .asm_5129b
	ld a, b
	ld [hli], a
	dec de
	ld a, e
	or d
	jr nz, .asm_51296

.asm_512a8
	pop bc
	pop de
	ret
; 512ab

Function512ab: ; 512ab
	ld a, b
	cp 6
	jr z, .six
	cp 5
	jr z, .five

.seven
	ld c, $70
	call Function512f2
	dec b
	jr nz, .seven
	ret

.six
	ld c, $70
	xor a
	call .Fill
.asm_512c3
	ld c, $10
	xor a
	call .Fill
	ld c, $60
	call Function512f2
	dec b
	jr nz, .asm_512c3
	ret

.five
	ld c, $70
	xor a
	call .Fill
.asm_512d8
	ld c, $20
	xor a
	call .Fill
	ld c, $50
	call Function512f2
	dec b
	jr nz, .asm_512d8
	ld c, $70
	xor a
	call .Fill
	ret

.Fill
	ld [hli], a
	dec c
	jr nz, .Fill
	ret
; 512f2

Function512f2: ; 512f2
	ld a, [wc2c6]
	and a
	jr nz, .asm_512ff
.asm_512f8
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_512f8
	ret

.asm_512ff
	push bc
.asm_51300
	ld a, [de]
	inc de
	ld b, a
	xor a
	rept 8
	rr b
	rla
	endr
	ld [hli], a
	dec c
	jr nz, .asm_51300
	pop bc
	ret
; 51322

Function51322: ; 51322
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call Function513cb
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wd002
	call Function513e0
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMonOT
	ld bc, NAME_LENGTH
	ld de, wd00d
	call Function513e0
	ld a, [sBoxCount]
	dec a
	ld [wd265], a
	ld hl, sBoxMons
	ld bc, BOXMON_STRUCT_LENGTH
	ld de, wd018
	call Function513e0
	ld hl, wd01a
	ld de, TempMonMoves
	ld bc, NUM_MOVES
	call CopyBytes
	ld hl, wd02f
	ld de, TempMonPP
	ld bc, NUM_MOVES
	call CopyBytes
	ld a, [CurPartyMon]
	ld b, a
	callba Functiondcb6
	jp CloseSRAM
; 5138b

Function5138b: ; 5138b
	ld hl, PartyCount
	call Function513cb
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	ld de, wd002
	call Function513e0
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	ld de, wd00d
	call Function513e0
	ld a, [PartyCount]
	dec a
	ld [wd265], a
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	ld de, wd018
	call Function513e0
	ret
; 513cb

Function513cb: ; 513cb
	inc [hl]
	inc hl
	ld a, [CurPartyMon]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [CurPartySpecies]
	ld c, a
.asm_513d8
	ld a, [hl]
	ld [hl], c
	inc hl
	inc c
	ld c, a
	jr nz, .asm_513d8
	ret
; 513e0

Function513e0: ; 513e0
	push de
	push hl
	push bc
	ld a, [wd265]
	dec a
	call AddNTimes
	push hl
	add hl, bc
	ld d, h
	ld e, l
	pop hl
.asm_513ef
	push bc
	ld a, [wd265]
	ld b, a
	ld a, [CurPartyMon]
	cp b
	pop bc
	jr z, .asm_51415
	push hl
	push de
	push bc
	call CopyBytes
	pop bc
	pop de
	pop hl
	push hl
	ld a, l
	sub c
	ld l, a
	ld a, h
	sbc b
	ld h, a
	pop de
	ld a, [wd265]
	dec a
	ld [wd265], a
	jr .asm_513ef

.asm_51415
	pop bc
	pop hl
	ld a, [CurPartyMon]
	call AddNTimes
	ld d, h
	ld e, l
	pop hl
	call CopyBytes
	ret
; 51424

BaseData::
INCLUDE "data/base_stats.asm"

PokemonNames::
INCLUDE "data/pokemon_names.asm"

Unknown_53d84: ; unreferenced
	db $1a, $15
	db $33, $16
	db $4b, $17
	db $62, $18
	db $79, $19
	db $90, $1a
	db $a8, $1b
	db $c4, $1c
	db $e0, $1d
	db $f6, $1e
	db $ff, $1f
	db $ff, $20
; 53d9c

UnknownEggPic:: ; 53d9c
; Another egg pic. This is shifted up a few pixels.
INCBIN "gfx/misc/unknown_egg.5x5.2bpp.lz"
; 53e2e


SECTION "bank19", ROMX, BANK[$19]

INCLUDE "text/phone/extra.asm"



SECTION "bank20", ROMX, BANK[$20]


DoPlayerMovement:: ; 80000

	call GetMovementInput
	ld a, movement_step_sleep_1
	ld [MovementAnimation], a
	xor a
	ld [wd041], a
	call GetPlayerMovement
	ld c, a
	ld a, [MovementAnimation]
	ld [wc2de], a
	ret
; 80017


GetMovementInput: ; 80017

	ld a, [hJoyDown]
	ld [CurInput], a

; Standing downhill instead moves down.

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	ret z

	ld c, a
	and D_PAD
	ret nz

	ld a, c
	or D_DOWN
	ld [CurInput], a
	ret
; 8002d


GetPlayerMovement: ; 8002d

	ld a, [PlayerState]
	cp PLAYER_NORMAL
	jr z, .Normal
	cp PLAYER_SURF
	jr z, .Surf
	cp PLAYER_SURF_PIKA
	jr z, .Surf
	cp PLAYER_BIKE
	jr z, .Normal
	cp PLAYER_SLIP
	jr z, .Ice

.Normal
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TryStep
	ret c
	call TryJumpLedge
	ret c
	call CheckEdgeWarp
	ret c
	jr .NotMoving

.Surf
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TrySurfStep
	ret c
	jr .NotMoving

.Ice
	call CheckForcedMovementInput
	call GetMovementAction
	call CheckTileMovement
	ret c
	call CheckTurning
	ret c
	call TryStep
	ret c
	call TryJumpLedge
	ret c
	call CheckEdgeWarp
	ret c
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .HitWall
	call PlayBump
.HitWall
	call StandInPlace
	xor a
	ret

.NotMoving
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .Standing

; Walking into an edge warp won't bump.
	ld a, [EngineBuffer4]
	and a
	jr nz, .CantMove
	call PlayBump
.CantMove
	call WalkInPlace
	xor a
	ret

.Standing
	call StandInPlace
	xor a
	ret
; 800b7


CheckTileMovement: ; 800b7
; Tiles such as waterfalls and warps move the player
; in a given direction, overriding input.

	ld a, [PlayerNextTile]
	ld c, a
	call CheckWhirlpoolTile
	jr c, .asm_800c4
	ld a, 3
	scf
	ret

.asm_800c4
	and $f0
	cp $30 ; moving water
	jr z, .water
	cp $40 ; moving land 1
	jr z, .land1
	cp $50 ; moving land 2
	jr z, .land2
	cp $70 ; warps
	jr z, .warps
	jr .asm_8013c

.water
	ld a, c
	and 3
	ld c, a
	ld b, 0
	ld hl, .water_table
	add hl, bc
	ld a, [hl]
	ld [WalkingDirection], a
	jr .asm_8013e

.water_table
	db RIGHT
	db LEFT
	db UP
	db DOWN

.land1
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land1_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .asm_8013c
	ld [WalkingDirection], a
	jr .asm_8013e

.land1_table
	db STANDING
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING

.land2
	ld a, c
	and 7
	ld c, a
	ld b, 0
	ld hl, .land2_table
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr z, .asm_8013c
	ld [WalkingDirection], a
	jr .asm_8013e

.land2_table
	db RIGHT
	db LEFT
	db UP
	db DOWN
	db STANDING
	db STANDING
	db STANDING
	db STANDING

.warps
	ld a, c
	cp $71 ; door
	jr z, .down
	cp $79
	jr z, .down
	cp $7a ; stairs
	jr z, .down
	cp $7b ; cave
	jr nz, .asm_8013c

.down
	ld a, DOWN
	ld [WalkingDirection], a
	jr .asm_8013e

.asm_8013c
	xor a
	ret

.asm_8013e
	ld a, STEP_WALK
	call DoStep
	ld a, 5
	scf
	ret
; 80147


CheckTurning: ; 80147
; If the player is turning, change direction first. This also lets
; the player change facing without moving by tapping a direction.

	ld a, [wd04e]
	cp 0
	jr nz, .asm_80169
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .asm_80169

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr z, .asm_80169

	ld a, STEP_TURN
	call DoStep
	ld a, 2
	scf
	ret

.asm_80169
	xor a
	ret
; 8016b


TryStep: ; 8016b

; Surfing actually calls TrySurfStep directly instead of passing through here.
	ld a, [PlayerState]
	cp PLAYER_SURF
	jr z, TrySurfStep
	cp PLAYER_SURF_PIKA
	jr z, TrySurfStep

	call CheckLandPermissions
	jr c, .bump

	call IsNPCInFront
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [PlayerNextTile]
	call CheckIceTile
	jr nc, .ice

; Downhill riding is slower when not moving down.
	call CheckRiding
	jr nz, .walk

	ld hl, BikeFlags
	bit 2, [hl] ; downhill
	jr z, .fast

	ld a, [WalkingDirection]
	cp DOWN
	jr z, .fast

	ld a, STEP_WALK
	call DoStep
	scf
	ret

.fast
	ld a, STEP_BIKE
	call DoStep
	scf
	ret

.walk
	ld a, STEP_WALK
	call DoStep
	scf
	ret

.ice
	ld a, STEP_ICE
	call DoStep
	scf
	ret

; unused?
	xor a
	ret

.bump
	xor a
	ret
; 801c0


TrySurfStep: ; 801c0

	call CheckWaterPermissions
	ld [wd040], a
	jr c, .bump

	call IsNPCInFront
	ld [wd03f], a
	and a
	jr z, .bump
	cp 2
	jr z, .bump

	ld a, [wd040]
	and a
	jr nz, .ExitWater

	ld a, STEP_WALK
	call DoStep
	scf
	ret

.ExitWater
	call WaterToLandSprite
	call PlayMapMusic
	ld a, STEP_WALK
	call DoStep
	ld a, 6
	scf
	ret

.bump
	xor a
	ret
; 801f3


TryJumpLedge: ; 801f3
	ld a, [PlayerNextTile]
	ld e, a
	and $f0
	cp $a0 ; ledge
	jr nz, .DontJump

	ld a, e
	and 7
	ld e, a
	ld d, 0
	ld hl, .data_8021e
	add hl, de
	ld a, [FacingDirection]
	and [hl]
	jr z, .DontJump

	ld de, SFX_JUMP_OVER_LEDGE
	call PlaySFX
	ld a, STEP_LEDGE
	call DoStep
	ld a, 7
	scf
	ret

.DontJump
	xor a
	ret

.data_8021e
	db FACE_RIGHT
	db FACE_LEFT
	db FACE_UP
	db FACE_DOWN
	db FACE_RIGHT | FACE_DOWN
	db FACE_DOWN | FACE_LEFT
	db FACE_UP | FACE_RIGHT
	db FACE_UP | FACE_LEFT
; 80226


CheckEdgeWarp: ; 80226

; Bug: Since no case is made for STANDING here, it will check
; [.edgewarps + $ff]. This resolves to $3e at $8035a.
; This causes wd041 to be nonzero when standing on tile $3e,
; making bumps silent.

	ld a, [WalkingDirection]
	ld e, a
	ld d, 0
	ld hl, .EdgeWarps
	add hl, de
	ld a, [PlayerNextTile]
	cp [hl]
	jr nz, .nope

	ld a, 1
	ld [wd041], a
	ld a, [WalkingDirection]
	cp STANDING
	jr z, .nope

	ld e, a
	ld a, [PlayerDirection]
	rrca
	rrca
	and 3
	cp e
	jr nz, .nope
	call WarpCheck
	jr nc, .nope

	call StandInPlace
	scf
	ld a, 1
	ret

.nope
	xor a
	ret

.EdgeWarps
	db $70, $78, $76, $7e
; 8025f


DoStep: ; 8025f
	ld e, a
	ld d, 0
	ld hl, .Steps
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a

	ld a, [WalkingDirection]
	ld e, a
	cp STANDING
	jp z, StandInPlace

	add hl, de
	ld a, [hl]
	ld [MovementAnimation], a

	ld hl, .WalkInPlace
	add hl, de
	ld a, [hl]
	ld [wd04e], a

	ld a, 4
	ret

.Steps
	dw .Slow
	dw .Walk
	dw .Bike
	dw .Ledge
	dw .Ice
	dw .Turn
	dw .BackwardsLedge
	dw .WalkInPlace

.Slow
	slow_step_down
	slow_step_up
	slow_step_left
	slow_step_right
.Walk
	step_down
	step_up
	step_left
	step_right
.Bike
	big_step_down
	big_step_up
	big_step_left
	big_step_right
.Ledge
	jump_step_down
	jump_step_up
	jump_step_left
	jump_step_right
.Ice
	fast_slide_step_down
	fast_slide_step_up
	fast_slide_step_left
	fast_slide_step_right
.BackwardsLedge
	jump_step_up
	jump_step_down
	jump_step_right
	jump_step_left
.Turn
	half_step_down
	half_step_up
	half_step_left
	half_step_right
.WalkInPlace
	db $80 + movement_turn_head_down
	db $80 + movement_turn_head_up
	db $80 + movement_turn_head_left
	db $80 + movement_turn_head_right
; 802b3


StandInPlace: ; 802b3
	ld a, 0
	ld [wd04e], a
	ld a, movement_step_sleep_1
	ld [MovementAnimation], a
	xor a
	ret
; 802bf


WalkInPlace: ; 802bf
	ld a, 0
	ld [wd04e], a
	ld a, movement_step_bump
	ld [MovementAnimation], a
	xor a
	ret
; 802cb


CheckForcedMovementInput: ; 802cb
; When sliding on ice, input is forced to remain in the same direction.

	call CheckStandingOnIce
	ret nc

	ld a, [wd04e]
	cp 0
	ret z

	and 3
	ld e, a
	ld d, 0
	ld hl, .data_802e8
	add hl, de
	ld a, [CurInput]
	and BUTTONS
	or [hl]
	ld [CurInput], a
	ret

.data_802e8
	db D_DOWN, D_UP, D_LEFT, D_RIGHT
; 802ec


GetMovementAction: ; 802ec
; Poll player input and update movement info.

	ld hl, .table
	ld de, .table2 - .table1
	ld a, [CurInput]
	bit 7, a
	jr nz, .down
	bit 6, a
	jr nz, .up
	bit 5, a
	jr nz, .left
	bit 4, a
	jr nz, .right
; Standing
	jr .update

.down 	add hl, de
.up   	add hl, de
.left 	add hl, de
.right	add hl, de

.update
	ld a, [hli]
	ld [WalkingDirection], a
	ld a, [hli]
	ld [FacingDirection], a
	ld a, [hli]
	ld [WalkingX], a
	ld a, [hli]
	ld [WalkingY], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld [WalkingTile], a
	ret

.table
; struct:
;	walk direction
;	facing
;	x movement
;	y movement
;	tile collision pointer
.table1
	db STANDING, FACE_CURRENT, 0, 0
	dw PlayerNextTile
.table2
	db RIGHT, FACE_RIGHT,  1,  0
	dw TileRight
	db LEFT,  FACE_LEFT,  -1,  0
	dw TileLeft
	db UP,    FACE_UP,     0, -1
	dw TileUp
	db DOWN,  FACE_DOWN,   0,  1
	dw TileDown
; 80341


IsNPCInFront: ; 80341
; Returns 0 if there is an NPC in front that you can't move
; Returns 1 if there is no NPC in front
; Returns 2 if there is a movable NPC in front
	ld a, 0
	ld [hMapObjectIndexBuffer], a
; Load the next X coordinate into d
	ld a, [PlayerNextMapX]
	ld d, a
	ld a, [WalkingX]
	add d
	ld d, a
; Load the next Y coordinate into e
	ld a, [PlayerNextMapY]
	ld e, a
	ld a, [WalkingY]
	add e
	ld e, a
; Find an object struct with coordinates equal to d,e
	ld bc, ObjectStructs ; redundant
	callba IsNPCAtCoord
	jr nc, .nope
	call Function8036f
	jr c, .no_bump

; .bump
	xor a
	ret

.nope
	ld a, 1
	ret

.no_bump
	ld a, 2
	ret
; 8036f


Function8036f: ; 8036f

	ld hl, BikeFlags
	bit 0, [hl] ; using strength
	jr z, .nope

	ld hl, OBJECT_DIRECTION_WALKING
	add hl, bc
	ld a, [hl]
	cp STANDING
	jr nz, .nope

	ld hl, OBJECT_PALETTE
	add hl, bc
	bit 6, [hl]
	jr z, .nope

	ld hl, OBJECT_FLAGS2
	add hl, bc
	set 2, [hl]

	ld a, [WalkingDirection]
	ld d, a
	ld hl, OBJECT_RANGE
	add hl, bc
	ld a, [hl]
	and $fc
	or d
	ld [hl], a

	scf
	ret

.nope
	xor a
	ret
; 8039e


CheckLandPermissions: ; 8039e
; Return 0 if walking onto land and tile permissions allow it.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotWalkable

	ld a, [WalkingTile]
	call CheckWalkable
	jr c, .NotWalkable

	xor a
	ret

.NotWalkable
	scf
	ret
; 803b4

CheckWaterPermissions: ; 803b4
; Return 0 if moving in water, or 1 if moving onto land.
; Otherwise, return carry.

	ld a, [TilePermissions]
	ld d, a
	ld a, [FacingDirection]
	and d
	jr nz, .NotSurfable

	ld a, [WalkingTile]
	call CheckSurfable
	jr c, .NotSurfable

	and a
	ret

.NotSurfable
	scf
	ret
; 803ca


CheckRiding: ; 803ca

	ld a, [PlayerState]
	cp PLAYER_BIKE
	ret z
	cp PLAYER_SLIP
	ret
; 803d3


CheckWalkable: ; 803d3
; Return 0 if tile a is land. Otherwise, return carry.

	call GetTileCollision
	and a ; land
	ret z
	scf
	ret
; 803da


CheckSurfable: ; 803da
; Return 0 if tile a is water, or 1 if land.
; Otherwise, return carry.

	call GetTileCollision
	cp 1
	jr z, .Water

; Can walk back onto land from water.
	and a
	jr z, .Land

	jr .Neither

.Water
	xor a
	ret

.Land
	ld a, 1
	and a
	ret

.Neither
	scf
	ret
; 803ee


PlayBump: ; 803ee

	call CheckSFX
	ret c
	ld de, SFX_BUMP
	call PlaySFX
	ret
; 803f9


WaterToLandSprite: ; 803f9
	push bc
	ld a, PLAYER_NORMAL
	ld [PlayerState], a
	call ReplaceKrisSprite ; UpdateSprites
	pop bc
	ret
; 80404


CheckStandingOnIce:: ; 80404
	ld a, [wd04e]
	cp 0
	jr z, .nope
	cp $f0
	jr z, .nope
	ld a, [PlayerNextTile]
	call CheckIceTile
	jr nc, .yep
	ld a, [PlayerState]
	cp PLAYER_SLIP
	jr nz, .nope

.yep
	scf
	ret

.nope
	and a
	ret
; 80422


Function80422:: ; 80422
	ld hl, wc2de
	ld a, movement_step_sleep_1
	cp [hl]
	ret z

	ld [hl], a
	ld a, 0
	ld [wd04e], a
	ret
; 80430



EngineFlagAction:: ; 80430
; Do action b on engine flag de
;
;   b = 0: reset flag
;     = 1: set flag
;     > 1: check flag, result in c
;
; Setting/resetting does not return a result.


; 16-bit flag ids are considered invalid, but it's nice
; to know that the infrastructure is there.

	ld a, d
	cp 0
	jr z, .ceiling
	jr c, .read ; cp 0 can't set carry!
	jr .invalid

; There are only $a2 engine flags, so
; anything beyond that is invalid too.

.ceiling
	ld a, e
	cp NUM_ENGINE_FLAGS
	jr c, .read

; Invalid flags are treated as flag 00.

.invalid
	xor a
	ld e, a
	ld d, a

; Get this flag's location.

.read
	ld hl, EngineFlags
; location
rept 2
	add hl, de
endr
; bit
	add hl, de

; location
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
; bit
	ld c, [hl]

; What are we doing with this flag?

	ld a, b
	cp 1
	jr c, .reset ; b = 0
	jr z, .set   ; b = 1

; Return the given flag in c.
.check
	ld a, [de]
	and c
	ld c, a
	ret

; Set the given flag.
.set
	ld a, [de]
	or c
	ld [de], a
	ret

; Reset the given flag.
.reset
	ld a, c
	cpl ; AND all bits except the one in question
	ld c, a
	ld a, [de]
	and c
	ld [de], a
	ret
; 80462


EngineFlags: ; 80462
INCLUDE "engine/engine_flags.asm"
; 80648



_GetVarAction:: ; 80648 (20:4648)
	ld a, c
	cp NUM_VARS
	jr c, .valid
	xor a
.valid
	ld c, a
	ld b, 0
	ld hl, .VarActionTable
rept 3
	add hl, bc
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	inc hl
	ld b, [hl]
	ld a, b
	and RETVAR_EXECUTE
	jr nz, .call
	ld a, b
	and RETVAR_ADDR_DE
	ret nz
	ld a, [de]
	jr .loadstringbuffer2

.call
	call _de_
	ret

.loadstringbuffer2: ; 8066c (20:466c)
	ld de, StringBuffer2
	ld [de], a
	ret
; 80671 (20:4671)

.VarActionTable: ; 80671
; $00: copy [de] to StringBuffer2
; $40: return address in de
; $80: call function
	dwb StringBuffer2,         RETVAR_STRBUF2
	dwb PartyCount,            RETVAR_STRBUF2
	dwb .BattleResult,         RETVAR_EXECUTE
	dwb BattleType,            RETVAR_ADDR_DE
	dwb TimeOfDay,             RETVAR_STRBUF2
	dwb .CountCaughtMons,      RETVAR_EXECUTE
	dwb .CountSeenMons,        RETVAR_EXECUTE
	dwb .CountBadges,          RETVAR_EXECUTE
	dwb PlayerState,           RETVAR_ADDR_DE
	dwb .PlayerFacing,         RETVAR_EXECUTE
	dwb hHours,                RETVAR_STRBUF2
	dwb .DayOfWeek,            RETVAR_EXECUTE
	dwb MapGroup,              RETVAR_STRBUF2
	dwb MapNumber,             RETVAR_STRBUF2
	dwb .UnownCaught,          RETVAR_EXECUTE
	dwb wPermission,           RETVAR_STRBUF2
	dwb .BoxFreeSpace,         RETVAR_EXECUTE
	dwb wBugContestMinsRemaining,                 RETVAR_STRBUF2
	dwb XCoord,                RETVAR_STRBUF2
	dwb YCoord,                RETVAR_STRBUF2
	dwb wSpecialPhoneCallID,   RETVAR_STRBUF2
	dwb wcf64,                 RETVAR_STRBUF2
	dwb wKurtApricornQuantity, RETVAR_STRBUF2
	dwb wCurrentCaller,        RETVAR_ADDR_DE
	dwb wBlueCardBalance,      RETVAR_ADDR_DE
	dwb wBuenasPassword,       RETVAR_ADDR_DE
	dwb wdc58,                 RETVAR_STRBUF2
	dwb NULL,                  RETVAR_STRBUF2
; 806c5

.CountCaughtMons: ; 806c5
; Caught mons.
	ld hl, PokedexCaught
	ld b, EndPokedexCaught - PokedexCaught
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806d3

.CountSeenMons: ; 806d3
; Seen mons.
	ld hl, PokedexSeen
	ld b, EndPokedexSeen - PokedexSeen
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806e1

.CountBadges: ; 806e1
; Number of owned badges.
	ld hl, Badges
	ld b, 2
	call CountSetBits
	ld a, [wd265]
	jp .loadstringbuffer2
; 806ef

.PlayerFacing: ; 806ef
; The direction the player is facing.
	ld a, [PlayerDirection]
	and $c
	rrca
	rrca
	jp .loadstringbuffer2
; 806f9

.DayOfWeek: ; 806f9
; The day of the week.
	call GetWeekday
	jp .loadstringbuffer2
; 806ff

.UnownCaught: ; 806ff
; Number of unique Unown caught.
	call .count
	ld a, b
	jp .loadstringbuffer2

.count
	ld hl, UnownDex
	ld b, 0
.loop
	ld a, [hli]
	and a
	ret z
	inc b
	ld a, b
	cp 26
	jr c, .loop
	ret
; 80715

.BoxFreeSpace: ; 80715
; Remaining slots in the current box.
	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	ld a, MONS_PER_BOX
	sub [hl]
	ld b, a
	call CloseSRAM
	ld a, b
	jp .loadstringbuffer2
; 80728

.BattleResult: ; 80728
	ld a, [wBattleResult]
	and $3f
	jp .loadstringbuffer2
; 80730


BattleText::
INCLUDE "text/battle.asm"


ColorTest: ; 818ac
; A debug menu to test monster and trainer palettes at runtime.

	ld a, [hCGB]
	and a
	jr nz, .asm_818b5
	ld a, [hSGB]
	and a
	ret z

.asm_818b5
	ld a, [hInMenu]
	push af
	ld a, $1
	ld [hInMenu], a
	call DisableLCD
	call Function81948
	call Function8197c
	call Function819a7
	call Function818f4
	call EnableLCD
	ld de, MUSIC_NONE
	call PlayMusic
	xor a
	ld [wJumptableIndex], a
	ld [wcf66], a
	ld [wd003], a
.asm_818de
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_818f0
	call Function81a74
	call Function81f5e
	call DelayFrame
	jr .asm_818de

.asm_818f0
	pop af
	ld [hInMenu], a
	ret
; 818f4

Function818f4: ; 818f4
	ld a, [wd002]
	and a
	jr nz, Function81911
	ld hl, PokemonPalettes

Function818fd: ; 818fd
	ld de, OverworldMap
	ld c, NUM_POKEMON + 1
.asm_81902
	push bc
	push hl
	call Function81928
	pop hl
	ld bc, 8
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_81902
	ret

Function81911: ; 81911
	ld hl, TrainerPalettes
	ld de, OverworldMap
	ld c, NUM_TRAINER_CLASSES
.asm_81919
	push bc
	push hl
	call Function81928
	pop hl
	ld bc, 4
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_81919
	ret
; 81928

Function81928: ; 81928
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	inc hl
	ld a, BANK(PokemonPalettes) ; BANK(TrainerPalettes)
	call GetFarByte
	ld [de], a
	inc de
	ret
; 81948

Function81948: ; 81948
	ld a, $1
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	ld a, $0
	ld [rVBK], a
	ld hl, VTiles0
	ld bc, sScratch - VTiles0
	xor a
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	xor a
	call ByteFill
	call ClearSprites
	ret
; 8197c

Function8197c: ; 8197c
	ld hl, DebugColorTestGFX + $10
	ld de, VTiles2 tile $6a
	ld bc, $160
	call CopyBytes
	ld hl, DebugColorTestGFX
	ld de, VTiles0
	ld bc, $10
	call CopyBytes
	call LoadStandardFont
	ld hl, VTiles1
	lb bc, 8, 0
.asm_8199d
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_8199d
	ret
; 819a7

Function819a7: ; 819a7
	ld a, [hCGB]
	and a
	ret z
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_819f4
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	ld a, $80
	ld [rBGPI], a
	ld hl, Palette_819f4
	ld c, $40
	xor a
.asm_819c8
	ld [rBGPD], a
	dec c
	jr nz, .asm_819c8
	ld a, $80
	ld [rOBPI], a
	ld hl, Palette_81a34
	ld c, $40
.asm_819d6
	ld a, [hli]
	ld [rOBPD], a
	dec c
	jr nz, .asm_819d6
	ld a, $94
	ld [wc608], a
	ld a, $52
	ld [wc608 + 1], a
	ld a, $4a
	ld [wc608 + 2], a
	ld a, $29
	ld [wc608 + 3], a
	pop af
	ld [rSVBK], a
	ret
; 819f4

Palette_819f4: ; 819f4
	; white
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	; red
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 00, 00, 00

	; green
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 00, 00

	; blue
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

Palette_81a34: ; 81a34
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 00, 00, 00

	; red
	RGB 31, 31, 31
	RGB 31, 00, 00
	RGB 31, 00, 00
	RGB 00, 00, 00

	; green
	RGB 31, 31, 31
	RGB 00, 31, 00
	RGB 00, 31, 00
	RGB 00, 00, 00

	; blue
	RGB 31, 31, 31
	RGB 00, 00, 31
	RGB 00, 00, 31
	RGB 00, 00, 00
; 81a74

Function81a74: ; 81a74
	call JoyTextDelay
	ld a, [wJumptableIndex]
	cp $4
	jr nc, .asm_81a8b
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .asm_81a9a
	ld a, [hl]
	and START
	jr nz, .asm_81aab

.asm_81a8b
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_81acf
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.asm_81a9a
	call Function81eca
	call Function81ac3
	ld e, a
	ld a, [wcf66]
	inc a
	cp e
	jr c, .asm_81aba
	xor a
	jr .asm_81aba

.asm_81aab
	call Function81eca
	ld a, [wcf66]
	dec a
	cp $ff
	jr nz, .asm_81aba
	call Function81ac3
	dec a

.asm_81aba
	ld [wcf66], a
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81ac3

Function81ac3: ; 81ac3
; Looping back around the pic set.
	ld a, [wd002]
	and a
	jr nz, .asm_81acc
	ld a, NUM_POKEMON ; CELEBI
	ret

.asm_81acc
	ld a, NUM_TRAINER_CLASSES - 1 ; MYSTICALMAN
	ret
; 81acf

Jumptable_81acf: ; 81acf
	dw Function81adb
	dw Function81c18
	dw Function81c33
	dw Function81cc2
	dw Function81d8e
	dw Function81daf
; 81adb

Function81adb: ; 81adb
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $6f
	call ByteFill
	hlcoord 1, 3
	lb bc, 7, 18
	ld a, $6c
	call Bank20_FillBoxWithByte
	hlcoord 11, 0
	lb bc, 2, 3
	ld a, $6d
	call Bank20_FillBoxWithByte
	hlcoord 16, 0
	lb bc, 2, 3
	ld a, $6e
	call Bank20_FillBoxWithByte
	call Function81bc0
	call Function81bf4
	ld a, [wcf66]
	inc a
	ld [CurPartySpecies], a
	ld [wd265], a
	hlcoord 0, 1
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	ld a, [wd002]
	and a
	jr nz, .asm_81b7a
	ld a, $1
	ld [UnownLetter], a
	call GetPokemonName
	hlcoord 4, 1
	call PlaceString
	xor a
	ld [wc2c6], a
	hlcoord 12, 3
	call _PrepMonFrontpic
	ld de, VTiles2 tile $31
	predef GetBackpic
	ld a, $31
	ld [hFillBox], a
	hlcoord 2, 4
	lb bc, 6, 6
	predef FillBox
	ld a, [wd003]
	and a
	jr z, .asm_81b66
	ld de, String_81baf
	jr .asm_81b69

.asm_81b66
	ld de, String_81bb4

.asm_81b69
	hlcoord 7, 17
	call PlaceString
	hlcoord 0, 17
	ld de, String_81bb9
	call PlaceString
	jr .asm_81ba9

.asm_81b7a
	ld a, [wd265]
	ld [TrainerClass], a
	callab Function3957b
	ld de, StringBuffer1
	hlcoord 4, 1
	call PlaceString
	ld de, VTiles2
	callab GetTrainerPic
	xor a
	ld [TempEnemyMonSpecies], a
	ld [hFillBox], a
	hlcoord 2, 3
	lb bc, 7, 7
	predef FillBox

.asm_81ba9
	ld a, $1
	ld [wJumptableIndex], a
	ret
; 81baf

String_81baf: db "レア", $6f, $6f, "@" ; rare (shiny)
String_81bb4: db "ノーマル@" ; normal
String_81bb9: db $7a, "きりかえ▶@" ; (A) switches
; 81bc0

Function81bc0: ; 81bc0
	decoord 0, 11, AttrMap
	hlcoord 2, 11
	ld a, $1
	call Function81bde
	decoord 0, 13, AttrMap
	hlcoord 2, 13
	ld a, $2
	call Function81bde
	decoord 0, 15, AttrMap
	hlcoord 2, 15
	ld a, $3

Function81bde: ; 81bde
	push af
	ld a, $6a
	ld [hli], a
	ld bc, $f
	ld a, $6b
	call ByteFill
	ld l, e
	ld h, d
	pop af
	ld bc, $28
	call ByteFill
	ret
; 81bf4

Function81bf4: ; 81bf4
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld de, OverworldMap
	add hl, de
	ld de, wc608
	ld bc, 4
	call CopyBytes
	xor a
	ld [wcf64], a
	ld [wcf65], a
	ld de, wc608
	call Function81ea5
	ret
; 81c18

Function81c18: ; 81c18
	ld a, [hCGB]
	and a
	jr z, .asm_81c2a
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame

.asm_81c2a
	call WaitBGMap
	ld a, $2
	ld [wJumptableIndex], a
	ret
; 81c33

Function81c33: ; 81c33
	ld a, [hCGB]
	and a
	jr z, .asm_81c69
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld de, wc608
	ld c, $1
	call Function81ee3
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7
	ld a, $1
	ld [hCGBPalUpdate], a
	ld a, $3
	ld [wJumptableIndex], a
	pop af
	ld [rSVBK], a
	ret

.asm_81c69
	ld hl, wcda9
	ld a, $1
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	ld a, [wc608]
	ld [hli], a
	ld a, [wc608 + 1]
	ld [hli], a
	ld a, [wc608 + 2]
	ld [hli], a
	ld a, [wc608 + 3]
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	ld [hl], a
	ld hl, wcda9
	call Function81f0c
	hlcoord 10, 2
	ld de, wc608
	call Function81ca7
	hlcoord 15, 2
	ld de, wc608 + 2
	call Function81ca7
	ld a, $3
	ld [wJumptableIndex], a
	ret
; 81ca7

Function81ca7: ; 81ca7
rept 3
	inc hl
endr
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a
	call Function81cbc
	inc de
	ld a, [de]
	call Function81cbc
	ld a, [de]
	swap a

Function81cbc: ; 81cbc
	and $f
	add $70
	ld [hld], a
	ret
; 81cc2

Function81cc2: ; 81cc2
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_81cdf
	ld a, [hJoyLast]
	and A_BUTTON
	jr nz, .asm_81ce5
	ld a, [wcf64]
	and $3
	ld e, a
	ld d, 0
	ld hl, Jumptable_81d02
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.asm_81cdf
	ld a, $4
	ld [wJumptableIndex], a
	ret

.asm_81ce5
	ld a, [wd002]
	and a
	ret nz
	ld a, [wd003]
	xor $4
	ld [wd003], a
	ld c, a
	ld b, 0
	ld hl, PokemonPalettes
	add hl, bc
	call Function818fd
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81d02

Jumptable_81d02: ; 81d02
	dw Function81d0a
	dw Function81d34
	dw Function81d46
	dw Function81d58
; 81d0a

Function81d0a: ; 81d0a
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_81d1d
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_81d28
	ret

.asm_81d1d
	xor a
	ld [wcf65], a
	ld de, wc608
	call Function81ea5
	ret

.asm_81d28
	ld a, $1
	ld [wcf65], a
	ld de, wc608 + 2
	call Function81ea5
	ret

Function81d34: ; 81d34
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 10
	jr Function81d63

Function81d46: ; 81d46
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function81d89
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 11
	jr Function81d63

Function81d58: ; 81d58
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function81d84
	ld hl, wc608 + 12

Function81d63: ; 81d63
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, Function81d70
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, Function81d77
	ret

Function81d70: ; 81d70
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr Function81d7b

Function81d77: ; 81d77
	ld a, [hl]
	and a
	ret z
	dec [hl]

Function81d7b: ; 81d7b
	call Function81e67
	ld a, $2
	ld [wJumptableIndex], a
	ret

Function81d84: ; 81d84
	ld hl, wcf64
	dec [hl]
	ret

Function81d89: ; 81d89
	ld hl, wcf64
	inc [hl]
	ret
; 81d8e

Function81d8e: ; 81d8e
	hlcoord 0, 10
	ld bc, $a0
	ld a, $6f
	call ByteFill
	hlcoord 2, 12
	ld de, String_81fcd
	call PlaceString
	xor a
	ld [wd004], a
	call Function81df4
	ld a, $5
	ld [wJumptableIndex], a
	ret
; 81daf

Function81daf: ; 81daf
	ld hl, hJoyPressed
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_81dbb
	call Function81dc7
	ret

.asm_81dbb
	ld a, $0
	ld [wJumptableIndex], a
	ret
; 81dc1

Function81dc1: ; 81dc1
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; 81dc7

Function81dc7: ; 81dc7
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, .asm_81dd5
	ld a, [hl]
	and D_DOWN
	jr nz, .asm_81de2
	ret

.asm_81dd5
	ld a, [wd004]
	cp $3b
	jr z, .asm_81ddf
	inc a
	jr .asm_81ded

.asm_81ddf
	xor a
	jr .asm_81ded

.asm_81de2
	ld a, [wd004]
	and a
	jr z, .asm_81deb
	dec a
	jr .asm_81ded

.asm_81deb
	ld a, $3b

.asm_81ded
	ld [wd004], a
	call Function81df4
	ret
; 81df4

Function81df4: ; 81df4
	hlcoord 10, 11
	call Function81e5e
	hlcoord 10, 12
	call Function81e5e
	hlcoord 10, 13
	call Function81e5e
	hlcoord 10, 14
	call Function81e5e
	ld a, [wd004]
	inc a
	ld [wd265], a
	predef GetTMHMMove
	ld a, [wd265]
	ld [wd262], a
	call GetMoveName
	hlcoord 10, 12
	call PlaceString
	ld a, [wd004]
	call Function81e55
	ld [CurItem], a
	predef CanLearnTMHMMove
	ld a, c
	and a
	ld de, String_81e46
	jr nz, .asm_81e3f
	ld de, String_81e4d

.asm_81e3f
	hlcoord 10, 14
	call PlaceString
	ret
; 81e46

String_81e46: db "おぼえられる@" ; can be taught
String_81e4d: db "おぼえられない@" ; cannot be taught
; 81e55

Function81e55: ; 81e55
	cp $32
	jr c, .asm_81e5b
rept 2
	inc a
endr

.asm_81e5b
	add $bf
	ret
; 81e5e

Function81e5e: ; 81e5e
	ld bc, $a
	ld a, $6f
	call ByteFill
	ret
; 81e67

Function81e67: ; 81e67
	ld a, [wc608 + 10]
	and $1f
	ld e, a
	ld a, [wc608 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf65]
	and a
	jr z, .asm_81e9c
	ld a, e
	ld [wc608 + 2], a
	ld a, d
	ld [wc608 + 3], a
	ret

.asm_81e9c
	ld a, e
	ld [wc608], a
	ld a, d
	ld [wc608 + 1], a
	ret
; 81ea5

Function81ea5: ; 81ea5
	ld a, [de]
	and $1f
	ld [wc608 + 10], a
	ld a, [de]
	and $e0
	swap a
	srl a
	ld b, a
	inc de
	ld a, [de]
	and $3
	swap a
	srl a
	or b
	ld [wc608 + 11], a
	ld a, [de]
	and $7c
	srl a
	srl a
	ld [wc608 + 12], a
	ret
; 81eca

Function81eca: ; 81eca
	ld a, [wcf66]
	inc a
	ld l, a
	ld h, $0
rept 2
	add hl, hl
endr
	ld de, OverworldMap
	add hl, de
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 4
	call CopyBytes
	ret
; 81ee3

Function81ee3: ; 81ee3
.asm_81ee3
	ld a, $ff
	ld [hli], a
	ld a, $7f
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	xor a
rept 2
	ld [hli], a
endr
	dec c
	jr nz, .asm_81ee3
	ret
; 81efc

Bank20_FillBoxWithByte: ; 81efc
; For some reason, we have another copy of FillBoxWithByte here
.row
	push bc
	push hl
.col
	ld [hli], a
	dec c
	jr nz, .col
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .row
	ret
; 81f0c

Function81f0c: ; 81f0c
	ld a, [wcfbe]
	push af
	set 7, a
	ld [wcfbe], a
	call Function81f1d
	pop af
	ld [wcfbe], a
	ret
; 81f1d

Function81f1d: ; 81f1d
	ld a, [hl]
	and $7
	ret z
	ld b, a
.asm_81f22
	push bc
	xor a
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld b, $10
.asm_81f2c
	ld e, $8
	ld a, [hli]
	ld d, a
.asm_81f30
	bit 0, d
	ld a, $10
	jr nz, .asm_81f38
	ld a, $20

.asm_81f38
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	rr d
	dec e
	jr nz, .asm_81f30
	dec b
	jr nz, .asm_81f2c
	ld a, $20
	ld [rJOYP], a
	ld a, $30
	ld [rJOYP], a
	ld de, 7000
.asm_81f51
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_81f51
	pop bc
	dec b
	jr nz, .asm_81f22
	ret
; 81f5e

Function81f5e: ; 81f5e
	ld a, $6f
	hlcoord 10, 0
	ld [hl], a
	hlcoord 15, 0
	ld [hl], a
	hlcoord 1, 11
	ld [hl], a
	hlcoord 1, 13
	ld [hl], a
	hlcoord 1, 15
	ld [hl], a
	ld a, [wJumptableIndex]
	cp $3
	jr nz, .asm_81fc9
	ld a, [wcf64]
	and a
	jr z, .asm_81f8d
	dec a
	hlcoord 1, 11
	ld bc, 2 * SCREEN_WIDTH
	call AddNTimes
	ld [hl], $ed

.asm_81f8d
	ld a, [wcf65]
	and a
	jr z, .asm_81f98
	hlcoord 15, 0
	jr .asm_81f9b

.asm_81f98
	hlcoord 10, 0

.asm_81f9b
	ld [hl], $ed
	ld b, $70
	ld c, $5
	ld hl, Sprites
	ld de, wc608 + 10
	call .asm_81fb7
	ld de, wc608 + 11
	call .asm_81fb7
	ld de, wc608 + 12
	call .asm_81fb7
	ret

.asm_81fb7
	ld a, b
	ld [hli], a
	ld a, [de]
rept 2
	add a
endr
	add $18
	ld [hli], a
	xor a
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $10
	add b
	ld b, a
	inc c
	ret

.asm_81fc9
	call ClearSprites
	ret
; 81fcd

String_81fcd: ; 81fcd
	db   "おわりますか?" ; Are you finished?
	next "はい", $f2, $f2, $f2, $7a ; YES (A)
	next "いいえ",    $f2, $f2, $7b ; NO  (B)
	db   "@"
; 81fe3

DebugColorTestGFX:
INCBIN "gfx/debug/color_test.2bpp"


TilesetColorTest:
	ret
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [wcf66], a
	ld [hMapAnims], a
	call ClearSprites
	call OverworldTextModeSwitch
	call Function3200
	xor a
	ld [hBGMapMode], a
	ld de, DebugColorTestGFX + $10
	ld hl, VTiles2 tile $6a
	lb bc, BANK(DebugColorTestGFX), $16
	call Request2bpp
	ld de, DebugColorTestGFX
	ld hl, VTiles1
	lb bc, BANK(DebugColorTestGFX), 1
	call Request2bpp
	ld a, VBGMap1 / $100
	ld [hBGMapAddress + 1], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $6f
	call ByteFill
	hlcoord 0, 0, AttrMap
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, $7
	call ByteFill
	ld de, $15
	ld a, $6c
	call Function821d2
	ld de, $1a
	ld a, $6d
	call Function821d2
	ld de, $1f
	ld a, $6e
	call Function821d2
	ld de, $24
	ld a, $6f
	call Function821d2
	call Function821f4
	call Function8220f
	call Function3200
	ld [wJumptableIndex], a
	ld a, $40
	ld [hWY], a
	ret
; 821d2

Function821d2: ; 821d2
	hlcoord 0, 0
	call Function821de

Function821d8: ; 821d8
	ld a, [wcf64]
	hlcoord 0, 0, AttrMap

Function821de: ; 821de
	add hl, de
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ld bc, $10
	add hl, bc
rept 4
	ld [hli], a
endr
	ret
; 821f4

Function821f4: ; 821f4
	hlcoord 2, 4
	call Function82203
	hlcoord 2, 6
	call Function82203
	hlcoord 2, 8

Function82203: ; 82203
	ld a, $6a
	ld [hli], a
	ld bc, $10 - 1
	ld a, $6b
	call ByteFill
	ret
; 8220f

Function8220f: ; 8220f
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf64]
	ld l, a
	ld h, $0
rept 3
	add hl, hl
endr
	ld de, wMapPals
	add hl, de
	ld de, wc608
	ld bc, 8
	call CopyBytes
	ld de, wc608
	call Function81ea5
	pop af
	ld [rSVBK], a
	ret
; 82236


Function82236: ; 82236
	ld hl, hJoyLast
	ld a, [hl]
	and SELECT
	jr nz, .loop7
	ld a, [hl]
	and B_BUTTON
	jr nz, .asm_82299
	call Function822f0
	ret

.loop7
	ld hl, wcf64
	ld a, [hl]
	inc a
	and $7
	cp $7
	jr nz, .asm_82253
	xor a

.asm_82253
	ld [hl], a
	ld de, $15
	call Function821d8
	ld de, $1a
	call Function821d8
	ld de, $1f
	call Function821d8
	ld de, $24
	call Function821d8
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld a, [wcf64]
	ld bc, 8
	call AddNTimes
	ld de, wc608
	ld bc, 8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $2
	ld [hBGMapMode], a
	ld c, 3
	call DelayFrames
	ld a, $1
	ld [hBGMapMode], a
	ret

.asm_82299
	call ClearSprites
	ld a, [hWY]
	xor $d0
	ld [hWY], a
	ret
; 822a3

Function822a3: ; 822a3
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld a, [wcf64]
	ld bc, 8
	call AddNTimes
	ld e, l
	ld d, h
	ld hl, wc608
	ld bc, 8
	call CopyBytes
	hlcoord 1, 0
	ld de, wc608
	call Function81ca7
	hlcoord 6, 0
	ld de, wc608 + 2
	call Function81ca7
	hlcoord 11, 0
	ld de, wc608 + 4
	call Function81ca7
	hlcoord 16, 0
	ld de, wc608 + 6
	call Function81ca7
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	ret
; 822f0

Function822f0: ; 822f0
	ld a, [wcf65]
	and 3
	ld e, a
	ld d, 0
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 82301

.jumptable: ; 82301
	dw Function82309
	dw Function82339
	dw Function8234b
	dw Function8235d
; 82309

Function82309: ; 82309
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_LEFT
	jr nz, .asm_8231c
	ld a, [hl]
	and D_RIGHT
	jr nz, .asm_82322
	ret

.asm_8231c
	ld a, [wcf66]
	dec a
	jr .asm_82326

.asm_82322
	ld a, [wcf66]
	inc a

.asm_82326
	and $3
	ld [wcf66], a
	ld e, a
	ld d, $0
	ld hl, wc608
rept 2
	add hl, de
endr
	ld e, l
	ld d, h
	call Function81ea5
	ret

Function82339: ; 82338
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 10
	jr Function82368

Function8234b: ; 8234b
	ld hl, hJoyLast
	ld a, [hl]
	and D_DOWN
	jr nz, Function8238c
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 11
	jr Function82368

Function8235d: ; 8235d
	ld hl, hJoyLast
	ld a, [hl]
	and D_UP
	jr nz, Function82387
	ld hl, wc608 + 12

Function82368: ; 82368
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .asm_82375
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .asm_8237c
	ret

.asm_82375
	ld a, [hl]
	cp $1f
	ret nc
	inc [hl]
	jr .asm_82380

.asm_8237c
	ld a, [hl]
	and a
	ret z
	dec [hl]

.asm_82380
	call Function82391
	call Function822a3
	ret

Function82387: ; 82387
	ld hl, wcf65
	dec [hl]
	ret

Function8238c: ; 8238c
	ld hl, wcf65
	inc [hl]
	ret
; 82391

Function82391: ; 82391
	ld a, [wc608 + 10]
	and $1f
	ld e, a
	ld a, [wc608 + 11]
	and $7
	sla a
	swap a
	or e
	ld e, a
	ld a, [wc608 + 11]
	and $18
	sla a
	swap a
	ld d, a
	ld a, [wc608 + 12]
	and $1f
	sla a
	sla a
	or d
	ld d, a
	ld a, [wcf66]
	ld c, a
	ld b, $0
	ld hl, wc608
rept 2
	add hl, bc
endr
	ld a, e
	ld [hli], a
	ld [hl], d
	ret
; 823c6

Function823c6: ; 823c6
	ret

Function823c7: ; 823c7
	ret
; 823c8


SECTION "bank21", ROMX, BANK[$21]

Function84000: ; 84000
	ld hl, OverworldMap
	lb bc, 4, 12
	xor a
	call Function842ab
	xor a
	ld [rSB], a
	ld [rSC], a
	ld [wc2d5], a
	ld hl, wc2d4
	set 0, [hl]
	ld a, [GBPrinter]
	ld [wcbfb], a
	xor a
	ld [wJumptableIndex], a
	ret
; 84022

Function84022: ; 84022
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, Jumptable_84031
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 84031


Jumptable_84031: ; 84031 (21:4031)
	dw Function84077
	dw Function84143
	dw Function84120
	dw Function84099
	dw Function84180
	dw Function8412e
	dw Function840c5
	dw Function84180
	dw Function84120
	dw Function840de
	dw Function84180
	dw Function84120
	dw Function841a1
	dw Function84063
	dw Function8406d
	dw Function84120
	dw Function84103
	dw Function84071
	dw Function841b0
	dw Function841b3


Function84059: ; 84059 (21:4059)
	ld hl, wJumptableIndex
	inc [hl]
	ret

Function8405e: ; 8405e (21:405e)
	ld hl, wJumptableIndex
	dec [hl]
	ret

Function84063: ; 84063 (21:4063)
	xor a
	ld [wca89], a
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function8406d: ; 8406d (21:406d)
	call Function84059
	ret

Function84071: ; 84071 (21:4071)
	ld a, $1
	ld [wJumptableIndex], a
	ret

Function84077: ; 84077 (21:4077)
	call Function841fb
	ld hl, Unknown_842b7
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld a, [wcf65]
	ld [wca81], a
	call Function84059
	call Function841c3
	ld a, $1
	ld [wcbf8], a
	ret

Function84099: ; 84099 (21:4099)
	call Function841fb
	ld hl, wca81
	ld a, [hl]
	and a
	jr z, Function840c5
	ld hl, Unknown_842c3
	call Function841e2
	call Function84260
	ld a, $80
	ld [wca8e], a
	ld a, $2
	ld [wca8f], a
	call Function84219
	call Function84059
	call Function841c3
	ld a, $2
	ld [wcbf8], a
	ret

Function840c5: ; 840c5 (21:40c5)
	ld a, $6
	ld [wJumptableIndex], a
	ld hl, Unknown_842c9
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	call Function84059
	call Function841c3
	ret

Function840de: ; 840de (21:40de)
	call Function841fb
	ld hl, Unknown_842bd
	call Function841e2
	call Function84249
	ld a, $4
	ld [wca8e], a
	ld a, $0
	ld [wca8f], a
	call Function84219
	call Function84059
	call Function841c3
	ld a, $3
	ld [wcbf8], a
	ret

Function84103: ; 84103 (21:4103)
	call Function841fb
	ld hl, Unknown_842b7
	call Function841e2
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld a, [wcf65]
	ld [wca81], a
	call Function84059
	call Function841c3
	ret

Function84120: ; 84120 (21:4120)
	ld hl, wca8b
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	call Function84059
	ret

Function8412e: ; 8412e (21:412e)
	ld hl, wca8b
	inc [hl]
	ld a, [hl]
	cp $6
	ret c
	xor a
	ld [hl], a
	ld hl, wca81
	dec [hl]
	call Function8405e
	call Function8405e
	ret

Function84143: ; 84143 (21:4143)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca88]
	cp $ff
	jr nz, .printer_connected
	ld a, [wca89]
	cp $ff
	jr z, .printer_error

.printer_connected
	ld a, [wca88]
	cp $81
	jr nz, .printer_error
	ld a, [wca89]
	cp $0
	jr nz, .printer_error
	ld hl, wc2d4
	set 1, [hl]
	ld a, $5
	ld [wca8a], a
	call Function84059
	ret

.printer_error
	ld a, $ff
	ld [wca88], a
	ld [wca89], a
	ld a, $e
	ld [wJumptableIndex], a
	ret

Function84180: ; 84180 (21:4180)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f0
	jr nz, .asm_8419b
	ld a, [wca89]
	and $1
	jr nz, .asm_84197
	call Function84059
	ret
.asm_84197
	call Function8405e
	ret
.asm_8419b
	ld a, $12
	ld [wJumptableIndex], a
	ret

Function841a1: ; 841a1 (21:41a1)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f3
	ret nz
	call Function84059
	ret

Function841b0: ; 841b0 (21:41b0)
	call Function84059

Function841b3: ; 841b3 (21:41b3)
	ld a, [wc2d5]
	and a
	ret nz
	ld a, [wca89]
	and $f0
	ret nz
	xor a
	ld [wJumptableIndex], a
	ret

Function841c3: ; 841c3 (21:41c3)
	ld a, [wc2d5]
	and a
	jr nz, Function841c3
	xor a
	ld [wca8c], a
	ld [wca8d], a
	ld a, $1
	ld [wc2d5], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Function841e2: ; 841e2 (21:41e2)
	ld a, [hli]
	ld [wca82], a
	ld a, [hli]
	ld [wca83], a
	ld a, [hli]
	ld [wca84], a
	ld a, [hli]
	ld [wca85], a
	ld a, [hli]
	ld [wca86], a
	ld a, [hl]
	ld [wca87], a
	ret

Function841fb: ; 841fb (21:41fb)
	xor a
	ld hl, wca82
rept 3
	ld [hli], a
endr
	ld [hl], a
	ld hl, wca86
	ld [hli], a
	ld [hl], a
	xor a
	ld [wca8e], a
	ld [wca8f], a
	ld hl, OverworldMap
	ld bc, $280
	call Function842ab
	ret

Function84219: ; 84219 (21:4219)
	ld hl, 0
	ld bc, $4
	ld de, wca82
	call Function8423c
	ld a, [wca8e]
	ld c, a
	ld a, [wca8f]
	ld b, a
	ld de, OverworldMap
	call Function8423c
	ld a, l
	ld [wca86], a
	ld a, h
	ld [wca87], a
	ret

Function8423c: ; 8423c (21:423c)
	ld a, [de]
	inc de
	add l
	jr nc, .asm_84242
	inc h
.asm_84242
	ld l, a
	dec bc
	ld a, c
	or b
	jr nz, Function8423c
	ret

Function84249: ; 84249 (21:4249)
	ld a, $1
	ld [OverworldMap], a
	ld a, [wcbfa]
	ld [wc801], a
	ld a, $e4
	ld [wc802], a
	ld a, [wcbfb]
	ld [wc803], a
	ret

Function84260: ; 84260 (21:4260)
	ld a, [wca81]
	xor $ff
	ld d, a
	ld a, [wcf65]
	inc a
	add d
	ld hl, wca90
	ld de, $28
.asm_84271
	and a
	jr z, .asm_84278
	add hl, de
	dec a
	jr .asm_84271
.asm_84278
	ld e, l
	ld d, h
	ld hl, OverworldMap
	ld c, $28
.asm_8427f
	ld a, [de]
	inc de
	push bc
	push de
	push hl
	swap a
	ld d, a
	and $f0
	ld e, a
	ld a, d
	and $f
	ld d, a
	and $8
	ld a, d
	jr nz, .asm_84297
	or $90
	jr .asm_84299
.asm_84297
	or $80
.asm_84299
	ld d, a
	lb bc, $21, 1
	call Request2bpp
	pop hl
	ld de, $10
	add hl, de
	pop de
	pop bc
	dec c
	jr nz, .asm_8427f
	ret

Function842ab: ; 842ab
	push de
	ld e, a
.asm_842ad
	ld [hl], e
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_842ad
	ld a, e
	pop de
	ret
; 842b7

Unknown_842b7: db  1, 0, $00, 0,  1, 0
Unknown_842bd: db  2, 0, $04, 0,  0, 0
Unknown_842c3: db  4, 0, $80, 2,  0, 0
Unknown_842c9: db  4, 0, $00, 0,  4, 0
Unknown_842cf: db  8, 0, $00, 0,  8, 0 ; unused
Unknown_842d5: db 15, 0, $00, 0, 15, 0 ; unused
; 842db


Function842db:: ; 842db
	ld a, [wc2d5]
	add a
	ld e, a
	ld d, 0
	ld hl, Jumptable_842ea
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 842ea


Jumptable_842ea: ; 842ea (21:42ea)
	dw Function8432f
	dw Function84330
	dw Function84339
	dw Function84343
	dw Function8434d
	dw Function84357
	dw Function84361
	dw Function8438b
	dw Function84395
	dw Function8439f
	dw Function843a8
	dw Function843b6
	dw Function84330
	dw Function843c0
	dw Function843c9
	dw Function843c9
	dw Function843c9
	dw Function843c0
	dw Function843c9
	dw Function8439f
	dw Function843a8
	dw Function843e6
	dw Function84330
	dw Function843d2
	dw Function843c9
	dw Function843c9
	dw Function843c9
	dw Function843d2
	dw Function843c9
	dw Function8439f
	dw Function843a8
	dw Function843b6


Function8432a: ; 8432a (21:432a)
	ld hl, wc2d5
	inc [hl]
	ret

Function8432f: ; 8432f (21:432f)
	ret

Function84330: ; 84330 (21:4330)
	ld a, $33
	call Function843db
	call Function8432a
	ret

Function84339: ; 84339 (21:4339)
	ld a, [wca82]
	call Function843db
	call Function8432a
	ret

Function84343: ; 84343 (21:4343)
	ld a, [wca83]
	call Function843db
	call Function8432a
	ret

Function8434d: ; 8434d (21:434d)
	ld a, [wca84]
	call Function843db
	call Function8432a
	ret

Function84357: ; 84357 (21:4357)
	ld a, [wca85]
	call Function843db
	call Function8432a
	ret

Function84361: ; 84361 (21:4361)
	ld hl, wca8e
	ld a, [hli]
	ld d, [hl]
	ld e, a
	or d
	jr z, .asm_84388
	dec de
	ld [hl], d
	dec hl
	ld [hl], e
	ld a, [wca8c]
	ld e, a
	ld a, [wca8d]
	ld d, a
	ld hl, OverworldMap
	add hl, de
	inc de
	ld a, e
	ld [wca8c], a
	ld a, d
	ld [wca8d], a
	ld a, [hl]
	call Function843db
	ret
.asm_84388
	call Function8432a

Function8438b: ; 8438b (21:438b)
	ld a, [wca86]
	call Function843db
	call Function8432a
	ret

Function84395: ; 84395 (21:4395)
	ld a, [wca87]
	call Function843db
	call Function8432a
	ret

Function8439f: ; 8439f (21:439f)
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843a8: ; 843a8 (21:43a8)
	ld a, [rSB]
	ld [wca88], a
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843b6: ; 843b6 (21:43b6)
	ld a, [rSB]
	ld [wca89], a
	xor a
	ld [wc2d5], a
	ret

Function843c0: ; 843c0 (21:43c0)
	ld a, $f
	call Function843db
	call Function8432a
	ret

Function843c9: ; 843c9 (21:43c9)
	ld a, $0
	call Function843db
	call Function8432a
	ret

Function843d2: ; 843d2 (21:43d2)
	ld a, $8
	call Function843db
	call Function8432a
	ret

Function843db: ; 843db (21:43db)
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
	ret

Function843e6: ; 843e6 (21:43e6)
	ld a, [rSB]
	ld [wca89], a
	xor a
	ld [wc2d5], a
	ret

Function843f0: ; 843f0
.asm_843f0
	call JoyTextDelay
	call Function846f6
	jr c, .asm_8440f
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_8440d
	call Function84022
	call Function84757
	call Function84785
	call DelayFrame
	jr .asm_843f0

.asm_8440d
	and a
	ret

.asm_8440f
	scf
	ret
; 84411

Function84411: ; 84411
	xor a
	ld [wc2d4], a
	ld [wc2d5], a
	ret
; 84419

Function84419: ; 84419
	push af
	call Function84000
	pop af
	ld [wcbfa], a
	call Function84728
	ret
; 84425

Function84425: ; 84425
	call ReturnToMapFromSubmenu
	call Function84753
	ret
; 8442c

Function8442c: ; 8442c
	ld a, [wcf65]
	push af
	ld hl, VTiles1
	ld de, FontInversed
	lb bc, BANK(FontInversed), $80
	call Request1bpp
	xor a
	ld [$ffac], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	call Function84000
	ld a, $10
	ld [wcbfa], a
	callba Function1dc1b0
	call ClearTileMap
	ld a, $e4
	call DmgToCgbBGPals
	call DelayFrame
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $8
	ld [wcf65], a
	call Function84742
	call Function843f0
	jr c, .asm_8449d
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function84000
	ld a, $3
	ld [wcbfa], a
	callba Function1dc213
	call Function84742
	ld a, $4
	ld [wcf65], a
	call Function843f0

.asm_8449d
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	ld c, $8
.asm_844ae
	call LowVolume
	call DelayFrame
	dec c
	jr nz, .asm_844ae
	pop af
	ld [wcf65], a
	ret
; 844bc

Function844bc: ; 844bc (21:44bc)
	ld a, [wcf65]
	push af
	ld a, $9
	ld [wcf65], a
	ld a, e
	ld [wd004], a
	ld a, d
	ld [StartFlypoint], a
	ld a, b
	ld [EndFlypoint], a
	ld a, c
	ld [MovementBuffer], a
	xor a
	ld [$ffac], a
	ld [wd003], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	xor a
	ld [hBGMapMode], a
	call Function84817
	ld a, $10
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function8486f
	ld a, $0
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function84893
	ld a, $0
	call Function84419
	call Function84559
	jr c, .asm_84545
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	call Function848b7
	ld a, $3
	call Function84419
	call Function84559
.asm_84545
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret

Function84559: ; 84559 (21:4559)
	call Function84742
	call Function843f0
	ret

Function84560: ; 84560
	ld a, [wcf65]
	push af
	xor a
	ld [$ffac], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	xor a
	ld [hBGMapMode], a
	call LoadTileMapToTempTileMap
	callba Function16dac
	ld a, $0
	call Function84419
	call Call_LoadTempTileMapToTileMap
	call Function84742
	ld a, $9
	ld [wcf65], a
.asm_84597
	call JoyTextDelay
	call Function846f6
	jr c, .asm_845c0
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_845c0
	call Function84022
	ld a, [wJumptableIndex]
	cp $2
	jr nc, .asm_845b5
	ld a, $3
	ld [wca81], a

.asm_845b5
	call Function84757
	call Function84785
	call DelayFrame
	jr .asm_84597

.asm_845c0
	pop af
	ld [hVBlank], a
	call Function84411
	call Call_LoadTempTileMapToTileMap
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	pop af
	ld [wcf65], a
	ret
; 845d4

Function845d4: ; 845d4
	call Function845db
	call Function84425
	ret
; 845db

Function845db: ; 845db
	ld a, [wcf65]
	push af
	xor a
	ld [$ffac], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	xor a
	ld [hBGMapMode], a
	ld a, $13
	call Function84419
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $9
	ld [wcf65], a
	call Function843f0
	pop af
	ld [hVBlank], a
	call Function84411
	call Function84735
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	pop af
	ld [wcf65], a
	ret
; 8461a

Function8461a: ; 8461a
	ld a, [wcf65]
	push af
	xor a
	ld [$ffac], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	xor a
	ld [hBGMapMode], a
	callba Function1dc381
	ld a, $10
	call Function84419
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $8
	ld [wcf65], a
	call Function84742
	call Function843f0
	jr c, .asm_84671
	call Function84411
	ld c, 12
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	callba Function1dc47b
	ld a, $3
	call Function84419
	ld a, $9
	ld [wcf65], a
	call Function84742
	call Function843f0

.asm_84671
	pop af
	ld [hVBlank], a
	call Function84411
	call Function84735
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret
; 84688

Function84688: ; 84688
	ld a, [wcf65]
	push af
	callba Function1dd709
	xor a
	ld [$ffac], a
	call Function8474c
	ld a, [rIE]
	push af
	xor a
	ld [rIF], a
	ld a, $9
	ld [rIE], a
	ld hl, hVBlank
	ld a, [hl]
	push af
	ld [hl], $4
	ld a, $10
	call Function84419
	call Function84742
	ld a, $9
	ld [wcf65], a
	call Function843f0
	jr c, .asm_846e2
	call Function84411
	ld c, 12
	call DelayFrames
	call LoadTileMapToTempTileMap
	xor a
	ld [hBGMapMode], a
	callba Function1dd7ae
	ld a, $3
	call Function84419
	call Call_LoadTempTileMapToTileMap
	call Function84742
	ld a, $9
	ld [wcf65], a
	call Function843f0

.asm_846e2
	pop af
	ld [hVBlank], a
	call Function84411
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	call Function84425
	pop af
	ld [wcf65], a
	ret
; 846f6

Function846f6: ; 846f6
	ld a, [hJoyDown]
	and B_BUTTON
	jr nz, .asm_846fe
	and a
	ret

.asm_846fe
	ld a, [wca80]
	cp $c
	jr nz, .asm_84722
.asm_84705
	ld a, [wc2d5]
	and a
	jr nz, .asm_84705
	ld a, $16
	ld [wc2d5], a
	ld a, $88
	ld [rSB], a
	ld a, $1
	ld [rSC], a
	ld a, $81
	ld [rSC], a
.asm_8471c
	ld a, [wc2d5]
	and a
	jr nz, .asm_8471c

.asm_84722
	ld a, $1
	ld [$ffac], a
	scf
	ret
; 84728

Function84728: ; 84728
	hlcoord 0, 0
	ld de, wca90
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84735

Function84735: ; 84735
	ld hl, wca90
	decoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	call CopyBytes
	ret
; 84742

Function84742: ; 84742
	xor a
	ld [hJoyReleased], a
	ld [hJoyPressed], a
	ld [hJoyDown], a
	ld [hJoyLast], a
	ret
; 8474c

Function8474c: ; 8474c
	ld de, MUSIC_PRINTER
	call PlayMusic2
	ret
; 84753

Function84753: ; 84753
	call RestartMapMusic
	ret
; 84757

Function84757: ; 84757
	ld a, [wca88]
	cp -1
	jr nz, .printer_connected
	ld a, [wca89]
	cp -1
	jr z, .error_2

.printer_connected
	ld a, [wca89]
	and %11100000
	ret z ; no error

	bit 7, a
	jr nz, .error_1
	bit 6, a
	jr nz, .error_4
	ld a, 6 ; error 3
	jr .load_text_index

.error_4
	ld a, 7 ; error 4
	jr .load_text_index

.error_1
	ld a, 4 ; error 1
	jr .load_text_index

.error_2
	ld a, 5 ; error 2

.load_text_index
	ld [wcbf8], a
	ret
; 84785

Function84785: ; 84785
	ld a, [wcbf8]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 5
	lb bc, 10, 18
	call TextBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 1, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 2, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wcbf8], a
	ret
; 847bd

Function847bd: ; 847bd
	ld a, [wcbf8]
	and a
	ret z
	push af
	xor a
	ld [hBGMapMode], a
	hlcoord 2, 4
	lb bc, 13, 16
	call ClearBox
	pop af
	ld e, a
	ld d, 0
	ld hl, PrinterStatusStringPointers
rept 2
	add hl, de
endr
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 4, 7
	ld a, BANK(GBPrinterStrings)
	call FarString
	hlcoord 4, 15
	ld de, String_PressBToCancel
	call PlaceString
	ld a, $1
	ld [hBGMapMode], a
	xor a
	ld [wcbf8], a
	ret
; 847f5

String_PressBToCancel:
	db "Press B to Cancel@"
; 84807

PrinterStatusStringPointers: ; 84807
	dw String_1dc275 ; @
	dw String_1dc276 ; CHECKING LINK
	dw String_1dc289 ; TRANSMITTING
	dw String_1dc29c ; PRINTING
	dw String_1dc2ad ; error 1
	dw String_1dc2e2 ; error 2
	dw String_1dc317 ; error 3
	dw String_1dc34c ; error 4
; 84817

Function84817: ; 84817 (21:4817)
	xor a
	ld [wd002], a
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Function84a0e
	hlcoord 0, 0
	ld bc, 9 * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Function849e9
	call Function849d7
	hlcoord 4, 3
	ld de, String_84865
	call PlaceString
	ld a, [wd007]
	ld bc, BOX_NAME_LENGTH
	ld hl, wBoxNames
	call AddNTimes
	ld d, h
	ld e, l
	hlcoord 6, 5
	call PlaceString
	ld a, $1
	call Function849c6
	hlcoord 2, 9
	ld c, $3
	call Function848e7
	ret
; 84865 (21:4865)

String_84865:
	db "#MON LIST@"
; 8486f

Function8486f: ; 8486f (21:486f)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Function84a0e
	call Function849e9
	ld a, [wd003]
	and a
	ret nz
	ld a, $4
	call Function849c6
	hlcoord 2, 0
	ld c, $6
	call Function848e7
	ret

Function84893: ; 84893 (21:4893)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Function84a0e
	call Function849e9
	ld a, [wd003]
	and a
	ret nz
	ld a, $a
	call Function849c6
	hlcoord 2, 0
	ld c, $6
	call Function848e7
	ret

Function848b7: ; 848b7 (21:48b7)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	ld a, " "
	call ByteFill
	call Function84a0e
	hlcoord 1, 15
	lb bc, 2, 18
	call ClearBox
	call Function849e9
	call Function849fc
	ld a, [wd003]
	and a
	ret nz
	ld a, $10
	call Function849c6
	hlcoord 2, 0
	ld c, $5
	call Function848e7
	ret

Function848e7: ; 848e7 (21:48e7)
	ld a, [EndFlypoint]
	call GetSRAMBank

Function848ed: ; 848ed (21:48ed)
	ld a, c
	and a
	jp z, Function84986
	dec c
	ld a, [de]
	cp $ff
	jp z, Function84981
	ld [wd265], a
	ld [CurPartySpecies], a
	push bc
	push hl
	push de
	push hl
	ld bc, $10
	ld a, " "
	call ByteFill
	pop hl
	push hl
	call GetBasePokemonName
	pop hl
	push hl
	call PlaceString
	ld a, [CurPartySpecies]
	cp $fd
	pop hl
	jr z, .ok2
	ld bc, $b
	add hl, bc
	call Function8498a
	ld bc, $9
	add hl, bc
	ld a, $f3
	ld [hli], a
	push hl
	ld bc, $e
	ld a, " "
	call ByteFill
	pop hl
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [StartFlypoint]
	ld h, a
	ld bc, $372
	add hl, bc
	ld bc, $b
	ld a, [wd002]
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	push hl
	call PlaceString
	pop hl
	ld bc, $b
	add hl, bc
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [StartFlypoint]
	ld h, a
	ld bc, $35
	add hl, bc
	ld bc, $20
	ld a, [wd002]
	call AddNTimes
	ld a, [hl]
	pop hl
	call Function383d
.ok2
	ld hl, wd002
	inc [hl]
	pop de
	pop hl
	ld bc, $3c
	add hl, bc
	pop bc
	inc de
	jp Function848ed

Function84981: ; 84981 (21:4981)
	ld a, $1
	ld [wd003], a

Function84986: ; 84986 (21:4986)
	call CloseSRAM
	ret

Function8498a: ; 8498a (21:498a)
	push hl
	ld a, [wd004]
	ld l, a
	ld a, [StartFlypoint]
	ld h, a
	ld bc, $2b
	add hl, bc
	ld bc, $20
	ld a, [wd002]
	call AddNTimes
	ld de, TempMonDVs
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wd002]
	ld [CurPartyMon], a
	ld a, $3
	ld [MonType], a
	callba GetGender
	ld a, $7f
	jr c, .asm_849c3
	ld a, $ef
	jr nz, .asm_849c3
	ld a, $f5
.asm_849c3
	pop hl
	ld [hli], a
	ret

Function849c6: ; 849c6 (21:49c6)
	push hl
	ld e, a
	ld d, $0
	ld a, [wd004]
	ld l, a
	ld a, [StartFlypoint]
	ld h, a
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ret

Function849d7: ; 849d7 (21:49d7)
	hlcoord 0, 0
	ld a, $79
	ld [hli], a
	ld a, $7a
	ld c, $12
.asm_849e1
	ld [hli], a
	dec c
	jr nz, .asm_849e1
	ld a, $7b
	ld [hl], a
	ret

Function849e9: ; 849e9 (21:49e9)
	hlcoord 0, 0
	ld de, $13
	ld c, $12
.asm_849f1
	ld a, $7c
	ld [hl], a
	add hl, de
	ld a, $7c
	ld [hli], a
	dec c
	jr nz, .asm_849f1
	ret

Function849fc: ; 849fc (21:49fc)
	hlcoord 0, 17
	ld a, $7d
	ld [hli], a
	ld a, $7a
	ld c, $12
.asm_84a06
	ld [hli], a
	dec c
	jr nz, .asm_84a06
	ld a, $7e
	ld [hl], a
	ret

Function84a0e: ; 84a0e (21:4a0e)
	hlcoord 2, 0
	ld c, $6
.asm_84a13
	push bc
	push hl
	ld de, String84a25
	call PlaceString
	pop hl
	ld bc, $3c
	add hl, bc
	pop bc
	dec c
	jr nz, .asm_84a13
	ret
; 84a25 (21:4a25)

String84a25: ; 84a25
	db "  ------@"
; 84a2e


INCLUDE "battle/anim_gfx.asm"


HallOfFame:: ; 0x8640e
	call Function8648e
	ld a, [StatusFlags]
	push af
	ld a, 1
	ld [wc2cd], a
	call DisableSpriteUpdates
	ld a, SPAWN_LANCE
	ld [wSpawnAfterChampion], a

	; Enable the Pokégear map to cycle through all of Kanto
	ld hl, StatusFlags
	set 6, [hl] ; hall of fame

	callba Function14da0

	ld hl, wHallOfFameCount
	ld a, [hl]
	cp 200
	jr nc, .ok
	inc [hl]
.ok
	callba SaveGameData
	call GetHallOfFameParty
	callba AddHallOfFameEntry

	xor a
	ld [wc2cd], a
	call Function864c3
	pop af
	ld b, a
	callba Function109847
	ret
; 0x86455

RedCredits:: ; 86455
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, $a
	ld [MusicFade], a
	callba FadeOutPalettes
	xor a
	ld [VramState], a
	ld [hMapAnims], a
	callba Function4e8c2
	ld c, 8
	call DelayFrames
	call DisableSpriteUpdates
	ld a, SPAWN_RED
	ld [wSpawnAfterChampion], a
	ld a, [StatusFlags]
	ld b, a
	callba Function109847
	ret
; 8648e

Function8648e: ; 8648e
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	ld a, 10
	ld [MusicFade], a
	callba FadeOutPalettes
	xor a
	ld [VramState], a
	ld [hMapAnims], a
	callba Function4e881
	ld c, 100
	jp DelayFrames
; 864b4

Function864b4: ; 864b4
	push de
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	pop de
	call PlayMusic
	ret
; 864c3

Function864c3: ; 864c3
	xor a
	ld [wJumptableIndex], a
	call Function8671c
	jr c, .done
	ld de, SCREEN_WIDTH
	call Function864b4
	xor a
	ld [wcf64], a
.loop
	ld a, [wcf64]
	cp 6
	jr nc, .done
	ld hl, wc608 + 1
	ld bc, $10
	call AddNTimes
	ld a, [hl]
	cp -1
	jr z, .done
	push hl
	call Function865b5
	pop hl
	call Function8650c
	jr c, .done
	ld hl, wcf64
	inc [hl]
	jr .loop

.done
	call Function86810
	ld a, $4
	ld [MusicFade], a
	call FadeToWhite
	ld c, 8
	call DelayFrames
	ret
; 8650c

Function8650c: ; 8650c
	call Function86748
	ld de, String_8652c
	hlcoord 1, 2
	call PlaceString
	call WaitBGMap
	decoord 6, 5
	ld c, $6
	predef Functiond066e
	ld c, 60
	call DelayFrames
	and a
	ret
; 8652c

String_8652c:
	db "New Hall of Famer!@"
; 8653f


GetHallOfFameParty: ; 8653f
	ld hl, OverworldMap
	ld bc, HOF_LENGTH
	xor a
	call ByteFill
	ld a, [wHallOfFameCount]
	ld de, OverworldMap
	ld [de], a
	inc de
	ld hl, PartySpecies
	ld c, 0
.next
	ld a, [hli]
	cp -1
	jr z, .done
	cp EGG
	jr nz, .mon
	inc c
	jr .next

.mon
	push hl
	push de
	push bc

	ld a, c
	ld hl, PartyMons
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld c, l
	ld b, h

	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_ID
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_DVS
	add hl, bc
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de

	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de

	pop bc
	push bc
	ld a, c
	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call AddNTimes
	ld bc, PKMN_NAME_LENGTH - 1
	call CopyBytes

	pop bc
	inc c
	pop de
	ld hl, HOF_MON_LENGTH
	add hl, de
	ld e, l
	ld d, h
	pop hl
	jr .next

.done
	ld a, $ff
	ld [de], a
	ret
; 865b5

Function865b5: ; 865b5
	push hl
	call ClearBGPalettes
	callba Function4e906
	pop hl
	ld a, [hli]
	ld [TempMonSpecies], a
	ld [CurPartySpecies], a
rept 2
	inc hl
endr
	ld a, [hli]
	ld [TempMonDVs], a
	ld a, [hli]
	ld [TempMonDVs + 1], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	ld de, VTiles2 tile $31
	predef GetBackpic
	ld a, $31
	ld [hFillBox], a
	hlcoord 6, 6
	lb bc, 6, 6
	predef FillBox
	ld a, $d0
	ld [hSCY], a
	ld a, $90
	ld [hSCX], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld b, SCGB_1A
	call GetSGBLayout
	call SetPalettes
	call Function86635
	xor a
	ld [wc2c6], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 6, 5
	call _PrepMonFrontpic
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld [hSCY], a
	call Function86643
	ret
; 86635

Function86635: ; 86635
.loop
	ld a, [hSCX]
	cp $70
	ret z
	add $4
	ld [hSCX], a
	call DelayFrame
	jr .loop
; 86643

Function86643: ; 86643
.loop
	ld a, [hSCX]
	and a
	ret z
rept 2
	dec a
endr
	ld [hSCX], a
	call DelayFrame
	jr .loop
; 86650

_HallOfFamePC: ; 86650
	call LoadFontsBattleExtra
	xor a
	ld [wJumptableIndex], a
.loop
	call Function8671c
	ret c
	call Function86665
	ret c
	ld hl, wJumptableIndex
	inc [hl]
	jr .loop
; 86665

Function86665: ; 86665
	xor a
	ld [wcf64], a
.next
	call Function86692
	jr c, .start_button
.loop
	call JoyTextDelay
	ld hl, hJoyLast
	ld a, [hl]
	and B_BUTTON
	jr nz, .b_button
	ld a, [hl]
	and A_BUTTON
	jr nz, .a_button
	ld a, [hl]
	and START
	jr nz, .start_button
	call DelayFrame
	jr .loop

.a_button
	ld hl, wcf64
	inc [hl]
	jr .next

.b_button
	scf
	ret

.start_button
	and a
	ret
; 86692

Function86692: ; 86692
; Print the number of times the player has entered the Hall of Fame.
; If that number is above 200, print "HOF Master!" instead.
	ld a, [wcf64]
	cp $6
	jr nc, .fail
	ld hl, wc608 + 1
	ld bc, $10
	call AddNTimes
	ld a, [hl]
	cp $ff
	jr nz, .okay

.fail
	scf
	ret

.okay
	push hl
	call ClearBGPalettes
	pop hl
	call Function86748
	ld a, [wc608]
	cp 200 + 1
	jr c, .print_num_hof
	ld de, String_866fc
	hlcoord 1, 2
	call PlaceString
	hlcoord 13, 2
	jr .finish

.print_num_hof
	ld de, String_8670c
	hlcoord 1, 2
	call PlaceString
	hlcoord 2, 2
	ld de, wc608
	lb bc, 1, 3
	call PrintNum
	hlcoord 11, 2

.finish
	ld de, String_866fb
	call PlaceString
	call WaitBGMap
	ld b, SCGB_1A
	call GetSGBLayout
	call SetPalettes
	decoord 6, 5
	ld c, $6
	predef Functiond066e
	and a
	ret
; 866fb

String_866fb:
	db "@"
; 866fc

String_866fc:
	db "    HOF Master!@"
; 8670c

String_8670c:
	db "    -Time Famer@"
; 8671c


Function8671c: ; 8671c
	ld a, [wJumptableIndex]
	cp NUM_HOF_TEAMS
	jr nc, .full
	ld hl, sHallOfFame
	ld bc, HOF_LENGTH
	call AddNTimes
	ld a, BANK(sHallOfFame)
	call GetSRAMBank
	ld a, [hl]
	and a
	jr z, .fail
	ld de, wc608
	ld bc, HOF_LENGTH
	call CopyBytes
	call CloseSRAM
	and a
	ret

.fail
	call CloseSRAM

.full
	scf
	ret
; 86748

Function86748: ; 86748
	xor a
	ld [hBGMapMode], a
	ld a, [hli]
	ld [TempMonSpecies], a
	ld a, [hli]
	ld [TempMonID], a
	ld a, [hli]
	ld [TempMonID + 1], a
	ld a, [hli]
	ld [TempMonDVs], a
	ld a, [hli]
	ld [TempMonDVs + 1], a
	ld a, [hli]
	ld [TempMonLevel], a
	ld de, StringBuffer2
	ld bc, 10
	call CopyBytes
	ld a, "@"
	ld [StringBuffer2 + 10], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	hlcoord 0, 0
	lb bc, 3, SCREEN_WIDTH - 2
	call TextBox
	hlcoord 0, 12
	lb bc, 4, SCREEN_WIDTH - 2
	call TextBox
	ld a, [TempMonSpecies]
	ld [CurPartySpecies], a
	ld [wd265], a
	ld hl, TempMonDVs
	predef GetUnownLetter
	xor a
	ld [wc2c6], a
	hlcoord 6, 5
	call _PrepMonFrontpic
	ld a, [CurPartySpecies]
	cp EGG
	jr z, .print_id_no
	hlcoord 1, 13
	ld a, $74
	ld [hli], a
	ld [hl], $f2
	hlcoord 3, 13
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	call GetBasePokemonName
	hlcoord 7, 13
	call PlaceString
	ld a, $3
	ld [MonType], a
	callba GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 18, 13
	ld [hli], a
	hlcoord 8, 14
	ld a, "/"
	ld [hli], a
	ld de, StringBuffer2
	call PlaceString
	hlcoord 1, 16
	call PrintLevel

.print_id_no
	hlcoord 7, 16
	ld a, "<ID>"
	ld [hli], a
	ld a, "№"
	ld [hli], a
	ld [hl], "/"
	hlcoord 10, 16
	ld de, TempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	ret
; 86810

Function86810: ; 86810
	call ClearBGPalettes
	ld hl, VTiles2 tile $63
	ld de, FontExtra + $d0
	lb bc, BANK(FontExtra), 1
	call Request2bpp
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	callba GetPlayerBackpic
	ld a, $31
	ld [hFillBox], a
	hlcoord 6, 6
	lb bc, 6, 6
	predef FillBox
	ld a, $d0
	ld [hSCY], a
	ld a, $90
	ld [hSCX], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld [CurPartySpecies], a
	ld b, SCGB_1A
	call GetSGBLayout
	call SetPalettes
	call Function86635
	xor a
	ld [wc2c6], a
	hlcoord 0, 0
	ld bc, SCREEN_WIDTH * SCREEN_HEIGHT
	ld a, " "
	call ByteFill
	callba Function88840
	xor a
	ld [hFillBox], a
	hlcoord 12, 5
	lb bc, 7, 7
	predef FillBox
	ld a, $c0
	ld [hSCX], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld [hSCY], a
	call Function86643
	xor a
	ld [hBGMapMode], a
	hlcoord 0, 2
	lb bc, 8, 9
	call TextBox
	hlcoord 0, 12
	lb bc, 4, 18
	call TextBox
	hlcoord 2, 4
	ld de, PlayerName
	call PlaceString
	hlcoord 1, 6
	ld a, $73
	ld [hli], a
	ld a, $74
	ld [hli], a
	ld [hl], $f3
	hlcoord 4, 6
	ld de, PlayerID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 8
	ld de, .PlayTime
	call PlaceString
	hlcoord 3, 9
	ld de, GameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], $63
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	call WaitBGMap
	callba Function26601
	ret
; 868ed

.PlayTime
	db "PLAY TIME@"
; 868f7


SECTION "bank22", ROMX, BANK[$22]

INCLUDE "event/kurt.asm"

Function88248: ; 88248
	ld c, CAL
	ld a, [PlayerGender]
	bit 0, a
	jr z, .okay
	ld c, KAREN

.okay
	ld a, c
	ld [TrainerClass], a
	ret
; 88258

MovePlayerPicRight: ; 88258
	hlcoord 6, 4
	ld de, 1
	jr MovePlayerPic

MovePlayerPicLeft: ; 88260
	hlcoord 13, 4
	ld de, -1
	; fallthrough

MovePlayerPic: ; 88266
; Move player pic at hl by de * 7 tiles.
	ld c, $8
.loop
	push bc
	push hl
	push de
	xor a
	ld [hBGMapMode], a
	lb bc, 7, 7
	predef FillBox
	xor a
	ld [hBGMapThird], a
	call WaitBGMap
	call DelayFrame
	pop de
	pop hl
	add hl, de
	pop bc
	dec c
	ret z
	push hl
	push bc
	ld a, l
	sub e
	ld l, a
	ld a, h
	sbc d
	ld h, a
	lb bc, 7, 7
	call ClearBox
	pop bc
	pop hl
	jr .loop
; 88297

ShowPlayerNamingChoices: ; 88297
	ld hl, ChrisNameMenuHeader
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotGender
	ld hl, KrisNameMenuHeader
.GotGender
	call LoadMenuDataHeader
	call InterpretMenu2
	ld a, [MenuSelection2]
	dec a
	call CopyNameFromMenu
	call WriteBackup
	ret
; 882b5

ChrisNameMenuHeader: ; 882b5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw MenuData2_0x882be
	db 1 ; ????
	db 0 ; default option
; 882be

MenuData2_0x882be: ; 882be
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
Unknown_882c9: ; 882c9
	db "CHRIS@"
	db "MAT@"
	db "ALLAN@"
	db "JON@"
	db 2 ; displacement
	db " NAME @" ; title
; 882e5

KrisNameMenuHeader: ; 882e5
	db $40 ; flags
	db 00, 00 ; start coords
	db 11, 10 ; end coords
	dw MenuData2_0x882ee
	db 1 ; ????
	db 0 ; default option
; 882ee

MenuData2_0x882ee: ; 882ee
	db $91 ; flags
	db 5 ; items
	db "NEW NAME@"
Unknown_882f9: ; 882f9
	db "KRIS@"
	db "AMANDA@"
	db "JUANA@"
	db "JODI@"
	db 2 ; displacement
	db " NAME @" ; title
; 88318

GetPlayerNameArray: ; 88318 This Function is never called
	ld hl, PlayerName
	ld de, Unknown_882c9
	ld a, [PlayerGender]
	bit 0, a
	jr z, .done
	ld de, Unknown_882f9

.done
	call InitName
	ret
; 8832c

GetPlayerIcon: ; 8832c
; Get the player icon corresponding to gender

; Male
	ld de, ChrisSpriteGFX
	ld b, BANK(ChrisSpriteGFX)

	ld a, [PlayerGender]
	bit 0, a
	jr z, .done

; Female
	ld de, KrisSpriteGFX
	ld b, BANK(KrisSpriteGFX)

.done
	ret
; 8833e

Function8833e: ; 8833e
	ld hl, ChrisCardPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld hl, KrisCardPic
.GotClass
	ld de, VTiles2 tile $00
	ld bc, $230
	ld a, BANK(ChrisCardPic) ; BANK(KrisCardPic)
	call FarCopyBytes
	ld hl, CardGFX
	ld de, VTiles2 tile $23
	ld bc, $60
	ld a, BANK(CardGFX)
	call FarCopyBytes
	ret
; 88365 (22:4365)

ChrisCardPic: ; 88365
INCBIN "gfx/misc/chris_card.5x7.2bpp"
; 88595

KrisCardPic: ; 88595
INCBIN "gfx/misc/kris_card.5x7.2bpp"
; 887c5

CardGFX: ; 887c5
INCBIN "gfx/misc/trainer_card.2bpp"
; 88825


GetPlayerBackpic: ; 88825
	ld a, [PlayerGender]
	bit 0, a
	jr z, GetChrisBackpic
	call GetKrisBackpic
	ret

GetChrisBackpic: ; 88830
	ld hl, ChrisBackpic
	ld b, BANK(ChrisBackpic)
	ld de, VTiles2 tile $31
	ld c, 7 * 7
	predef DecompressPredef
	ret
; 88840

Function88840: ; 88840
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ld e, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1

.GotClass
	ld a, e
	ld [TrainerClass], a
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic

.GotPic
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7
	call Get2bpp
	call WaitBGMap
	ld a, $1
	ld [hBGMapMode], a
	ret
; 88874



DrawIntroPlayerPic: ; 88874
; Draw the player pic at (6,4).

; Get class
	ld e, 0
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotClass
	ld e, 1
.GotClass
	ld a, e
	ld [TrainerClass], a

; Load pic
	ld de, ChrisPic
	ld a, [PlayerGender]
	bit 0, a
	jr z, .GotPic
	ld de, KrisPic
.GotPic
	ld hl, VTiles2
	ld b, BANK(ChrisPic) ; BANK(KrisPic)
	ld c, 7 * 7 ; dimensions
	call Get2bpp

; Draw
	xor a
	ld [hFillBox], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef FillBox
	ret
; 888a9


ChrisPic: ; 888a9
INCBIN "gfx/misc/chris.7x7.2bpp"
; 88bb9

KrisPic: ; 88bb9
INCBIN "gfx/misc/kris.7x7.2bpp"
; 88ec9


GetKrisBackpic: ; 88ec9
; Kris's backpic is uncompressed.
	ld de, KrisBackpic
	ld hl, VTiles2 tile $31
	lb bc, BANK(KrisBackpic), 7 * 7 ; dimensions
	call Get2bpp
	ret
; 88ed6

KrisBackpic: ; 88ed6
INCBIN "gfx/misc/kris_back.6x6.2bpp"
; 89116


String_89116:
	db "-----@"
; 8911c

INCLUDE "misc/mobile_22.asm"
INCLUDE "event/unown.asm"
INCLUDE "event/buena.asm"
INCLUDE "event/dratini.asm"
INCLUDE "event/battle_tower.asm"
INCLUDE "misc/mobile_22_2.asm"


SECTION "bank23", ROMX, BANK[$23]

Predef35: ; 8c000
Predef36:
	ret
; 8c001


INCLUDE "engine/timeofdaypals.asm"
INCLUDE "engine/battle_start.asm"

Function8c7c9: ; unreferenced
	ld a, $1
	ld [hBGMapMode], a
	call WaitBGMap
	xor a
	ld [hBGMapMode], a
	ret
; 8c7d4

INCLUDE "event/field_moves.asm"

Function8caed: ; 8caed
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call Function8cb9b
	lb de, $54, $50
	ld a, SPRITE_ANIM_INDEX_0A
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld hl, $2
	add hl, bc
	ld [hl], $16
	ld a, $80
	ld [wcf64], a
.asm_8cb14
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_8cb2e
	ld a, $0
	ld [wc3b5], a
	callab Function8cf7a
	call Function8cbc8
	call DelayFrame
	jr .asm_8cb14
.asm_8cb2e
	pop af
	ld [VramState], a
	ret
; 8cb33

Function8cb33: ; 8cb33
	call DelayFrame
	ld a, [VramState]
	push af
	xor a
	ld [VramState], a
	call Function8cb9b
	lb de, $fc, $50
	ld a, SPRITE_ANIM_INDEX_0A
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $84
	ld hl, $2
	add hl, bc
	ld [hl], $18
	ld hl, $f
	add hl, bc
	ld [hl], $58
	ld a, $40
	ld [wcf64], a
.asm_8cb60
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .asm_8cb7a
	ld a, $0
	ld [wc3b5], a
	callab Function8cf7a
	call Function8cbc8
	call DelayFrame
	jr .asm_8cb60
.asm_8cb7a
	pop af
	ld [VramState], a
	call Function8cb82
	ret

Function8cb82: ; 8cb82 (23:4b82)
	ld hl, Sprites + 2
	xor a
	ld c, $4
.asm_8cb88
	ld [hli], a
rept 3
	inc hl
endr
	inc a
	dec c
	jr nz, .asm_8cb88
	ld hl, Sprites + $10
	ld bc, $90
	xor a
	call ByteFill
	ret

Function8cb9b: ; 8cb9b (23:4b9b)
	callab Function8cf53
	ld de, CutGrassGFX
	ld hl, VTiles1 tile $00
	lb bc, BANK(CutGrassGFX), 4
	call Request2bpp
	ld a, [CurPartyMon]
	ld hl, PartySpecies
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ld [wd265], a
	ld e, $84
	callba Function8e9bc
	xor a
	ld [wJumptableIndex], a
	ret

Function8cbc8: ; 8cbc8 (23:4bc8)
	call Function8cbe6
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .asm_8cbe0
	dec [hl]
	cp $40
	ret c
	and $7
	ret nz
	ld de, SFX_FLY
	call PlaySFX
	ret
.asm_8cbe0
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

Function8cbe6: ; 8cbe6 (23:4be6)
	ld hl, wcf65
	ld a, [hl]
	inc [hl]
	and $7
	ret nz
	ld a, [hl]
	and $18
	sla a
	add $40
	ld d, a
	ld e, $0
	ld a, SPRITE_ANIM_INDEX_18 ; fly land
	call _InitSpriteAnimStruct
	ld hl, $3
	add hl, bc
	ld [hl], $80
	ret

INCLUDE "event/magnet_train.asm"

Function8cf4f: ; 8cf4f
	call Function3238
	ret
; 8cf53


INCLUDE "engine/sprites.asm"

Function8e79d: ; 8e79d
	ld a, [hSGB]
	ld de, GFX_8e7f4
	and a
	jr z, .asm_8e7a8
	ld de, GFX_8e804

.asm_8e7a8
	ld hl, VTiles0
	lb bc, BANK(GFX_8e7f4), 1
	call Request2bpp
	ld c, $8
	ld d, $0
.asm_8e7b5
	push bc
	call Function8e7c6
	call DelayFrame
	pop bc
rept 2
	inc d
endr
	dec c
	jr nz, .asm_8e7b5
	call ClearSprites
	ret
; 8e7c6

Function8e7c6: ; 8e7c6
	ld hl, Sprites
	ld c, $8
.asm_8e7cb
	ld a, c
	and a
	ret z
	dec c
	ld a, c
	sla a
	sla a
	sla a
	push af
	push de
	push hl
	call Function8e72c
	pop hl
	pop de
	add $68
	ld [hli], a
	pop af
	push de
	push hl
	call Function8e72a
	pop hl
	pop de
	add $54
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld a, $6
	ld [hli], a
	jr .asm_8e7cb
; 8e7f4

GFX_8e7f4: ; 8e7f4
INCBIN "gfx/unknown/08e7f4.2bpp"
GFX_8e804: ; 8e804
INCBIN "gfx/unknown/08e804.2bpp"

InefficientlyClear121BytesAtwc300: ; 8e814
	push hl
	push de
	push bc
	push af
	ld hl, wc300
	ld bc, wc3c1 - wc300
.loop
	ld [hl], $0
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	pop af
	pop bc
	pop de
	pop hl
	ret
; 8e82b

Function8e82b: ; 8e82b
	ld a, e
	call ReadMonMenuIcon
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld b, BANK(Icons)
	ld c, 8
	ret
; 8e83f

Function8e83f: ; 8e83f
	push hl
	push de
	push bc
	call Function8e849
	pop bc
	pop de
	pop hl
	ret
; 8e849

Function8e849: ; 8e849
	ld d, 0
	ld hl, Jumptable_8e854
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 8e854


Jumptable_8e854: ; 8e854 (23:6854)
	dw Function8e8d5
	dw Function8e961
	dw Function8e97d
	dw Function8e99a
	dw Function8e898
	dw Function8e8b1
	dw Function8e862


Function8e862: ; 8e862 (23:6862)
	call Function8e908
	call Function8e86c
	call Function8e936
	ret

Function8e86c: ; 8e86c (23:686c)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	jr z, .asm_8e890
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e88e
	ld a, $6
	jr .asm_8e892
.asm_8e88e
	ld a, $5
.asm_8e890
	ld a, $4
.asm_8e892
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e898: ; 8e898 (23:6898)
	call Function8e8d5
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $48
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $48
	ld [hl], a
	ret

Function8e8b1: ; 8e8b1 (23:68b1)
	call Function8e908
	call Function8e936
	ld hl, $2
	add hl, bc
	ld a, $0
	ld [hl], a
	ld hl, $4
	add hl, bc
	ld a, $18
	ld [hl], a
	ld hl, $5
	add hl, bc
	ld a, $60
	ld [hl], a
	ld a, c
	ld [wc608], a
	ld a, b
	ld [wc608 + 1], a
	ret

Function8e8d5: ; 8e8d5 (23:68d5)
	call Function8e908
	call Function8e8df
	call Function8e936
	ret

Function8e8df: ; 8e8df (23:68df)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartyMon1Item
	ld bc, $30
	call AddNTimes
	pop bc
	ld a, [hl]
	and a
	ret z
	push hl
	push bc
	ld d, a
	callab ItemIsMail
	pop bc
	pop hl
	jr c, .asm_8e900
	ld a, $3
	jr .asm_8e902
.asm_8e900
	ld a, $2
.asm_8e902
	ld hl, $1
	add hl, bc
	ld [hl], a
	ret

Function8e908: ; 8e908 (23:6908)
	ld a, [wc3b7]
	push af
	ld a, [hObjectStructIndexBuffer]
	ld hl, PartySpecies
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	call ReadMonMenuIcon
	ld [CurIcon], a
	call Function8e9db
	ld a, [hObjectStructIndexBuffer]
; y coord
rept 4
	add a
endr
	add $1c
	ld d, a
; x coord
	ld e, $10
; type is partymon icon
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	pop af
	ld hl, $3
	add hl, bc
	ld [hl], a
	ret

Function8e936: ; 8e936 (23:6936)
	push bc
	ld a, [hObjectStructIndexBuffer]
	ld b, a
	call Function8e94c
	ld a, b
	pop bc
	ld hl, $9
	add hl, bc
	ld [hl], a
	rlca
	rlca
	ld hl, $d
	add hl, bc
	ld [hl], a
	ret

Function8e94c: ; 8e94c (23:694c)
	callba PlacePartymonHPBar
	call GetHPPal
	ld e, d
	ld d, 0
	ld hl, Unknown_8e95e
	add hl, de
	ld b, [hl]
	ret
; 8e95e (23:695e)

Unknown_8e95e: ; 8e95e
	db $00, $40, $80
; 8e961

Function8e961: ; 8e961 (23:6961)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	lb de, $24, $20
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e97d: ; 8e97d (23:697d)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	xor a
	call GetIconGFX
	ld d, $1a
	ld e, $24
	ld a, SPRITE_ANIM_INDEX_00
	call InitSpriteAnimStruct
	ld hl, $2
	add hl, bc
	ld [hl], $0
	ret

Function8e99a: ; 8e99a (23:699a)
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	ld a, $62
	ld [wc3b7], a
	call Function8e9db
	ret

GetSpeciesIcon: ; 8e9ac
; Load species icon into VRAM at tile a
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIconGFX
	ret
; 8e9bc


Function8e9bc: ; 8e9bc (23:69bc)
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	ld a, e
	call GetIcon_a
	ret
; 8e9cc (23:69cc)

Function8e9cc: ; 8e9cc
	push de
	ld a, [wd265]
	call ReadMonMenuIcon
	ld [CurIcon], a
	pop de
	call GetIcon_de
	ret
; 8e9db

Function8e9db: ; 8e9db (23:69db)
	ld a, [wc3b7]

GetIconGFX: ; 8e9de
	call GetIcon_a
	ld de, $80 ; 8 tiles
	add hl, de
	ld de, HeldItemIcons
	lb bc, BANK(HeldItemIcons), 2
	call GetGFXUnlessMobile
	ld a, [wc3b7]
	add 10
	ld [wc3b7], a
	ret

HeldItemIcons:
INCBIN "gfx/icon/mail.2bpp"
INCBIN "gfx/icon/item.2bpp"
; 8ea17

GetIcon_de: ; 8ea17
; Load icon graphics into VRAM starting from tile de.
	ld l, e
	ld h, d
	jr GetIcon

GetIcon_a: ; 8ea1b
; Load icon graphics into VRAM starting from tile a.
	ld l, a
	ld h, 0

GetIcon: ; 8ea1e
; Load icon graphics into VRAM starting from tile hl.

; One tile is 16 bytes long.
rept 4
	add hl, hl
endr

	ld de, VTiles0
	add hl, de
	push hl

; The icons are contiguous, in order and of the same
; size, so the pointer table is somewhat redundant.
	ld a, [CurIcon]
	push hl
	ld l, a
	ld h, 0
	add hl, hl
	ld de, IconPointers
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl

	lb bc, BANK(Icons), 8
	call GetGFXUnlessMobile

	pop hl
	ret
; 8ea3f

GetGFXUnlessMobile: ; 8ea3f
	ld a, [wLinkMode]
	cp LINK_MOBILE
	jp nz, Request2bpp
	jp Get2bpp_2
; 8ea4a

Function8ea4a: ; 8ea4a
	ld hl, wc314
	ld e, $6
	ld a, [MenuSelection2]
	ld d, a
.loop
	ld a, [hl]
	and a
	jr z, .next
	cp d
	jr z, .loadwithtwo
	ld a, $0
	jr .ok

.loadwithtwo
	ld a, $2

.ok
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl

.next
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea71

Function8ea71: ; 8ea71
	ld hl, wc314
	ld e, $6
.loop
	ld a, [hl]
	and a
	jr z, .zero
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], $1
	pop hl
.zero
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .loop
	ret
; 8ea8c (23:6a8c)

Function8ea8c: ; 8ea8c
	ld hl, wc314
	ld e, $6
	ld a, [wd0e3]
	ld d, a
.asm_8ea95
	ld a, [hl]
	and a
	jr z, .asm_8eaab
	cp d
	jr z, .asm_8eaa0
	ld a, $3
	jr .asm_8eaa2
.asm_8eaa0
	ld a, $2
.asm_8eaa2
	push hl
	ld c, l
	ld b, h
	ld hl, $2
	add hl, bc
	ld [hl], a
	pop hl
.asm_8eaab
	ld bc, $10
	add hl, bc
	dec e
	jr nz, .asm_8ea95
	ret


INCLUDE "menu/mon_icons.asm"


SECTION "bank24", ROMX, BANK[$24]

INCLUDE "engine/phone.asm"
INCLUDE "engine/timeset.asm"
INCLUDE "engine/pokegear.asm"

INCLUDE "data/wild/fish.asm"
INCLUDE "engine/slot_machine.asm"


SECTION "Phone Engine", ROMX, BANK[$28]

INCLUDE "engine/more_phone_scripts.asm"
INCLUDE "engine/buena_phone_scripts.asm"
INCLUDE "text/phone/buena.asm"


SECTION "Phone Text", ROMX, BANK[$29]

INCLUDE "text/phone/anthony_overworld.asm"
INCLUDE "text/phone/todd_overworld.asm"
INCLUDE "text/phone/gina_overworld.asm"
INCLUDE "text/phone/irwin_overworld.asm"
INCLUDE "text/phone/arnie_overworld.asm"
INCLUDE "text/phone/alan_overworld.asm"
INCLUDE "text/phone/dana_overworld.asm"
INCLUDE "text/phone/chad_overworld.asm"
INCLUDE "text/phone/derek_overworld.asm"
INCLUDE "text/phone/tully_overworld.asm"
INCLUDE "text/phone/brent_overworld.asm"
INCLUDE "text/phone/tiffany_overworld.asm"
INCLUDE "text/phone/vance_overworld.asm"
INCLUDE "text/phone/wilton_overworld.asm"
INCLUDE "text/phone/kenji_overworld.asm"
INCLUDE "text/phone/parry_overworld.asm"
INCLUDE "text/phone/erin_overworld.asm"

SECTION "Tileset Data 5", ROMX, BANK[TILESETS_5]

INCLUDE "tilesets/data_5.asm"


SECTION "bank2E", ROMX, BANK[$2E]

INCLUDE "engine/events_3.asm"

INCLUDE "engine/radio.asm"

ReadPartyMonMail: ; b9229
	ld a, [CurPartyMon]
	ld hl, sPartyScratch1
	ld bc, SCRATCHMON_STRUCT_LENGTH
	call AddNTimes
	ld d, h
	ld e, l
ReadAnyMail: ; b9237
	push de
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	call DisableLCD
	call LoadFontsExtra
	pop de
	push de
	ld a, BANK(sPartyScratch1)
	call GetSRAMBank
	callba Function1de5c8
	call CloseSRAM
	ld a, c
	ld de, GFX_1de5e6
	or a
	jr z, .asm_b9268
	ld de, GFX_1de9e6
	sub $3
	jr c, .asm_b9268
	ld de, GFX_1dede6

.asm_b9268
	ld hl, VTiles1
	lb bc, BANK(GFX_1de5e6), $80
	call Get1bpp
	pop de
	call Functionb92b8
	call EnableLCD
	call WaitBGMap
	ld a, [wd1ec]
	ld e, a
	callba Function8cb4
	call SetPalettes
	xor a
	ld [hJoyPressed], a
	call Functionb929a
	call ClearBGPalettes
	call DisableLCD
	call LoadStandardFont
	jp EnableLCD
; b929a

Functionb929a: ; b929a
.asm_b929a
	call GetJoypad
	ld a, [hJoyPressed]
	and A_BUTTON | B_BUTTON | START
	jr z, .asm_b929a
	and START
	jr nz, .asm_b92a8
	ret

.asm_b92a8
	ld a, [wJumptableIndex]
	push af
	callab Function845d4
	pop af
	ld [wJumptableIndex], a
	jr .asm_b929a
; b92b8

Functionb92b8: ; b92b8
	ld h, d
	ld l, e
	push hl
	ld a, $0
	call GetSRAMBank
	ld de, $2b
	add hl, de
	ld a, [hli]
	ld [Buffer1], a
	ld a, [hli]
	ld [Buffer2], a
	ld a, [hli]
	ld [CurPartySpecies], a
	ld b, [hl]
	call CloseSRAM
	ld hl, Unknown_b92f8
	ld c, 0
.asm_b92d9
	ld a, [hli]
	cp b
	jr z, .asm_b92ea
	cp $ff
	jr z, .asm_b92e6
	inc c
rept 2
	inc hl
endr
	jr .asm_b92d9

.asm_b92e6
	ld hl, Unknown_b92f8
	inc hl

.asm_b92ea
	ld a, c
	ld [wd1ec], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .done
	pop bc
	push de
	jp [hl]
.done
	ret
; b92f8

Unknown_b92f8: ; b92f8
	dbw FLOWER_MAIL,  Functionb963e
	dbw SURF_MAIL,    Functionb9317
	dbw LITEBLUEMAIL, Functionb9335
	dbw PORTRAITMAIL, Functionb96ca
	dbw LOVELY_MAIL,  Functionb944b
	dbw EON_MAIL,     Functionb93d2
	dbw MORPH_MAIL,   Functionb94d6
	dbw BLUESKY_MAIL, Functionb9582
	dbw MUSIC_MAIL,   Functionb9710
	dbw MIRAGE_MAIL,  Functionb9776
	db $ff
; b9317

Functionb9317: ; b9317
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9d46
	ld c, $40
	call Functionb9915
	ld de, MailLaprasGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b994e
	ld c, $8
	call Functionb9915
	jr Functionb9351

Functionb9335: ; b9335
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9dc6
	ld c, $40
	call Functionb9915
	ld de, MailDratiniGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b995e
	ld c, $8
	call Functionb9915

Functionb9351: ; b9351
	ld de, Unknown_b9976
	ld c, $10
	call Functionb9915
	ld c, $10
	call Functionb990c
	ld de, Unknown_b9c3e
	ld c, $40
	call Functionb990c
	ld c, $40
	call Functionb9915
	call Functionb9858
	hlcoord 2, 15
	ld a, $3f
	call Functionb98d4
	ld a, $39
	hlcoord 15, 14
	call Functionb98fc
	ld a, $44
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 15, 11
	call Functionb98ee
	ld a, $4c
	hlcoord 3, 12
	call Functionb98ee
	hlcoord 15, 2
	call Functionb98ee
	ld a, $50
	hlcoord 6, 3
	call Functionb98ee
	ld a, $40
	hlcoord 13, 2
	ld [hli], a
	hlcoord 6, 14
	ld [hl], a
	ld a, $41
	hlcoord 4, 5
	ld [hli], a
	hlcoord 17, 5
	ld [hli], a
	hlcoord 13, 12
	ld [hl], a
	ld a, $42
	hlcoord 9, 2
	ld [hli], a
	hlcoord 14, 5
	ld [hli], a
	hlcoord 3, 10
	ld [hl], a
	ld a, $43
	hlcoord 6, 11
	ld [hli], a
	pop hl
	jp Functionb9803
; b93d2

Functionb93d2: ; b93d2
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld de, Unknown_b998e
	ld c, $8
	call Functionb990c
	ld de, Unknown_b998e
	ld c, $8
	call Functionb990c
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9d76
	ld c, $8
	call Functionb9915
	ld de, MailPikaGFX
	ld c, $30
	call Functionb991e
	ld hl, VTiles2 tile $3d
	ld de, Unknown_b9c9e
	ld c, $20
	call Functionb990c
	ld de, Unknown_b998e
	ld c, $8
	call Functionb9915
	ld a, $31
	hlcoord 0, 0
	call Functionb98a8
	hlcoord 1, 17
	call Functionb98a8
	ld a, $33
	hlcoord 0, 1
	call Functionb98ba
	hlcoord 19, 0
	call Functionb98ba
	hlcoord 2, 15
	ld a, $35
	call Functionb98d4
	inc a
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b944b

Functionb944b: ; b944b
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e26
	ld c, $28
	call Functionb9915
	ld de, MailPoliwagGFX
	ld c, $30
	call Functionb991e
	ld de, Unknown_b9966
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9c5e
	ld c, $20
	call Functionb9915
	ld de, Unknown_b996e
	ld c, $8
	call Functionb990c
	call Functionb987b
	hlcoord 2, 15
	ld a, $3c
	call Functionb98d4
	ld a, $36
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b9491

Functionb9491: ; b9491
	ld a, $3d
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 16, 2
	call Functionb98ee
	hlcoord 9, 4
	call Functionb98ee
	hlcoord 2, 11
	call Functionb98ee
	hlcoord 6, 12
	call Functionb98ee
	hlcoord 12, 11
	call Functionb98ee
	ld a, $41
	hlcoord 5, 4
	ld [hl], a
	hlcoord 6, 2
	ld [hl], a
	hlcoord 12, 4
	ld [hl], a
	hlcoord 14, 2
	ld [hl], a
	hlcoord 3, 13
	ld [hl], a
	hlcoord 9, 11
	ld [hl], a
	hlcoord 16, 12
	ld [hl], a
	ret
; b94d6

Functionb94d6: ; b94d6
	push bc
	ld hl, VTiles2 tile $31
	ld bc, $28
	call Functionb97f8
	ld de, Unknown_b9c96
	ld c, 8
	call Functionb9915
	ld de, Unknown_b9c7e
	ld c, 8
	call Functionb9915
	ld de, Unknown_b993e
	ld c, 8
	call Functionb9915
	ld de, Unknown_b997e
	ld c, 8
	call Functionb990c
	ld de, Unknown_b9926
	ld c, 8
	call Functionb9915
	ld de, MailDittoGFX
	ld c, $30
	call Functionb991e
	call Functionb987b
	ld a, $31
	hlcoord 1, 1
	call Functionb98ee
	hlcoord 17, 15
	call Functionb98ee
	hlcoord 1, 3
	ld [hl], a
	hlcoord 3, 1
	ld [hl], a
	hlcoord 16, 16
	ld [hl], a
	hlcoord 18, 14
	ld [hl], a
	ld a, $36
	hlcoord 1, 4
	ld [hl], a
	hlcoord 2, 3
	ld [hl], a
	hlcoord 3, 2
	ld [hl], a
	hlcoord 4, 1
	ld [hl], a
	inc a
	hlcoord 15, 16
	ld [hl], a
	hlcoord 16, 15
	ld [hl], a
	hlcoord 17, 14
	ld [hl], a
	hlcoord 18, 13
	ld [hl], a
	inc a
	hlcoord 2, 15
	ld b, $e
	call Functionb98de
	inc a
	hlcoord 2, 11
	call Functionb98d4
	hlcoord 2, 5
	call Functionb98d4
	inc a
	hlcoord 6, 1
	call Functionb98d0
	hlcoord 1, 16
	call Functionb98d0
	inc a
	hlcoord 3, 13
	call Functionb98fc
	pop hl
	jp Functionb9803
; b9582

Functionb9582: ; b9582
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b997e
	ld c, $8
	call Functionb9915
	ld a, $ff
	ld bc, $10
	call ByteFill
	ld de, Unknown_b992e
	ld c, $8
	call Functionb991e
	ld de, MailDragoniteGFX
	ld c, $b8
	call Functionb991e
	ld de, MailCloudGFX
	ld c, $30
	call Functionb990c
	ld de, Unknown_b9db6
	ld c, $8
	call Functionb990c
	ld de, MailCloudGFX
	ld c, $8
	call Functionb990c
	ld de, Unknown_b9d26
	ld c, $10
	call Functionb990c
	ld de, Unknown_b9d3e
	ld c, $8
	call Functionb990c
	ld a, $31
	hlcoord 0, 0
	call Functionb98dc
	hlcoord 0, 1
	call Functionb98e3
	hlcoord 19, 1
	call Functionb98e3
	inc a
	hlcoord 0, 17
	call Functionb98dc
	inc a
	hlcoord 0, 16
	call Functionb98dc
	inc a
	hlcoord 2, 2
	call Functionb9636
	hlcoord 3, 3
	call Functionb9636
	hlcoord 4, 4
	call Functionb9636
	dec hl
	ld [hl], $7f
	dec a
	hlcoord 15, 14
	call Functionb98ee
	add $4
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	inc a
	push af
	hlcoord 12, 1
	call Functionb98fc
	pop af
	hlcoord 15, 4
	call Functionb98fc
	inc a
	hlcoord 2, 11
	call Functionb98d4
	inc a
	hlcoord 10, 3
	call Functionb98ee
	pop hl
	jp Functionb9803
; b9636

Functionb9636: ; b9636
	ld b, $6
.asm_b9638
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_b9638
	ret
; b963e

Functionb963e: ; b963e
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9d86
	ld c, $40
	call Functionb990c
	ld de, MailOddishGFX
	ld c, $20
	call Functionb991e
	ld de, Unknown_b9db6
	ld c, $8
	call Functionb9915
	ld de, Unknown_b9cbe
	ld c, $20
	call Functionb990c
	ld c, $20
	call Functionb9915
	call Functionb9858
	hlcoord 2, 15
	ld a, $3d
	call Functionb98d4
	ld a, $39
	hlcoord 16, 13
	call Functionb98ee
	hlcoord 2, 13
	call Functionb98ee
	ld a, $3e
	hlcoord 2, 2
	call Functionb98ee
	hlcoord 5, 3
	call Functionb98ee
	hlcoord 10, 2
	call Functionb98ee
	hlcoord 16, 3
	call Functionb98ee
	hlcoord 5, 11
	call Functionb98ee
	hlcoord 16, 10
	call Functionb98ee
	ld a, $42
	hlcoord 3, 4
	call Functionb98ee
	hlcoord 12, 3
	call Functionb98ee
	hlcoord 14, 2
	call Functionb98ee
	hlcoord 2, 10
	call Functionb98ee
	hlcoord 14, 11
	call Functionb98ee
	pop hl
	jp Functionb9803
; b96ca

Functionb96ca: ; b96ca
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e4e
	ld c, $28
	call Functionb9915
	ld de, Unknown_b995e
	ld c, $8
	call Functionb9915
	ld hl, VTiles2 tile $3d
	ld de, Unknown_b9bfe
	ld c, $20
	call Functionb990c
	ld de, Unknown_b9936
	ld c, $8
	call Functionb9915
	call Functionb987b
	hlcoord 8, 15
	ld a, $36
	ld b, $a
	call Functionb98de
	call Functionb9491
	ld a, $1
	ld [UnownLetter], a
	hlcoord 1, 10
	call PrepMonFrontpic
	pop hl
	jp Functionb9803
; b9710

Functionb9710: ; b9710
	push bc
	ld hl, VTiles2 tile $31
	ld de, Unknown_b9e06
	ld c, $20
	call Functionb9915
	ld de, Unknown_b993e
	ld c, $10
	call Functionb9915
	ld de, Unknown_b9996
	ld c, $30
	call Functionb991e
	xor a
	ld bc, $10
	call ByteFill
	ld de, Unknown_b9cfe
	ld c, $18
	call Functionb990c
	ld de, Unknown_b9946
	ld c, $8
	call Functionb990c
	ld a, $31
	hlcoord 0, 0
	call Functionb98a8
	hlcoord 1, 17
	call Functionb98a8
	ld a, $33
	hlcoord 0, 1
	call Functionb98ba
	hlcoord 19, 0
	call Functionb98ba
	ld a, $35
	hlcoord 2, 15
	call Functionb989e
	ld a, $37
	hlcoord 15, 14
	call Functionb98fc
	call Functionb9491
	pop hl
	jp Functionb9803
; b9776

Functionb9776: ; b9776
	push bc
	ld hl, VTiles2 tile $31
	ld bc, $28
	call Functionb97f8
	ld de, Unknown_b992e
	ld c, $8
	call Functionb9915
	ld de, MailMewGFX
	ld c, $90
	call Functionb9915
	ld de, Unknown_b9dce
	ld c, $8
	call Functionb990c
	ld de, Unknown_b9df6
	ld c, $8
	call Functionb990c
	call Functionb987b
	ld a, $36
	hlcoord 1, 16
	call Functionb98d8
	inc a
	hlcoord 15, 14
	call Functionb98fc
	inc a
	hlcoord 15, 16
	ld [hli], a
	inc a
	ld [hl], a
	ld a, $3f
	hlcoord 1, 1
	call Functionb98a8
	ld a, $41
	hlcoord 0, 2
	call Functionb98b5
	ld a, $43
	hlcoord 19, 2
	call Functionb98b5
	ld a, $45
	hlcoord 0, 1
	ld [hl], a
	inc a
	hlcoord 19, 1
	ld [hl], a
	inc a
	hlcoord 0, 16
	ld [hl], a
	inc a
	hlcoord 19, 16
	ld [hl], a
	inc a
	hlcoord 2, 5
	call Functionb98d4
	inc a
	hlcoord 2, 11
	call Functionb98d4
	pop hl
	jp Functionb9803
; b97f8

Functionb97f8: ; b97f8
.asm_b97f8
	xor a
	ld [hli], a
	ld a, $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_b97f8
	ret
; b9803

Functionb9803: ; b9803
	ld bc, $2f
	ld de, wd002
	ld a, $0
	call GetSRAMBank
	call CopyBytes
	call CloseSRAM
	ld hl, wd023
	ld de, wd050
	ld bc, $a
	call CopyBytes
	ld a, $50
	ld [wd023], a
	ld [wd05a], a
	ld de, wd002
	hlcoord 2, 7
	call PlaceString
	ld de, wd050
	ld a, [de]
	and a
	ret z
	ld a, [wd1ec]
	hlcoord 8, 14
	cp $3
	jr z, .asm_b984b
	hlcoord 6, 14
	cp $6
	jr z, .asm_b984b
	hlcoord 5, 14

.asm_b984b
	jp PlaceString
; b984e

Functionb984e: ; b984e
.asm_b984e
	ld a, [hl]
	xor $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_b984e
	ret
; b9858

Functionb9858: ; b9858
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Functionb98d8
	inc a
	ld [hli], a
	inc a
	call Functionb98e3
	ld a, $36
	ld [hli], a
	inc a
	call Functionb98d8
	hlcoord 19, 1
	ld a, $35
	call Functionb98e3
	ld a, $38
	ld [hl], a
	ret
; b987b

Functionb987b: ; b987b
	hlcoord 0, 0
	ld a, $31
	ld [hli], a
	inc a
	call Functionb98d8
	ld [hl], $31
	inc hl
	inc a
	call Functionb98e3
	ld [hl], $31
	inc hl
	inc a
	call Functionb98d8
	hlcoord 19, 1
	ld a, $35
	call Functionb98e3
	ld [hl], $31
	ret
; b989e

Functionb989e: ; b989e
	push af
	ld b, $7
	jr Functionb98ab

Functionb98a3: ; b98a3
	push af
	ld b, $8
	jr Functionb98ab

Functionb98a8: ; b98a8
	push af
	ld b, $9

Functionb98ab: ; b98ab
	ld [hli], a
	inc a
	ld [hli], a
	dec a
	dec b
	jr nz, Functionb98ab
	ld [hl], a
	pop af
	ret
; b98b5

Functionb98b5: ; b98b5
	push af
	ld b, $7
	jr Functionb98bd

Functionb98ba: ; b98ba
	push af
	ld b, $8

Functionb98bd: ; b98bd
	ld [hl], a
	ld de, SCREEN_WIDTH
	add hl, de
	inc a
	ld [hl], a
	add hl, de
	dec a
	dec b
	jr nz, Functionb98bd
	ld [hl], a
	pop af
	ret
; b98cc

Functionb98cc: ; b98cc
	ld b, $7
	jr Functionb98de

Functionb98d0: ; b98d0
	ld b, $d
	jr Functionb98de

Functionb98d4: ; b98d4
	ld b, $10
	jr Functionb98de

Functionb98d8: ; b98d8
	ld b, $12
	jr Functionb98de

Functionb98dc: ; b98dc
	ld b, $14

Functionb98de: ; b98de
	ld [hli], a
	dec b
	jr nz, Functionb98de
	ret
; b98e3

Functionb98e3: ; b98e3
	ld b, $10
	ld de, SCREEN_WIDTH
.asm_b98e8
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_b98e8
	ret
; b98ee

Functionb98ee: ; b98ee
	push af
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, $13
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	pop af
	ret
; b98fc

Functionb98fc: ; b98fc
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ld bc, SCREEN_HEIGHT
	add hl, bc
	inc a
	ld [hli], a
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	ret
; b990c

Functionb990c: ; b990c
.asm_b990c
	ld a, [de]
	inc de
	ld [hli], a
	xor a
	ld [hli], a
	dec c
	jr nz, .asm_b990c
	ret
; b9915

Functionb9915: ; b9915
.asm_b9915
	xor a
	ld [hli], a
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_b9915
	ret
; b991e

Functionb991e: ; b991e
.asm_b991e
	ld a, [de]
	inc de
rept 2
	ld [hli], a
endr
	dec c
	jr nz, .asm_b991e
	ret
; b9926

Unknown_b9926: ; b9926
INCBIN "gfx/unknown/0b9926.1bpp"

Unknown_b992e: ; b992e
INCBIN "gfx/unknown/0b992e.1bpp"

Unknown_b9936: ; b9936
INCBIN "gfx/unknown/0b9936.1bpp"

Unknown_b993e: ; b993e
INCBIN "gfx/unknown/0b993e.1bpp"

Unknown_b9946: ; b9946
INCBIN "gfx/unknown/0b9946.1bpp"

Unknown_b994e: ; b994e
INCBIN "gfx/unknown/0b994e.1bpp"

Unknown_b995e: ; b995e
INCBIN "gfx/unknown/0b995e.1bpp"

Unknown_b9966: ; b9966
INCBIN "gfx/unknown/0b9966.1bpp"

Unknown_b996e: ; b996e
INCBIN "gfx/unknown/0b996e.1bpp"

Unknown_b9976: ; b9976
INCBIN "gfx/unknown/0b9976.1bpp"

Unknown_b997e: ; b997e
INCBIN "gfx/unknown/0b997e.1bpp"

Unknown_b998e: ; b998e
INCBIN "gfx/unknown/0b998e.1bpp"

Unknown_b9996: ; b9996
INCBIN "gfx/unknown/0b9996.1bpp"

MailDratiniGFX: ; b99c6
INCBIN "gfx/unknown/0b99c6.1bpp"

MailPoliwagGFX: ; b99f6
INCBIN "gfx/unknown/0b99f6.1bpp"

MailLaprasGFX: ; b9a26
INCBIN "gfx/unknown/0b9a26.1bpp"

MailPikaGFX: ; b9a56
INCBIN "gfx/unknown/0b9a56.1bpp"

MailDittoGFX: ; b9a86
INCBIN "gfx/unknown/0b9a86.1bpp"

MailMewGFX: ; b9ab6
INCBIN "gfx/unknown/0b9ab6.1bpp"

MailDragoniteGFX: ; b9b46
INCBIN "gfx/unknown/0b9b46.1bpp"

MailSentretGFX: ; b9bce
INCBIN "gfx/unknown/0b9bce.1bpp"

Unknown_b9bee: ; b9bee
INCBIN "gfx/unknown/0b9bee.1bpp"

Unknown_b9bfe: ; b9bfe
INCBIN "gfx/unknown/0b9bfe.1bpp"

MailOddishGFX: ; b9c1e
INCBIN "gfx/unknown/0b9c1e.1bpp"

Unknown_b9c3e: ; b9c3e
INCBIN "gfx/unknown/0b9c3e.1bpp"

Unknown_b9c5e: ; b9c5e
INCBIN "gfx/unknown/0b9c5e.1bpp"

Unknown_b9c7e: ; b9c7e
INCBIN "gfx/unknown/0b9c7e.1bpp"

Unknown_b9c96: ; b9c96
INCBIN "gfx/unknown/0b9c96.1bpp"

Unknown_b9c9e: ; b9c9e
INCBIN "gfx/unknown/0b9c9e.1bpp"

Unknown_b9cbe: ; b9cbe
INCBIN "gfx/unknown/0b9cbe.1bpp"

Unknown_b9cde: ; b9cde
INCBIN "gfx/unknown/0b9cde.1bpp"

Unknown_b9cfe: ; b9cfe
INCBIN "gfx/unknown/0b9cfe.1bpp"

MailCloudGFX: ; b9d16
INCBIN "gfx/unknown/0b9d16.1bpp"

Unknown_b9d26: ; b9d26
INCBIN "gfx/unknown/0b9d26.1bpp"

Unknown_b9d3e: ; b9d3e
INCBIN "gfx/unknown/0b9d3e.1bpp"

Unknown_b9d46: ; b9d46
INCBIN "gfx/unknown/0b9d46.1bpp"

Unknown_b9d76: ; b9d76
INCBIN "gfx/unknown/0b9d76.1bpp"

Unknown_b9d86: ; b9d86
INCBIN "gfx/unknown/0b9d86.1bpp"

Unknown_b9db6: ; b9db6
INCBIN "gfx/unknown/0b9db6.1bpp"

Unknown_b9dc6: ; b9dc6
INCBIN "gfx/unknown/0b9dc6.1bpp"

Unknown_b9dce: ; b9dce
INCBIN "gfx/unknown/0b9dce.1bpp"

Unknown_b9df6: ; b9df6
INCBIN "gfx/unknown/0b9df6.1bpp"

Unknown_b9e06: ; b9e06
INCBIN "gfx/unknown/0b9e06.1bpp"

Unknown_b9e26: ; b9e26
INCBIN "gfx/unknown/0b9e26.1bpp"

Unknown_b9e4e: ; b9e4e
INCBIN "gfx/unknown/0b9e4e.1bpp"


ItemIsMail: ; b9e76
	ld a, d
	ld hl, .items
	ld de, 1
	jp IsInArray
; b9e80

.items
	db FLOWER_MAIL
	db SURF_MAIL
	db LITEBLUEMAIL
	db PORTRAITMAIL
	db LOVELY_MAIL
	db EON_MAIL
	db MORPH_MAIL
	db BLUESKY_MAIL
	db MUSIC_MAIL
	db MIRAGE_MAIL
	db $ff
; b9e8b


SECTION "bank2F", ROMX, BANK[$2F]

INCLUDE "engine/std_scripts.asm"

INCLUDE "engine/phone_scripts.asm"

TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerstatus CHECK_FLAG
	iftrue AlreadyBeatenTrainerScript
	loadtrainerdata
	playrammusic
	jump StartBattleWithMapTrainerScript
; 0xbe675

SeenByTrainerScript:: ; 0xbe675
	loadtrainerdata
	playrammusic
	showemote EMOTE_SHOCK, LAST_TALKED, 30
	callasm TrainerWalkToPlayer
	applymovement2 MovementBuffer
	writepersonxy LAST_TALKED
	faceperson PLAYER, LAST_TALKED
	jump StartBattleWithMapTrainerScript
; 0xbe68a

StartBattleWithMapTrainerScript: ; 0xbe68a
	loadfont
	trainertext $0
	closetext
	loadmovesprites
	loadtrainerdata
	startbattle
	returnafterbattle
	trainerstatus SET_FLAG
	loadvar wd04d, -1

AlreadyBeatenTrainerScript:
	scripttalkafter
; 0xbe699



SECTION "bank30", ROMX, BANK[$30]

INCLUDE "gfx/overworld/sprites_1.asm"

SECTION "bank31", ROMX, BANK[$31]

INCLUDE "gfx/overworld/sprites_2.asm"


SECTION "bank32", ROMX, BANK[$32]

INCLUDE "battle/bg_effects.asm"

INCLUDE "battle/anims.asm"

Functioncbcdd: ; cbcdd
	call Functioncbce5
	ld a, [hCGB]
	and a
	ret nz
	ret
; cbce5

Functioncbce5: ; cbce5
	ld a, [hCGB]
	and a
	jr nz, .asm_cbd06
	ld a, [TimeOfDayPal]
	and $3
	cp $3
	ld a, $0
	jr z, .asm_cbcf7
	ld a, $aa

.asm_cbcf7
	call DmgToCgbBGPals
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret

.asm_cbd06
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld c, $20
.asm_cbd12
; RGB 31, 21, 28
	ld a, $bc
	ld [hli], a
	ld a, $7e
	ld [hli], a
	dec c
	jr nz, .asm_cbd12
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ld c, 4
	call DelayFrames
	callba _UpdateTimePals
	ret
; cbd2e

TheEndGFX:: ; cbd2e
INCBIN "gfx/credits/theend.2bpp"
; cbe2e


SECTION "bank33", ROMX, BANK[$33]

DisplayCaughtContestMonStats: ; cc000

	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	call LoadFontsBattleExtra

	ld hl, Options
	ld a, [hl]
	push af
	set 4, [hl]

	hlcoord 0, 0
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 0, 6
	ld b, 4
	ld c, 13
	call TextBox

	hlcoord 2, 0
	ld de, .Stock
	call PlaceString

	hlcoord 2, 6
	ld de, .This
	call PlaceString

	hlcoord 5, 4
	ld de, .Health
	call PlaceString

	hlcoord 5, 10
	ld de, .Health
	call PlaceString

	ld a, [wContestMon]
	ld [wd265], a
	call GetPokemonName
	ld de, StringBuffer1
	hlcoord 1, 2
	call PlaceString

	ld h, b
	ld l, c
	ld a, [wContestMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	ld de, EnemyMonNick
	hlcoord 1, 8
	call PlaceString

	ld h, b
	ld l, c
	ld a, [EnemyMonLevel]
	ld [TempMonLevel], a
	call PrintLevel

	hlcoord 11, 4
	ld de, wContestMonMaxHP
	lb bc, 2, 3
	call PrintNum

	hlcoord 11, 10
	ld de, EnemyMonMaxHP
	call PrintNum

	ld hl, SwitchMonText
	call PrintText

	pop af
	ld [Options], a

	call WaitBGMap
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ret
; cc0a7

.Health
	db "HEALTH@"
.Stock
	db " STOCK ", $4a, " @"
.This
	db " THIS ", $4a, "  @"

SwitchMonText: ; cc0c2
	; Switch #MON?
	text_jump UnknownText_0x1c10cf
	db "@"
; cc0c7

DisplayAlreadyCaughtText: ; cc0c7
	call GetPokemonName
	ld hl, .AlreadyCaughtText
	jp PrintText
; cc0d0

.AlreadyCaughtText: ; 0xcc0d0
	; You already caught a @ .
	text_jump UnknownText_0x1c10dd
	db "@"
; 0xcc0d5

Predef2F:
Predef38:
Predef39: ; cc0d5
	ret
; cc0d6


INCLUDE "battle/anim_commands.asm"

INCLUDE "battle/anim_objects.asm"


SECTION "Pic Animations 1", ROMX, BANK[$34]

INCLUDE "gfx/pics/animation.asm"

; Pic animations are assembled in 3 parts:

; Top-level animations:
; 	frame #, duration: Frame 0 is the original pic (no change)
;	setrepeat #:       Sets the number of times to repeat
; 	dorepeat #:        Repeats from command # (starting from 0)
; 	end

; Bitmasks:
;	Layered over the pic to designate affected tiles

; Frame definitions:
;	first byte is the bitmask used for this frame
;	following bytes are tile ids mapped to each bit in the mask

; Main animations (played everywhere)
INCLUDE "gfx/pics/anim_pointers.asm"
INCLUDE "gfx/pics/anims.asm"

; Extra animations, appended to the main animation
; Used in the status screen (blinking, tail wags etc.)
INCLUDE "gfx/pics/extra_pointers.asm"
INCLUDE "gfx/pics/extras.asm"

; Unown has its own animation data despite having an entry in the main tables
INCLUDE "gfx/pics/unown_anim_pointers.asm"
INCLUDE "gfx/pics/unown_anims.asm"
INCLUDE "gfx/pics/unown_extra_pointers.asm"
INCLUDE "gfx/pics/unown_extras.asm"

; Bitmasks
INCLUDE "gfx/pics/bitmask_pointers.asm"
INCLUDE "gfx/pics/bitmasks.asm"
INCLUDE "gfx/pics/unown_bitmask_pointers.asm"
INCLUDE "gfx/pics/unown_bitmasks.asm"


SECTION "Pic Animations 2", ROMX, BANK[$35]

INCLUDE "gfx/pics/frame_pointers.asm"
INCLUDE "gfx/pics/kanto_frames.asm"


SECTION "bank36", ROMX, BANK[$36]

FontInversed: INCBIN "gfx/misc/font_inversed.1bpp"


SECTION "Pic Animations 3", ROMX, BANK[$36]

INCLUDE "gfx/pics/johto_frames.asm"
INCLUDE "gfx/pics/unown_frame_pointers.asm"
INCLUDE "gfx/pics/unown_frames.asm"


SECTION "Tileset Data 6", ROMX, BANK[TILESETS_6]

INCLUDE "tilesets/data_6.asm"


SECTION "bank38", ROMX, BANK[$38]

Functione0000: ; e0000
	push de
	xor a
	call GetSRAMBank
	ld hl, sScratch
	ld bc, 0
.asm_e000b
	push bc
	push hl
	push bc
	ld de, wd002
	call Functione004e
	call Functione0057
	ld hl, Unknown_e008b
	pop bc
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wd012
	call Functione004e
	pop hl
	ld bc, $10
	add hl, bc
	pop bc
	inc c
	ld a, c
	cp $31
	jr c, .asm_e000b
	ld hl, OverworldMap
	ld de, sScratch
	ld bc, $310
	call CopyBytes
	pop hl
	ld de, sScratch
	ld c, $31
	ld a, [hROMBank]
	ld b, a
	call Get2bpp
	call CloseSRAM
	ret
; e004e

Functione004e: ; e004e
	ld c, $10
.asm_e0050
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_e0050
	ret
; e0057

Functione0057: ; e0057
	ld hl, wd012
	ld e, $80
	ld d, $8
.asm_e005e
	push hl
	ld hl, wd002
	call Functione0078
	pop hl
	ld a, b
	ld [hli], a
	push hl
	ld hl, wd003
	call Functione0078
	pop hl
	ld a, b
	ld [hli], a
	srl e
	dec d
	jr nz, .asm_e005e
	ret
; e0078

Functione0078: ; e0078
	ld b, $0
	ld c, $8
.asm_e007c
	ld a, [hli]
	and e
	jr z, .asm_e0083
	scf
	jr .asm_e0084

.asm_e0083
	and a

.asm_e0084
	rr b
	inc hl
	dec c
	jr nz, .asm_e007c
	ret
; e008b

Unknown_e008b: ; e008b
	dw wcaa0, wca30, wc9c0, wc950, wc8e0, wc870, wc800
	dw wcab0, wca40, wc9d0, wc960, wc8f0, wc880, wc810
	dw wcac0, wca50, wc9e0, wc970, wc900, wc890, wc820
	dw wcad0, wca60, wc9f0, wc980, wc910, wc8a0, wc830
	dw wcae0, wca70, wca00, wc990, wc920, wc8b0, wc840
	dw wcaf0, wca80, wca10, wc9a0, wc930, wc8c0, wc850
	dw wcb00, wca90, wca20, wc9b0, wc940, wc8d0, wc860
; e00ed

Unknown_e00ed:
; Graphics for an unused Game Corner
; game were meant to be here.

Functione00ed: ; e00ed (38:40ed)
	ret
; e00ee (38:40ee)

INCLUDE "engine/card_flip.asm"
INCLUDE "engine/dummy_game.asm"
INCLUDE "engine/billspc.asm"

SECTION "bank39", ROMX, BANK[$39]

CopyrightGFX:: ; e4000
INCBIN "gfx/misc/copyright.2bpp"
; e41d0

INCLUDE "engine/options_menu.asm"

Functione455c: ; e455c
	hlcoord 1, 1
	ld de, SCREEN_WIDTH
	ld c, $10
.asm_e4564
	ld [hl], $7f
	add hl, de
	dec c
	jr nz, .asm_e4564
	hlcoord 1, 2
	ld bc, $28
	ld a, [wJumptableIndex]
	call AddNTimes
	ld [hl], $ed
	ret
; e4579


Functione4579: ; e4579
	ld de, MUSIC_NONE
	call PlayMusic
	call ClearBGPalettes
	call ClearTileMap
	ld a, VBGMap0 / $100
	ld [hBGMapAddress + 1], a
	xor a
	ld [hBGMapAddress], a
	ld [hJoyDown], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $90
	ld [hWY], a
	call WaitBGMap
	ld b, SCGB_19
	call GetSGBLayout
	call SetPalettes
	ld c, 10
	call DelayFrames
	callab Copyright
	call WaitBGMap
	ld c, 100
	call DelayFrames
	call ClearTileMap
	callba GBCOnlyScreen
	call Functione45e8
.joy_loop
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .pressed_button
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .finish
	call PlaceGameFreakPresents
	callba Function8cf69
	call DelayFrame
	jr .joy_loop

.pressed_button
	call Functione465e
	scf
	ret

.finish
	call Functione465e
	and a
	ret
; e45e8

Functione45e8: ; e45e8
	ld de, GameFreakLogo
	ld hl, VTiles2
	lb bc, BANK(GameFreakLogo), $1c
	call Get1bpp

	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	ld hl, IntroLogoGFX
	ld de, w6_d000
	ld a, BANK(IntroLogoGFX)
	call FarDecompress

	ld hl, VTiles0
	ld de, w6_d000
	lb bc, 1, 8 tiles
	call Request2bpp

	ld hl, VTiles1
	ld de, w6_d000 + $80 tiles
	lb bc, 1, 8 tiles
	call Request2bpp

	pop af
	ld [rSVBK], a

	callba Function8cf53
	lb de, $54, $58
	ld a, SPRITE_ANIM_INDEX_03
	call _InitSpriteAnimStruct
	ld hl, $7
	add hl, bc
	ld [hl], $a0
	ld hl, $c
	add hl, bc
	ld [hl], $60
	ld hl, $d
	add hl, bc
	ld [hl], $30
	xor a
	ld [wJumptableIndex], a
	ld [wcf64], a
	ld [wcf65], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $1
	ld [hBGMapMode], a
	ld a, $90
	ld [hWY], a
	ld de, $e4e4
	call DmgToCgbObjPals
	ret
; e465e

Functione465e: ; e465e
	callba Function8cf53
	call ClearTileMap
	call ClearSprites
	ld c, 16
	call DelayFrames
	ret
; e4670

PlaceGameFreakPresents: ; e4670
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, .jumptable
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e467f

.jumptable: ; e467f
	dw PlaceGameFreakPresents_0
	dw PlaceGameFreakPresents_1
	dw PlaceGameFreakPresents_2
	dw PlaceGameFreakPresents_3
; e4687

PlaceGameFreakPresents_AdvanceIndex: ; e4687
	ld hl, wJumptableIndex
	inc [hl]
	ret
; e468c

PlaceGameFreakPresents_0: ; e468c
	ret
; e468d

PlaceGameFreakPresents_1: ; e468d
	ld hl, wcf65
	ld a, [hl]
	cp $20
	jr nc, .PlaceGameFreak
	inc [hl]
	ret

.PlaceGameFreak
	ld [hl], 0
	ld hl, .GAME_FREAK
	decoord 5, 10
	ld bc, .end - .GAME_FREAK
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ld de, SFX_GAME_FREAK_PRESENTS
	call PlaySFX
	ret
; e46af

.GAME_FREAK
	;  G  A  M  E   _  F  R  E  A  K
	db 0, 1, 2, 3, 13, 4, 5, 3, 1, 6
.end
	db "@"
; e46ba

PlaceGameFreakPresents_2: ; e46ba
	ld hl, wcf65
	ld a, [hl]
	cp $40
	jr nc, .place_presents
	inc [hl]
	ret

.place_presents
	ld [hl], 0
	ld hl, .presents
	decoord 7,11
	ld bc, .end - .presents
	call CopyBytes
	call PlaceGameFreakPresents_AdvanceIndex
	ret
; e46d6

.presents
	db 7, 8, 9, 10, 11, 12
.end
	db "@"
; e46dd

PlaceGameFreakPresents_3: ; e46dd
	ld hl, wcf65
	ld a, [hl]
	cp $80
	jr nc, .finish
	inc [hl]
	ret

.finish
	ld hl, wJumptableIndex
	set 7, [hl]
	ret
; e46ed



GameFreakLogoJumper: ; e46ed (39:46ed)
	ld hl, $b
	add hl, bc
	ld e, [hl]
	ld d, 0
	ld hl, GameFreakLogoScenes
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

GameFreakLogoScenes: ; e46fd (39:46fd)
	dw GameFreakLogoScene1
	dw GameFreakLogoScene2
	dw GameFreakLogoScene3
	dw GameFreakLogoScene4
	dw GameFreakLogoScene5


GameFreakLogoScene1: ; e4707 (39:4707)
	ld hl, $b
	add hl, bc
	inc [hl]
	ret

GameFreakLogoScene2: ; e470d (39:470d)
	ld hl, $c
	add hl, bc
	ld a, [hl]
	and a
	jr z, .asm_e4747
	ld d, a
	ld hl, $d
	add hl, bc
	ld a, [hl]
	and $3f
	cp $20
	jr nc, .asm_e4723
	add $20
.asm_e4723
	ld e, a
	callba Functionce765
	ld hl, $7
	add hl, bc
	ld [hl], e
	ld hl, $d
	add hl, bc
	ld a, [hl]
	dec [hl]
	and $1f
	ret nz
	ld hl, $c
	add hl, bc
	ld a, [hl]
	sub $30
	ld [hl], a
	ld de, SFX_DITTO_BOUNCE
	call PlaySFX
	ret
.asm_e4747
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_POP_UP
	call PlaySFX
	ret

GameFreakLogoScene3: ; e4759 (39:4759)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $20
	jr nc, .asm_e4764
	inc [hl]
	ret
.asm_e4764
	ld hl, $b
	add hl, bc
	inc [hl]
	ld hl, $d
	add hl, bc
	ld [hl], $0
	ld de, SFX_DITTO_TRANSFORM
	call PlaySFX
	ret

GameFreakLogoScene4: ; e4776 (39:4776)
	ld hl, $d
	add hl, bc
	ld a, [hl]
	cp $40
	jr z, .asm_e47a3
	inc [hl]
	srl a
	srl a
	ld e, a
	ld d, $0
	ld hl, GameFreakLogoPalettes
rept 2
	add hl, de
endr
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [hli]
	ld [OBPals + 12], a
	ld a, [hli]
	ld [OBPals + 13], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
.asm_e47a3
	ld hl, $b
	add hl, bc
	inc [hl]
	call PlaceGameFreakPresents_AdvanceIndex

GameFreakLogoScene5: ; e47ab (39:47ab)
	ret
; e47ac (39:47ac)

GameFreakLogoPalettes: ; e47ac
; Ditto's color as it turns into the Game Freak logo.
; Fade from pink to orange.
; One color per step.
	RGB 23, 12, 28
	RGB 23, 12, 27
	RGB 23, 13, 26
	RGB 23, 13, 24
	RGB 24, 14, 22
	RGB 24, 14, 20
	RGB 24, 15, 18
	RGB 24, 15, 16
	RGB 25, 16, 14
	RGB 25, 16, 12
	RGB 25, 17, 10
	RGB 25, 17, 08
	RGB 26, 18, 06
	RGB 26, 18, 04
	RGB 26, 19, 02
	RGB 26, 19, 00
;' e47cc

GameFreakLogo: ; e47cc
INCBIN "gfx/splash/logo.1bpp"
; e48ac

CrystalIntro: ; e48ac
	ld a, [rSVBK]
	push af
	ld a, 5
	ld [rSVBK], a
	ld a, [hInMenu]
	push af
	ld a, [hVBlank]
	push af
	call Functione4901
.loop: ; e48bc
	call JoyTextDelay
	ld a, [hJoyLast]
	and BUTTONS
	jr nz, .ShutOffMusic
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done
	call IntroSceneJumper
	callba Function8cf69
	call DelayFrame
	jp .loop

.ShutOffMusic
	ld de, MUSIC_NONE
	call PlayMusic

.done
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	pop af
	ld [hVBlank], a
	pop af
	ld [hInMenu], a
	pop af
	ld [rSVBK], a
	ret
; e4901

Functione4901: ; e4901
	xor a
	ld [hVBlank], a
	ld a, $1
	ld [hInMenu], a
	xor a
	ld [hMapAnims], a
	ld [wJumptableIndex], a
	ret
; e490f

IntroSceneJumper: ; e490f
	ld a, [wJumptableIndex]
	ld e, a
	ld d, 0
	ld hl, IntroScenes
rept 2
	add hl, de
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; e491e


IntroScenes: ; e491e (39:491e)
	dw IntroScene1
	dw IntroScene2
	dw IntroScene3
	dw IntroScene4
	dw IntroScene5
	dw IntroScene6
	dw IntroScene7
	dw IntroScene8
	dw IntroScene9
	dw IntroScene10
	dw IntroScene11
	dw IntroScene12
	dw IntroScene13
	dw IntroScene14
	dw IntroScene15
	dw IntroScene16
	dw IntroScene17
	dw IntroScene18
	dw IntroScene19
	dw IntroScene20
	dw IntroScene21
	dw IntroScene22
	dw IntroScene23
	dw IntroScene24
	dw IntroScene25
	dw IntroScene26
	dw IntroScene27
	dw IntroScene28


NextIntroScene: ; e4956 (39:4956)
	ld hl, wJumptableIndex
	inc [hl]
	ret

IntroScene1: ; e495b (39:495b)
; Setup the next scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap001
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroPulseGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld hl, IntroTilemap002
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene2: ; e49d6 (39:49d6)
; First Unown (A) fades in, pulses, then fades out.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr nz, .DontPlaySound
	push af
	ld de, $5858
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.DontPlaySound
	ld [wcf65], a
	xor a
	call Functione5223
	ret
.endscene
	call NextIntroScene
	ret

IntroScene3: ; e49fd (39:49fd)
; More setup. Transition to the outdoor scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Functione5516
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	call NextIntroScene
	ret

IntroScene4: ; e4a69 (39:4a69)
; Scroll the outdoor panorama for a bit.
	call Functione552f
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	cp $80
	jr z, .endscene
	inc [hl]
	ret
.endscene
	call NextIntroScene
	ret

IntroScene5: ; e4a7a (39:4a7a)
; Go back to the Unown.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDStatCustom], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap005
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroPulseGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld hl, IntroTilemap006
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene6: ; e4af7 (39:4af7)
; Two more Unown (I, H) fade in.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .endscene
	cp $60
	jr z, .SecondUnown
	cp $40
	jr nc, .StopUnown
	cp $20
	jr z, .FirstUnown
	jr .NoUnown
.FirstUnown
	push af
	ld de, $3878
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_2
	call PlaySFX
	pop af
.NoUnown
	ld [wcf65], a
	xor a
	call Functione5223
	ret
.SecondUnown
	push af
	ld de, $7030
	call Functione51dc
	ld de, SFX_INTRO_UNOWN_1
	call PlaySFX
	pop af
.StopUnown
	ld [wcf65], a
	ld a, $1
	call Functione5223
	ret
.endscene
	call NextIntroScene
	ret

IntroScene7: ; e4b3f (39:4b3f)
; Back to the outdoor scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld hl, IntroPichuWooperGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, VTiles0 tile $00
	call Functione54de
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	call Functione5516
	callba Function8cf53
	lb de, $6c, $d8
	ld a, SPRITE_ANIM_INDEX_26
	call _InitSpriteAnimStruct
	ld a, $f0
	ld [wc3c0], a
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene8: ; e4bd3 (39:4bd3)
; Scroll the scene, then show Suicune running across the screen.
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $40
	jr z, .asm_e4be2
	jr nc, .asm_e4be8
	call Functione552f
	ret
.asm_e4be2
	ld de, SFX_INTRO_SUICUNE_3
	call PlaySFX
.asm_e4be8
	ld a, [wc3c0]
	and a
	jr z, .asm_e4bf4
	sub $8
	ld [wc3c0], a
	ret
.asm_e4bf4
	ld de, SFX_INTRO_SUICUNE_2
	call PlaySFX
	callba Function8d03d
	call NextIntroScene
	ret

IntroScene9: ; e4c04 (39:4c04)
; Set up the next scene (same bg).
	xor a
	ld [hLCDStatCustom], a
	call ClearSprites
	hlcoord 0, 0, AttrMap
	ld bc, $f0
	ld a, $1
	call ByteFill
	ld bc, $3c
	ld a, $2
	call ByteFill
	ld bc, $3c
	ld a, $3
	call ByteFill
	ld a, $2
	ld [hBGMapMode], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	ld a, $c
	ld [hBGMapAddress], a
	call DelayFrame
	call DelayFrame
	call DelayFrame
	xor a
	ld [hBGMapMode], a
	ld [hBGMapAddress], a
	ld [wc3c0], a
	xor a
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene10: ; e4c4f (39:4c4f)
; Wooper and Pichu enter.
	call Functione546d
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $c0
	jr z, .done
	cp $20
	jr z, .wooper
	cp $40
	jr z, .pichu
	ret

.pichu
	lb de, $a9, $80
	ld a, SPRITE_ANIM_INDEX_27
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret

.wooper
	lb de, $b0, $30
	ld a, SPRITE_ANIM_INDEX_28
	call _InitSpriteAnimStruct
	ld de, SFX_INTRO_PICHU
	call PlaySFX
	ret
.done
	call NextIntroScene
	ret

IntroScene11: ; e4c86 (39:4c86)
; Back to Unown again.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld [hLCDStatCustom], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap007
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap008
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_365ad
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_365ad
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	xor a
	ld [wIntroSceneFrameCounter], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene12: ; e4cfa (39:4cfa)
; Even more Unown.
	call Functione4d36
	ld hl, wIntroSceneFrameCounter
	ld a, [hl]
	inc [hl]
	cp $c0
	jr nc, .asm_e4d32
	cp $80
	jr nc, .asm_e4d1d
	ld c, a
	and $1f
	sla a
	ld [wcf65], a
	ld a, c
	and $e0
	srl a
	swap a
	call Functione5223
	ret
.asm_e4d1d
	ld c, a
	and $f
	sla a
	sla a
	ld [wcf65], a
	ld a, c
	and $70
	or $40
	swap a
	call Functione5223
	ret
.asm_e4d32
	call NextIntroScene
	ret

Functione4d36: ; e4d36 (39:4d36)
	ld a, [wIntroSceneFrameCounter]
	ld c, a
	ld hl, .UnownSounds
.loop
	ld a, [hli]
	cp -1
	ret z
	cp c
	jr z, .playsound
rept 2
	inc hl
endr
	jr .loop
.playsound
	ld a, [hli]
	ld d, [hl]
	ld e, a
	push de
	call SFXChannelsOff
	pop de
	call PlaySFX
	ret
; e4d54 (39:4d54)

.UnownSounds: ; e4d54
	dbw $00, SFX_INTRO_UNOWN_3
	dbw $20, SFX_INTRO_UNOWN_2
	dbw $40, SFX_INTRO_UNOWN_1
	dbw $60, SFX_INTRO_UNOWN_2
	dbw $80, SFX_INTRO_UNOWN_3
	dbw $90, SFX_INTRO_UNOWN_2
	dbw $a0, SFX_INTRO_UNOWN_1
	dbw $b0, SFX_INTRO_UNOWN_2
	db $ff
; e4d6d

IntroScene13: ; e4d6d (39:4d6d)
; Switch scenes again.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap003
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneRunGFX
	ld de, VTiles0 tile $00
	call Functione54de
	ld hl, IntroBackgroundGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap004
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e5edd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e5edd
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	lb de, $6c, $58
	ld a, SPRITE_ANIM_INDEX_26
	call _InitSpriteAnimStruct
	ld de, MUSIC_CRYSTAL_OPENING
	call PlayMusic
	xor a
	ld [wc3c0], a
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene14: ; e4dfa (39:4dfa)
; Suicune runs then jumps.
	ld a, [hSCX]
	sub 10
	ld [hSCX], a
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr z, .done
	cp $60
	jr z, .jump
	jr nc, .asm_e4e1a
	cp $40
	jr nc, .asm_e4e33
	ret

.jump
	ld de, SFX_INTRO_SUICUNE_4
	call PlaySFX

.asm_e4e1a
	ld a, $1
	ld [wcf65], a
	ld a, [wc3c0]
	cp $88
	jr c, .asm_e4e2c
	sub $8
	ld [wc3c0], a
	ret

.asm_e4e2c
	callba Function8d03d
	ret

.asm_e4e33
	ld a, [wc3c0]
	sub $2
	ld [wc3c0], a
	ret

.done
	call NextIntroScene
	ret

IntroScene15: ; e4e40 (39:4e40)
; Transition to a new scene.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap009
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneJumpGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroUnownBackGFX
	ld de, VTiles0 tile $00
	call Functione54c2
	ld de, GFX_e7a5d
	ld hl, VTiles1 tile $00
	lb bc, BANK(GFX_e7a5d), 1
	call Request2bpp
	ld hl, IntroTilemap010
	ld de, VBGMap0 tile $00
	call Functione54fa
	call Functione541b
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld a, $90
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	lb de, $40, $28
	ld a, SPRITE_ANIM_INDEX_2A
	call _InitSpriteAnimStruct
	lb de, $60, $00
	ld a, SPRITE_ANIM_INDEX_2B
	call _InitSpriteAnimStruct
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene16: ; e4edc (39:4edc)
; Suicune shows its face. An Unown appears in front.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done
	call Functione5441
	ld a, [hSCY]
	and a
	ret z
	add 8
	ld [hSCY], a
	ret
.done
	call NextIntroScene
	ret

IntroScene17: ; e4ef5 (39:4ef5)
; ...
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap011
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneCloseGFX
	ld de, VTiles1 tile $00
	call Functione54de
	ld hl, IntroTilemap012
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e6d6d
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e6d6d
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene18: ; e4f67 (39:4f67)
; Suicune close up.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $60
	jr nc, .done
	ld a, [hSCX]
	cp $60
	ret z
	add 8
	ld [hSCX], a
	ret
.done
	call NextIntroScene
	ret

IntroScene19: ; e4f7e (39:4f7e)
; More setup.
	call Functione54a3
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap013
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroSuicuneBackGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroUnownsGFX
	ld de, VTiles1 tile $00
	call Functione54c2
	ld de, GFX_e7a5d
	ld hl, VTiles1 tile $7f
	lb bc, BANK(GFX_e7a5d), 1
	call Request2bpp
	ld hl, IntroTilemap014
	ld de, VBGMap0 tile $00
	call Functione54fa
	call Functione541b
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e77dd
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e77dd
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld a, $d8
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	ld hl, wc300
	xor a
	ld [hli], a
	ld [hl], $7f
	call Functione549e
	lb de, $60, $00
	ld a, SPRITE_ANIM_INDEX_2B
	call _InitSpriteAnimStruct
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene20: ; e5019 (39:5019)
; Suicune running away. A bunch of Unown appear.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $98
	jr nc, .asm_e5059
	cp $58
	ret nc
	cp $40
	jr nc, .asm_e5032
	cp $28
	ret nc
	ld a, [hSCY]
	inc a
	ld [hSCY], a
	ret

.asm_e5032
	sub $18
	ld c, a
	and $3
	cp $3
	ret nz
	ld a, c
	and $1c
	srl a
	srl a
	ld [wcf65], a
	xor a
	call Functione5348
	ret
; e5049 (39:5049)

	ld a, c
	and $1c
	srl a
	srl a
	ld [wcf65], a
	ld a, 1
	call Functione5348
	ret

.asm_e5059
	call NextIntroScene
	ret

IntroScene21: ; e505d (39:505d)
; Suicune gets more distant and turns black.
	call Functione5451
	ld c, 3
	call DelayFrames
	xor a
	ld [hBGMapMode], a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene22: ; e5072 (39:5072)
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $8
	jr nc, .done
	ret
.done
	callba Function8d03d
	call NextIntroScene
	ret

IntroScene23: ; e5086 (39:5086)
	xor a
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene24: ; e508e (39:508e)
; Fade to white.
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $20
	jr nc, .done

	ld c, a
	and $3
	ret nz
	ld a, c
	and $1c
	sla a
	call Functione5172
	ret

.done
	ld a, $40
	ld [wcf64], a
	call NextIntroScene
	ret

IntroScene25: ; e50ad (39:50ad)
; Wait around a bit.
	ld a, [wcf64]
	dec a
	jr z, .done
	ld [wcf64], a
	ret
.done
	call NextIntroScene
	ret

IntroScene26: ; e50bb (39:50bb)
; Load the final scene.
	call ClearBGPalettes
	call ClearSprites
	call ClearTileMap
	xor a
	ld [hBGMapMode], a
	ld a, $1
	ld [rVBK], a
	ld hl, IntroTilemap015
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, $0
	ld [rVBK], a
	ld hl, IntroCrystalUnownsGFX
	ld de, VTiles2 tile $00
	call Functione54c2
	ld hl, IntroTilemap017
	ld de, VBGMap0 tile $00
	call Functione54fa
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, Palette_e679d
	ld de, wMapPals
	ld bc, $80
	call CopyBytes
	ld hl, Palette_e679d
	ld de, BGPals
	ld bc, $80
	call CopyBytes
	pop af
	ld [rSVBK], a
	xor a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	callba Function8cf53
	call Functione549e
	xor a
	ld [wcf64], a
	ld [wcf65], a
	call NextIntroScene
	ret

IntroScene27: ; e512d (39:512d)
; Spell out C R Y S T A L with Unown.
	ld hl, wcf65
	inc [hl]
	ld hl, wcf64
	ld a, [hl]
	inc [hl]
	cp $80
	jr nc, .done

	ld c, a
	and $f
	ld [wcf65], a
	ld a, c
	and $70
	swap a
	call Functione539d
	ret

.done
	call NextIntroScene
	ld a, $80
	ld [wcf64], a
	ret

IntroScene28: ; e5152 (39:5152)
; Cut out when the music ends, and lead into the title screen.
	ld hl, wcf64
	ld a, [hl]
	and a
	jr z, .done
	dec [hl]
	cp $18
	jr z, .clear
	cp $8
	ret nz

	ld de, SFX_UNKNOWN_CB
	call PlaySFX
	ret

.clear
	call ClearBGPalettes
	ret

.done
	ld hl, wJumptableIndex
	set 7, [hl]
	ret


Functione5172: ; e5172 (39:5172)
	ld hl, Unknown_e519c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld de, BGPals
	ld b, $8
.asm_e5187
	push hl
	ld c, $8
.asm_e518a
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_e518a
	pop hl
	dec b
	jr nz, .asm_e5187
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e519c (39:519c)

Unknown_e519c: ; e519c
; Fade to white.
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00

	RGB 31, 19, 05
	RGB 31, 31, 31
	RGB 15, 05, 31
	RGB 07, 07, 07

	RGB 31, 21, 09
	RGB 31, 31, 31
	RGB 18, 09, 31
	RGB 11, 11, 11

	RGB 31, 23, 13
	RGB 31, 31, 31
	RGB 21, 13, 31
	RGB 15, 15, 15

	RGB 31, 25, 17
	RGB 31, 31, 31
	RGB 25, 17, 31
	RGB 19, 19, 19

	RGB 31, 27, 21
	RGB 31, 31, 31
	RGB 27, 21, 31
	RGB 23, 23, 23

	RGB 31, 29, 25
	RGB 31, 31, 31
	RGB 29, 26, 31
	RGB 27, 27, 27

	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; e51dc

Functione51dc: ; e51dc (39:51dc)
	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $8
	ld a, $3c
	call Function3b3c
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $18
	ld a, $3b
	call Function3b3c
	pop de

	push de
	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $28
	ld a, $39
	call Function3b3c
	pop de

	ld a, SPRITE_ANIM_INDEX_29
	call _InitSpriteAnimStruct
	ld hl, $c
	add hl, bc
	ld [hl], $38
	ld a, $3a
	call Function3b3c
	ret

Functione5223: ; e5223 (39:5223)
rept 3
	add a
endr
	ld e, a
	ld d, $0
	ld hl, BGPals
	add hl, de
rept 2
	inc hl
endr
	ld a, [wcf65]
	and $3f
	cp $1f
	jr z, .asm_e523e
	jr c, .asm_e523e
	ld c, a
	ld a, $3f
	sub c
.asm_e523e
	ld c, a
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push hl
	push bc
	ld hl, BGPals
	ld bc, $40
	xor a
	call ByteFill
	pop bc
	pop hl
	push hl
	ld hl, Unknown_e5288
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, Unknown_e52c8
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, Unknown_e5308
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e5288 (39:5288)

Unknown_e5288: ; e5288
; Fade between black and white.
hue = 0
rept 32
	RGB hue, hue, hue
hue = hue + 1
endr
; e52c8

Unknown_e52c8: ; e52c8
; Fade between black and light blue.
hue = 0
rept 32
	RGB 0, hue / 2, hue
hue = hue + 1
endr
; e5308

Unknown_e5308: ; e5308
; Fade between black and blue.
hue = 0
rept 32
	RGB 0, 0, hue
hue = hue + 1
endr
; e5348

Functione5348: ; e5348 (39:5348)
	and a
	jr nz, .asm_e5350
	ld hl, Palette_e538d
	jr .asm_e5353
.asm_e5350
	ld hl, Palette_e5395
.asm_e5353
	ld a, [wcf65]
	and $7
rept 3
	add a
endr
	ld c, a
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push bc
	ld de, BGPals
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $8
	call CopyBytes
	pop bc
	ld de, wMapPals
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $8
	call CopyBytes
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e538d (39:538d)

Palette_e538d: ; e538d
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 12, 00, 31
	RGB 00, 00, 00
; e5395

Palette_e5395: ; e5395
	RGB 24, 12, 09
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
; e539d

Functione539d: ; e539d (39:539d)
rept 3
	add a
endr
	ld e, a
	ld d, $0
	ld hl, BGPals
	add hl, de
rept 4
	inc hl
endr
	ld a, [wcf65]
	add a
	ld c, a
	ld b, $0
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	push hl
	ld hl, Palette_e53db
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, Palette_e53fb
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	ret
; e53db (39:53db)

Palette_e53db: ; e53db
hue = 31
rept 8
	RGB hue, hue, hue
hue = hue + -1
	RGB hue, hue, hue
hue = hue + -2
endr
; e53fb

Palette_e53fb: ; e53fb
hue = 31
rept 16
	RGB hue, hue, hue
hue = hue + -1
endr
; e541b

Functione541b: ; e541b (39:541b)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	ld hl, w6_d000
	decoord 0, 0
	ld b, SCREEN_HEIGHT
.asm_e542a
	ld c, SCREEN_WIDTH
.asm_e542c
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .asm_e542c
	ld a, $c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_e542a
	pop af
	ld [rSVBK], a
	ret

Functione5441: ; e5441 (39:5441)
	ld a, [wcf64]
	and $3
	jr z, Functione5451
	cp $3
	jr z, .asm_e544d
	ret
.asm_e544d
	xor a
	ld [hBGMapMode], a
	ret

Functione5451: ; e5451 (39:5451)
	hlcoord 0, 0
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
.asm_e5457
	ld a, [hl]
	and a
	jr z, .asm_e5462
	cp $80
	jr nc, .asm_e5462
	xor $8
	ld [hl], a
.asm_e5462
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .asm_e5457
	ld a, $1
	ld [hBGMapMode], a
	ret

Functione546d: ; e546d (39:546d)
	ld a, [wcf64]
	cp $24
	ret nc
	and $c
	srl a
	ld e, a
	ld d, $0
	ld hl, Unknown_e5496
	add hl, de
	ld a, [hli]
	ld [Requested2bppSource], a
	ld a, [hli]
	ld [Requested2bppSource + 1], a
	ld a, (VTiles2 tile $09) % $100
	ld [Requested2bppDest], a
	ld a, (VTiles2 tile $09) / $100
	ld [Requested2bppDest + 1], a
	ld a, $4
	ld [Requested2bpp], a
	ret
; e5496 (39:5496)

Unknown_e5496: ; e5496
	dw GFX_e799d
	dw GFX_e79dd
	dw GFX_e7a1d
	dw GFX_e79dd
; e549e

Functione549e: ; e549e (39:549e)
	ld a, $1
	ld [hCGBPalUpdate], a
	ret

Functione54a3: ; e54a3 (39:54a3)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, BGPals
	ld bc, $80
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, $1
	ld [hCGBPalUpdate], a
	call DelayFrame
	call DelayFrame
	ret

Functione54c2: ; e54c2 (39:54c2)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $180
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione54de: ; e54de (39:54de)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $1ff
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione54fa: ; e54fa (39:54fa)
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a
	push de
	ld de, w6_d000
	call Decompress
	pop hl
	ld de, w6_d000
	ld bc, $140
	call Request2bpp
	pop af
	ld [rSVBK], a
	ret

Functione5516: ; e5516 (39:5516)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld hl, LYOverrides
	ld bc, $90
	xor a
	call ByteFill
	pop af
	ld [rSVBK], a
	ld a, $43
	ld [hLCDStatCustom], a
	ret

Functione552f: ; e552f (39:552f)
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a
	ld a, [wcf64]
	and $1
	jr z, .asm_e5548
	ld hl, LYOverrides
	ld a, [hl]
	inc a
	ld bc, $5f
	call ByteFill
.asm_e5548
	ld hl, LYOverrides + $5f
	ld a, [hl]
rept 2
	inc a
endr
	ld bc, $31
	call ByteFill
	ld a, [LYOverrides + 0]
	ld [hSCX], a
	pop af
	ld [rSVBK], a
	ret

IntroSuicuneRunGFX: ; e555d
INCBIN "gfx/intro/suicune_run.2bpp.lz"
; e592d

IntroPichuWooperGFX: ; e592d
INCBIN "gfx/intro/pichu_wooper.2bpp.lz"
; e5c7d

IntroBackgroundGFX: ; e5c7d
INCBIN "gfx/intro/background.2bpp.lz"
; e5e6d

IntroTilemap004: ; e5e6d
INCBIN "gfx/intro/004.tilemap.lz"
; e5ecd

IntroTilemap003: ; e5ecd
INCBIN "gfx/intro/003.tilemap.lz"
; e5edd

Palette_e5edd: ; e5edd
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB  0,  4,  5
	RGB  1,  8,  5
	RGB  4, 12,  9
	RGB 24, 12,  9
	RGB  0,  4,  5
	RGB  9,  6,  8
	RGB  8, 16,  5
	RGB  5, 10,  4
	RGB 31, 31, 31
	RGB  9,  6,  8
	RGB 18,  9,  9
	RGB 13,  8,  9
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB  2,  5, 22
	RGB  1,  5, 12
	RGB 31, 31, 31
	RGB 31, 10, 25
	RGB 31, 21,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 21, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroUnownsGFX: ; e5f5d
INCBIN "gfx/intro/unowns.2bpp.lz"
; e634d

IntroPulseGFX: ; e634d
INCBIN "gfx/intro/pulse.2bpp.lz"
; e63dd

IntroTilemap002: ; e63dd
INCBIN "gfx/intro/002.tilemap.lz"
; e641d

IntroTilemap001: ; e641d
INCBIN "gfx/intro/001.tilemap.lz"
; e642d

IntroTilemap006: ; e642d
INCBIN "gfx/intro/006.tilemap.lz"
; e647d

IntroTilemap005: ; e647d
INCBIN "gfx/intro/005.tilemap.lz"
; e649d

IntroTilemap008: ; e649d
INCBIN "gfx/intro/008.tilemap.lz"
; e655d

IntroTilemap007: ; e655d
INCBIN "gfx/intro/007.tilemap.lz"
; e65ad

Palette_365ad: ; e65ad
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 10,  0, 10
	RGB 19,  0, 19
	RGB 31,  0, 31
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroCrystalUnownsGFX: ; e662d
INCBIN "gfx/intro/crystal_unowns.2bpp.lz"
; e672d

IntroTilemap017: ; e672d
INCBIN "gfx/intro/017.tilemap.lz"
; e676d

IntroTilemap015: ; e676d
INCBIN "gfx/intro/015.tilemap.lz"
; e679d

Palette_e679d: ; e679d
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroSuicuneCloseGFX: ; e681d
INCBIN "gfx/intro/suicune_close.2bpp.lz"
; e6c3d

IntroTilemap012: ; e6c3d
INCBIN "gfx/intro/012.tilemap.lz"
; e6d0d

IntroTilemap011: ; e6d0d
INCBIN "gfx/intro/011.tilemap.lz"
; e6d6d

Palette_e6d6d: ; e6d6d
	RGB 24, 12,  9
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 12, 20, 31
	RGB 19,  8, 31
	RGB  0,  0,  0
	RGB 12, 20, 31
	RGB  8,  9, 31
	RGB 19,  8, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 12, 20, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroSuicuneJumpGFX: ; e6ded
INCBIN "gfx/intro/suicune_jump.2bpp.lz"
; e72ad

IntroSuicuneBackGFX: ; e72ad
INCBIN "gfx/intro/suicune_back.2bpp.lz"
; e764d

IntroTilemap010: ; e764d
INCBIN "gfx/intro/010.tilemap.lz"
; e76ad

IntroTilemap009: ; e76ad
INCBIN "gfx/intro/009.tilemap.lz"
; e76bd

IntroTilemap014: ; e76bd
INCBIN "gfx/intro/014.tilemap.lz"
; e778d

IntroTilemap013: ; e778d
INCBIN "gfx/intro/013.tilemap.lz"
; e77dd

Palette_e77dd: ; e77dd
	RGB 24, 12,  9
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB  8,  9, 31
	RGB  0,  0,  0
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 24, 12,  9
	RGB 31, 31, 31
	RGB 31, 31, 31
	RGB 12,  0, 31
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 21,  9,  0
	RGB 21,  9,  0
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0
	RGB 31, 31, 31
	RGB 20, 20, 20
	RGB 11, 11, 11
	RGB  0,  0,  0

IntroUnownBackGFX: ; e785d
INCBIN "gfx/intro/unown_back.2bpp.lz"
; e799d

GFX_e799d: ; e799d
INCBIN "gfx/unknown/0e799d.2bpp"
GFX_e79dd: ; e79dd
INCBIN "gfx/unknown/0e79dd.2bpp"
GFX_e7a1d: ; e7a1d
INCBIN "gfx/unknown/0e7a1d.2bpp"

GFX_e7a5d: ; e7a5d
INCBIN "gfx/unknown/0e7a5d.2bpp"



SECTION "bank3E", ROMX, BANK[$3E]

FontExtra:
INCBIN "gfx/misc/font_extra.2bpp"

Font:
INCBIN "gfx/misc/font.1bpp"

FontBattleExtra:
INCBIN "gfx/misc/font_battle_extra.2bpp"

Frames: ; f8800
INCBIN "gfx/frames/1.1bpp"
INCBIN "gfx/frames/2.1bpp"
INCBIN "gfx/frames/3.1bpp"
INCBIN "gfx/frames/4.1bpp"
INCBIN "gfx/frames/5.1bpp"
INCBIN "gfx/frames/6.1bpp"
INCBIN "gfx/frames/7.1bpp"
INCBIN "gfx/frames/8.1bpp"
INCBIN "gfx/frames/9.1bpp"
; f89b0

; TODO: Various misc graphics here.

GFX_f89b0: ; f89b0
INCBIN "gfx/unknown/0f89b0.2bpp"
; f8a90

ShinyIcon: ; f8a90
INCBIN "gfx/stats/shiny.2bpp"

GFX_f8aa0: ; f8aa0
INCBIN "gfx/unknown/0f8aa0.2bpp"
; f8ac0

EnemyHPBarBorderGFX: ; f8ac0
INCBIN "gfx/battle/enemy_hp_bar_border.1bpp"
; f8ae0

HPExpBarBorderGFX: ; f8ae0
INCBIN "gfx/battle/hp_exp_bar_border.1bpp"
; f8b10

ExpBarGFX: ; f8b10
INCBIN "gfx/battle/expbar.2bpp"
; f8ba0

TownMapGFX: ; f8ba0
INCBIN "gfx/misc/town_map.2bpp.lz"
; f8ea4

GFX_f8ea4: ; unused
INCBIN "gfx/unknown/0f8ea4.2bpp"
; f8f24

OverworldPhoneIconGFX: ; f8f24
INCBIN "gfx/mobile/overworld_phone_icon.2bpp"
; f8f34

GFX_f8f34: ; unused
INCBIN "gfx/unknown/0f8f34.2bpp"
; f9204

TextBoxSpaceGFX: ; f9204
INCBIN "gfx/frames/space.2bpp"
; f9214

MobilePhoneTilesGFX: ; f9214
INCBIN "gfx/mobile/phone_tiles.2bpp"
; f9344

MapEntryFrameGFX: ; f9344
INCBIN "gfx/frames/map_entry_sign.2bpp"
; f9424

GFX_f9424: ; f9424
INCBIN "gfx/unknown/0f9424.2bpp"
; f9434

Footprints: ; f9434
INCBIN "gfx/misc/footprints.1bpp"
; fb434

; This and the following two functions are unreferenced.
Unknown_fb434:
	db 0

Functionfb435: ; 4b435
	ld a, [Unknown_fb434]
	and a
	jp nz, Get1bpp_2
	jp Get1bpp
; fb43f

Functionfb43f: ; fb43f
	ld a, [Unknown_fb434]
	and a
	jp nz, Get2bpp_2
	jp Get2bpp
; End unreferenced block
; fb449

_LoadStandardFont:: ; fb449
	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $80
	ld a, [rLCDC]
	bit 7, a
	jp z, Copy1bpp

	ld de, Font
	ld hl, VTiles1
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $20 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $20
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $40 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $40
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ld de, Font + $60 * LEN_1BPP_TILE
	ld hl, VTiles1 tile $60
	lb bc, BANK(Font), $20
	call Get1bpp_2
	ret
; fb48a

_LoadFontsExtra1:: ; fb48a
	ld de, MobilePhoneTilesGFX
	ld hl, VTiles2 tile $60
	lb bc, BANK(MobilePhoneTilesGFX), 1
	call Get1bpp_2
	ld de, OverworldPhoneIconGFX
	ld hl, VTiles2 tile $62
	lb bc, BANK(OverworldPhoneIconGFX), 1
	call Get2bpp_2
	ld de, FontExtra + 3 * LEN_2BPP_TILE
	ld hl, VTiles2 tile $63
	lb bc, BANK(FontExtra), $16
	call Get2bpp_2
	jr LoadFrame
; fb4b0

_LoadFontsExtra2:: ; fb4b0
	ld de, GFX_f9424
	ld hl, VTiles2 tile $61
	ld b, BANK(GFX_f9424)
	ld c, 1
	call Get2bpp_2
	ret
; fb4be

_LoadFontsBattleExtra:: ; fb4be
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $19
	call Get2bpp_2
	jr LoadFrame
; fb4cc

LoadFrame: ; fb4cc
	ld a, [TextBoxFrame]
	and 7
	ld bc, TILES_PER_FRAME * LEN_1BPP_TILE
	ld hl, Frames
	call AddNTimes
	ld d, h
	ld e, l
	ld hl, VTiles2 tile $79
	lb bc, BANK(Frames), TILES_PER_FRAME
	call Get1bpp_2
	ld hl, VTiles2 tile $7f
	ld de, TextBoxSpaceGFX
	lb bc, BANK(TextBoxSpaceGFX), 1
	call Get1bpp_2
	ret
; fb4f2

LoadBattleFontsHPBar: ; fb4f2
	ld de, FontBattleExtra
	ld hl, VTiles2 tile $60
	lb bc, BANK(FontBattleExtra), $c
	call Get2bpp_2
	ld hl, VTiles2 tile $70
	ld de, FontBattleExtra + $10 * LEN_2BPP_TILE
	lb bc, BANK(FontBattleExtra), 3
	call Get2bpp_2
	call LoadFrame

LoadHPBar: ; fb50d
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $73
	lb bc, BANK(HPExpBarBorderGFX), 6
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 9
	call Get2bpp_2
	ld de, MobilePhoneTilesGFX + 9 * LEN_2BPP_TILE
	ld hl, VTiles2 tile $5e
	lb bc, BANK(MobilePhoneTilesGFX), 2
	call Get2bpp_2
	ret
; fb53e

Functionfb53e: ; fb53e
	call _LoadFontsBattleExtra
	ld de, EnemyHPBarBorderGFX
	ld hl, VTiles2 tile $6c
	lb bc, BANK(EnemyHPBarBorderGFX), 4
	call Get1bpp_2
	ld de, HPExpBarBorderGFX
	ld hl, VTiles2 tile $78
	lb bc, BANK(HPExpBarBorderGFX), 1
	call Get1bpp_2
	ld de, HPExpBarBorderGFX + 3 * LEN_1BPP_TILE
	ld hl, VTiles2 tile $76
	lb bc, BANK(HPExpBarBorderGFX), 2
	call Get1bpp_2
	ld de, ExpBarGFX
	ld hl, VTiles2 tile $55
	lb bc, BANK(ExpBarGFX), 8
	call Get2bpp_2

Functionfb571: ; fb571
	ld de, GFX_f89b0
	ld hl, VTiles2 tile $31
	lb bc, BANK(GFX_f89b0), $11
	call Get2bpp_2
	ret
; fb57e

; These functions seem to be related to backwards compatibility

Functionfb57e: ; fb57e
	ld a, [wd003]
	ld hl, OTPartyMon1Species
	call GetPartyLocation
	push hl
	ld a, [wd003]
	inc a
	ld c, a
	ld b, 0
	ld hl, OTPartyCount
	add hl, bc
	ld a, [hl]
	pop hl
	cp EGG
	jr z, .asm_fb59c
	cp [hl]
	jr nz, .asm_fb5db

.asm_fb59c
	ld b, h
	ld c, l
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	cp 101
	jr nc, .asm_fb5db
	ld a, [wLinkMode]
	cp LINK_TIMECAPSULE
	jr nz, .asm_fb5d9
	ld hl, OTPartySpecies
	ld a, [wd003]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]

	; Magnemite and Magneton's types changed
	; from Electric to Electric/Steel.
	cp MAGNEMITE
	jr z, .asm_fb5d9
	cp MAGNETON
	jr z, .asm_fb5d9

	ld [CurSpecies], a
	call GetBaseData
	ld hl, wcbea
rept 2
	add hl, bc
endr
	ld a, [BaseType1]
	cp [hl]
	jr nz, .asm_fb5db
	inc hl
	ld a, [BaseType2]
	cp [hl]
	jr nz, .asm_fb5db

.asm_fb5d9
	and a
	ret

.asm_fb5db
	scf
	ret
; fb5dd

Functionfb5dd: ; fb5dd
	ld a, [wd002]
	ld d, a
	ld a, [PartyCount]
	ld b, a
	ld c, $0
.asm_fb5e7
	ld a, c
	cp d
	jr z, .asm_fb5f8
	push bc
	ld a, c
	ld hl, PartyMon1HP
	call GetPartyLocation
	pop bc
	ld a, [hli]
	or [hl]
	jr nz, .asm_fb60b

.asm_fb5f8
	inc c
	dec b
	jr nz, .asm_fb5e7
	ld a, [wd003]
	ld hl, OTPartyMon1HP
	call GetPartyLocation
	ld a, [hli]
	or [hl]
	jr nz, .asm_fb60b
	scf
	ret

.asm_fb60b
	and a
	ret
; fb60d

Functionfb60d: ; fb60d
	hlcoord 4, 0
	ld de, PlayerName
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 4, 8
	ld de, wd26b
	call PlaceString
	ld a, $14
	ld [bc], a
	hlcoord 7, 1
	ld de, PartySpecies
	call Functionfb634
	hlcoord 7, 9
	ld de, OTPartySpecies

Functionfb634: ; fb634
	ld c, $0
.asm_fb636
	ld a, [de]
	cp $ff
	ret z
	ld [wd265], a
	push bc
	push hl
	push de
	push hl
	ld a, c
	ld [hProduct], a
	call GetPokemonName
	pop hl
	call PlaceString
	pop de
	inc de
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	inc c
	jr .asm_fb636
; fb656

KantoMonSpecials: ; fb656
; The original special base stat for
; each Kanto monster from Red/Blue.
	db  65 ; BULBASAUR
	db  80 ; IVYSAUR
	db 100 ; VENUSAUR
	db  50 ; CHARMANDER
	db  65 ; CHARMELEON
	db  85 ; CHARIZARD
	db  50 ; SQUIRTLE
	db  65 ; WARTORTLE
	db  85 ; BLASTOISE
	db  20 ; CATERPIE
	db  25 ; METAPOD
	db  80 ; BUTTERFREE
	db  20 ; WEEDLE
	db  25 ; KAKUNA
	db  45 ; BEEDRILL
	db  35 ; PIDGEY
	db  50 ; PIDGEOTTO
	db  70 ; PIDGEOT
	db  25 ; RATTATA
	db  50 ; RATICATE
	db  31 ; SPEAROW
	db  61 ; FEAROW
	db  40 ; EKANS
	db  65 ; ARBOK
	db  50 ; PIKACHU
	db  90 ; RAICHU
	db  30 ; SANDSHREW
	db  55 ; SANDSLASH
	db  40 ; NIDORAN_F
	db  55 ; NIDORINA
	db  75 ; NIDOQUEEN
	db  40 ; NIDORAN_M
	db  55 ; NIDORINO
	db  75 ; NIDOKING
	db  60 ; CLEFAIRY
	db  85 ; CLEFABLE
	db  65 ; VULPIX
	db 100 ; NINETALES
	db  25 ; JIGGLYPUFF
	db  50 ; WIGGLYTUFF
	db  40 ; ZUBAT
	db  75 ; GOLBAT
	db  75 ; ODDISH
	db  85 ; GLOOM
	db 100 ; VILEPLUME
	db  55 ; PARAS
	db  80 ; PARASECT
	db  40 ; VENONAT
	db  90 ; VENOMOTH
	db  45 ; DIGLETT
	db  70 ; DUGTRIO
	db  40 ; MEOWTH
	db  65 ; PERSIAN
	db  50 ; PSYDUCK
	db  80 ; GOLDUCK
	db  35 ; MANKEY
	db  60 ; PRIMEAPE
	db  50 ; GROWLITHE
	db  80 ; ARCANINE
	db  40 ; POLIWAG
	db  50 ; POLIWHIRL
	db  70 ; POLIWRATH
	db 105 ; ABRA
	db 120 ; KADABRA
	db 135 ; ALAKAZAM
	db  35 ; MACHOP
	db  50 ; MACHOKE
	db  65 ; MACHAMP
	db  70 ; BELLSPROUT
	db  85 ; WEEPINBELL
	db 100 ; VICTREEBEL
	db 100 ; TENTACOOL
	db 120 ; TENTACRUEL
	db  30 ; GEODUDE
	db  45 ; GRAVELER
	db  55 ; GOLEM
	db  65 ; PONYTA
	db  80 ; RAPIDASH
	db  40 ; SLOWPOKE
	db  80 ; SLOWBRO
	db  95 ; MAGNEMITE
	db 120 ; MAGNETON
	db  58 ; FARFETCH_D
	db  35 ; DODUO
	db  60 ; DODRIO
	db  70 ; SEEL
	db  95 ; DEWGONG
	db  40 ; GRIMER
	db  65 ; MUK
	db  45 ; SHELLDER
	db  85 ; CLOYSTER
	db 100 ; GASTLY
	db 115 ; HAUNTER
	db 130 ; GENGAR
	db  30 ; ONIX
	db  90 ; DROWZEE
	db 115 ; HYPNO
	db  25 ; KRABBY
	db  50 ; KINGLER
	db  55 ; VOLTORB
	db  80 ; ELECTRODE
	db  60 ; EXEGGCUTE
	db 125 ; EXEGGUTOR
	db  40 ; CUBONE
	db  50 ; MAROWAK
	db  35 ; HITMONLEE
	db  35 ; HITMONCHAN
	db  60 ; LICKITUNG
	db  60 ; KOFFING
	db  85 ; WEEZING
	db  30 ; RHYHORN
	db  45 ; RHYDON
	db 105 ; CHANSEY
	db 100 ; TANGELA
	db  40 ; KANGASKHAN
	db  70 ; HORSEA
	db  95 ; SEADRA
	db  50 ; GOLDEEN
	db  80 ; SEAKING
	db  70 ; STARYU
	db 100 ; STARMIE
	db 100 ; MR__MIME
	db  55 ; SCYTHER
	db  95 ; JYNX
	db  85 ; ELECTABUZZ
	db  85 ; MAGMAR
	db  55 ; PINSIR
	db  70 ; TAUROS
	db  20 ; MAGIKARP
	db 100 ; GYARADOS
	db  95 ; LAPRAS
	db  48 ; DITTO
	db  65 ; EEVEE
	db 110 ; VAPOREON
	db 110 ; JOLTEON
	db 110 ; FLAREON
	db  75 ; PORYGON
	db  90 ; OMANYTE
	db 115 ; OMASTAR
	db  45 ; KABUTO
	db  70 ; KABUTOPS
	db  60 ; AERODACTYL
	db  65 ; SNORLAX
	db 125 ; ARTICUNO
	db 125 ; ZAPDOS
	db 125 ; MOLTRES
	db  50 ; DRATINI
	db  70 ; DRAGONAIR
	db 100 ; DRAGONITE
	db 154 ; MEWTWO
	db 100 ; MEW
; fb6ed


INCLUDE "event/name_rater.asm"


PlaySlowCry: ; fb841
	ld a, [ScriptVar]
	call LoadCryHeader
	jr c, .done

	ld hl, CryPitch
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, -$140
	add hl, bc
	ld a, l
	ld [CryPitch], a
	ld a, h
	ld [CryPitch + 1], a
	ld hl, CryLength
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld bc, $60
	add hl, bc
	ld a, l
	ld [CryLength], a
	ld a, h
	ld [CryLength + 1], a
	callba _PlayCryHeader
	call WaitSFX

.done
	ret
; fb877

Functionfb877: ; fb877
	ld a, [hMapAnims]
	push af
	xor a
	ld [hMapAnims], a
	call LowVolume
	call ClearBGPalettes
	call ClearTileMap
	call UpdateSprites
	call ClearSprites
	ld a, [wPokedexStatus]
	push af
	ld a, [hSCX]
	add $5
	ld [hSCX], a
	xor a
	ld [wPokedexStatus], a
	callba Function41a7f
	call WaitPressAorB_BlinkCursor
	ld a, $1
	ld [wPokedexStatus], a
	callba Function4424d
	call WaitPressAorB_BlinkCursor
	pop af
	ld [wPokedexStatus], a
	call MaxVolume
	call FadeToWhite
	ld a, [hSCX]
	add $fb
	ld [hSCX], a
	call Functionfb8c8
	pop af
	ld [hMapAnims], a
	ret
; fb8c8

Functionfb8c8: ; fb8c8
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	callba Function40ab2
	call Function3200
	callba GetEnemyMonDVs
	ld a, [hli]
	ld [TempMonDVs], a
	ld a, [hl]
	ld [TempMonDVs + 1], a
	ld b, SCGB_1C
	call GetSGBLayout
	call SetPalettes
	ret
; fb8f1

ConvertMon_2to1: ; fb8f1
; Takes the Gen-2 Pokemon number stored in wd265, finds it in the Pokered_MonIndices table, and returns its index in wd265.
	push bc
	push hl
	ld a, [wd265]
	ld b, a
	ld c, 0
	ld hl, Pokered_MonIndices
.loop
	inc c
	ld a, [hli]
	cp b
	jr nz, .loop
	ld a, c
	ld [wd265], a
	pop hl
	pop bc
	ret
; fb908

ConvertMon_1to2: ; fb908
; Takes the Gen-1 Pokemon number stored in wd265 and returns the corresponding value from Pokered_MonIndices in wd265.
	push bc
	push hl
	ld a, [wd265]
	dec a
	ld hl, Pokered_MonIndices
	ld b, 0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wd265], a
	pop hl
	pop bc
	ret
; fb91c

Pokered_MonIndices: ; fb91c
	db RHYDON
	db KANGASKHAN
	db NIDORAN_M
	db CLEFAIRY
	db SPEAROW
	db VOLTORB
	db NIDOKING
	db SLOWBRO
	db IVYSAUR
	db EXEGGUTOR
	db LICKITUNG
	db EXEGGCUTE
	db GRIMER
	db GENGAR
	db NIDORAN_F
	db NIDOQUEEN
	db CUBONE
	db RHYHORN
	db LAPRAS
	db ARCANINE
	db MEW
	db GYARADOS
	db SHELLDER
	db TENTACOOL
	db GASTLY
	db SCYTHER
	db STARYU
	db BLASTOISE
	db PINSIR
	db TANGELA
	db SCIZOR
	db SHUCKLE
	db GROWLITHE
	db ONIX
	db FEAROW
	db PIDGEY
	db SLOWPOKE
	db KADABRA
	db GRAVELER
	db CHANSEY
	db MACHOKE
	db MR__MIME
	db HITMONLEE
	db HITMONCHAN
	db ARBOK
	db PARASECT
	db PSYDUCK
	db DROWZEE
	db GOLEM
	db HERACROSS
	db MAGMAR
	db HO_OH
	db ELECTABUZZ
	db MAGNETON
	db KOFFING
	db SNEASEL
	db MANKEY
	db SEEL
	db DIGLETT
	db TAUROS
	db TEDDIURSA
	db URSARING
	db SLUGMA
	db FARFETCH_D
	db VENONAT
	db DRAGONITE
	db MAGCARGO
	db SWINUB
	db PILOSWINE
	db DODUO
	db POLIWAG
	db JYNX
	db MOLTRES
	db ARTICUNO
	db ZAPDOS
	db DITTO
	db MEOWTH
	db KRABBY
	db CORSOLA
	db REMORAID
	db OCTILLERY
	db VULPIX
	db NINETALES
	db PIKACHU
	db RAICHU
	db DELIBIRD
	db MANTINE
	db DRATINI
	db DRAGONAIR
	db KABUTO
	db KABUTOPS
	db HORSEA
	db SEADRA
	db SKARMORY
	db HOUNDOUR
	db SANDSHREW
	db SANDSLASH
	db OMANYTE
	db OMASTAR
	db JIGGLYPUFF
	db WIGGLYTUFF
	db EEVEE
	db FLAREON
	db JOLTEON
	db VAPOREON
	db MACHOP
	db ZUBAT
	db EKANS
	db PARAS
	db POLIWHIRL
	db POLIWRATH
	db WEEDLE
	db KAKUNA
	db BEEDRILL
	db HOUNDOOM
	db DODRIO
	db PRIMEAPE
	db DUGTRIO
	db VENOMOTH
	db DEWGONG
	db KINGDRA
	db PHANPY
	db CATERPIE
	db METAPOD
	db BUTTERFREE
	db MACHAMP
	db DONPHAN
	db GOLDUCK
	db HYPNO
	db GOLBAT
	db MEWTWO
	db SNORLAX
	db MAGIKARP
	db PORYGON2
	db STANTLER
	db MUK
	db SMEARGLE
	db KINGLER
	db CLOYSTER
	db TYROGUE
	db ELECTRODE
	db CLEFABLE
	db WEEZING
	db PERSIAN
	db MAROWAK
	db HITMONTOP
	db HAUNTER
	db ABRA
	db ALAKAZAM
	db PIDGEOTTO
	db PIDGEOT
	db STARMIE
	db BULBASAUR
	db VENUSAUR
	db TENTACRUEL
	db SMOOCHUM
	db GOLDEEN
	db SEAKING
	db ELEKID
	db MAGBY
	db MILTANK
	db BLISSEY
	db PONYTA
	db RAPIDASH
	db RATTATA
	db RATICATE
	db NIDORINO
	db NIDORINA
	db GEODUDE
	db PORYGON
	db AERODACTYL
	db RAIKOU
	db MAGNEMITE
	db ENTEI
	db SUICUNE
	db CHARMANDER
	db SQUIRTLE
	db CHARMELEON
	db WARTORTLE
	db CHARIZARD
	db LARVITAR
	db PUPITAR
	db TYRANITAR
	db LUGIA
	db ODDISH
	db GLOOM
	db VILEPLUME
	db BELLSPROUT
	db WEEPINBELL
	db VICTREEBEL
	db CHIKORITA
	db BAYLEEF
	db MEGANIUM
	db CYNDAQUIL
	db QUILAVA
	db TYPHLOSION
	db TOTODILE
	db CROCONAW
	db FERALIGATR
	db SENTRET
	db FURRET
	db HOOTHOOT
	db NOCTOWL
	db LEDYBA
	db LEDIAN
	db SPINARAK
	db ARIADOS
	db CROBAT
	db CHINCHOU
	db LANTURN
	db PICHU
	db CLEFFA
	db IGGLYBUFF
	db TOGEPI
	db TOGETIC
	db NATU
	db XATU
	db MAREEP
	db FLAAFFY
	db AMPHAROS
	db BELLOSSOM
	db MARILL
	db AZUMARILL
	db SUDOWOODO
	db POLITOED
	db HOPPIP
	db SKIPLOOM
	db JUMPLUFF
	db AIPOM
	db SUNKERN
	db SUNFLORA
	db YANMA
	db WOOPER
	db QUAGSIRE
	db ESPEON
	db UMBREON
	db MURKROW
	db SLOWKING
	db MISDREAVUS
	db UNOWN
	db WOBBUFFET
	db GIRAFARIG
	db PINECO
	db FORRETRESS
	db DUNSPARCE
	db GLIGAR
	db STEELIX
	db SNUBBULL
	db GRANBULL
	db QWILFISH
	db WOBBUFFET
	db WOBBUFFET
; fba18


Functionfba18: ; fba18
	ld a, [UnownLetter]
	ld c, a
	ld b, 26
	ld hl, UnownDex
.asm_fba21
	ld a, [hli]
	and a
	jr z, .asm_fba2b
	cp c
	ret z
	dec b
	jr nz, .asm_fba21
	ret

.asm_fba2b
	dec hl
	ld [hl], c
	ret
; fba2e


Functionfba2e: ; fba2e (3e:7a2e)
	hlcoord 4, 15
	ld bc, $c
	ld a, $7f
	call ByteFill
	ld a, [wc7dd]
	ld e, a
	ld d, 0
	ld hl, UnownDex
	add hl, de
	ld a, [hl]
	ld e, a
	ld d, 0
	ld hl, UnownWords
rept 2
	add hl, de
endr
	ld a, [hli]
	ld e, a
	ld d, [hl]
	hlcoord 4, 15
.asm_fba52
	ld a, [de]
	cp $ff
	ret z
	inc de
	ld [hli], a
	jr .asm_fba52
; fba5a (3e:7a5a)

UnownWords: ; fba5a
	dw UnownWord1
	dw UnownWord1
	dw UnownWord2
	dw UnownWord3
	dw UnownWord4
	dw UnownWord5
	dw UnownWord6
	dw UnownWord7
	dw UnownWord8
	dw UnownWord9
	dw UnownWord10
	dw UnownWord11
	dw UnownWord12
	dw UnownWord13
	dw UnownWord14
	dw UnownWord15
	dw UnownWord16
	dw UnownWord17
	dw UnownWord18
	dw UnownWord19
	dw UnownWord20
	dw UnownWord21
	dw UnownWord22
	dw UnownWord23
	dw UnownWord24
	dw UnownWord25
	dw UnownWord26
; fba90

unownword: macro
x = 1
	rept STRLEN(\1)
	db STRSUB(\1, x, 1) - $40
x = x + 1
	endr
	db -1
endm


UnownWord1:	 unownword "ANGRY"
UnownWord2:	 unownword "BEAR"
UnownWord3:	 unownword "CHASE"
UnownWord4:	 unownword "DIRECT"
UnownWord5:	 unownword "ENGAGE"
UnownWord6:	 unownword "FIND"
UnownWord7:	 unownword "GIVE"
UnownWord8:	 unownword "HELP"
UnownWord9:	 unownword "INCREASE"
UnownWord10: unownword "JOIN"
UnownWord11: unownword "KEEP"
UnownWord12: unownword "LAUGH"
UnownWord13: unownword "MAKE"
UnownWord14: unownword "NUZZLE"
UnownWord15: unownword "OBSERVE"
UnownWord16: unownword "PERFORM"
UnownWord17: unownword "QUICKEN"
UnownWord18: unownword "REASSURE"
UnownWord19: unownword "SEARCH"
UnownWord20: unownword "TELL"
UnownWord21: unownword "UNDO"
UnownWord22: unownword "VANISH"
UnownWord23: unownword "WANT"
UnownWord24: unownword "XXXXX"
UnownWord25: unownword "YIELD"
UnownWord26: unownword "ZOOM"
; fbb32

INCLUDE "event/magikarp.asm"

INCLUDE "battle/hidden_power.asm"

INCLUDE "battle/misc.asm"

SECTION "bank3F", ROMX, BANK[$3F]

INCLUDE "tilesets/animations.asm"


; Trade struct
TRADE_DIALOG  EQU 0
TRADE_GIVEMON EQU 1
TRADE_GETMON  EQU 2
TRADE_NICK    EQU 3
TRADE_DVS     EQU 14
TRADE_ITEM    EQU 16
TRADE_OT_ID   EQU 17
TRADE_OT_NAME EQU 19
TRADE_GENDER  EQU 30
TRADE_PADDING EQU 31

; Trade dialogs
TRADE_INTRO    EQU 0
TRADE_CANCEL   EQU 1
TRADE_WRONG    EQU 2
TRADE_COMPLETE EQU 3
TRADE_AFTER    EQU 4

NPCTrade:: ; fcba8
	ld a, e
	ld [wJumptableIndex], a
	call Functionfcc59
	ld b, CHECK_FLAG
	call TradeFlagAction
	ld a, TRADE_AFTER
	jr nz, .done

	ld a, TRADE_INTRO
	call PrintTradeText

	call YesNoBox
	ld a, TRADE_CANCEL
	jr c, .done

; Select givemon from party
	ld b, 6
	callba Function5001d
	ld a, TRADE_CANCEL
	jr c, .done

	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [CurPartySpecies]
	cp [hl]
	ld a, TRADE_WRONG
	jr nz, .done

	call CheckTradeGender
	ld a, TRADE_WRONG
	jr c, .done

	ld b, SET_FLAG
	call TradeFlagAction

	ld hl, ConnectLinkCableText
	call PrintText

	call Functionfcc63
	call Functionfcc07
	call GetTradeMonNames

	ld hl, TradedForText
	call PrintText

	call RestartMapMusic

	ld a, TRADE_COMPLETE

.done
	call PrintTradeText
	ret
; fcc07

Functionfcc07: ; fcc07
	call DisableSpriteUpdates
	ld a, [wJumptableIndex]
	push af
	ld a, [wcf64]
	push af
	predef Function28f24
	pop af
	ld [wcf64], a
	pop af
	ld [wJumptableIndex], a
	call Function2b74
	ret
; fcc23

CheckTradeGender: ; fcc23
	xor a
	ld [MonType], a

	ld e, TRADE_GENDER
	call GetTradeAttribute
	ld a, [hl]
	and a
	jr z, .asm_fcc46
	cp 1
	jr z, .asm_fcc3e

	callba GetGender
	jr nz, .asm_fcc48
	jr .asm_fcc46

.asm_fcc3e
	callba GetGender
	jr z, .asm_fcc48

.asm_fcc46
	and a
	ret

.asm_fcc48
	scf
	ret
; fcc4a

TradeFlagAction: ; fcc4a
	ld hl, wd960
	ld a, [wJumptableIndex]
	ld c, a
	predef FlagPredef
	ld a, c
	and a
	ret
; fcc59

Functionfcc59: ; fcc59
	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	ld [wcf64], a
	ret
; fcc63

Functionfcc63: ; fcc63
	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wc6d0], a

	ld e, TRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	ld [wc702], a

	ld a, [wc6d0]
	ld de, wc6d1
	call Functionfcde8
	call Functionfcdf4

	ld a, [wc702]
	ld de, wc703
	call Functionfcde8
	call Functionfcdf4

	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call Functionfcdd7
	ld de, wc6f2
	call Functionfcdf4

	ld hl, PlayerName
	ld de, wc6e7
	call Functionfcdf4

	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdd7
	ld de, wc6ff
	call Functionfce0f

	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdd7
	ld de, wc6fd
	call Functionfce0f

	ld hl, PartyMon1Species
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdd7
	ld b, h
	ld c, l
	callba GetCaughtGender
	ld a, c
	ld [wc701], a

	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	cp TRADE_COMPLETE
	ld a, 1
	jr c, .asm_fcce6
	ld a, 2
.asm_fcce6
	ld [wEnemyCharging], a

	ld hl, PartyMon1Level
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdd7
	ld a, [hl]
	ld [CurPartyLevel], a
	ld a, [wc702]
	ld [CurPartySpecies], a
	xor a
	ld [MonType], a
	ld [wPokemonWithdrawDepositParameter], a
	callab Functione039
	predef TryAddMonToParty

	ld e, TRADE_DIALOG
	call GetTradeAttribute
	ld a, [hl]
	cp TRADE_COMPLETE
	ld b, 0
	jr c, .asm_fcd1c
	ld b, 1
.asm_fcd1c
	callba SetPartymonCaughtData

	ld e, TRADE_NICK
	call GetTradeAttribute
	ld de, wc70e
	call Functionfcdf4

	ld hl, PartyMonNicknames
	ld bc, PKMN_NAME_LENGTH
	call Functionfcdde
	ld hl, wc70e
	call Functionfcdf4

	ld e, TRADE_OT_NAME
	call GetTradeAttribute
	push hl
	ld de, wc724
	call Functionfcdf4
	pop hl
	ld de, wc719
	call Functionfcdf4

	ld hl, PartyMonOT
	ld bc, NAME_LENGTH
	call Functionfcdde
	ld hl, wc724
	call Functionfcdf4

	ld e, TRADE_DVS
	call GetTradeAttribute
	ld de, wEnemyTrappingMove
	call Functionfce0f

	ld hl, PartyMon1DVs
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdde
	ld hl, wEnemyTrappingMove
	call Functionfce0f

	ld e, TRADE_OT_ID
	call GetTradeAttribute
	ld de, wPlayerCharging
	call Functionfce15

	ld hl, PartyMon1ID
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdde
	ld hl, wEnemyWrapCount
	call Functionfce0f

	ld e, TRADE_ITEM
	call GetTradeAttribute
	push hl
	ld hl, PartyMon1Item
	ld bc, PARTYMON_STRUCT_LENGTH
	call Functionfcdde
	pop hl
	ld a, [hl]
	ld [de], a

	push af
	push bc
	push de
	push hl
	ld a, [CurPartyMon]
	push af
	ld a, [PartyCount]
	dec a
	ld [CurPartyMon], a
	callba Functione134
	pop af
	ld [CurPartyMon], a
	pop hl
	pop de
	pop bc
	pop af
	ret
; fcdc2


GetTradeAttribute: ; 0xfcdc2
	ld d, 0
	push de
	ld a, [wJumptableIndex]
	and $f
	swap a
	ld e, a
	ld d, 0
	ld hl, NPCTrades
rept 2
	add hl, de
endr
	pop de
	add hl, de
	ret
; 0xfcdd7

Functionfcdd7: ; fcdd7
	ld a, [CurPartyMon]
	call AddNTimes
	ret
; fcdde

Functionfcdde: ; fcdde
	ld a, [PartyCount]
	dec a
	call AddNTimes
	ld e, l
	ld d, h
	ret
; fcde8

Functionfcde8: ; fcde8
	push de
	ld [wd265], a
	call GetBasePokemonName
	ld hl, StringBuffer1
	pop de
	ret
; fcdf4

Functionfcdf4: ; fcdf4
	ld bc, NAME_LENGTH
	call CopyBytes
	ret
; fcdfb

Functionfcdfb: ; fcdfb
	ld bc, 4
	call CopyBytes
	ld a, $50
	ld [de], a
	ret
; fce05

Functionfce05: ; fce05
	ld bc, 3
	call CopyBytes
	ld a, $50
	ld [de], a
	ret
; fce0f

Functionfce0f: ; fce0f
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret
; fce15

Functionfce15: ; fce15
	ld a, [hli]
	ld [de], a
	dec de
	ld a, [hl]
	ld [de], a
	ret
; fce1b

GetTradeMonNames: ; fce1b
	ld e, TRADE_GETMON
	call GetTradeAttribute
	ld a, [hl]
	call Functionfcde8

	ld de, StringBuffer2
	call Functionfcdf4

	ld e, TRADE_GIVEMON
	call GetTradeAttribute
	ld a, [hl]
	call Functionfcde8

	ld de, wd050
	call Functionfcdf4

	ld hl, StringBuffer1
.loop
	ld a, [hli]
	cp "@"
	jr nz, .loop

	dec hl
	push hl
	ld e, TRADE_GENDER
	call GetTradeAttribute
	ld a, [hl]
	pop hl
	and a
	ret z

	cp 1
	ld a, "♂"
	jr z, .done
	ld a, "♀"
.done
	ld [hli], a
	ld [hl], "@"
	ret
; fce58


NPCTrades: ; fce58
	db 0, ABRA,       MACHOP,     "MUSCLE@@@@@", $37, $66, GOLD_BERRY,   $54, $92, "MIKE@@@@@@@", 0, 0
	db 0, BELLSPROUT, ONIX,       "ROCKY@@@@@@", $96, $66, BITTER_BERRY, $1e, $bf, "KYLE@@@@@@@", 0, 0
	db 1, KRABBY,     VOLTORB,    "VOLTY@@@@@@", $98, $88, PRZCUREBERRY, $05, $72, "TIM@@@@@@@@", 0, 0
	db 3, DRAGONAIR,  DODRIO,     "DORIS@@@@@@", $77, $66, SMOKE_BALL,   $1b, $01, "EMY@@@@@@@@", 2, 0
	db 2, HAUNTER,    XATU,       "PAUL@@@@@@@", $96, $86, MYSTERYBERRY, $00, $3d, "CHRIS@@@@@@", 0, 0
	db 3, CHANSEY,    AERODACTYL, "AEROY@@@@@@", $96, $66, GOLD_BERRY,   $7b, $67, "KIM@@@@@@@@", 0, 0
	db 0, DUGTRIO,    MAGNETON,   "MAGGIE@@@@@", $96, $66, METAL_COAT,   $a2, $c3, "FOREST@@@@@", 0, 0
; fcf38


PrintTradeText: ; fcf38
	push af
	call GetTradeMonNames
	pop af
	ld bc, 2 * 4
	ld hl, TradeTexts
	call AddNTimes
	ld a, [wcf64]
	ld c, a
rept 2
	add hl, bc
endr
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	ret
; fcf53

TradeTexts: ; fcf53
; intro
	dw TradeIntroText1
	dw TradeIntroText2
	dw TradeIntroText3
	dw TradeIntroText4

; cancel
	dw TradeCancelText1
	dw TradeCancelText2
	dw TradeCancelText3
	dw TradeCancelText4

; wrong mon
	dw TradeWrongText1
	dw TradeWrongText2
	dw TradeWrongText3
	dw TradeWrongText4

; completed
	dw TradeCompleteText1
	dw TradeCompleteText2
	dw TradeCompleteText3
	dw TradeCompleteText4

; after
	dw TradeAfterText1
	dw TradeAfterText2
	dw TradeAfterText3
	dw TradeAfterText4
; fcf7b


ConnectLinkCableText: ; 0xfcf7b
	; OK, connect the Game Link Cable.
	text_jump UnknownText_0x1bd407
	db "@"
; 0xfcf80


TradedForText: ; 0xfcf80
	; traded givemon for getmon
	text_jump UnknownText_0x1bd429
	start_asm

	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld hl, .done
	ret

.done
	; sound0x0A
	; interpret_data
	text_jump UnknownText_0x1bd445
	db "@"
; 0xfcf97


TradeIntroText1: ; 0xfcf97
	; I collect #MON. Do you have @ ? Want to trade it for my @ ?
	text_jump UnknownText_0x1bd449
	db "@"
; 0xfcf9c

TradeCancelText1: ; 0xfcf9c
	; You don't want to trade? Aww…
	text_jump UnknownText_0x1bd48c
	db "@"
; 0xfcfa1

TradeWrongText1: ; 0xfcfa1
	; Huh? That's not @ .  What a letdown…
	text_jump UnknownText_0x1bd4aa
	db "@"
; 0xfcfa6

TradeCompleteText1: ; 0xfcfa6
	; Yay! I got myself @ ! Thanks!
	text_jump UnknownText_0x1bd4d2
	db "@"
; 0xfcfab

TradeAfterText1: ; 0xfcfab
	; Hi, how's my old @  doing?
	text_jump UnknownText_0x1bd4f4
	db "@"
; 0xfcfb0


TradeIntroText2:
TradeIntroText3: ; 0xfcfb0
	; Hi, I'm looking for this #MON. If you have @ , would you trade it for my @ ?
	text_jump UnknownText_0x1bd512
	db "@"
; 0xfcfb5

TradeCancelText2:
TradeCancelText3: ; 0xfcfb5
	; You don't have one either? Gee, that's really disappointing…
	text_jump UnknownText_0x1bd565
	db "@"
; 0xfcfba

TradeWrongText2:
TradeWrongText3: ; 0xfcfba
	; You don't have @ ? That's too bad, then.
	text_jump UnknownText_0x1bd5a1
	db "@"
; 0xfcfbf

TradeCompleteText2: ; 0xfcfbf
	; Great! Thank you! I finally got @ .
	text_jump UnknownText_0x1bd5cc
	db "@"
; 0xfcfc4

TradeAfterText2: ; 0xfcfc4
	; Hi! The @ you traded me is doing great!
	text_jump UnknownText_0x1bd5f4
	db "@"
; 0xfcfc9


TradeIntroText4: ; 0xfcfc9
	; 's cute, but I don't have it. Do you have @ ? Want to trade it for my @ ?
	text_jump UnknownText_0x1bd621
	db "@"
; 0xfcfce

TradeCancelText4: ; 0xfcfce
	; You don't want to trade? Oh, darn…
	text_jump UnknownText_0x1bd673
	db "@"
; 0xfcfd3

TradeWrongText4: ; 0xfcfd3
	; That's not @ . Please trade with me if you get one.
	text_jump UnknownText_0x1bd696
	db "@"
; 0xfcfd8

TradeCompleteText4: ; 0xfcfd8
	; Wow! Thank you! I always wanted @ !
	text_jump UnknownText_0x1bd6cd
	db "@"
; 0xfcfdd

TradeAfterText4: ; 0xfcfdd
	; How is that @  I traded you doing? Your @ 's so cute!
	text_jump UnknownText_0x1bd6f5
	db "@"
; 0xfcfe2


TradeCompleteText3: ; 0xfcfe2
	; Uh? What happened?
	text_jump UnknownText_0x1bd731
	db "@"
; 0xfcfe7

TradeAfterText3: ; 0xfcfe7
	; Trading is so odd… I still have a lot to learn about it.
	text_jump UnknownText_0x1bd745
	db "@"
; 0xfcfec


MomTriesToBuySomething:: ; fcfec
	ld a, [wMapReentryScriptQueueFlag]
	and a
	ret nz
	call GetMapHeaderPhoneServiceNybble
	and a
	ret nz
	xor a
	ld [wdc18], a
	call CheckBalance_MomItem2
	ret nc
	call Functionfd0c3
	ret nc
	ld b, BANK(UnknownScript_0xfd00f)
	ld de, UnknownScript_0xfd00f
	callba LoadScriptBDE
	scf
	ret
; fd00f

UnknownScript_0xfd00f: ; 0xfd00f
	callasm Functionfd017
	farjump Script_ReceivePhoneCall
; 0xfd017

Functionfd017: ; fd017
	call MomBuysItem_DeductFunds
	call Functionfd0eb
	ld a, [wdc18]
	and a
	jr nz, .ok
	ld hl, wdc17
	inc [hl]
.ok
	ld a, 1
	ld [wCurrentCaller], a
	ld bc, wd03f
	ld hl, 0
	add hl, bc
	ld [hl], 0
	inc hl
	ld [hl], 1
	ld hl, 9
	add hl, bc
	ld a, $3f
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
	ret
; fd044

CheckBalance_MomItem2: ; fd044
	ld a, [wdc17]
	cp 10
	jr nc, .nope
	call GetItemFromMom
	ld a, [hli]
	ld [hMoneyTemp], a
	ld a, [hli]
	ld [hMoneyTemp + 1], a
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld de, wMomsMoney
	ld bc, hMoneyTemp
	callba CompareMoney
	jr nc, .have_enough_money

.nope
	jr .check_have_2300

.have_enough_money
	scf
	ret

.check_have_2300
	ld hl, hMoneyTemp
	ld [hl], (2300 / $10000) ; $00
	inc hl
	ld [hl], ((2300 % $10000) / $100) ; $08
	inc hl
	ld [hl], (2300 % $100) ; $fc
.loop
	ld de, wdc19
	ld bc, wMomsMoney
	callba CompareMoney
	jr z, .exact
	jr nc, .less_than
	call Functionfd099
	jr .loop

.less_than
	xor a
	ret

.exact
	call Functionfd099
	ld a, 5
	call RandomRange
	inc a
	ld [wdc18], a
	scf
	ret
; fd099

Functionfd099: ; fd099
	ld de, wdc19
	ld bc, hMoneyTemp
	callba AddMoney
	ret
; fd0a6


MomBuysItem_DeductFunds: ; fd0a6 (3f:50a6)
	call GetItemFromMom
	ld de, 3
	add hl, de
	ld a, [hli]
	ld [hMoneyTemp], a
	ld a, [hli]
	ld [hMoneyTemp + 1], a
	ld a, [hli]
	ld [hMoneyTemp + 2], a
	ld de, wMomsMoney
	ld bc, hMoneyTemp
	callba TakeMoney
	ret


Functionfd0c3: ; fd0c3
	call GetItemFromMom
	ld de, 6
	add hl, de
	ld a, [hli]
	cp 1
	jr z, .not_doll
	ld a, [hl]
	ld c, a
	ld b, 1
	callba DecorationFlagAction_c
	scf
	ret

.not_doll
	ld a, [hl]
	ld [CurItem], a
	ld a, $1
	ld [wItemQuantityChangeBuffer], a
	ld hl, PCItems
	call ReceiveItem
	ret
; fd0eb


Functionfd0eb: ; fd0eb (3f:50eb)
	call GetItemFromMom
	ld de, 6 ; field
	add hl, de
	ld a, [hli]
	ld de, Script_MomBoughtItem
	cp 1
	ret z
	ld de, Script_MomBoughtDoll
	ret
; fd0fd (3f:50fd)

Script_MomBoughtItem: ; 0xfd0fd
	writetext _MomText_HiHowAreYou
	writetext _MomText_FoundAnItem
	writetext _MomText_BoughtWithYourMoney
	writetext _MomText_ItsInPC
	end
; 0xfd10a

Script_MomBoughtDoll: ; 0xfd10a
	writetext _MomText_HiHowAreYou
	writetext _MomText_FoundADoll
	writetext _MomText_BoughtWithYourMoney
	writetext _MomText_ItsInRoom
	end
; 0xfd117


GetItemFromMom: ; fd117
	ld a, [wdc18]
	and a
	jr z, .zero
	dec a
	ld de, MomItems_1
	jr .incave

.zero
	ld a, [wdc17]
	cp 10 ; length of MomItems_2
	jr c, .ok
	xor a

.ok
	ld de, MomItems_2

.incave
	ld l, a
	ld h, 0
rept 3 ; multiply hl by 8
	add hl, hl
endr
	add hl, de
	ret
; fd136

momitem: macro
; money to trigger, cost, kind, item
	dt \1
	dt \2
	db \3, \4
ENDM


MomItems_1: ; fd136
	momitem      0,   600, MOM_ITEM, SUPER_POTION
	momitem      0,    90, MOM_ITEM, ANTIDOTE
	momitem      0,   180, MOM_ITEM, POKE_BALL
	momitem      0,   450, MOM_ITEM, ESCAPE_ROPE
	momitem      0,   500, MOM_ITEM, GREAT_BALL
; fd15e

MomItems_2: ; fd15e
	momitem    900,   600, MOM_ITEM, SUPER_POTION
	momitem   4000,   270, MOM_ITEM, REPEL
	momitem   7000,   600, MOM_ITEM, SUPER_POTION
	momitem  10000,  1800, MOM_DOLL, DECO_CHARMANDER_DOLL
	momitem  15000,  3000, MOM_ITEM, MOON_STONE
	momitem  19000,   600, MOM_ITEM, SUPER_POTION
	momitem  30000,  4800, MOM_DOLL, DECO_CLEFAIRY_DOLL
	momitem  40000,   900, MOM_ITEM, HYPER_POTION
	momitem  50000,  8000, MOM_DOLL, DECO_PIKACHU_DOLL
	momitem 100000, 22800, MOM_DOLL, DECO_BIG_SNORLAX_DOLL
; fd1ae

	db 0, 0, 0 ; XXX

_MomText_HiHowAreYou: ; 0xfd1b1
	; Hi,  ! How are you?
	text_jump UnknownText_0x1bc615
	db "@"
; 0xfd1b6

_MomText_FoundAnItem: ; 0xfd1b6
	; I found a useful item shopping, so
	text_jump UnknownText_0x1bc62a
	db "@"
; 0xfd1bb

_MomText_BoughtWithYourMoney: ; 0xfd1bb
	; I bought it with your money. Sorry!
	text_jump UnknownText_0x1bc64e
	db "@"
; 0xfd1c0

_MomText_ItsInPC: ; 0xfd1c0
	; It's in your PC. You'll like it!
	text_jump UnknownText_0x1bc673
	db "@"
; 0xfd1c5

_MomText_FoundADoll: ; 0xfd1c5
	; While shopping today, I saw this adorable doll, so
	text_jump UnknownText_0x1bc693
	db "@"
; 0xfd1ca

_MomText_ItsInRoom: ; 0xfd1ca
	; It's in your room. You'll love it!
	text_jump UnknownText_0x1bc6c7
	db "@"
; 0xfd1cf

	db 0 ; XXX

Functionfd1d0: ; fd1d0
	ret
; fd1d1

	ret ; XXX


INCLUDE "misc/mobile_40.asm"


SECTION "bank41", ROMX, BANK[$41]

Function104000:: ; 104000
	ld hl, Function104006
	jp Function104177
; 104006

Function104006: ; 104006
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	decoord 0, 0
	ld hl, w6_d000
	call Function10425f
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function10419d
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function10419d
	ret
; 10402d

Function10402d:: ; 10402d
	ld hl, Function104033
	jp Function104177
; 104033

Function104033: ; 104033
	decoord 0, 0
	ld hl, w6_d000
	call Function10425f
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function10419d
	ret
; 104047

Function104047: ; 104047
	ld hl, Function10404d
	jp Function104177
; 10404d

Function10404d: ; 10404d
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function10419d
	ret
; 104061

Function104061:: ; 104061
	ld hl, Function104067
	jp Function104177
; 104067

Function104067: ; 104067
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	decoord 0, 0
	ld hl, w6_d000
	call Function10425f
	call DelayFrame
	di
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function1041ad
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function1041ad
	pop af
	ld [rVBK], a
	ei
	ret

Function104099: ; 104099
	ld hl, Function104061
	ld hl, Function1040a2
	jp Function104177
; 1040a2

Function1040a2: ; 1040a2
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	decoord 0, 0
	ld hl, w6_d000
	call Function10425f
	call DelayFrame
	di
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function1041c1
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function1041c1
	pop af
	ld [rVBK], a
	ei
	ret
; 1040d4

Function1040d4: ; 1040d4
	ld hl, Function1040da
	jp Function104177
; 1040da

Function1040da: ; 1040da
	ld a, $1
	ld [rVBK], a
	ld a, $3
	ld [rSVBK], a
	ld de, w3_d800
	ld a, [hBGMapAddress + 1]
	ld [rHDMA1], a
	ld a, [hBGMapAddress]
	ld [rHDMA2], a
	ld a, d
	ld [rHDMA3], a
	ld a, e
	ld [rHDMA4], a
	ld a, $23
	ld [hDMATransfer], a
	call Function1041a4
	ret
; 1040fb

Function1040fb: ; 1040fb
	ld hl, Function104101
	jp Function104177
; 104101

Function104101: ; 104101
	ld a, $1
	ld [rVBK], a
	ld a, $3
	ld [rSVBK], a
	ld hl, w3_d800
	call Function10419d
	ret
; 104110

Function104110:: ; 104110
	ld hl, Function104116
	jp Function104177
; 104116

Function104116: ; 104116
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	decoord 0, 0
	ld hl, w6_d000
	call Function10425f
	call DelayFrame
	di
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function1041b7
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function1041b7
	pop af
	ld [rVBK], a
	ei
	ret
; 104148

Function104148: ; 104148 (41:4148)
	ld hl, Function10414e
	jp Function104177
; 10414e (41:414e)

Function10414e: ; 10414e
	decoord 0, 0, AttrMap
	ld hl, w6_d400
	call Function104263
	ld c, $ff
	decoord 0, 0
	ld hl, w6_d000
	call Function104265
	ld a, $1
	ld [rVBK], a
	ld hl, w6_d400
	call Function1041ad
	ld a, $0
	ld [rVBK], a
	ld hl, w6_d000
	call Function1041ad
	ret
; 104177

Function104177: ; 104177
	ld a, [hBGMapMode]
	push af
	ld a, [hMapAnims]
	push af
	xor a
	ld [hBGMapMode], a
	ld [hMapAnims], a
	ld a, [rSVBK]
	push af
	ld a, 6
	ld [rSVBK], a
	ld a, [rVBK]
	push af
	call Function10419c
	pop af
	ld [rVBK], a
	pop af
	ld [rSVBK], a
	pop af
	ld [hMapAnims], a
	pop af
	ld [hBGMapMode], a
	ret
; 10419c

Function10419c: ; 10419c
	jp [hl]
; 10419d


Function10419d: ; 10419d (41:419d)
	call Function10424e
	ld a, $23
	ld [hDMATransfer], a

Function1041a4: ; 104a14
.asm_1041a4
	call DelayFrame
	ld a, [hDMATransfer]
	and a
	jr nz, .asm_1041a4
	ret

Function1041ad: ; 1041ad (41:41ad)
	ld a, [hBGMapAddress + 1]
	ld d, a
	ld a, [hBGMapAddress]
	ld e, a
	ld c, $24
	jr Function104209

Function1041b7: ; 1041b7 (41:41b7)
	ld a, [hBGMapAddress + 1]
	ld d, a
	ld a, [hBGMapAddress]
	ld e, a
	ld c, $24
	jr asm_104205
; 1041c1 (41:41c1)

Function1041c1: ; 1041c1
	ld a, [hBGMapAddress + 1]
	ld d, a
	ld a, [hBGMapAddress]
	ld e, a
	ld c, $24
	ld a, h
	ld [rHDMA1], a
	ld a, l
	and $f0
	ld [rHDMA2], a
	ld a, d
	and $1f
	ld [rHDMA3], a
	ld a, e
	and $f0
	ld [rHDMA4], a
	ld a, c
	dec c
	or $80
	ld b, a
	ld a, $7f
	sub c
	ld d, a
.loop1
	ld a, [rLY]
	cp d
	jr nc, .loop1
.loop2
	ld a, [rSTAT]
	and $3
	jr z, .loop2
	ld a, b
	ld [rHDMA5], a
	ld a, [rLY]
	inc c
	ld hl, rLY
.loop3
	cp [hl]
	jr z, .loop3
	ld a, [hl]
	dec c
	jr nz, .loop3
	ld hl, rHDMA5
	res 7, [hl]
	ret
; 104205

asm_104205:
	ld b, $7b
	jr asm_10420b


Function104209:
; LY magic
	ld b, $7f
asm_10420b:
	ld a, h
	ld [rHDMA1], a
	ld a, l
	and $f0 ; high nybble
	ld [rHDMA2], a
	ld a, d
	and $1f ; lower 5 bits
	ld [rHDMA3], a
	ld a, e
	and $f0 ; high nybble
	ld [rHDMA4], a
	ld a, c
	dec c
	or $80 ; set 7, a
	ld e, a
	ld a, b
	sub c
	ld d, a
.ly_loop
	ld a, [rLY]
	cp d
	jr nc, .ly_loop

	di
.rstat_loop_1
	ld a, [rSTAT]
	and $3
	jr nz, .rstat_loop_1
.rstat_loop_2
	ld a, [rSTAT]
	and $3
	jr z, .rstat_loop_2
	ld a, e
	ld [rHDMA5], a
	ld a, [rLY]
	inc c
	ld hl, rLY
.final_ly_loop
	cp [hl]
	jr z, .final_ly_loop
	ld a, [hl]
	dec c
	jr nz, .final_ly_loop
	ld hl, rHDMA5
	res 7, [hl]
	ei

	ret
; 10424e


Function10424e: ; 10424e (41:424e)
	ld a, h
	ld [rHDMA1], a
	ld a, l
	ld [rHDMA2], a
	ld a, [hBGMapAddress + 1]
	and $1f
	ld [rHDMA3], a
	ld a, [hBGMapAddress]
	ld [rHDMA4], a
	ret

Function10425f: ; 10425f (41:425f)
	ld c, $7f
	jr Function104265

Function104263: ; 104263 (41:4263)
	ld c, $0

Function104265: ; 104265 (41:4265)
; back up the value of c to hMapObjectIndexBuffer
	ld a, [hMapObjectIndexBuffer]
	push af
	ld a, c
	ld [hMapObjectIndexBuffer], a

; for each row on the screen
	ld c, SCREEN_HEIGHT
.loop1
; for each tile in the row
	ld b, SCREEN_WIDTH
.loop2
; copy from de to hl
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .loop2

; load the original value of c into hl 12 times
	ld a, [hMapObjectIndexBuffer]
	ld b, 12
.loop3
	ld [hli], a
	dec b
	jr nz, .loop3

	dec c
	jr nz, .loop1

; restore the original value of hMapObjectIndexBuffer
	pop af
	ld [hMapObjectIndexBuffer], a
	ret


_Get2bpp:: ; 104284
	; 2bpp when [rLCDC] & $80
	; switch to WRAM bank 6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	push bc
	push hl

	; Copy c tiles of the 2bpp from b:de to w6_d000
	ld a, b ; bank
	ld l, c ; number of tiles
	ld h, $0
rept 4
	add hl, hl ; multiply by 16 (16 bytes of a 2bpp = 8 x 8 tile)
endr
	ld b, h
	ld c, l
	ld h, d ; address
	ld l, e
	ld de, w6_d000
	call FarCopyBytes
	
	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, w6_d000
	call Function104209

	; restore the previous bank
	pop af
	ld [rSVBK], a
	ret
; 1042b2

_Get1bpp:: ; 1042b2
	; 1bpp when [rLCDC] & $80
.loop
	ld a, c
	cp $10
	jp c, .bankswitch
	jp z, .bankswitch
	push bc
	push hl
	push de
	ld c, $10
	call .bankswitch
	pop de
	ld hl, $80
	add hl, de
	ld d, h
	ld e, l
	pop hl
	lb bc, 1, 0
	add hl, bc
	pop bc
	ld a, c
	sub $10
	ld c, a
	jr .loop
; 1042d6

.bankswitch: ; 1042d6
	ld a, [rSVBK]
	push af
	ld a, $6
	ld [rSVBK], a

	push bc
	push hl

	ld a, b
	ld l, c
	ld h, $0
rept 3
	add hl, hl ; multiply by 8
endr
	ld c, l
	ld b, h
	ld h, d
	ld l, e
	ld de, w6_d000
	call FarCopyBytesDouble_DoubleBankSwitch

	pop hl
	pop bc

	push bc
	call DelayFrame
	pop bc

	ld d, h
	ld e, l
	ld hl, w6_d000
	call Function104209

	pop af
	ld [rSVBK], a
	ret
; 104303

Function104303: ; 104303
	ld hl, Function104309
	jp Function104177
; 104309

Function104309:
	ld hl, w6_d000
	decoord 0, 0
	call Function10433a
	ld hl, w6_d000 + $80
	decoord 0, 0, AttrMap
	call Function10433a
	ld a, $1
	ld [rVBK], a
	ld c, $8
	ld hl, w6_d000 + $80
	ld de, VBGMap1 tile $00
	call Function104209
	ld a, $0
	ld [rVBK], a
	ld c, $8
	ld hl, w6_d000
	ld de, VBGMap1 tile $00
	call Function104209
	ret

Function10433a: ; 10433a (41:433a)
	ld b, 4
.outer_loop
	ld c, 20
.inner_loop
	ld a, [de]
	ld [hli], a
	inc de
	dec c
	jr nz, .inner_loop
	ld a, l
	add $20 - 20
	ld l, a
	ld a, h
	adc $0
	ld h, a
	dec b
	jr nz, .outer_loop
	ret
; 104350

ShockEmote:     INCBIN "gfx/emotes/shock.2bpp"
QuestionEmote:  INCBIN "gfx/emotes/question.2bpp"
HappyEmote:     INCBIN "gfx/emotes/happy.2bpp"
SadEmote:       INCBIN "gfx/emotes/sad.2bpp"
HeartEmote:     INCBIN "gfx/emotes/heart.2bpp"
BoltEmote:      INCBIN "gfx/emotes/bolt.2bpp"
SleepEmote:     INCBIN "gfx/emotes/sleep.2bpp"
FishEmote:      INCBIN "gfx/emotes/fish.2bpp"
JumpShadowGFX:  INCBIN "gfx/misc/shadow.2bpp"
FishingRodGFX2: INCBIN "gfx/misc/fishing2.2bpp"
BoulderDustGFX: INCBIN "gfx/misc/boulderdust.2bpp"
FishingRodGFX4: INCBIN "gfx/misc/fishing4.2bpp"


RunCallback_05_03: ; 1045b0
	call Clearwc7e8
	call ResetMapBufferEventFlags
	call ResetFlashIfOutOfCave
	call GetCurrentMapTrigger
	call ResetBikeFlags
	ld a, $5
	call RunMapCallback

RunCallback_03: ; 1045c4
	callba Function97df9
	ld a, $3
	call RunMapCallback
	call GetMapHeaderTimeOfDayNybble
	ld [wc2d0], a
	ret


EnterMapConnection: ; 1045d6
; Return carry if a connection has been entered.
	ld a, [wPlayerStepDirection]
	and a
	jp z, EnterSouthConnection
	cp 1
	jp z, EnterNorthConnection
	cp 2
	jp z, EnterWestConnection
	cp 3
	jp z, EnterEastConnection
	ret
; 1045ed


EnterWestConnection: ; 1045ed
	ld a, [WestConnectedMapGroup]
	ld [MapGroup], a
	ld a, [WestConnectedMapNumber]
	ld [MapNumber], a
	ld a, [WestConnectionStripXOffset]
	ld [XCoord], a
	ld a, [WestConnectionStripYOffset]
	ld hl, YCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, WestConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load
	ld a, [WestConnectedMapWidth]
	add 6
	ld e, a
	ld d, 0

.loop
	add hl, de
	dec c
	jr nz, .loop

.skip_to_load
	ld a, l
	ld [wd194], a
	ld a, h
	ld [wd194 + 1], a
	jp EnteredConnection
; 104629


EnterEastConnection: ; 104629
	ld a, [EastConnectedMapGroup]
	ld [MapGroup], a
	ld a, [EastConnectedMapNumber]
	ld [MapNumber], a
	ld a, [EastConnectionStripXOffset]
	ld [XCoord], a
	ld a, [EastConnectionStripYOffset]
	ld hl, YCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, EastConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	srl c
	jr z, .skip_to_load
	ld a, [EastConnectedMapWidth]
	add 6
	ld e, a
	ld d, 0

.loop
	add hl, de
	dec c
	jr nz, .loop

.skip_to_load
	ld a, l
	ld [wd194], a
	ld a, h
	ld [wd194 + 1], a
	jp EnteredConnection
; 104665


EnterNorthConnection: ; 104665
	ld a, [NorthConnectedMapGroup]
	ld [MapGroup], a
	ld a, [NorthConnectedMapNumber]
	ld [MapNumber], a
	ld a, [NorthConnectionStripYOffset]
	ld [YCoord], a
	ld a, [NorthConnectionStripXOffset]
	ld hl, XCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, NorthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wd194], a
	ld a, h
	ld [wd194 + 1], a
	jp EnteredConnection
; 104696


EnterSouthConnection: ; 104696
	ld a, [SouthConnectedMapGroup]
	ld [MapGroup], a
	ld a, [SouthConnectedMapNumber]
	ld [MapNumber], a
	ld a, [SouthConnectionStripYOffset]
	ld [YCoord], a
	ld a, [SouthConnectionStripXOffset]
	ld hl, XCoord
	add [hl]
	ld [hl], a
	ld c, a
	ld hl, SouthConnectionWindow
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, 0
	srl c
	add hl, bc
	ld a, l
	ld [wd194], a
	ld a, h
	ld [wd194 + 1], a
	; fallthrough
; 1046c4

EnteredConnection: ; 1046c4
	scf
	ret
; 1046c6

LoadWarpData: ; 1046c6
	call Function1046df
	call Function104718
	ld a, [wd146]
	ld [WarpNumber], a
	ld a, [wd147]
	ld [MapGroup], a
	ld a, [wd148]
	ld [MapNumber], a
	ret

Function1046df: ; 1046df (41:46df)
	call GetMapPermission
	call CheckOutdoorMap
	ret nz
	ld a, [wd147]
	ld b, a
	ld a, [wd148]
	ld c, a
	call GetAnyMapPermission
	call CheckIndoorMap
	ret nz
	ld a, [wd14a]
	cp $f
	jr nz, .asm_104705
	ld a, [wd14b]
	cp $a
	ret z
	cp $c
	ret z
.asm_104705
	ld a, [wd149]
	ld [wdca9], a
	ld a, [wd14a]
	ld [wdcaa], a
	ld a, [wd14b]
	ld [wdcab], a
	ret

Function104718: ; 104718 (41:4718)
	call GetMapPermission
	call CheckOutdoorMap
	ret nz
	ld a, [wd147]
	ld b, a
	ld a, [wd148]
	ld c, a
	call GetAnyMapPermission
	call CheckIndoorMap
	ret nz
	ld a, [wd147]
	ld b, a
	ld a, [wd148]
	ld c, a
	call GetAnyMapTileset
	ld a, c
	cp $7
	jr z, .asm_104743
	cp $15
	jr z, .asm_104743
	ret
.asm_104743
	ld a, [wd14a]
	ld [wdcb2], a
	ld a, [wd14b]
	ld [wdcb3], a
	ret

LoadMapTimeOfDay: ; 104750
	ld hl, VramState
	res 6, [hl]
	ld a, $1
	ld [wc2ce], a
	callba Function8c0e5
	callba Function8c001
	call OverworldTextModeSwitch
	call Function104770
	call Function1047a3
	ret

Function104770: ; 104770 (41:4770)
	ld a, VBGMap0 / $100
	ld [wBGMapAnchor + 1], a
	xor a
	ld [wBGMapAnchor], a
	ld [hSCY], a
	ld [hSCX], a
	callba Function5958
	ld a, [rVBK]
	push af
	ld a, $1
	ld [rVBK], a
	xor a
	lb bc, 4, 0
	ld hl, VBGMap0 tile $00
	call ByteFill
	pop af
	ld [rVBK], a
	ld a, $60
	lb bc, 4, 0
	ld hl, VBGMap0 tile $00
	call ByteFill
	ret

Function1047a3: ; 1047a3 (41:47a3)
	decoord 0, 0
	call Function1047b4
	ld a, [hCGB]
	and a
	ret z
	decoord 0, 0, AttrMap
	ld a, $1
	ld [rVBK], a

Function1047b4: ; 1047b4 (41:47b4)
	ld hl, VBGMap0 tile $00
	ld c, $14
	ld b, $12
.asm_1047bb
	push bc
.asm_1047bc
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .asm_1047bc
	ld bc, $c
	add hl, bc
	pop bc
	dec b
	jr nz, .asm_1047bb
	ld a, $0
	ld [rVBK], a
	ret

LoadGraphics: ; 1047cf
	call LoadTilesetHeader
	call LoadTileset
	xor a
	ld [hMapAnims], a
	xor a
	ld [hTileAnimFrame], a
	callba RefreshSprites
	call LoadFontsExtra
	callba Function106594
	ret

LoadMapPalettes: ; 1047eb
	ld b, $9
	jp GetSGBLayout
; 1047f0

RefreshMapSprites: ; 1047f0
	call ClearSprites
	callba ReturnFromMapSetupScript
	call Function2914
	callba Function579d
	callba CheckReplaceKrisSprite
	ld hl, wPlayerSpriteSetupFlags
	bit 6, [hl]
	jr nz, .skip
	ld hl, VramState
	set 0, [hl]
	call Function2e31
.skip
	ld a, [wPlayerSpriteSetupFlags]
	and $1c
	ld [wPlayerSpriteSetupFlags], a
	ret

CheckMovingOffEdgeOfMap:: ; 104820 (41:4820)
	ld a, [wPlayerStepDirection]
	cp STANDING
	ret z
	and a ; DOWN
	jr z, .down
	cp UP
	jr z, .up
	cp LEFT
	jr z, .left
	cp RIGHT
	jr z, .right
	and a
	ret

.down
	ld a, [PlayerNextMapY]
	sub 4
	ld b, a
	ld a, [MapHeight]
	add a
	cp b
	jr z, .ok
	and a
	ret

.up
	ld a, [PlayerNextMapY]
	sub 4
	cp -1
	jr z, .ok
	and a
	ret

.left
	ld a, [PlayerNextMapX]
	sub $4
	cp -1
	jr z, .ok
	and a
	ret

.right
	ld a, [PlayerNextMapX]
	sub 4
	ld b, a
	ld a, [MapWidth]
	add a
	cp b
	jr z, .ok
	and a
	ret

.ok
	scf
	ret


GetCoordOfUpperLeftCorner:: ; 10486d
	ld hl, OverworldMap
	ld a, [XCoord]
	bit 0, a
	jr nz, .increment_then_halve1
	srl a
	add $1
	jr .resume

.increment_then_halve1
	add $1
	srl a

.resume
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [MapWidth]
	add $6
	ld c, a
	ld b, $0
	ld a, [YCoord]
	bit 0, a
	jr nz, .increment_then_halve2
	srl a
	add $1
	jr .resume2

.increment_then_halve2
	add $1
	srl a

.resume2
	call AddNTimes
	ld a, l
	ld [wd194], a
	ld a, h
	ld [wd194 + 1], a
	ld a, [YCoord]
	and $1
	ld [wd196], a
	ld a, [XCoord]
	and $1
	ld [wd197], a
	ret
; 1048ba


DoMysteryGift: ; 1048ba (41:48ba)
	call ClearTileMap
	call ClearSprites
	call WaitBGMap
	call Function105153
	hlcoord 3, 8
	ld de, String_1049cd
	call PlaceString
	call WaitBGMap
	callba Function2c642
	call Function1050fb
	ld a, $2
	ld [wca01], a
	ld a, $14
	ld [wca02], a
	ld a, [rIE]
	push af
	call Function104a95
	ld d, a
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	push de
	call ClearTileMap
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	pop de
	hlcoord 2, 8
	ld a, d
	ld de, UnknownText_0x1049fd
	cp $10
	jp z, Function1049af
	cp $6c
	jp nz, Function1049b4
	ld a, [wc900]
	cp $3
	jr z, .asm_10492f
	call Function104a25
	ld hl, UnknownText_0x104a11
	jp nc, Function1049c5
	call Function104a30
	ld hl, UnknownText_0x104a16
	jp c, Function1049c5
.asm_10492f
	ld a, [wc962]
	and a
	jp nz, Function1049bd
	ld a, [wc912]
	and a
	jp nz, Function1049c2
	ld a, [wc900]
	cp $3
	jr z, .asm_104963
	call Function104a56
	ld a, [wc900]
	cp $4
	jr z, .asm_104963
	call Function104a71
	callba RestoreMobileEventIndex
	callba MobileFn_1060a9
	callba BackupMobileEventIndex
.asm_104963
	ld a, [wc90f]
	and a
	jr z, .item
	ld a, [wc911]
	ld c, a
	callba MysteryGiftGetDecoration
	push bc
	call Function105069
	pop bc
	jr nz, .item
	callab GetDecorationName_c
	ld h, d
	ld l, e
	ld de, StringBuffer1
	ld bc, ITEM_NAME_LENGTH
	call CopyBytes
	ld hl, UnknownText_0x104a20
	jr Function1049c5

.item
	call GetMysteryGiftBank
	ld a, [wc910]
	ld c, a
	callba MysteryGiftGetItemHeldEffect
	ld a, c
	ld [s0_abe4], a
	ld [wNamedObjectIndexBuffer], a
	call CloseSRAM
	call GetItemName
	ld hl, UnknownText_0x104a1b
	jr Function1049c5

Function1049af: ; 1049af (41:49af)
	ld hl, UnknownText_0x1049fd
	jr Function1049c5

Function1049b4: ; 1049b4 (41:49b4)
	ld hl, UnknownText_0x104a02
	call PrintText
	jp DoMysteryGift

Function1049bd: ; 1049bd (41:49bd)
	ld hl, UnknownText_0x104a07
	jr Function1049c5

Function1049c2: ; 1049c2 (41:49c2)
	ld hl, UnknownText_0x104a0c

Function1049c5: ; 1049c5 (41:49c5)
	call PrintText
	ld a, $e3
	ld [rLCDC], a
	ret
; 1049cd (41:49cd)

String_1049cd: ; 1049cd
	db   "Press A to"
	next "link IR-Device"
	next "Press B to"
	next "cancel it."
	db   "@"
; 1049fd

UnknownText_0x1049fd: ; 1049fd
	text_jump UnknownText_0x1c0436
	db "@"
; 104a02

UnknownText_0x104a02: ; 104a02
	text_jump UnknownText_0x1c0454
	db "@"
; 104a07

UnknownText_0x104a07: ; 104a07
	text_jump UnknownText_0x1c046a
	db "@"
; 104a0c

UnknownText_0x104a0c: ; 104a0c
	text_jump UnknownText_0x1c048e
	db "@"
; 104a11

UnknownText_0x104a11: ; 104a11
	text_jump UnknownText_0x1c04a7
	db "@"
; 104a16

UnknownText_0x104a16: ; 104a16
	text_jump UnknownText_0x1c04c6
	db "@"
; 104a1b

UnknownText_0x104a1b: ; 104a1b
	text_jump UnknownText_0x1c04e9
	db "@"
; 104a20

UnknownText_0x104a20: ; 104a20
	text_jump UnknownText_0x1c04fa
	db "@"
; 104a25

Function104a25: ; 104a25 (41:4a25)
	call GetMysteryGiftBank
	ld a, [s0_abe5]
	cp $5
	jp CloseSRAM

Function104a30: ; 104a30 (41:4a30)
	call GetMysteryGiftBank
	ld a, [wc901]
	ld b, a
	ld a, [wc902]
	ld c, a
	ld a, [s0_abe5]
	ld d, a
	ld hl, s0_abe6
.asm_104a42
	ld a, d
	and a
	jr z, .asm_104a53
	ld a, [hli]
	cp b
	jr nz, .asm_104a4e
	ld a, [hl]
	cp c
	jr z, .asm_104a52
.asm_104a4e
	inc hl
	dec d
	jr .asm_104a42
.asm_104a52
	scf
.asm_104a53
	jp CloseSRAM

Function104a56: ; 104a56 (41:4a56)
	call GetMysteryGiftBank
	ld hl, s0_abe5
	ld a, [hl]
	inc [hl]
	ld hl, s0_abe6 ; inc hl
	ld e, a
	ld d, $0
rept 2
	add hl, de
endr
	ld a, [wc901]
	ld [hli], a
	ld a, [wc902]
	ld [hl], a
	jp CloseSRAM

Function104a71: ; 104a71 (41:4a71)
	call GetMysteryGiftBank
	ld a, $1
	ld [sMysteryGiftTrainerHouseFlag], a
	ld hl, wc903
	ld de, s0_abfe
	ld bc, $b
	call CopyBytes
	ld a, $1
	ld [de], a
	inc de
	ld hl, wc850
	ld bc, $26
	call CopyBytes
	jp CloseSRAM

Function104a95: ; 104a95 (41:4a95)
	di
	callba ClearChannels
	call Function104d5e
.asm_104a9f
	call Function104d96
	call Function104ddd
	ld a, [hPrintNum10]
	cp $10
	jp z, Function104bd0
	cp $6c
	jr nz, .asm_104a9f
	ld a, [hPrintNum9]
	cp $2
	jr z, Function104b22
	ld hl, $ffb3
	ld b, $1
	call Function104d56
	jr nz, .asm_104ac8
	call Function104b49
	jp nz, Function104bd0
	jr asm_104b0a
.asm_104ac8
	ld a, [rLY]
	cp $90
	jr c, .asm_104ac8
	ld c, rRP % $100
	ld a, $c0
	ld [$ff00+c], a
	ld b, $f0
.asm_104ad5
	push bc
	call Function105038
	ld b, $2
	ld c, rRP % $100
.asm_104add
	ld a, [$ff00+c]
	and b
	ld b, a
	ld a, [rLY]
	cp $90
	jr nc, .asm_104add
.asm_104ae6
	ld a, [$ff00+c]
	and b
	ld b, a
	ld a, [rLY]
	cp $90
	jr c, .asm_104ae6
	ld a, b
	pop bc
	dec b
	jr z, .asm_104a9f
	or a
	jr nz, .asm_104a9f
	ld a, [hMoneyTemp + 1]
	bit 1, a
	jr z, .asm_104ad5
	ld a, $10
	ld [hPrintNum10], a
	jp Function104bd0

Function104b04: ; 104b04 (41:4b04)
	call Function104b40
	jp nz, Function104bd0

asm_104b0a: ; 104b0a (41:4b0a)
	call Function104d38
	jp nz, Function104bd0
	call Function104b88
	jp nz, Function104bd0
	call Function104d43
	jp nz, Function104bd0
	call Function105033
	jp Function104bd0

Function104b22: ; 104b22 (41:4b22)
	call Function104b88
	jp nz, Function104bd0
	call Function104d43
	jp nz, Function104bd0
	call Function104b40
	jp nz, Function104bd0
	call Function104d38
	jp nz, Function104bd0
	call Function10502e
	jp Function104bd0

Function104b40: ; 104b40 (41:4b40)
	ld hl, $ffb3
	ld b, $1
	call Function104d56
	ret nz

Function104b49: ; 104b49 (41:4b49)
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	ld a, [$ffb3]
	cp $96
	jp nz, Function104d32
	ld a, $90
	ld [$ffb3], a
	call Function104d38
	ret nz
	ld hl, $ffb3
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, wc850
	ld a, [wca02]
	ld b, a
	call Function104d56
	ret nz
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104b88: ; 104b88 (41:4b88)
	ld a, $96
	ld [$ffb3], a
	ld hl, $ffb3
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, $ffb3
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	ld a, [$ffb3]
	cp $90
	jp nz, Function104d32
	call Function104d38
	ret nz
	ld hl, OverworldMap
	ld a, [wca02]
	ld b, a
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104bd0: ; 104bd0 (41:4bd0)
	nop
	ld a, [hPrintNum10]
	cp $10
	jr z, .asm_104c18
	cp $6c
	jr nz, .asm_104c18
	ld hl, wca01
	dec [hl]
	jr z, .asm_104c18
	ld hl, wc850
	ld de, wc900
	ld bc, $14
	call CopyBytes
	ld a, [wc850]
	cp $3
	jr nc, .asm_104c18
	callba Function10510b
	call Function1050fb
	ld a, $26
	ld [wca02], a
	ld a, [hPrintNum9]
	cp $2
	jr z, .asm_104c10
	call Function104d43
	jr nz, Function104bd0
	jp Function104b04
.asm_104c10
	call Function104d38
	jr nz, Function104bd0
	jp Function104b22
.asm_104c18
	ld a, [hPrintNum10]
	push af
	call Function104da0
	xor a
	ld [rIF], a
	ld a, [rIE]
	or $1
	ld [rIE], a
	ei
	call DelayFrame
	pop af
	ret

Function104c2d: ; 104c2d (41:4c2d)
	di
	callba ClearChannels
	call Function104d5e
.asm_104c37
	call Function104d96
	call Function104ddd
	ld a, [hPrintNum10]
	cp $10
	jp z, Function104d1c
	cp $6c
	jr nz, .asm_104c37
	ld a, [hPrintNum9]
	cp $2
	jr z, .asm_104c6c
	call Function104c8a
	jp nz, Function104d1c
	call Function104d38
	jp nz, Function104d1c
	call Function104cd2
	jp nz, Function104d1c
	call Function104d43
	jp nz, Function104d1c
	call Function105033
	jp Function104d1c
.asm_104c6c
	call Function104cd2
	jp nz, Function104d1c
	call Function104d43
	jp nz, Function104d1c
	call Function104c8a
	jp nz, Function104d1c
	call Function104d38
	jp nz, Function104d1c
	call Function10502e
	jp Function104d1c

Function104c8a: ; 104c8a (41:4c8a)
	ld hl, $ffb3
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	ld a, [$ffb3]
	cp $3c
	jp nz, Function104d32
	swap a
	ld [$ffb3], a
	call Function104d38
	ret nz
	ld hl, $ffb3
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, wc850
	ld a, [wca02]
	ld b, a
	call Function104d56
	ret nz
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104cd2: ; 104cd2 (41:4cd2)
	ld a, $3c
	ld [$ffb3], a
	ld hl, $ffb3
	ld b, $1
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	call Function104d43
	ret nz
	ld hl, $ffb3
	ld b, $1
	call Function104d56
	ret nz
	call Function105033
	ld a, [hPrintNum10]
	cp $6c
	ret nz
	ld a, [$ffb3]
	swap a
	cp $3c
	jp nz, Function104d32
	call Function104d38
	ret nz
	ld hl, OverworldMap
	ld a, [wca02]
	ld b, a
	call Function104d4e
	ret nz
	call Function10502e
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104d1c: ; 104d1c (41:4d1c)
	nop
	ld a, [hPrintNum10]
	push af
	call Function104da0
	xor a
	ld [rIF], a
	ld a, [rIE]
	or $1
	ld [rIE], a
	ei
	call DelayFrame
	pop af
	ret

Function104d32: ; 104d32 (41:4d32)
	ld a, $80
	ld [hPrintNum10], a
	and a
	ret

Function104d38: ; 104d38 (41:4d38)
	call Function104d96
	call Function104e46
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104d43: ; 104d43 (41:4d43)
	call Function104d96
	call Function104dfe
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104d4e: ; 104d4e (41:4d4e)
	call Function104e93
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104d56: ; 104d56 (41:4d56)
	call Function104f57
	ld a, [hPrintNum10]
	cp $6c
	ret

Function104d5e: ; 104d5e (41:4d5e)
	call Function104d74
	ld a, $4
	ld [rIE], a
	xor a
	ld [rIF], a
	call Function104d96
	xor a
	ld b, a
.asm_104d6d
	inc a
	jr nz, .asm_104d6d
	inc b
	jr nz, .asm_104d6d
	ret

Function104d74: ; 104d74 (41:4d74)
	xor a
	ld [rTAC], a
	ld a, $fe
	ld [rTMA], a
	ld [rTIMA], a
	ld a, $2
	ld [rTAC], a
	or $4
	ld [rTAC], a
	ret

Function104d86: ; 104d86 (41:4d86)
	xor a
	ld [rTAC], a
	ld [rTMA], a
	ld [rTIMA], a
	ld a, $2
	ld [rTAC], a
	or $4
	ld [rTAC], a
	ret

Function104d96: ; 104d96 (41:4d96)
	ld a, $c0
	call Function104e8c
	ld a, $1
	ld [hPrintNum9], a
	ret

Function104da0: ; 104da0 (41:4da0)
	xor a
	call Function104e8c
	ld a, $2
	ld [rTAC], a
	ret

Function104da9: ; 104da9 (41:4da9)
	inc d
	ret z
	xor a
	ld [rIF], a
	halt
	ld a, [$ff00+c]
	bit 1, a
	jr z, Function104da9
	or a
	ret

Function104db7: ; 104db7 (41:4db7)
	inc d
	ret z
	xor a
	ld [rIF], a
	halt
	ld a, [$ff00+c]
	bit 1, a
	jr nz, Function104db7
	or a
	ret

Function104dc5: ; 104dc5 (41:4dc5)
	ld a, $c1
	ld [$ff00+c], a
.asm_104dc8
	dec d
	ret z
	xor a
	ld [rIF], a
	halt
	jr .asm_104dc8

Function104dd1: ; 104dd1 (41:4dd1)
	ld a, $c0
	ld [$ff00+c], a
.asm_104dd4
	dec d
	ret z
	xor a
	ld [rIF], a
	halt
	jr .asm_104dd4

Function104ddd: ; 104ddd (41:4ddd)
	ld d, $0
	ld e, d
	ld a, $1
	ld [hPrintNum9], a
.asm_104de4
	call Function105038
	ld b, $2
	ld c, rRP % $100
	ld a, [hMoneyTemp + 1]
	bit 1, a
	jr z, .asm_104df6
	ld a, $10
	ld [hPrintNum10], a
	ret
.asm_104df6
	bit 0, a
	jr nz, asm_104e3a
	ld a, [$ff00+c]
	and b
	jr nz, .asm_104de4

Function104dfe: ; 104dfe (41:4dfe)
	ld c, rRP % $100
	ld d, $0
	ld e, d
	call Function104db7
	jp z, Function104f42
	ld d, e
	call Function104da9
	jp z, Function104f42
	call Function104db7
	jp z, Function104f42
	call Function104da9
	jp z, Function104f42
	ld a, $6c
	ld [hPrintNum10], a
	ld d, $3d
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $5
	call Function104dd1
	ret

asm_104e3a: ; 104e3a (41:4e3a)
	call Random
	ld e, a
	and $f
	ld d, a
.asm_104e41
	dec de
	ld a, d
	or e
	jr nz, .asm_104e41

Function104e46: ; 104e46 (41:4e46)
	ld a, $2
	ld [hPrintNum9], a
	ld c, $56
	ld d, $0
	ld e, d
	ld d, $3d
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $5
	call Function104dd1
	ld d, e
	call Function104db7
	jp z, Function104f42
	ld d, e
	call Function104da9
	jp z, Function104f42
	call Function104db7
	jp z, Function104f42
	call Function104da9
	jp z, Function104f42
	ld d, $3d
	call Function104dd1
	ld a, $6c
	ld [hPrintNum10], a
	ret

Function104e8c: ; 104e8c (41:4e8c)
	ld [rRP], a
	ld a, $ff
	ld [hPrintNum10], a
	ret

Function104e93: ; 104e93 (41:4e93)
	xor a
	ld [hDivisor], a
	ld [hMathBuffer], a
	push hl
	push bc
	ld c, $56
	ld d, $3d
	call Function104dd1
	ld hl, hQuotient ; $ffb4 (aliases: hMultiplicand)
	ld a, $5a
	ld [hli], a
	ld [hl], b
	dec hl
	ld b, $2
	call Function104ed6
	pop bc
	pop hl
	call Function104ed6
	ld a, [hDivisor]
	ld [hQuotient], a
	ld a, [hMathBuffer]
	ld [$ffb5], a
	push hl
	ld hl, hQuotient ; $ffb4 (aliases: hMultiplicand)
	ld b, $2
	call Function104ed6
	ld hl, hPrintNum10
	ld b, $1
	call Function104faf
	ld a, [hQuotient]
	ld [hDivisor], a
	ld a, [$ffb5]
	ld [hMathBuffer], a
	pop hl
	ret

Function104ed6: ; 104ed6 (41:4ed6)
	ld c, $56
	ld d, $5
	call Function104dd1
	ld d, $5
	call Function104dc5
	ld d, $15
	call Function104dd1
	ld a, b
	cpl
	ld b, a
	ld a, $f4
	ld [rTMA], a
.asm_104eee
	inc b
	jr z, .asm_104f2e
	ld a, $8
	ld [$ffb6], a
	ld a, [hli]
	ld e, a
	ld a, [hDivisor]
	add e
	ld [hDivisor], a
	ld a, [hMathBuffer]
	adc $0
	ld [hMathBuffer], a
.asm_104f02
	xor a
	ld [rIF], a
	halt
	ld a, $c1
	ld [rRP], a
	ld d, $1
	ld a, e
	rlca
	ld e, a
	jr nc, .asm_104f13
	inc d
.asm_104f13
	ld a, [rTIMA]
	cp $f8
	jr c, .asm_104f13
	ld a, $c0
	ld [rRP], a
	dec d
	jr z, .asm_104f25
	xor a
	ld [rIF], a
	halt
.asm_104f25
	ld a, [$ffb6]
	dec a
	jr z, .asm_104eee
	ld [$ffb6], a
	jr .asm_104f02
.asm_104f2e
	ld a, $fe
	ld [rTMA], a
	xor a
	ld [rIF], a
	halt
	ld d, $5
	call Function104dc5
	ld d, $11
	call Function104dd1
	ret

Function104f42: ; 104f42 (41:4f42)
	ld a, [hPrintNum10]
	or $2
	ld [hPrintNum10], a
	ret

Function104f49: ; 104f49 (41:4f49)
	ld a, [hPrintNum10]
	or $1
	ld [hPrintNum10], a
	ret

Function104f50: ; 104f50 (41:4f50)
	ld a, [hPrintNum10]
	or $80
	ld [hPrintNum10], a
	ret

Function104f57: ; 104f57 (41:4f57)
	xor a
	ld [hDivisor], a
	ld [hMathBuffer], a
	push bc
	push hl
	ld hl, hQuotient ; $ffb4 (aliases: hMultiplicand)
	ld b, $2
	call Function104faf
	ld a, [$ffb5]
	ld [$ffba], a
	ld b, a
	pop hl
	pop af
	cp b
	jp c, Function104f50
	ld a, [hQuotient]
	cp $5a
	jp nz, Function104f50
	call Function104faf
	ld a, [hDivisor]
	ld d, a
	ld a, [hMathBuffer]
	ld e, a
	push hl
	push de
	ld hl, hQuotient ; $ffb4 (aliases: hMultiplicand)
	ld b, $2
	call Function104faf
	pop de
	ld hl, hQuotient ; $ffb4 (aliases: hMultiplicand)
	ld a, [hli]
	xor d
	ld b, a
	ld a, [hl]
	xor e
	or b
	call nz, Function104f49
	push de
	ld d, $3d
	call Function104dd1
	ld hl, hPrintNum10
	ld b, $1
	call Function104ed6
	pop de
	pop hl
	ld a, d
	ld [hDivisor], a
	ld a, e
	ld [hMathBuffer], a
	ret

Function104faf: ; 104faf (41:4faf)
	ld c, rRP % $100
	ld d, $0
	call Function104db7
	jp z, Function104f42
	ld d, $0
	call Function104da9
	jp z, Function104f42
	ld d, $0
	call Function104db7
	jp z, Function104f42
	ld a, b
	cpl
	ld b, a
	xor a
	ld [hMoneyTemp + 2], a
	call Function104d86
.asm_104fd2
	inc b
	jr z, .asm_10501a
	ld a, $8
	ld [$ffb6], a
.asm_104fd9
	ld d, $0
.asm_104fdb
	inc d
	jr z, .asm_104fe5
	ld a, [$ff00+c]
	bit 1, a
	jr z, .asm_104fdb
	ld d, $0
.asm_104fe5
	inc d
	jr z, .asm_104fed
	ld a, [$ff00+c]
	bit 1, a
	jr nz, .asm_104fe5
.asm_104fed
	ld a, [hMoneyTemp + 2]
	ld d, a
	ld a, [rTIMA]
	ld [hMoneyTemp + 2], a
	sub d
	cp $12
	jr c, .asm_104ffd
	set 0, e
	jr .asm_104fff
.asm_104ffd
	res 0, e
.asm_104fff
	ld a, [$ffb6]
	dec a
	ld [$ffb6], a
	jr z, .asm_10500b
	ld a, e
	rlca
	ld e, a
	jr .asm_104fd9
.asm_10500b
	ld a, e
	ld [hli], a
	ld a, [hDivisor]
	add e
	ld [hDivisor], a
	ld a, [hMathBuffer]
	adc $0
	ld [hMathBuffer], a
	jr .asm_104fd2
.asm_10501a
	call Function104d74
	xor a
	ld [rIF], a
	ld d, $0
	call Function104da9
	jp z, Function104f42
	ld d, $10
	call Function104dd1
	ret

Function10502e: ; 10502e (41:502e)
	ld b, $0
	jp Function104e93

Function105033: ; 105033 (41:5033)
	ld b, $0
	jp Function104f57

Function105038: ; 105038 (41:5038)
	ld a, $20
	ld [rJOYP], a
rept 2
	ld a, [rJOYP]
endr
	cpl
	and $f
	swap a
	ld b, a
	ld a, $10
	ld [rJOYP], a
rept 6
	ld a, [rJOYP]
endr
	cpl
	and $f
	or b
	ld c, a
	ld a, [hMoneyTemp]
	xor c
	and c
	ld [hMoneyTemp + 1], a
	ld a, c
	ld [hMoneyTemp], a
	ld a, $30
	ld [rJOYP], a
	ret

Function105069: ; 105069 (41:5069)
	call GetMysteryGiftBank
	ld d, $0
	ld b, $2
	ld hl, s0_abf0
	predef_id FlagPredef
	push hl
	push bc
	call Predef
	call CloseSRAM
	ld a, c
	and a
	pop bc
	pop hl
	ret nz
	call GetMysteryGiftBank
	ld b, $1
	predef FlagPredef
	call CloseSRAM
	xor a
	ret

Function105091: ; 105091 (41:5091)
	call GetMysteryGiftBank
	ld c, $0
.asm_105096
	push bc
	ld d, $0
	ld b, $2
	ld hl, s0_abf0
	predef FlagPredef
	ld a, c
	and a
	pop bc
	jr z, .asm_1050b0
	push bc
	callab SetSpecificDecorationFlag
	pop bc
.asm_1050b0
	inc c
	ld a, c
	cp $2a + 1
	jr c, .asm_105096
	jp CloseSRAM

Special_UnlockMysteryGift: ; 1050b9
	call GetMysteryGiftBank
	ld hl, s0_abe3
	ld a, [hl]
	inc a
	jr nz, .ok
	ld [hld], a
	ld [hl], a
.ok
	jp CloseSRAM
; 1050c8

Function1050c8: ; 1050c8
	call GetMysteryGiftBank
	ld a, [s0_abe5]
	cp $ff
	jr z, .okay
	xor a
	ld [s0_abe5], a
.okay
	jp CloseSRAM
; 1050d9


Function1050d9: ; 1050d9
	call GetMysteryGiftBank
	ld hl, sMysteryGiftItem
	ld de, s0_abe4
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM
; 1050ea


Function1050ea: ; 1050ea (41:50ea)
	call GetMysteryGiftBank
	ld hl, s0_abe4
	ld de, sMysteryGiftItem
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	jp CloseSRAM

Function1050fb: ; 1050fb (41:50fb)
	ld hl, wc850
	xor a
	ld b, $26
.asm_105101
	ld [hli], a
	dec b
	jr nz, .asm_105101
	ret


GetMysteryGiftBank: ; 105106
	ld a, BANK(s0_abe4)
	jp GetSRAMBank
; 10510b


Function10510b: ; 10510b (41:510b)
	ld a, BANK(sPokemonData)
	call GetSRAMBank
	ld de, OverworldMap
	ld bc, sPokemonData + PartyMons - wPokemonData
	ld hl, sPokemonData + PartySpecies - wPokemonData
.asm_105119
	ld a, [hli]
	cp $ff
	jr z, .asm_105148
	cp EGG
	jr z, .asm_10513e
	push hl
	ld hl, MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, MON_SPECIES
	add hl, bc
	ld a, [hl]
	ld [de], a
	inc de
	ld hl, MON_MOVES
	add hl, bc
	push bc
	ld bc, NUM_MOVES
	call CopyBytes
	pop bc
	pop hl
.asm_10513e
	push hl
	ld hl, PARTYMON_STRUCT_LENGTH
	add hl, bc
	ld b, h
	ld c, l
	pop hl
	jr .asm_105119
.asm_105148
	ld a, $ff
	ld [de], a
	ld a, $26
	ld [wca00], a
	jp CloseSRAM

Function105153: ; 105153 (41:5153)
	call ClearBGPalettes
	call DisableLCD
	ld hl, MysteryGiftGFX
	ld de, VTiles2 tile $00
	ld a, BANK(MysteryGiftGFX)
	ld bc, Function105688 - MysteryGiftGFX
	call FarCopyBytes
	hlcoord 0, 0
	ld a, $42
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	hlcoord 3, 7
	lb bc, 9, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $0
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 0, 1
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 7, 1
	ld a, $12
	call Function10522e
	hlcoord 2, 2
	ld a, $17
	call Function105236
	hlcoord 2, 3
	ld a, $27
	call Function105236
	hlcoord 9, 4
	ld a, $37
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 1, 2
	ld [hl], $4
	hlcoord 1, 3
	ld a, $5
	call Function105246
	ld a, $9
	hlcoord 18, 5
	call Function105242
	hlcoord 2, 5
	ld a, $b
	call Function105251
	hlcoord 2, 16
	ld a, $7
	call Function105251
	hlcoord 2, 5
	ld a, $d
	call Function10522e
	hlcoord 7, 5
	ld [hl], $c
	hlcoord 18, 5
	ld [hl], $a
	hlcoord 18, 16
	ld [hl], $8
	hlcoord 1, 16
	ld [hl], $6
	hlcoord 2, 6
	ld a, $3a
	call Function105251
	hlcoord 2, 15
	ld a, $40
	call Function105251
	hlcoord 2, 6
	ld a, $3c
	call Function10523e
	hlcoord 17, 6
	ld a, $3e
	call Function10523e
	hlcoord 2, 6
	ld [hl], $39
	hlcoord 17, 6
	ld [hl], $3b
	hlcoord 2, 15
	ld [hl], $3f
	hlcoord 17, 15
	ld [hl], $41
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_1D
	call GetSGBLayout
	call SetPalettes
	ret

Function10522e: ; 10522e (41:522e)
	ld b, $5
	jr asm_105238
; 105232 (41:5232)

Function105232: ; unreferenced
	ld b, 6
	jr asm_105238

Function105236: ; 105236 (41:5236)
	ld b, $10

asm_105238: ; 105238 (41:5238)
	ld [hli], a
	inc a
	dec b
	jr nz, asm_105238
	ret

Function10523e: ; 10523e (41:523e)
	ld b, $9
	jr asm_105248

Function105242: ; 105242 (41:5242)
	ld b, $b
	jr asm_105248

Function105246: ; 105246 (41:5246)
	ld b, $e

asm_105248: ; 105248 (41:5248)
	ld [hl], a
	ld de, $14
	add hl, de
	dec b
	jr nz, asm_105248
	ret

Function105251: ; 105251 (41:5251)
	ld b, $10
.asm_105253
	ld [hli], a
	dec b
	jr nz, .asm_105253
	ret

MysteryGiftGFX: ; 105258
INCBIN "gfx/misc/mystery_gift.2bpp"


Function105688: ; 105688 (41:5688)
	call ClearTileMap
	call ClearSprites
	call WaitBGMap
	call Function1057d7
	hlcoord 3, 8
	ld de, String_10572e
	call PlaceString
	call WaitBGMap
	call Function10578c
	call Function1050fb
	ld a, $24
	ld [wca02], a
	ld a, [rIE]
	push af
	call Function104c2d
	ld d, a
	xor a
	ld [rIF], a
	pop af
	ld [rIE], a
	ld a, d
	cp $10
	jp z, Function105712
	cp $6c
	jp nz, Function10571a
	call Function1056eb
	ld c, 60
	call DelayFrames
	call Function105777
	ld hl, Text_10575e
	call PrintText
	ld de, wc850
	callba Function8ac70
	ld a, c
	ld [wd265], a
	ld hl, Text_105768
	jr c, asm_105726
	ld hl, Text_105763
	jr asm_105726

Function1056eb: ; 1056eb (41:56eb)
	ld c, $10
.asm_1056ed
	ld hl, Sprites
	ld b, $8
.asm_1056f2
	dec [hl]
rept 4
	inc hl
endr
	dec b
	jr nz, .asm_1056f2
	ld hl, Sprites + $20
	ld b, $8
.asm_1056ff
	inc [hl]
rept 4
	inc hl
endr
	dec b
	jr nz, .asm_1056ff
	dec c
	ret z
	push bc
	ld c, 4
	call DelayFrames
	pop bc
	jr .asm_1056ed

Function105712: ; 105712 (41:5712)
	call Function105777
	ld hl, Text_10576d
	jr asm_105726

Function10571a: ; 10571a (41:571a)
	call Function105777
	ld hl, Text_105772
	call PrintText
	jp Function105688

asm_105726: ; 105726 (41:5726)
	call PrintText
	ld a, $e3
	ld [rLCDC], a
	ret
; 10572e (41:572e)

String_10572e: ; 10572e
	db   "エーボタン¯おすと"
	next "つうしん",   $4a, "おこなわれるよ!"
	next "ビーボタン¯おすと"
	next "つうしん¯ちゅうし します"
	db   "@"

; 10575e

Text_10575e: ; 10575e
	text_jump UnknownText_0x1c051a
	db "@"

Text_105763: ; 105763
	text_jump UnknownText_0x1c0531
	db "@"

Text_105768: ; 105768
	text_jump UnknownText_0x1c0555
	db "@"

Text_10576d: ; 10576d
	text_jump UnknownText_0x1c0573
	db "@"

Text_105772: ; 105772
	text_jump UnknownText_0x1c0591
	db "@"
; 105777

Function105777: ; 105777 (41:5777)
	call ClearSprites
	call ClearTileMap
	call EnableLCD
	call WaitBGMap
	ld b, SCGB_08
	call GetSGBLayout
	call SetPalettes
	ret

Function10578c: ; 10578c (41:578c)
	ld de, OverworldMap
	ld a, BANK(sPlayerData)
	call GetSRAMBank
	ld hl, sPlayerData + PlayerName - wPlayerData
	ld bc, NAME_LENGTH
	call CopyBytes
	ld hl, sPlayerData + PlayerID - wPlayerData
	ld bc, 2
	call CopyBytes
	ld hl, sPlayerData + wSecretID - wPlayerData
	ld bc, 2
	call CopyBytes
	call CloseSRAM
	ld a, BANK(sCrystalData)
	call GetSRAMBank
	ld a, [sCrystalData + 0]
	ld [de], a
	inc de
	ld a, $4
	call GetSRAMBank
	ld hl, $a603
	ld bc, $8
	call CopyBytes
	ld hl, $a007
	ld bc, $c
	call CopyBytes
	call CloseSRAM
	ret

Function1057d7: ; 1057d7 (41:57d7)
	call ClearBGPalettes
	call DisableLCD
	ld hl, MysteryGiftJP_GFX
	ld de, VTiles2 tile $00
	ld a, BANK(MysteryGiftJP_GFX)
	lb bc, 4, 0
	call FarCopyBytes
	ld hl, MysteryGiftJP_GFX + $400
	ld de, VTiles0 tile $00
	ld a, BANK(MysteryGiftJP_GFX)
	ld bc, $80
	call FarCopyBytes
	hlcoord 0, 0
	ld a, $3f
	ld bc, SCREEN_HEIGHT * SCREEN_WIDTH
	call ByteFill
	hlcoord 3, 7
	lb bc, 9, 15
	call ClearBox
	hlcoord 0, 0
	ld a, $0
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 0, 1
	inc a
	ld [hli], a
	inc a
	ld [hl], a
	hlcoord 4, 2
	ld a, $13
	call Function1058ca
	hlcoord 4, 3
	ld a, $1e
	call Function1058ce
	hlcoord 4, 4
	ld a, $2a
	call Function1058ce
	hlcoord 1, 2
	ld [hl], $4
	hlcoord 1, 3
	ld a, $5
	call Function1058de
	ld a, $9
	hlcoord 18, 5
	call Function1058da
	hlcoord 2, 5
	ld a, $b
	call Function1058e9
	hlcoord 2, 16
	ld a, $7
	call Function1058e9
	hlcoord 2, 5
	ld a, $d
	call Function1058c6
	hlcoord 8, 5
	ld [hl], $c
	hlcoord 18, 5
	ld [hl], $a
	hlcoord 18, 16
	ld [hl], $8
	hlcoord 1, 16
	ld [hl], $6
	hlcoord 2, 6
	ld a, $37
	call Function1058e9
	hlcoord 2, 15
	ld a, $3d
	call Function1058e9
	hlcoord 2, 6
	ld a, $39
	call Function1058d6
	hlcoord 17, 6
	ld a, $3b
	call Function1058d6
	hlcoord 2, 6
	ld [hl], $36
	hlcoord 17, 6
	ld [hl], $38
	hlcoord 2, 15
	ld [hl], $3c
	hlcoord 17, 15
	ld [hl], $3e
	ld de, Sprites
	ld hl, OAM_1058f0
	ld bc, $40
	call CopyBytes
	call EnableLCD
	call WaitBGMap
	ld b, $2
	callba Function4930f
	jp SetPalettes

Function1058c6: ; 1058c6 (41:58c6)
	ld b, $6
	jr asm_1058d0

Function1058ca: ; 1058ca (41:58ca)
	ld b, $b
	jr asm_1058d0

Function1058ce: ; 1058ce (41:58ce)
	ld b, $c

asm_1058d0: ; 1058d0 (41:58d0)
	ld [hli], a
	inc a
	dec b
	jr nz, asm_1058d0
	ret

Function1058d6: ; 1058d6 (41:58d6)
	ld b, $9
	jr asm_1058e0

Function1058da: ; 1058da (41:58da)
	ld b, $b
	jr asm_1058e0

Function1058de: ; 1058de (41:58de)
	ld b, $e

asm_1058e0: ; 1058e0 (41:58e0)
	ld [hl], a
	ld de, $14
	add hl, de
	dec b
	jr nz, asm_1058e0
	ret

Function1058e9: ; 1058e9 (41:58e9)
	ld b, $10
.asm_1058eb
	ld [hli], a
	dec b
	jr nz, .asm_1058eb
	ret
; 1058f0 (41:58f0)

OAM_1058f0: ; 1058f0
	db $11, $34, $00, $00
	db $11, $3c, $01, $00
	db $11, $44, $02, $00
	db $11, $4c, $03, $00
	db $19, $34, $04, $00
	db $19, $3c, $05, $00
	db $19, $44, $06, $00
	db $19, $4c, $07, $00
	db $01, $5c, $00, $00
	db $01, $64, $01, $00
	db $01, $6c, $02, $00
	db $01, $74, $03, $00
	db $09, $5c, $04, $00
	db $09, $64, $05, $00
	db $09, $6c, $06, $00
	db $09, $74, $07, $00

; japanese mystery gift gfx
MysteryGiftJP_GFX: ; 105930
INCBIN "gfx/misc/mystery_gift_jp.2bpp"


DisplayUsedMoveText: ; 105db0
; battle command 03
	ld hl, UsedMoveText
	call BattleTextBox
	jp WaitBGMap
; 105db9


UsedMoveText: ; 105db9
; this is a stream of text and asm from 105db9 to 105ef6

	text_jump _ActorNameText
	start_asm

	ld a, [hBattleTurn]
	and a
	jr nz, .start

	ld a, [wPlayerMoveStruct + MOVE_ANIM]
	call UpdateUsedMoves

.start
	ld a, BATTLE_VARS_LAST_MOVE
	call GetBattleVarAddr
	ld d, h
	ld e, l

	ld a, BATTLE_VARS_LAST_COUNTER_MOVE
	call GetBattleVarAddr

	ld a, BATTLE_VARS_MOVE_ANIM
	call GetBattleVar
	ld [wd265], a

	push hl
	callba CheckUserIsCharging
	pop hl
	jr nz, .grammar

	; update last move
	ld a, [wd265]
	ld [hl], a
	ld [de], a

.grammar
	call GetMoveGrammar
; wd265 now contains MoveGrammar


; everything except 'instead' made redundant in localization

	; check obedience
	ld a, [AlreadyDisobeyed]
	and a
	ld hl, UsedMove2Text
	ret nz

	; check move grammar
	ld a, [wd265]
	cp $3
	ld hl, UsedMove2Text
	ret c
	ld hl, UsedMove1Text
	ret
; 105e04

UsedMove1Text: ; 105e04
	text_jump _UsedMove1Text
	start_asm
	jr Function105e10
; 105e0b

UsedMove2Text: ; 105e0b
	text_jump _UsedMove2Text
	start_asm
; 105e10

Function105e10: ; 105e10
; check obedience
	ld a, [AlreadyDisobeyed]
	and a
	jr z, GetMoveNameText
; print "instead,"
	ld hl, UsedInsteadText
	ret
; 105e1a

UsedInsteadText: ; 105e1a
	text_jump _UsedInsteadText
	start_asm
; 105e1f

GetMoveNameText: ; 105e1f
	ld hl, MoveNameText
	ret
; 105e23

MoveNameText: ; 105e23
	text_jump _MoveNameText
	start_asm
; 105e28

GetUsedMoveTextEnder: ; 105e28
; get start address
	ld hl, .endusedmovetexts

; get move id
	ld a, [wd265]

; 2-byte pointer
	add a

; seek
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc

; get pointer to usedmovetext ender
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret
; 105e39

.endusedmovetexts ; 105e39
	dw EndUsedMove1Text
	dw EndUsedMove2Text
	dw EndUsedMove3Text
	dw EndUsedMove4Text
	dw EndUsedMove5Text
; 105e43

EndUsedMove1Text: ; 105e43
	text_jump _EndUsedMove1Text
	db "@"
; 105e48
EndUsedMove2Text: ; 105e48
	text_jump _EndUsedMove2Text
	db "@"
; 105e4d
EndUsedMove3Text: ; 105e4d
	text_jump _EndUsedMove3Text
	db "@"
; 105e52
EndUsedMove4Text: ; 105e52
	text_jump _EndUsedMove4Text
	db "@"
; 105e57
EndUsedMove5Text: ; 105e57
	text_jump _EndUsedMove5Text
	db "@"
; 105e5c


GetMoveGrammar: ; 105e5c
; store move grammar type in wd265

	push bc
; c = move id
	ld a, [wd265]
	ld c, a
	ld b, $0

; read grammar table
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp $ff
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at $00
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wd265 now contains move grammar
	ld a, b
	ld [wd265], a

; we're done
	pop bc
	ret
; 105e7a

MoveGrammar: ; 105e7a
; made redundant in localization
; each move is given an identifier for what usedmovetext to use (0-4):

; 0
	db SWORDS_DANCE
	db GROWTH
	db STRENGTH
	db HARDEN
	db MINIMIZE
	db SMOKESCREEN
	db WITHDRAW
	db DEFENSE_CURL
	db EGG_BOMB
	db SMOG
	db BONE_CLUB
	db FLASH
	db SPLASH
	db ACID_ARMOR
	db BONEMERANG
	db REST
	db SHARPEN
	db SUBSTITUTE
	db MIND_READER
	db SNORE
	db PROTECT
	db SPIKES
	db ENDURE
	db ROLLOUT
	db SWAGGER
	db SLEEP_TALK
	db HIDDEN_POWER
	db PSYCH_UP
	db EXTREMESPEED
	db 0 ; end set

; 1
	db RECOVER
	db TELEPORT
	db BIDE
	db SELFDESTRUCT
	db AMNESIA
	db FLAIL
	db 0 ; end set

; 2
	db MEDITATE
	db AGILITY
	db MIMIC
	db DOUBLE_TEAM
	db BARRAGE
	db TRANSFORM
	db STRUGGLE
	db SCARY_FACE
	db 0 ; end set

; 3
	db POUND
	db SCRATCH
	db VICEGRIP
	db WING_ATTACK
	db FLY
	db BIND
	db SLAM
	db HORN_ATTACK
	db WRAP
	db THRASH
	db TAIL_WHIP
	db LEER
	db BITE
	db GROWL
	db ROAR
	db SING
	db PECK
	db ABSORB
	db STRING_SHOT
	db EARTHQUAKE
	db FISSURE
	db DIG
	db TOXIC
	db SCREECH
	db METRONOME
	db LICK
	db CLAMP
	db CONSTRICT
	db POISON_GAS
	db BUBBLE
	db SLASH
	db SPIDER_WEB
	db NIGHTMARE
	db CURSE
	db FORESIGHT
	db CHARM
	db ATTRACT
	db ROCK_SMASH
	db 0 ; end set

; all other moves = 4
	db $ff ; end
; 105ed0


UpdateUsedMoves: ; 105ed0
; append move a to PlayerUsedMoves unless it has already been used

	push bc
; start of list
	ld hl, PlayerUsedMoves
; get move id
	ld b, a
; next count
	ld c, NUM_MOVES

.loop
; get move from the list
	ld a, [hli]
; not used yet?
	and a
	jr z, .add
; already used?
	cp b
	jr z, .quit
; next byte
	dec c
	jr nz, .loop

; if the list is full and the move hasn't already been used
; shift the list back one byte, deleting the first move used
; this can occur with struggle or a new learned move
	ld hl, PlayerUsedMoves + 1
; 1 = 2
	ld a, [hld]
	ld [hli], a
; 2 = 3
	inc hl
	ld a, [hld]
	ld [hli], a
; 3 = 4
	inc hl
	ld a, [hld]
	ld [hl], a
; 4 = new move
	ld a, b
	ld [PlayerUsedMoves + 3], a
	jr .quit

.add
; go back to the byte we just inced from
	dec hl
; add the new move
	ld [hl], b

.quit
; list updated
	pop bc
	ret
; 105ef6

INCLUDE "misc/mobile_41.asm"

INCLUDE "misc/mobile_42.asm"


SECTION "Intro Logo", ROMX, BANK[$42]

IntroLogoGFX: ; 109407
INCBIN "gfx/intro/logo.2bpp.lz"
; 109847


INCLUDE "misc/unused_title.asm"


INCLUDE "engine/title.asm"


INCLUDE "misc/mobile_45.asm"
INCLUDE "misc/mobile_46.asm"

SECTION "bank47", ROMX, BANK[$47]

INCLUDE "misc/battle_tower_47.asm"

SECTION "bank5B", ROMX, BANK[$5B]

INCLUDE "misc/mobile_5b.asm"

SECTION "bank5C", ROMX, BANK[$5C]

INCLUDE "misc/mobile_5c.asm"

SECTION "bank5D", ROMX, BANK[$5D]

INCLUDE "text/phone/extra3.asm"


SECTION "bank5E", ROMX, BANK[$5E]

_UpdateBattleHUDs:
	callba DrawPlayerHUD
	ld hl, PlayerHPPal
	call SetHPPal
	callba DrawEnemyHUD
	ld hl, EnemyHPPal
	call SetHPPal
	callba FinishBattleAnim
	ret
; 17801f (5e:401f)


INCLUDE "misc/mobile_5f.asm"


SECTION "Common Text 1", ROMX, BANK[$6C]

INCLUDE "text/common.asm"
INCLUDE "text/phone/jack_overworld.asm"
INCLUDE "text/phone/beverly_overworld.asm"
INCLUDE "text/phone/huey_overworld.asm"
INCLUDE "text/phone/gaven_overworld.asm"
INCLUDE "text/phone/beth_overworld.asm"
INCLUDE "text/phone/jose_overworld.asm"
INCLUDE "text/phone/reena_overworld.asm"
INCLUDE "text/phone/joey_overworld.asm"
INCLUDE "text/phone/wade_overworld.asm"
INCLUDE "text/phone/ralph_overworld.asm"
INCLUDE "text/phone/liz_overworld.asm"

SECTION "bank6D", ROMX, BANK[$6D]

INCLUDE "text/phone/mom.asm"
INCLUDE "text/phone/bill.asm"
INCLUDE "text/phone/elm.asm"
INCLUDE "text/phone/trainers1.asm"



SECTION "Common Text 2", ROMX, BANK[$6F]

INCLUDE "text/common_2.asm"


SECTION "Common Text 3", ROMX, BANK[$70]

INCLUDE "text/common_3.asm"


SECTION "Common Text 4", ROMX, BANK[$71]

INCLUDE "text/common_4.asm"


SECTION "bank72", ROMX, BANK[$72]

ItemNames::
INCLUDE "items/item_names.asm"

INCLUDE "items/item_descriptions.asm"

MoveNames::
INCLUDE "battle/move_names.asm"

INCLUDE "engine/landmarks.asm"


SECTION "bank75", ROMX, BANK[$75]


SECTION "bank76", ROMX, BANK[$76]


SECTION "bank77", ROMX, BANK[$77]

UnownFont: ; 1dc000
INCBIN "gfx/misc/unown_font.2bpp"
; 1dc1b0

Function1dc1b0: ; 1dc1b0
	hlcoord 0, 0
	ld de, wca90
	ld bc, 17 * SCREEN_WIDTH
	call CopyBytes
	ld hl, wcab5
	ld a, $62
	ld [hli], a
	inc a
	ld [hl], a
	ld hl, wcac9
	ld a, $64
	ld [hli], a
	inc a
	ld [hl], a
	ld hl, wcb45
	ld a, $7f
	ld [hli], a
	ld [hl], a
	ld hl, wcb59
	ld a, $61
	ld [hli], a
	ld [hl], a
	ld hl, wcb6e
	lb bc, 5, 18
	call ClearBox
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wd265]
	ld b, a
	ld c, $1
	callba Function44355
	pop af
	ld a, b
	ld hl, wcb6d
	call nz, FarString
	ld hl, wcaa3
	ld [hl], $35
	ld de, SCREEN_WIDTH
	add hl, de
	ld b, $f
.asm_1dc20a
	ld [hl], $37
	add hl, de
	dec b
	jr nz, .asm_1dc20a
	ld [hl], $3a
	ret
; 1dc213

Function1dc213: ; 1dc213
	ld hl, wca90
	ld bc, $a0
	ld a, " "
	call ByteFill
	ld hl, wca90
	ld a, $36
	ld b, $6
	call Function1dc26a
	ld hl, wcaa3
	ld a, $37
	ld b, $6
	call Function1dc26a
	ld hl, wcb08
	ld [hl], $38
	inc hl
	ld a, $39
	ld bc, SCREEN_HEIGHT
	call ByteFill
	ld [hl], $3a
	ld hl, wcb1c
	ld bc, SCREEN_WIDTH
	ld a, $32
	call ByteFill
	ld a, [wd265]
	dec a
	call CheckCaughtMon
	push af
	ld a, [wd265]
	ld b, a
	ld c, $2
	callba Function44355
	pop af
	ld hl, wcaa5
	ld a, b
	call nz, FarString
	ret
; 1dc26a

Function1dc26a: ; 1dc26a
	push de
	ld de, SCREEN_WIDTH
.asm_1dc26e
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_1dc26e
	pop de
	ret
; 1dc275

GBPrinterStrings:
String_1dc275: db "@"
String_1dc276: next " CHECKING LINK...@"
String_1dc289: next "  TRANSMITTING...@"
String_1dc29c: next "    PRINTING...@"
String_1dc2ad:
	db   " Printer Error 1"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
String_1dc2e2:
	db   " Printer Error 2"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
String_1dc317:
	db   " Printer Error 3"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
String_1dc34c:
	db   " Printer Error 4"
	next ""
	next "Check the Game Boy"
	next "Printer Manual."
	db   "@"
; 1dc381

Function1dc381: ; 1dc381
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call LoadFontsBattleExtra

	ld de, MobileHPIcon
	ld hl, VTiles2 tile $71
	lb bc, BANK(MobileHPIcon), 1
	call Request1bpp

	ld de, MobileLvIcon
	ld hl, VTiles2 tile $6e
	lb bc, BANK(MobileLvIcon), 1
	call Request1bpp

	ld de, ShinyIcon
	ld hl, VTiles2 tile $3f
	lb bc, BANK(ShinyIcon), 1
	call Get2bpp

	xor a
	ld [MonType], a
	callba CopyPkmnToTempMon
	hlcoord 0, 7
	ld b, 9
	ld c, 18
	call TextBox
	hlcoord 8, 2
	ld a, [TempMonLevel]
	call Function383d
	hlcoord 12, 2
	ld [hl], "◀" ; Filled left triangle
	inc hl
	ld de, TempMonMaxHP
	lb bc, 2, 3
	call PrintNum
	ld a, [CurPartySpecies]
	ld [wd265], a
	ld [CurSpecies], a
	ld hl, PartyMonNicknames
	call Function1dc50e
	hlcoord 8, 4
	call PlaceString
	hlcoord 9, 6
	ld [hl], "/"
	call GetPokemonName
	hlcoord 10, 6
	call PlaceString
	hlcoord 8, 0
	ld [hl], "№"
	inc hl
	ld [hl], "."
	inc hl
	ld de, wd265
	lb bc, PRINTNUM_LEADINGZEROS | 1, 3
	call PrintNum
	hlcoord 1, 9
	ld de, String1dc550
	call PlaceString
	ld hl, PartyMonOT
	call Function1dc50e
	hlcoord 4, 9
	call PlaceString
	hlcoord 1, 11
	ld de, String1dc559
	call PlaceString
	hlcoord 4, 11
	ld de, TempMonID
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	hlcoord 1, 14
	ld de, String1dc554
	call PlaceString
	hlcoord 7, 14
	ld a, [TempMonMoves + 0]
	call Function1dc51a
	call Function1dc52c
	ld hl, TempMonDVs
	predef GetUnownLetter
	ld hl, wc2c6
	xor a
	ld [hl], a
	ld a, [CurPartySpecies]
	cp UNOWN
	jr z, .asm_1dc469
	inc [hl]

.asm_1dc469
	hlcoord 0, 0
	call _PrepMonFrontpic
	call WaitBGMap
	ld b, SCGB_03
	call GetSGBLayout
	call SetPalettes
	ret
; 1dc47b

Function1dc47b: ; 1dc47b
	call ClearBGPalettes
	call ClearTileMap
	call ClearSprites
	xor a
	ld [hBGMapMode], a
	call LoadFontsBattleExtra
	xor a
	ld [MonType], a
	callba CopyPkmnToTempMon
	hlcoord 0, 0
	ld b, 15
	ld c, 18
	call TextBox
	ld bc, SCREEN_WIDTH
	decoord 0, 0
	hlcoord 0, 1
	call CopyBytes
	hlcoord 7, 0
	ld a, [TempMonMoves + 1]
	call Function1dc51a
	hlcoord 7, 2
	ld a, [TempMonMoves + 2]
	call Function1dc51a
	hlcoord 7, 4
	ld a, [TempMonMoves + 3]
	call Function1dc51a
	hlcoord 7, 7
	ld de, String1dc55d
	call PlaceString
	hlcoord 16, 7
	ld de, TempMonAttack
	call .PrintTempMonStats
	hlcoord 16, 9
	ld de, TempMonDefense
	call .PrintTempMonStats
	hlcoord 16, 11
	ld de, TempMonSpclAtk
	call .PrintTempMonStats
	hlcoord 16, 13
	ld de, TempMonSpclDef
	call .PrintTempMonStats
	hlcoord 16, 15
	ld de, TempMonSpeed
	call .PrintTempMonStats
	call WaitBGMap
	ld b, SCGB_03
	call GetSGBLayout
	call SetPalettes
	ret
; 1dc507

.PrintTempMonStats: ; 1dc507
	lb bc, 2, 3
	call PrintNum
	ret
; 1dc50e

Function1dc50e: ; 1dc50e
	ld bc, NAME_LENGTH
	ld a, [CurPartyMon]
	call AddNTimes
	ld e, l
	ld d, h
	ret
; 1dc51a

Function1dc51a: ; 1dc51a
	and a
	jr z, .no_move

	ld [wd265], a
	call GetMoveName
	jr .got_string

.no_move
	ld de, String1dc584

.got_string
	call PlaceString
	ret
; 1dc52c

Function1dc52c: ; 1dc52c
	callba GetGender
	ld a, " "
	jr c, .got_gender
	ld a, "♂"
	jr nz, .got_gender
	ld a, "♀"

.got_gender
	hlcoord 17, 2
	ld [hl], a
	ld bc, TempMonDVs
	callba CheckShininess
	ret nc
	hlcoord 18, 2
	ld [hl], "<SHINY>"
	ret
; 1dc550

String1dc550: ; 1dc550
	db "OT/@"

String1dc554: ; 1dc554
	db "MOVE@"

String1dc559: ; 1dc559
	db "<ID>№.@"

String1dc55d: ; 1dc55d
	db   "ATTACK"
	next "DEFENSE"
	next "SPCL.ATK"
	next "SPCL.DEF"
	next "SPEED"
	db   "@"

String1dc584: ; 1dc584
	db "------------@"
; 1dc591

MobileHPIcon: ; 1dc591
INCBIN "gfx/mobile/hp.1bpp"

MobileLvIcon: ; 1dc599
INCBIN "gfx/mobile/lv.1bpp"



SECTION "Tileset Data 7", ROMX, BANK[TILESETS_7]

INCLUDE "tilesets/data_7.asm"



SECTION "bank77_2", ROMX, BANK[$77]

Function1dd6a9: ; 1dd6a9
	ld a, b
	ld b, c
	ld c, a
	push bc
	push de
	ld hl, [sp+$2]
	ld d, h
	ld e, l
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 2, 5
	call PrintNum
	pop bc
	ret
; 1dd6bb

PrintHoursMins ; 1dd6bb (77:56bb)
; Hours in b, minutes in c
	ld a, b
	cp 12
	push af
	jr c, .AM
	jr z, .PM
	sub 12
	jr .PM
.AM
	or a
	jr nz, .PM
	ld a, 12
.PM
	ld b, a
; Crazy stuff happening with the stack
	push bc
	ld hl, [sp+$1]
	push de
	push hl
	pop de
	pop hl
	ld [hl], " "
	lb bc, 1, 2
	call PrintNum
	ld [hl], ":"
	inc hl
	ld d, h
	ld e, l
	ld hl, [sp+$0]
	push de
	push hl
	pop de
	pop hl
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	call PrintNum
	pop bc
	ld de, String_AM
	pop af
	jr c, .place_am_pm
	ld de, String_PM
.place_am_pm
	inc hl
	call PlaceString
	ret
; 1dd6fc (77:56fc)

String_AM: db "AM@" ; 1dd6fc
String_PM: db "PM@" ; 1dd6ff
; 1dd702


INCLUDE "engine/diploma.asm"


Function1ddf1c: ; 1ddf1c
	ld hl, LZ_1ddf33
	ld de, VTiles2 tile $31
	call Decompress
	ret
; 1ddf26

Function1ddf26: ; 1ddf26 (77:5f26)
	ld hl, LZ_1ddf33
	ld de, VTiles2 tile $31
	lb bc, BANK(LZ_1ddf33), $3a
	call DecompressRequest2bpp
	ret
; 1ddf33 (77:5f33)

LZ_1ddf33: ; 1ddf33
INCBIN "gfx/unknown/1ddf33.2bpp.lz"
; 1de0d7

Function1de0d7: ; 1de0d7
	ld hl, LZ_1de0e1
	ld de, sScratch
	call Decompress
	ret
; 1de0e1

LZ_1de0e1: ; 1de0e1
INCBIN "gfx/unknown/1de0e1.2bpp.lz"
; 1de171

Function1de171: ; 1de171 (77:6171)
	ld a, $32
	hlcoord 0, 17
	ld bc, 12
	call ByteFill
	hlcoord 0, 1
	lb bc, 15, 11
	call ClearBox
	ld a, $34
	hlcoord 0, 0
	ld bc, $b
	call ByteFill
	ld a, $39
	hlcoord 0, 16
	ld bc, $b
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 16
	ld [hl], $40
	ld a, [wc7d4]
	cp $1
	jr z, .asm_1de1bf
	hlcoord 11, 0
	ld [hl], $50
	ld a, $51
	hlcoord 11, 1
	ld b, $f
	call Function1de27f
	ld [hl], $52
	jr .asm_1de1d0
.asm_1de1bf
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, $f
	call Function1de27f
	ld [hl], $68
.asm_1de1d0
	ret

Function1de1d1: ; 1de1d1 (77:61d1)
	ld a, $34
	hlcoord 0, 0
	ld bc, $b
	call ByteFill
	ld a, $39
	hlcoord 0, 10
	ld bc, $b
	call ByteFill
	hlcoord 5, 0
	ld [hl], $3f
	hlcoord 5, 10
	ld [hl], $40
	hlcoord 11, 0
	ld [hl], $66
	ld a, $67
	hlcoord 11, 1
	ld b, $9
	call Function1de27f
	ld [hl], $68
	ld a, $34
	hlcoord 0, 11
	ld bc, $b
	call ByteFill
	ld a, $39
	hlcoord 0, 17
	ld bc, $b
	call ByteFill
	hlcoord 11, 11
	ld [hl], $66
	ld a, $67
	hlcoord 11, 12
	ld b, $5
	call Function1de27f
	ld [hl], $68
	hlcoord 0, 12
	lb bc, 5, 11
	call ClearBox
	ld de, String_1de23c
	hlcoord 0, 12
	call PlaceString
	ret
; 1de23c (77:623c)

String_1de23c: ; 1de23c
; At a glance, this is less coherent in the Japanese charset.
	db "ESULTS"
	db $4e
	db $4e
	db "D!@"
; 1de247

Function1de247: ; 1de247
	ld a, [hBGMapAddress]
	ld l, a
	ld a, [hBGMapAddress + 1]
	ld h, a
	push hl
	inc hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	hlcoord 19, 0
	ld [hl], $66
	hlcoord 19, 1
	ld a, $67
	ld b, $f
	call Function1de27f
	ld [hl], $68
	hlcoord 19, 17
	ld [hl], $3c
	xor a
	ld b, $12
	hlcoord 19, 0, AttrMap
	call Function1de27f
	call Function3200
	pop hl
	ld a, l
	ld [hBGMapAddress], a
	ld a, h
	ld [hBGMapAddress + 1], a
	ret
; 1de27f

Function1de27f: ; 1de27f
	push de
	ld de, SCREEN_WIDTH
.asm_1de283
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_1de283
	pop de
	ret
; 1de28a



_DudeAutoInput_A:: ; 1de28a
	ld hl, DudeAutoInput_A
	jr _DudeAutoInput
; 1de28f

_DudeAutoInput_RightA: ; 1de28f
	ld hl, DudeAutoInput_RightA
	jr _DudeAutoInput
; 1de294

_DudeAutoInput_DownA: ; 1de294
	ld hl, DudeAutoInput_DownA
	jr _DudeAutoInput
; 1de299

_DudeAutoInput: ; 1de299
	ld a, BANK(DudeAutoInputs)
	call StartAutoInput
	ret
; 1de29f


DudeAutoInputs:

DudeAutoInput_A: ; 1de29f
	db NO_INPUT, $50
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2a5

DudeAutoInput_RightA: ; 1de2a5
	db NO_INPUT, $08
	db D_RIGHT,  $00
	db NO_INPUT, $08
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2af

DudeAutoInput_DownA: ; 1de2af
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db D_DOWN,   $00
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db NO_INPUT, $fe
	db A_BUTTON, $00
	db NO_INPUT, $ff ; end
; 1de2c5


Function1de2c5: ; 1de2c5
	ld hl, StringBuffer1
.asm_1de2c8
	ld a, [hl]
	cp $50
	jr z, .asm_1de2da
	cp $25
	jr z, .asm_1de2d8
	cp $1f
	jr z, .asm_1de2d8
	inc hl
	jr .asm_1de2c8

.asm_1de2d8
	ld [hl], $22

.asm_1de2da
	ld de, StringBuffer1
	hlcoord 9, 0
	call PlaceString
	ret
; 1de2e4

PokegearGFX: ; 1de2e4
INCBIN "gfx/misc/pokegear.2bpp.lz"
; 1de5c8

Function1de5c8: ; 1de5c8
	ld c, $0
	ld hl, $29
	add hl, de
	ld a, [hli]
	cp $84
	ret nz
	ld a, [hli]
	inc c
	cp $85
	ret z
	inc c
	cp $86
	ret z
	inc c
	cp $88
	ret z
	inc c
	cp $92
	ret z
	ld c, $0
	ret
; 1de5e6

; The regular font.
GFX_1de5e6: ; 1de5e6
INCBIN "gfx/unknown/1de5e6.2bpp"

; An extended font.
GFX_1de9e6: ; 1de9e6
INCBIN "gfx/unknown/1de9e6.2bpp"

; An even more extended font.
GFX_1dede6: ; 1dede6
INCBIN "gfx/unknown/1dede6.2bpp"

Function1df1e6: ; 1df1e6
	ld b, $21
	ld h, d
	ld l, e
.asm_1df1ea
	ld a, [hl]
	cp $dc
	jr nz, .asm_1df1f3
	ld a, $d4
	jr .asm_1df1fd

.asm_1df1f3
	sub $d4
	jr c, .asm_1df1fe
	cp $3
	jr nc, .asm_1df1fe
	add $cd

.asm_1df1fd
	ld [hl], a

.asm_1df1fe
	inc hl
	dec b
	jr nz, .asm_1df1ea
	ret
; 1df203

Function1df203: ; 1df203
	ld b, $21
	ld h, d
	ld l, e
.asm_1df207
	ld a, [hl]
	cp $d4
	jr nz, .asm_1df210
	ld a, $dc
	jr .asm_1df21a

.asm_1df210
	sub $cd
	jr c, .asm_1df21b
	cp $3
	jr nc, .asm_1df21b
	add $d4

.asm_1df21a
	ld [hl], a

.asm_1df21b
	inc hl
	dec b
	jr nz, .asm_1df207
	ret
; 1df220

Function1df220: ; 1df220
	ld b, $21
	ld h, d
	ld l, e
.asm_1df224
	ld a, [hl]
	and $f0
	cp $d0
	jr nz, .asm_1df233
	ld a, [hl]
	add $8
	and $f
	or $d0
	ld [hl], a

.asm_1df233
	inc hl
	dec b
	jr nz, .asm_1df224
	ret
; 1df238


SECTION "Tileset Data 8", ROMX, BANK[TILESETS_8]

INCLUDE "tilesets/data_8.asm"


SECTION "bank79", ROMX, BANK[$79]


SECTION "bank7A", ROMX, BANK[$7A]


SECTION "bank7B", ROMX, BANK[$7B]

INCLUDE "text/battle_tower.asm"


SECTION "bank7C", ROMX, BANK[$7C]

INCLUDE "data/battle_tower_2.asm"


SECTION "bank7D", ROMX, BANK[$7D]

	db $cc, $6b, $1e ; XXX

Function1f4003: ; 1f4003
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f4018
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f4018

Unknown_1f4018:
INCBIN "unknown/1f4018.bin"

Function1f4dbe: ; 1f4dbe
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f4dd3
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f4dd3

Unknown_1f4dd3:
INCBIN "unknown/1f4dd3.bin"

Function1f5d9f: ; 1f5d9f
	ld a, $6
	call GetSRAMBank
	ld hl, Unknown_1f5db4
	ld de, $a000
	ld bc, $1000
	call CopyBytes
	call CloseSRAM
	ret
; 1f5db4

Unknown_1f5db4:
INCBIN "unknown/1f5db4.bin"


SECTION "bank7E", ROMX, BANK[$7E]

INCLUDE "data/battle_tower.asm"
INCLUDE "data/odd_eggs.asm"


SECTION "bank7F", ROMX, BANK[$7F]


SECTION "stadium2", ROMX[$8000-$220], BANK[$7F]

IF DEF(CRYSTAL11)
INCBIN "misc/stadium2_2.bin"
ELSE
INCBIN "misc/stadium2_1.bin"
ENDC


