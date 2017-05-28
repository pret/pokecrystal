_MainMenu: ; 5ae8
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_MAIN_MENU
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	callba MainMenu
	jp StartTitleScreen
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

.Days: ; 5b1c
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"
; 5b40

.Day: ; 5b40
	db "DAY@"
; 5b44

NewGame_ClearTileMapEtc: ; 5b44
	xor a
	ld [hMapAnims], a
	call ClearTileMap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
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
	ld [wMonStatusFlags], a
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
	callba Mobile_AlwaysReturnNotCarry ; some mobile stuff
	jr c, .ok
	callba InitGender
	ret

.ok
	ld c, 0
	callba InitMobileProfile ; mobile
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
	call .InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call GetSRAMBank
	ld hl, sBoxCount
	call .InitList
	call CloseSRAM

	ld hl, NumItems
	call .InitList

	ld hl, NumKeyItems
	call .InitList

	ld hl, NumBalls
	call .InitList

	ld hl, PCItems
	call .InitList

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
	ld [wWhichMomItem], a

	ld hl, MomItemTriggerBalance
	ld [hl], 2300 / $10000
	inc hl
	ld [hl], 2300 / $100 % $100
	inc hl
	ld [hl], 2300 % $100

	call InitializeNPCNames

	callba InitDecorations

	callba DeletePartyMonMail

	callba DeleteMobileEventIndex

	call ResetGameTime
	ret
; 5ca1

.InitList: ; 5ca1
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

.Box:
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

.Ralph: ; 5ce3
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

.Copy:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.Rival:  db "???@"
.Red:    db "RED@"
.Green:  db "GREEN@"
.Mom:    db "MOM@"
; 5d23

InitializeWorld: ; 5d23
	call ShrinkPlayer
	callba SpawnPlayer
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
	callba _LoadData
	call LoadStandardMenuDataHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ld [hBGMapMode], a
	ld c, 20
	call DelayFrames
	call ConfirmContinue
	jr nc, .Check1Pass
	call CloseWindow
	jr .FailToLoad

.Check1Pass:
	call Continue_CheckRTC_RestartClock
	jr nc, .Check2Pass
	call CloseWindow
	jr .FailToLoad

.Check2Pass:
	ld a, $8
	ld [MusicFade], a
	ld a, MUSIC_NONE % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_NONE / $100
	ld [MusicFadeIDHi], a
	call ClearBGPalettes
	call Continue_MobileAdapterMenu
	call CloseWindow
	call ClearTileMap
	ld c, 20
	call DelayFrames
	callba JumpRoamMons
	callba MysteryGift_CopyReceivedDecosToPC ; Mystery Gift
	callba Function140ae ; time-related
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ld [hMapEntryMethod], a
	jp FinishContinueFunction

.FailToLoad:
	ret

