SECTION "tiles0",VRAM[$8000],BANK[0]
VTiles0:
SECTION "tiles1",VRAM[$8800],BANK[0]
VTiles1:
SECTION "tiles2",VRAM[$9000],BANK[0]
VTiles2:
SECTION "bgmap0",VRAM[$9800],BANK[0]
VBGMap0:
SECTION "bgmap1",VRAM[$9C00],BANK[0]
VBGMap1:



SECTION "WRAMBank0",WRAM0[$c000]

SECTION "stack",WRAM0[$c0ff]
Stack: ; c0ff
	ds -$100


SECTION "audio",WRAM0[$c100]
MusicPlaying: ; c100
; nonzero if playing
	ds 1

Channels:
Channel1:
Channel1MusicID: ; c101
	ds 2
Channel1MusicBank: ; c103
	ds 1
Channel1Flags: ; c104
; 0: on/off
; 1: subroutine
; 2: 
; 3: 
; 4: noise sampling on/off
; 5: 
; 6: 
; 7: 
	ds 1
Channel1Flags2: ; c105
; 0: vibrato on/off
; 1: 
; 2: duty cycle on/off
; 3: 
; 4: 
; 5: 
; 6: 
; 7: 
	ds 1
Channel1Flags3: ; c106
; 0: vibrato up/down
; 1: 
; 2: 
; 3: 
; 4: 
; 5: 
; 6: 
; 7: 
	ds 1
Channel1MusicAddress: ; c107
	ds 2
Channel1LastMusicAddress: ; c109
	ds 2
; could have been meant as a third-level address
	ds 2
Channel1NoteFlags: ; c10d
; 0: 
; 1: 
; 2: 
; 3: 
; 4: 
; 5: rest
; 6: 
; 7: 
	ds 1
Channel1Condition: ; c10e
; used for conditional jumps
	ds 1
Channel1DutyCycle: ; c10f
; uses top 2 bits only
;	0: 12.5%
;	1: 25%
;	2: 50%
;	3: 75%
	ds 1
Channel1Intensity: ; c110
;	hi: pressure
;   lo: velocity
	ds 1
Channel1Frequency:
; 11 bits
Channel1FrequencyLo: ; c111
	ds 1
Channel1FrequencyHi: ; c112
	ds 1
Channel1Pitch: ; c113
; 0: rest
; 1: C
; 2: C#
; 3: D
; 4: D#
; 5: E
; 6: F
; 7: F#
; 8: G
; 9: G#
; a: A
; b: A#
; c: B
	ds 1
Channel1Octave: ; c114
; 0: highest
; 7: lowest
	ds 1
Channel1StartingOctave: ; c115
; raises existing octaves by this value
; used for repeating phrases in a higher octave to save space
	ds 1
Channel1NoteDuration: ; c116
; number of frames remaining in the current note
	ds 1
; c117
	ds 1
; c118
	ds 1
Channel1LoopCount: ; c119
	ds 1
Channel1Tempo: ; c11a
	ds 2
Channel1Tracks: ; c11c
; hi: l
; lo: r
	ds 1
; c11d
	ds 1

Channel1VibratoDelayCount: ; c11e
; initialized at the value in VibratoDelay
; decrements each frame
; at 0, vibrato starts
	ds 1
Channel1VibratoDelay: ; c11f
; number of frames a note plays until vibrato starts
	ds 1
Channel1VibratoExtent: ; c120
; difference in 
	ds 1
Channel1VibratoRate: ; c121
; counts down from a max of 15 frames
; over which the pitch is alternated
; hi: init frames
; lo: frame count
	ds 1

; c122
	ds 1
; c123
	ds 1
; c124
	ds 1
; c125
	ds 1
; c126
	ds 1
; c127
	ds 1
Channel1CryPitch: ; c128
	ds 1
Channel1CryEcho: ; c129
	ds 1
	ds 4
Channel1NoteLength: ; c12e
; # frames per 16th note
	ds 1
; c12f
	ds 1
; c130
	ds 1
; c131
	ds 1
; c132
	ds 1
; end

Channel2: ; c133
	ds 50
Channel3: ; c165
	ds 50
Channel4: ; c197
	ds 50

SFXChannels:
Channel5: ; c1c9
	ds 50
Channel6: ; c1fb
	ds 50
Channel7: ; c22d
	ds 50
Channel8: ; c25f
	ds 50

; c291
	ds 1
; c292
	ds 1
; c293
	ds 1
; c294
	ds 1
; c295
	ds 1
; c296
	ds 1
; c297
	ds 1

CurMusicByte: ; c298
	ds 1
CurChannel: ; c299
	ds 1
