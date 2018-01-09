INCLUDE "constants.asm"
INCLUDE "macros/wram.asm"


INCLUDE "vram.asm"


SECTION "Stack", WRAM0

StackBottom::
	ds $100 - 1
Stack::
StackTop::
	ds 1


SECTION "Audio RAM", WRAM0

wMusic::

; nonzero if playing
MusicPlaying:: db ; c100

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

wCurTrackDuty:: db
wCurTrackIntensity:: db
wCurTrackFrequency:: dw
wc296:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

CurMusicByte:: db ; c298
CurChannel:: db ; c299
Volume:: ; c29a
; corresponds to $ff24
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
SoundOutput:: ; c29b
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
SoundInput:: ; c29c
; corresponds to $ff26
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	db

MusicID:: dw ; c29d
MusicBank:: db ; c29f
NoiseSampleAddress:: dw ; c2a0
wNoiseSampleDelay:: db ; c2a2
	ds 1 ; c2a3
MusicNoiseSampleSet:: db ; c2a4
SFXNoiseSampleSet:: db ; c2a5

Danger:: ; c2a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

MusicFade:: ; c2a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
MusicFadeCount:: db ; c2a8
MusicFadeID:: dw ; c2a9

	ds 5

CryPitch:: dw ; c2b0
CryLength:: dw ; c2b2

LastVolume:: db ; c2b4
wc2b5:: db ; c2b5

SFXPriority:: ; c2b6
; if nonzero, turn off music when playing sfx
	db

	ds 1

Channel1JumpCondition:: db
Channel2JumpCondition:: db
Channel3JumpCondition:: db
Channel4JumpCondition:: db

wStereoPanningMask:: db ; c2bc

CryTracks:: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
CurSFX:: ; c2bf
; id of sfx currently playing
	db
ChannelsEnd::

wMapMusic:: db ; c2c0

wDontPlayMapMusicOnReload:: db
wMusicEnd::


SECTION "WRAM", WRAM0

wLZAddress:: dw ; c2c2
wLZBank::    db ; c2c4

	ds 1

wBoxAlignment:: db

InputType::        db ; c2c7
AutoInputAddress:: dw ; c2c8
AutoInputBank::    db ; c2ca
AutoInputLength::  db ; c2cb

wMonStatusFlags:: db
wGameLogicPaused:: db ; c2cd
wSpriteUpdatesEnabled:: db

wc2cf:: db ; ????

wMapTimeOfDay:: db

	ds 3

wPrinterConnectionOpen:: db
wPrinterOpcode:: db
wLastDexEntry:: db
wDisableTextAcceleration:: db
wPreviousLandmark:: db
wCurrentLandmark:: db
wLandmarkSignTimer:: dw
wLinkMode:: ; c2dc
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	db

ScriptVar:: db ; c2dd

wPlayerNextMovement:: db
wPlayerMovement:: db
	ds 2
wc2e2::
wMovementObject::
	db
wMovementDataPointer:: ds 3 ; dba
wc2e6:: ds 4
wMovementByteWasControlSwitch:: db
wMovementPointer:: dw ; c2eb

	ds 3

wTempObjectCopyMapObjectIndex:: db ; c2f0
wTempObjectCopySprite:: db ; c2f1
wTempObjectCopySpriteVTile:: db ; c2f2
wTempObjectCopyPalette:: db ; c2f3
wTempObjectCopyMovement:: db ; c2f4
wTempObjectCopyRange:: db ; c2f5
wTempObjectCopyX:: db ; c2f6
wTempObjectCopyY:: db ; c2f7
wTempObjectCopyRadius:: db ; c2f8

	ds 1

TileDown::  db ; c2fa
TileUp::    db ; c2fb
TileLeft::  db ; c2fc
TileRight:: db ; c2fd

TilePermissions:: ; c2fe
; set if tile behavior prevents
; you from walking in that direction
; bit 3: down
; bit 2: up
; bit 1: left
; bit 0: right
	db

	ds 1


SECTION "wSpriteAnims", WRAM0

UNION ; c300
; wSpriteAnimDict is a 10x2 dictionary
; keys: taken from third column of SpriteAnimSeqData
; values: vTiles
wSpriteAnimDict:: ds 10 * 2

wSpriteAnimationStructs::
; field  0:   index
; fields 1-3: loaded from SpriteAnimSeqData
SpriteAnim1::  sprite_anim_struct SpriteAnim1
SpriteAnim2::  sprite_anim_struct SpriteAnim2
SpriteAnim3::  sprite_anim_struct SpriteAnim3
SpriteAnim4::  sprite_anim_struct SpriteAnim4
SpriteAnim5::  sprite_anim_struct SpriteAnim5
SpriteAnim6::  sprite_anim_struct SpriteAnim6
SpriteAnim7::  sprite_anim_struct SpriteAnim7
SpriteAnim8::  sprite_anim_struct SpriteAnim8
SpriteAnim9::  sprite_anim_struct SpriteAnim9
SpriteAnim10:: sprite_anim_struct SpriteAnim10
wSpriteAnimationStructsEnd::

NEXTU ; c300
; mobile data
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
wc314:: ds 152
wc3ac:: ds 8
ENDU ; c3b4

wSpriteAnimCount:: db
wCurrSpriteOAMAddr:: db

CurIcon:: db ; c3b6

wCurIconTile:: db
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurrSpriteAddSubFlags::
	dw
wCurrAnimVTile:: db
wCurrAnimXCoord:: db
wCurrAnimYCoord:: db
wCurrAnimXOffset:: db
wCurrAnimYOffset:: db
wGlobalAnimYOffset:: db
wGlobalAnimXOffset:: db
wSpriteAnimsEnd::

	ds 11

; mobile data
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
wc3fc:: ds 1

	ds 3


SECTION "Sprites", WRAM0

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

UNION ; c608
; unidentified uses
wc608:: ds 480

NEXTU ; c608
; miscellaneous
wMisc:: ds WMISC_WIDTH * WMISC_HEIGHT
wMiscEnd::

NEXTU ; c608
; odd egg
wOddEgg:: party_struct OddEgg
wOddEggName:: ds PKMN_NAME_LENGTH
wOddEggOTName:: ds PKMN_NAME_LENGTH

NEXTU ; c608
; battle tower temp struct
wBT_OTTemp:: battle_tower_struct wBT_OTTemp

NEXTU ; c608
; hall of fame temp struct
wHallOfFameTemp:: hall_of_fame wHallOfFameTemp

NEXTU ; c608
; timeset temp storage
wTimeSetBuffer::
	ds 20
wInitHourBuffer:: db ; c61c
	ds 9
wInitMinuteBuffer:: db ; c626

NEXTU ; c608
; link engine data
	ds 10
wc612:: ds 10

NEXTU ; c608
; battle data
wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct ; c608
wPlayerMoveStruct:: move_struct wPlayerMoveStruct ; c60f

EnemyMonNick::  ds PKMN_NAME_LENGTH ; c616
BattleMonNick:: ds PKMN_NAME_LENGTH ; c621

BattleMon:: battle_struct BattleMon ; c62c

	ds 2

wWildMon:: db ; c64e
	ds 1
wEnemyTrainerItem1:: db ; c650
wEnemyTrainerItem2:: db ; c651
wEnemyTrainerBaseReward:: db ; c652
wEnemyTrainerAIFlags:: ds 3 ; c653
OTClassName:: ds TRAINER_CLASS_NAME_LENGTH ; c656

CurOTMon:: db ; c663

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	db

TypeModifier:: ; c665
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	db

CriticalHit:: ; c666
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	db

AttackMissed:: ; c667
; nonzero for a miss
	db

PlayerSubStatus1:: ; c668
; bit
; 7 in love
; 6 rollout
; 5 endure
; 4 perish song
; 3 identified
; 2 protect
; 1 curse
; 0 nightmare
	db
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
	db
PlayerSubStatus3:: ; c66a
; bit
; 7 confused
; 6 flying
; 5 underground
; 4 charged
; 3 flinched
; 2 in loop
; 1 rampage
; 0 bide
	db
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
	db
PlayerSubStatus5:: ; c66c
; bit
; 7 can't run
; 6 destiny bond
; 5 lock-on
; 4 encored
; 3 transformed
; 2
; 1
; 0 toxic
	db

EnemySubStatus1:: ; c66d
; see PlayerSubStatus1
	db
EnemySubStatus2:: ; c66e
; see PlayerSubStatus2
	db
EnemySubStatus3:: ; c66f
; see PlayerSubStatus3
	db
EnemySubStatus4:: ; c670
; see PlayerSubStatus4
	db
EnemySubStatus5:: ; c671
; see PlayerSubStatus5
	db

PlayerRolloutCount:: db ; c672
PlayerConfuseCount:: db ; c673
PlayerToxicCount:: db ; c674
PlayerDisableCount:: db ; c675
PlayerEncoreCount:: db ; c676
PlayerPerishCount:: db ; c677
PlayerFuryCutterCount:: db ; c678
PlayerProtectCount:: db ; c679

EnemyRolloutCount:: db ; c67a
EnemyConfuseCount:: db ; c67b
EnemyToxicCount:: db ; c67c
EnemyDisableCount:: db ; c67d
EnemyEncoreCount:: db ; c67e
EnemyPerishCount:: db ; c67f
EnemyFuryCutterCount:: db ; c680
EnemyProtectCount:: db ; c681

