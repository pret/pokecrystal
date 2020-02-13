INCLUDE "constants.asm"

INCLUDE "macros/wram.asm"


INCLUDE "vram.asm"


SECTION "Stack", WRAM0

wStackBottom::
	ds $100 - 1
wStack::
wStackTop::
	ds 1


SECTION "Audio RAM", WRAM0

wMusic::

; nonzero if playing
wMusicPlaying:: db ; c100

wChannels::
wChannel1:: channel_struct wChannel1 ; c101
wChannel2:: channel_struct wChannel2 ; c133
wChannel3:: channel_struct wChannel3 ; c165
wChannel4:: channel_struct wChannel4 ; c197

wSFXChannels::
wChannel5:: channel_struct wChannel5 ; c1c9
wChannel6:: channel_struct wChannel6 ; c1fb
wChannel7:: channel_struct wChannel7 ; c22d
wChannel8:: channel_struct wChannel8 ; c25f

	ds 1 ; c291

wCurTrackDuty:: db
wCurTrackVolumeEnvelope:: db
wCurTrackFrequency:: dw
wUnusedBCDNumber:: db ; BCD value, dummied out
wCurNoteDuration:: db ; used in MusicE0 and LoadNote

wCurMusicByte:: db ; c298
wCurChannel:: db ; c299
wVolume:: ; c29a
; corresponds to rNR50
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	db
wSoundOutput:: ; c29b
; corresponds to rNR51
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	db
wPitchSweep:: ; c29c
; corresponds to rNR10
; bit 7:   unused
; bit 4-6: sweep time
; bit 3:   sweep direction
; but 0-2: sweep shift
	db

wMusicID:: dw ; c29d
wMusicBank:: db ; c29f
wNoiseSampleAddress:: dw ; c2a0
wNoiseSampleDelay:: db ; c2a2
	ds 1 ; c2a3
wMusicNoiseSampleSet:: db ; c2a4
wSFXNoiseSampleSet:: db ; c2a5

wLowHealthAlarm:: ; c2a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	db

wMusicFade:: ; c2a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	db
wMusicFadeCount:: db ; c2a8
wMusicFadeID:: dw ; c2a9

	ds 5

wCryPitch:: dw ; c2b0
wCryLength:: dw ; c2b2

wLastVolume:: db ; c2b4
wUnusedMusicF9Flag:: db ; c2b5

wSFXPriority:: ; c2b6
; if nonzero, turn off music when playing sfx
	db

	ds 1

wChannel1JumpCondition:: db
wChannel2JumpCondition:: db
wChannel3JumpCondition:: db
wChannel4JumpCondition:: db

wStereoPanningMask:: db ; c2bc

wCryTracks:: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	db

wSFXDuration:: db
wCurSFX:: ; c2bf
; id of sfx currently playing
	db
wChannelsEnd::

wMapMusic:: db ; c2c0

wDontPlayMapMusicOnReload:: db
wMusicEnd::


SECTION "WRAM", WRAM0

wLZAddress:: dw ; c2c2
wLZBank::    db ; c2c4

	ds 1

wBoxAlignment:: db

wInputType::        db ; c2c7
wAutoInputAddress:: dw ; c2c8
wAutoInputBank::    db ; c2ca
wAutoInputLength::  db ; c2cb

wDebugFlags:: db
wGameLogicPaused:: db ; c2cd
wSpriteUpdatesEnabled:: db

wUnusedScriptByteBuffer:: db

wMapTimeOfDay:: db

	ds 3

wPrinterConnectionOpen:: db
wPrinterOpcode:: db
wPrevDexEntry:: db
wDisableTextAcceleration:: db
wPrevLandmark:: db
wCurLandmark:: db
wLandmarkSignTimer:: dw

wLinkMode::
; a LINK_* value for the link type
	db ; c2dc

wScriptVar:: db ; c2dd

wPlayerNextMovement:: db
wPlayerMovement:: db
	ds 2
wc2e2::
wMovementObject::
	db
wMovementDataBank:: db
wMovementDataAddress:: dw
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

wTileDown::  db ; c2fa
wTileUp::    db ; c2fb
wTileLeft::  db ; c2fc
wTileRight:: db ; c2fd

wTilePermissions:: ; c2fe
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
wSpriteAnim1::  sprite_anim_struct wSpriteAnim1
wSpriteAnim2::  sprite_anim_struct wSpriteAnim2
wSpriteAnim3::  sprite_anim_struct wSpriteAnim3
wSpriteAnim4::  sprite_anim_struct wSpriteAnim4
wSpriteAnim5::  sprite_anim_struct wSpriteAnim5
wSpriteAnim6::  sprite_anim_struct wSpriteAnim6
wSpriteAnim7::  sprite_anim_struct wSpriteAnim7
wSpriteAnim8::  sprite_anim_struct wSpriteAnim8
wSpriteAnim9::  sprite_anim_struct wSpriteAnim9
wSpriteAnim10:: sprite_anim_struct wSpriteAnim10
wSpriteAnimationStructsEnd::

NEXTU ; c300
; dummy game
wc300::

NEXTU ; c300
; mobile data
wMobileWRAM::
wMobileErrorCodeBuffer:: ds 3 ; c300
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
wc314:: ds 5
wc319:: db
wc31a:: db
wc31b:: db
wc31c:: db
wc31d:: db
wc31e:: db
wc31f:: db
wc320:: ds 38
wc346:: ds 102
wc3ac:: ds 8
ENDU ; c3b4

wSpriteAnimCount:: db
wCurSpriteOAMAddr:: db

wCurIcon:: db ; c3b6

wCurIconTile:: db
wSpriteAnimAddrBackup::
wSpriteAnimIDBuffer::
wCurSpriteOAMFlags::
	dw
wCurAnimVTile:: db
wCurAnimXCoord:: db
wCurAnimYCoord:: db
wCurAnimXOffset:: db
wCurAnimYOffset:: db
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
wMobileWRAMEnd::


SECTION "Sprites", WRAM0

wVirtualOAM:: ; c400
wVirtualOAMSprite00:: sprite_oam_struct wVirtualOAMSprite00
wVirtualOAMSprite01:: sprite_oam_struct wVirtualOAMSprite01
wVirtualOAMSprite02:: sprite_oam_struct wVirtualOAMSprite02
wVirtualOAMSprite03:: sprite_oam_struct wVirtualOAMSprite03
wVirtualOAMSprite04:: sprite_oam_struct wVirtualOAMSprite04
wVirtualOAMSprite05:: sprite_oam_struct wVirtualOAMSprite05
wVirtualOAMSprite06:: sprite_oam_struct wVirtualOAMSprite06
wVirtualOAMSprite07:: sprite_oam_struct wVirtualOAMSprite07
wVirtualOAMSprite08:: sprite_oam_struct wVirtualOAMSprite08
wVirtualOAMSprite09:: sprite_oam_struct wVirtualOAMSprite09
wVirtualOAMSprite10:: sprite_oam_struct wVirtualOAMSprite10
wVirtualOAMSprite11:: sprite_oam_struct wVirtualOAMSprite11
wVirtualOAMSprite12:: sprite_oam_struct wVirtualOAMSprite12
wVirtualOAMSprite13:: sprite_oam_struct wVirtualOAMSprite13
wVirtualOAMSprite14:: sprite_oam_struct wVirtualOAMSprite14
wVirtualOAMSprite15:: sprite_oam_struct wVirtualOAMSprite15
wVirtualOAMSprite16:: sprite_oam_struct wVirtualOAMSprite16
wVirtualOAMSprite17:: sprite_oam_struct wVirtualOAMSprite17
wVirtualOAMSprite18:: sprite_oam_struct wVirtualOAMSprite18
wVirtualOAMSprite19:: sprite_oam_struct wVirtualOAMSprite19
wVirtualOAMSprite20:: sprite_oam_struct wVirtualOAMSprite20
wVirtualOAMSprite21:: sprite_oam_struct wVirtualOAMSprite21
wVirtualOAMSprite22:: sprite_oam_struct wVirtualOAMSprite22
wVirtualOAMSprite23:: sprite_oam_struct wVirtualOAMSprite23
wVirtualOAMSprite24:: sprite_oam_struct wVirtualOAMSprite24
wVirtualOAMSprite25:: sprite_oam_struct wVirtualOAMSprite25
wVirtualOAMSprite26:: sprite_oam_struct wVirtualOAMSprite26
wVirtualOAMSprite27:: sprite_oam_struct wVirtualOAMSprite27
wVirtualOAMSprite28:: sprite_oam_struct wVirtualOAMSprite28
wVirtualOAMSprite29:: sprite_oam_struct wVirtualOAMSprite29
wVirtualOAMSprite30:: sprite_oam_struct wVirtualOAMSprite30
wVirtualOAMSprite31:: sprite_oam_struct wVirtualOAMSprite31
wVirtualOAMSprite32:: sprite_oam_struct wVirtualOAMSprite32
wVirtualOAMSprite33:: sprite_oam_struct wVirtualOAMSprite33
wVirtualOAMSprite34:: sprite_oam_struct wVirtualOAMSprite34
wVirtualOAMSprite35:: sprite_oam_struct wVirtualOAMSprite35
wVirtualOAMSprite36:: sprite_oam_struct wVirtualOAMSprite36
wVirtualOAMSprite37:: sprite_oam_struct wVirtualOAMSprite37
wVirtualOAMSprite38:: sprite_oam_struct wVirtualOAMSprite38
wVirtualOAMSprite39:: sprite_oam_struct wVirtualOAMSprite39
wVirtualOAMEnd::


SECTION "Tilemap", WRAM0

wTilemap:: ; c4a0
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wTilemapEnd::


SECTION "Miscellaneous", WRAM0

; This union spans 480 bytes from c608 to c7e8.
UNION ; c608
; surrounding tiles
; This buffer determines the size for the rest of the union;
; it uses exactly 480 bytes.
wSurroundingTiles:: ds SURROUNDING_WIDTH * SURROUNDING_HEIGHT

NEXTU ; c608
; box save buffer
; SaveBoxAddress uses this buffer in three steps because it
; needs more space than the buffer can hold.
wBoxPartialData:: ds 480
wBoxPartialDataEnd::

NEXTU ; c608
; battle tower temp struct
wBT_OTTemp:: battle_tower_struct wBT_OTTemp

NEXTU ; c608
; battle data
wBattle::
wEnemyMoveStruct::  move_struct wEnemyMoveStruct ; c608
wPlayerMoveStruct:: move_struct wPlayerMoveStruct ; c60f

wEnemyMonNick::  ds MON_NAME_LENGTH ; c616
wBattleMonNick:: ds MON_NAME_LENGTH ; c621

wBattleMon:: battle_struct wBattleMon ; c62c

	ds 2

wWildMon:: db ; c64e
	ds 1
wEnemyTrainerItem1:: db ; c650
wEnemyTrainerItem2:: db ; c651
wEnemyTrainerBaseReward:: db ; c652
wEnemyTrainerAIFlags:: ds 3 ; c653
wOTClassName:: ds TRAINER_CLASS_NAME_LENGTH ; c656

wCurOTMon:: db ; c663

wBattleParticipantsNotFainted::
; Bit array.  Bits 0 - 5 correspond to party members 1 - 6.
; Bit set if the mon appears in battle.
; Bit cleared if the mon faints.
; Backed up if the enemy switches.
; All bits cleared if the enemy faints.
	db

wTypeModifier:: ; c665
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	db

wCriticalHit:: ; c666
; 0 if not critical
; 1 for a critical hit
; 2 for a OHKO
	db

wAttackMissed:: ; c667
; nonzero for a miss
	db

wPlayerSubStatus1:: ; c668
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
wPlayerSubStatus2:: ; c669
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
wPlayerSubStatus3:: ; c66a
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
wPlayerSubStatus4:: ; c66b
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
wPlayerSubStatus5:: ; c66c
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

wEnemySubStatus1:: ; c66d
; see wPlayerSubStatus1
	db
wEnemySubStatus2:: ; c66e
; see wPlayerSubStatus2
	db
wEnemySubStatus3:: ; c66f
; see wPlayerSubStatus3
	db
wEnemySubStatus4:: ; c670
; see wPlayerSubStatus4
	db
wEnemySubStatus5:: ; c671
; see wPlayerSubStatus5
	db

wPlayerRolloutCount:: db ; c672
wPlayerConfuseCount:: db ; c673
wPlayerToxicCount:: db ; c674
wPlayerDisableCount:: db ; c675
wPlayerEncoreCount:: db ; c676
wPlayerPerishCount:: db ; c677
wPlayerFuryCutterCount:: db ; c678
wPlayerProtectCount:: db ; c679

wEnemyRolloutCount:: db ; c67a
wEnemyConfuseCount:: db ; c67b
wEnemyToxicCount:: db ; c67c
wEnemyDisableCount:: db ; c67d
wEnemyEncoreCount:: db ; c67e
wEnemyPerishCount:: db ; c67f
wEnemyFuryCutterCount:: db ; c680
wEnemyProtectCount:: db ; c681

wPlayerDamageTaken:: dw ; c682
wEnemyDamageTaken:: dw ; c684

wBattleReward:: ds 3 ; c686
wBattleAnimParam::
wKickCounter::
wPresentPower::
	db ; c689
wBattleScriptBuffer:: ds 40 ; c68a

wBattleScriptBufferAddress:: dw ; c6b2

wTurnEnded:: db ; c6b4

	ds 1

wPlayerStats:: ; c6b6
wPlayerAttack:: dw
wPlayerDefense:: dw
wPlayerSpeed:: dw
wPlayerSpAtk:: dw
wPlayerSpDef:: dw
	ds 1

wEnemyStats:: ; c6c1
wEnemyAttack:: dw
wEnemyDefense:: dw
wEnemySpeed:: dw
wEnemySpAtk:: dw
wEnemySpDef:: dw
	ds 1

wPlayerStatLevels:: ; c6cc
; 07 neutral
wPlayerAtkLevel:: db ; c6cc
wPlayerDefLevel:: db ; c6cd
wPlayerSpdLevel:: db ; c6ce
wPlayerSAtkLevel:: db ; c6cf
wPlayerSDefLevel:: db ; c6d0
wPlayerAccLevel:: db ; c6d1
wPlayerEvaLevel:: db ; c6d2
	ds 1 ; c6d3
wPlayerStatLevelsEnd::

wEnemyStatLevels:: ; c6d4
; 07 neutral
wEnemyAtkLevel:: db ; c6d4
wEnemyDefLevel:: db ; c6d5
wEnemySpdLevel:: db ; c6d6
wEnemySAtkLevel:: db ; c6d7
wEnemySDefLevel:: db ; c6d8
wEnemyAccLevel:: db ; c6d9
wEnemyEvaLevel:: db ; c6da
	ds 1

wEnemyTurnsTaken:: db ; c6dc
wPlayerTurnsTaken:: db ; c6dd
	ds 1

wPlayerSubstituteHP:: db ; c6df
wEnemySubstituteHP:: db ; c6e0

wUnusedPlayerLockedMove:: db ; c6e1
	ds 1

wCurPlayerMove:: db ; c6e3
wCurEnemyMove:: db ; c6e4

wLinkBattleRNCount:: ; c6e5
; how far through the prng stream
	db

wEnemyItemState:: db ; c6e6
	ds 2
wCurEnemyMoveNum:: db ; c6e9

wEnemyHPAtTimeOfPlayerSwitch:: dw ; c6ea
wPayDayMoney:: ds 3 ; c6ec

wSafariMonAngerCount:: db
wSafariMonEating:: db
	ds 1
wEnemyBackupDVs:: dw ; used when enemy is transformed
wAlreadyDisobeyed:: db ; c6f4

wDisabledMove:: db ; c6f5
wEnemyDisabledMove:: db ; c6f6
wWhichMonFaintedFirst:: db

; exists so you can't counter on switch
wLastPlayerCounterMove:: db ; c6f8
wLastEnemyCounterMove:: db ; c6f9

wEnemyMinimized:: db ; c6fa

wAlreadyFailed:: db ; c6fb

wBattleParticipantsIncludingFainted:: db ; c6fc
wBattleLowHealthAlarm:: db ; c6fd
wPlayerMinimized:: db ; c6fe
wPlayerScreens:: ; c6ff
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

wEnemyScreens:: ; c700
; see wPlayerScreens
	db

wPlayerSafeguardCount:: db ; c701
wPlayerLightScreenCount:: db ; c702
wPlayerReflectCount:: db ; c703
	ds 1

wEnemySafeguardCount:: db ; c705
wEnemyLightScreenCount:: db ; c706
wEnemyReflectCount:: db ; c707
	ds 2

wBattleWeather:: ; c70a
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	db

wWeatherCount:: ; c70b
; # turns remaining
	db

wLoweredStat:: db ; c70c
wEffectFailed:: db ; c70d
wFailedMessage:: db ; c70e
wEnemyGoesFirst:: db ; c70f

wPlayerIsSwitching:: db ; c710
wEnemyIsSwitching::  db ; c711

wPlayerUsedMoves:: ; c712
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wEnemyAISwitchScore:: db ; c716
wEnemySwitchMonParam:: db ; c717
wEnemySwitchMonIndex:: db ; c718
wTempLevel:: db ; c719
wLastPlayerMon:: db ; c71a
wLastPlayerMove:: db ; c71b
wLastEnemyMove:: db ; c71c

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

wBattleEnded:: db ; c734

wWildMonMoves:: ds NUM_MOVES ; c735
wWildMonPP:: ds NUM_MOVES ; c739

wAmuletCoin:: db ; c73a

wSomeoneIsRampaging:: db ; c73b

wPlayerJustGotFrozen:: db ; c73c
wEnemyJustGotFrozen:: db ; c73d
wBattleEnd::

NEXTU ; c608
; unown puzzle
wUnownPuzzle::
	ds 200
wPuzzlePieces:: ds 6 * 6
	ds 244
wUnownPuzzleEnd::

NEXTU ; c608
wMobileTransferData:: ds $1e0

NEXTU ; c608

; This union spans 200 bytes from c608 to c6d0.
UNION ; c608
; timeset temp storage
wTimeSetBuffer::
	ds 20
wInitHourBuffer:: db ; c61c
	ds 9
wInitMinuteBuffer:: db ; c626
	ds 19
wTimeSetBufferEnd::

NEXTU ; c608
; hall of fame temp struct
wHallOfFameTemp:: hall_of_fame wHallOfFameTemp

NEXTU ; c608
; link engine data
wLink_c608:: ds 10
wc612:: ds 10

NEXTU ; c608
; odd egg
wOddEgg:: party_struct wOddEgg
wOddEggName:: ds MON_NAME_LENGTH
wOddEggOTName:: ds NAME_LENGTH

NEXTU ; c608
wc608:: ds 53
wc63d:: ds 5
wc642:: ds 5
wc647:: ds 33
wc668:: ds 32
wc688:: ds 2
wc68a:: ds 4
	ds 66
ENDU ; c6d0

; This union spans 280 bytes from c6d0 to c7e8.
UNION ; c6d0
; pokedex
wPokedexDataStart:: ; c6d0
wPokedexOrder:: ds $100 ; >= NUM_POKEMON
wPokedexOrderEnd::
wDexListingScrollOffset:: db ; offset of the first displayed entry from the start
wDexListingCursor:: db ; Dex cursor
wDexListingEnd:: db ; Last mon to display
wDexListingHeight:: db ; number of entries displayed at once in the dex listing
wCurDexMode:: db ; Pokedex Mode
wDexSearchMonType1:: db ; first type to search
wDexSearchMonType2:: db ; second type to search
wDexSearchResultCount:: db
wDexArrowCursorPosIndex:: db
wDexArrowCursorDelayCounter:: db
wDexArrowCursorBlinkCounter:: db
wDexSearchSlowpokeFrame:: db
wUnlockedUnownMode:: db
wDexCurUnownIndex:: db
wDexUnownCount:: db
wDexConvertedMonType:: db ; mon type converted from dex search mon type
wDexListingScrollOffsetBackup:: db
wDexListingCursorBackup:: db
wBackupDexListingCursor:: db
wBackupDexListingPage:: db
wDexCurLocation:: db
if DEF(_CRYSTAL11)
wPokedexStatus:: db
wPokedexDataEnd::
else
wPokedexDataEnd:: ds 1
endc
	ds 2

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
; trade
wTrademons:: ; c6d0
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
wNamingScreenCurNameLength:: db ; c6d2
wNamingScreenMaxNameLength:: db ; c6d3
wNamingScreenType:: db ; c6d4
wNamingScreenCursorObjectPointer:: dw ; c6d5
wNamingScreenLastCharacter:: db ; c6d7
wNamingScreenStringEntryCoord:: dw ; c6d8

NEXTU ; c6d0
; slot machine
wSlots:: ; c6d0
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
wCurReelStopped:: ds 3
wPayout:: dw
wCurReelXCoord:: db
wCurReelYCoord:: db
	ds 2
wSlotBuildingMatch:: db
wSlotsDataEnd::
	ds 28
wSlotsEnd::

NEXTU ; c6d0
; card flip
wCardFlip:: ; c6d0
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
wDummyGame:: ; c6d0
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
; mobile data
wc6d0:: ds 56
wc708:: db
wc709:: db
wc70a:: db
wc70b:: db
wc70c:: db
wc70d:: db
wc70e:: db
wc70f:: db
wc710:: db
wc711:: db
wc712:: ds 7
wc719:: ds 53
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

; This was a buffer for map-related pointers in the 1997 G/S prototype.
; See wMapBuffer in pokegold-spaceworld's wram.asm.
wUnusedMapBuffer:: ds 24
wUnusedMapBufferEnd::


SECTION "Overworld Map", WRAM0

UNION ; c800
; overworld map blocks
wOverworldMapBlocks:: ds 1300 ; c800
wOverworldMapBlocksEnd::

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

; Printer data
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
wPrinterTilemapBuffer:: ds SCREEN_HEIGHT * SCREEN_WIDTH ; ca90
wPrinterTilemapBufferEnd::
wPrinterStatus:: db ; cbf8
	ds 1
; High nibble is for margin before the image, low nibble is for after.
wPrinterMargins:: db ; cbfa
wPrinterExposureTime:: db ; cbfb
	ds 16
wGameboyPrinterRAMEnd::

NEXTU ; c800
; bill's pc data
wBillsPCData::
wBillsPCPokemonList::
; (species, box number, list index) x30
	ds 3 * 30
	ds 720
wBillsPC_ScrollPosition:: db
wBillsPC_CursorPosition:: db
wBillsPC_NumMonsInBox:: db
wBillsPC_NumMonsOnScreen:: db
wBillsPC_LoadedBox:: db ; 0 if party, 1 - 14 if box, 15 if active box
wBillsPC_BackupScrollPosition:: db
wBillsPC_BackupCursorPosition:: db
wBillsPC_BackupLoadedBox:: db
wBillsPC_MonHasMail:: db
	ds 5
wBillsPCDataEnd::


NEXTU ; c800
; Hall of Fame data
wHallOfFamePokemonList:: hall_of_fame wHallOfFamePokemonList

NEXTU ; c800
; raw link data
wLinkData:: ds $514
wLinkDataEnd::

NEXTU ; c800
; link data members
wLinkPlayerName:: ds NAME_LENGTH
wLinkPartyCount:: db
wLinkPartySpecies:: ds PARTY_LENGTH
wLinkPartyEnd:: db ; older code doesn't check PartyCount

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
wTimeCapsulePartyMonNicks:: ds PARTY_LENGTH * MON_NAME_LENGTH
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
wLinkPlayerPartyMonNicks:: ds PARTY_LENGTH * MON_NAME_LENGTH
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
wMobileSDK_PacketChecksum:: dw ; c812
wc814:: ds 4
wMobileSDK_AdapterType:: db ; c818
	ds 5
wMobileSDK_SendCommandID:: db ; c81e
	ds 1
wc820:: ds 1
wc821:: ds 1
wc822:: ds 46

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
wCreditsBlankFrame2bpp:: ds 4 * 4 tiles
wCreditsBlankFrame2bppEnd::

NEXTU ; ca00
; mystery gift data
wca00:: db
wca01:: db
wca02:: db

NEXTU ; ca00
; link data
	ds 191
wcabf:: ds 1

NEXTU ; ca00
	ds $2f
wMobileSDK_ReceivePacketBufferAlt:: ds 11 ; ca2f
wMobileSDK_ReceivedBytes:: dw ; ca3a
wMobileSDK_ReceivePacketBuffer:: ; ca3c

ENDU ; cb00

	ds 14