Volume: ; c29a
; corresponds to $ff24
; Channel control / ON-OFF / Volume (R/W)
;   bit 7 - Vin->SO2 ON/OFF
;   bit 6-4 - SO2 output level (volume) (# 0-7)
;   bit 3 - Vin->SO1 ON/OFF
;   bit 2-0 - SO1 output level (volume) (# 0-7)
	ds 1
SoundOutput: ; c29b
; corresponds to $ff25
; bit 4-7: ch1-4 so2 on/off
; bit 0-3: ch1-4 so1 on/off
	ds 1
SoundInput: ; c29c
; corresponds to $ff26
; bit 7: global on/off
; bit 0: ch1 on/off
; bit 1: ch2 on/off
; bit 2: ch3 on/off
; bit 3: ch4 on/off
	ds 1

MusicID:
MusicIDLo: ; c29d
	ds 1
MusicIDHi: ; c29e
	ds 1
MusicBank: ; c29f
	ds 1
NoiseSampleAddress:
NoiseSampleAddressLo: ; c2a0
	ds 1
NoiseSampleAddressHi: ; c2a1
	ds 1
; noise delay? ; c2a2
	ds 1
; c2a3
	ds 1
MusicNoiseSampleSet: ; c2a4
	ds 1
SFXNoiseSampleSet: ; c2a5
	ds 1
Danger: ; c2a6
; bit 7: on/off
; bit 4: pitch
; bit 0-3: counter
	ds 1
MusicFade: ; c2a7
; fades volume over x frames
; bit 7: fade in/out
; bit 0-5: number of frames for each volume level
; $00 = none (default)
	ds 1
MusicFadeCount: ; c2a8
	ds 1
MusicFadeID:
MusicFadeIDLo: ; c2a9
	ds 1
MusicFadeIDHi: ; c2aa
	ds 1
	ds 5
CryPitch: ; c2b0
	ds 1
CryEcho: ; c2b1
	ds 1
CryLength: ; c2b2
	ds 2
LastVolume: ; c2b4
	ds 1
	ds 1
SFXPriority: ; c2b6
; if nonzero, turn off music when playing sfx
	ds 1
	ds 6
CryTracks: ; c2bd
; plays only in left or right track depending on what side the monster is on
; both tracks active outside of battle
	ds 1
	ds 1
CurSFX: ; c2bf
; id of sfx currently playing
	ds 1
CurMusic: ; c2c0
; id of music currently playing
	ds 1

SECTION "auto",WRAM0[$c2c7]
InputType: ; c2c7
	ds 1
AutoInputAddress: ; c2c8
	ds 2
AutoInputBank: ; c2ca
	ds 1
AutoInputLength: ; c2cb
	ds 1

SECTION "linkbattle",WRAM0[$c2dc]
InLinkBattle: ; c2dc
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	ds 1

SECTION "scriptengine",WRAM0[$c2dd]
ScriptVar: ; c2dd
	ds 1


SECTION "tiles",WRAM0[$c2fa]
TileDown: ; c2fa
	ds 1
TileUp: ; c2fb
	ds 1
TileLeft: ; c2fc
	ds 1
TileRight: ; c2fd
	ds 1

TilePermissions: ; c2fe
; set if tile behavior prevents
; you from walking in that direction
; bit 3: down
; bit 2: up
; bit 1: left
; bit 0: right
	ds 1

SECTION "icons",WRAM0[$c3b6]

CurIcon: ; c3b6
	ds 1

SECTION "gfx",WRAM0[$c400]

Sprites: ; c400
; 4 bytes per sprite
; 40 sprites
; struct:
;	y in pixels
;	x in pixels
;	tile id
;	attributes:
;		bit 7: priority
;		bit 6: y flip
;		bit 5: x flip
;		bit 4: pal # (non-cgb)
;		bit 3: vram bank (cgb only)
;		bit 2-0: pal # (cgb only)
	ds 160
SpritesEnd:

TileMap: ; c4a0
; 20x18 grid of 8x8 tiles
	ds 360


SECTION "BattleMons",WRAM0[$c608]

EnemyMoveStruct:
EnemyMoveAnimation: ; c608
	ds 1
EnemyMoveEffect: ; c609
	ds 1
EnemyMovePower: ; c60a
	ds 1
EnemyMoveType: ; c60b
	ds 1
EnemyMoveAccuracy: ; c60c
	ds 1
EnemyMovePP: ; c60d
	ds 1
EnemyMoveEffectChance: ; c60e
	ds 1

PlayerMoveStruct:
PlayerMoveAnimation: ; c60f
	ds 1
PlayerMoveEffect: ; c610
	ds 1
PlayerMovePower: ; c611
	ds 1
PlayerMoveType: ; c612
	ds 1
PlayerMoveAccuracy: ; c613
	ds 1
PlayerMovePP: ; c614
	ds 1
PlayerMoveEffectChance: ; c615
	ds 1

EnemyMonNick: ; c616
	ds 11
BattleMonNick: ; c621
	ds 11


BattleMonSpecies: ; c62c
	ds 1
BattleMonItem: ; c62d
	ds 1

BattleMonMoves:
BattleMonMove1: ; c62e
	ds 1
BattleMonMove2: ; c62f
	ds 1
BattleMonMove3: ; c630
	ds 1
BattleMonMove4: ; c631
	ds 1

BattleMonDVs:
BattleMonAtkDefDV: ; c632
	ds 1
BattleMonSpdSpclDV: ; c633
	ds 1

BattleMonPP:
BattleMonPPMove1: ; c634
	ds 1
BattleMonPPMove2: ; c635
	ds 1
BattleMonPPMove3: ; c636
	ds 1
BattleMonPPMove4: ; c637
	ds 1

BattleMonHappiness: ; c638
	ds 1
BattleMonLevel: ; c639
	ds 1

BattleMonStatus: ; c63a
	ds 2

BattleMonHP: ; c63c
	ds 2
BattleMonMaxHP: ; c63e
	ds 2

BattleMonAtk: ; c640
	ds 2
BattleMonDef: ; c642
	ds 2
BattleMonSpd: ; c644
	ds 2
BattleMonSpclAtk: ; c646
	ds 2
BattleMonSpclDef: ; c648
	ds 2

BattleMonType1: ; c64a
	ds 1
BattleMonType2: ; c64b
	ds 1

	ds 10

OTName: ; c656
	ds 13

CurOTMon: ; c663
	ds 1
	
	ds 1

TypeModifier: ; c665
; >10: super-effective
;  10: normal
; <10: not very effective

; bit 7: stab
	ds 1

CriticalHit: ; c666
; nonzero for a critical hit
	ds 1
	
AttackMissed: ; c667
; nonzero for a miss
	ds 1
	
PlayerSubStatus1: ; c668
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
PlayerSubStatus2: ; c669
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
PlayerSubStatus3: ; c66a
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
PlayerSubStatus4: ; c66b
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
PlayerSubStatus5: ; c66c
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

EnemySubStatus1: ; c66d
; see PlayerSubStatus1
	ds 1
EnemySubStatus2: ; c66e
; see PlayerSubStatus2
	ds 1
EnemySubStatus3: ; c66f
; see PlayerSubStatus3
	ds 1
EnemySubStatus4: ; c670
; see PlayerSubStatus4
	ds 1
EnemySubStatus5: ; c671
; see PlayerSubStatus5
	ds 1

PlayerRolloutCount: ; c672
	ds 1
PlayerConfuseCount: ; c673
	ds 1
	ds 1
PlayerDisableCount: ; c675
	ds 1
PlayerEncoreCount: ; c676
	ds 1
PlayerPerishCount: ; c677
	ds 1
PlayerFuryCutterCount: ; c678
	ds 1
PlayerProtectCount: ; c679
	ds 1

EnemyRolloutCount: ; c67a
	ds 1
EnemyConfuseCount: ; c67b
	ds 1
	ds 1
EnemyDisableCount: ; c67d
	ds 1
EnemyEncoreCount: ; c67e
	ds 1
EnemyPerishCount: ; c67f
	ds 1
EnemyFuryCutterCount: ; c680
	ds 1
EnemyProtectCount: ; c681
	ds 1

PlayerDamageTaken: ; c682
	ds 2
EnemyDamageTaken: ; c684
	ds 2

	ds 3
	
	ds 1

BattleScriptBuffer: ; c68a
	ds 40

BattleScriptBufferLoc: ; c6b2
	ds 2

	ds 2

PlayerStats: ; c6b6
	ds 10
	ds 1
EnemyStats: ; c6c1
	ds 10
	ds 1

PlayerStatLevels: ; c6cc
; 07 neutral
PlayerAtkLevel: ; c6cc
	ds 1
PlayerDefLevel: ; c6cd
	ds 1
PlayerSpdLevel: ; c6ce
	ds 1
PlayerSAtkLevel: ; c6cf
	ds 1
PlayerSDefLevel: ; c6d0
	ds 1
PlayerAccLevel: ; c6d1
	ds 1
PlayerEvaLevel: ; c6d2
	ds 1
; c6d3
	ds 1
PlayerStatLevelsEnd:

EnemyStatLevels: ; c6d4
; 07 neutral
EnemyAtkLevel: ; c6d4
	ds 1
EnemyDefLevel: ; c6d5
	ds 1
EnemySpdLevel: ; c6d6
	ds 1
EnemySAtkLevel: ; c6d7
	ds 1
EnemySDefLevel: ; c6d8
	ds 1
EnemyAccLevel: ; c6d9
	ds 1
EnemyEvaLevel: ; c6da
	ds 1
; c6db
	ds 1

EnemyTurnsTaken: ; c6dc
	ds 1
PlayerTurnsTaken: ; c6dd
	ds 1

	ds 5

CurPlayerMove: ; c6e3
	ds 1
CurEnemyMove: ; c6e4
	ds 1

LinkBattleRNCount: ; c6e5
; how far through the prng stream
	ds 1

	ds 3

CurEnemyMoveNum: ; c6e9
	ds 1

	ds 10

AlreadyDisobeyed: ; c6f4
	ds 1

DisabledMove: ; c6f5
	ds 1
EnemyDisabledMove: ; c6f6
	ds 1
	ds 1

; exists so you can't counter on switch
LastEnemyCounterMove: ; c6f8
	ds 1
LastPlayerCounterMove: ; c6f9
	ds 1

	ds 1

AlreadyFailed: ; c6fb
	ds 1

	ds 3
	
PlayerScreens: ; c6ff
; bit
; 4 reflect
; 3 light screen
; 2 safeguard
; 0 spikes
	ds 1

EnemyScreens: ; c700
; see PlayerScreens
	ds 1

	ds 1

PlayerLightScreenCount: ; c702
	ds 1
PlayerReflectCount: ; c703
	ds 1

	ds 2

EnemyLightScreenCount: ; c706
	ds 1
EnemyReflectCount: ; c707
	ds 1

	ds 2

Weather: ; c70a
; 00 normal
; 01 rain
; 02 sun
; 03 sandstorm
; 04 rain stopped
; 05 sunliight faded
; 06 sandstorm subsided
	ds 1

WeatherCount: ; c70b
; # turns remaining
	ds 1

LoweredStat: ; c70c
	ds 1
EffectFailed: ; c70d
	ds 1
FailedMessage: ; c70e
	ds 1

	ds 3

PlayerUsedMoves: ; c712
; add a move that has been used once by the player
; added in order of use
	ds 4

	ds 5

LastPlayerMove: ; c71b
	ds 1
LastEnemyMove: ; c71c
	ds 1


SECTION "battle",WRAM0[$c734]
BattleEnded: ; c734
	ds 1


SECTION "overworldmap",WRAM0[$c800]
OverworldMap: ; c800
	ds 1300
OverworldMapEnd:
	
	ds 12

SECTION "gfx2",WRAM0[$cd20]
CreditsPos:
BGMapBuffer: ; cd20
	ds 2
CreditsTimer: ; cd22
	ds 1
	ds 37
	
BGMapPalBuffer: ; cd48
	ds 40

BGMapBufferPtrs: ; cd70
; 20 bg map addresses (16x8 tiles)
	ds 40

SGBPredef: ; cd98
	ds 1
PlayerHPPal: ; cd99
	ds 1
EnemyHPPal: ; cd9a
	ds 1
	
	ds 62

AttrMap: ; cdd9
; 20x18 grid of palettes for 8x8 tiles
; read horizontally from the top row
; bit 3: vram bank
; bit 0-2: palette id
	ds 360

	ds 30
	
MonType: ; cf5f
	ds 1

CurSpecies: ; cf60
	ds 1

	ds 6

Requested2bpp: ; cf67
	ds 1
Requested2bppSource: ; cf68
	ds 2
Requested2bppDest: ; cf6a
	ds 2

Requested1bpp: ; cf6c
	ds 1
Requested1bppSource: ; cf6d
	ds 2
Requested1bppDest: ; cf6f
	ds 2

	ds 3

MenuSelection:; cf74
	ds 1



SECTION "VBlank",WRAM0[$cfb1]
OverworldDelay: ; cfb1
	ds 1
TextDelayFrames: ; cfb2
	ds 1
VBlankOccurred: ; cfb3
	ds 1

PredefID: ; cfb4
	ds 1
PredefTemp: ; cfb5
	ds 2
PredefAddress: ; cfb7
	ds 2

	ds 3

GameTimerPause: ; cfbc
; bit 0
	ds 1

SECTION "Engine",WRAM0[$cfc2]
FXAnimID:
FXAnimIDLo: ; cfc2
	ds 1
FXAnimIDHi: ; cfc3
	ds 1

	ds 2

TileAnimationTimer: ; cfc6
	ds 1

	ds 5

Options: ; cfcc
; bit 0-2: number of frames to delay when printing text
;   fast 1; mid 3; slow 5
; bit 3: ?
; bit 4: no text delay
; bit 5: stereo off/on
; bit 6: battle style shift/set
; bit 7: battle scene off/on
	ds 1
	
	ds 1

TextBoxFrame: ; cfce
; bits 0-2: textbox frame 0-7
	ds 1
	
	ds 1

GBPrinter: ; cfd0
; bit 0-6: brightness
;   lightest: $00
;   lighter:  $20
;   normal:   $40 (default)
;   darker:   $60
;   darkest:  $7F
	ds 1

Options2: ; cfd1
; bit 1: menu account off/on
	ds 1

	ds 46
	

SECTION "WRAMBank1",WRAMX[$d000],BANK[1]

	ds 2
	
DefaultFlypoint: ; d002
	ds 1
; d003
	ds 1
; d004
	ds 1
StartFlypoint: ; d005
	ds 1
EndFlypoint: ; d006
	ds 1

MovementBuffer: ; d007

	ds 55

MenuItemsList:
CurFruitTree:
CurInput:
EngineBuffer1: ; d03e
	ds 1
CurFruit: ; d03f
	ds 1

MartPointer: ; d040
	ds 2

MovementAnimation: ; d042
	ds 1

WalkingDirection: ; d043
	ds 1

FacingDirection: ; d044
	ds 1

WalkingX: ; d045
	ds 1
WalkingY: ; d046
	ds 1
WalkingTile: ; d047
	ds 1

	ds 43

StringBuffer1: ; d073
	ds 19
StringBuffer2: ; d086
	ds 19
StringBuffer3: ; d099
	ds 19
StringBuffer4: ; d0ac
	ds 19

	ds 21

CurBattleMon: ; d0d4
	ds 1
CurMoveNum: ; d0d5
	ds 1

	ds 23

VramState: ; d0ed
; bit 0: overworld sprite updating on/off
; bit 6: something to do with text
; bit 7: on when surf initiates
;        flickers when climbing waterfall
	ds 1

	ds 2

CurMart: ; d0f0
	ds 16
CurMartEnd:

	ds 6

CurItem: ; d106
	ds 1

	ds 1
	
CurPartySpecies: ; d108
	ds 1

CurPartyMon: ; d109
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1

	ds 4

TempMon:
TempMonSpecies: ; d10e
	ds 1
TempMonItem: ; d10f
	ds 1
TempMonMoves: ; d110
TempMonMove1: ; d110
	ds 1
TempMonMove2: ; d111
	ds 1
TempMonMove3: ; d112
	ds 1
TempMonMove4: ; d113
	ds 1
TempMonID: ; d114
	ds 2
TempMonExp: ; d116
	ds 3
TempMonHPExp: ; d119
	ds 2
TempMonAtkExp: ; d11b
	ds 2
TempMonDefExp: ; d11d
	ds 2
TempMonSpdExp: ; d11f
	ds 2
TempMonSpclExp: ; d121
	ds 2
TempMonDVs: ; d123
; hp = %1000 for each dv
	ds 1 ; atk/def
	ds 1 ; spd/spc
TempMonPP: ; d125
	ds 4
TempMonHappiness: ; d129
	ds 1
TempMonPokerusStatus: ; d12a
	ds 1
TempMonCaughtData: ; d12b
TempMonCaughtTime: ; d12b
TempMonCaughtLevel: ; d12b
	ds 1
TempMonCaughtGender: ; d12c
TempMonCaughtLocation: ; d12c
	ds 1
TempMonLevel: ; d12d
	ds 1
TempMonStatus: ; d12e
	ds 1
; d12f
	ds 1
TempMonCurHP: ; d130
	ds 2
TempMonMaxHP: ; d132
	ds 2
TempMonAtk: ; d134
	ds 2
TempMonDef: ; d136
	ds 2
TempMonSpd: ; d138
	ds 2
TempMonSpclAtk: ; d13a
	ds 2
TempMonSpclDef: ; d13c
	ds 2
TempMonEnd: ; d13e

	ds 3

PartyMenuActionText: ; d141
	ds 1
	ds 1

CurPartyLevel: ; d143
	ds 1


SECTION "UsedSprites",WRAMX[$d154],BANK[1]
UsedSprites: ; d154
	ds 32

SECTION "map",WRAMX[$d19d],BANK[1]

; both are in blocks (2x2 walkable tiles, 4x4 graphics tiles)
MapHeader: ; d19d
MapBorderBlock: ; d19d
	ds 1
MapHeight: ; d19e
	ds 1
MapWidth: ; d19f
	ds 1
MapBlockDataBank: ; d1a0
	ds 1
MapBlockDataPointer: ; d1a1
	ds 2
MapScriptHeaderBank: ; d1a3
	ds 1
MapScriptHeaderPointer: ; d1a4
	ds 2
MapEventHeaderPointer: ; d1a6
	ds 2
; bit set
MapConnections: ; d1a8
	ds 1
NorthMapConnection: ; d1a9
NorthConnectedMapGroup: ; d1a9
	ds 1
NorthConnectedMapNumber: ; d1aa
	ds 1
NorthConnectionStripPointer: ; d1ab
	ds 2
NorthConnectionStripLocation: ; d1ad
	ds 2
NorthConnectionStripLength: ; d1af
	ds 1
NorthConnectedMapWidth: ; d1b0
	ds 1
NorthConnectionStripYOffset: ; d1b1
	ds 1
NorthConnectionStripXOffset: ; d1b2
	ds 1
NorthConnectionWindow: ; d1b3
	ds 2

SouthMapConnection: ; d1b5
SouthConnectedMapGroup: ; d1b5
	ds 1
SouthConnectedMapNumber: ; d1b6
	ds 1
SouthConnectionStripPointer: ; d1b7
	ds 2
SouthConnectionStripLocation: ; d1b9
	ds 2
SouthConnectionStripLength: ; d1bb
	ds 1
SouthConnectedMapWidth: ; d1bc
	ds 1
SouthConnectionStripYOffset: ; d1bd
	ds 1
SouthConnectionStripXOffset: ; d1be
	ds 1
SouthConnectionWindow: ; d1bf
	ds 2

WestMapConnection: ; d1c1
WestConnectedMapGroup: ; d1c1
	ds 1
WestConnectedMapNumber: ; d1c2
	ds 1
WestConnectionStripPointer: ; d1c3
	ds 2
WestConnectionStripLocation: ; d1c5
	ds 2
WestConnectionStripLength: ; d1c7
	ds 1
WestConnectedMapWidth: ; d1c8
	ds 1
WestConnectionStripYOffset: ; d1c9
	ds 1
WestConnectionStripXOffset: ; d1ca
	ds 1
WestConnectionWindow: ; d1cb
	ds 2

EastMapConnection: ; d1cd
EastConnectedMapGroup: ; d1cd
	ds 1
EastConnectedMapNumber: ; d1ce
	ds 1
EastConnectionStripPointer: ; d1cf
	ds 2
EastConnectionStripLocation: ; d1d1
	ds 2
EastConnectionStripLength: ; d1d3
	ds 1
EastConnectedMapWidth: ; d1d4
	ds 1
EastConnectionStripYOffset: ; d1d5
	ds 1
EastConnectionStripXOffset: ; d1d6
	ds 1
EastConnectionWindow: ; d1d7
	ds 2


TilesetHeader:
TilesetBank: ; d1d9
	ds 1
TilesetAddress: ; d1da
	ds 2
TilesetBlocksBank: ; d1dc
	ds 1
TilesetBlocksAddress: ; d1dd
	ds 2
TilesetCollisionBank: ; d1df
	ds 1
TilesetCollisionAddress: ; d1e0
	ds 2
TilesetAnim: ; d1e2
; bank 3f
	ds 2
; unused ; d1e4
	ds 2
TilesetPalettes: ; d1e6
; bank 3f
	ds 2

EvolvableFlags: ; d1e8
	ds 1

	ds 1

MagikarpLength:
Buffer1: ; d1ea
	ds 1
MovementType:
Buffer2: ; d1eb
	ds 1

SECTION "BattleMons2",WRAMX[$d1fa],BANK[1]
LinkBattleRNs: ; d1fa
	ds 10

TempEnemyMonSpecies: ; d204
	ds 1
TempBattleMonSpecies: ; d205
	ds 1

EnemyMon:
EnemyMonSpecies: ; d206
	ds 1
EnemyMonItem: ; d207
	ds 1

EnemyMonMoves:
EnemyMonMove1: ; d208
	ds 1
EnemyMonMove2: ; d209
	ds 1
EnemyMonMove3: ; d20a
	ds 1
EnemyMonMove4: ; d20b
	ds 1
EnemyMonMovesEnd:

EnemyMonDVs:
EnemyMonAtkDefDV: ; d20c
	ds 1
EnemyMonSpdSpclDV: ; d20d
	ds 1
	
EnemyMonPP:
EnemyMonPPMove1: ; d20e
	ds 1
EnemyMonPPMove2: ; d20f
	ds 1
EnemyMonPPMove3: ; d210
	ds 1
EnemyMonPPMove4: ; d211
	ds 1
	
EnemyMonHappiness: ; d212
	ds 1
EnemyMonLevel: ; d213
	ds 1
	
EnemyMonStatus: ; d214
	ds 2

EnemyMonHP:
EnemyMonHPHi: ; d216
	ds 1
EnemyMonHPLo: ; d217
	ds 1

EnemyMonMaxHP:
EnemyMonMaxHPHi: ; d218
	ds 1
EnemyMonMaxHPLo: ; d219
	ds 1

EnemyMonStats:
EnemyMonAtk: ; d21a
	ds 2
EnemyMonDef: ; d21c
	ds 2
EnemyMonSpd: ; d21e
	ds 2
EnemyMonSpclAtk: ; d220
	ds 2
EnemyMonSpclDef: ; d222
	ds 2
EnemyMonStatsEnd:

EnemyMonType1: ; d224
	ds 1
EnemyMonType2: ; d225
	ds 1

EnemyMonBaseStats: ; d226
	ds 5

EnemyMonCatchRate: ; d22b
	ds 1
EnemyMonBaseExp: ; d22c
	ds 1

EnemyMonEnd:


IsInBattle: ; d22d
; 0: overworld
; 1: wild battle
; 2: trainer battle
	ds 1
	
	ds 1

OtherTrainerClass: ; d22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	ds 1

BattleType: ; d230
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

OtherTrainerID: ; d231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	ds 1

	ds 1

TrainerClass: ; d233
	ds 1

UnownLetter: ; d234
	ds 1

	ds 1

CurBaseData: ; d236
BaseDexNo: ; d236
	ds 1
BaseStats: ; d237
BaseHP: ; d237
	ds 1
BaseAttack: ; d238
	ds 1
BaseDefense: ; d239
	ds 1
BaseSpeed: ; d23a
	ds 1
BaseSpecialAttack: ; d23b
	ds 1
BaseSpecialDefense: ; d23c
	ds 1
BaseType: ; d23d
BaseType1: ; d23d
	ds 1
BaseType2: ; d23e
	ds 1
BaseCatchRate: ; d23f
	ds 1
BaseExp: ; d240
	ds 1
BaseItems: ; d241
	ds 2
BaseGender: ; d243
	ds 1
BaseUnknown1: ; d244
	ds 1
BaseEggSteps: ; d245
	ds 1
BaseUnknown2: ; d246
	ds 1
BasePicSize: ; d247
	ds 1
BasePadding: ; d248
	ds 4
BaseGrowthRate: ; d24c
	ds 1
BaseEggGroups: ; d24d
	ds 1
BaseTMHM: ; d24e
	ds 8


CurDamage: ; d256
	ds 2


SECTION "TimeOfDay",WRAMX[$d269],BANK[1]

TimeOfDay: ; d269
	ds 1

SECTION "OTParty",WRAMX[$d280],BANK[1]

OTPartyCount: ; d280
	ds 1 ; number of Pokémon in party
OTPartySpecies: ; d281
	ds 6 ; species of each Pokémon in party
; d287
	ds 1 ; any empty slots including the 7th must be FF
	     ; or the routine will keep going

OTPartyMon1:
OTPartyMon1Species: ; d288
	ds 1
OTPartyMon1Item: ; d289
	ds 1

OTPartyMon1Moves: ; d28a
OTPartyMon1Move1: ; d28a
	ds 1
OTPartyMon1Move2: ; d28b
	ds 1
OTPartyMon1Move3: ; d28c
	ds 1
OTPartyMon1Move4: ; d28d
	ds 1
	
OTPartyMon1ID: ; d28e
	ds 2
OTPartyMon1Exp: ; d290
	ds 3
OTPartyMon1HPExp: ; d293
	ds 2
OTPartyMon1AtkExp: ; d295
	ds 2
OTPartyMon1DefExp: ; d297
	ds 2
OTPartyMon1SpdExp: ; d299
	ds 2
OTPartyMon1SpclExp: ; d29b
	ds 2

OTPartyMon1DVs: ; d29d
OTPartyMon1AtkDefDV: ; d29d
	ds 1
OTPartyMon1SpdSpclDV: ; d29e
	ds 1

OTPartyMon1PP: ; d29f
OTPartyMon1PPMove1: ; d29f
	ds 1
OTPartyMon1PPMove2: ; d2a0
	ds 1
OTPartyMon1PPMove3: ; d2a1
	ds 1
OTPartyMon1PPMove4: ; d2a2
	ds 1

OTPartyMon1Happiness: ; d2a3
	ds 1
OTPartyMon1PokerusStatus: ; d2a4
	ds 1

OTPartyMon1CaughtData: ; d2a5
OTPartyMon1CaughtGender: ; d2a5
OTPartyMon1CaughtLocation: ; d2a5
	ds 1
OTPartyMon1CaughtTime: ; d2a6
	ds 1
OTPartyMon1Level: ; d2a7
	ds 1
	
OTPartyMon1Status: ; d2a8
	ds 1
OTPartyMon1Unused: ; d2a9
	ds 1
OTPartyMon1CurHP: ; d2aa
	ds 2
OTPartyMon1MaxHP: ; d2ac
	ds 2
OTPartyMon1Atk: ; d2ae
	ds 2
OTPartyMon1Def: ; d2b0
	ds 2
OTPartyMon1Spd: ; d2b2
	ds 2
OTPartyMon1SpclAtk: ; d2b4
	ds 2
OTPartyMon1SpclDef: ; d2b6
	ds 2

OTPartyMon2: ; d2b8
	ds 48
OTPartyMon3: ; d2e8
	ds 48
OTPartyMon4: ; d318
	ds 48
OTPartyMon5: ; d348
	ds 48
OTPartyMon6: ; d378
	ds 48


OTPartyMonOT:
OTPartyMon1OT: ; d3a8
	ds 11
OTPartyMon2OT: ; d3b3
	ds 11
OTPartyMon3OT: ; d3be
	ds 11
OTPartyMon4OT: ; d3c9
	ds 11
OTPartyMon5OT: ; d3d4
	ds 11
OTPartyMon6OT: ; d3df
	ds 11

OTPartyMonNicknames:
OTPartyMon1Nickname: ; d3ea
	ds 11
OTPartyMon2Nickname: ; d3f5
	ds 11
OTPartyMon3Nickname: ; d400
	ds 11
OTPartyMon4Nickname: ; d40b
	ds 11
OTPartyMon5Nickname: ; d416
	ds 11
OTPartyMon6Nickname: ; d421
	ds 11

SECTION "Scripting",WRAMX[$d434],BANK[1]
ScriptFlags: ; d434
	ds 1
ScriptFlags2: ; d435
	ds 1
ScriptFlags3: ; d436
	ds 1

ScriptMode: ; d437
	ds 1
ScriptRunning: ; d438
	ds 1
ScriptBank: ; d439
	ds 1
ScriptPos: ; d43a
	ds 2

	ds 17

ScriptDelay: ; d44d
	ds 1

SECTION "Player",WRAMX[$d472],BANK[1]
PlayerGender: ; d472
; bit 0:
;	0 male
;	1 female
	ds 1
	ds 8
PlayerID: ; d47b
	ds 2

PlayerName: ; d47d
	ds 11
MomsName: ; d488
	ds 11
RivalName: ; d493
	ds 11
RedsName: ; d49e
	ds 11
GreensName: ; d4a9
	ds 11

	ds 2

; init time set at newgame
StartDay: ; d4b6
	ds 1
StartHour: ; d4b7
	ds 1
StartMinute: ; d4b8
	ds 1
StartSecond: ; d4b9
	ds 1

	ds 9
	
GameTimeCap: ; d4c3
	ds 1
GameTimeHours: ; d4c4
	ds 2
GameTimeMinutes: ; d4c6
	ds 1
GameTimeSeconds: ; d4c7
	ds 1
GameTimeFrames: ; d4c8
	ds 1

	ds 2

CurDay: ; d4cb
	ds 1

	ds 10

	ds 2

PlayerSprite: ; d4d8
	ds 1

	ds 3

PlayerPalette: ; d4dc
	ds 1

	ds 1

PlayerDirection: ; d4de
; uses bits 2 and 3 / $0c / %00001100
; %00 down
; %01 up
; %10 left
; $11 right
	ds 1

	ds 2

PlayerAction: ; d4e1
; 1 standing
; 2 walking
; 4 spinning
; 6 fishing
	ds 1

	ds 2

StandingTile: ; d4e4
	ds 1
StandingTile2: ; d4e5
	ds 1

; relative to the map struct including borders
MapX: ; d4e6
	ds 1
MapY: ; d4e7
	ds 1
MapX2: ; d4e8
	ds 1
MapY2: ; d4e9
	ds 1

	ds 3

; relative to the bg map, in px
PlayerSpriteX: ; d4ed
	ds 1
PlayerSpriteY: ; d4ee
	ds 1


SECTION "Objects",WRAMX[$d71e],BANK[1]
MapObjects: ; d71e
	ds OBJECT_LENGTH * NUM_OBJECTS


SECTION "VariableSprites",WRAMX[$d82e],BANK[1]
VariableSprites: ; d82e
	ds $10


SECTION "Status",WRAMX[$d841],BANK[1]
TimeOfDayPal: ; d841
	ds 1
	ds 4
; d846
	ds 1
	ds 1
CurTimeOfDay: ; d848
	ds 1
	
	ds 3

StatusFlags: ; d84c
	ds 1
StatusFlags2: ; d84d
	ds 1

Money: ; d84e
	ds 3

	ds 4

Coins: ; d855
	ds 2
	
Badges:
JohtoBadges: ; d857
	ds 1
KantoBadges: ; d858
	ds 1
	
SECTION "Items",WRAMX[$d859],BANK[1]
TMsHMs: ; d859
	ds 57
TMsHMsEnd:

NumItems: ; d892
	ds 1
Items: ; d893
	ds 41
ItemsEnd:

NumKeyItems: ; d8bc
	ds 1
KeyItems: ; d8bd
	ds 26
KeyItemsEnd:

NumBalls: ; d8d7
	ds 1
Balls: ; d8d8
	ds 25
BallsEnd:

PCItems: ; d8f1
	ds 101
PCItemsEnd:


SECTION "overworld",WRAMX[$d95b],BANK[1]
WhichRegisteredItem: ; d95b
	ds 1
RegisteredItem: ; d95c
	ds 1

PlayerState: ; d95d
	ds 1

SECTION "scriptram",WRAMX[$d962],BANK[1]
MooMooBerries: ; d962
	ds 1 ; how many berries fed to MooMoo
UndergroundSwitchPositions: ; d963
	ds 1 ; which positions the switches are in
FarfetchdPosition: ; d964
	ds 1 ; which position the ilex farfetch'd is in

SECTION "Events",WRAMX[$da72],BANK[1]

EventFlags: ; da72
;RoomDecorations: ; dac6
;TeamRocketAzaleaTownAttackEvent: ; db51
;PoliceAtElmsLabEvent: ; db52
;SalesmanMahoganyTownEvent: ; db5c
;RedGyaradosEvent: ; db5c
	ds 250
; db6c

SECTION "BoxNames",WRAMX[$db75],BANK[1]
; 8 chars + $50
Box1Name: ; db75
	ds 9
Box2Name: ; db7e
	ds 9
Box3Name: ; db87
	ds 9
Box4Name: ; db90
	ds 9
Box5Name: ; db99
	ds 9
Box6Name: ; dba2
	ds 9
Box7Name: ; dbab
	ds 9
Box8Name: ; dbb4
	ds 9
Box9Name: ; dbbd
	ds 9
Box10Name: ; dbc6
	ds 9
Box11Name: ; dbcf
	ds 9
Box12Name: ; dbd8
	ds 9
Box13Name: ; dbe1
	ds 9
Box14Name: ; dbea
	ds 9

SECTION "bike", WRAMX[$dbf5],BANK[1]
BikeFlags: ; dbf5
; bit 1: always on bike
; bit 2: downhill
	ds 1

SECTION "decorations", WRAMX[$dc0f],BANK[1]
; Sprite id of each decoration
Bed: ; dc0f
	ds 1
Carpet: ; dc10
	ds 1
Plant: ; dc11
	ds 1
Poster: ; dc12
	ds 1
Console: ; dc13
	ds 1
LeftOrnament: ; dc14
	ds 1
RightOrnament: ; dc15
	ds 1
BigDoll: ; dc16
	ds 1

SECTION "fruittrees", WRAMX[$dc27],BANK[1]
FruitTreeFlags: ; dc27
	ds 1

SECTION "steps", WRAMX[$dc73],BANK[1]
StepCount: ; dc73
	ds 1
PoisonStepCount: ; dc74
	ds 1

SECTION "FlypointPermissions", WRAMX[$dca5],BANK[1]
FlypointPerms: ; dca5
	ds 4

SECTION "BackupMapInfo", WRAMX[$dcad],BANK[1]

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupMapGroup: ; dcad
	ds 1
BackupMapNumber: ; dcae
	ds 1

SECTION "PlayerMapInfo", WRAMX[$dcb4],BANK[1]

WarpNumber: ; dcb4
	ds 1
MapGroup: ; dcb5
	ds 1 ; map group of current map
MapNumber: ; dcb6
	ds 1 ; map number of current map
YCoord: ; dcb7
	ds 1 ; current y coordinate relative to top-left corner of current map
XCoord: ; dcb8
	ds 1 ; current x coordinate relative to top-left corner of current map

SECTION "PlayerParty",WRAMX[$dcd7],BANK[1]

PartyCount: ; dcd7
	ds 1 ; number of Pokémon in party
PartySpecies: ; dcd8
	ds 6 ; species of each Pokémon in party
PartyEnd: ; dcde
	ds 1 ; legacy functions don't check PartyCount
		 
PartyMons:
PartyMon1:
PartyMon1Species: ; dcdf
	ds 1
PartyMon1Item: ; dce0
	ds 1

PartyMon1Moves: ; dce1
PartyMon1Move1: ; dce1
	ds 1
PartyMon1Move2: ; dce2
	ds 1
PartyMon1Move3: ; dce3
	ds 1
PartyMon1Move4: ; dce4
	ds 1

PartyMon1ID: ; dce5
	ds 2
PartyMon1Exp: ; dce7
	ds 3

PartyMon1HPExp: ; dcea
	ds 2
PartyMon1AtkExp: ; dcec
	ds 2
PartyMon1DefExp: ; dcee
	ds 2
PartyMon1SpdExp: ; dcf0
	ds 2
PartyMon1SpclExp: ; dcf2
	ds 2

PartyMon1DVs: ; dcf4
; hp = %1000 for each dv
	ds 1 ; atk/def
	ds 1 ; spd/spc
PartyMon1PP: ; dcf6
	ds 4
PartyMon1Happiness: ; dcfa
	ds 1
PartyMon1PokerusStatus: ; dcfb
	ds 1
PartyMon1CaughtData: ; dcfc
PartyMon1CaughtTime: ; dcfc
PartyMon1CaughtLevel: ; dcfc
	ds 1
PartyMon1CaughtGender: ; dcfd
PartyMon1CaughtLocation: ; dcfd
	ds 1
PartyMon1Level: ; dcfe
	ds 1
PartyMon1Status: ; dcff
	ds 1
; dd00 unused
	ds 1
PartyMon1CurHP: ; dd01
	ds 2
PartyMon1MaxHP: ; dd03
	ds 2
PartyMon1Atk: ; dd05
	ds 2
PartyMon1Def: ; dd07
	ds 2
PartyMon1Spd: ; dd09
	ds 2
PartyMon1SpclAtk: ; dd0b
	ds 2
PartyMon1SpclDef: ; dd0d
	ds 2


PartyMon2: ; dd0f
	ds 48
PartyMon3: ; dd3f
	ds 48
PartyMon4: ; dd6f
	ds 48
PartyMon5: ; dd9f
	ds 48
PartyMon6: ; ddcf
	ds 48

PartyMonOT:
PartyMon1OT: ; ddff
	ds 11
PartyMon2OT: ; de0a
	ds 11
PartyMon3OT: ; de15
	ds 11
PartyMon4OT: ; de20
	ds 11
PartyMon5OT: ; de2b
	ds 11
PartyMon6OT: ; de36
	ds 11

PartyMonNicknames:
PartyMon1Nickname: ; de41
	ds 11
PartyMon2Nickname: ; de4c
	ds 11
PartyMon3Nickname: ; de57
	ds 11
PartyMon4Nickname: ; de62
	ds 11
PartyMon5Nickname: ; de6d
	ds 11
PartyMon6Nickname: ; de78
	ds 11
PartyMonNicknamesEnd:

SECTION "Pokedex",WRAMX[$de99],BANK[1]
PokedexCaught: ; de99
	ds 32
EndPokedexCaught:
PokedexSeen: ; deb9
	ds 32
EndPokedexSeen:
UnownDex: ; ded9
	ds 26
UnlockedUnowns: ; def3
	ds 1

SECTION "Breeding",WRAMX[$def5],BANK[1]
DaycareMan: ; def5
; bit 7: active
; bit 6: monsters are compatible
; bit 5: egg ready
; bit 0: monster 1 in daycare
	ds 1

BreedMon1:
BreedMon1Nick: ; def6
	ds 11
BreedMon1OT: ; df01
	ds 11
BreedMon1Stats:
BreedMon1Species: ; df0c
	ds 1
	ds 31

DaycareLady: ; df2c
; bit 7: active
; bit 0: monster 2 in daycare
	ds 1

StepsToEgg: ; df2d
	ds 1
DittoInDaycare: ; df2e
;  z: yes
; nz: no
	ds 1

BreedMon2:
BreedMon2Nick: ; df2f
	ds 11
BreedMon2OT: ; df3a
	ds 11
BreedMon2Stats:
BreedMon2Species: ; df45
	ds 1
	ds 31

EggNick: ; df65
; EGG@
	ds 11
EggOT: ; df70
	ds 11
EggStats:
EggSpecies: ; df7b
	ds 1
	ds 31

SECTION "RoamMons",WRAMX[$dfcf],BANK[1]
RoamMon1Species: ; dfcf
	ds 1
RoamMon1Level: ; dfd0
	ds 1
RoamMon1MapGroup: ; dfd1
	ds 1
RoamMon1MapNumber: ; dfd2
	ds 1
RoamMon1CurHP: ; dfd3
	ds 1
RoamMon1DVs: ; dfd4
	ds 2

RoamMon2Species: ; dfd6
	ds 1
RoamMon2Level: ; dfd7
	ds 1
RoamMon2MapGroup: ; dfd8
	ds 1
RoamMon2MapNumber: ; dfd9
	ds 1
RoamMon2CurHP: ; dfda
	ds 1
RoamMon2DVs: ; dfdb
	ds 2

RoamMon3Species: ; dfdd
	ds 1
RoamMon3Level: ; dfde
	ds 1
RoamMon3MapGroup: ; dfdf
	ds 1
RoamMon3MapNumber: ; dfe0
	ds 1
RoamMon3CurHP: ; dfe1
	ds 1
RoamMon3DVs: ; dfe2
	ds 2



SECTION "WRAMBank5",WRAMX[$d000],BANK[5]

; 8 4-color palettes
Unkn1Pals: ; d000
	ds $40
Unkn2Pals: ; d040
	ds $40
BGPals: ; d080
	ds $40
OBPals: ; d0c0
	ds $40

LYOverrides: ; d100
	ds 144
LYOverridesEnd:


SECTION "SRAMBank1",SRAM,BANK[1]

SECTION "BoxMons",SRAM[$ad10],BANK[1]
BoxCount: ; ad10
	ds 1
BoxSpecies: ; ad11
	ds 20
	ds 1
BoxMons:
BoxMon1:
BoxMon1Species: ; ad26
	ds 1
BoxMon1Item: ; ad27
	ds 1
BoxMon1Moves: ; ad28
	ds 4
BoxMon1ID: ; ad2c
	ds 2
BoxMon1Exp: ; ad2e
	ds 3
BoxMon1HPExp: ; ad31
	ds 2
BoxMon1AtkExp: ; ad33
	ds 2
BoxMon1DefExp: ; ad35
	ds 2
BoxMon1SpdExp: ; ad37
	ds 2
BoxMon1SpcExp: ; ad39
	ds 2
BoxMon1DVs: ; ad3b
	ds 2
BoxMon1PP: ; ad3d
	ds 4
BoxMon1Happiness: ; ad41
	ds 1
BoxMon1PokerusStatus: ; ad42
	ds 1
BoxMon1CaughtData:
BoxMon1CaughtTime:
BoxMon1CaughtLevel: ; ad43
	ds 1
BoxMon1CaughtGender:
BoxMon1CaughtLocation: ; ad44
	ds 1
BoxMon1Level: ; ad45
	ds 1

BoxMon2: ; ad46
	ds 32
BoxMon3: ; ad66
	ds 32
BoxMon4: ; ad86
	ds 32
BoxMon5: ; ada6
	ds 32
BoxMon6: ; adc6
	ds 32
BoxMon7: ; ade6
	ds 32
BoxMon8: ; ae06
	ds 32
BoxMon9: ; ae26
	ds 32
BoxMon10: ; ae46
	ds 32
BoxMon11: ; ae66
	ds 32
BoxMon12: ; ae86
	ds 32
BoxMon13: ; aea6
	ds 32
BoxMon14: ; aec6
	ds 32
BoxMon15: ; aee6
	ds 32
BoxMon16: ; af06
	ds 32
BoxMon17: ; af26
	ds 32
BoxMon18: ; af46
	ds 32
BoxMon19: ; af66
	ds 32
BoxMon20: ; af86
	ds 32

BoxMonOT:
BoxMon1OT: ; afa6
	ds 11
BoxMon2OT: ; afb1
	ds 11
BoxMon3OT: ; afbc
	ds 11
BoxMon4OT: ; afc7
	ds 11
BoxMon5OT: ; afd2
	ds 11
BoxMon6OT: ; afdd
	ds 11
BoxMon7OT: ; afe8
	ds 11
BoxMon8OT: ; aff3
	ds 11
BoxMon9OT: ; affe
	ds 11
BoxMon10OT: ; b009
	ds 11
BoxMon11OT: ; b014
	ds 11
BoxMon12OT: ; b01f
	ds 11
BoxMon13OT: ; b02a
	ds 11
BoxMon14OT: ; b035
	ds 11
BoxMon15OT: ; b040
	ds 11
BoxMon16OT: ; b04b
	ds 11
BoxMon17OT: ; b056
	ds 11
BoxMon18OT: ; b061
	ds 11
BoxMon19OT: ; b06c
	ds 11
BoxMon20OT: ; b077
	ds 11

BoxMonNicknames:
BoxMon1Nickname: ; b082
	ds 11
BoxMon2Nickname: ; b08d
	ds 11
BoxMon3Nickname: ; b098
	ds 11
BoxMon4Nickname: ; b0a3
	ds 11
BoxMon5Nickname: ; b0ae
	ds 11
BoxMon6Nickname: ; b0b9
	ds 11
BoxMon7Nickname: ; b0c4
	ds 11
BoxMon8Nickname: ; b0cf
	ds 11
BoxMon9Nickname: ; b0da
	ds 11
BoxMon10Nickname: ; b0e5
	ds 11
BoxMon11Nickname: ; b0f0
	ds 11
BoxMon12Nickname: ; b0fb
	ds 11
BoxMon13Nickname: ; b106
	ds 11
BoxMon14Nickname: ; b111
	ds 11
BoxMon15Nickname: ; b11c
	ds 11
BoxMon16Nickname: ; b127
	ds 11
BoxMon17Nickname: ; b132
	ds 11
BoxMon18Nickname: ; b13d
	ds 11
BoxMon19Nickname: ; b148
	ds 11
BoxMon20Nickname: ; b153
	ds 11
BoxMonNicknamesEnd:

