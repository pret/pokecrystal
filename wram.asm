INCLUDE "includes.asm"
INCLUDE "macros/wram.asm"
INCLUDE "vram.asm"

SECTION "Stack", WRAM0
wc000::
StackBottom::
	ds $100 - 1
Stack::
StackTop::
	ds 1


SECTION "WRAM Audio", WRAM0
wMusic::
MusicPlaying:: ; c100
; nonzero if playing
	ds 1

Channels::
Channel1:: channel_struct Channel1 ; c101
Channel2:: channel_struct Channel2 ; c133
Channel3:: channel_struct Channel3 ; c165
Channel4:: channel_struct Channel4 ; c197

SFXChannels::
Channel5:: channel_struct Channel5 ; c1c9
Channel6:: channel_struct Channel6 ; c1fb
Channel7:: channel_struct Channel7 ; c22d
Channel8:: channel_struct Channel8 ; c25f

	ds 1 ; c291
wCurTrackDuty:: ds 1
wCurTrackIntensity:: ds 1
wCurTrackFrequency:: dw
wc296:: ds 1 ; BCD value, dummied out
wCurNoteDuration:: ds 1 ; used in MusicE0 and LoadNote

CurMusicByte:: ; c298
	ds 1
CurChannel:: ; c299
	ds 1
Volume:: ; c29a
; corresponds to $ff24
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	ds 1
SoundOutput:: ; c29b
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	ds 1
SoundInput:: ; c29c
; corresponds to $ff26
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	ds 1

MusicID::
MusicIDLo:: ; c29d
	ds 1
MusicIDHi:: ; c29e
	ds 1
MusicBank:: ; c29f
	ds 1
NoiseSampleAddress::
NoiseSampleAddressLo:: ; c2a0
	ds 1
NoiseSampleAddressHi:: ; c2a1
	ds 1
wNoiseSampleDelay:: ; noise delay? ; c2a2
	ds 1
; c2a3
	ds 1
MusicNoiseSampleSet:: ; c2a4
	ds 1
SFXNoiseSampleSet:: ; c2a5
	ds 1
Danger:: ; c2a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	ds 1
MusicFade:: ; c2a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	ds 1
MusicFadeCount:: ; c2a8
	ds 1
MusicFadeID::
wc2a9::
MusicFadeIDLo:: ; c2a9
	ds 1
wc2aa::
MusicFadeIDHi:: ; c2aa
	ds 1
	ds 5
CryPitch:: ; c2b0
	ds 2
CryLength:: ; c2b2
	ds 2
LastVolume:: ; c2b4
	ds 1
wc2b5:: ds 1
SFXPriority:: ; c2b6
; if nonzero, turn off music when playing sfx
	ds 1
	ds 1
Channel1JumpCondition:: ds 1
Channel2JumpCondition:: ds 1
Channel3JumpCondition:: ds 1
Channel4JumpCondition:: ds 1
wStereoPanningMask:: ds 1 ; c2bc
CryTracks:: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	ds 1
wSFXDuration:: ds 1
CurSFX:: ; c2bf
; id of sfx currently playing
	ds 1
ChannelsEnd::
wMapMusic:: ; c2c0
	ds 1

wDontPlayMapMusicOnReload:: ds 1
wMusicEnd::

SECTION "WRAM", WRAM0

wLZAddress:: dw ; c2c2
wLZBank::    db ; c2c4

	ds 1

wBoxAlignment:: ds 1
InputType:: ; c2c7
	ds 1
AutoInputAddress:: ; c2c8
	ds 2
AutoInputBank:: ; c2ca
	ds 1
AutoInputLength:: ; c2cb
	ds 1

wMonStatusFlags:: ds 1
wGameLogicPaused:: ds 1 ; c2cd
wSpriteUpdatesEnabled:: ds 1
wc2cf:: ds 1
wMapTimeOfDay:: ds 1
	ds 3
wPrinterConnectionOpen:: ds 1
wPrinterOpcode:: ds 1
wLastDexEntry:: ds 1
wDisableTextAcceleration:: ds 1
wPreviousLandmark:: ds 1
wCurrentLandmark:: ds 1
wLandmarkSignTimer:: ds 2
wLinkMode:: ; c2dc
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	ds 1

ScriptVar:: ; c2dd
	ds 1

wPlayerNextMovement:: ds 1
wPlayerMovement:: ds 1
	ds 2
wc2e2::
wMovementPerson:: ds 1
wMovementDataPointer:: ds 3 ; dba
wc2e6:: ds 4
wMovementByteWasControlSwitch:: ds 1
wMovementPointer:: ds 2 ; c2eb
	ds 3

wTempObjectCopyMapObjectIndex:: ds 1 ; c2f0
wTempObjectCopySprite:: ds 1 ; c2f1
wTempObjectCopySpriteVTile:: ds 1 ; c2f2
wTempObjectCopyPalette:: ds 1 ; c2f3
wTempObjectCopyMovement:: ds 1 ; c2f4
wTempObjectCopyRange:: ds 1 ; c2f5
wTempObjectCopyX:: ds 1 ; c2f6
wTempObjectCopyY:: ds 1 ; c2f7
wTempObjectCopyRadius:: ds 1 ; c2f8

	ds 1

TileDown:: ; c2fa
	ds 1
TileUp:: ; c2fb
	ds 1
TileLeft:: ; c2fc
	ds 1
TileRight:: ; c2fd
	ds 1

TilePermissions:: ; c2fe
; set if tile behavior prevents
; you from walking in that direction
; bit 3: down
; bit 2: up
; bit 1: left
; bit 0: right
	ds 1

	ds 1

SECTION "wSpriteAnims", WRAM0 [$c300]
; wc300 - wc313 is a 10x2 dictionary.
; keys: taken from third column of SpriteAnimSeqData
; values: VTiles
wSpriteAnimDict:: ds 10 * 2
	ds wSpriteAnimDict - @
wc300:: ds 1
wc301:: ds 1
wc302:: ds 1
wc303:: ds 2
wc305:: ds 1
wc306:: ds 1
wc307:: ds 1
wc308:: ds 1
wc309:: ds 1
wc30a:: ds 1
wc30b:: ds 1
wc30c:: ds 1
wc30d:: ds 1
wc30e:: ds 1
wc30f:: ds 1
wc310:: ds 1
wc311:: ds 1
wc312:: ds 1
wc313:: ds 1
wSpriteAnimationStructs::
; Field  0: Index
; Fields 1-3: Loaded from SpriteAnimSeqData
wc314::
SpriteAnim1:: sprite_anim_struct SpriteAnim1
wc324::
SpriteAnim2:: sprite_anim_struct SpriteAnim2
wc334::
SpriteAnim3:: sprite_anim_struct SpriteAnim3
wc344::
SpriteAnim4:: sprite_anim_struct SpriteAnim4
wc354::
SpriteAnim5:: sprite_anim_struct SpriteAnim5
wc364::
SpriteAnim6:: sprite_anim_struct SpriteAnim6
wc374::
SpriteAnim7:: sprite_anim_struct SpriteAnim7
wc384::
SpriteAnim8:: sprite_anim_struct SpriteAnim8
wc394::
SpriteAnim9:: sprite_anim_struct SpriteAnim9
wc3a4::
SpriteAnim10:: sprite_anim_struct SpriteAnim10
wSpriteAnimationStructsEnd::
	ds -8
wc3ac:: ds 8 ; c3ac
wSpriteAnimCount:: ds 1
wCurrSpriteOAMAddr:: ds 1

CurIcon:: ; c3b6
	ds 1


wCurIconTile:: ds 1
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurrSpriteAddSubFlags::
	ds 2
wCurrAnimVTile:: ds 1
wCurrAnimXCoord:: ds 1
wCurrAnimYCoord:: ds 1
wCurrAnimXOffset:: ds 1
wCurrAnimYOffset:: ds 1
wGlobalAnimYOffset:: ds 1
wGlobalAnimXOffset:: ds 1
wSpriteAnimsEnd::

	ds 11
wc3cc:: ds 1
wc3cd:: ds 31
wc3ec:: ds 1
wc3ed:: ds 1
wc3ee:: ds 1
wc3ef:: ds 1
wc3f0:: ds 1
wc3f1:: ds 1
wc3f2:: ds 1
wc3f3:: ds 1
wc3f4:: ds 1
wc3f5:: ds 1
wc3f6:: ds 1
wc3f7:: ds 1
wc3f8:: ds 1
wc3f9:: ds 1
wc3fa:: ds 1
wc3fb:: ds 1
wc3fc:: ds 4


SECTION "Sprites", WRAM0 [$c400]

Sprites:: ; c400
; 4 bytes per sprite
; 40 sprites
; struct:
;	y (px)
;	x (px)
;	tile id
;	attributes:
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds 4 * 40
SpritesEnd::


SECTION "Tilemap", WRAM0

TileMap:: ; c4a0
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
TileMapEnd::


SECTION "Battle", WRAM0
wc608::
wOddEgg:: party_struct OddEgg
wOddEggName:: ds PKMN_NAME_LENGTH
wOddEggOTName:: ds PKMN_NAME_LENGTH
	ds wc608 - @

wBT_OTTemp:: battle_tower_struct wBT_OTTemp
	ds wc608 - @

	hall_of_fame wHallOfFameTemp
	ds wc608 - @

wMisc:: ; ds (SCREEN_WIDTH + 4) * (SCREEN_HEIGHT + 2)
	ds 10
wc612::
	ds 6
wc618::
	ds 4
wInitHourBuffer:: ; c61c
	ds 10
wc626::
	ds wc608 - @

wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct ; c608
wPlayerMoveStruct:: move_struct wPlayerMoveStruct ; c60f

EnemyMonNick::  ds PKMN_NAME_LENGTH ; c616
BattleMonNick:: ds PKMN_NAME_LENGTH ; c621

BattleMon:: battle_struct BattleMon ; c62c

	ds 2

wWildMon:: ds 1 ; c64e
	ds 1
wEnemyTrainerItem1:: ds 1 ; c650
wEnemyTrainerItem2:: ds 1 ; c651
wEnemyTrainerBaseReward:: ds 1 ; c652
wEnemyTrainerAIFlags:: ds 3 ; c653
OTClassName:: ds NAME_LENGTH ; c656

	ds 2

CurOTMon:: ; c663
	ds 1

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	ds 1

TypeModifier:: ; c665
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	ds 1

CriticalHit:: ; c666
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	ds 1

AttackMissed:: ; c667
; nonzero for a miss
	ds 1

PlayerSubStatus1:: ; c668
; bit
; 7 attract
; 6 rollout
; 5 endure
; 4 perish song
; 3 identified
; 2 protect
; 1 curse
; 0 nightmare
	ds 1
PlayerSubStatus2:: ; c669
; bit
; 7
; 6
; 5
; 4
; 3
; 2
; 1
; 0 curled
	ds 1
PlayerSubStatus3:: ; c66a
; bit
; 7 confused
; 6 flying
; 5 underground
; 4 charged
; 3 flinch
; 2
; 1 rollout
; 0 bide
	ds 1
PlayerSubStatus4:: ; c66b
; bit
; 7 leech seed
; 6 rage
; 5 recharge
; 4 substitute
; 3
; 2 focus energy
; 1 mist
; 0 x accuracy
	ds 1
PlayerSubStatus5:: ; c66c
; bit
; 7 cant run
; 6 destiny bond
; 5 lock-on
; 4 encore
; 3 transformed
; 2
; 1
; 0 toxic
	ds 1

EnemySubStatus1:: ; c66d
; see PlayerSubStatus1
	ds 1