wcb0e:: ds 5
wcb13:: ds 50
wcb45:: ds 2
wMobileSDK_PacketBuffer:: ds 18 ; cb47
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
; wBGMapBuffer
wBGMapBuffer::     ds 40 ; cd20
wBGMapPalBuffer::  ds 40 ; cd48
wBGMapBufferPtrs:: ds 40 ; cd70 ; 20 bg map addresses (16x8 tiles)
wBGMapBufferEnd::

NEXTU ; cd20
; credits
wCreditsPos:: db
wCreditsUnusedCD21:: db
wCreditsTimer:: db

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
wBattleTowerRoomMenu2JumptableIndex:: ds 1
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
wcd6f:: ds 1
wcd70:: ds 1
wcd71:: ds 1
wcd72:: ds 1
wcd73:: ds 1
wcd74:: ds 1

wOTMonSelection:: ds 2 ; ds BATTLETOWER_PARTY_LENGTH
wcd77:: ds 1

wMobileCrashCheckPointer:: dw
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

wSGBPredef:: db ; cd98

wPlayerHPPal:: db ; cd99
wEnemyHPPal:: db ; cd9a

wHPPals:: ds PARTY_LENGTH
wCurHPPal:: db

	ds 7

wSGBPals:: ds 48 ; cda9

wAttrmap:: ; cdd9
; 20x18 grid of bg tile attributes for 8x8 tiles
; read horizontally from the top row
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds SCREEN_WIDTH * SCREEN_HEIGHT
wAttrmapEnd::

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

wMonType:: db ; cf5f

wCurSpecies:: db ; cf60

wNamedObjectTypeBuffer:: db

	ds 1

wJumptableIndex::
wBattleTowerBattleEnded::
	db

UNION ; cf64
; unidentified
wcf64:: db
wcf65:: db
wcf66:: db

NEXTU ; cf64
; intro and title data
wIntroSceneFrameCounter:: db
UNION ; cf65
wIntroSceneTimer:: db
NEXTU ; cf65
wTitleScreenTimer:: dw
ENDU

NEXTU ; cf64
; credits data
wCreditsBorderFrame:: db
wCreditsBorderMon:: db
wCreditsLYOverride:: db

NEXTU ; cf64
; pokedex
wPrevDexEntryJumptableIndex:: db
if DEF(_CRYSTAL11)
wPrevDexEntryBackup:: db
else
wPrevDexEntryBackup::
wPokedexStatus:: db
endc

NEXTU ; cf64
; pokegear
wPokegearCard:: db
wPokegearMapRegion:: db

NEXTU ; cf64
; pack
wPackJumptableIndex:: db
wCurPocket:: db
wPackUsedItem:: db

NEXTU ; cf64
; trainer card badges
wTrainerCardBadgeFrameCounter:: db
wTrainerCardBadgeTileID:: db
wTrainerCardBadgeAttributes:: db

NEXTU ; cf64
; card flip data
wCardFlipCursorY:: db
wCardFlipCursorX:: db
wCardFlipWhichCard:: db

NEXTU ; cf64
; magnet train
wMagnetTrainOffset:: db
wMagnetTrainPosition:: db
wMagnetTrainWaitCounter:: db

NEXTU ; cf64
; unown puzzle data
wHoldingUnownPuzzlePiece:: db
wUnownPuzzleCursorPosition:: db
wUnownPuzzleHeldPiece:: db

NEXTU ; cf64
; battle tower
	ds $2
wBattleTowerRoomMenuJumptableIndex:: db

NEXTU ; cf64
; miscellaneous
wFrameCounter::
wNrOfBeatenBattleTowerTrainers::
wMomBankDigitCursorPosition::
wNamingScreenLetterCase::
wHallOfFameMonCounter::
wSlotsDelay::
	db
wPrinterQueueLength::
	db
ENDU ; cf67

wRequested2bpp::
wRequested2bppSize:: db ; cf67
wRequested2bppSource:: dw ; cf68
wRequested2bppDest:: dw ; cf6a

wRequested1bpp::
wRequested1bppSize:: db ; cf6c
wRequested1bppSource:: dw ; cf6d
wRequested1bppDest:: dw ; cf6f

wWindowStackPointer:: dw ; cf71
wMenuJoypad:: db ; cf73
wMenuSelection:: db ; cf74
wMenuSelectionQuantity:: db ; cf75
wWhichIndexSet:: db ; cf76
wScrollingMenuCursorPosition:: db ; cf77
wWindowStackSize:: db ; cf78

	ds 8

; menu header
wMenuHeader:: ; cf81
wMenuFlags:: db
wMenuBorderTopCoord:: db
wMenuBorderLeftCoord:: db
wMenuBorderBottomCoord:: db
wMenuBorderRightCoord:: db
wMenuDataPointer:: dw
wMenuCursorBuffer:: dw
wMenuDataBank:: db
	ds 6
wMenuHeaderEnd::

wMenuData::
wMenuDataFlags:: db ; cf91

UNION ; cf92
; Vertical Menu/DoNthMenu/SetUpMenu
wMenuDataItems:: db ; cf92
wMenuDataIndicesPointer:: dw ; cf94
wMenuDataDisplayFunctionPointer:: dw ; cf96
wMenuDataPointerTableAddr:: dw ; cf97

NEXTU ; cf92
; 2D Menu
wMenuData_2DMenuDimensions:: db ; cf92
wMenuData_2DMenuSpacing:: db ; cf93
wMenuData_2DMenuItemStringsBank:: db ; cf94
wMenuData_2DMenuItemStringsAddr:: dw ; cf96
wMenuData_2DMenuFunctionBank:: db ; cf97
wMenuData_2DMenuFunctionAddr:: dw ; cf98

NEXTU ; cf92
; Scrolling Menu
wMenuData_ScrollingMenuHeight:: db ; cf92
wMenuData_ScrollingMenuWidth:: db ; cf93
wMenuData_ScrollingMenuItemFormat:: db ; cf94
wMenuData_ItemsPointerBank:: db ; cf95
wMenuData_ItemsPointerAddr:: dw ; cf97
wMenuData_ScrollingMenuFunction1:: ds 3 ; cf98
wMenuData_ScrollingMenuFunction2:: ds 3 ; cf9b
wMenuData_ScrollingMenuFunction3:: ds 3 ; cf9e
ENDU ; cfa1
wMenuDataEnd::

w2DMenuData::
w2DMenuCursorInitY:: db ; cfa1
w2DMenuCursorInitX:: db ; cfa2
w2DMenuNumRows:: db ; cfa3
w2DMenuNumCols:: db ; cfa4
w2DMenuFlags1:: ; cfa5
; bit 7: Disable checking of wMenuJoypadFilter
; bit 6: Enable sprite animations
; bit 5: Wrap around vertically
; bit 4: Wrap around horizontally
; bit 3: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far down
; bit 2: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 5 is disabled and we tried to go too far up
; bit 1: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far left
; bit 0: Set bit 7 in w2DMenuFlags2 and exit the loop if bit 4 is disabled and we tried to go too far right
	db
w2DMenuFlags2:: db ; cfa6
w2DMenuCursorOffsets:: db ; cfa7
wMenuJoypadFilter:: db ; cfa8
w2DMenuDataEnd::

wMenuCursorY:: db ; cfa9
wMenuCursorX:: db ; cfaa
wCursorOffCharacter:: db ; cfab
wCursorCurrentTile:: dw ; cfac

	ds 3

wOverworldDelay:: db ; cfb1
wTextDelayFrames:: db ; cfb2
wVBlankOccurred:: db ; cfb3

wPredefID:: db ; cfb4
wPredefTemp:: dw ; cfb5
wPredefAddress:: dw ; cfb7
wFarCallBCBuffer:: dw ; cfb9

wcfbb:: db

wGameTimerPause:: ; cfbc
; bit 0: game timer paused
; bit 7: something mobile
	db

	ds 1

wcfbe:: ; cfbe
; bits 4, 6, or 7 can be used to disable joypad input
; bit 4
; bit 6: mon fainted?
; bit 7: SGB flag?
	db

	ds 1

wInBattleTowerBattle:: ; cfc0
; 0 not in BattleTower-Battle
; 1 BattleTower-Battle
	db

	ds 1

wFXAnimID:: dw ; cfc2

wPlaceBallsX:: db ; cfc4
wPlaceBallsY:: db ; cfc5

wTileAnimationTimer:: db ; cfc6

; palette backups?
wBGP:: db
wOBP0:: db
wOBP1:: db

wNumHits:: db

	ds 1