.SpawnAfterE4:
	ld a, SPAWN_NEW_BARK
	ld [DefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction
; 5de2

SpawnAfterRed: ; 5de2
	ld a, SPAWN_MT_SILVER
	ld [DefaultSpawnpoint], a
; 5de7

PostCreditsSpawn: ; 5de7
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ld [hMapEntryMethod], a
	ret
; 5df0

Continue_MobileAdapterMenu: ; 5df0
	callba Mobile_AlwaysReturnNotCarry ; mobile check
	ret nc

; the rest of this stuff is never reached because
; the previous function returns with carry not set
	ld hl, wd479
	bit 1, [hl]
	ret nz
	ld a, 5
	ld [MusicFade], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU % $100
	ld [MusicFadeIDLo], a
	ld a, MUSIC_MOBILE_ADAPTER_MENU / $100
	ld [MusicFadeIDHi], a
	ld c, 20
	call DelayFrames
	ld c, $1
	callba InitMobileProfile ; mobile
	callba _SaveData
	ld a, 8
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
	bit A_BUTTON_F, [hl]
	jr nz, .PressA
	bit B_BUTTON_F, [hl]
	jr z, .loop
	scf
	ret

.PressA:
	ret
; 5e48

Continue_CheckRTC_RestartClock: ; 5e48
	call CheckRTCStatus
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
	ld [wDontPlayMapMusicOnReload], a
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

.AfterRed:
	call SpawnAfterRed
	jr .loop
; 5e85

DisplaySaveInfoOnContinue: ; 5e85
	call CheckRTCStatus
	and %10000000
	jr z, .clock_ok
	lb de, 4, 8
	call DisplayContinueDataWithRTCError
	ret

.clock_ok
	lb de, 4, 8
	call DisplayNormalContinueData
	ret
; 5e9a

DisplaySaveInfoOnSave: ; 5e9a
	lb de, 4, 0
	jr DisplayNormalContinueData
; 5e9f

DisplayNormalContinueData: ; 5e9f
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret
; 5eaf

DisplayContinueDataWithRTCError: ; 5eaf
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret
; 5ebf

Continue_LoadMenuHeader: ; 5ebf
	xor a
	ld [hBGMapMode], a
	ld hl, .MenuDataHeader_Dex
	ld a, [StatusFlags]
	bit 0, a ; pokedex
	jr nz, .pokedex_header
	ld hl, .MenuDataHeader_NoDex

.pokedex_header
	call _OffsetMenuDataHeader
	call MenuBox
	call PlaceVerticalMenuItems
	ret
; 5ed9

.MenuDataHeader_Dex: ; 5ed9
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_Dex
	db 1 ; default option
; 5ee1

.MenuData2_Dex: ; 5ee1
	db $00 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"
; 5efb

.MenuDataHeader_NoDex: ; 5efb
	db $40 ; flags
	db 00, 00 ; start coords
	db 09, 15 ; end coords
	dw .MenuData2_NoDex
	db 1 ; default option
; 5f03

.MenuData2_NoDex: ; 5f03
	db $00 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"
; 5f1c


Continue_DisplayBadgesDexPlayerName: ; 5f1c
	call MenuBoxCoord2Tile
	push hl
	decoord 13, 4, 0
	add hl, de
	call Continue_DisplayBadgeCount
	pop hl
	push hl
	decoord 12, 6, 0
	add hl, de
	call Continue_DisplayPokedexNumCaught
	pop hl
	push hl
	decoord 8, 2, 0
	add hl, de
	ld de, .Player
	call PlaceString
	pop hl
	ret

.Player:
	db "<PLAYER>@"
; 5f40

Continue_PrintGameTime: ; 5f40
	decoord 9, 8, 0
	add hl, de
	call Continue_DisplayGameTime
	ret
; 5f48

Continue_UnknownGameTime: ; 5f48
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	call PlaceString
	ret

.three_question_marks
	db " ???@"
; 5f58

Continue_DisplayBadgeCount: ; 5f58
	push hl
	ld hl, JohtoBadges
	ld b, 2
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 2
	jp PrintNum
; 5f6b

Continue_DisplayPokedexNumCaught: ; 5f6b
	ld a, [StatusFlags]
	bit 0, a ; Pokedex
	ret z
	push hl
	ld hl, PokedexCaught
IF NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
ELSE
	ld b, NUM_POKEMON / 8
ENDC
	call CountSetBits
	pop hl
	ld de, wd265
	lb bc, 1, 3
	jp PrintNum
; 5f84

Continue_DisplayGameTime: ; 5f84
	ld de, GameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], "<COLON>"
	inc hl
	ld de, GameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum
; 5f99