PlayerDamageTaken:: dw ; c682
EnemyDamageTaken:: dw ; c684

wBattleReward:: ds 3 ; c686
wBattleAnimParam::
wKickCounter::
wPresentPower::
	db ; c689
BattleScriptBuffer:: ds 40 ; c68a

BattleScriptBufferAddress:: dw ; c6b2

wTurnEnded:: db ; c6b4

	ds 1

PlayerStats:: ; c6b6
PlayerAttack:: dw
PlayerDefense:: dw
PlayerSpeed:: dw
PlayerSpAtk:: dw
PlayerSpDef:: dw
	ds 1

EnemyStats:: ; c6c1
EnemyAttack:: dw
EnemyDefense:: dw
EnemySpeed:: dw
EnemySpAtk:: dw
EnemySpDef:: dw
	ds 1

PlayerStatLevels:: ; c6cc
; 07 neutral
PlayerAtkLevel:: db ; c6cc
PlayerDefLevel:: db ; c6cd
PlayerSpdLevel:: db ; c6ce
PlayerSAtkLevel:: db ; c6cf

UNION ; c6d0
; finish battle RAM
PlayerSDefLevel:: db ; c6d0
PlayerAccLevel:: db ; c6d1
PlayerEvaLevel:: db ; c6d2
	ds 1 ; c6d3
PlayerStatLevelsEnd::

EnemyStatLevels:: ; c6d4
; 07 neutral
EnemyAtkLevel:: db ; c6d4
EnemyDefLevel:: db ; c6d5
EnemySpdLevel:: db ; c6d6
EnemySAtkLevel:: db ; c6d7
EnemySDefLevel:: db ; c6d8
EnemyAccLevel:: db ; c6d9
EnemyEvaLevel:: db ; c6da
	ds 1

EnemyTurnsTaken:: db ; c6dc
PlayerTurnsTaken:: db ; c6dd
	ds 1

PlayerSubstituteHP:: db ; c6df
EnemySubstituteHP:: db ; c6e0

wUnusedPlayerLockedMove:: db ; c6e1
	ds 1

CurPlayerMove:: db ; c6e3
CurEnemyMove:: db ; c6e4

LinkBattleRNCount:: ; c6e5
; how far through the prng stream
	db

wEnemyItemState:: db ; c6e6
	ds 2
CurEnemyMoveNum:: db ; c6e9

wEnemyHPAtTimeOfPlayerSwitch:: dw ; c6ea
wPayDayMoney:: ds 3 ; c6ec

wSafariMonAngerCount:: db
wSafariMonEating:: db
	ds 1
wEnemyBackupDVs:: dw ; used when enemy is transformed
AlreadyDisobeyed:: db ; c6f4

DisabledMove:: db ; c6f5
EnemyDisabledMove:: db ; c6f6
wWhichMonFaintedFirst:: db

; exists so you can't counter on switch
LastPlayerCounterMove:: db ; c6f8
LastEnemyCounterMove:: db ; c6f9

wEnemyMinimized:: db ; c6fa

AlreadyFailed:: db ; c6fb

wBattleParticipantsIncludingFainted:: db ; c6fc
wDanger:: db ; c6fd
wPlayerMinimized:: db ; c6fe
PlayerScreens:: ; c6ff
; bit
; 7
; 6
; 5
; 4 reflect
; 3 light screen
; 2 safeguard
; 1
; 0 spikes
	db

EnemyScreens:: ; c700
; see PlayerScreens
	db

PlayerSafeguardCount:: db ; c701
PlayerLightScreenCount:: db ; c702
PlayerReflectCount:: db ; c703
	ds 1

EnemySafeguardCount:: db ; c705
EnemyLightScreenCount:: db ; c706
EnemyReflectCount:: db ; c707
	ds 2

Weather:: ; c70a
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	db

WeatherCount:: ; c70b
; # turns remaining
	db

LoweredStat:: db ; c70c
EffectFailed:: db ; c70d
FailedMessage:: db ; c70e
wEnemyGoesFirst:: db ; c70f

wPlayerIsSwitching:: db ; c710
wEnemyIsSwitching::  db ; c711

PlayerUsedMoves:: ; c712
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: db ; c716
wEnemySwitchMonParam:: db ; c717
wEnemySwitchMonIndex:: db ; c718
wTempLevel:: db ; c719
LastPlayerMon:: db ; c71a
LastPlayerMove:: db ; c71b
LastEnemyMove:: db ; c71c

wPlayerFutureSightCount:: db ; c71d
wEnemyFutureSightCount:: db ; c71e

wGivingExperienceToExpShareHolders:: db ; c71f

wBackupEnemyMonBaseStats:: ds 5 ; c720
wBackupEnemyMonCatchRate:: db ; c725
wBackupEnemyMonBaseExp:: db ; c726

wPlayerFutureSightDamage:: dw ; c727
wEnemyFutureSightDamage:: dw ; c729
wPlayerRageCounter:: db ; c72b
wEnemyRageCounter:: db ; c72c

wBeatUpHitAtLeastOnce:: db ; c72d

wPlayerTrappingMove:: db ; c72e
wEnemyTrappingMove:: db ; c72f
wPlayerWrapCount:: db ; c730
wEnemyWrapCount:: db ; c731
wPlayerCharging:: db ; c732
wEnemyCharging:: db ; c733

BattleEnded:: db ; c734

wWildMonMoves:: ds NUM_MOVES ; c735
wWildMonPP:: ds NUM_MOVES ; c739

wAmuletCoin:: db ; c73a

wSomeoneIsRampaging:: db ; c73b

wPlayerJustGotFrozen:: db ; c73c
wEnemyJustGotFrozen:: db ; c73d
wBattleEnd::
; Battle RAM
; c741

NEXTU ; c6d0
; trade
wTrademons::
wPlayerTrademon:: trademon wPlayerTrademon
wOTTrademon::     trademon wOTTrademon
wTrademonsEnd::
wTradeAnimAddress:: dw
wLinkPlayer1Name:: ds NAME_LENGTH
wLinkPlayer2Name:: ds NAME_LENGTH
wLinkTradeSendmonSpecies:: db
wLinkTradeGetmonSpecies::  db

NEXTU ; c6d0
; naming screen
wNamingScreenDestinationPointer:: dw ; c6d0
wNamingScreenCurrNameLength:: db ; c6d2
wNamingScreenMaxNameLength:: db ; c6d3
wNamingScreenType:: db ; c6d4
wNamingScreenCursorObjectPointer:: dw ; c6d5
wNamingScreenLastCharacter:: db ; c6d7
wNamingScreenStringEntryCoord:: dw ; c6d8

NEXTU ; c6d0
; pokegear
wPokegearPhoneLoadNameBuffer:: db ; c6d0
wPokegearPhoneCursorPosition:: db ; c6d1
wPokegearPhoneScrollPosition:: db ; c6d2
wPokegearPhoneSelectedPerson:: db ; c6d3
wPokegearPhoneSubmenuCursor:: db ; c6d4
wPokegearMapCursorObjectPointer:: dw ; c6d5
wPokegearMapCursorLandmark:: db ; c6d7
wPokegearMapPlayerIconLandmark:: db ; c6d8
wPokegearRadioChannelBank:: db ; c6d9
wPokegearRadioChannelAddr:: dw ; c6da
wPokegearRadioMusicPlaying:: db ; c6dc

NEXTU ; c6d0
; slot machine
wSlots::
wReel1:: slot_reel wReel1
wReel2:: slot_reel wReel2
wReel3:: slot_reel wReel3
; c700
wReel1Stopped:: ds 3
wReel2Stopped:: ds 3
wReel3Stopped:: ds 3
wSlotBias:: db
wSlotBet:: db
wFirstTwoReelsMatching:: db
wFirstTwoReelsMatchingSevens:: db
wSlotMatched:: db
wCurrReelStopped:: ds 3
wPayout:: dw
wCurrReelXCoord:: db
wCurrReelYCoord:: db
	ds 2
wSlotBuildingMatch:: db
wSlotsDataEnd::
	ds 28
wSlotsEnd::

NEXTU ; c6d0
; card flip
wCardFlip::
wDeck:: ds 24
wDeckEnd::
; c6e8
wCardFlipNumCardsPlayed:: db
wCardFlipFaceUpCard:: db
wDiscardPile:: ds 24
wDiscardPileEnd::
wCardFlipEnd::

NEXTU ; c6d0
; dummy game
wDummyGame::
wDummyGameCards:: ds 9 * 5
wDummyGameCardsEnd::
wDummyGameLastCardPicked:: db ; c6fd
wDummyGameCard1:: db ; c6fe
wDummyGameCard2:: db ; c6ff
wDummyGameCard1Location:: db ; c700
wDummyGameCard2Location:: db ; c701
wDummyGameNumberTriesRemaining:: db ; c702
wDummyGameLastMatches:: ds 5 ; c703
wDummyGameCounter:: db ; c708
wDummyGameNumCardsMatched:: db ; c709
wDummyGameEnd::

NEXTU ; c6d0
; unown puzzle
wUnownPuzzle::
wPuzzlePieces:: ds 6 * 6
wUnownPuzzleEnd::