wOptions:: ; cfcc
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	db
wSaveFileExists:: db
wTextboxFrame:: ; cfce
; bits 0-2: textbox frame 0-7
	db
wTextboxFlags::
; bit 0: 1-frame text delay
; bit 4: no text delay
	db
wGBPrinterBrightness:: ; cfd0
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	db
wOptions2:: ; cfd1
; bit 1: menu account off/on
	db
	ds 2
wOptionsEnd::

; Time buffer, for counting the amount of time since
; an event began.
wSecondsSince:: db
wMinutesSince:: db
wHoursSince:: db
wDaysSince:: db


SECTION "WRAM 1", WRAMX

wGBCOnlyDecompressBuffer:: ds 1 ; also uses the next $53f bytes for $540 total

wDefaultSpawnpoint:: db

UNION ; d002
; mail temp storage
wTempMail:: mailmsg wTempMail

NEXTU ; d002
; poke seer
wSeerAction:: db
wSeerNickname:: ds MON_NAME_LENGTH
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
wBufferMonNick:: ds MON_NAME_LENGTH ; d002
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

NEXTU ; d002
; town map data
wTownMapPlayerIconLandmark:: db
UNION
wTownMapCursorLandmark:: db
wTownMapCursorObjectPointer:: dw
NEXTU
wTownMapCursorCoordinates:: dw
ENDU

NEXTU ; d002
; phone call data
wPhoneScriptBank:: db
wPhoneCaller:: dw

NEXTU ; d002
; radio data
wCurRadioLine:: db
wNextRadioLine:: db
wRadioTextDelay:: db
wNumRadioLinesPrinted:: db
wOaksPKMNTalkSegmentCounter:: db
	ds 5
wRadioText:: ds 2 * SCREEN_WIDTH
wRadioTextEnd::

NEXTU ; d002
; lucky number show
wLuckyNumberDigitsBuffer:: ds 5

NEXTU ; d002
; movement buffer data
wMovementBufferCount:: db
wMovementBufferObject:: db
wUnusedMovementBufferBank:: db
wUnusedMovementBufferPointer:: dw
wMovementBuffer:: ds 55

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
wTrainerHUDTiles:: ds 4

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
wSuicuneFrame::
	db
	ds 2
wStartFlypoint:: db
wEndFlypoint:: db

NEXTU ; d002
; unidentified
wd002:: db
wd003:: db
wd004:: db

; mobile?
	ds 1
wd006:: ds 2
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
; trainer data
wSeenTrainerBank:: db
wSeenTrainerDistance:: db
wSeenTrainerDirection:: db
wTempTrainer::
wTempTrainerEventFlag:: dw
wTempTrainerClass:: db
wTempTrainerID:: db
wSeenTextPointer:: dw
wWinTextPointer:: dw
wLossTextPointer:: dw
wScriptAfterPointer:: dw
wRunningTrainerBattleScript:: db
wTempTrainerEnd::

NEXTU ; d03e
; menu items list
wMenuItemsList:: ds 16
wMenuItemsListEnd::

NEXTU ; d03e
; fruit tree data
wCurFruitTree:: db
wCurFruit:: db

NEXTU ; d03e
; item ball data
wItemBallData::
wItemBallItemID:: db
wItemBallQuantity:: db
wItemBallDataEnd::

NEXTU ; d03e
; hidden item data
wHiddenItemData::
wHiddenItemEvent:: dw
wHiddenItemID:: db
wHiddenItemDataEnd::

NEXTU ; d03e
; elevator data
wElevatorData::
wElevatorPointerBank:: db
wElevatorPointer:: dw
wElevatorOriginFloor:: db
wElevatorDataEnd::

NEXTU ; d03e
; coord event data
wCurCoordEvent::
wCurCoordEventSceneID:: db
wCurCoordEventMapY:: db
wCurCoordEventMapX:: db
	ds 1
wCurCoordEventScriptAddr:: dw

NEXTU ; d03e
; BG event data
wCurBGEvent::
wCurBGEventYCoord:: db
wCurBGEventXCoord:: db
wCurBGEventType:: db
wCurBGEventScriptAddr:: dw

NEXTU ; d03e
; mart data
wMartType:: db
wMartPointerBank:: db
wMartPointer:: dw
wMartJumptableIndex:: db
wBargainShopFlags:: db

NEXTU ; d03e
; player movement data
wCurInput::
wFacingTileID:: db
wWalkingIntoNPC:: db
wWalkingIntoLand:: db
wWalkingIntoEdgeWarp:: db
wMovementAnimation:: db
wWalkingDirection:: db
wFacingDirection:: db
wWalkingX:: db
wWalkingY:: db
wWalkingTile:: db
	ds 6
wPlayerTurningDirection:: db

NEXTU ; d03e
; std script buffer
	ds 1
wJumpStdScriptBuffer:: ds 3

NEXTU ; d03e
; phone script data
wCheckedTime:: db
wPhoneListIndex:: db
wNumAvailableCallers:: db
wAvailableCallers:: ds CONTACT_LIST_SIZE

NEXTU ; d03e
; phone caller contact
	ds 1
wCallerContact:: ds PHONE_CONTACT_SIZE

NEXTU ; d03e
; backup menu data
	ds 7
wMenuCursorBufferBackup:: db
wMenuScrollPositionBackup:: db

NEXTU ; d03e
; poison step data
wPoisonStepData::
wPoisonStepFlagSum:: db
wPoisonStepPartyFlags:: ds PARTY_LENGTH
wPoisonStepDataEnd::
ENDU ; d04f

	ds 23
ENDU ; d066

wTMHMMoveNameBackup:: ds MOVE_NAME_LENGTH ; d066

wStringBuffer1:: ds 19 ; d073
wStringBuffer2:: ds 19 ; d086
wStringBuffer3:: ds 19 ; d099
wStringBuffer4:: ds 19 ; d0ac
wStringBuffer5:: ds 19 ; d0bf

wBattleMenuCursorBuffer:: dw ; d0d2

wCurBattleMon:: db ; d0d4
wCurMoveNum:: db ; d0d5

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
wd0e3:: ; mobile
	db

wMenuScrollPosition:: ds 4

wQueuedScriptBank:: db
wQueuedScriptAddr:: dw

wNumMoves:: db

wFieldMoveSucceeded::
wItemEffectSucceeded::
wBattlePlayerAction::
; 0 - use move
; 1 - use item
; 2 - switch
wSolvedUnownPuzzle::
	db ; d0ec

wVramState:: ; d0ed
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	db

wBattleResult:: ; d0ee
; WIN, LOSE, or DRAW
; bit 6: caught celebi
; bit 7: box full
	db
wUsingItemWithSelect:: db ; d0ef

UNION ; d0f0
; mart data
wCurMart:: ds 16
wCurMartEnd::

NEXTU ; d0f0
; elevator data
wCurElevator:: db
wCurElevatorFloors:: db

NEXTU ; d0f0
; mailbox data
wCurMessageScrollPosition:: db
wCurMessageIndex:: db
wMailboxCount:: db
wMailboxItems:: ds MAILBOX_CAPACITY
wMailboxEnd:: ; d0fe
ENDU ; d100

wListPointer:: dw ; d100
wUnusedD102:: dw ; d102
wItemAttributesPtr:: dw ; d104

wCurItem:: db ; d106
wCurItemQuantity:: ; d107
wMartItemID::
	db

wCurPartySpecies:: db ; d108

wCurPartyMon:: ; d109
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

wTempMon:: party_struct wTempMon ; d10e

wSpriteFlags:: db ; d13e

wHandlePlayerStep:: db ; d13f

	ds 1

wPartyMenuActionText:: db ; d141

wItemAttributeParamBuffer:: db ; d142

wCurPartyLevel:: db ; d143

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
wPlayerStepFlags:: db ; d150
wPlayerStepDirection:: db ; d151

wBGMapAnchor:: dw ; d152

UNION ; d154
wUsedSprites:: ds SPRITE_GFX_LIST_CAPACITY * 2
wUsedSpritesEnd::

NEXTU ; d154
	ds 31
wd173:: db ; related to command queue type 3
ENDU ; d194

wOverworldMapAnchor:: dw ; d194
wMetatileStandingY:: db ; d196
wMetatileStandingX:: db ; d197

wMapPartial::
wMapAttributesBank:: db ; d198
wMapTileset:: db ; d199
wEnvironment:: db ; d19a
wMapAttributesPointer:: dw ; d19b
wMapPartialEnd::

