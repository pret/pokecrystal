INCLUDE "includes.asm"

flag_array: MACRO
	ds ((\1) + 7) / 8
ENDM

box_struct_length EQU 24 + NUM_MOVES * 2
box_struct: MACRO
\1Species::        db
\1Item::           db
\1Moves::          ds NUM_MOVES
\1ID::             dw
\1Exp::            ds 3
\1StatExp::
\1HPExp::          dw
\1AtkExp::         dw
\1DefExp::         dw
\1SpdExp::         dw
\1SpcExp::         dw
\1DVs::            ds 2
\1PP::             ds NUM_MOVES
\1Happiness::      db
\1PokerusStatus::  db
\1CaughtData::
\1CaughtTime::
\1CaughtLevel::    db
\1CaughtGender::
\1CaughtLocation:: db
\1Level::          db
\1End::
ENDM

party_struct: MACRO
	box_struct \1
\1Status::         db
\1Unused::         db
\1HP::             dw
\1MaxHP::          dw
\1Stats:: ; big endian
\1Attack::         dw
\1Defense::        dw
\1Speed::          dw
\1SpclAtk::        dw
\1SpclDef::        dw
\1StatsEnd::
ENDM

battle_struct: MACRO
\1Species::   db
\1Item::      db
\1Moves::     ds NUM_MOVES
\1MovesEnd::
\1DVs::       ds 2
\1PP::        ds NUM_MOVES
\1Happiness:: db
\1Level::     db
\1Status::    ds 2
\1HP::        dw
\1MaxHP::     dw
\1Stats:: ; big endian
\1Attack::    dw
\1Defense::   dw
\1Speed::     dw
\1SpclAtk::   dw
\1SpclDef::   dw
\1StatsEnd::
\1Type::
\1Type1::     db
\1Type2::     db
ENDM


channel_struct: MACRO
; Addreses are Channel1 (c101).
\1MusicID::           dw
\1MusicBank::         db
\1Flags::             db ; 0:on/off 1:subroutine 4:noise
\1Flags2::            db ; 0:vibrato on/off 2:duty
\1Flags3::            db ; 0:vibrato up/down
\1MusicAddress::      dw
\1LastMusicAddress::  dw
                      dw
\1NoteFlags::         db ; 5:rest
\1Condition::         db ; conditional jumps
\1DutyCycle::         db ; bits 6-7 (0:12.5% 1:25% 2:50% 3:75%)
\1Intensity::         db ; hi:pressure lo:velocity
\1Frequency:: ; 11 bits
\1FrequencyLo::       db
\1FrequencyHi::       db
\1Pitch::             db ; 0:rest 1-c:note
\1Octave::            db ; 7-0 (0 is highest)
\1StartingOctave::    db ; raises existing octaves (to repeat phrases)
\1NoteDuration::      db ; frames remaining for the current note
                      ds 1 ; c117
                      ds 1 ; c118
\1LoopCount::         db
\1Tempo::             dw
\1Tracks::            db ; hi:left lo:right
                      ds 1 ; c11d
\1VibratoDelayCount:: db ; initialized by \1VibratoDelay
\1VibratoDelay::      db ; number of frames a note plays until vibrato starts
\1VibratoExtent::     db
\1VibratoRate::       db ; hi:frames for each alt lo:frames to the next alt
                      ds 1 ; c122
                      ds 1 ; c123
                      ds 1 ; c124
                      ds 1 ; c125
                      ds 1 ; c126
                      ds 1 ; c127
\1CryPitch::          dw
                      ds 4
\1NoteLength::        db ; frames per 16th note
                      ds 1 ; c12f
                      ds 1 ; c130
                      ds 1 ; c131
                      ds 1 ; c132
ENDM



SECTION "CHR0", VRAM [$8000], BANK [0]
VTiles0::
SECTION "CHR1", VRAM [$8800], BANK [0]
VTiles1::
SECTION "CHR2", VRAM [$9000], BANK [0]
VTiles2::
SECTION "BG0",  VRAM [$9800], BANK [0]
VBGMap0::
SECTION "BG1",  VRAM [$9C00], BANK [0]
VBGMap1::



SECTION "Stack", WRAM0
wc000::
	ds $ff
Stack::
	ds 1


SECTION "Audio", WRAM0

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
wc292:: ds 1
wc293:: ds 1
wc294:: ds 1
wc295:: ds 1
wc296:: ds 1
wc297:: ds 1

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
wc2a2:: ; noise delay? ; c2a2
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
wc2b8:: ds 1
wc2b9:: ds 1
wc2ba:: ds 1
wc2bb:: ds 1
wc2bc:: ds 1
CryTracks:: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	ds 1
wc2be:: ds 1
CurSFX:: ; c2bf
; id of sfx currently playing
	ds 1
wc2c0::
wMapMusic:: ; c2c0
	ds 1

wc2c1:: ds 1


SECTION "WRAM", WRAM0

wLZAddress:: dw ; c2c2
wLZBank::    db ; c2c4

	ds 1

wc2c6:: ds 1
InputType:: ; c2c7
	ds 1
AutoInputAddress:: ; c2c8
	ds 2
AutoInputBank:: ; c2ca
	ds 1
AutoInputLength:: ; c2cb
	ds 1