NEXTU ; c6d0
; pokedex
wPokedexDataStart::
wPokedexOrder:: ds $100 ; >= NUM_POKEMON
wPokedexOrderEnd::
wDexListingScrollOffset:: db ; offset of the first displayed entry from the start
wDexListingCursor:: db ; Dex cursor
wDexListingEnd:: db ; Last mon to display
wDexListingHeight:: db ; number of entries displayed at once in the dex listing
wCurrentDexMode:: db ; Pokedex Mode
wDexSearchMonType1:: db ; first type to search
wDexSearchMonType2:: db ; second type to search
wDexSearchResultCount:: db
wDexArrowCursorPosIndex:: db
wDexArrowCursorDelayCounter:: db
wDexArrowCursorBlinkCounter:: db
wDexSearchSlowpokeFrame:: db
wUnlockedUnownMode:: db
wDexCurrentUnownIndex:: db
wDexUnownCount:: db
wDexConvertedMonType:: db ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: db
wDexListingCursorBackup:: db
wBackupDexListingCursor:: db
wBackupDexListingPage:: db
wDexCurrentLocation:: db
if DEF(_CRYSTAL11)
wPokedexStatus:: db
wPokedexDataEnd::
else
wPokedexDataEnd:: ds 1
endc
	ds 2

NEXTU ; c6d0
; mobile data
wc6d0:: ds 126
wc74e:: ds 107
wc7b9:: ds 1
wc7ba:: ds 1
wc7bb:: ds 2
wc7bd:: ds 19
wc7d0:: ds 1
wc7d1:: ds 1
wc7d2:: ds 1
wc7d3:: ds 1
wc7d4:: ds 1
ENDU ; c7e8
ENDU ; c7e8

wc7e8:: ds 24 ; ????


SECTION "Overworld Map", WRAM0

UNION ; c800
OverworldMap:: ds 1300 ; c800
OverworldMapEnd::

NEXTU ; c800
; GB Printer screen RAM
wGameboyPrinterRAM::
wGameboyPrinterScreen:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; c800
wGameboyPrinterScreenEnd:: ; c968

NEXTU ; c800
; GB Printer data
wGameboyPrinter2bppSource:: ds 40 tiles
wGameboyPrinter2bppSourceEnd::
wca80:: db
wPrinterRowIndex:: db

; Printer data header
wPrinterData:: ds 4
wPrinterChecksum:: dw ; ca86
wPrinterHandshake:: db
wPrinterStatusFlags::
; bit 7: set if error 1 (battery low)
; bit 6: set if error 4 (too hot or cold)
; bit 5: set if error 3 (paper jammed or empty)
; if this and the previous byte are both $ff: error 2 (connection error)
	db

wHandshakeFrameDelay:: db
wPrinterSerialFrameDelay:: db
wPrinterSendByteOffset:: dw
wPrinterSendByteCounter:: dw

; tilemap backup?
wPrinterTileMapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; ca90
wPrinterTileMapBufferEnd::
wPrinterStatus:: db ; cbf8
	ds 1
wcbfa:: ds 1
wGBPrinterSettings:: db
	ds 16
wGameboyPrinterRAMEnd::

NEXTU ; c800
; bill's pc data
wBillsPCPokemonList:: ; c800
; Pokemon, box number, list index
	ds 3 * 30

NEXTU ; c800
; raw link data
wLinkData:: ds $514
wLinkDataEnd::

NEXTU ; c800
; link data members
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: db
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartySpeciesEnd:: db ; legacy scripts don't check PartyCount

UNION ; c813
; time capsule party data
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

NEXTU ; c813
; link player data
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
ENDU ; c9b7

NEXTU ; c800
; mystery gift data
wMysteryGiftPartyTemp:: ; ds PARTY_LENGTH * (1 + 1 + NUM_MOVES)
wMysteryGiftStaging::
wc800:: ds 1
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
wc821:: ds 47

UNION ; c850
wMysteryGiftTrainerData:: ds (1 + 1 + NUM_MOVES) * PARTY_LENGTH + 2
wMysteryGiftTrainerDataEnd::

NEXTU ; c850
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
ENDU ; c900

wMysteryGiftPartnerData::
wc900:: db
wMysteryGiftPartnerID:: dw
wMysteryGiftPartnerName:: ds NAME_LENGTH
wMysteryGiftPartnerDexCaught:: db
wc90f::
wMysteryGiftPartnerSentDeco:: db
wMysteryGiftPartnerWhichItem:: db
wMysteryGiftPartnerWhichDeco:: db
wMysteryGiftPartnerBackupItem:: db
	ds 1
wMysteryGiftPartnerDataEnd::

	ds 60

wMysteryGiftPlayerData::
	ds 1
wMysteryGiftPlayerID:: dw
wMysteryGiftPlayerName:: ds NAME_LENGTH
wMysteryGiftPlayerDexCaught:: db
wMysteryGiftPlayerSentDeco:: db
wMysteryGiftPlayerWhichItem:: db
wMysteryGiftPlayerWhichDeco:: db
wMysteryGiftPlayerBackupItem:: db
	ds 1
wMysteryGiftPlayerDataEnd::

	ds 144

wc9f4:: ds 5
wc9f9:: ds 7

UNION ; ca00
; blank credits tile buffer
wCreditsFaux2bpp:: ds 128

NEXTU ; ca00
; mystery gift data
wca00:: db
wca01:: db
wca02:: db
	ds 160
ENDU ; caa3

wcaa3:: ds 2
wcaa5:: ds 16
wcab5:: ds 10
wcabf:: ds 10
wcac9:: ds 63
wcb08:: ds 6
wcb0e:: ds 5
wcb13:: ds 9
wcb1c:: ds 14

wBillsPC_ScrollPosition:: db
wBillsPC_CursorPosition:: db
wBillsPC_NumMonsInBox:: db
wBillsPC_NumMonsOnScreen:: db
wBillsPC_LoadedBox:: db ; 0 if party, 1 - 14 if box, 15 if active box
wBillsPC_BackupScrollPosition:: db
wBillsPC_BackupCursorPosition:: db
wBillsPC_BackupLoadedBox:: db
wBillsPC_MonHasMail:: db
	ds 18

wcb45:: ds 20
wcb59:: ds 20
wcb6d:: ds 1
wcb6e:: ds 22
wcb84:: ds 100
wcbe8:: dw
wLinkOTPartyMonTypes:: ds 2 * PARTY_LENGTH
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
ENDU ; cd20


SECTION "Video", WRAM0

UNION ; cd20
; BGMapBuffer
BGMapBuffer::     ds 40 ; cd20
BGMapPalBuffer::  ds 40 ; cd48
BGMapBufferPtrs:: ds 40 ; cd70 ; 20 bg map addresses (16x8 tiles)
BGMapBufferEnd::

NEXTU ; cd20
; credits
CreditsPos:: db
CreditsUnusedCD21:: db
CreditsTimer:: db

NEXTU ; cd20
; mobile data
wMobileMonSpeciesPointerBuffer:: dw
wMobileMonStructurePointerBuffer:: dw
wMobileMonOTNamePointerBuffer:: dw
wMobileMonNicknamePointerBuffer:: dw
wMobileMonMailPointerBuffer:: dw

NEXTU ; cd20
; more mobile data
wcd20:: ds 1
wcd21:: ds 1
wcd22:: ds 1
wcd23:: ds 1
wcd24:: ds 1
wMobileCommsJumptableIndex:: ds 1 ; cd25
wcd26:: ds 1
wcd27:: ds 1
wcd28:: ds 1
wcd29:: ds 1

wMobileMonSpeciesBuffer::
wcd2a:: db

wTempOddEggNickname:: ; ds 11
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
wcd36:: db ; hours
wcd37:: db ; mins
wcd38:: db ; secs

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
wMobileInactivityTimerMinutes:: db ; mins
wMobileInactivityTimerSeconds:: db ; secs
wMobileInactivityTimerFrames:: db ; frames
wcd47:: ds 1

	ds 1

wBTTempOTSprite::
wcd49:: db

wcd4a:: ds 1
wcd4b:: ds 1

wEZChatCursorXCoord::
wcd4c:: db
wEZChatCursorYCoord::
wcd4d:: db

wcd4e:: ds 1
wcd4f:: ds 1
wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1

wMobileOpponentBattleMessage:: ; ds 12
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
wcd6f:: ds 2
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
ENDU ; cd98

SGBPredef:: db ; cd98

PlayerHPPal:: db ; cd99
EnemyHPPal:: db ; cd9a

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: db

	ds 7

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

UNION ; cf41
; addresses dealing with serial comms
	ds 1
wcf42:: db
	ds 1
wcf44:: db
wcf45:: db

NEXTU ; cf41
wTileAnimBuffer:: ds 1 tiles
ENDU ; cf51

; link data
wOtherPlayerLinkMode:: db
wOtherPlayerLinkAction:: db
	ds 3
wPlayerLinkAction:: db
wcf57:: db
	ds 3
wLinkTimeoutFrames:: dw ; cf5b
wcf5d:: dw

MonType:: db ; cf5f

CurSpecies::
CurMove::
	db ; cf60

wNamedObjectTypeBuffer:: db

	ds 1

wBattleTowerBattleEnded::
wJumptableIndex::
	db

