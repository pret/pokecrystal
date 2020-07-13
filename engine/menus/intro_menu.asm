Intro_MainMenu:
	ld de, MUSIC_NONE
	call PlayMusic
	call DelayFrame
	ld de, MUSIC_MAIN_MENU
	ld a, e
	ld [wMapMusic], a
	call PlayMusic
	farcall MainMenu
	jp StartTitleScreen

; unused
	ret

PrintDayOfWeek:
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

.Days:
	db "SUN@"
	db "MON@"
	db "TUES@"
	db "WEDNES@"
	db "THURS@"
	db "FRI@"
	db "SATUR@"

.Day:
	db "DAY@"

NewGame_ClearTilemapEtc:
	xor a
	ldh [hMapAnims], a
	call ClearTilemap
	call LoadFontsExtra
	call LoadStandardFont
	call ClearWindowData
	ret

MysteryGift:
	call UpdateTime
	farcall DoMysteryGiftIfDayHasPassed
	farcall DoMysteryGift
	ret

Option:
	farcall _Option
	ret

NewGame:
	xor a
	ld [wDebugFlags], a
	call ResetWRAM
	call NewGame_ClearTilemapEtc
	call AreYouABoyOrAreYouAGirl
	call OakSpeech
	call InitializeWorld

	ld a, LANDMARK_NEW_BARK_TOWN
	ld [wPrevLandmark], a

	ld a, SPAWN_HOME
	ld [wDefaultSpawnpoint], a

	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

AreYouABoyOrAreYouAGirl:
	farcall Mobile_AlwaysReturnNotCarry ; mobile
	jr c, .ok
	farcall InitGender
	ret

.ok
	ld c, 0
	farcall InitMobileProfile ; mobile
	ret

if DEF(_DEBUG)
DebugRoom: ; unreferenced
	farcall _DebugRoom
	ret
endc

ResetWRAM:
	xor a
	ldh [hBGMapMode], a
	call _ResetWRAM
	ret

_ResetWRAM:
	ld hl, wVirtualOAM
	ld bc, wOptions - wVirtualOAM
	xor a
	call ByteFill

	ld hl, WRAM1_Begin
	ld bc, wGameData - WRAM1_Begin
	xor a
	call ByteFill

	ld hl, wGameData
	ld bc, wGameDataEnd - wGameData
	xor a
	call ByteFill

	ldh a, [rLY]
	ldh [hUnusedBackup], a
	call DelayFrame
	ldh a, [hRandomSub]
	ld [wPlayerID], a

	ldh a, [rLY]
	ldh [hUnusedBackup], a
	call DelayFrame
	ldh a, [hRandomAdd]
	ld [wPlayerID + 1], a

	call Random
	ld [wSecretID], a
	call DelayFrame
	call Random
	ld [wSecretID + 1], a

	ld hl, wPartyCount
	call .InitList

	xor a
	ld [wCurBox], a
	ld [wSavedAtLeastOnce], a

	call SetDefaultBoxNames

	ld a, BANK(sBoxCount)
	call OpenSRAM
	ld hl, sBoxCount
	call .InitList
	call CloseSRAM

	ld hl, wNumItems
	call .InitList

	ld hl, wNumKeyItems
	call .InitList

	ld hl, wNumBalls
	call .InitList

	ld hl, wNumPCItems
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
	call OpenSRAM
	ld hl, sMysteryGiftItem
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	call CloseSRAM

	call LoadOrRegenerateLuckyIDNumber
	call InitializeMagikarpHouse

	xor a
	ld [wMonType], a

	ld [wJohtoBadges], a
	ld [wKantoBadges], a

	ld [wCoins], a
	ld [wCoins + 1], a

if START_MONEY >= $10000
	ld a, HIGH(START_MONEY >> 8)