EnemySubStatus2:: ; c66e
; see PlayerSubStatus2
	ds 1
EnemySubStatus3:: ; c66f
; see PlayerSubStatus3
	ds 1
EnemySubStatus4:: ; c670
; see PlayerSubStatus4
	ds 1
EnemySubStatus5:: ; c671
; see PlayerSubStatus5
	ds 1

PlayerRolloutCount:: ; c672
	ds 1
PlayerConfuseCount:: ; c673
	ds 1
PlayerToxicCount:: ; c674
	ds 1
PlayerDisableCount:: ; c675
	ds 1
PlayerEncoreCount:: ; c676
	ds 1
PlayerPerishCount:: ; c677
	ds 1
PlayerFuryCutterCount:: ; c678
	ds 1
PlayerProtectCount:: ; c679
	ds 1

EnemyRolloutCount:: ; c67a
	ds 1
EnemyConfuseCount:: ; c67b
	ds 1
EnemyToxicCount:: ; c67c
	ds 1
EnemyDisableCount:: ; c67d
	ds 1
EnemyEncoreCount:: ; c67e
	ds 1
EnemyPerishCount:: ; c67f
	ds 1
EnemyFuryCutterCount:: ; c680
	ds 1
EnemyProtectCount:: ; c681
	ds 1

PlayerDamageTaken:: ; c682
	ds 2
EnemyDamageTaken:: ; c684
	ds 2

wBattleReward:: ds 3 ; c686
wBattleAnimParam::
wKickCounter::
wPresentPower:: ds 1 ; c689
BattleScriptBuffer:: ; c68a
	ds 40

BattleScriptBufferLoc:: ; c6b2
	ds 2

wTurnEnded:: ds 1 ; c6b4
	ds 1

PlayerStats:: ; c6b6
PlayerAttack:: ds 2
PlayerDefense:: ds 2
PlayerSpeed:: ds 2
PlayerSpAtk:: ds 2
PlayerSpDef:: ds 2
	ds 1
EnemyStats:: ; c6c1
EnemyAttack:: ds 2
EnemyDefense:: ds 2
EnemySpeed:: ds 2
EnemySpAtk:: ds 2
EnemySpDef:: ds 2
	ds 1

PlayerStatLevels:: ; c6cc
; 07 neutral
PlayerAtkLevel:: ; c6cc
	ds 1
PlayerDefLevel:: ; c6cd
	ds 1
PlayerSpdLevel:: ; c6ce
	ds 1
PlayerSAtkLevel:: ; c6cf
	ds 1

wc6d0::
PlayerSDefLevel:: ; c6d0
	ds 1
PlayerAccLevel:: ; c6d1
	ds 1
PlayerEvaLevel:: ; c6d2
	ds 1
; c6d3
	ds 1
PlayerStatLevelsEnd::

EnemyStatLevels:: ; c6d4
; 07 neutral
EnemyAtkLevel:: ; c6d4
	ds 1
EnemyDefLevel:: ; c6d5
	ds 1
EnemySpdLevel:: ; c6d6
	ds 1
EnemySAtkLevel:: ; c6d7
	ds 1
EnemySDefLevel:: ; c6d8
	ds 1
EnemyAccLevel:: ; c6d9
	ds 1
EnemyEvaLevel:: ; c6da
	ds 1

	ds 1
EnemyTurnsTaken:: ; c6dc
	ds 1
PlayerTurnsTaken:: ; c6dd
	ds 1

	ds 1

PlayerSubstituteHP:: ; c6df
	ds 1
EnemySubstituteHP:: ; c6e0
	ds 1

wUnusedPlayerLockedMove:: ds 1 ; c6e1
	ds 1
CurPlayerMove:: ; c6e3
	ds 1
CurEnemyMove:: ; c6e4
	ds 1

LinkBattleRNCount:: ; c6e5
; how far through the prng stream
	ds 1

wEnemyItemState:: ds 1 ; c6e6
	ds 2
CurEnemyMoveNum:: ; c6e9
	ds 1

wEnemyHPAtTimeOfPlayerSwitch:: ds 2 ; c6ea
wPayDayMoney:: ds 3 ; c6ec

wSafariMonAngerCount:: ds 1
wSafariMonEating:: ds 2
wEnemyBackupDVs:: ; used when enemy is transformed
	ds 2
AlreadyDisobeyed:: ; c6f4
	ds 1

DisabledMove:: ; c6f5
	ds 1
EnemyDisabledMove:: ; c6f6
	ds 1
wWhichMonFaintedFirst:: ds 1

; exists so you can't counter on switch
LastEnemyCounterMove:: ; c6f8
	ds 1
LastPlayerCounterMove:: ; c6f9
	ds 1

wEnemyMinimized:: ds 1 ; c6fa

AlreadyFailed:: ; c6fb
	ds 1

wBattleParticipantsIncludingFainted:: ds 1 ; c6fc
wDanger:: ds 1 ; c6fd
wPlayerMinimized:: ds 1 ; c6fe
PlayerScreens:: ; c6ff
; bit
; 4 reflect
; 3 light screen
; 2 safeguard
; 0 spikes
	ds 1

EnemyScreens:: ; c700
; see PlayerScreens
	ds 1

PlayerSafeguardCount:: ; c701
	ds 1
PlayerLightScreenCount:: ; c702
	ds 1
PlayerReflectCount:: ; c703
	ds 1

	ds 1
EnemySafeguardCount:: ; c705
	ds 1
EnemyLightScreenCount:: ; c706
	ds 1
EnemyReflectCount:: ; c707
	ds 1
	ds 2
Weather:: ; c70a
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	ds 1

WeatherCount:: ; c70b
; # turns remaining
	ds 1

LoweredStat:: ; c70c
	ds 1
EffectFailed:: ; c70d
	ds 1
FailedMessage:: ; c70e
	ds 1
wEnemyGoesFirst:: ; c70f
	ds 1
wPlayerIsSwitching:: ds 1 ; c710
wEnemyIsSwitching::  ds 1 ; c711

PlayerUsedMoves:: ; c712
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: ds 1 ; c716
wEnemySwitchMonParam:: ds 1 ; c717
wEnemySwitchMonIndex:: ds 1 ; c718
wTempLevel:: ds 1 ; c719
LastPlayerMon:: ds 1 ; c71a
LastPlayerMove:: ; c71b
	ds 1
LastEnemyMove:: ; c71c
	ds 1

wPlayerFutureSightCount:: ds 1 ; c71d
wEnemyFutureSightCount:: ds 1 ; c71e
wGivingExperienceToExpShareHolders:: ds 1 ; c71f
wBackupEnemyMonBaseStats:: ds 5 ; c720
wBackupEnemyMonCatchRate:: db ; c725
wBackupEnemyMonBaseExp:: db ; c726
wPlayerFutureSightDamage:: ds 2 ; c727
wEnemyFutureSightDamage:: ds 2 ; c729
wPlayerRageCounter:: ds 1 ; c72b
wEnemyRageCounter:: ds 1 ; c72c
wBeatUpHitAtLeastOnce:: ds 1 ; c72d
wPlayerTrappingMove:: ds 1 ; c72e
wEnemyTrappingMove:: ds 1 ; c72f
wPlayerWrapCount:: ds 1 ; c730
wEnemyWrapCount:: ds 1 ; c731
wPlayerCharging:: ds 1 ; c732
wEnemyCharging:: ds 1 ; c733
BattleEnded:: ; c734
	ds 1

wWildMonMoves:: ds NUM_MOVES ; c735
wWildMonPP:: ds NUM_MOVES ; c739
wAmuletCoin:: ds 1 ; c73a
wSomeoneIsRampaging:: ds 1 ; c73b
wPlayerJustGotFrozen:: ds 1 ; c73c
wEnemyJustGotFrozen:: ds 1 ; c73d
wBattleEnd::
; Battle RAM

; c741
	ds wc6d0 - @
wTrademons::
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTrademonsEnd::
wTradeAnimPointer::
	ds 2
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: ds 1
wLinkTradeGetmonSpecies:: ds 1
wc74e:: ds 107
wc7b9:: ds 1
wc7ba:: ds 1
wc7bb:: ds 2
wc7bd::
	ds wc6d0 - @

; naming screen
wNamingScreenDestinationPointer:: ds 2 ; c6d0
wNamingScreenCurrNameLength:: ds 1 ; c6d2
wNamingScreenMaxNameLength:: ds 1 ; c6d3
wNamingScreenType:: ds 1 ; c6d4
wNamingScreenCursorObjectPointer:: ds 2 ; c6d5
wNamingScreenLastCharacter:: ds 1 ; c6d7
wNamingScreenStringEntryCoord:: ds 2 ; c6d8
	ds wc6d0 - @

; pokegear
wPokegearPhoneLoadNameBuffer:: ds 1 ; c6d0
wPokegearPhoneCursorPosition:: ds 1 ; c6d1
wPokegearPhoneScrollPosition:: ds 1 ; c6d2
wPokegearPhoneSelectedPerson:: ds 1 ; c6d3
wPokegearPhoneSubmenuCursor:: ds 1 ; c6d4
wPokegearMapCursorObjectPointer:: ds 2 ; c6d5
wPokegearMapCursorLandmark:: ds 1 ; c6d7
wPokegearMapPlayerIconLandmark:: ds 1 ; c6d8
wPokegearRadioChannelBank:: ds 1 ; c6d9
wPokegearRadioChannelAddr:: ds 2 ; c6da
wPokegearRadioMusicPlaying:: ds 1 ; c6dc
	ds wc6d0 - @

wSlots::
; Slot Machine
; c6d0
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
; c700
wReel1Stopped:: ds 3
wReel2Stopped:: ds 3
wReel3Stopped:: ds 3
wSlotBias:: ds 1
wSlotBet:: ds 1
wFirstTwoReelsMatching:: ds 1
wFirstTwoReelsMatchingSevens:: ds 1
wSlotMatched:: ds 1
wCurrReelStopped:: ds 3
wPayout:: ds 2
wCurrReelXCoord:: ds 1
wCurrReelYCoord:: ds 1
	ds 2
wSlotBuildingMatch:: ds 1
wSlotsDataEnd::
	ds 28
wSlotsEnd::
	ds wSlots - @

; Card Flip
; c6d0
wCardFlip::
wDeck:: ds 24
wDeckEnd::
; c6e8
wCardFlipNumCardsPlayed:: ds 1
wCardFlipFaceUpCard:: ds 1
wDiscardPile:: ds 24
wDiscardPileEnd::
wCardFlipEnd::
	ds wCardFlip - @

; Dummy Game
; c6d0
wDummyGame::
wDummyGameCards:: ds 9 * 5
wDummyGameCardsEnd::
wDummyGameLastCardPicked:: ds 1 ; c6fd
wDummyGameCard1:: ds 1 ; c6fe
wDummyGameCard2:: ds 1 ; c6ff
wDummyGameCard1Location:: ds 1 ; c700
wDummyGameCard2Location:: ds 1 ; c701
wDummyGameNumberTriesRemaining:: ds 1 ; c702
wDummyGameLastMatches:: ds 5 ; c703
wDummyGameCounter:: ds 1 ; c708
wDummyGameNumCardsMatched:: ds 1 ; c709
wDummyGameEnd::
	ds wDummyGame - @
; Unown Puzzle
wUnownPuzzle::
wPuzzlePieces::
	ds 6 * 6
wUnownPuzzleEnd::

	ds wc6d0 - @