OakSpeech: ; 0x5f99
	callba InitClock
	call RotateFourPalettesLeft
	call ClearTileMap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight
	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText1
	call PrintText
	call RotateThreePalettesRight
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

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText
	ld hl, OakText4
	call PrintText
	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	ld a, POKEMON_PROF
	ld [TrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText5
	call PrintText
	call RotateThreePalettesRight
	call ClearTileMap

	xor a
	ld [CurPartySpecies], a
	callba DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

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
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StorePlayerName
	callba ApplyMonOrTrainerPals
	callba MovePlayerPicLeft
	ret

.NewName:
	ld b, 1
	ld de, PlayerName
	callba NamingScreen

	call RotateThreePalettesRight
	call ClearTileMap

	call LoadFontsExtra
	call WaitBGMap

	xor a
	ld [CurPartySpecies], a
	callba DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft

	ld hl, PlayerName
	ld de, .Chris
	ld a, [PlayerGender]
	bit 0, a
	jr z, .Male
	ld de, .Kris
.Male:
	call InitName
	ret

.Chris:
	db "CHRIS@@@@@@"
.Kris:
	db "KRIS@@@@@@@"
; 60e9

Function60e9: ; Unreferenced
	call LoadMenuDataHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call CloseWindow
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

	call RotateThreePalettesRight
	call ClearTileMap
	ret
; 616a

Intro_RotatePalettesLeftFrontpic: ; 616a
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
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret
; 61b4

ShrinkFrame: ; 61b4
	ld de, VTiles2
	ld c, $31
	predef DecompressPredef
	xor a
	ld [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
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
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3
; 620b


CrystalIntroSequence: ; 620b
	callab Copyright_GFPresents
	jr c, StartTitleScreen
	callba CrystalIntro

StartTitleScreen: ; 6219
	ld a, [rSVBK]
	push af
	ld a, $5
	ld [rSVBK], a

	call .TitleScreen
	call DelayFrame
.loop
	call RunTitleScreen
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

	pop af
	ld [rSVBK], a

	ld hl, rLCDC
	res 2, [hl]
	call ClearScreen
	call WaitBGMap2
	xor a
	ld [hLCDCPointer], a
	ld [hSCX], a
	ld [hSCY], a
	ld a, $7
	ld [hWX], a
	ld a, $90
	ld [hWY], a
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wcf64]
	cp $5
	jr c, .ok
	xor a
.ok
	ld e, a
	ld d, 0
	ld hl, .dw
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]
; 626a

.dw
	dw _MainMenu
	dw DeleteSaveData
	dw CrystalIntroSequence
	dw CrystalIntroSequence
	dw ResetClock
; 6274


.TitleScreen: ; 6274
	callba _TitleScreen
	ret
; 627b

RunTitleScreen: ; 627b
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
	add hl, de
	add hl, de
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

.NextScene: ; Unreferenced
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
	xor $ff
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
	ld [hLCDCPointer], a

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
	ld de, 73 * 60 + 36
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
	ld a, [hClockResetTrigger]
	cp $34
	jr z, .check_clock_reset

	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr nz, .check_start

	ld a, $34
	ld [hClockResetTrigger], a
	jr .check_start

; Keep Select pressed, and hold Left + Up.
; Then let go of Select.
.check_clock_reset
	bit SELECT_F, [hl]
	jr nz, .check_start

	xor a
	ld [hClockResetTrigger], a

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

DeleteSaveData: ; 6389
	callba _DeleteSaveData
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
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc ; over-the-top compicated way to load wc3ae into hl
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, Data63ca
	add hl, de
	; If bit 2 of [wcf65] is set, get the second dw; else, get the first dw
	ld a, [wcf65]
	and %00000100
	srl a
	srl a
	ld e, a
	ld d, 0
	add hl, de
	add hl, de
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
	db 11 * 8 + 4, 10 * 8,  0 * 8,      0 * 8
	db 11 * 8 + 4, 13 * 8, 11 * 8 + 4, 11 * 8
	db 11 * 8 + 4, 13 * 8, 11 * 8 + 4, 15 * 8
	db 11 * 8 + 4, 17 * 8, 11 * 8 + 4, 15 * 8
	db  0 * 8,      0 * 8, 11 * 8 + 4, 15 * 8
	db  0 * 8,      0 * 8, 11 * 8 + 4, 11 * 8
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
	db   $60, $61, $62, $63, $64, $65, $66
	db   $67, $68, $69, $6a, $6b, $6c

	; ©1995-2001 Creatures inc.
	next $60, $61, $62, $63, $64, $65, $66
	db   $6d, $6e, $6f, $70, $71, $72, $7a, $7b, $7c

	; ©1995-2001 GAME FREAK inc.
	next $60, $61, $62, $63, $64, $65, $66
	db   $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c

	db "@"
; 642e

GameInit:: ; 642e
	callba TryLoadSaveData
	call ClearWindowData
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
	jp CrystalIntroSequence
; 6454