wc2cc:: ds 1
wc2cd:: ds 1
wc2ce:: ds 1
wc2cf:: ds 1
wc2d0:: ds 4
wc2d4:: ds 1
wc2d5:: ds 1
wc2d6:: ds 1
wc2d7:: ds 1
wc2d8:: ds 1
wc2d9:: ds 1
wc2da:: ds 2
InLinkBattle:: ; c2dc
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	ds 1

ScriptVar:: ; c2dd
	ds 1

wc2de:: ds 1
wc2df:: ds 3
wc2e2:: ds 1
wc2e3:: ds 3
wc2e6:: ds 4
wc2ea:: ds 1
wc2eb:: ds 1
wc2ec:: ds 4
wc2f0:: ds 1
wc2f1:: ds 1
wc2f2:: ds 1
wc2f3:: ds 1
wc2f4:: ds 1
wc2f5:: ds 1
wc2f6:: ds 1
wc2f7:: ds 1
wc2f8:: ds 2

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
wc314:: ds 1
wc315:: ds 1
wc316:: ds 1
wc317:: ds 1
wc318:: ds 1
wc319:: ds 1
wc31a:: ds 1
wc31b:: ds 1
wc31c:: ds 1
wc31d:: ds 1
wc31e:: ds 1
wc31f:: ds 1
wc320:: ds 4
wc324:: ds 34
wc346:: ds 94
wc3a4:: ds 8
wc3ac:: ds 8
wc3b4:: ds 1
wc3b5:: ds 1

CurIcon:: ; c3b6
	ds 1


wc3b7:: ds 1
wc3b8:: ds 1
wc3b9:: ds 1
wc3ba:: ds 1
wc3bb:: ds 1
wc3bc:: ds 1
wc3bd:: ds 1
wc3be:: ds 1
wc3bf:: ds 1
wc3c0:: ds 12
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

wBattle::

wc608::
wEnemyMoveStruct::  ds MOVE_LENGTH ; c608
wc60f::
wPlayerMoveStruct:: ds MOVE_LENGTH ; c60f
wc616::
EnemyMonNick::  ds PKMN_NAME_LENGTH ; c616
BattleMonNick:: ds PKMN_NAME_LENGTH ; c621

BattleMon:: battle_struct BattleMon ; c62c

wc64c::
	ds 1

wc64d:: ds 1
wc64e:: ds 2
wc650:: ds 1
wc651:: ds 1
wc652:: ds 4
wc656::
OTName:: ds NAME_LENGTH ; c656

	ds 2

wc663::
CurOTMon:: ; c663
	ds 1

wc664:: ds 1
TypeModifier:: ; c665
; >10: super-effective
;  10: normal
; <10: not very effective
; bit 7: stab
	ds 1

CriticalHit:: ; c666
; nonzero for a critical hit
	ds 1

AttackMissed:: ; c667
; nonzero for a miss
	ds 1

wc668::
PlayerSubStatus1:: ; c668
; bit
; 7 attract
; 6 encore
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
; 0 bide: unleashed energy
	ds 1
PlayerSubStatus5:: ; c66c
; bit
; 7 cant run
; 6 destiny bond
; 5 lock-on
; 4
; 3
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
wc67e::
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

wc686:: ds 2
wc688:: ds 1
wc689:: ds 1
wc68a::
BattleScriptBuffer:: ; c68a
	ds 40

BattleScriptBufferLoc:: ; c6b2
	ds 2

wc6b4:: ds 2

PlayerStats:: ; c6b6
	ds 10
	ds 1
EnemyStats:: ; c6c1
	ds 10
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
wc6d1::
PlayerAccLevel:: ; c6d1
	ds 1
wc6d2::
PlayerEvaLevel:: ; c6d2
	ds 1
; c6d3
wc6d3:: ds 1
wc6d4::
PlayerStatLevelsEnd::

EnemyStatLevels:: ; c6d4
; 07 neutral
EnemyAtkLevel:: ; c6d4
	ds 1
wc6d5::
EnemyDefLevel:: ; c6d5
	ds 1
wc6d6::
EnemySpdLevel:: ; c6d6
	ds 1
wc6d7::
EnemySAtkLevel:: ; c6d7
	ds 1
wc6d8::
EnemySDefLevel:: ; c6d8
	ds 1
wc6d9::
EnemyAccLevel:: ; c6d9
	ds 1
wc6da::
EnemyEvaLevel:: ; c6da
	ds 1

wc6db:: ds 1
wc6dc::
EnemyTurnsTaken:: ; c6dc
	ds 1
PlayerTurnsTaken:: ; c6dd
	ds 1

	ds 1

PlayerSubstituteHP:: ; c6df
	ds 1
wc6e0::
EnemySubstituteHP:: ; c6e0
	ds 1

wc6e1:: ds 2
CurPlayerMove:: ; c6e3
	ds 1
CurEnemyMove:: ; c6e4
	ds 1

LinkBattleRNCount:: ; c6e5
; how far through the prng stream
	ds 1

wc6e6:: ds 1
wc6e7:: ds 1
wc6e8:: ds 1
wc6e9::
CurEnemyMoveNum:: ; c6e9
	ds 1

wc6ea:: ds 1
wc6eb:: ds 1
wPayDayMoney:: ds 3 ; c6ec

	ds 1

wc6f0:: ds 2
wc6f2:: ds 2
AlreadyDisobeyed:: ; c6f4
	ds 1

DisabledMove:: ; c6f5
	ds 1
EnemyDisabledMove:: ; c6f6
	ds 1
wc6f7:: ds 1

; exists so you can't counter on switch
LastEnemyCounterMove:: ; c6f8
	ds 1
wc6f9::
LastPlayerCounterMove:: ; c6f9
	ds 1

wc6fa:: ds 1

AlreadyFailed:: ; c6fb
	ds 1

wc6fc:: ds 1
wc6fd:: ds 1
wc6fe:: ds 1
wc6ff::
PlayerScreens:: ; c6ff
; bit
; 4 reflect
; 3 light screen
; 2 safeguard
; 0 spikes
	ds 1

wc700::
EnemyScreens:: ; c700
; see PlayerScreens
	ds 1

wc701::
PlayerSafeguardCount:: ; c701
	ds 1
wc702::
PlayerLightScreenCount:: ; c702
	ds 1
wc703::
PlayerReflectCount:: ; c703
	ds 1

wc704:: ds 1
wc705::
EnemySafeguardCount:: ; c705
	ds 1
wc706::
EnemyLightScreenCount:: ; c706
	ds 1
EnemyReflectCount:: ; c707
	ds 1

wc708:: ds 1
wc709:: ds 1
wc70a::
Weather:: ; c70a
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	ds 1

wc70b::
WeatherCount:: ; c70b
; # turns remaining
	ds 1

wc70c::
LoweredStat:: ; c70c
	ds 1
wc70d::
EffectFailed:: ; c70d
	ds 1
wc70e::
FailedMessage:: ; c70e
	ds 1

wc70f:: ds 1
wc710::
wPlayerIsSwitching:: ds 1 ; c710
wc711::
wEnemyIsSwitching::  ds 1 ; c711

wc712::
PlayerUsedMoves:: ; c712
; add a move that has been used once by the player
; added in order of use
	ds NUM_MOVES

wc716:: ds 1
wc717:: ds 1
wc718:: ds 1
wc719:: ds 1
wc71a:: ds 1
LastPlayerMove:: ; c71b
	ds 1
LastEnemyMove:: ; c71c
	ds 1

wc71d:: ds 1
wc71e:: ds 1
wc71f:: ds 1
wc720:: ds 4
wc724:: ds 3
wc727:: ds 2
wc729:: ds 2
wc72b:: ds 1
wc72c:: ds 1
wc72d:: ds 1
wc72e:: ds 1
wc72f:: ds 1
wc730:: ds 1
wc731:: ds 1
wc732:: ds 1
wc733:: ds 1
wc734::
BattleEnded:: ; c734
	ds 1

wc735:: ds 1
wc736:: ds 3
wc739:: ds 4
wc73d:: ds 1
wc73e:: ds 1
wc73f:: ds 1
wc740:: ds 1
wc741::
wBattleEnd::
; c741

	ds 11
wc74c:: ds 1
wc74d:: ds 1
wc74e:: ds 107
wc7b9:: ds 1
wc7ba:: ds 1
wc7bb:: ds 15
wc7ca:: ds 6
wc7d0:: ds 1
wc7d1:: ds 1
wc7d2:: ds 1
wc7d3:: ds 1
wc7d4:: ds 1
wc7d5:: ds 1
wc7d6:: ds 1
wc7d7:: ds 1
wc7d8:: ds 1
wc7d9:: ds 1
wc7da:: ds 1
wc7db:: ds 1
wc7dc:: ds 1
wc7dd:: ds 1
wc7de:: ds 1
wc7df:: ds 1
wc7e0:: ds 1
wc7e1:: ds 1
wc7e2:: ds 1
wc7e3:: ds 1
wc7e4:: ds 1
IF DEF(CRYSTAL11)
wPokedexStatus::
ENDC
	ds 3
wc7e8:: ds 24


SECTION "Overworld Map", WRAM0 [$c800]

wc800::
OverworldMap:: ; c800
; too lazy to reconcile these labels
;	ds 1300

	ds 1