wPokedexDataStart::
wPokedexOrder:: ds NUM_POKEMON +- 1
wPokedexOrderEnd:: ds 6
wPokedexMetadata::
wDexListingScrollOffset:: ; offset of the first displayed entry from the start
wc7d0:: ds 1
wDexListingCursor::
wc7d1:: ds 1 ; Dex cursor
wDexListingEnd::
wc7d2:: ds 1 ; Last mon to display
wDexListingHeight:: ; number of entries displayed at once in the dex listing
wc7d3:: ds 1
wCurrentDexMode::   ; Pokedex Mode
wc7d4:: ds 1 ; Index of the topmost visible item in a scrolling menu
wDexSearchMonType1:: ds 1 ; first type to search
wDexSearchMonType2:: ds 1 ; second type to search
wDexSearchResultCount:: ds 1
wDexArrowCursorPosIndex:: ds 1
wDexArrowCursorDelayCounter:: ds 1
wDexArrowCursorBlinkCounter:: ds 1
wDexSearchSlowpokeFrame:: ds 1
wUnlockedUnownMode:: ds 1
wDexCurrentUnownIndex:: ds 1
wDexUnownCount:: ds 1
wDexConvertedMonType:: ds 1 ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: ds 1
wDexListingCursorBackup:: ds 1
wBackupDexListingCursor::
wc7e2:: ds 1
wBackupDexListingPage::
wc7e3:: ds 1
wDexCurrentLocation::
wc7e4:: ds 1
IF DEF(CRYSTAL11)
wPokedexStatus::
ELSE
wPokedexDataEnd::
ENDC
	ds 1
IF DEF(CRYSTAL11)
wPokedexDataEnd::
ENDC
	ds 2

wMiscEnd::

wc7e8:: ds 24 ; ????

SECTION "Overworld Map", WRAM0 [$c800]

OverworldMap:: ; c800
	ds 1300
OverworldMapEnd::
	ds OverworldMap - @

wGameboyPrinterRAM::
wGameboyPrinterScreen:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; c800
wGameboyPrinterScreenEnd:: ; c968
	ds wGameboyPrinterScreen - @
wGameboyPrinter2bppSource::
	ds 40 tiles
wGameboyPrinter2bppSourceEnd::
wca80:: ds 1
wPrinterRowIndex:: ds 1

; Printer data header
wca82:: ds 1
wca83:: ds 1
wca84:: ds 1
wca85:: ds 1
wPrinterChecksum:: dw ; ca86
wPrinterHandshake:: ds 1
wPrinterStatusFlags::
; bit 7: set if error 1 (battery low)
; bit 6: set if error 4 (too hot or cold)
; bit 5: set if error 3 (paper jammed or empty)
; if this and the previous byte are both $ff: error 2 (connection error)
	ds 1

wHandshakeFrameDelay:: ds 1
wPrinterSerialFrameDelay:: ds 1
wPrinterSendByteOffset:: dw
wPrinterSendByteCounter:: dw

; tilemap backup?
wPrinterTileMapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; ca90
wPrinterTileMapBufferEnd::
wPrinterStatus:: ds 1 ; cbf8
	ds 1
wcbfa:: ds 1
wGBPrinterSettings:: ds 1
	ds 16
wGameboyPrinterRAMEnd::
	ds wGameboyPrinterRAM - @

wBillsPCPokemonList:: ; c800
; Pokemon, box number, list index

wMysteryGiftPartyTemp:: ; ds PARTY_LENGTH * (1 + 1 + NUM_MOVES)
wMysteryGiftStaging::

wLinkData:: ; ds $514
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: ds 1
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartySpeciesEnd:: ds 1

wTimeCapsulePlayerData::
wTimeCapsulePartyMon1:: red_party_struct wTimeCapsulePartyMon1
wTimeCapsulePartyMon2:: red_party_struct wTimeCapsulePartyMon2
wTimeCapsulePartyMon3:: red_party_struct wTimeCapsulePartyMon3
wTimeCapsulePartyMon4:: red_party_struct wTimeCapsulePartyMon4
wTimeCapsulePartyMon5:: red_party_struct wTimeCapsulePartyMon5
wTimeCapsulePartyMon6:: red_party_struct wTimeCapsulePartyMon6
wTimeCapsulePartyMonOTNames:: ds PARTY_LENGTH * NAME_LENGTH
wTimeCapsulePartyMonNicks:: ds PARTY_LENGTH * PKMN_NAME_LENGTH
wTimeCapsulePlayerDataEnd::
	ds wTimeCapsulePlayerData - @

wLinkPlayerData::
wLinkPlayerPartyMon1:: party_struct wLinkPlayerPartyMon1
wLinkPlayerPartyMon2:: party_struct wLinkPlayerPartyMon2
wLinkPlayerPartyMon3:: party_struct wLinkPlayerPartyMon3
wLinkPlayerPartyMon4:: party_struct wLinkPlayerPartyMon4
wLinkPlayerPartyMon5:: party_struct wLinkPlayerPartyMon5
wLinkPlayerPartyMon6:: party_struct wLinkPlayerPartyMon6
wLinkPlayerPartyMonOTNames:: ds PARTY_LENGTH * NAME_LENGTH
wLinkPlayerPartyMonNicks:: ds PARTY_LENGTH * PKMN_NAME_LENGTH
wLinkPlayerDataEnd::
	ds $35d

wLinkDataEnd::
	ds wLinkData - @

wc800::	ds 1
wc801:: ds 1
wc802:: ds 1
wc803:: ds 4
wc807:: ds 7
wc80e:: ds 1
wc80f:: ds 1
wc810:: ds 1
wc811:: ds 1
wc812:: ds 1
wc813:: ds 1
wc814:: ds 4
wc818:: ds 8
wc820:: ds 1
wc821:: ds 15
wc830:: ds 16
wc840:: ds 16
wMysteryGiftTrainerData:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
wMysteryGiftTrainerDataEnd::
	ds wMysteryGiftTrainerData - @
wc850:: ds 16
wc860:: ds 16
wc870:: ds 16
wc880:: ds 16
wc890:: ds 16
wc8a0:: ds 16
wc8b0:: ds 16
wc8c0:: ds 16
wc8d0:: ds 16
wc8e0:: ds 16
wc8f0:: ds 16

wMysteryGiftPartnerData::
wc900:: ds 1
wMysteryGiftPartnerID:: ds 2
wMysteryGiftPartnerName:: ds NAME_LENGTH
wMysteryGiftPartnerDexCaught:: ds 1
wc90f::
wMysteryGiftPartnerSentDeco:: ds 1
wMysteryGiftPartnerWhichItem:: ds 1
wMysteryGiftPartnerWhichDeco:: ds 1
wMysteryGiftPartnerBackupItem:: ds 2
wMysteryGiftPartnerDataEnd::
	ds 12
wc920:: ds 16
wc930:: ds 16
wc940:: ds 16
wMysteryGiftPlayerData::
wc950:: ds 1
wMysteryGiftPlayerID:: ds 2
wMysteryGiftPlayerName:: ds NAME_LENGTH
wMysteryGiftPlayerDexCaught:: ds 1
wMysteryGiftPlayerSentDeco:: ds 1
wMysteryGiftPlayerWhichItem:: ds 1
wMysteryGiftPlayerWhichDeco:: ds 1
wMysteryGiftPlayerBackupItem:: ds 2
wMysteryGiftPlayerDataEnd::

wc964:: ds 12
wc970:: ds 16
wc980:: ds 16
wc990:: ds 16
wc9a0:: ds 16
wc9b0:: ds 16
wc9c0:: ds 16
wc9d0:: ds 16
wc9e0:: ds 16
wc9f0:: ds 4
wc9f4:: ds 5
wc9f9:: ds 7

wCreditsFaux2bpp::
wca00:: ds 1
wca01:: ds 1
wca02:: ds 14
wca10:: ds 16
wca20:: ds 16
wca30:: ds 16
wca40:: ds 16
wca50:: ds 16
wca60:: ds 16
wca70:: ds 16

	ds 35

wcaa3:: ds 2 ; caa3
wcaa5:: ds 16
wcab5:: ds 10
wcabf:: ds 10
wcac9:: ds 63
wcb08:: ds 6
wcb0e:: ds 5
wcb13:: ds 9
wcb1c:: ds 14
wBillsPC_ScrollPosition:: ds 1
wBillsPC_CursorPosition:: ds 1
wBillsPC_NumMonsInBox:: ds 1
wBillsPC_NumMonsOnScreen:: ds 1
wBillsPC_LoadedBox:: ds 1 ; 0 if party, 1 - 14 if box, 15 if active box
wBillsPC_BackupScrollPosition:: ds 1
wBillsPC_BackupCursorPosition:: ds 1
wBillsPC_BackupLoadedBox:: ds 1
wBillsPC_MonHasMail:: ds 1
	ds 18
wcb45:: ds 20
wcb59:: ds 20
wcb6d:: ds 1
wcb6e:: ds 22
wcb84:: ds 100
wcbe8:: dw
wLinkOTPartyMonTypes::
	ds 2 * PARTY_LENGTH
	ds 84

wcc4a:: ds 22
wcc60:: ds 1
wcc61:: ds 1
wcc62:: ds 2
wcc64:: ds 1
wcc65:: ds 57
wcc9e:: ds 22
wccb4:: ds 1
wccb5:: ds 3
wccb8:: ds 1
wccb9:: ds 1
wccba:: ds 102

SECTION "Video", WRAM0
CreditsPos::
BGMapBuffer::
wMobileMonSpeciesPointerBuffer:: dw
wMobileMonStructurePointerBuffer:: dw
wMobileMonOTNamePointerBuffer:: dw
wMobileMonNicknamePointerBuffer:: dw
wMobileMonMailPointerBuffer:: dw
	ds CreditsPos - @

wcd20:: ds 1
wcd21:: ds 1
wcd22::
CreditsTimer:: ; cd22
	ds 1

wcd23:: ds 1
wcd24:: ds 1
wMobileCommsJumptableIndex:: ds 1 ; cd25
wcd26:: ds 1
wcd27:: ds 1
wcd28:: ds 1
wcd29:: ds 1
wMobileMonSpeciesBuffer::
wcd2a:: ds 1
wTempOddEggNickname::
wcd2b:: ds 1
wcd2c:: ds 1
wcd2d:: ds 1
wcd2e:: ds 1
wcd2f:: ds 1
wcd30:: ds 1
wcd31:: ds 1
wcd32:: ds 1
wcd33:: ds 1
wcd34:: ds 1
wcd35:: ds 1

; current time for link/mobile?
wcd36:: ds 1 ; hours
wcd37:: ds 1 ; mins
wcd38:: ds 1 ; secs

wcd39:: ds 1
wcd3a:: ds 1
wcd3b:: ds 1
wcd3c:: ds 1
wcd3d:: ds 1
wcd3e:: ds 1
wcd3f:: ds 1
wcd40:: ds 1
wcd41:: ds 1
wcd42:: ds 1
wcd43:: ds 1

; some sort of timer in link battles
wMobileInactivityTimerMinutes:: ds 1 ; mins
wMobileInactivityTimerSeconds:: ds 1 ; secs
wMobileInactivityTimerFrames:: ds 1 ; frames

wcd47:: ds 1

BGMapPalBuffer:: ; cd48
	ds 1 ; 40

wBTTempOTSprite::
wcd49:: ds 1
wcd4a:: ds 1
wcd4b:: ds 1
wEZChatCursorXCoord::
wcd4c:: ds 1
wEZChatCursorYCoord::
wcd4d:: ds 1
wcd4e:: ds 1
wcd4f:: ds 1
wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1
wMobileOpponentBattleMessage:: ; dc $c
wcd53:: ds 1
wcd54:: ds 1
wcd55:: ds 1
wcd56:: ds 1
wcd57:: ds 1
wcd58:: ds 1
wcd59:: ds 1
wcd5a:: ds 1
wcd5b:: ds 1
wcd5c:: ds 1
wcd5d:: ds 1
wcd5e:: ds 1
wcd5f:: ds 1
wcd60:: ds 2
wcd62:: ds 1
wcd63:: ds 1
wcd64:: ds 1
wcd65:: ds 1
wcd66:: ds 1
wcd67:: ds 1
wcd68:: ds 1
wcd69:: ds 1
wcd6a:: ds 1
wcd6b:: ds 1
wcd6c:: ds 1
wcd6d:: ds 1
wcd6e:: ds 1
wcd6f:: ds 1

BGMapBufferPtrs:: ; cd70
; 20 bg map addresses (16x8 tiles)
	ds 1 ; 40

wcd71:: ds 1
wcd72:: ds 1
wcd73:: ds 1
wcd74:: ds 1
wOTMonSelection:: ds 2 ; ds 3
wcd77:: ds 1
wcd78:: ds 1
wcd79:: ds 1
wcd7a:: ds 2
wcd7c:: ds 3
wcd7f:: ds 1
wcd80:: ds 1
wcd81:: ds 1
wcd82:: ds 1
wcd83:: ds 1
wcd84:: ds 1
wcd85:: ds 4
wcd89:: ds 1
wcd8a:: ds 1
wcd8b:: ds 1
wcd8c:: ds 1
wcd8d:: ds 11
BGMapBufferEnd::

SGBPredef:: ; cd98
	ds 1
PlayerHPPal:: ; cd99
	ds 1
EnemyHPPal:: ; cd9a
	ds 1

wHPPals:: ds PARTY_LENGTH
wcda1:: ds 8
wSGBPals:: ds 48 ; cda9

AttrMap:: ; cdd9
; 20x18 grid of bg tile attributes for 8x8 tiles
; read horizontally from the top row
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds SCREEN_WIDTH * SCREEN_HEIGHT
AttrMapEnd::
	ds 1
wcf42:: ds 2
wcf44:: ds 1
wcf45::
	ds AttrMapEnd - @
wTileAnimBuffer::
	ds $10
; addresses dealing with serial comms
wOtherPlayerLinkMode:: ds 1
wOtherPlayerLinkAction:: ds 4
wPlayerLinkAction:: ds 1
wcf57:: ds 4
wLinkTimeoutFrames:: dw ; cf5b
wcf5d:: ds 2

MonType:: ; cf5f
	ds 1

CurSpecies:: ; cf60
CurMove::
	ds 1

wNamedObjectTypeBuffer:: ds 1
	ds 1
wJumptableIndex::
wBattleTowerBattleEnded::
wcf63:: ds 1
wNrOfBeatenBattleTowerTrainers::
wMomBankDigitCursorPosition::
wIntroSceneFrameCounter::
wHoldingUnownPuzzlePiece::
wCardFlipCursorY::
wCreditsBorderFrame::
wDexEntryPrevJumptableIndex::
wcf64:: ds 1
IF !DEF(CRYSTAL11)
wPokedexStatus::
ENDC
wCreditsBorderMon::
wTitleScreenTimerLo::
wUnownPuzzleCursorPosition::
wCardFlipCursorX::
wCurrPocket::
wPrinterQueueLength::
wcf65:: ds 1
wCreditsLYOverride::
wTitleScreenTimerHi::
wUnownPuzzleHeldPiece::
wCardFlipWhichCard::
wcf66:: ds 1

Requested2bpp:: ; cf67
Requested2bppSize::
	ds 1
Requested2bppSource:: ; cf68
	ds 2
Requested2bppDest:: ; cf6a
	ds 2

Requested1bpp:: ; cf6c
Requested1bppSize::
	ds 1
Requested1bppSource:: ; cf6d
	ds 2
Requested1bppDest:: ; cf6f
	ds 2

wWindowStackPointer:: dw ; cf71
wMenuJoypad:: ds 1   ; cf73
MenuSelection:: ds 1 ; cf74
MenuSelectionQuantity:: ds 1 ; cf75
wWhichIndexSet:: ds 1 ; cf76
wScrollingMenuCursorPosition:: ds 1 ; cf77
wWindowStackSize:: ds 9 ; cf78

; menu data header
wMenuDataHeader:: ; cf81
wMenuFlags:: ds 1
wMenuBorderTopCoord:: ds 1
wMenuBorderLeftCoord:: ds 1
wMenuBorderBottomCoord:: ds 1
wMenuBorderRightCoord:: ds 1
wMenuData2Pointer:: ds 2
wMenuCursorBuffer:: ds 2
; end menu data header
wMenuDataBank:: ds 1 ; menu data bank?
	ds 6
wMenuDataHeaderEnd::

wMenuData2::
wMenuData2Flags:: ds 1 ; cf91
; bit 7: When set, start printing text one tile to the right of the border
;        In scrolling menus, SELECT is functional
; bit 6: When set, start printing text one tile below the border
;        In scrolling menus, START is functional
; bit 5: ????
; bit 4: ????
; bit 3: ????
; bit 2: ????
; bit 1: Enable Select button
; bit 0: Disable B button

wMenuData2_ScrollingMenuHeight::
wMenuData2Items::
	ds 1 ; cf92
wMenuData2IndicesPointer::
wMenuData2Spacing::
wMenuData2_ScrollingMenuWidth::
	ds 1 ; cf93
wMenuData2_2DMenuItemStringsBank::
wMenuData2_ScrollingMenuSpacing::
	ds 1 ; cf94
wMenuData2_2DMenuItemStringsAddr::
wMenuData2DisplayFunctionPointer::
wMenuData2_ItemsPointerBank::
	ds 1 ; cf95
wMenuData2_ItemsPointerAddr::
	ds 1 ; cf96
wMenuData2PointerTableAddr::
wMenuData2_2DMenuFunctionBank::
	ds 1 ; cf97
wMenuData2_2DMenuFunctionAddr::
wMenuData2_ScrollingMenuFunction1::
	ds 3 ; cf98
wMenuData2_ScrollingMenuFunction2::
	ds 3 ; cf9b
wMenuData2_ScrollingMenuFunction3::
	ds 3 ; cf9e
wMenuData2End::

wMenuData3::
w2DMenuCursorInitY:: ds 1 ; cfa1
w2DMenuCursorInitX:: ds 1 ; cfa2
w2DMenuNumRows:: ds 1 ; cfa3
w2DMenuNumCols:: ds 1 ; cfa4
w2DMenuFlags1:: ds 1 ; cfa5
w2DMenuFlags2:: ds 1 ; cfa6
w2DMenuCursorOffsets:: ds 1 ; cfa7
wMenuJoypadFilter:: ds 1 ; cfa8
wMenuData3End::

wMenuCursorY:: ds 1 ; cfa9
wMenuCursorX:: ds 1 ; cfaa
wCursorOffCharacter:: ds 1 ; cfab
wCursorCurrentTile:: ds 2 ; cfac
	ds 3

OverworldDelay:: ; cfb1
	ds 1
TextDelayFrames:: ; cfb2
	ds 1
VBlankOccurred:: ; cfb3
	ds 1

PredefID:: ; cfb4
	ds 1
PredefTemp:: ; cfb5
	ds 2
PredefAddress:: ; cfb7
	ds 2
wFarCallBCBuffer:: ; cfb9
	ds 2

wcfbb:: ds 1
GameTimerPause:: ; cfbc
; bit 0
	ds 1

	ds 1

wcfbe::
; SGB flags?
	ds 2

InBattleTowerBattle:: ; cfc0
; 0 not in BattleTower-Battle
; 1 BattleTower-Battle
	ds 1

	ds 1

FXAnimID::
FXAnimIDLo:: ; cfc2
	ds 1
FXAnimIDHi:: ; cfc3
	ds 1
wPlaceBallsX:: ; cfc4
	ds 1
wPlaceBallsY:: ; cfc5
	ds 1
TileAnimationTimer:: ; cfc6
	ds 1

; palette backups?
wBGP:: ds 1
wOBP0:: ds 1
wOBP1:: ds 1

wNumHits:: ds 2

Options:: ; cfcc
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	ds 1

wSaveFileExists:: ds 1

TextBoxFrame:: ; cfce
; bits 0-2: textbox frame 0-7
	ds 1
TextBoxFlags::
	ds 1

GBPrinter:: ; cfd0
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	ds 1

Options2:: ; cfd1
; bit 1: menu account off/on
	ds 1

	ds 2
OptionsEnd::

; Time buffer, for counting the amount of time since
; an event began.

wSecondsSince:: ds 1
wMinutesSince:: ds 1
wHoursSince:: ds 1
wDaysSince:: ds 1

wRAM0End:: ; cfd8


SECTION "WRAM 1", WRAMX, BANK [1]

wd000:: ds 1
DefaultSpawnpoint::
wd001:: ds 1

; d002
wTempMail:: mailmsg wTempMail
	ds wTempMail - @

wSeerAction:: ds 1
wSeerNickname:: ds PKMN_NAME_LENGTH
wSeerCaughtLocation:: ds 17
wSeerTimeOfDay:: ds NAME_LENGTH
wSeerOTName:: ds NAME_LENGTH
wSeerOTNameGrammar:: ds 1
wSeerCaughtLevelString:: ds 4
wSeerCaughtLevel:: ds 1
wSeerCaughtData:: ds 1
wSeerCaughtGender:: ds 1
	ds wSeerAction - @

wBufferMonNick:: ds PKMN_NAME_LENGTH ; d002
wBufferMonOT:: ds NAME_LENGTH ; d00d
wBufferMon:: party_struct wBufferMon ; d018
	ds 8
wMonOrItemNameBuffer::
	ds wBufferMonNick - @

wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH

	ds wBugContestResults - @

wd002::
wTempDayOfWeek::
wApricorns::
PhoneScriptBank::
LuckyNumberDigit1Buffer::
wCurrentRadioLine::
wMovementBufferCount::
wMartItem1BCD::
wWhichBoxMonToPrint::
	ds 1
wd003::
LuckyNumberDigit2Buffer::
PhoneCallerLo::
wNextRadioLine::
wMovementBufferPerson::
wPlaceBallsDirection::
wFinishedPrintingBox::
	ds 1
wd004::
LuckyNumberDigit3Buffer::
PhoneCallerHi::
wRadioTextDelay::
wTrainerHUDTiles::
wAddrOfBoxToPrint::
	ds 1
wd005::
LuckyNumberDigit4Buffer::
StartFlypoint:: ; d005
wNumRadioLinesPrinted::
wMartItem2BCD::
	ds 1
wd006::
wMobileParticipant1Nickname::
LuckyNumberDigit5Buffer::
EndFlypoint:: ; d006
wOaksPkmnTalkSegmentCounter::
wBankOfBoxToPrint::
	ds 1

wd007::
wWhichBoxToPrint::
MovementBuffer:: ; d007
	ds 1

wMartItem3BCD::
wd008:: ds 2
wd00a:: ds 1
wMartItem4BCD::
wd00b:: ds 1

wRadioText:: ds 2 * SCREEN_WIDTH
wRadioTextEnd::
	ds wRadioText - @

wMobileParticipant2Nickname::
wd00c:: ds 1
wd00d:: ds 1
wMartItem5BCD::
wd00e:: ds 1
wd00f:: ds 1
wd010:: ds 1
wMartItem6BCD::
wd011:: ds 1
wMobileParticipant3Nickname::
wd012:: ds 1
wd013:: ds 1
wMartItem7BCD::
wd014:: ds 2
wd016:: ds 1
wMartItem8BCD::
wd017:: ds 1