wMapAttributes:: ; d19d
wMapBorderBlock:: db ; d19d
; width/height are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
wMapHeight:: db ; d19e
wMapWidth:: db ; d19f
wMapBlocksBank:: db; d1a0
wMapBlocksPointer:: dw ; d1a1
wMapScriptsBank:: db ; d1a3
wMapScriptsPointer:: dw ; d1a4
wMapEventsPointer:: dw ; d1a6
; bit set
wMapConnections:: db ; d1a8
wMapAttributesEnd::

wNorthMapConnection:: map_connection_struct wNorth ; d1a9
wSouthMapConnection:: map_connection_struct wSouth ; d1b5
wWestMapConnection::  map_connection_struct wWest ; d1c1
wEastMapConnection::  map_connection_struct wEast ; d1cd

wTileset::
wTilesetBank:: db ; d1d9
wTilesetAddress:: dw ; d1da
wTilesetBlocksBank:: db ; d1dc
wTilesetBlocksAddress:: dw ; d1dd
wTilesetCollisionBank:: db ; d1df
wTilesetCollisionAddress:: dw ; d1e0
wTilesetAnim:: dw ; bank 3f ; d1e2
	ds 2 ; unused ; d1e4
wTilesetPalettes:: dw ; bank 3f ; d1e6
wTilesetEnd::

wEvolvableFlags:: flag_array PARTY_LENGTH ; d1e8

wForceEvolution:: db ; d1e9

UNION ; d1ea
; general-purpose buffers
wBuffer1:: db ; d1ea
wBuffer2:: db ; d1eb
wBuffer3:: db ; d1ec
wBuffer4:: db ; d1ed
wBuffer5:: db ; d1ee
wBuffer6:: db ; d1ef

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
wCurEnemyItem:: db
ENDU ; d1f7

	ds 3

wLinkBattleRNs:: ds 10 ; d1fa

wTempEnemyMonSpecies::  db ; d204
wTempBattleMonSpecies:: db ; d205

wEnemyMon:: battle_struct wEnemyMon ; d206
wEnemyMonBaseStats:: ds 5 ; d226
wEnemyMonCatchRate:: db ; d22b
wEnemyMonBaseExp::   db ; d22c
wEnemyMonEnd::

wBattleMode:: ; d22d
; 0: overworld
; 1: wild battle
; 2: trainer battle
	db

wTempWildMonSpecies:: db

wOtherTrainerClass:: ; d22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	db

; BATTLETYPE_* values
wBattleType:: db ; d230

wOtherTrainerID:: ; d231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	db

wForcedSwitch:: db

wTrainerClass:: db ; d233

wUnownLetter:: db ; d234

wMoveSelectionMenuType:: db

; corresponds to the data/pokemon/base_stats/*.asm contents
wCurBaseData:: ; d236
wBaseDexNo:: db ; d236
wBaseStats:: ; d237
wBaseHP:: db ; d237
wBaseAttack:: db ; d238
wBaseDefense:: db ; d239
wBaseSpeed:: db ; d23a
wBaseSpecialAttack:: db ; d23b
wBaseSpecialDefense:: db ; d23c
wBaseType:: ; d23d
wBaseType1:: db ; d23d
wBaseType2:: db ; d23e
wBaseCatchRate:: db ; d23f
wBaseExp:: db ; d240
wBaseItems:: ; d241
wBaseItem1:: db ; d241
wBaseItem2:: db ; d242
wBaseGender:: db ; d243
wBaseUnknown1:: db ; d244
wBaseEggSteps:: db ; d245
wBaseUnknown2:: db ; d246
wBasePicSize:: db ; d247
wBaseUnusedFrontpic:: dw ; d248
wBaseUnusedBackpic:: dw ; d24a
wBaseGrowthRate:: db ; d24c
wBaseEggGroups:: db ; d24d
wBaseTMHM:: flag_array NUM_TM_HM_TUTOR ; d24e
wCurBaseDataEnd::

wCurDamage:: dw ; d256

	ds 2

wMornEncounterRate::  db ; d25a
wDayEncounterRate::   db ; d25b
wNiteEncounterRate::  db ; d25c
wWaterEncounterRate:: db ; d25d
wListMoves_MoveIndicesBuffer:: ds NUM_MOVES
wPutativeTMHMMove:: db
wInitListType:: db
wBattleHasJustStarted:: db

; d265 has many different short-term uses
wNamedObjectIndexBuffer::
wDeciramBuffer::
wTempByteValue::
wNumSetBits::
wTypeMatchup::
wCurType::
wTempSpecies::
wTempIconSpecies::
wTempTMHM::
wTempPP::
wNextBoxOrPartyIndex::
wChosenCableClubRoom::
wBreedingCompatibility::
wMoveGrammar::
wApplyStatLevelMultipliersToEnemy::
wUsePPUp::
wd265:: ; mobile
	db

wFailedToFlee:: db
wNumFleeAttempts:: db
wMonTriedToEvolve:: db

wTimeOfDay:: db ; d269

	ds 1


SECTION "Enemy Party", WRAMX

UNION ; d26b
wPokedexShowPointerAddr:: dw
wPokedexShowPointerBank:: db
	ds 3
wd271:: dw ; mobile

NEXTU ; d26b
wUnusedEggHatchFlag:: db

NEXTU ; d26b
; enemy party
wOTPlayerName:: ds NAME_LENGTH ; d26b
wOTPlayerID:: dw ; d276
	ds 8
wOTPartyCount::   db ; d280
wOTPartySpecies:: ds PARTY_LENGTH ; d281
wOTPartyEnd::     db ; older code doesn't check PartyCount
ENDU ; d276

UNION ; d288
; ot party mons
wOTPartyMons::
wOTPartyMon1:: party_struct wOTPartyMon1 ; d288
wOTPartyMon2:: party_struct wOTPartyMon2 ; d2b8
wOTPartyMon3:: party_struct wOTPartyMon3 ; d2e8
wOTPartyMon4:: party_struct wOTPartyMon4 ; d318
wOTPartyMon5:: party_struct wOTPartyMon5 ; d348
wOTPartyMon6:: party_struct wOTPartyMon6 ; d378
wOTPartyMonsEnd::

wOTPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; d3a8
wOTPartyMonNicknames:: ds MON_NAME_LENGTH * PARTY_LENGTH ; d3ea
wOTPartyDataEnd::
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

wd430:: ; mobile
wBattleAction:: db ; d430

wd431:: db ; mobile
wMapStatus:: db ; d432
wMapEventStatus:: db ; d433

wScriptFlags:: ; d434
; bit 3: priority jump
	db
wScriptFlags2:: ; d435
	db
wScriptFlags3:: ; d436
; bit 0: count steps
; bit 1: coord events
; bit 2: warps and connections
; bit 4: wild encounters
; bit 5: unknown
	db

wScriptMode:: db ; d437
wScriptRunning:: db ; d438
wScriptBank:: db ; d439
wScriptPos:: dw ; d43a

wScriptStackSize:: db
wScriptStack:: ds 3 * 5
	ds 1
wScriptDelay:: db ; d44d

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
; bit 7: if set, cancel wPlayerAction
; bit 6: RefreshMapSprites doesn't reload player sprite
; bit 5: if set, set facing according to bits 0-1
; bit 2: female player has been transformed into male
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
wMapStatusEnd:: ; d470

	ds 2

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
wPlayerID:: ; d47b
	dw

wPlayerName:: ds NAME_LENGTH ; d47d
wMomsName::   ds NAME_LENGTH ; d488
wRivalName::  ds NAME_LENGTH ; d493
wRedsName::   ds NAME_LENGTH ; d49e
wGreensName:: ds NAME_LENGTH ; d4a9

wSavedAtLeastOnce:: db
wSpawnAfterChampion:: db

; init time set at newgame
wStartDay:: db ; d4b6
wStartHour:: db ; d4b7
wStartMinute:: db ; d4b8
wStartSecond:: db ; d4b9

wRTC:: ds 4 ; d4ba
	
	ds 4

wDST:: ; d4c2
; bit 7: dst
	db

wGameTime:: ; used only for BANK(wGameTime)
wGameTimeCap::     db ; d4c3
wGameTimeHours::   dw ; d4c4
wGameTimeMinutes:: db ; d4c6
wGameTimeSeconds:: db ; d4c7
wGameTimeFrames::  db ; d4c8

	ds 2

wCurDay:: db ; d4cb

	ds 1

wObjectFollow_Leader:: db
wObjectFollow_Follower:: db
wCenteredObject:: db
wFollowerMovementQueueLength:: db
wFollowMovementQueue:: ds 5

wObjectStructs:: ; d4d6
wPlayerStruct::   object_struct wPlayer
wObject1Struct::  object_struct wObject1
wObject2Struct::  object_struct wObject2
wObject3Struct::  object_struct wObject3
wObject4Struct::  object_struct wObject4
wObject5Struct::  object_struct wObject5
wObject6Struct::  object_struct wObject6
wObject7Struct::  object_struct wObject7
wObject8Struct::  object_struct wObject8
wObject9Struct::  object_struct wObject9
wObject10Struct:: object_struct wObject10
wObject11Struct:: object_struct wObject11
wObject12Struct:: object_struct wObject12
wObjectStructsEnd:: ; d6de

wCmdQueue:: ds CMDQUEUE_CAPACITY * CMDQUEUE_ENTRY_SIZE

	ds 40

wMapObjects:: ; d71e
wPlayerObject:: map_object wPlayer
wMap1Object::   map_object wMap1
wMap2Object::   map_object wMap2
wMap3Object::   map_object wMap3
wMap4Object::   map_object wMap4
wMap5Object::   map_object wMap5
wMap6Object::   map_object wMap6
wMap7Object::   map_object wMap7
wMap8Object::   map_object wMap8
wMap9Object::   map_object wMap9
wMap10Object::  map_object wMap10
wMap11Object::  map_object wMap11
wMap12Object::  map_object wMap12
wMap13Object::  map_object wMap13
wMap14Object::  map_object wMap14
wMap15Object::  map_object wMap15
wMapObjectsEnd::

wObjectMasks:: ds NUM_OBJECTS ; d81e

wVariableSprites:: ds $100 - SPRITE_VARS ; d82e

wEnteredMapFromContinue:: db ; d83e
	ds 2
wTimeOfDayPal:: db ; d841
	ds 4
wTimeOfDayPalFlags:: db ; d846
wTimeOfDayPalset:: db
wCurTimeOfDay:: db ; d848

	ds 1

wSecretID:: dw
wStatusFlags:: ; d84c
; bit 0: pokedex
; bit 1: unown dex
; bit 2: flash
; bit 3: caught pokerus
; bit 4: rocket signal
; bit 5: wild encounters on/off
; bit 6: hall of fame
; bit 7: bug contest on
	db

wStatusFlags2:: ; d84d
; bit 0: rockets
; bit 1: safari game (unused)
; bit 2: bug contest timer
; bit 3: unused
; bit 4: bike shop call
; bit 5: can use sweet scent
; bit 6: reached goldenrod
; bit 7: rockets in mahogany
	db

wMoney:: ds 3 ; d84e
wMomsMoney:: ds 3 ; d851

wMomSavingMoney:: ; d854
; bit 0: saving some money
; bit 1: saving half money (unused)
; bit 2: saving all money (unused)
; bit 7: active
	db

wCoins:: dw ; d855

wBadges::
wJohtoBadges:: flag_array NUM_JOHTO_BADGES ; d857
wKantoBadges:: flag_array NUM_KANTO_BADGES ; d858

wTMsHMs:: ds NUM_TMS + NUM_HMS ; d859
wTMsHMsEnd::

wNumItems:: db ; d892
wItems:: ds MAX_ITEMS * 2 + 1 ; d893
wItemsEnd::

wNumKeyItems:: db ; d8bc
wKeyItems:: ds MAX_KEY_ITEMS + 1 ; d8bd
wKeyItemsEnd::

wNumBalls:: db ; d8d7
wBalls:: ds MAX_BALLS * 2 + 1 ; d8d8
wBallsEnd::

wNumPCItems:: db
wPCItems:: ds MAX_PC_ITEMS * 2 + 1 ; d8f1
wPCItemsEnd::

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
wWhichRegisteredItem:: db ; d95b
wRegisteredItem:: db ; d95c

wPlayerState:: db ; d95d

wHallOfFameCount:: dw
wTradeFlags:: flag_array NUM_NPC_TRADES ; d960
	ds 1
wMooMooBerries:: db ; d962
wUndergroundSwitchPositions:: db ; d963
wFarfetchdPosition:: db ; d964

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
wSaffronMagnetTrainStationSceneID::               db ; d97b
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
wPlayersHouse1FSceneID::                          db ; d988
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
wEcruteakTinTowerEntranceSceneID::                db ; d997
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
wMobileTradeRoomSceneID::                         db ; d9bf
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

wEventFlags:: flag_array NUM_EVENTS ; da72
; db6c

	ds 6

wCurBox:: db ; db72

	ds 2

; 8 chars + $50
wBoxNames:: ds BOX_NAME_LENGTH * NUM_BOXES ; db75

wCelebiEvent:: ; dbf3
; bit 2: forest is restless
	db

	ds 1

wBikeFlags:: ; dbf5
; bit 0: using strength
; bit 1: always on bike
; bit 2: downhill
	db
	ds 1 ; cleared along with wBikeFlags by ResetBikeFlags

wCurMapSceneScriptPointer:: dw ; dbf7

wCurCaller:: dw ; dbf9
wCurMapWarpCount:: db ; dbfb
wCurMapWarpsPointer:: dw ; dbfc
wCurMapCoordEventCount:: db ; dbfe
wCurMapCoordEventsPointer:: dw ; dbff
wCurMapBGEventCount:: db ; dc01
wCurMapBGEventsPointer:: dw ; dc02
wCurMapObjectEventCount:: db ; dc04
wCurMapObjectEventsPointer:: dw ; dc05
wCurMapSceneScriptCount:: db ; dc07
wCurMapSceneScriptsPointer:: dw ; dc08
wCurMapCallbackCount:: db ; dc0a
wCurMapCallbacksPointer:: dw ; dc0b

	ds 2

; Sprite id of each decoration
wDecoBed::           db ; dc0f
wDecoCarpet::        db ; dc10
wDecoPlant::         db ; dc11
wDecoPoster::        db ; dc12
wDecoConsole::       db ; dc13
wDecoLeftOrnament::  db ; dc14
wDecoRightOrnament:: db ; dc15
wDecoBigDoll::       db ; dc16

; Items bought from Mom
wWhichMomItem:: db ; dc17
wWhichMomItemSet:: db ; dc18
wMomItemTriggerBalance:: ds 3 ; dc19

wDailyResetTimer:: dw ; dc1c
wDailyFlags1:: db
wDailyFlags2:: db
wSwarmFlags:: db
	ds 2
wTimerEventStartDay:: db
	ds 3

wFruitTreeFlags:: flag_array NUM_FRUIT_TREES ; dc27

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
wdc5f:: db
wdc60:: db

	ds 18

wStepCount:: db ; dc73
wPoisonStepCount:: db ; dc74
	ds 2
wHappinessStepCount:: db
	ds 1

wParkBallsRemaining::
wSafariBallsRemaining:: db ; dc79
wSafariTimeRemaining:: dw ; dc7a

wPhoneList:: ds CONTACT_LIST_SIZE ; dc7c
; dc86
	ds 23

wLuckyNumberShowFlag:: db ; dc9d
	ds 1
wLuckyIDNumber:: dw ; dc9f

wRepelEffect:: db ; If a Repel is in use, it contains the nr of steps it's still active
wBikeStep:: dw
wKurtApricornQuantity:: db

wPlayerDataEnd::

wCurMapData::

wVisitedSpawns:: flag_array NUM_SPAWNS ; dca5

wDigWarpNumber:: db ; dcaa
wDigMapGroup::   db ; dcab
wDigMapNumber::  db ; dcac

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
wBackupWarpNumber:: db ; dcad
wBackupMapGroup::   db ; dcae
wBackupMapNumber::  db ; dcaf

	ds 3

wLastSpawnMapGroup:: db
wLastSpawnMapNumber:: db

wWarpNumber:: db ; dcb4
wMapGroup:: db ; dcb5 ; map group of current map
wMapNumber:: db ; dcb6 ; map number of current map
wYCoord:: db ; dcb7 ; current y coordinate relative to top-left corner of current map
wXCoord:: db ; dcb8 ; current x coordinate relative to top-left corner of current map
wScreenSave:: ds SCREEN_META_WIDTH * SCREEN_META_HEIGHT

wCurMapDataEnd::


SECTION "Party", WRAMX

wPokemonData::

wPartyCount::   db ; dcd7 ; number of Pokémon in party
wPartySpecies:: ds PARTY_LENGTH ; dcd8 ; species of each Pokémon in party
wPartyEnd::     db ; dcde ; older code doesn't check wPartyCount

wPartyMons::
wPartyMon1:: party_struct wPartyMon1 ; dcdf
wPartyMon2:: party_struct wPartyMon2 ; dd0f
wPartyMon3:: party_struct wPartyMon3 ; dd3f
wPartyMon4:: party_struct wPartyMon4 ; dd6f
wPartyMon5:: party_struct wPartyMon5 ; dd9f
wPartyMon6:: party_struct wPartyMon6 ; ddcf

wPartyMonOT:: ds NAME_LENGTH * PARTY_LENGTH ; ddff

wPartyMonNicknames:: ds MON_NAME_LENGTH * PARTY_LENGTH ; de41
wPartyMonNicknamesEnd::

	ds 22

wPokedexCaught:: flag_array NUM_POKEMON ; de99
wEndPokedexCaught::

wPokedexSeen:: flag_array NUM_POKEMON ; deb9
wEndPokedexSeen::

wUnownDex:: ds NUM_UNOWN ; ded9
wUnlockedUnowns:: db ; def3
wFirstUnownSeen:: db

wDayCareMan:: ; def5
; bit 7: active
; bit 6: egg ready
; bit 5: monsters are compatible
; bit 0: monster 1 in day-care
	db

wBreedMon1::
wBreedMon1Nick::  ds MON_NAME_LENGTH ; def6
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
wBreedMon2Nick::  ds MON_NAME_LENGTH ; df2f
wBreedMon2OT::    ds NAME_LENGTH ; df3a
wBreedMon2Stats:: box_struct wBreedMon2 ; df45

wEggNick:: ds MON_NAME_LENGTH ; df65
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

wRoamMons_CurMapNumber:: db
wRoamMons_CurMapGroup:: db
wRoamMons_LastMapNumber:: db
wRoamMons_LastMapGroup:: db

wBestMagikarpLengthFeet:: db
wBestMagikarpLengthInches:: db
wMagikarpRecordHoldersName:: ds NAME_LENGTH

wPokemonDataEnd::
wGameDataEnd::
; dff5


SECTION "Pic Animations", WRAMX

wTempTilemap::
; 20x18 grid of 8x8 tiles
	ds SCREEN_WIDTH * SCREEN_HEIGHT ; $168 = 360

; PokeAnim data
wPokeAnimStruct::
wPokeAnimSceneIndex:: db
wPokeAnimPointer:: dw
wPokeAnimSpecies:: db
wPokeAnimUnownLetter:: db
wPokeAnimSpeciesOrUnown:: db
wPokeAnimGraphicStartTile:: db
wPokeAnimCoord:: dw
wPokeAnimFrontpicHeight:: db
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
w3_d080:: ds 1
w3_d081:: ds $f
w3_d090:: ds $70

w3_d100::
wBT_OTTrainer:: battle_tower_struct wBT_OT
	ds $20
wBT_TrainerTextIndex:: db ; d200
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
wBTChoiceOfLvlGroup:: db ; d800
	ds $1
w3_d802:: ds 12 ; d802
w3_d80e:: db ; d80e
	ds $1
w3_d810:: ; d810
	ds $59
w3_d869:: ds $17 ; d869
w3_d880:: ds 1 ; d880
w3_d881:: ds 8 ; d881
w3_d889:: ds 1 ; d889
w3_d88a:: ds 4 ; d88a
w3_d88e:: ds 1 ; d88e
w3_d88f:: ds 4 ; d88f
w3_d893:: ds 1 ; d893
w3_d894:: ds 1 ; d894
w3_d895:: ds 11 ; d895
w3_d8a0:: ds 1 ; d8a0
w3_d8a1:: ds 1 ; d8a1
w3_d8a2:: ds 1 ; d8a2
w3_d8a3:: ds 1 ; d8a3
ENDU ; d8a4

	ds $1c0

w3_dc00:: ds SCREEN_WIDTH * SCREEN_HEIGHT
UNION ; dd68
w3_dd68:: ds SCREEN_WIDTH * SCREEN_HEIGHT

	ds $11c

w3_dfec:: ds $10
w3_dffc:: ds 4
NEXTU ; dd68
	ds $98
w3_de00:: ds $200
ENDU ; e000


SECTION "GBC Video", WRAMX, ALIGN[8]
; LCD expects wLYOverrides to have an alignment of $100

; eight 4-color palettes each
wGBCPalettes:: ; used only for BANK(wGBCPalettes)
wBGPals1:: ds 8 palettes ; d000
wOBPals1:: ds 8 palettes ; d040
wBGPals2:: ds 8 palettes ; d080
wOBPals2:: ds 8 palettes ; d0c0

wLYOverrides:: ds SCREEN_HEIGHT_PX ; d100
wLYOverridesEnd:: ; d190

	ds 1

wMagnetTrain:: ; used only for BANK(wMagnetTrain)
wMagnetTrainDirection:: db
wMagnetTrainInitPosition:: db
wMagnetTrainHoldPosition:: db
wMagnetTrainFinalPosition:: db
wMagnetTrainPlayerSpriteInitX:: db

	ds 106

wLYOverridesBackup:: ds SCREEN_HEIGHT_PX ; d200
wLYOverridesBackupEnd::


SECTION "Battle Animations", WRAMX

wBattleAnimTileDict:: ds 10

wActiveAnimObjects:: ; d30a
wAnimObject01:: battle_anim_struct wAnimObject01
wAnimObject02:: battle_anim_struct wAnimObject02
wAnimObject03:: battle_anim_struct wAnimObject03
wAnimObject04:: battle_anim_struct wAnimObject04
wAnimObject05:: battle_anim_struct wAnimObject05
wAnimObject06:: battle_anim_struct wAnimObject06
wAnimObject07:: battle_anim_struct wAnimObject07
wAnimObject08:: battle_anim_struct wAnimObject08
wAnimObject09:: battle_anim_struct wAnimObject09
wAnimObject10:: battle_anim_struct wAnimObject10
wActiveAnimObjectsEnd:: ; d3aa

wActiveBGEffects:: ; d3fa
wBGEffect1:: battle_bg_effect wBGEffect1
wBGEffect2:: battle_bg_effect wBGEffect2
wBGEffect3:: battle_bg_effect wBGEffect3
wBGEffect4:: battle_bg_effect wBGEffect4
wBGEffect5:: battle_bg_effect wBGEffect5
wActiveBGEffectsEnd::

wLastAnimObjectIndex:: db ; d40e

wBattleAnimFlags:: db ; d40f
wBattleAnimAddress:: dw ; d410
wBattleAnimDelay:: db ; d412
wBattleAnimParent:: dw ; d413
wBattleAnimLoops:: db ; d415
wBattleAnimVar:: db ; d416
wBattleAnimByte:: db ; d417
wBattleAnimOAMPointerLo:: db ; d418

UNION ; d419
; unidentified
wBattleAnimTemp0:: db
wBattleAnimTemp1:: db
wBattleAnimTemp2:: db
wBattleAnimTemp3:: db

NEXTU ; d419
wBattleObjectTempID:: db
wBattleObjectTempXCoord:: db
wBattleObjectTempYCoord:: db
wBattleObjectTempParam:: db

NEXTU ; d419
wBattleAnimTempOAMFlags:: db
wBattleAnimTempField02:: db
wBattleAnimTempTileID:: db
wBattleAnimTempXCoord:: db
wBattleAnimTempYCoord:: db
wBattleAnimTempXOffset:: db
wBattleAnimTempYOffset:: db
wBattleAnimTempFrameOAMFlags:: db
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
wScratchTilemap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT
wScratchAttrmap:: ds BG_MAP_WIDTH * BG_MAP_HEIGHT

NEXTU ; d000
wDecompressScratch:: ds $80 tiles
wDecompressEnemyFrontpic:: ds $80 tiles

NEXTU ; d000
; unidentified uses
w6_d000:: ds $1000
ENDU ; e000


SECTION "Stack RAM", WRAMX

wWindowStack:: ds $1000 - 1
wWindowStackBottom:: ds 1


INCLUDE "sram.asm"

INCLUDE "hram.asm"