UNION ; cf64
; unidentified
wcf64:: db
wcf65:: db
wcf66:: db

NEXTU ; cf64
; intro and title data
wIntroSceneFrameCounter:: db
wTitleScreenTimer:: dw

NEXTU ; cf64
; credits data
wCreditsBorderFrame:: db
wCreditsBorderMon:: db
wCreditsLYOverride:: db

NEXTU ; cf64
; unown puzzle data
wHoldingUnownPuzzlePiece:: db
wUnownPuzzleCursorPosition:: db
wUnownPuzzleHeldPiece:: db

NEXTU ; cf64
; card flip data
wCardFlipCursorY:: db
wCardFlipCursorX:: db
wCardFlipWhichCard:: db

NEXTU ; cf64
; pokedex
wDexEntryPrevJumptableIndex:: db
if !DEF(_CRYSTAL11)
wPokedexStatus:: db
endc

NEXTU ; cf64
; miscellaneous
wNrOfBeatenBattleTowerTrainers::
wMomBankDigitCursorPosition::
wSlotsDelay::
	db
wCurrPocket::
wPrinterQueueLength::
	db
ENDU ; cf67

Requested2bpp::
Requested2bppSize:: db ; cf67
Requested2bppSource:: dw ; cf68
Requested2bppDest:: dw ; cf6a

Requested1bpp::
Requested1bppSize:: db ; cf6c
Requested1bppSource:: dw ; cf6d
Requested1bppDest:: dw ; cf6f

wWindowStackPointer:: dw ; cf71
wMenuJoypad:: db ; cf73
MenuSelection:: db ; cf74
MenuSelectionQuantity:: db ; cf75
wWhichIndexSet:: db ; cf76
wScrollingMenuCursorPosition:: db ; cf77
wWindowStackSize:: db ; cf78

	ds 8

; menu data header
wMenuDataHeader:: ; cf81
wMenuFlags:: db
wMenuBorderTopCoord:: db
wMenuBorderLeftCoord:: db
wMenuBorderBottomCoord:: db
wMenuBorderRightCoord:: db
wMenuData2Pointer:: dw
wMenuCursorBuffer:: dw
wMenuDataBank:: db
	ds 6
wMenuDataHeaderEnd::

wMenuData2::
UNION ; cf91
; MenuData2
wMenuData2Flags:: ; cf91
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
	db
wMenuData2Items:: db ; cf92
wMenuData2IndicesPointer:: dw ; cf94
wMenuData2DisplayFunctionPointer:: dw ; cf96
wMenuData2PointerTableAddr:: dw ; cf97

NEXTU ; cf91
; 2D menu
	ds 2 ; cf91
wMenuData2Spacing:: db ; cf93
wMenuData2_2DMenuItemStringsBank:: db ; cf94
wMenuData2_2DMenuItemStringsAddr:: dw ; cf96
wMenuData2_2DMenuFunctionBank:: db ; cf97
wMenuData2_2DMenuFunctionAddr:: dw ; cf98

NEXTU ; cf91
; scrolling menu
	ds 1 ; cf91
wMenuData2_ScrollingMenuHeight:: db ; cf92
wMenuData2_ScrollingMenuWidth:: db ; cf93
wMenuData2_ScrollingMenuSpacing:: db ; cf94
wMenuData2_ItemsPointerBank:: db ; cf95
wMenuData2_ItemsPointerAddr:: dw ; cf97
wMenuData2_ScrollingMenuFunction1:: ds 3 ; cf98
wMenuData2_ScrollingMenuFunction2:: ds 3 ; cf9b
wMenuData2_ScrollingMenuFunction3:: ds 3 ; cf9e
ENDU ; cfa1
wMenuData2End::

wMenuData3::
w2DMenuCursorInitY:: db ; cfa1
w2DMenuCursorInitX:: db ; cfa2
w2DMenuNumRows:: db ; cfa3
w2DMenuNumCols:: db ; cfa4
w2DMenuFlags1:: db ; cfa5
w2DMenuFlags2:: db ; cfa6
w2DMenuCursorOffsets:: db ; cfa7
wMenuJoypadFilter:: db ; cfa8
wMenuData3End::

wMenuCursorY:: db ; cfa9
wMenuCursorX:: db ; cfaa
wCursorOffCharacter:: db ; cfab
wCursorCurrentTile:: dw ; cfac

	ds 3

OverworldDelay:: db ; cfb1
TextDelayFrames:: db ; cfb2
VBlankOccurred:: db ; cfb3

PredefID:: db ; cfb4
PredefTemp:: dw ; cfb5
PredefAddress:: dw ; cfb7
wFarCallBCBuffer:: dw ; cfb9

wcfbb:: db

wGameTimerPause:: ; cfbc
; bit 0
	db

	ds 1

wcfbe:: ; SGB flags?
; bit 7
	db

	ds 1

InBattleTowerBattle:: ; cfc0
; 0 not in BattleTower-Battle
; 1 BattleTower-Battle
	db

	ds 1

FXAnimID:: dw ; cfc2

wPlaceBallsX:: db ; cfc4
wPlaceBallsY:: db ; cfc5

TileAnimationTimer:: db ; cfc6

; palette backups?
wBGP:: db
wOBP0:: db
wOBP1:: db

wNumHits:: db

	ds 1

Options:: ; cfcc
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	db
wSaveFileExists:: db
TextBoxFrame:: ; cfce
; bits 0-2: textbox frame 0-7
	db
TextBoxFlags::
; bit 0: 1-frame text delay
; bit 4: no text delay
	db
GBPrinter:: ; cfd0
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	db
Options2:: ; cfd1
; bit 1: menu account off/on
	db
	ds 2
OptionsEnd::

; Time buffer, for counting the amount of time since
; an event began.
wSecondsSince:: db
wMinutesSince:: db
wHoursSince:: db
wDaysSince:: db


SECTION "WRAM 1", WRAMX

wd000:: ds 1

DefaultSpawnpoint:: db

UNION ; d002
; mail temp storage
wTempMail:: mailmsg wTempMail

NEXTU ; d002
; poke seer
wSeerAction:: db
wSeerNickname:: ds PKMN_NAME_LENGTH
wSeerCaughtLocation:: ds 17
wSeerTimeOfDay:: ds NAME_LENGTH
wSeerOTName:: ds NAME_LENGTH
wSeerOTNameGrammar:: db
wSeerCaughtLevelString:: ds 4
wSeerCaughtLevel:: db
wSeerCaughtData:: db
wSeerCaughtGender:: db

NEXTU ; d002
; mon buffer
wBufferMonNick:: ds PKMN_NAME_LENGTH ; d002
wBufferMonOT:: ds NAME_LENGTH ; d00d
wBufferMon:: party_struct wBufferMon ; d018
	ds 8
wMonOrItemNameBuffer::

NEXTU ; d002
; bug-catching contest
wBugContestResults::
	bugcontestwinner wBugContestFirstPlace
	bugcontestwinner wBugContestSecondPlace
	bugcontestwinner wBugContestThirdPlace
wBugContestWinnersEnd::
	bugcontestwinner wBugContestTemp
	ds 4
wBugContestWinnerName:: ds NAME_LENGTH

NEXTU ; d002
; mart items
wMartItem1BCD:: ds 3
wMartItem2BCD:: ds 3
wMartItem3BCD:: ds 3
wMartItem4BCD:: ds 3
wMartItem5BCD:: ds 3
wMartItem6BCD:: ds 3
wMartItem7BCD:: ds 3
wMartItem8BCD:: ds 3
wMartItem9BCD:: ds 3
wMartItem10BCD:: ds 3
wMartItemBCDEnd::

NEXTU ; d002
; town map data
wTownMapPlayerIconLandmark:: ds 1
UNION
wTownMapCursorLandmark:: ds 1
wTownMapCursorObjectPointer:: ds 2
NEXTU
wTownMapCursorCoordinates:: ds 2
ENDU

NEXTU ; d002
; phone call data
PhoneScriptBank:: db
PhoneCaller:: dw

NEXTU ; d002
; radio data
wCurrentRadioLine:: db
wNextRadioLine:: db
wRadioTextDelay:: db
wNumRadioLinesPrinted:: db
wOaksPkmnTalkSegmentCounter:: db
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH
wRadioTextEnd::

NEXTU ; d002
; lucky number show
LuckyNumberDigit1Buffer:: db
LuckyNumberDigit2Buffer:: db
LuckyNumberDigit3Buffer:: db
LuckyNumberDigit4Buffer:: db
LuckyNumberDigit5Buffer:: db

NEXTU ; d002
; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
MovementBuffer:: ds 55

NEXTU ; d002
; box printing
wWhichBoxMonToPrint:: db
wFinishedPrintingBox:: db
wAddrOfBoxToPrint:: dw
wBankOfBoxToPrint:: db
wWhichBoxToPrint:: db

NEXTU ; d002
; trainer HUD data
	ds 1
wPlaceBallsDirection:: db
wTrainerHUDTiles:: db

NEXTU ; d002
; mobile participant nicknames
	ds 4
wMobileParticipant1Nickname:: ds NAME_LENGTH_JAPANESE
wMobileParticipant2Nickname:: ds NAME_LENGTH_JAPANESE
wMobileParticipant3Nickname:: ds NAME_LENGTH_JAPANESE

NEXTU ; d002
; earthquake data buffer
wEarthquakeMovementDataBuffer:: ds 5

NEXTU ; d002
; miscellaneous
wTempDayOfWeek::
wApricorns::
wKeepSevenBiasChance:: ; used in the slots to handle the favoring of 7 symbol streaks
	db
	ds 2
StartFlypoint:: db
EndFlypoint:: db

NEXTU ; d002
; unidentified
wd002:: db
wd003:: db
wd004:: db

; mobile?
	ds 3
wd008:: ds 2
	ds 2
wd00c:: ds 1
wd00d:: ds 1
	ds 1
wd00f:: ds 1
wd010:: ds 1
wd011:: ds 1
wd012:: ds 1
wd013:: ds 1
wd014:: ds 2
	ds 1
wd017:: ds 1
wd018:: ds 1
wd019:: ds 1
	ds 19
wd02d:: ds 1
wd02e:: ds 1
wd02f:: ds 1
wd030:: ds 1
wd031:: ds 1
wd032:: ds 1
wd033:: ds 1
wd034:: ds 2
wd036:: ds 2
	ds 6

UNION ; d03e
; engine buffers
EngineBuffer1:: db
EngineBuffer2:: db
EngineBuffer3:: db
EngineBuffer4:: db
EngineBuffer5:: db

NEXTU ; d03e
; menu items list
MenuItemsList:: ds 16
MenuItemsListEnd::

NEXTU ; d03e
; fruit tree data
CurFruitTree:: db
CurFruit:: db

NEXTU ; d03e
; elevator data
wElevatorPointerBank:: db
wElevatorPointer:: dw
wElevatorOriginFloor:: db

NEXTU ; d03e
; coord event data
wCurCoordEventSceneID:: db
wCurCoordEventMapY:: db
wCurCoordEventMapX:: db
	ds 1
wCurCoordEventScriptAddr:: dw

NEXTU ; d03e
; BG event data
wCurBGEventYCoord:: db
wCurBGEventXCoord:: db
wCurBGEventType:: db
wCurBGEventScriptAddr:: dw

NEXTU ; d03e
; mart data
	ds 1
MartPointerBank:: db
MartPointer:: dw
	ds 1
wBargainShopFlags:: db

NEXTU ; d03e
; trainer data
	ds 3
wTempTrainerHeader::
wTempTrainerEventFlag:: dw
wTempTrainerClass:: db
wTempTrainerID:: db
wSeenTextPointer:: dw
wWinTextPointer:: dw
wLossTextPointer:: dw
wScriptAfterPointer:: dw
wRunningTrainerBattleScript:: db
wTempTrainerHeaderEnd::

NEXTU ; d03e
; player movement data
CurInput:: db
wd03f:: db
wd040:: db
wd041:: db
MovementAnimation:: db
WalkingDirection:: db
FacingDirection:: db
WalkingX:: db
WalkingY:: db
WalkingTile:: db
	ds 6
wPlayerTurningDirection:: db

NEXTU ; d03e
; std script buffer
	ds 1
wJumpStdScriptBuffer:: ds 3

NEXTU ; d03e
; phone script pointer
	ds 10
wPhoneScriptPointer:: dw

NEXTU ; d03e
; backup menu data
	ds 7
wMenuCursorBufferBackup:: db
wMenuScrollPositionBackup:: db
	ds 31
ENDU ; d066
ENDU ; d066

wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH ; d066

StringBuffer1:: ds 19 ; d073
StringBuffer2:: ds 19 ; d086
StringBuffer3:: ds 19 ; d099
StringBuffer4:: ds 19 ; d0ac
StringBuffer5:: ds 19 ; d0bf

wBattleMenuCursorBuffer:: dw ; d0d2

CurBattleMon:: db ; d0d4
CurMoveNum:: db ; d0d5

wLastPocket:: db

wPCItemsCursor::        db
wPartyMenuCursor::      db
wItemsPocketCursor::    db
wKeyItemsPocketCursor:: db
wBallsPocketCursor::    db
wTMHMPocketCursor::     db

wPCItemsScrollPosition::        db
wPartyMenuScrollPosition::      db ; unused
wItemsPocketScrollPosition::    db
wKeyItemsPocketScrollPosition:: db
wBallsPocketScrollPosition::    db
wTMHMPocketScrollPosition::     db

wSwitchMon::
wSwitchItem::
wMoveSwapBuffer::
wd0e3::
	db

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db
wQueuedScriptAddr:: dw

wNumMoves:: db

wFieldMoveSucceeded::
wItemEffectSucceeded::
wPlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	db ; d0ec

VramState:: ; d0ed
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	db

wBattleResult:: db ; d0ee
wUsingItemWithSelect:: db ; d0ef

UNION ; d0f0
; mart data
CurMart:: ds 16
CurMartEnd::

NEXTU ; d0f0
; elevator data
CurElevator:: db
CurElevatorFloors:: db

NEXTU ; d0f0
; mailbox data
wCurMessageScrollPosition:: db
wCurMessageIndex:: db
wMailboxCount:: db
wMailboxItems:: ds MAILBOX_CAPACITY
wMailboxEnd:: ds 1 ; d0fe
ENDU ; d100

wListPointer:: dw ; d100
wUnusedD102:: dw ; d102
wItemAttributesPtr:: dw ; d104

CurItem:: db ; d106
CurItemQuantity:: ; d107
wMartItemID::
	db

CurPartySpecies:: db ; d108

CurPartyMon:: ; d109
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	db

wWhichHPBar::
; 0: Enemy
; 1: Player
; 2: Party Menu
	db
wPokemonWithdrawDepositParameter::
; 0: Take from PC
; 1: Put into PC
; 2: Take from Day-Care
; 3: Put into Day-Care
	db

wItemQuantityChangeBuffer:: db
wItemQuantityBuffer:: db

TempMon:: party_struct TempMon ; d10e

wSpriteFlags:: db ; d13e

wHandlePlayerStep:: dw ; d13f

PartyMenuActionText:: db ; d141

wItemAttributeParamBuffer:: db ; d142

CurPartyLevel:: db ; d143

wScrollingMenuListSize:: dw

; used when following a map warp
; d146
wNextWarp:: db
wNextMapGroup:: db
wNextMapNumber:: db
wPrevWarp:: db
wPrevMapGroup:: db
wPrevMapNumber:: db
; d14c

wPlayerBGMapOffsetX:: db ; used in FollowNotExact; unit is pixels
wPlayerBGMapOffsetY:: db ; used in FollowNotExact; unit is pixels

; Player movement
wPlayerStepVectorX:: db ; d14e
wPlayerStepVectorY:: db ; d14f
wPlayerStepFlags::   db ; d150
wPlayerStepDirection::  ; d151
; bit 7: Start step
; bit 6: Stop step
; bit 5: Doing step
; bit 4: In midair
; bits 0-3: unused
	db

wBGMapAnchor:: dw ; d152

UNION ; d154
UsedSprites:: ds 64
UsedSpritesEnd::

NEXTU ; d154
	ds 31
wd173:: db ; related to command queue type 3
ENDU ; d194

wOverworldMapAnchor:: dw ; d194
wMetatileStandingY:: db ; d196
wMetatileStandingX:: db ; d197

wSecondMapHeaderBank:: db ; d198
wTileset:: db ; d199
wEnvironment:: db ; d19a
wSecondMapHeaderAddr:: dw ; d19b

; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
MapHeader:: ; d19d
MapBorderBlock:: db ; d19d
MapHeight:: db ; d19e
MapWidth:: db ; d19f
MapBlockDataBank:: db; d1a0
MapBlockDataPointer:: dw ; d1a1
MapScriptHeaderBank:: db ; d1a3
MapScriptHeaderPointer:: dw ; d1a4
MapEventHeaderPointer:: dw ; d1a6
; bit set
MapConnections:: db ; d1a8

NorthMapConnection:: map_connection_struct North ; d1a9
SouthMapConnection:: map_connection_struct South ; d1b5
WestMapConnection::  map_connection_struct West ; d1c1
EastMapConnection::  map_connection_struct East ; d1cd

Tileset::
TilesetBank:: db ; d1d9
TilesetAddress:: dw ; d1da
TilesetBlocksBank:: db ; d1dc
TilesetBlocksAddress:: dw ; d1dd
TilesetCollisionBank:: db ; d1df
TilesetCollisionAddress:: dw ; d1e0
TilesetAnim:: dw ; bank 3f ; d1e2
	ds 2  ; unused ; d1e4
TilesetPalettes:: dw ; bank 3f ; d1e6
TilesetEnd::

EvolvableFlags:: flag_array PARTY_LENGTH ; d1e8

wForceEvolution:: db ; d1e9

UNION ; d1ea
; general-purpose buffers
Buffer1:: db ; d1ea
Buffer2:: db ; d1eb
Buffer3:: db ; d1ec
Buffer4:: db ; d1ed
Buffer5:: db ; d1ee
Buffer6:: db ; d1ef

NEXTU ; d1ea
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

NEXTU ; d1ea
; evolution data
wEvolutionOldSpecies:: db ; d1ea
wEvolutionNewSpecies:: db ; d1eb
wEvolutionPicOffset:: db ; d1ec
wEvolutionCanceled:: db ; d1ed

NEXTU ; d1ea
; mobile
	ds 2
wd1ec:: ds 1
wd1ed:: ds 1
wd1ee:: ds 1
wd1ef:: ds 1
wd1f0:: ds 1
wd1f1:: ds 1
wd1f2:: ds 1
wd1f3:: ds 4

NEXTU ; d1ea
; miscellaneous
wMagikarpLength:: dw
wSelectedDecoration:: db
wOtherDecoration::    db
	ds 3
CurEnemyItem:: db
ENDU ; d1f7

	ds 3

LinkBattleRNs:: ds 10 ; d1fa

TempEnemyMonSpecies::  db ; d204
TempBattleMonSpecies:: db ; d205

EnemyMon:: battle_struct EnemyMon ; d206
EnemyMonBaseStats:: ds 5 ; d226
EnemyMonCatchRate:: db ; d22b
EnemyMonBaseExp::   db ; d22c
EnemyMonEnd::


wBattleMode:: ; d22d
; 0: overworld
; 1: wild battle
; 2: trainer battle
	db

TempWildMonSpecies:: db

OtherTrainerClass:: ; d22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

; BATTLETYPE_* values
BattleType:: db ; d230

OtherTrainerID:: ; d231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	db

wForcedSwitch:: db

TrainerClass:: db ; d233

UnownLetter:: db ; d234

wMoveSelectionMenuType:: db