wd018:: ds 1
wd019:: ds 1
wMartItem9BCD::
wd01a:: ds 3
wMartItem10BCD:: ds 2
wd01f:: ds 1
wMartItemBCDEnd::
	ds 13
wd02d:: ds 1
wd02e:: ds 1
wd02f:: ds 1
wd030:: ds 1
wd031:: ds 1
wd032:: ds 1
wd033:: ds 1
wd034:: ds 2
wd036:: ds 2
wd038:: ds 3
wd03b:: ds 3

MenuItemsList::
CurFruitTree::
CurInput::
wElevatorPointerBank::
wCurCoordEventTriggerID::
wCurSignpostYCoord::
EngineBuffer1:: ; d03e
	ds 1

wd03f::
wJumpStdScriptBuffer::
CurFruit:: ; d03f
MartPointerBank::
wElevatorPointerLo::
wCurCoordEventMapY::
wCurSignpostXCoord::
EngineBuffer2::
	ds 1

wd040::
wElevatorPointerHi::
MartPointer:: ; d040
wCurCoordEventMapX::
wCurSignpostType::
EngineBuffer3::
	ds 1

wd041::
wElevatorOriginFloor::
wTempTrainerHeader::
wTempTrainerEventFlagLo::
wCurSignpostScriptAddr::
EngineBuffer4::
	ds 1

wTempTrainerEventFlagHi::
MovementAnimation:: ; d042
wCurCoordEventScriptAddr::
EngineBuffer5::
	ds 1

wTempTrainerClass::
WalkingDirection:: ; d043
wBargainShopFlags::
	ds 1

wTempTrainerID::
FacingDirection:: ; d044
	ds 1

wSeenTextPointer::
WalkingX::
wd045:: ; d045
	ds 1
WalkingY:: ; d046
	ds 1

WalkingTile:: ; d047
wWinTextPointer::
	ds 1

wPhoneScriptPointer:: ds 1
wLossTextPointer:: ds 2
wScriptAfterPointer:: ds 2
wRunningTrainerBattleScript:: ds 1
MenuItemsListEnd::
wTempTrainerHeaderEnd::
wPlayerTurningDirection:: ; d04e
	ds 24
wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH ; d066

StringBuffer1:: ; d073
	ds 19

StringBuffer2:: ; d086
	ds 19

StringBuffer3:: ; d099
	ds 19

StringBuffer4:: ; d0ac
	ds 19

StringBuffer5:: ; d0bf
	ds 19

wd0d2:: ds 2

CurBattleMon:: ; d0d4
	ds 1
CurMoveNum:: ; d0d5
	ds 1

wLastPocket:: ds 1

wPCItemsCursor:: ds 1
wPartyMenuCursor:: ds 1
wItemsPocketCursor:: ds 1
wKeyItemsPocketCursor:: ds 1
wBallsPocketCursor:: ds 1
wTMHMPocketCursor:: ds 1

wPCItemsScrollPosition:: ds 1
wPartyMenuScrollPosition:: ds 1 ; unused
wItemsPocketScrollPosition:: ds 1
wKeyItemsPocketScrollPosition:: ds 1
wBallsPocketScrollPosition:: ds 1
wTMHMPocketScrollPosition:: ds 1

wMoveSwapBuffer::
wSwitchMon::
wSwitchItem::
wd0e3:: ds 1
wMenuScrollPosition:: ds 4
wQueuedScriptBank:: ds 1
wQueuedScriptAddr:: ds 2
wNumMoves::
wd0eb:: ds 1
wFieldMoveSucceeded::
wItemEffectSucceeded::
wPlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	ds 1 ; d0ec

VramState:: ; d0ed
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	ds 1

wBattleResult:: ds 1 ; d0ee
wUsingItemWithSelect:: ds 1 ; d0ef
CurMart:: ds 16 ; d0f0
CurMartEnd::
	ds CurMart - @
CurElevator:: ds 1
wd0f1::
CurElevatorFloors::
wCurMessageIndex:: ds 1
wd0f2::
wMailboxCount:: ds 1
wMailboxItems:: ds MAILBOX_CAPACITY
wMailboxEnd:: ds 1 ; d0fe
	ds 2

wListPointer:: dw ; d100
wUnusedD102:: dw ; d102
wItemAttributesPtr:: dw ; d104

CurItem:: ds 1 ; d106
CurItemQuantity:: ; d107
wMartItemID::
wd107:: ds 1

CurPartySpecies:: ; d108
	ds 1

CurPartyMon:: ; d109
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1

wWhichHPBar::
; 0: Enemy
; 1: Player
; 2: Party Menu
	ds 1
wPokemonWithdrawDepositParameter::
; 0: Take from PC
; 1: Put into PC
; 2: Take from Daycare
; 3: Put into Daycare
wd10b:: ds 1
wItemQuantityChangeBuffer:: ds 1
wItemQuantityBuffer:: ds 1

TempMon:: ; d10e
	party_struct TempMon

wSpriteFlags:: ds 1 ; d13e

wHandlePlayerStep:: ds 2 ; d13f

PartyMenuActionText:: ; d141
	ds 1

wItemAttributeParamBuffer:: ; d142
	ds 1

CurPartyLevel:: ; d143
	ds 1

wScrollingMenuListSize:: ds 2

; used when following a map warp
; d146
wNextWarp:: ds 1
wNextMapGroup:: ds 1
wNextMapNumber:: ds 1
wPrevWarp:: ds 1
wPrevMapGroup:: ds 1
wPrevMapNumber:: ds 1
; d14c

wPlayerBGMapOffsetX:: ds 1 ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: ds 1 ; used in FollowNotExact; unit is pixels

; Player movement
wPlayerStepVectorX:: ds 1   ; d14e
wPlayerStepVectorY:: ds 1   ; d14f
wPlayerStepFlags:: ds 1     ; d150
; bit 7: Start step
; bit 6: Stop step
; bit 5: Doing step
; bit 4: In midair
; bits 0-3: unused
wPlayerStepDirection:: ds 1 ; d151

wBGMapAnchor:: ds 2 ; d152

UsedSprites:: ds 64 ; d154
UsedSpritesEnd::
	ds UsedSprites - @

wd154:: ; d154
	ds 31 ; 64

wd173:: ds 1 ; related to command queue type 3
	ds 13
wd181:: ds 1
wd182:: ds 1
	ds 14

wd191:: ds 1
wd192:: ds 1
wd193:: ds 1
wOverworldMapAnchor:: dw ; d194
wMetatileStandingY:: ds 1 ; d196
wMetatileStandingX:: ds 1 ; d197
wSecondMapHeaderBank:: ds 1 ; d198
wTileset:: ds 1 ; d199
wPermission:: ds 1 ; d19a
wSecondMapHeaderAddr:: dw ; d19b

; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
MapHeader:: ; d19d
MapBorderBlock:: ; d19d
	ds 1
MapHeight:: ; d19e
	ds 1
MapWidth:: ; d19f
	ds 1
MapBlockDataBank:: ; d1a0
	ds 1
MapBlockDataPointer:: ; d1a1
	ds 2
MapScriptHeaderBank:: ; d1a3
	ds 1
MapScriptHeaderPointer:: ; d1a4
	ds 2
MapEventHeaderPointer:: ; d1a6
	ds 2
; bit set
MapConnections:: ; d1a8
	ds 1
NorthMapConnection:: ; d1a9
NorthConnectedMapGroup:: ; d1a9
	ds 1
NorthConnectedMapNumber:: ; d1aa
	ds 1
NorthConnectionStripPointer:: ; d1ab
	ds 2
NorthConnectionStripLocation:: ; d1ad
	ds 2
NorthConnectionStripLength:: ; d1af
	ds 1
NorthConnectedMapWidth:: ; d1b0
	ds 1
NorthConnectionStripYOffset:: ; d1b1
	ds 1
NorthConnectionStripXOffset:: ; d1b2
	ds 1
NorthConnectionWindow:: ; d1b3
	ds 2

SouthMapConnection:: ; d1b5
SouthConnectedMapGroup:: ; d1b5
	ds 1
SouthConnectedMapNumber:: ; d1b6
	ds 1
SouthConnectionStripPointer:: ; d1b7
	ds 2
SouthConnectionStripLocation:: ; d1b9
	ds 2
SouthConnectionStripLength:: ; d1bb
	ds 1
SouthConnectedMapWidth:: ; d1bc
	ds 1
SouthConnectionStripYOffset:: ; d1bd
	ds 1
SouthConnectionStripXOffset:: ; d1be
	ds 1
SouthConnectionWindow:: ; d1bf
	ds 2

WestMapConnection:: ; d1c1
WestConnectedMapGroup:: ; d1c1
	ds 1
WestConnectedMapNumber:: ; d1c2
	ds 1
WestConnectionStripPointer:: ; d1c3
	ds 2
WestConnectionStripLocation:: ; d1c5
	ds 2
WestConnectionStripLength:: ; d1c7
	ds 1
WestConnectedMapWidth:: ; d1c8
	ds 1
WestConnectionStripYOffset:: ; d1c9
	ds 1
WestConnectionStripXOffset:: ; d1ca
	ds 1
WestConnectionWindow:: ; d1cb
	ds 2

EastMapConnection:: ; d1cd
EastConnectedMapGroup:: ; d1cd
	ds 1
EastConnectedMapNumber:: ; d1ce
	ds 1
EastConnectionStripPointer:: ; d1cf
	ds 2
EastConnectionStripLocation:: ; d1d1
	ds 2
EastConnectionStripLength:: ; d1d3
	ds 1
EastConnectedMapWidth:: ; d1d4
	ds 1
EastConnectionStripYOffset:: ; d1d5
	ds 1
EastConnectionStripXOffset:: ; d1d6
	ds 1
EastConnectionWindow:: ; d1d7
	ds 2


TilesetHeader::
TilesetBank:: ; d1d9
	ds 1
TilesetAddress:: ; d1da
	ds 2
TilesetBlocksBank:: ; d1dc
	ds 1
TilesetBlocksAddress:: ; d1dd
	ds 2
TilesetCollisionBank:: ; d1df
	ds 1
TilesetCollisionAddress:: ; d1e0
	ds 2
TilesetAnim:: ; d1e2
; bank 3f
	ds 2
; unused ; d1e4
	ds 2
TilesetPalettes:: ; d1e6
; bank 3f
	ds 2

EvolvableFlags:: ; d1e8
	flag_array PARTY_LENGTH

wForceEvolution:: db ; d1e9

; HP bar animations
wCurHPAnimMaxHP::   dw ; d1ea
wCurHPAnimOldHP::   dw ; d1ec
wCurHPAnimNewHP::   dw ; d1ee
wCurHPAnimPal::     db ; d1f0
wCurHPBarPixels::   db ; d1f1
wNewHPBarPixels::   db ; d1f2
wCurHPAnimDeltaHP:: dw ; d1f3
wCurHPAnimLowHP::   db ; d1f5
wCurHPAnimHighHP::  db ; d1f6
	ds wCurHPAnimMaxHP - @

MagikarpLength::
wEvolutionOldSpecies::
Buffer1:: ; d1ea
	ds 1
MovementType::
wEvolutionNewSpecies::
Buffer2:: ; d1eb
	ds 1
wEvolutionPicOffset::
Buffer3::
wd1ec:: ds 1
wEvolutionCanceled::
Buffer4::
wd1ed:: ds 1
Buffer5::
wd1ee:: ds 1
Buffer6::
wd1ef:: ds 1
wd1f0:: ds 1
CurEnemyItem::
wd1f1:: ds 1
wd1f2:: ds 1
wd1f3:: ds 1
wd1f4:: ds 1
wd1f5:: ds 1
wd1f6::
	ds 4

LinkBattleRNs:: ; d1fa
	ds 10

TempEnemyMonSpecies::  ds 1 ; d204
TempBattleMonSpecies:: ds 1 ; d205

EnemyMon:: battle_struct EnemyMon ; d206
EnemyMonBaseStats:: ds 5 ; d226
EnemyMonCatchRate:: db ; d22b
EnemyMonBaseExp::   db ; d22c
EnemyMonEnd::


wBattleMode:: ; d22d
; 0: overworld
; 1: wild battle
; 2: trainer battle
	ds 1

TempWildMonSpecies:: ds 1
OtherTrainerClass:: ; d22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	ds 1

BattleType:: ; d230
; $00 normal
; $01 can lose
; $02 debug
; $03 dude/tutorial
; $04 fishing
; $05 roaming
; $06 contest
; $07 shiny
; $08 headbutt/rock smash
; $09 trap
; $0a force Item1
; $0b celebi
; $0c suicune
	ds 1

OtherTrainerID:: ; d231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	ds 1

wForcedSwitch:: ds 1

TrainerClass:: ; d233
	ds 1

UnownLetter:: ; d234
	ds 1

wMoveSelectionMenuType:: ds 1

CurBaseData:: ; d236
BaseDexNo:: ; d236
	ds 1
BaseStats:: ; d237
BaseHP:: ; d237
	ds 1
BaseAttack:: ; d238
	ds 1
BaseDefense:: ; d239
	ds 1
BaseSpeed:: ; d23a
	ds 1
BaseSpecialAttack:: ; d23b
	ds 1
BaseSpecialDefense:: ; d23c
	ds 1
BaseType:: ; d23d
BaseType1:: ; d23d
	ds 1
BaseType2:: ; d23e
	ds 1
BaseCatchRate:: ; d23f
	ds 1
BaseExp:: ; d240
	ds 1
BaseItems:: ; d241
	ds 2
BaseGender:: ; d243
	ds 1
BaseUnknown1:: ; d244
	ds 1
BaseEggSteps:: ; d245
	ds 1
BaseUnknown2:: ; d246
	ds 1
BasePicSize:: ; d247
	ds 1
BasePadding:: ; d248
	ds 4
BaseGrowthRate:: ; d24c
	ds 1
BaseEggGroups:: ; d24d
	ds 1
BaseTMHM:: ; d24e
	ds 8


CurDamage:: ; d256
	ds 2

	ds 2
wMornEncounterRate::  ds 1 ; d25a
wDayEncounterRate::   ds 1 ; d25b
wNiteEncounterRate::  ds 1 ; d25c
wWaterEncounterRate:: ds 1 ; d25d
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: ds 1
wInitListType:: ds 1
wBattleHasJustStarted:: ds 1
wFoundMatchingIDInParty::
wNamedObjectIndexBuffer::
wCurTMHM::
wTypeMatchup::
wd265:: ds 1
wFailedToFlee:: ds 1
wNumFleeAttempts:: ds 1
wMonTriedToEvolve:: ds 1

TimeOfDay:: ; d269
	ds 1

	ds 1

SECTION "Enemy Party", WRAMX, BANK [1]
wPokedexShowPointerAddr::
wd26b:: ds 1
wd26c:: ds 1
wPokedexShowPointerBank::
wd26d:: ds 1
	ds 3
wd271:: ds 5
	ds wd26b - @


; SECTION "Enemy Party", WRAMX, BANK [1]
OTPlayerName:: ds NAME_LENGTH ; d26b
OTPlayerID:: ds 2 ; d276
	ds 8
OTPartyCount::   ds 1 ; d280
OTPartySpecies:: ds PARTY_LENGTH ; d281
OTPartyEnd::     ds 1

wDudeBag:: ; d288
wDudeNumItems:: ds 1
wDudeItems:: ds 2 * 4
wDudeItemsEnd:: ds 1

wDudeNumKeyItems:: ds 1 ; d292
wDudeKeyItems:: ds 18
wDudeKeyItemsEnd:: ds 1

wDudeNumBalls:: ds 1 ; d2a6
wDudeBalls:: ds 2 * 4 ; d2a7
wDudeBallsEnd:: ds 1 ; d2af
wDudeBagEnd::
	ds wDudeBag - @

OTPartyMons::
OTPartyMon1:: party_struct OTPartyMon1 ; d288
OTPartyMon2:: party_struct OTPartyMon2 ; d2b8
OTPartyMon3:: party_struct OTPartyMon3 ; d2e8
OTPartyMon4:: party_struct OTPartyMon4 ; d318
OTPartyMon5:: party_struct OTPartyMon5 ; d348
OTPartyMon6:: party_struct OTPartyMon6 ; d378
OTPartyMonsEnd::

OTPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; d3a8
OTPartyMonNicknames:: ds PKMN_NAME_LENGTH * PARTY_LENGTH ; d3ea
OTPartyDataEnd::
	ds 4

wd430::
wBattleAction:: ds 1 ; d430

wd431:: ds 1
MapStatus:: ; d432
	ds 1
MapEventStatus:: ; d433
; 0: do map events
; 1: do background events
	ds 1

ScriptFlags:: ; d434
; bit 3: priority jump
	ds 1
ScriptFlags2:: ; d435
	ds 1
ScriptFlags3:: ; d436
; bit 0: count steps
; bit 1: xy triggers
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	ds 1

ScriptMode:: ; d437
	ds 1
ScriptRunning:: ; d438
	ds 1
ScriptBank:: ; d439
	ds 1
ScriptPos:: ; d43a
	ds 2

wScriptStackSize:: ds 1
wScriptStack:: ds 3 * 5
	ds 1
ScriptDelay:: ; d44d
	ds 1

wPriorityScriptBank::
wScriptTextBank::
	ds 1 ; d44e
wPriorityScriptAddr::
wScriptTextAddr:: ds 2 ; d44f
	ds 1
wWildEncounterCooldown:: ds 1 ; d452
wXYComparePointer:: ds 2 ; d453
	ds 4

wBattleScriptFlags:: ds 2 ; d459
wPlayerSpriteSetupFlags:: ds 1 ; d45b
; bit 7: if set, cancel PlayerAction
; bit 5: if set, set facing according to bits 0-1
; bits 0-1: direction facing
wMapReentryScriptQueueFlag:: ds 1 ; d45c MemScriptFlag
wMapReentryScriptBank:: ds 1 ; d45d MemScriptBank
wMapReentryScriptAddress:: ds 2 ; d45e MemScriptAddr
	ds 4     ; ?????????????
wTimeCyclesSinceLastCall:: ds 1 ; d464
wReceiveCallDelay_MinsRemaining:: ds 1 ; d465
wReceiveCallDelay_StartTime:: ds 3 ; d466
	ds 3
wBugContestMinsRemaining:: ds 1 ; d46c
wBugContestSecsRemaining:: ds 1 ; d46d
	ds 2
wMapStatusEnd:: ds 2 ; d470

wCrystalData::
PlayerGender:: ; d472
; bit 0:
;	0 male
;	1 female
	ds 1
wd473:: ds 1
wd474:: ds 1
wd475:: ds 1
wd476:: ds 1
wd477:: ds 1
wd478:: ds 1
wCrystalDataEnd::

wd479:: ds 2

wGameData::
wPlayerData::
PlayerID:: ; d47b
	ds 2

PlayerName:: ds NAME_LENGTH ; d47d
MomsName::   ds NAME_LENGTH ; d488
RivalName::  ds NAME_LENGTH ; d493
RedsName::   ds NAME_LENGTH ; d49e
GreensName:: ds NAME_LENGTH ; d4a9

wSavedAtLeastOnce:: ds 1
wSpawnAfterChampion:: ds 1

; init time set at newgame
StartDay:: ; d4b6
	ds 1
StartHour:: ; d4b7
	ds 1
StartMinute:: ; d4b8
	ds 1
StartSecond:: ; d4b9
	ds 1

wRTC:: ; d4ba
	ds 8
wDST:: ; d4c2
	ds 1

GameTimeCap:: ; d4c3
	ds 1
GameTimeHours:: ; d4c4
	ds 2
GameTimeMinutes:: ; d4c6
	ds 1
GameTimeSeconds:: ; d4c7
	ds 1
GameTimeFrames:: ; d4c8
	ds 1

	ds 2

CurDay:: ; d4cb
	ds 1

	ds 1
wObjectFollow_Leader:: ds 1
wObjectFollow_Follower:: ds 1
wCenteredObject:: ds 1
wFollowerMovementQueueLength:: ds 1
wFollowMovementQueue:: ds 5

ObjectStructs:: ; d4d6
	object_struct Player
	object_struct Object1
	object_struct Object2
	object_struct Object3
	object_struct Object4
	object_struct Object5
	object_struct Object6
	object_struct Object7
	object_struct Object8
	object_struct Object9
	object_struct Object10
	object_struct Object11
	object_struct Object12
ObjectStructsEnd:: ; d6de

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE
	ds $28

MapObjects:: ; d71e
	map_object Player
	map_object Map1
	map_object Map2
	map_object Map3
	map_object Map4
	map_object Map5
	map_object Map6
	map_object Map7
	map_object Map8
	map_object Map9
	map_object Map10
	map_object Map11
	map_object Map12
	map_object Map13
	map_object Map14
	map_object Map15
MapObjectsEnd::

wObjectMasks:: ds NUM_OBJECTS ; d81e

VariableSprites:: ; d82e
	ds $10

wEnteredMapFromContinue:: ds 1 ; d83e
	ds 2
TimeOfDayPal:: ; d841
	ds 1
	ds 4
; d846
wTimeOfDayPalFlags:: ds 1
wTimeOfDayPalset:: ds 1
CurTimeOfDay:: ; d848
	ds 1

	ds 1

wSecretID:: ds 2
StatusFlags:: ; d84c
	; 0 - pokedex
	; 1 - unown dex
	; 2 -
	; 3 - pokerus
	; 4 - rocket signal
	; 5 - wild encounters on/off
	; 6 - hall of fame
	; 7 - bug contest on
	ds 1

StatusFlags2:: ; d84d
	; 0 - rockets
	; 1 -
	; 2 - bug contest timer
	; 3 -
	; 4 - bike shop call
	; 5 - pokerus
	; 6 - berry juice?
	; 7 - rockets in mahogany
	ds 1

Money:: ; d84e
	ds 3

wMomsMoney:: ; d851
	ds 3
wMomSavingMoney:: ; d854
	ds 1

Coins:: ; d855
	ds 2

Badges::
JohtoBadges:: ; d857
	flag_array 8
KantoBadges:: ; d858
	flag_array 8


TMsHMs:: ; d859
	ds NUM_TMS + NUM_HMS
TMsHMsEnd::

NumItems:: ; d892
	ds 1
Items:: ; d893
	ds MAX_ITEMS * 2 + 1
ItemsEnd::

NumKeyItems:: ; d8bc
	ds 1
KeyItems:: ; d8bd
	ds MAX_KEY_ITEMS + 1
KeyItemsEnd::

NumBalls:: ; d8d7
	ds 1
Balls:: ; d8d8
	ds MAX_BALLS * 2 + 1
BallsEnd::

PCItems:: ; d8f1
	ds MAX_PC_ITEMS * 2 + 1
PCItemsEnd::

	ds 1

wPokegearFlags:: ds 1
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
wRadioTuningKnob:: ds 1
wLastDexMode:: ds 2
WhichRegisteredItem:: ; d95b
	ds 1
RegisteredItem:: ; d95c
	ds 1

PlayerState:: ; d95d
	ds 1

wHallOfFameCount:: ds 2
wTradeFlags:: flag_array 6 ; d960
	ds 1
MooMooBerries:: ; d962
	ds 1 ; how many berries fed to MooMoo
UndergroundSwitchPositions:: ; d963
	ds 1 ; which positions the switches are in
FarfetchdPosition:: ; d964
	ds 1 ; which position the ilex farfetch'd is in

	ds 13


;SECTION "Map Triggers", WRAMX, BANK [1]

wPokecenter2FTrigger::                       ds 1 ; d972
wTradeCenterTrigger::                        ds 1 ; d973
wColosseumTrigger::                          ds 1 ; d974
wTimeCapsuleTrigger::                        ds 1 ; d975
wPowerPlantTrigger::                         ds 1 ; d976
wCeruleanGymTrigger::                        ds 1 ; d977
wRoute25Trigger::                            ds 1 ; d978
wTrainerHouseB1FTrigger::                    ds 1 ; d979
wVictoryRoadGateTrigger::                    ds 1 ; d97a
wSaffronTrainStationTrigger::                ds 1 ; d97b
wRoute16GateTrigger::                        ds 1 ; d97c
wRoute1718GateTrigger::                      ds 1 ; d97d
wIndigoPlateauPokecenter1FTrigger::          ds 1 ; d97e
wWillsRoomTrigger::                          ds 1 ; d97f
wKogasRoomTrigger::                          ds 1 ; d980
wBrunosRoomTrigger::                         ds 1 ; d981
wKarensRoomTrigger::                         ds 1 ; d982
wLancesRoomTrigger::                         ds 1 ; d983
wHallOfFameTrigger::                         ds 1 ; d984
wRoute27Trigger::                            ds 1 ; d985
wNewBarkTownTrigger::                        ds 1 ; d986
wElmsLabTrigger::                            ds 1 ; d987
wKrissHouse1FTrigger::                       ds 1 ; d988
wRoute29Trigger::                            ds 1 ; d989
wCherrygroveCityTrigger::                    ds 1 ; d98a
wMrPokemonsHouseTrigger::                    ds 1 ; d98b
wRoute32Trigger::                            ds 1 ; d98c
wRoute35NationalParkGateTrigger::            ds 1 ; d98d
wRoute36Trigger::                            ds 1 ; d98e
wRoute36NationalParkGateTrigger::            ds 1 ; d98f
wAzaleaTownTrigger::                         ds 1 ; d990
wGoldenrodGymTrigger::                       ds 1 ; d991
wGoldenrodMagnetTrainStationTrigger::        ds 1 ; d992
wGoldenrodPokecenter1FTrigger::              ds 1 ; d993
wOlivineCityTrigger::                        ds 1 ; d994
wRoute34Trigger::                            ds 1 ; d995
wRoute34IlexForestGateTrigger::              ds 1 ; d996
wEcruteakHouseTrigger::                      ds 1 ; d997
wWiseTriosRoomTrigger::                      ds 1 ; d998
wEcruteakPokecenter1FTrigger::               ds 1 ; d999
wEcruteakGymTrigger::                        ds 1 ; d99a
wMahoganyTownTrigger::                       ds 1 ; d99b
wRoute42Trigger::                            ds 1 ; d99c
wCianwoodCityTrigger::                       ds 1 ; d99d
wBattleTower1FTrigger::                      ds 1 ; d99e
wBattleTowerBattleRoomTrigger::              ds 1 ; d99f
wBattleTowerElevatorTrigger::                ds 1 ; d9a0
wBattleTowerHallwayTrigger::                 ds 1 ; d9a1
wBattleTowerOutsideTrigger::                 ds 1 ; d9a2
wRoute43GateTrigger::                        ds 1 ; d9a3
wMountMoonTrigger::                          ds 1 ; d9a4
wSproutTower3FTrigger::                      ds 1 ; d9a5
wTinTower1FTrigger::                         ds 1 ; d9a6
wBurnedTower1FTrigger::                      ds 1 ; d9a7
wBurnedTowerB1FTrigger::                     ds 1 ; d9a8
wRadioTower5FTrigger::                       ds 1 ; d9a9
wRuinsOfAlphOutsideTrigger::                 ds 1 ; d9aa
wRuinsOfAlphResearchCenterTrigger::          ds 1 ; d9ab
wRuinsOfAlphHoOhChamberTrigger::             ds 1 ; d9ac
wRuinsOfAlphKabutoChamberTrigger::           ds 1 ; d9ad
wRuinsOfAlphOmanyteChamberTrigger::          ds 1 ; d9ae
wRuinsOfAlphAerodactylChamberTrigger::       ds 1 ; d9af
wRuinsOfAlphInnerChamberTrigger::            ds 1 ; d9b0
wMahoganyMart1FTrigger::                     ds 1 ; d9b1
wTeamRocketBaseB1FTrigger::                  ds 1 ; d9b2
wTeamRocketBaseB2FTrigger::                  ds 1 ; d9b3
wTeamRocketBaseB3FTrigger::                  ds 1 ; d9b4
wUndergroundPathSwitchRoomEntrancesTrigger:: ds 1 ; d9b5
wSilverCaveRoom3Trigger::                    ds 1 ; d9b6
wVictoryRoadTrigger::                        ds 1 ; d9b7
wDragonsDenB1FTrigger::                      ds 1 ; d9b8
wDragonShrineTrigger::                       ds 1 ; d9b9
wOlivinePortTrigger::                        ds 1 ; d9ba
wVermilionPortTrigger::                      ds 1 ; d9bb
wFastShip1FTrigger::                         ds 1 ; d9bc
wFastShipB1FTrigger::                        ds 1 ; d9bd
wMountMoonSquareTrigger::                    ds 1 ; d9be
wMobileTradeRoomMobileTrigger::              ds 1 ; d9bf
wMobileBattleRoomTrigger::                   ds 1 ; d9c0

	ds 49


;SECTION "Events", WRAMX, BANK [1]

wJackFightCount::    ds 1 ; d9f2
wBeverlyFightCount:: ds 1 ; unused
wHueyFightCount::    ds 1
wGavenFightCount::   ds 1
wBethFightCount::    ds 1
wJoseFightCount::    ds 1
wReenaFightCount::   ds 1
wJoeyFightCount::    ds 1
wWadeFightCount::    ds 1
wRalphFightCount::   ds 1
wLizFightCount::     ds 1
wAnthonyFightCount:: ds 1
wToddFightCount::    ds 1
wGinaFightCount::    ds 1
wIrwinFightCount::   ds 1 ; unused
wArnieFightCount::   ds 1
wAlanFightCount::    ds 1
wDanaFightCount::    ds 1
wChadFightCount::    ds 1
wDerekFightCount::   ds 1 ; unused
wTullyFightCount::   ds 1
wBrentFightCount::   ds 1
wTiffanyFightCount:: ds 1
wVanceFightCount::   ds 1
wWiltonFightCount::  ds 1
wKenjiFightCount::   ds 1 ; unused
wParryFightCount::   ds 1
wErinFightCount::    ds 1
; da0e
	ds 100

EventFlags:: ; da72
	flag_array NUM_EVENTS
; db6c

	ds 6

wCurBox:: ; db72
	ds 1

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; db75

wCelebiEvent:: ds 1
	ds 1

BikeFlags:: ; dbf5
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	ds 1

	ds 1
wCurrentMapTriggerPointer:: ds 2 ; dbf7

wCurrentCaller:: ds 2 ; dbf9
wCurrMapWarpCount:: ds 1 ; dbfb
wCurrMapWarpHeaderPointer:: ds 2 ; dbfc
wCurrentMapXYTriggerCount:: ds 1 ; dbfe
wCurrentMapXYTriggerHeaderPointer:: ds 2 ; dbff
wCurrentMapSignpostCount:: ds 1 ; dc01
wCurrentMapSignpostHeaderPointer:: ds 2 ; dc02
wCurrentMapPersonEventCount:: ds 1 ; dc04
wCurrentMapPersonEventHeaderPointer:: ds 2 ; dc05
wCurrMapTriggerCount:: ds 1 ; dc07
wCurrMapTriggerHeaderPointer:: ds 2 ; dc08
wCurrMapCallbackCount:: ds 1 ; dc0a
wCurrMapCallbackHeaderPointer:: ds 2 ; dc0b
	ds 2

; Sprite id of each decoration
Bed:: ; dc0f
	ds 1
Carpet:: ; dc10
	ds 1
Plant:: ; dc11
	ds 1
Poster:: ; dc12
	ds 1
Console:: ; dc13
	ds 1
LeftOrnament:: ; dc14
	ds 1
RightOrnament:: ; dc15
	ds 1
BigDoll:: ; dc16
	ds 1

; Items bought from Mom
wWhichMomItem:: ds 1 ; dc17
wWhichMomItemSet:: ds 1 ; dc18
MomItemTriggerBalance:: ds 3 ; dc19

wDailyResetTimer:: ds 2 ; dc1c
DailyFlags:: ds 1
WeeklyFlags:: ds 1
SwarmFlags:: ds 1
	ds 2
wStartDay:: ds 1
	ds 3

FruitTreeFlags:: flag_array NUM_FRUIT_TREES ; dc27

	ds 2

wLuckyNumberDayBuffer:: ds 2 ; dc2d
	ds 2
wSpecialPhoneCallID:: ds 1 ; dc31
	ds 3
wBugContestStartTime:: ds 4 ; day, hour, min, sec ; dc35
wUnusedTwoDayTimerOn:: ds 1 ; dc39
wUnusedTwoDayTimer:: ds 1
wUnusedTwoDayTimerStartDate:: ds 1
	ds 4
wMobileOrCable_LastSelection:: ds 1
wdc41:: ds 1
wdc42:: ds 8
wBuenasPassword:: ds 1
wBlueCardBalance:: ds 1
wDailyRematchFlags:: ds 4
wDailyPhoneItemFlags:: ds 4
wDailyPhoneTimeOfDayFlags:: ds 4
wKenjiBreakTimer:: ds 2 ; Kenji
wYanmaMapGroup:: ds 1 ; dc5a
wYanmaMapNumber:: ds 1
wPlayerMonSelection:: ds 3
wdc5f:: ds 1
wdc60:: ds 19

StepCount:: ; dc73
	ds 1
PoisonStepCount:: ; dc74
	ds 1

	ds 2
wHappinessStepCount:: ds 1
	ds 1
wParkBallsRemaining::
wSafariBallsRemaining:: ds 1 ; dc79
wSafariTimeRemaining:: ds 2 ; dc7a
wPhoneList:: ds CONTACT_LIST_SIZE ; dc7c
; dc86
	ds 23
wLuckyNumberShowFlag:: ds 2 ; dc9d
wLuckyIDNumber:: ds 2 ; dc9f
wRepelEffect:: ds 1 ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: ds 2
wKurtApricornQuantity:: ds 1

wPlayerDataEnd::


wMapData::

VisitedSpawns:: ; dca5
	flag_array NUM_SPAWNS

wDigWarp:: ds 1 ; dcaa
wDigMapGroup:: ds 1 ; dcab
wDigMapNumber:: ds 1 ; dcac
; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupWarpNumber:: ; dcad
	ds 1
BackupMapGroup:: ; dcae
	ds 1
BackupMapNumber:: ; dcaf
	ds 1

	ds 3

wLastSpawnMapGroup:: ds 1
wLastSpawnMapNumber:: ds 1

WarpNumber:: ; dcb4
	ds 1
MapGroup:: ; dcb5
	ds 1 ; map group of current map
MapNumber:: ; dcb6
	ds 1 ; map number of current map
YCoord:: ; dcb7
	ds 1 ; current y coordinate relative to top-left corner of current map
XCoord:: ; dcb8
	ds 1 ; current x coordinate relative to top-left corner of current map
wScreenSave:: ds 6 * 5

wMapDataEnd::


SECTION "Party", WRAMX, BANK [1]

wPokemonData::

PartyCount:: ; dcd7
	ds 1 ; number of Pokémon in party
PartySpecies:: ; dcd8
	ds PARTY_LENGTH ; species of each Pokémon in party
PartyEnd:: ; dcde
	ds 1 ; legacy scripts don't check PartyCount

PartyMons::
PartyMon1:: party_struct PartyMon1 ; dcdf
PartyMon2:: party_struct PartyMon2 ; dd0f
PartyMon3:: party_struct PartyMon3 ; dd3f
PartyMon4:: party_struct PartyMon4 ; dd6f
PartyMon5:: party_struct PartyMon5 ; dd9f
PartyMon6:: party_struct PartyMon6 ; ddcf

PartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; ddff

PartyMonNicknames:: ds PKMN_NAME_LENGTH * PARTY_LENGTH ; de41
PartyMonNicknamesEnd::


	ds 22


PokedexCaught:: ; de99
	flag_array NUM_POKEMON
EndPokedexCaught::

PokedexSeen:: ; deb9
	flag_array NUM_POKEMON
EndPokedexSeen::

UnownDex:: ; ded9
	ds 26
UnlockedUnowns:: ; def3
	ds 1

wFirstUnownSeen:: ds 1


wDaycareMan:: ; def5
; bit 7: active
; bit 6: monsters are compatible
; bit 5: egg ready
; bit 0: monster 1 in daycare
	ds 1

wBreedMon1::
wBreedMon1Nick::  ds PKMN_NAME_LENGTH ; def6
wBreedMon1OT::    ds NAME_LENGTH ; df01
wBreedMon1Stats:: box_struct wBreedMon1 ; df0c

wDaycareLady:: ; df2c
; bit 7: active
; bit 0: monster 2 in daycare
	ds 1

wStepsToEgg:: ; df2d
	ds 1
wBreedMotherOrNonDitto:: ; df2e
;  z: yes
; nz: no
	ds 1

wBreedMon2::
wBreedMon2Nick::  ds PKMN_NAME_LENGTH ; df2f
wBreedMon2OT::    ds NAME_LENGTH ; df3a
wBreedMon2Stats:: box_struct wBreedMon2 ; df45

wEggNick:: ds PKMN_NAME_LENGTH ; df65
wEggOT::   ds NAME_LENGTH ; df70
wEggMon::  box_struct wEggMon ; df7b

wBugContestSecondPartySpecies:: ds 1
wContestMon:: party_struct wContestMon ; df9c

wDunsparceMapGroup:: ds 1
wDunsparceMapNumber:: ds 1
wFishingSwarmFlag:: ds 1

wRoamMon1:: roam_struct wRoamMon1 ; dfcf
wRoamMon2:: roam_struct wRoamMon2 ; dfd6
wRoamMon3:: roam_struct wRoamMon3 ; dfdd

wRoamMons_CurrentMapNumber:: ds 1
wRoamMons_CurrentMapGroup:: ds 1
wRoamMons_LastMapNumber:: ds 1
wRoamMons_LastMapGroup:: ds 1
wBestMagikarpLengthFeet:: ds 1
wBestMagikarpLengthInches:: ds 1
wMagikarpRecordHoldersName:: ds NAME_LENGTH
; dff5
wPokemonDataEnd::
wGameDataEnd::

SECTION "Pic Animations", WRAMX, BANK [2]

TempTileMap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT ; $168 = 360
; PokeAnim Header
wPokeAnimSceneIndex:: ds 1
wPokeAnimPointer:: ds 2
wPokeAnimSpecies:: ds 1
wPokeAnimUnownLetter:: ds 1
wPokeAnimSpeciesOrUnown:: ds 1
wPokeAnimGraphicStartTile:: ds 1
wPokeAnimCoord:: ds 2
wPokeAnimFrontpicHeight:: ds 1
; PokeAnim Data
wPokeAnimExtraFlag:: ds 1
wPokeAnimSpeed:: ds 1
wPokeAnimPointerBank:: ds 1
wPokeAnimPointerAddr:: ds 2
wPokeAnimFramesBank:: ds 1
wPokeAnimFramesAddr:: ds 2
wPokeAnimBitmaskBank:: ds 1
wPokeAnimBitmaskAddr:: ds 2
wPokeAnimFrame:: ds 1
wPokeAnimJumptableIndex:: ds 1
wPokeAnimRepeatTimer:: ds 1
wPokeAnimCurBitmask:: ds 1
wPokeAnimWaitCounter:: ds 1
wPokeAnimCommand:: ds 1
wPokeAnimParameter:: ds 1
	ds 1
wPokeAnimBitmaskCurCol:: ds 1
wPokeAnimBitmaskCurRow:: ds 1
wPokeAnimBitmaskCurBit:: ds 1
wPokeAnimBitmaskBuffer:: ds 7
	ds 2
wPokeAnimStructEnd::


SECTION "Battle Tower", WRAMX, BANK [3]

w3_d000:: ds 1 ; d000
w3_d001:: ds 1
w3_d002::
	ds $7e
w3_d080::
	ds $10
w3_d090::
	ds $70

w3_d100:: ; BattleTower OpponentTrainer-Data (length = 0xe0 = $a + $1 + 3*$3b + $24)
BT_OTTrainer:: battle_tower_struct BT_OT
; d1e0
	ds $20
; d200
BT_TrainerTextIndex:: ds 2
w3_d202:: battle_tower_struct w3_d202
w3_d2e2:: battle_tower_struct w3_d2e2
w3_d3c2:: battle_tower_struct w3_d3c2
w3_d4a2:: battle_tower_struct w3_d4a2
w3_d582:: battle_tower_struct w3_d582
w3_d662:: battle_tower_struct w3_d662
w3_d742:: battle_tower_struct w3_d742
; d822
	ds -$22

wBTChoiceOfLvlGroup::
w3_d800:: ; ds BG_MAP_WIDTH * SCREEN_HEIGHT ($240)
	ds $69
w3_d869:: ds $17
w3_d880:: ds 1
w3_d881:: ds 1
w3_d882:: ds 1
w3_d883:: ds 7
w3_d88a:: ds 5
w3_d88f:: ds 5
w3_d894:: ds 1
w3_d895:: ds 11
w3_d8a0:: ds 1
w3_d8a1:: ds 1
w3_d8a2:: ds 1
w3_d8a3:: ds $19d
w3_da40:: ds $1c0

w3_dc00:: ds SCREEN_WIDTH * SCREEN_HEIGHT
w3_dd68:: ds SCREEN_WIDTH * SCREEN_HEIGHT
	ds $11c
w3_dfec:: ds $10
w3_dffc:: ds 4

SECTION "GBC Video", WRAMX, BANK [5]

; 8 4-color palettes
UnknBGPals:: ds 8 palettes ; d000
UnknOBPals:: ds 8 palettes ; d040
BGPals::     ds 8 palettes ; d080
OBPals::     ds 8 palettes ; d0c0

LYOverrides:: ; d100
	ds SCREEN_HEIGHT_PX
LYOverridesEnd:: ; d190

	ds 1
wMagnetTrainDirection:: ds 1
wMagnetTrainInitPosition:: ds 1
wMagnetTrainHoldPosition:: ds 1
wMagnetTrainFinalPosition:: ds 1
wMagnetTrainPlayerSpriteInitX:: ds 1
	ds 106

LYOverridesBackup:: ; d200
	ds SCREEN_HEIGHT_PX
LYOverridesBackupEnd::


SECTION "Battle Animations", WRAMX [$d300], BANK [5]

wBattleAnimTileDict:: ds 10

ActiveAnimObjects:: ; d30a
AnimObject01:: battle_anim_struct AnimObject01
AnimObject02:: battle_anim_struct AnimObject02
AnimObject03:: battle_anim_struct AnimObject03
AnimObject04:: battle_anim_struct AnimObject04
AnimObject05:: battle_anim_struct AnimObject05
AnimObject06:: battle_anim_struct AnimObject06
AnimObject07:: battle_anim_struct AnimObject07
AnimObject08:: battle_anim_struct AnimObject08
AnimObject09:: battle_anim_struct AnimObject09
AnimObject10:: battle_anim_struct AnimObject10
ActiveAnimObjectsEnd:: ; d3aa

ActiveBGEffects:: ; d3fa
BGEffect1:: battle_bg_effect BGEffect1
BGEffect2:: battle_bg_effect BGEffect2
BGEffect3:: battle_bg_effect BGEffect3
BGEffect4:: battle_bg_effect BGEffect4
BGEffect5:: battle_bg_effect BGEffect5
ActiveBGEffectsEnd::

wNumActiveBattleAnims:: ds 1 ; d40e

BattleAnimFlags:: ; d40f
	ds 1
BattleAnimAddress:: ; d410
	ds 2
BattleAnimDuration:: ; d412
	ds 1
BattleAnimParent:: ; d413
	ds 2
BattleAnimLoops:: ; d415
	ds 1
BattleAnimVar:: ; d416
	ds 1
BattleAnimByte:: ; d417
	ds 1
wBattleAnimOAMPointerLo:: ds 1 ; d418
BattleAnimTemps:: ; d419
wBattleAnimTempOAMFlags::
wBattleAnimTemp0:: ds 1
wBattleAnimTemp1:: ds 1
wBattleAnimTempTileID::
wBattleAnimTemp2:: ds 1
wBattleAnimTempXCoord::
wBattleAnimTemp3:: ds 1
wBattleAnimTempYCoord::
wBattleAnimTemp4:: ds 1
wBattleAnimTempXOffset::
wBattleAnimTemp5:: ds 1
wBattleAnimTempYOffset::
wBattleAnimTemp6:: ds 1
wBattleAnimTemp7:: ds 1
wBattleAnimTempPalette::
wBattleAnimTemp8:: ds 1

wSurfWaveBGEffect:: ds $40
wSurfWaveBGEffectEnd::
	ds -$e
wBattleAnimEnd::

SECTION "WRAM 5 MOBILE", WRAMX [$d800], BANK [5]
w5_d800:: ds $200
w5_da00:: ds $200
w5_dc00:: ds $d
w5_dc0d:: ds 4
w5_dc11:: ds 9
w5_MobileOpponentBattleMessages:: ds $c ; dc1a
w5_MobileOpponentBattleStartMessage:: ds $c ; dc26
w5_MobileOpponentBattleWinMessage:: ds $c ; dc32
w5_MobileOpponentBattleLossMessage:: ds $c ; dc3e

SECTION "WRAM 6", WRAMX, BANK [6]

wDecompressScratch::
wScratchTileMap::
	ds BG_MAP_WIDTH * BG_MAP_HEIGHT
wScratchAttrMap:: ds $200
w6_d600:: ds $200
w6_d800::

INCLUDE "sram.asm"

SECTION "WRAM 7", WRAMX, BANK [7]
wWindowStack:: ds $1000 - 1
wWindowStackBottom:: ds 1