endc
	ld [wMoney], a
	ld a, HIGH(START_MONEY) ; mid
	ld [wMoney + 1], a
	ld a, LOW(START_MONEY)
	ld [wMoney + 2], a

	xor a
	ld [wWhichMomItem], a

	ld hl, wMomItemTriggerBalance
	ld [hl], HIGH(MOM_MONEY >> 8)
	inc hl
	ld [hl], HIGH(MOM_MONEY) ; mid
	inc hl
	ld [hl], LOW(MOM_MONEY)

	call InitializeNPCNames

	farcall InitDecorations

	farcall DeletePartyMonMail

	farcall DeleteMobileEventIndex

	call ResetGameTime
	ret

.InitList:
; Loads 0 in the count and -1 in the first item or mon slot.
	xor a
	ld [hli], a
	dec a
	ld [hl], a
	ret

SetDefaultBoxNames:
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

InitializeMagikarpHouse:
	ld hl, wBestMagikarpLengthFeet
	ld a, $3
	ld [hli], a
	ld a, $6
	ld [hli], a
	ld de, .Ralph
	call CopyName2
	ret

.Ralph:
	db "RALPH@"

InitializeNPCNames:
	ld hl, .Rival
	ld de, wRivalName
	call .Copy

	ld hl, .Mom
	ld de, wMomsName
	call .Copy

	ld hl, .Red
	ld de, wRedsName
	call .Copy

	ld hl, .Green
	ld de, wGreensName

.Copy:
	ld bc, NAME_LENGTH
	call CopyBytes
	ret

.Rival:  db "???@"
.Red:    db "RED@"
.Green:  db "GREEN@"
.Mom:    db "MOM@"

InitializeWorld:
	call ShrinkPlayer
	farcall SpawnPlayer
	farcall _InitializeStartDay
	ret

LoadOrRegenerateLuckyIDNumber:
	ld a, BANK(sLuckyIDNumber)
	call OpenSRAM
	ld a, [wCurDay]
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

Continue:
	farcall TryLoadSaveFile
	jr c, .FailToLoad
	farcall _LoadData
	call LoadStandardMenuHeader
	call DisplaySaveInfoOnContinue
	ld a, $1
	ldh [hBGMapMode], a
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
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	call ClearBGPalettes
	call Continue_MobileAdapterMenu
	call CloseWindow
	call ClearTilemap
	ld c, 20
	call DelayFrames
	farcall JumpRoamMons
	farcall MysteryGift_CopyReceivedDecosToPC
	farcall ClockContinue
	ld a, [wSpawnAfterChampion]
	cp SPAWN_LANCE
	jr z, .SpawnAfterE4
	ld a, MAPSETUP_CONTINUE
	ldh [hMapEntryMethod], a
	jp FinishContinueFunction

.FailToLoad:
	ret

.SpawnAfterE4:
	ld a, SPAWN_NEW_BARK
	ld [wDefaultSpawnpoint], a
	call PostCreditsSpawn
	jp FinishContinueFunction

SpawnAfterRed:
	ld a, SPAWN_MT_SILVER
	ld [wDefaultSpawnpoint], a

PostCreditsSpawn:
	xor a
	ld [wSpawnAfterChampion], a
	ld a, MAPSETUP_WARP
	ldh [hMapEntryMethod], a
	ret

Continue_MobileAdapterMenu:
	farcall Mobile_AlwaysReturnNotCarry ; mobile check
	ret nc

; the rest of this stuff is never reached because
; the previous function returns with carry not set
	ld hl, wd479
	bit 1, [hl]
	ret nz
	ld a, 5
	ld [wMusicFade], a
	ld a, LOW(MUSIC_MOBILE_ADAPTER_MENU)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_MOBILE_ADAPTER_MENU)
	ld [wMusicFadeID + 1], a
	ld c, 20
	call DelayFrames
	ld c, $1
	farcall InitMobileProfile ; mobile
	farcall _SaveData
	ld a, 8
	ld [wMusicFade], a
	ld a, LOW(MUSIC_NONE)
	ld [wMusicFadeID], a
	ld a, HIGH(MUSIC_NONE)
	ld [wMusicFadeID + 1], a
	ld c, 35
	call DelayFrames
	ret

ConfirmContinue:
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

Continue_CheckRTC_RestartClock:
	call CheckRTCStatus
	and %10000000 ; Day count exceeded 16383
	jr z, .pass
	farcall RestartClock
	ld a, c
	and a
	jr z, .pass
	scf
	ret

.pass
	xor a
	ret

FinishContinueFunction:
.loop
	xor a
	ld [wDontPlayMapMusicOnReload], a
	ld [wLinkMode], a
	ld hl, wGameTimerPause
	set GAMETIMERPAUSE_TIMER_PAUSED_F, [hl]
	res GAMETIMERPAUSE_MOBILE_7_F, [hl]
	ld hl, wEnteredMapFromContinue
	set 1, [hl]
	farcall OverworldLoop
	ld a, [wSpawnAfterChampion]
	cp SPAWN_RED
	jr z, .AfterRed
	jp Reset

.AfterRed:
	call SpawnAfterRed
	jr .loop

DisplaySaveInfoOnContinue:
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

DisplaySaveInfoOnSave:
	lb de, 4, 0
	jr DisplayNormalContinueData

DisplayNormalContinueData:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_PrintGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret

DisplayContinueDataWithRTCError:
	call Continue_LoadMenuHeader
	call Continue_DisplayBadgesDexPlayerName
	call Continue_UnknownGameTime
	call LoadFontsExtra
	call UpdateSprites
	ret

Continue_LoadMenuHeader:
	xor a
	ldh [hBGMapMode], a
	ld hl, .MenuHeader_Dex
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	jr nz, .show_menu
	ld hl, .MenuHeader_NoDex

.show_menu
	call _OffsetMenuHeader
	call MenuBox
	call PlaceVerticalMenuItems
	ret

.MenuHeader_Dex:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData_Dex
	db 1 ; default option

.MenuData_Dex:
	db 0 ; flags
	db 4 ; items
	db "PLAYER@"
	db "BADGES@"
	db "#DEX@"
	db "TIME@"

.MenuHeader_NoDex:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 0, 15, 9
	dw .MenuData_NoDex
	db 1 ; default option

.MenuData_NoDex:
	db 0 ; flags
	db 4 ; items
	db "PLAYER <PLAYER>@"
	db "BADGES@"
	db " @"
	db "TIME@"

Continue_DisplayBadgesDexPlayerName:
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

Continue_PrintGameTime:
	decoord 9, 8, 0
	add hl, de
	call Continue_DisplayGameTime
	ret

Continue_UnknownGameTime:
	decoord 9, 8, 0
	add hl, de
	ld de, .three_question_marks
	call PlaceString
	ret

.three_question_marks
	db " ???@"

Continue_DisplayBadgeCount:
	push hl
	ld hl, wJohtoBadges
	ld b, 2
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 2
	jp PrintNum

Continue_DisplayPokedexNumCaught:
	ld a, [wStatusFlags]
	bit STATUSFLAGS_POKEDEX_F, a
	ret z
	push hl
	ld hl, wPokedexCaught
if NUM_POKEMON % 8
	ld b, NUM_POKEMON / 8 + 1
else
	ld b, NUM_POKEMON / 8
endc
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 3
	jp PrintNum

Continue_DisplayGameTime:
	ld de, wGameTimeHours
	lb bc, 2, 3
	call PrintNum
	ld [hl], "<COLON>"
	inc hl
	ld de, wGameTimeMinutes
	lb bc, PRINTNUM_LEADINGZEROS | 1, 2
	jp PrintNum

OakSpeech:
	farcall InitClock
	call RotateFourPalettesLeft
	call ClearTilemap

	ld de, MUSIC_ROUTE_30
	call PlayMusic

	call RotateFourPalettesRight
	call RotateThreePalettesRight
	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText1
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	ld a, WOOPER
	ld [wCurSpecies], a
	ld [wCurPartySpecies], a
	call GetBaseData

	hlcoord 6, 4
	call PrepMonFrontpic

	xor a
	ld [wTempMonDVs], a
	ld [wTempMonDVs + 1], a

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_WipeInFrontpic

	ld hl, OakText2
	call PrintText
	ld hl, OakText4
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	xor a
	ld [wCurPartySpecies], a
	ld a, POKEMON_PROF
	ld [wTrainerClass], a
	call Intro_PrepTrainerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText5
	call PrintText
	call RotateThreePalettesRight
	call ClearTilemap

	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call Intro_RotatePalettesLeftFrontpic

	ld hl, OakText6
	call PrintText
	call NamePlayer
	ld hl, OakText7
	call PrintText
	ret

OakText1:
	text_far _OakText1
	text_end

OakText2:
	text_far _OakText2
	text_asm
	ld a, WOOPER
	call PlayMonCry
	call WaitSFX
	ld hl, OakText3
	ret

OakText3:
	text_far _OakText3
	text_end

OakText4:
	text_far _OakText4
	text_end

OakText5:
	text_far _OakText5
	text_end

OakText6:
	text_far _OakText6
	text_end

OakText7:
	text_far _OakText7
	text_end

NamePlayer:
	farcall MovePlayerPicRight
	farcall ShowPlayerNamingChoices
	ld a, [wMenuCursorY]
	dec a
	jr z, .NewName
	call StorePlayerName
	farcall ApplyMonOrTrainerPals
	farcall MovePlayerPicLeft
	ret

.NewName:
	ld b, NAME_PLAYER
	ld de, wPlayerName
	farcall NamingScreen

	call RotateThreePalettesRight
	call ClearTilemap

	call LoadFontsExtra
	call WaitBGMap

	xor a
	ld [wCurPartySpecies], a
	farcall DrawIntroPlayerPic

	ld b, SCGB_TRAINER_OR_MON_FRONTPIC_PALS
	call GetSGBLayout
	call RotateThreePalettesLeft

	ld hl, wPlayerName
	ld de, .Chris
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .Male
	ld de, .Kris
.Male:
	call InitName
	ret

.Chris:
	db "CHRIS@@@@@@"
.Kris:
	db "KRIS@@@@@@@"

GSShowPlayerNamingChoices: ; unreferenced
	call LoadMenuHeader
	call VerticalMenu
	ld a, [wMenuCursorY]
	dec a
	call CopyNameFromMenu
	call CloseWindow
	ret

StorePlayerName:
	ld a, "@"
	ld bc, NAME_LENGTH
	ld hl, wPlayerName
	call ByteFill
	ld hl, wPlayerName
	ld de, wStringBuffer2
	call CopyName2
	ret

ShrinkPlayer:
	ldh a, [hROMBank]
	push af

	ld a, 32 ; fade time
	ld [wMusicFade], a
	ld de, MUSIC_NONE
	ld a, e
	ld [wMusicFadeID], a
	ld a, d
	ld [wMusicFadeID + 1], a

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
	call ClearTilemap
	ret

Intro_RotatePalettesLeftFrontpic:
	ld hl, IntroFadePalettes
	ld b, IntroFadePalettes.End - IntroFadePalettes
.loop
	ld a, [hli]
	call DmgToCgbBGPals
	ld c, 10
	call DelayFrames
	dec b
	jr nz, .loop
	ret

IntroFadePalettes:
	dc 1, 1, 1, 0
	dc 2, 2, 2, 0
	dc 3, 3, 3, 0
	dc 3, 3, 2, 0
	dc 3, 3, 1, 0
	dc 3, 2, 1, 0
.End

Intro_WipeInFrontpic:
	ld a, $77
	ldh [hWX], a
	call DelayFrame
	ld a, %11100100
	call DmgToCgbBGPals
.loop
	call DelayFrame
	ldh a, [hWX]
	sub $8
	cp -1
	ret z
	ldh [hWX], a
	jr .loop

Intro_PrepTrainerPic:
	ld de, vTiles2
	farcall GetTrainerPic
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

ShrinkFrame:
	ld de, vTiles2
	ld c, 7 * 7
	predef DecompressGet2bpp
	xor a
	ldh [hGraphicStartTile], a
	hlcoord 6, 4
	lb bc, 7, 7
	predef PlaceGraphic
	ret

Intro_PlacePlayerSprite:
	farcall GetPlayerIcon
	ld c, 12
	ld hl, vTiles0
	call Request2bpp

	ld hl, wVirtualOAMSprite00
	ld de, .sprites
	ld a, [de]
	inc de

	ld c, a
.loop
	ld a, [de]
	inc de
	ld [hli], a ; y
	ld a, [de]
	inc de
	ld [hli], a ; x
	ld a, [de]
	inc de
	ld [hli], a ; tile id

	ld b, PAL_OW_RED
	ld a, [wPlayerGender]
	bit PLAYERGENDER_FEMALE_F, a
	jr z, .male
	ld b, PAL_OW_BLUE
.male
	ld a, b

	ld [hli], a ; attributes
	dec c
	jr nz, .loop
	ret

.sprites
	db 4
	; y pxl, x pxl, tile offset
	db  9 * 8 + 4,  9 * 8, 0
	db  9 * 8 + 4, 10 * 8, 1
	db 10 * 8 + 4,  9 * 8, 2
	db 10 * 8 + 4, 10 * 8, 3

IntroSequence:
	callfar Copyright_GameFreakPresents
	jr c, StartTitleScreen
	farcall CrystalIntro

	; fallthrough

StartTitleScreen:
	ldh a, [rSVBK]
	push af
	ld a, BANK(wBGPals1)
	ldh [rSVBK], a

	call .TitleScreen
	call DelayFrame
.loop
	call RunTitleScreen
	jr nc, .loop

	call ClearSprites
	call ClearBGPalettes

	pop af
	ldh [rSVBK], a

	ld hl, rLCDC
	res rLCDC_SPRITE_SIZE, [hl] ; 8x8
	call ClearScreen
	call WaitBGMap2
	xor a
	ldh [hLCDCPointer], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $7
	ldh [hWX], a
	ld a, $90
	ldh [hWY], a
	ld b, SCGB_DIPLOMA
	call GetSGBLayout
	call UpdateTimePals
	ld a, [wIntroSceneFrameCounter]
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
	jp hl

.dw
	dw Intro_MainMenu
	dw DeleteSaveData
	dw IntroSequence
	dw IntroSequence
	dw ResetClock

.TitleScreen:
	farcall _TitleScreen
	ret

RunTitleScreen:
	ld a, [wJumptableIndex]
	bit 7, a
	jr nz, .done_title
	call TitleScreenScene
	farcall SuicuneFrameIterator
	call DelayFrame
	and a
	ret

.done_title
	scf
	ret

Function6292: ; unreferenced
	ldh a, [hVBlankCounter]
	and $7
	ret nz
	ld hl, wLYOverrides + $5f
	ld a, [hl]
	dec a
	ld bc, 2 * SCREEN_WIDTH
	call ByteFill
	ret

TitleScreenScene:
	ld e, a
	ld d, 0
	ld hl, .scenes
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.scenes
	dw TitleScreenEntrance
	dw TitleScreenTimer
	dw TitleScreenMain
	dw TitleScreenEnd

TitleScreenNextScene: ; unreferenced
	ld hl, wJumptableIndex
	inc [hl]
	ret

TitleScreenEntrance:
; Animate the logo:
; Move each line by 4 pixels until our count hits 0.
	ldh a, [hSCX]
	and a
	jr z, .done
	sub 4
	ldh [hSCX], a

; Lay out a base (all lines scrolling together).
	ld e, a
	ld hl, wLYOverrides
	ld bc, 8 * 10 ; logo height
	call ByteFill

; Reversed signage for every other line's position.
; This is responsible for the interlaced effect.
	ld a, e
	xor $ff
	inc a

	ld b, 8 * 10 / 2 ; logo height / 2
	ld hl, wLYOverrides + 1
.loop
	ld [hli], a
	inc hl
	dec b
	jr nz, .loop

	farcall AnimateTitleCrystal
	ret

.done
; Next scene
	ld hl, wJumptableIndex
	inc [hl]
	xor a
	ldh [hLCDCPointer], a

; Play the title screen music.
	ld de, MUSIC_TITLE
	call PlayMusic

	ld a, $88
	ldh [hWY], a
	ret

TitleScreenTimer:
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Start a timer
	ld hl, wTitleScreenTimer
	ld de, 73 * 60 + 36
	ld [hl], e
	inc hl
	ld [hl], d
	ret

TitleScreenMain:
; Run the timer down.
	ld hl, wTitleScreenTimer
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
	ldh a, [hClockResetTrigger]
	cp $34
	jr z, .check_clock_reset

	ld a, [hl]
	and D_DOWN + B_BUTTON + SELECT
	cp  D_DOWN + B_BUTTON + SELECT
	jr nz, .check_start

	ld a, $34
	ldh [hClockResetTrigger], a
	jr .check_start

; Keep Select pressed, and hold Left + Up.
; Then let go of Select.
.check_clock_reset
	bit SELECT_F, [hl]
	jr nz, .check_start

	xor a
	ldh [hClockResetTrigger], a

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
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

.end
; Next scene
	ld hl, wJumptableIndex
	inc [hl]

; Fade out the title screen music
	xor a ; MUSIC_NONE
	ld [wMusicFadeID], a
	ld [wMusicFadeID + 1], a
	ld hl, wMusicFade
	ld [hl], 8 ; 1 second

	ld hl, wTitleScreenTimer
	inc [hl]
	ret

.clock_reset
	ld a, 4
	ld [wIntroSceneFrameCounter], a

; Return to the intro sequence.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

TitleScreenEnd:
; Wait until the music is done fading.

	ld hl, wTitleScreenTimer
	inc [hl]

	ld a, [wMusicFade]
	and a
	ret nz

	ld a, 2
	ld [wIntroSceneFrameCounter], a

; Back to the intro.
	ld hl, wJumptableIndex
	set 7, [hl]
	ret

DeleteSaveData:
	farcall _DeleteSaveData
	jp Init

ResetClock:
	farcall _ResetClock
	jp Init

Function639b: ; unreferenced
	; If bit 0 or 1 of [wTitleScreenTimer] is set, we don't need to be here.
	ld a, [wTitleScreenTimer]
	and %00000011
	ret nz
	ld bc, wSpriteAnim10
	ld hl, SPRITEANIMSTRUCT_FRAME
	add hl, bc
	ld l, [hl]
	ld h, 0
	add hl, hl
	add hl, hl
	ld de, .Data_63ca
	add hl, de
	; If bit 2 of [wTitleScreenTimer] is set, get the second dw; else, get the first dw
	ld a, [wTitleScreenTimer]
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
	ld a, SPRITE_ANIM_INDEX_GS_TITLE_TRAIL
	call InitSpriteAnimStruct
	ret

.Data_63ca:
; frame 0 y, x; frame 1 y, x
	db 11 * 8 + 4, 10 * 8,  0 * 8,      0 * 8
	db 11 * 8 + 4, 13 * 8, 11 * 8 + 4, 11 * 8
	db 11 * 8 + 4, 13 * 8, 11 * 8 + 4, 15 * 8
	db 11 * 8 + 4, 17 * 8, 11 * 8 + 4, 15 * 8
	db  0 * 8,      0 * 8, 11 * 8 + 4, 15 * 8
	db  0 * 8,      0 * 8, 11 * 8 + 4, 11 * 8

Copyright:
	call ClearTilemap
	call LoadFontsExtra
	ld de, CopyrightGFX
	ld hl, vTiles2 tile $60
	lb bc, BANK(CopyrightGFX), 29
	call Request2bpp
	hlcoord 2, 7
	ld de, CopyrightString
	jp PlaceString

CopyrightString:
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

GameInit::
	farcall TryLoadSaveData
	call ClearWindowData
	call ClearBGPalettes
	call ClearTilemap
	ld a, HIGH(vBGMap0)
	ldh [hBGMapAddress + 1], a
	xor a ; LOW(vBGMap0)
	ldh [hBGMapAddress], a
	ldh [hJoyDown], a
	ldh [hSCX], a
	ldh [hSCY], a
	ld a, $90
	ldh [hWY], a
	call WaitBGMap
	jp IntroSequence