; corresponds to the data/pokemon/base_stats/*.asm contents
CurBaseData:: ; d236
BaseDexNo:: db ; d236
BaseStats:: ; d237
BaseHP:: db ; d237
BaseAttack:: db ; d238
BaseDefense:: db ; d239
BaseSpeed:: db ; d23a
BaseSpecialAttack:: db ; d23b
BaseSpecialDefense:: db ; d23c
BaseType:: ; d23d
BaseType1:: db ; d23d
BaseType2:: db ; d23e
BaseCatchRate:: db ; d23f
BaseExp:: db ; d240
BaseItems:: ; d241
BaseItem1:: db ; d241
BaseItem2:: db ; d242
BaseGender:: db ; d243
BaseUnknown1:: db ; d244
BaseEggSteps:: db ; d245
BaseUnknown2:: db ; d246
BasePicSize:: db ; d247
BasePadding:: ds 4 ; d248
BaseGrowthRate:: db ; d24c
BaseEggGroups:: db ; d24d
BaseTMHM:: flag_array NUM_TM_HM_TUTOR ; d24e
CurBaseDataEnd::

CurDamage:: dw ; d256

	ds 2

wMornEncounterRate::  db ; d25a
wDayEncounterRate::   db ; d25b
wNiteEncounterRate::  db ; d25c
wWaterEncounterRate:: db ; d25d
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db
wInitListType:: db
wBattleHasJustStarted:: db

wNamedObjectIndexBuffer::
wCurTMHM::
wTypeMatchup::
wFoundMatchingIDInParty::
wd265::
	db

wFailedToFlee:: db
wNumFleeAttempts:: db
wMonTriedToEvolve:: db

TimeOfDay:: db ; d269

	ds 1


SECTION "Enemy Party", WRAMX

UNION ; d26b
wd26b::
wPokedexShowPointerAddr:: dw
wPokedexShowPointerBank:: db
	ds 3
wd271:: ds 5

NEXTU ; d26b
; enemy party
OTPlayerName:: ds NAME_LENGTH ; d26b
ENDU ; d276

OTPlayerID:: ds 2 ; d276
	ds 8
OTPartyCount::   ds 1 ; d280
OTPartySpecies:: ds PARTY_LENGTH ; d281
OTPartyEnd::     ds 1 ; legacy scripts don't check PartyCount

UNION ; d288
; ot party mons
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

NEXTU ; d288
; catch tutorial dude pack
wDudeBag::
wDudeNumItems:: db
wDudeItems:: ds 2 * 4
wDudeItemsEnd:: db

wDudeNumKeyItems:: db ; d292
wDudeKeyItems:: ds 18
wDudeKeyItemsEnd:: db

wDudeNumBalls:: db ; d2a6
wDudeBalls:: ds 2 * 4 ; d2a7
wDudeBallsEnd:: db ; d2af
wDudeBagEnd::
ENDU ; d430

wd430::
wBattleAction:: db ; d430

wd431:: db
MapStatus:: db ; d432
MapEventStatus:: ; d433
; 0: do map events
; 1: do background events
	db

ScriptFlags:: ; d434
; bit 3: priority jump
	db
ScriptFlags2:: ; d435
	db
ScriptFlags3:: ; d436
; bit 0: count steps
; bit 1: coord events
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	db

ScriptMode:: db ; d437
ScriptRunning:: db ; d438
ScriptBank:: db ; d439
ScriptPos:: dw ; d43a

wScriptStackSize:: db
wScriptStack:: ds 3 * 5
	ds 1
ScriptDelay:: db ; d44d

wPriorityScriptBank::
wScriptTextBank::
	db ; d44e
wPriorityScriptAddr::
wScriptTextAddr::
	dw ; d44f
	ds 1
wWildEncounterCooldown:: db ; d452
wXYComparePointer:: dw ; d453
	ds 4

wBattleScriptFlags:: dw ; d459
wPlayerSpriteSetupFlags:: ; d45b
; bit 7: if set, cancel PlayerAction
; bit 5: if set, set facing according to bits 0-1
; bits 0-1: direction facing
	db
wMapReentryScriptQueueFlag:: db ; d45c MemScriptFlag
wMapReentryScriptBank:: db ; d45d MemScriptBank
wMapReentryScriptAddress:: dw ; d45e MemScriptAddr
	ds 4
wTimeCyclesSinceLastCall:: db ; d464
wReceiveCallDelay_MinsRemaining:: db ; d465
wReceiveCallDelay_StartTime:: ds 3 ; d466
	ds 3
wBugContestMinsRemaining:: db ; d46c
wBugContestSecsRemaining:: db ; d46d
	ds 2
wMapStatusEnd:: ds 2 ; d470

wCrystalData::
wPlayerGender:: ; d472
; bit 0:
;	0 male
;	1 female
	db
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
	dw

PlayerName:: ds NAME_LENGTH ; d47d
MomsName::   ds NAME_LENGTH ; d488
RivalName::  ds NAME_LENGTH ; d493
RedsName::   ds NAME_LENGTH ; d49e
GreensName:: ds NAME_LENGTH ; d4a9

wSavedAtLeastOnce:: db
wSpawnAfterChampion:: db

; init time set at newgame
StartDay:: db ; d4b6
StartHour:: db ; d4b7
StartMinute:: db ; d4b8
StartSecond:: db ; d4b9

wRTC:: ds 8 ; d4ba
wDST:: db ; d4c2

GameTimeCap::     db ; d4c3
GameTimeHours::   dw ; d4c4
GameTimeMinutes:: db ; d4c6
GameTimeSeconds:: db ; d4c7
GameTimeFrames::  db ; d4c8

	ds 2

CurDay:: db ; d4cb

	ds 1

wObjectFollow_Leader:: db
wObjectFollow_Follower:: db
wCenteredObject:: db
wFollowerMovementQueueLength:: db
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

	ds 40

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

VariableSprites:: ds 16; d82e

wEnteredMapFromContinue:: db ; d83e
	ds 2
TimeOfDayPal:: db ; d841
	ds 4
wTimeOfDayPalFlags:: db ; d846
wTimeOfDayPalset:: db
CurTimeOfDay:: db ; d848

	ds 1

wSecretID:: dw
wStatusFlags:: ; d84c
	; 0 - pokedex
	; 1 - unown dex
	; 2 -
	; 3 - pokerus
	; 4 - rocket signal
	; 5 - wild encounters on/off
	; 6 - hall of fame
	; 7 - bug contest on
	db

wStatusFlags2:: ; d84d
	; 0 - rockets
	; 1 -
	; 2 - bug contest timer
	; 3 -
	; 4 - bike shop call
	; 5 - pokerus
	; 6 - berry juice?
	; 7 - rockets in mahogany
	db

Money:: ds 3 ; d84e
wMomsMoney:: ds 3 ; d851
wMomSavingMoney:: db ; d854

Coins:: dw ; d855

Badges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES ; d857
wKantoBadges:: flag_array NUM_KANTO_BADGES ; d858


TMsHMs:: ds NUM_TMS + NUM_HMS ; d859
TMsHMsEnd::

NumItems:: db ; d892
Items:: ds MAX_ITEMS * 2 + 1 ; d893
ItemsEnd::

NumKeyItems:: db ; d8bc
KeyItems:: ds MAX_KEY_ITEMS + 1 ; d8bd
KeyItemsEnd::

NumBalls:: db ; d8d7
Balls:: ds MAX_BALLS * 2 + 1 ; d8d8
BallsEnd::

PCItems:: ds MAX_PC_ITEMS * 2 + 1 ; d8f1
PCItemsEnd::

	ds 1

wPokegearFlags::
; bit 0: map
; bit 1: radio
; bit 2: phone
; bit 3: expn
; bit 7: on/off
	db
wRadioTuningKnob:: db
wLastDexMode:: db
	ds 1
WhichRegisteredItem:: db ; d95b
RegisteredItem:: db ; d95c

PlayerState:: db ; d95d

wHallOfFameCount:: dw
wTradeFlags:: flag_array 6 ; d960
	ds 1
MooMooBerries:: db ; d962
UndergroundSwitchPositions:: db ; d963
FarfetchdPosition:: db ; d964

	ds 13

; map scene ids
wPokecenter2FSceneID::                            db ; d972
wTradeCenterSceneID::                             db ; d973
wColosseumSceneID::                               db ; d974
wTimeCapsuleSceneID::                             db ; d975
wPowerPlantSceneID::                              db ; d976
wCeruleanGymSceneID::                             db ; d977
wRoute25SceneID::                                 db ; d978
wTrainerHouseB1FSceneID::                         db ; d979
wVictoryRoadGateSceneID::                         db ; d97a
wSaffronTrainStationSceneID::                     db ; d97b
wRoute16GateSceneID::                             db ; d97c
wRoute17Route18GateSceneID::                      db ; d97d
wIndigoPlateauPokecenter1FSceneID::               db ; d97e
wWillsRoomSceneID::                               db ; d97f
wKogasRoomSceneID::                               db ; d980
wBrunosRoomSceneID::                              db ; d981
wKarensRoomSceneID::                              db ; d982
wLancesRoomSceneID::                              db ; d983
wHallOfFameSceneID::                              db ; d984
wRoute27SceneID::                                 db ; d985
wNewBarkTownSceneID::                             db ; d986
wElmsLabSceneID::                                 db ; d987
wKrissHouse1FSceneID::                            db ; d988
wRoute29SceneID::                                 db ; d989
wCherrygroveCitySceneID::                         db ; d98a
wMrPokemonsHouseSceneID::                         db ; d98b
wRoute32SceneID::                                 db ; d98c
wRoute35NationalParkGateSceneID::                 db ; d98d
wRoute36SceneID::                                 db ; d98e
wRoute36NationalParkGateSceneID::                 db ; d98f
wAzaleaTownSceneID::                              db ; d990
wGoldenrodGymSceneID::                            db ; d991
wGoldenrodMagnetTrainStationSceneID::             db ; d992
wGoldenrodPokecenter1FSceneID::                   db ; d993
wOlivineCitySceneID::                             db ; d994
wRoute34SceneID::                                 db ; d995
wRoute34IlexForestGateSceneID::                   db ; d996
wEcruteakHouseSceneID::                           db ; d997
wWiseTriosRoomSceneID::                           db ; d998
wEcruteakPokecenter1FSceneID::                    db ; d999
wEcruteakGymSceneID::                             db ; d99a
wMahoganyTownSceneID::                            db ; d99b
wRoute42SceneID::                                 db ; d99c
wCianwoodCitySceneID::                            db ; d99d
wBattleTower1FSceneID::                           db ; d99e
wBattleTowerBattleRoomSceneID::                   db ; d99f
wBattleTowerElevatorSceneID::                     db ; d9a0
wBattleTowerHallwaySceneID::                      db ; d9a1
wBattleTowerOutsideSceneID::                      db ; d9a2
wRoute43GateSceneID::                             db ; d9a3
wMountMoonSceneID::                               db ; d9a4
wSproutTower3FSceneID::                           db ; d9a5
wTinTower1FSceneID::                              db ; d9a6
wBurnedTower1FSceneID::                           db ; d9a7
wBurnedTowerB1FSceneID::                          db ; d9a8
wRadioTower5FSceneID::                            db ; d9a9
wRuinsOfAlphOutsideSceneID::                      db ; d9aa
wRuinsOfAlphResearchCenterSceneID::               db ; d9ab
wRuinsOfAlphHoOhChamberSceneID::                  db ; d9ac
wRuinsOfAlphKabutoChamberSceneID::                db ; d9ad
wRuinsOfAlphOmanyteChamberSceneID::               db ; d9ae
wRuinsOfAlphAerodactylChamberSceneID::            db ; d9af
wRuinsOfAlphInnerChamberSceneID::                 db ; d9b0
wMahoganyMart1FSceneID::                          db ; d9b1
wTeamRocketBaseB1FSceneID::                       db ; d9b2
wTeamRocketBaseB2FSceneID::                       db ; d9b3
wTeamRocketBaseB3FSceneID::                       db ; d9b4
wGoldenrodUndergroundSwitchRoomEntrancesSceneID:: db ; d9b5
wSilverCaveRoom3SceneID::                         db ; d9b6
wVictoryRoadSceneID::                             db ; d9b7
wDragonsDenB1FSceneID::                           db ; d9b8
wDragonShrineSceneID::                            db ; d9b9
wOlivinePortSceneID::                             db ; d9ba
wVermilionPortSceneID::                           db ; d9bb
wFastShip1FSceneID::                              db ; d9bc
wFastShipB1FSceneID::                             db ; d9bd
wMountMoonSquareSceneID::                         db ; d9be
wMobileTradeRoomMobileSceneID::                   db ; d9bf
wMobileBattleRoomSceneID::                        db ; d9c0

	ds 49

; fight counts
wJackFightCount::    db ; d9f2
wBeverlyFightCount:: db ; unused
wHueyFightCount::    db
wGavenFightCount::   db
wBethFightCount::    db
wJoseFightCount::    db
wReenaFightCount::   db
wJoeyFightCount::    db
wWadeFightCount::    db
wRalphFightCount::   db
wLizFightCount::     db
wAnthonyFightCount:: db
wToddFightCount::    db
wGinaFightCount::    db
wIrwinFightCount::   db ; unused
wArnieFightCount::   db
wAlanFightCount::    db
wDanaFightCount::    db
wChadFightCount::    db
wDerekFightCount::   db ; unused
wTullyFightCount::   db
wBrentFightCount::   db
wTiffanyFightCount:: db
wVanceFightCount::   db
wWiltonFightCount::  db
wKenjiFightCount::   db ; unused
wParryFightCount::   db
wErinFightCount::    db
; da0e

	ds 100

EventFlags:: flag_array NUM_EVENTS ; da72
; db6c

	ds 6

wCurBox:: db ; db72

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; db75

wCelebiEvent:: db

	ds 1

wBikeFlags:: ; dbf5
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	db

	ds 1

wCurrMapSceneScriptPointer:: dw ; dbf7

wCurrentCaller:: dw ; dbf9
wCurrMapWarpCount:: db ; dbfb
wCurrMapWarpHeaderPointer:: dw ; dbfc
wCurrMapCoordEventCount:: db ; dbfe
wCurrMapCoordEventHeaderPointer:: dw ; dbff
wCurrMapBGEventCount:: db ; dc01
wCurrMapBGEventHeaderPointer:: dw ; dc02
wCurrMapObjectEventCount:: db ; dc04
wCurrMapObjectEventHeaderPointer:: dw ; dc05
wCurrMapSceneScriptCount:: db ; dc07
wCurrMapSceneScriptHeaderPointer:: dw ; dc08
wCurrMapCallbackCount:: db ; dc0a
wCurrMapCallbackHeaderPointer:: dw ; dc0b

	ds 2

; Sprite id of each decoration
Bed::           db ; dc0f
Carpet::        db ; dc10
Plant::         db ; dc11
Poster::        db ; dc12
Console::       db ; dc13
LeftOrnament::  db ; dc14
RightOrnament:: db ; dc15
BigDoll::       db ; dc16

; Items bought from Mom
wWhichMomItem:: db ; dc17
wWhichMomItemSet:: db ; dc18
MomItemTriggerBalance:: ds 3 ; dc19

wDailyResetTimer:: dw ; dc1c
wDailyFlags:: db
wWeeklyFlags:: db
wSwarmFlags:: db
	ds 2
wStartDay:: db
	ds 3

FruitTreeFlags:: flag_array NUM_FRUIT_TREES ; dc27

	ds 2

wLuckyNumberDayBuffer:: dw ; dc2d
	ds 2
wSpecialPhoneCallID:: db ; dc31
	ds 3
wBugContestStartTime:: ds 4 ; day, hour, min, sec ; dc35
wUnusedTwoDayTimerOn:: db ; dc39
wUnusedTwoDayTimer:: db
wUnusedTwoDayTimerStartDate:: db
	ds 4
wMobileOrCable_LastSelection:: db
wdc41:: ds 1
wdc42:: ds 8
wBuenasPassword:: db
wBlueCardBalance:: db
wDailyRematchFlags:: ds 4
wDailyPhoneItemFlags:: ds 4
wDailyPhoneTimeOfDayFlags:: ds 4
wKenjiBreakTimer:: ds 2 ; Kenji
wYanmaMapGroup:: db ; dc5a
wYanmaMapNumber:: db
wPlayerMonSelection:: ds 3
wdc5f:: ds 1
wdc60:: ds 19

StepCount:: db ; dc73
PoisonStepCount:: db ; dc74
	ds 2
wHappinessStepCount:: db
	ds 1

wParkBallsRemaining::
wSafariBallsRemaining:: db ; dc79
wSafariTimeRemaining:: dw ; dc7a

wPhoneList:: ds CONTACT_LIST_SIZE ; dc7c
; dc86
	ds 23

wLuckyNumberShowFlag:: dw ; dc9d
wLuckyIDNumber:: dw ; dc9f

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw
wKurtApricornQuantity:: db

wPlayerDataEnd::


wMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS ; dca5

wDigWarpNumber:: db ; dcaa
wDigMapGroup::   db ; dcab
wDigMapNumber::  db ; dcac

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupWarpNumber:: db ; dcad
BackupMapGroup::   db ; dcae
BackupMapNumber::  db ; dcaf

	ds 3

wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db

WarpNumber:: db ; dcb4
MapGroup:: db ; dcb5 ; map group of current map
MapNumber:: db ; dcb6 ; map number of current map
YCoord:: db ; dcb7 ; current y coordinate relative to top-left corner of current map
XCoord:: db ; dcb8 ; current x coordinate relative to top-left corner of current map
wScreenSave:: ds 6 * 5

wMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::

PartyCount:: db ; dcd7 ; number of Pokémon in party
PartySpecies:: ds PARTY_LENGTH ; dcd8 ; species of each Pokémon in party
PartyEnd:: db ; dcde ; legacy scripts don't check PartyCount

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

PokedexCaught:: flag_array NUM_POKEMON ; de99
EndPokedexCaught::

PokedexSeen:: flag_array NUM_POKEMON ; deb9
EndPokedexSeen::

UnownDex:: ds NUM_UNOWN ; ded9
wUnlockedUnowns:: db ; def3
wFirstUnownSeen:: db

wDayCareMan:: ; def5
; bit 7: active
; bit 6: monsters are compatible
; bit 5: egg ready
; bit 0: monster 1 in day-care
	db

wBreedMon1::
wBreedMon1Nick::  ds PKMN_NAME_LENGTH ; def6
wBreedMon1OT::    ds NAME_LENGTH ; df01
wBreedMon1Stats:: box_struct wBreedMon1 ; df0c

wDayCareLady:: ; df2c
; bit 7: active
; bit 0: monster 2 in day-care
	db

wStepsToEgg:: ; df2d
	db
wBreedMotherOrNonDitto:: ; df2e
;  z: yes
; nz: no
	db

wBreedMon2::
wBreedMon2Nick::  ds PKMN_NAME_LENGTH ; df2f
wBreedMon2OT::    ds NAME_LENGTH ; df3a
wBreedMon2Stats:: box_struct wBreedMon2 ; df45

wEggNick:: ds PKMN_NAME_LENGTH ; df65
wEggOT::   ds NAME_LENGTH ; df70
wEggMon::  box_struct wEggMon ; df7b

wBugContestSecondPartySpecies:: db
wContestMon:: party_struct wContestMon ; df9c

wDunsparceMapGroup:: db
wDunsparceMapNumber:: db
wFishingSwarmFlag:: db

wRoamMon1:: roam_struct wRoamMon1 ; dfcf
wRoamMon2:: roam_struct wRoamMon2 ; dfd6
wRoamMon3:: roam_struct wRoamMon3 ; dfdd

wRoamMons_CurrentMapNumber:: db
wRoamMons_CurrentMapGroup:: db
wRoamMons_LastMapNumber:: db
wRoamMons_LastMapGroup:: db

wBestMagikarpLengthFeet:: db
wBestMagikarpLengthInches:: db
wMagikarpRecordHoldersName:: ds NAME_LENGTH

wPokemonDataEnd::
wGameDataEnd::
; dff5


SECTION "Pic Animations", WRAMX

TempTileMap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT ; $168 = 360

; PokeAnim Header
wPokeAnimSceneIndex:: db
wPokeAnimPointer:: dw
wPokeAnimSpecies:: db
wPokeAnimUnownLetter:: db
wPokeAnimSpeciesOrUnown:: db
wPokeAnimGraphicStartTile:: db
wPokeAnimCoord:: dw
wPokeAnimFrontpicHeight:: db
; PokeAnim Data
wPokeAnimIdleFlag:: db
wPokeAnimSpeed:: db
wPokeAnimPointerBank:: db
wPokeAnimPointerAddr:: dw
wPokeAnimFramesBank:: db
wPokeAnimFramesAddr:: dw
wPokeAnimBitmaskBank:: db
wPokeAnimBitmaskAddr:: dw
wPokeAnimFrame:: db
wPokeAnimJumptableIndex:: db
wPokeAnimRepeatTimer:: db
wPokeAnimCurBitmask:: db
wPokeAnimWaitCounter:: db
wPokeAnimCommand:: db
wPokeAnimParameter:: db
	ds 1
wPokeAnimBitmaskCurCol:: db
wPokeAnimBitmaskCurRow:: db
wPokeAnimBitmaskCurBit:: db
wPokeAnimBitmaskBuffer:: ds 7
	ds 2
wPokeAnimStructEnd::


SECTION "Battle Tower RAM", WRAMX

w3_d000:: ds 1 ; d000
w3_d001:: ds 1
w3_d002:: ds $7e
w3_d080:: ds $10
w3_d090:: ds $70

w3_d100::
BT_OTTrainer:: battle_tower_struct BT_OT
	ds $20
BT_TrainerTextIndex:: db ; d200
	ds 1
w3_d202:: battle_tower_struct w3_d202
w3_d2e2:: battle_tower_struct w3_d2e2
w3_d3c2:: battle_tower_struct w3_d3c2
w3_d4a2:: battle_tower_struct w3_d4a2
w3_d582:: battle_tower_struct w3_d582
w3_d662:: battle_tower_struct w3_d662

UNION ; d742
w3_d742:: battle_tower_struct w3_d742
; d822

NEXTU ; d742
	ds $be
w3_d800:: ds BG_MAP_WIDTH * SCREEN_HEIGHT

NEXTU ; d742
	ds $be
wBTChoiceOfLvlGroup:: db
	ds $68
w3_d869:: ds $17
w3_d880:: ds 1
w3_d881:: ds 9
w3_d88a:: ds 5
w3_d88f:: ds 5
w3_d894:: ds 1
w3_d895:: ds 11
w3_d8a0:: ds 1
w3_d8a1:: ds 1
w3_d8a2:: ds 1
w3_d8a3:: ds 1
ENDU ; d8a4

	ds $1c0

w3_dc00:: ds SCREEN_WIDTH * SCREEN_HEIGHT
w3_dd68:: ds SCREEN_WIDTH * SCREEN_HEIGHT

	ds $11c

w3_dfec:: ds $10
w3_dffc:: ds 4


SECTION "GBC Video", WRAMX

; eight 4-color palettes each
wBGPals1:: ds 8 palettes ; d000
wOBPals1:: ds 8 palettes ; d040
wBGPals2:: ds 8 palettes ; d080
wOBPals2:: ds 8 palettes ; d0c0

LYOverrides:: ds SCREEN_HEIGHT_PX ; d100
LYOverridesEnd:: ; d190

	ds 1

wMagnetTrainDirection:: db
wMagnetTrainInitPosition:: db
wMagnetTrainHoldPosition:: db
wMagnetTrainFinalPosition:: db
wMagnetTrainPlayerSpriteInitX:: db

	ds 106

LYOverridesBackup:: ds SCREEN_HEIGHT_PX ; d200
LYOverridesBackupEnd::


SECTION "Battle Animations", WRAMX

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

wNumActiveBattleAnims:: db ; d40e

BattleAnimFlags:: db ; d40f
BattleAnimAddress:: dw ; d410
BattleAnimDuration:: db ; d412
BattleAnimParent:: dw ; d413
BattleAnimLoops:: db ; d415
BattleAnimVar:: db ; d416
BattleAnimByte:: db ; d417
wBattleAnimOAMPointerLo:: db ; d418

UNION ; d419
; unidentified
wBattleAnimTemp0:: db
wBattleAnimTemp1:: db
wBattleAnimTemp2:: db
wBattleAnimTemp3:: db

NEXTU ; d419
wBattleAnimTempOAMFlags:: db
wBattleAnimTempField02:: db
wBattleAnimTempTileID:: db
wBattleAnimTempXCoord:: db
wBattleAnimTempYCoord:: db
wBattleAnimTempXOffset:: db
wBattleAnimTempYOffset:: db
wBattleAnimTempAddSubFlags:: db
wBattleAnimTempPalette:: db
ENDU ; d422

UNION ; d422
	ds $32
wBattleAnimEnd::

NEXTU ; d422
wSurfWaveBGEffect:: ds $40
wSurfWaveBGEffectEnd::
ENDU ; d462


SECTION "Mobile RAM", WRAMX

w5_d800:: ds $200
w5_da00:: ds $200
w5_dc00:: ds $d
w5_dc0d:: ds 4
w5_dc11:: ds 9
w5_MobileOpponentBattleMessages:: ds $c ; dc1a
w5_MobileOpponentBattleStartMessage:: ds $c ; dc26
w5_MobileOpponentBattleWinMessage:: ds $c ; dc32
w5_MobileOpponentBattleLossMessage:: ds $c ; dc3e


SECTION "Scratch RAM", WRAMX

UNION ; d000
wScratchTileMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
wScratchAttrMap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

NEXTU ; d000
wDecompressScratch:: ds $80 tiles
wDecompressEnemyFrontpic:: ds $80 tiles
ENDU ; e000


SECTION "Stack RAM", WRAMX

wWindowStack:: ds $1000 - 1
wWindowStackBottom:: ds 1


INCLUDE "sram.asm"