wc801:: ds 1
wc802:: ds 1
wc803:: ds 4
wc807:: ds 9
wc810:: ds 3
wc813:: ds 5
wc818:: ds 8
wc820:: ds 1
wc821:: ds 15
wc830:: ds 16
wc840:: ds 16
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
wc900:: ds 1
wc901:: ds 1
wc902:: ds 1
wc903:: ds 12
wc90f:: ds 1
wc910:: ds 1
wc911:: ds 1
wc912:: ds 14
wc920:: ds 16
wc930:: ds 16
wc940:: ds 16
wc950:: ds 16
wc960:: ds 2
wc962:: ds 14
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
wca80:: ds 1
wca81:: ds 1
wca82:: ds 1
wca83:: ds 1
wca84:: ds 1
wca85:: ds 1
wca86:: ds 1
wca87:: ds 1
wca88:: ds 1
wca89:: ds 1
wca8a:: ds 1
wca8b:: ds 1
wca8c:: ds 1
wca8d:: ds 1
wca8e:: ds 1
wca8f:: ds 1
wca90:: ds 16
wcaa0:: ds 3
wcaa3:: ds 2
wcaa5:: ds 11
wcab0:: ds 5
wcab5:: ds 10
wcabf:: ds 1
wcac0:: ds 9
wcac9:: ds 7
wcad0:: ds 16
wcae0:: ds 16
wcaf0:: ds 16
wcb00:: ds 8
wcb08:: ds 6
wcb0e:: ds 5
wcb13:: ds 9
wcb1c:: ds 14
wcb2a:: ds 1
wcb2b:: ds 1
wcb2c:: ds 1
wcb2d:: ds 1
wcb2e:: ds 1
wcb2f:: ds 1
wcb30:: ds 1
wcb31:: ds 1
wcb32:: ds 19
wcb45:: ds 20
wcb59:: ds 20
wcb6d:: ds 1
wcb6e:: ds 22
wcb84:: ds 100
wcbe8:: ds 1
wcbe9:: ds 1
wcbea:: ds 14
wcbf8:: ds 2
wcbfa:: ds 1
wcbfb:: ds 79
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
wccba:: ds 90
OverworldMapEnd::

	ds 12

SECTION "Video", WRAM0
CreditsPos::
BGMapBuffer:: ; cd20
	ds 1
wcd21:: ds 1
wcd22::
CreditsTimer:: ; cd22
	ds 1

wcd23:: ds 1
wcd24:: ds 1
wcd25:: ds 1
wcd26:: ds 1
wcd27:: ds 1
wcd28:: ds 1
wcd29:: ds 1
wcd2a:: ds 1
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
wcd36:: ds 2
wcd38:: ds 1
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
wcd44:: ds 1
wcd45:: ds 1
wcd46:: ds 1
wcd47:: ds 1

BGMapPalBuffer:: ; cd48
	ds 1 ; 40

wcd49:: ds 1
wcd4a:: ds 1
wcd4b:: ds 1
wcd4c:: ds 1
wcd4d:: ds 1
wcd4e:: ds 1
wcd4f:: ds 1
wcd50:: ds 1
wcd51:: ds 1
wcd52:: ds 1
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
wcd75:: ds 2
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

SGBPredef:: ; cd98
	ds 1
PlayerHPPal:: ; cd99
	ds 1
EnemyHPPal:: ; cd9a
	ds 1

wcd9b:: ds 6
wcda1:: ds 8
wcda9:: ds 48

AttrMap:: ; cdd9
; 20x18 grid of palettes for 8x8 tiles
; read horizontally from the top row
; bit 3: vram bank
; bit 0-2: palette id
	ds SCREEN_WIDTH * SCREEN_HEIGHT
AttrMapEnd::

wcf41:: ds 1
wcf42:: ds 2
wcf44:: ds 1
wcf45:: ds 12
wcf51:: ds 1
wcf52:: ds 4
wcf56:: ds 1
wcf57:: ds 4
wcf5b:: ds 1
wcf5c:: ds 1
wcf5d:: ds 2

MonType:: ; cf5f
	ds 1

CurSpecies:: ; cf60
	ds 1

wcf61:: ds 2
wcf63:: ds 1
wcf64:: ds 1
IF !DEF(CRYSTAL11)
wPokedexStatus::
ENDC
wcf65:: ds 1
wcf66:: ds 1

Requested2bpp:: ; cf67
	ds 1
Requested2bppSource:: ; cf68
	ds 2
Requested2bppDest:: ; cf6a
	ds 2

Requested1bpp:: ; cf6c
	ds 1
Requested1bppSource:: ; cf6d
	ds 2
Requested1bppDest:: ; cf6f
	ds 2

wcf71:: ds 1
wcf72:: ds 1
wcf73:: ds 1
MenuSelection:: ; cf74
	ds 1

wcf75:: ds 1
wcf76:: ds 1
wcf77:: ds 1
wcf78:: ds 9
wcf81:: ds 1
wcf82:: ds 1
wcf83:: ds 1
wcf84:: ds 1
wcf85:: ds 1
wcf86:: ds 1
wcf87:: ds 1
wcf88:: ds 2
wcf8a:: ds 7
wcf91:: ds 1
wcf92:: ds 1
wcf93:: ds 1
wcf94:: ds 1
wcf95:: ds 1
wcf96:: ds 1
wcf97:: ds 1
wcf98:: ds 3
wcf9b:: ds 3
wcf9e:: ds 3
wcfa1:: ds 1
wcfa2:: ds 1
wcfa3:: ds 1
wcfa4:: ds 1
wcfa5:: ds 1
wcfa6:: ds 1
wcfa7:: ds 1
wcfa8:: ds 1
wcfa9:: ds 1
wcfaa:: ds 1
wcfab:: ds 1
wcfac:: ds 1
wcfad:: ds 4

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

	ds 2

wcfbb:: ds 1
GameTimerPause:: ; cfbc
; bit 0
	ds 1

	ds 1

wcfbe:: ds 2
wcfc0:: ds 2

FXAnimID::
FXAnimIDLo:: ; cfc2
	ds 1
FXAnimIDHi:: ; cfc3
	ds 1

wcfc4:: ds 1
wcfc5:: ds 1

TileAnimationTimer:: ; cfc6
	ds 1

wcfc7:: ds 1
wcfc8:: ds 1
wcfc9:: ds 1
wcfca:: ds 2

Options:: ; cfcc
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	ds 1

wcfcd:: ds 1

TextBoxFrame:: ; cfce
; bits 0-2: textbox frame 0-7
	ds 1

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
wcfd4:: ds 1
wcfd5:: ds 1
wcfd6:: ds 1
wcfd7:: ds 1

	ds 40


SECTION "WRAM 1", WRAMX, BANK [1]

wd000:: ds 1
wd001:: ds 1
wd002::
PhoneScriptBank::
DefaultFlypoint:: ; d002
	ds 1
wd003::
PhoneCallerLo::
	ds 1
wd004::
PhoneCallerHi::
	ds 1
wd005::
StartFlypoint:: ; d005
	ds 1
wd006::
EndFlypoint:: ; d006
	ds 1

wd007::
MovementBuffer:: ; d007
	ds 1

wd008:: ds 2
wd00a:: ds 1
wd00b:: ds 1
wd00c:: ds 1
wd00d:: ds 1
wd00e:: ds 1
wd00f:: ds 1
wd010:: ds 1
wd011:: ds 1
wd012:: ds 1
wd013:: ds 1
wd014:: ds 2
wd016:: ds 1
wd017:: ds 1
wd018:: ds 1
wd019:: ds 1
wd01a:: ds 5
wd01f:: ds 1
wd020:: ds 3
wd023:: ds 5
wd028:: ds 2
wd02a:: ds 3
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
EngineBuffer1:: ; d03e
	ds 1
wd03f::
CurFruit:: ; d03f
MartPointerBank::
	ds 1

wd040::
MartPointer:: ; d040
	ds 1

wd041:: ds 1
MovementAnimation:: ; d042
	ds 1

WalkingDirection:: ; d043
	ds 1

FacingDirection:: ; d044
	ds 1

WalkingX:: ; d045
	ds 1
WalkingY:: ; d046
	ds 1
WalkingTile:: ; d047
wWinTextPointer::
	ds 1

wd048:: ds 1
wLossTextPointer:: ds 2
wd04b:: ds 2
wd04d:: ds 1
wd04e:: ds 2
wd050:: ds 10
wd05a:: ds 12
wd066:: ds 10
wd070:: ds 3

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

wd0d6:: ds 1
wd0d7:: ds 1
wd0d8:: ds 1
wd0d9:: ds 1
wd0da:: ds 1
wd0db:: ds 1
wd0dc:: ds 1
wd0dd:: ds 2
wd0df:: ds 1
wd0e0:: ds 1
wd0e1:: ds 1
wd0e2:: ds 1
wd0e3:: ds 1
wd0e4:: ds 4
wd0e8:: ds 1
wd0e9:: ds 2
wd0eb:: ds 1
wd0ec:: ds 1

VramState:: ; d0ed
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	ds 1

wd0ee:: ds 1
wd0ef:: ds 1
wd0f0::
CurMart:: ; d0f0
	; ds 16
	ds 1
wd0f1:: ds 1
wd0f2:: ds 14

wd100:: ds 1

wd101:: ds 1
wd102:: ds 1
wd103:: ds 1
wd104:: ds 1
wd105:: ds 1

CurItem:: ; d106
	ds 1

wd107:: ds 1

CurPartySpecies:: ; d108
	ds 1

CurPartyMon:: ; d109
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1

wd10a:: ds 1
wd10b:: ds 1
wd10c:: ds 1
wd10d:: ds 1

wd10e::
TempMon::
	party_struct TempMon

wd13e:: ds 1

wd13f:: ds 2

PartyMenuActionText:: ; d141
	ds 1

wd142:: ds 1

CurPartyLevel:: ; d143
	ds 1

wd144:: ds 2
wd146:: ds 1
wd147:: ds 1
wd148:: ds 1
wd149:: ds 1
wd14a:: ds 1
wd14b:: ds 1
wd14c:: ds 1
wd14d:: ds 1
wd14e:: ds 1
wd14f:: ds 1
wd150:: ds 1
wd151:: ds 1
wd152:: ds 1
wd153:: ds 1

UsedSprites:: ; d154
	ds 31 ; 64

wd173:: ds 1
	ds 13
wd181:: ds 1
wd182:: ds 1
	ds 14

wd191:: ds 1
wd192:: ds 1
wd193:: ds 1
wd194:: ds 1
wd195:: ds 1
wd196:: ds 1
wd197:: ds 2
wd199:: ds 1
wPermission:: ds 3

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

wd1e9:: ds 1
wd1ea::
MagikarpLength::
Buffer1:: ; d1ea
	ds 1
MovementType::
Buffer2:: ; d1eb
	ds 1

wd1ec:: ds 1
wd1ed:: ds 1
wd1ee:: ds 1
wd1ef:: ds 1
wd1f0:: ds 1
wd1f1:: ds 1
wd1f2:: ds 1
wd1f3:: ds 1
wd1f4:: ds 1
wd1f5:: ds 1
wd1f6:: ds 4

LinkBattleRNs:: ; d1fa
	ds 10

TempEnemyMonSpecies::  ds 1 ; d204
TempBattleMonSpecies:: ds 1 ; d205

EnemyMon:: battle_struct EnemyMon ; d206
EnemyMonBaseStats:: ds 5 ; d226
EnemyMonCatchRate:: db ; d22b
EnemyMonBaseExp::   db ; d22c
EnemyMonEnd::


IsInBattle:: ; d22d
; 0: overworld
; 1: wild battle
; 2: trainer battle
	ds 1

wd22e:: ds 1
OtherTrainerClass:: ; d22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	ds 1

BattleType:: ; d230
; $00 normal
; $01
; $02
; $03 dude
; $04 fishing
; $05 roaming
; $06
; $07 shiny
; $08 headbutt/rock smash
; $09
; $0a force Item1
; $0b
; $0c suicune
	ds 1

OtherTrainerID:: ; d231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	ds 1

wd232:: ds 1

TrainerClass:: ; d233
	ds 1

UnownLetter:: ; d234
	ds 1

wd235:: ds 1

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
wd25a:: ds 3
wd25d:: ds 1
wd25e:: ds 4
wd262:: ds 1
wd263:: ds 1
wd264:: ds 1
wd265:: ds 1
wd266:: ds 1
wd267:: ds 1
wd268:: ds 1

TimeOfDay:: ; d269
	ds 1

	ds 1
wd26b:: ds 1
wd26c:: ds 1
wd26d:: ds 4
wd271:: ds 5
wd276:: ds 10


SECTION "Enemy Party", WRAMX, BANK [1]

OTPartyCount::   ds 1 ; d280
OTPartySpecies:: ds PARTY_LENGTH ; d281
OTPartyEnd::     ds 1

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

	ds 4

wd430::
wBattleAction:: ds 1 ; d430

wd431:: ds 1
MapStatus:: ; d432
	ds 1
MapEventStatus:: ; d433
	ds 1

ScriptFlags:: ; d434
	ds 1
ScriptFlags2:: ; d435
	ds 1
ScriptFlags3:: ; d436
	ds 1

ScriptMode:: ; d437
	ds 1
ScriptRunning:: ; d438
	ds 1
ScriptBank:: ; d439
	ds 1
ScriptPos:: ; d43a
	ds 2

wd43c:: ds 1
wd43d:: ds 16

ScriptDelay:: ; d44d
	ds 1

wd44e:: ds 1
wd44f:: ds 1
wd450:: ds 1
wd451:: ds 1
wd452:: ds 1
wd453:: ds 1
wd454:: ds 1
	ds 4

wd459:: ds 2
wd45b:: ds 1
wd45c:: ds 8
wd464:: ds 1
wd465:: ds 1
wd466:: ds 6
wd46c:: ds 1
wd46d:: ds 5

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
wd479:: ds 2

PlayerID:: ; d47b
	ds 2

PlayerName:: ds NAME_LENGTH ; d47d
MomsName::   ds NAME_LENGTH ; d488
RivalName::  ds NAME_LENGTH ; d493
RedsName::   ds NAME_LENGTH ; d49e
GreensName:: ds NAME_LENGTH ; d4a9

wd4b4:: ds 1
wd4b5:: ds 1

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
wd4cd:: ds 1
wd4ce:: ds 1
wd4cf:: ds 1
wd4d0:: ds 1
wd4d1:: ds 5

ObjectStructs::

PlayerStruct:: ; d4d6
	ds 2
PlayerSprite:: ; d4d8
	ds 1
	ds 3
PlayerPalette:: ; d4dc
	ds 1
	ds 1
PlayerDirection:: ; d4de
; uses bits 2 and 3 / $0c / %00001100
; %00 down
; %01 up
; %10 left
; $11 right
	ds 1
	ds 2
PlayerAction:: ; d4e1
; 1 standing
; 2 walking
; 4 spinning
; 6 fishing
	ds 1
wd4e2:: ds 1
PlayerFacing:: ; d4e3
	ds 1
StandingTile:: ; d4e4
	ds 1
StandingTile2:: ; d4e5
	ds 1
; relative to the map struct including borders
MapX:: ; d4e6
	ds 1
MapY:: ; d4e7
	ds 1
MapX2:: ; d4e8
	ds 1
MapY2:: ; d4e9
	ds 1
	ds 3
; relative to the bg map, in px
PlayerSpriteX:: ; d4ed
	ds 1
PlayerSpriteY:: ; d4ee
	ds 1
	ds 15

ObjectStruct1:: ; d4fe
	ds OBJECT_STRUCT_LENGTH
ObjectStruct2:: ; d526
	ds OBJECT_STRUCT_LENGTH
ObjectStruct3:: ; d54e
	ds OBJECT_STRUCT_LENGTH
ObjectStruct4:: ; d576
	ds OBJECT_STRUCT_LENGTH
ObjectStruct5:: ; d59e
	ds OBJECT_STRUCT_LENGTH
ObjectStruct6:: ; d5c6
	ds OBJECT_STRUCT_LENGTH
ObjectStruct7:: ; d5ee
	ds OBJECT_STRUCT_LENGTH
ObjectStruct8:: ; d616
	ds OBJECT_STRUCT_LENGTH
ObjectStruct9:: ; d63e
	ds OBJECT_STRUCT_LENGTH
ObjectStruct10:: ; d666
	ds OBJECT_STRUCT_LENGTH
ObjectStruct11:: ; d68e
	ds OBJECT_STRUCT_LENGTH
ObjectStruct12:: ; d6b6
	ds OBJECT_STRUCT_LENGTH
; d6de

wd6de::
	ds 64

MapObjects:: ; d71e
	ds OBJECT_LENGTH * NUM_OBJECTS

wd81e:: ds NUM_OBJECTS

VariableSprites:: ; d82e
	ds $10

wd83e:: ds 3

TimeOfDayPal:: ; d841
	ds 1
	ds 4
; d846
wd846:: ds 1
wd847:: ds 1
CurTimeOfDay:: ; d848
	ds 1

	ds 1

wd84a:: ds 1
wd84b:: ds 1
StatusFlags:: ; d84c
	ds 1
StatusFlags2:: ; d84d
	ds 1

Money:: ; d84e
	ds 3

wd851::
wMomsMoney:: ; d851
	ds 3
wd854::
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
wd958:: ds 1
wd959:: ds 2
WhichRegisteredItem:: ; d95b
	ds 1
RegisteredItem:: ; d95c
	ds 1

PlayerState:: ; d95d
	ds 1

wd95e:: ds 2
wd960:: ds 2
MooMooBerries:: ; d962
	ds 1 ; how many berries fed to MooMoo
UndergroundSwitchPositions:: ; d963
	ds 1 ; which positions the switches are in
FarfetchdPosition:: ; d964
	ds 1 ; which position the ilex farfetch'd is in

	ds 13


SECTION "Map Triggers", WRAMX, BANK [1]

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


SECTION "Events", WRAMX, BANK [1]

wJackFightCount::    ds 1
                     ds 1
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

wda00:: ds 1

wArnieFightCount::   ds 1
wAlanFightCount::    ds 1
wDanaFightCount::    ds 1
wChadFightCount::    ds 1
                     ds 1
wTullyFightCount::   ds 1
wBrentFightCount::   ds 1
wTiffanyFightCount:: ds 1
wVanceFightCount::   ds 1
wWiltonFightCount::  ds 1
                     ds 1
wParryFightCount::   ds 1
wErinFightCount::    ds 1

	ds 100

EventFlags:: ; da72
;RoomDecorations:: ; dac6
;TeamRocketAzaleaTownAttackEvent:: ; db51
;PoliceAtElmsLabEvent:: ; db52
;SalesmanMahoganyTownEvent:: ; db5c
;RedGyaradosEvent:: ; db5c
	flag_array NUM_EVENTS
; db6c

	ds 6

wCurBox:: ; db72
	ds 1

	ds 2

; 8 chars + $50
wBoxNames:: ds 9 * NUM_BOXES ; db75

wdbf3:: ds 1
	ds 1

BikeFlags:: ; dbf5
; bit 1: always on bike
; bit 2: downhill
	ds 1

	ds 1
wCurrentMapTriggerPointer:: ; dbf7
	ds 2

wdbf9:: ds 2
wdbfb:: ds 1
wdbfc:: ds 1
wdbfd:: ds 1
wCurrentMapXYTriggerCount:: ds 1
wdbff:: ds 1
wdc00:: ds 1
wCurrentMapSignpostCount:: ds 1
wdc02:: ds 1
wdc03:: ds 1
wdc04:: ds 1
wdc05:: ds 1
wdc06:: ds 1
wdc07:: ds 2
wdc09:: ds 1
wdc0a:: ds 1
wdc0b:: ds 2
wdc0d:: ds 1
wdc0e:: ds 1

; Sprite id of each decoration
wdc0f::
Bed:: ; dc0f
	ds 1
Carpet:: ; dc10
	ds 1
wdc11::
Plant:: ; dc11
	ds 1
wdc12::
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

wdc17:: ds 1
wdc18:: ds 1
wdc19:: ds 1
wdc1a:: ds 1
wdc1b:: ds 1
wdc1c:: ds 2
DailyFlags:: ds 1
WeeklyFlags:: ds 1
SwarmFlags:: ds 1
wdc21:: ds 1
wdc22:: ds 1
wdc23:: ds 1
wdc24:: ds 2
wdc26:: ds 1

FruitTreeFlags:: ; dc27
	ds 1

	ds 5

wdc2d:: ds 4
wSpecialPhoneCallID:: ds 2
wdc33:: ds 2
wdc35:: ds 4
wdc39:: ds 1
wdc3a:: ds 1
wdc3b:: ds 5
wdc40:: ds 1
wdc41:: ds 1
wdc42:: ds 8
wdc4a:: ds 1
wdc4b:: ds 1
wdc4c:: ds 4
wdc50:: ds 4
wdc54:: ds 4
wdc58:: ds 2
wdc5a:: ds 1
wdc5b:: ds 1
wdc5c:: ds 3
wdc5f:: ds 1
wdc60:: ds 19

StepCount:: ; dc73
	ds 1
PoisonStepCount:: ; dc74
	ds 1

	ds 2
wdc77:: ds 2
wdc79:: ds 1
wdc7a:: ds 2
wdc7c:: ds 33
wdc9d:: ds 2
wdc9f:: ds 1
wdca0:: ds 1
wdca1:: ds 3
wdca4:: ds 1

VisitedSpawns:: ; dca5
	flag_array 27

wdca9:: ds 1
wdcaa:: ds 1
wdcab:: ds 1
wdcac:: ds 1

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupMapGroup:: ; dcad
	ds 1
BackupMapNumber:: ; dcae
	ds 1

	ds 3

wdcb2:: ds 1
wdcb3:: ds 1

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

	ds 6
wdcbf:: ds 1
	ds 23


SECTION "Party", WRAMX, BANK [1]

PartyCount:: ; dcd7
	ds 1 ; number of Pokémon in party
PartySpecies:: ; dcd8
	ds PARTY_LENGTH ; species of each Pokémon in party
PartyEnd:: ; dcde
	ds 1 ; legacy functions don't check PartyCount
		
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


SECTION "Pokedex", WRAMX, BANK [1]

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

wdef4:: ds 1


SECTION "Daycare", WRAMX, BANK [1]

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
wDittoInDaycare:: ; df2e
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

wdf9b:: ds 1


SECTION "Misc Pokemon", WRAMX, BANK [1]

wdf9c::
wContestMon:: party_struct wContestMon ; df9c

wdfcc:: ds 1
wdfcd:: ds 1
wdfce:: ds 1

roam_struct: MACRO
\1Species::   db
\1Level::     db
\1MapGroup::  db
\1MapNumber:: db
\1HP::        ds 1
\1DVs::       ds 2
ENDM

wRoamMon1:: roam_struct wRoamMon1 ; dfcf
wRoamMon2:: roam_struct wRoamMon2 ; dfd6
wRoamMon3:: roam_struct wRoamMon3 ; dfdd

wdfe4:: ds 1
wdfe5:: ds 1
wdfe6:: ds 1
wdfe7:: ds 1
wdfe8:: ds 1
wdfe9:: ds 1
	ds 1
	ds 1
wdfec:: ds 1
	ds 3

	ds 5
wdff5::


SECTION "Pic Animations", WRAMX, BANK [2]

w2_d000:: ds $168

w2_d168:: ds 1
w2_d169:: ds 1
w2_d16a:: ds 1
w2_d16b:: ds 1
w2_d16c:: ds 1
w2_d16d:: ds 1
w2_d16e:: ds 1
w2_d16f:: ds 1
w2_d170:: ds 1
w2_d171:: ds 1
w2_d172:: ds 1
w2_d173:: ds 1
w2_d174:: ds 1
w2_d175:: ds 1
w2_d176:: ds 1
w2_d177:: ds 1
w2_d178:: ds 1
w2_d179:: ds 1
w2_d17a:: ds 1
w2_d17b:: ds 1
w2_d17c:: ds 1
w2_d17d:: ds 1
w2_d17e:: ds 1
w2_d17f:: ds 1
w2_d180:: ds 1
w2_d181:: ds 1
w2_d182:: ds 1
w2_d183:: ds 1
w2_d184:: ds 1
w2_d185:: ds 1
w2_d186:: ds 1
w2_d187:: ds 1
w2_d188:: ds 1


SECTION "WRAM 3", WRAMX, BANK [3]

	ds $800

w3_d800:: ds 1


SECTION "GBC Video", WRAMX, BANK [5]

; 8 4-color palettes
Unkn1Pals:: ds 8 * 8 ; d000
Unkn2Pals:: ds 8 * 8 ; d040
BGPals::    ds 8 * 8 ; d080
OBPals::    ds 8 * 8 ; d0c0

LYOverrides:: ; d100
	ds SCREEN_HEIGHT_PX
LYOverridesEnd::

	ds $100 - SCREEN_HEIGHT_PX

LYOverridesBackup:: ; d200
	ds SCREEN_HEIGHT_PX
LYOverridesBackupEnd::

	ds $100 - SCREEN_HEIGHT_PX


SECTION "Battle Animations", WRAMX, BANK [5]

w5_d300:: ds 10

ActiveAnimObjects:: ; d30a
	ds 4 * 40

	ds 80

ActiveBGEffects:: ; d3fa
	ds 4 * 5

w5_d40e:: ds 1

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
w5_d418:: ds 1
BattleAnimTemps:: ; d419
	ds 8
	ds 1
w5_d422:: ds $40


SECTION "WRAM 6", WRAMX, BANK [6]

w6_d000:: ds $600
w6_d600:: ds $600


SECTION "Scratch", SRAM, BANK [0]


SECTION "SRAM Bank 1", SRAM, BANK [1]

SECTION "BoxMons", SRAM [$ad10], BANK [1]

sBoxCount::   ds 1 ; ad10
sBoxSpecies:: ds MONS_PER_BOX ; ad11
	ds 1

sBoxMons:: ; ad26
sBoxMon1:: box_struct sBoxMon1
sBoxMon2::
	ds box_struct_length * (MONS_PER_BOX +- 1)

sBoxMonOT:: ds NAME_LENGTH * MONS_PER_BOX ; afa6

sBoxMonNicknames:: ds PKMN_NAME_LENGTH * MONS_PER_BOX ; b082
sBoxMonNicknamesEnd::
; b15e
