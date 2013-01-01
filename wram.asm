SECTION "stack",BSS[$c000]
	ds 256
Stack: ; c0ff


SECTION "audio",BSS[$c100]
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
; unused? ; c10b
	ds 1
; unused? ; c10c
	ds 1
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
Channel1StartingOctave ; c115
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
Channel1LoopCount ; c119
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
	ds 7
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
	ds 9
LastVolume: ; c2b4
; preserves volume of a song playing so cries can have their own volume
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

SECTION "auto",BSS[$c2c7]
InputType: ; c2c7
; 00 normal
; ff auto
	ds 1
AutoInputAddress: ; c2c8
	ds 2
AutoInputBank: ; c2ca
	ds 1
AutoInputLength: ; c2cb
	ds 1

SECTION "linkbattle",BSS[$c2dc]
InLinkBattle: ; c2dc
; 0 not in link battle
; 1 link battle
; 4 mobile battle
	ds 1

SECTION "scriptengine",BSS[$c2dd]
ScriptVar: ; c2dd
	ds 1


SECTION "tiles",BSS[$c2fa]
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


SECTION "gfx",BSS[$c400]

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

TileMap: ; c4a0
; 20x18 grid of 8x8 tiles
	ds 360


SECTION "BattleMons",BSS[$c608]

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

	ds 25

CurOTMon: ; c663
	ds 1
	
	ds 4
	
PlayerSubStatus1: ; c668
; bit
; 7 attract
; 6 encore
; 5 endure
; 4 perish song
; 3 
; 2 protect
; 1 curse
; 0 nightmare
	ds 1
PlayerSubStatus2: ; c669
; unknown
	ds 1
PlayerSubStatus3: ; c66a
; bit
; 7 confusion
; 6
; 5
; 4 charged
; 3 
; 2
; 1 rollout
; 0 bide
	ds 1
PlayerSubStatus4: ; c66b
; bit
; 7 leech seed
; 6
; 5 recharge
; 4 substitute
; 3
; 2
; 1
; 0
	ds 1
PlayerSubStatus5: ; c66c
; unknown
	ds 1

EnemySubStatus1: ; c66d
; see PlayerSubStatus1
	ds 1
EnemySubstatus2: ; c66e
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

	ds 4

PlayerEncoreCount: ; c676
	ds 1
PlayerPerishCount: ; c677
	ds 1

	ds 5

EnemyEncoreCount: ; c67e
	ds 1
EnemyPerishCount: ; c67f
	ds 1

	ds 2

PlayerDamageTaken: ; c682
	ds 2
EnemyDamageTaken: ; c684
	ds 2

	ds 4

BattleScriptBuffer: ; c68a
	ds 40

BattleScriptBufferLocLo: ; c6b2
	ds 1
BattleScriptBufferLocHi: ; c6b3
	ds 1

	ds 24

PlayerStatLevels: ; c6cc
; 07 neutral
	ds 8
EnemyStatLevels: ; c6d4
; 07 neutral
	ds 8

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

	ds 15

DisabledMove: ; c6f5
	ds 1

	ds 2

; exists so you can't counter on switch
LastEnemyCounterMove: ; c6f8
	ds 1
LastPlayerCounterMove: ; c6f9
	ds 1

	ds 8

PlayerLightScreenCount: ; c702
	ds 1
PlayerReflectCount: ; c703
	ds 1

	ds 6

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

	ds 6

PlayerUsedMoves: ; c712
; add a move that has been used once by the player
; added in order of use
	ds 4

	ds 5

LastPlayerMove: ; c71b
	ds 1
LastEnemyMove: ; c71c
	ds 1


SECTION "gfx2",BSS[$c800]
OverworldMap: ; c800
	ds 1280

; cd00
	ds 32

BGMapBuffer: ; cd20
	ds 40
	
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
; 0 partymon
; 1 otpartymon
; 2 boxmon
; 3 ????mon
; 4 wildmon
	ds 1

CurBattleSpecies: ; cf60
	ds 1

	ds 33

TileY: ; cf82
	ds 1
TileX: ; cf83
	ds 1



SECTION "VBlank",BSS[$cfb2]
TextDelayFrames: ; cfb2
	ds 1
VBlankOccurred: ; cfb3
	ds 1

	ds 8

GameTimerPause: ; cfbc
; bit 0
	ds 1

SECTION "Engine",BSS[$cfc2]
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

	ds 47
	
; d000

	ds 114

StringBuffer1: ; d073
	ds 19
StringBuffer2: ; d086
	ds 19
StringBuffer3: ; d099
	ds 19

	ds 40

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

	ds 26
	
CurPartySpecies: ; d108
	ds 1

CurPartyMon: ; d109
; contains which monster in a party
; is being dealt with at the moment
; 0-5
	ds 1

	ds 57

CurPartyLevel: ; d143
	ds 1

	ds 149

TileSetHeader:
TileSetBank: ; d1d9
	ds 1
TileSetAddress: ; d1da
	ds 2
TileSetBlocksBank: ; d1dc
	ds 1
TileSetBlocksAddress: ; d1dd
	ds 2
TileSetCollisionBank: ; d1df
	ds 1
TileSetCollisionAddress: ; d1e0
	ds 2
TileSetAnim: ; d1e2
; bank 3f
	ds 2
; unused ; d1e4
	ds 2
TileSetPalettes: ; d1e6
; bank 3f
	ds 2

	ds 2

Buffer1:
MagikarpLength:
MagikarpLengthHi: ; d1ea
	ds 1
Buffer2:
MagikarpLengthLo: ; d1eb
	ds 1

SECTION "prng2",BSS[$d1fa]
LinkBattleRNs: ; d1fa
	ds 10

SECTION "BattleMons2",BSS[$d204]

TempEnemyMonSpecies: ; d204
	ds 1
TempBattleMonSpecies: ; d205
	ds 1
	
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

SECTION "Battle",BSS[$d22d]

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

	ds 2

UnownLetter: ; d234
	ds 1

	ds 1

CurBaseStats: ; d236
	ds 32

SECTION "TimeOfDay",BSS[$d269]

TimeOfDay: ; d269
; 0 morn
; 1 day
; 2 nite
; 3 darkness
	ds 1

SECTION "OtherTrainerParty",BSS[$d280]

OTPartyMonHeader: ; d280
TotalBeltMons: ; d280
	ds 1

OTPartyMonSpecies: ; d281
OTPartyMon1Species: ; d281
	ds 1
OTPartyMon2Species: ; d282
	ds 1
OTPartyMon3Species: ; d283
	ds 1
OTPartyMon4Species: ; d284
	ds 1
OTPartyMon5Species: ; d285
	ds 1
OTPartyMon6Species: ; d286
	ds 1
OTPartyMonsEnd: ; d287
	ds 1

OTPartyMon1:
OTPartyMon1Species2: ; d288
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
OTPartyMon2Species2: ; d2b8
	ds 1
OTPartyMon2Item: ; d2b9
	ds 1

OTPartyMon2Moves: ; d2ba
OTPartyMon2Move1: ; d2ba
	ds 1
OTPartyMon2Move2: ; d2bb
	ds 1
OTPartyMon2Move3: ; d2bc
	ds 1
OTPartyMon2Move4: ; d2bd
	ds 1
	
OTPartyMon2ID: ; d2be
	ds 2
OTPartyMon2Exp: ; d2c0
	ds 3
OTPartyMon2HPExp: ; d2c3
	ds 2
OTPartyMon2AtkExp: ; d2c5
	ds 2
OTPartyMon2DefExp: ; d2c7
	ds 2
OTPartyMon2SpdExp: ; d2c9
	ds 2
OTPartyMon2SpclExp: ; d2cb
	ds 2

OTPartyMon2DVs: ; d2cd
OTPartyMon2AtkDefDV: ; d2cd
	ds 1
OTPartyMon2SpdSpclDV: ; d2ce
	ds 1

OTPartyMon2PP: ; d2cf
OTPartyMon2PPMove1: ; d2cf
	ds 1
OTPartyMon2PPMove2: ; d2d0
	ds 1
OTPartyMon2PPMove3: ; d2d1
	ds 1
OTPartyMon2PPMove4: ; d2d2
	ds 1

OTPartyMon2Happiness: ; d2d3
	ds 1
OTPartyMon2PokerusStatus: ; d2d4
	ds 1

OTPartyMon2CaughtData: ; d2d5
OTPartyMon2CaughtGender: ; d2d5
OTPartyMon2CaughtLocation: ; d2d5
	ds 1
OTPartyMon2CaughtTime: ; d2d6
	ds 1
OTPartyMon2Level: ; d2d7
	ds 1
	
OTPartyMon2Status: ; d2d8
	ds 1
OTPartyMon2Unused: ; d2d9
	ds 1
OTPartyMon2CurHP: ; d2da
	ds 2
OTPartyMon2MaxHP: ; d2dc
	ds 2
OTPartyMon2Atk: ; d2de
	ds 2
OTPartyMon2Def: ; d2e0
	ds 2
OTPartyMon2Spd: ; d2e2
	ds 2
OTPartyMon2SpclAtk: ; d2e4
	ds 2
OTPartyMon2SpclDef: ; d2e6
	ds 2

OTPartyMon3: ; d2e8
OTPartyMon3Species2: ; d2e8
	ds 1
OTPartyMon3Item: ; d2e9
	ds 1

OTPartyMon3Moves: ; d2ea
OTPartyMon3Move1: ; d2ea
	ds 1
OTPartyMon3Move2: ; d2eb
	ds 1
OTPartyMon3Move3: ; d2ec
	ds 1
OTPartyMon3Move4: ; d2ed
	ds 1
	
OTPartyMon3ID: ; d2ee
	ds 2
OTPartyMon3Exp: ; d2f0
	ds 3
OTPartyMon3HPExp: ; d2f3
	ds 2
OTPartyMon3AtkExp: ; d2f5
	ds 2
OTPartyMon3DefExp: ; d2f7
	ds 2
OTPartyMon3SpdExp: ; d2f9
	ds 2
OTPartyMon3SpclExp: ; d2fb
	ds 2

OTPartyMon3DVs: ; d2fd
OTPartyMon3AtkDefDV: ; d2fd
	ds 1
OTPartyMon3SpdSpclDV: ; d2fe
	ds 1

OTPartyMon3PP: ; d2ff
OTPartyMon3PPMove1: ; d2ff
	ds 1
OTPartyMon3PPMove2: ; d300
	ds 1
OTPartyMon3PPMove3: ; d301
	ds 1
OTPartyMon3PPMove4: ; d302
	ds 1

OTPartyMon3Happiness: ; d303
	ds 1
OTPartyMon3PokerusStatus: ; d304
	ds 1

OTPartyMon3CaughtData: ; d305
OTPartyMon3CaughtGender: ; d305
OTPartyMon3CaughtLocation: ; d305
	ds 1
OTPartyMon3CaughtTime: ; d306
	ds 1
OTPartyMon3Level: ; d307
	ds 1
	
OTPartyMon3Status: ; d308
	ds 1
OTPartyMon3Unused: ; d309
	ds 1
OTPartyMon3CurHP: ; d30a
	ds 2
OTPartyMon3MaxHP: ; d30c
	ds 2
OTPartyMon3Atk: ; d30e
	ds 2
OTPartyMon3Def: ; d310
	ds 2
OTPartyMon3Spd: ; d312
	ds 2
OTPartyMon3SpclAtk: ; d314
	ds 2
OTPartyMon3SpclDef: ; d316
	ds 2

OTPartyMon4: ; d318
OTPartyMon4Species2: ; d318
	ds 1
OTPartyMon4Item: ; d319
	ds 1

OTPartyMon4Moves: ; d31a
OTPartyMon4Move1: ; d31a
	ds 1
OTPartyMon4Move2: ; d31b
	ds 1
OTPartyMon4Move3: ; d31c
	ds 1
OTPartyMon4Move4: ; d31d
	ds 1
	
OTPartyMon4ID: ; d31e
	ds 2
OTPartyMon4Exp: ; d320
	ds 3
OTPartyMon4HPExp: ; d323
	ds 2
OTPartyMon4AtkExp: ; d325
	ds 2
OTPartyMon4DefExp: ; d327
	ds 2
OTPartyMon4SpdExp: ; d329
	ds 2
OTPartyMon4SpclExp: ; d32b
	ds 2

OTPartyMon4DVs: ; d32d
OTPartyMon4AtkDefDV: ; d32d
	ds 1
OTPartyMon4SpdSpclDV: ; d32e
	ds 1

OTPartyMon4PP: ; d32f
OTPartyMon4PPMove1: ; d32f
	ds 1
OTPartyMon4PPMove2: ; d330
	ds 1
OTPartyMon4PPMove3: ; d331
	ds 1
OTPartyMon4PPMove4: ; d332
	ds 1

OTPartyMon4Happiness: ; d333
	ds 1
OTPartyMon4PokerusStatus: ; d334
	ds 1

OTPartyMon4CaughtData: ; d335
OTPartyMon4CaughtGender: ; d335
OTPartyMon4CaughtLocation: ; d335
	ds 1
OTPartyMon4CaughtTime: ; d336
	ds 1
OTPartyMon4Level: ; d337
	ds 1
	
OTPartyMon4Status: ; d338
	ds 1
OTPartyMon4Unused: ; d339
	ds 1
OTPartyMon4CurHP: ; d33a
	ds 2
OTPartyMon4MaxHP: ; d33c
	ds 2
OTPartyMon4Atk: ; d33e
	ds 2
OTPartyMon4Def: ; d340
	ds 2
OTPartyMon4Spd: ; d342
	ds 2
OTPartyMon4SpclAtk: ; d344
	ds 2
OTPartyMon4SpclDef: ; d346
	ds 2

OTPartyMon5: ; d348
OTPartyMon5Species2: ; d348
	ds 1
OTPartyMon5Item: ; d349
	ds 1

OTPartyMon5Moves: ; d34a
OTPartyMon5Move1: ; d34a
	ds 1
OTPartyMon5Move2: ; d34b
	ds 1
OTPartyMon5Move3: ; d34c
	ds 1
OTPartyMon5Move4: ; d34d
	ds 1
	
OTPartyMon5ID: ; d34e
	ds 2
OTPartyMon5Exp: ; d350
	ds 3
OTPartyMon5HPExp: ; d353
	ds 2
OTPartyMon5AtkExp: ; d355
	ds 2
OTPartyMon5DefExp: ; d357
	ds 2
OTPartyMon5SpdExp: ; d359
	ds 2
OTPartyMon5SpclExp: ; d35b
	ds 2

OTPartyMon5DVs: ; d35d
OTPartyMon5AtkDefDV: ; d35d
	ds 1
OTPartyMon5SpdSpclDV: ; d35e
	ds 1

OTPartyMon5PP: ; d35f
OTPartyMon5PPMove1: ; d35f
	ds 1
OTPartyMon5PPMove2: ; d360
	ds 1
OTPartyMon5PPMove3: ; d361
	ds 1
OTPartyMon5PPMove4: ; d362
	ds 1

OTPartyMon5Happiness: ; d363
	ds 1
OTPartyMon5PokerusStatus: ; d364
	ds 1

OTPartyMon5CaughtData: ; d365
OTPartyMon5CaughtGender: ; d365
OTPartyMon5CaughtLocation: ; d365
	ds 1
OTPartyMon5CaughtTime: ; d366
	ds 1
OTPartyMon5Level: ; d367
	ds 1
	
OTPartyMon5Status: ; d368
	ds 1
OTPartyMon5Unused: ; d369
	ds 1
OTPartyMon5CurHP: ; d36a
	ds 2
OTPartyMon5MaxHP: ; d36c
	ds 2
OTPartyMon5Atk: ; d36e
	ds 2
OTPartyMon5Def: ; d370
	ds 2
OTPartyMon5Spd: ; d372
	ds 2
OTPartyMon5SpclAtk: ; d374
	ds 2
OTPartyMon5SpclDef: ; d376
	ds 2

OTPartyMon6: ; d378
OTPartyMon6Species2: ; d378
	ds 1
OTPartyMon6Item: ; d379
	ds 1

OTPartyMon6Moves: ; d37a
OTPartyMon6Move1: ; d37a
	ds 1
OTPartyMon6Move2: ; d37b
	ds 1
OTPartyMon6Move3: ; d37c
	ds 1
OTPartyMon6Move4: ; d37d
	ds 1
	
OTPartyMon6ID: ; d37e
	ds 2
OTPartyMon6Exp: ; d380
	ds 3
OTPartyMon6HPExp: ; d383
	ds 2
OTPartyMon6AtkExp: ; d385
	ds 2
OTPartyMon6DefExp: ; d387
	ds 2
OTPartyMon6SpdExp: ; d389
	ds 2
OTPartyMon6SpclExp: ; d38b
	ds 2

OTPartyMon6DVs: ; d38d
OTPartyMon6AtkDefDV: ; d38d
	ds 1
OTPartyMon6SpdSpclDV: ; d38e
	ds 1

OTPartyMon6PP: ; d38f
OTPartyMon6PPMove1: ; d38f
	ds 1
OTPartyMon6PPMove2: ; d390
	ds 1
OTPartyMon6PPMove3: ; d391
	ds 1
OTPartyMon6PPMove4: ; d392
	ds 1

OTPartyMon6Happiness: ; d393
	ds 1
OTPartyMon6PokerusStatus: ; d394
	ds 1

OTPartyMon6CaughtData: ; d395
OTPartyMon6CaughtGender: ; d395
OTPartyMon6CaughtLocation: ; d395
	ds 1
OTPartyMon6CaughtTime: ; d396
	ds 1
OTPartyMon6Level: ; d397
	ds 1
	
OTPartyMon6Status: ; d398
	ds 1
OTPartyMon6Unused: ; d399
	ds 1
OTPartyMon6CurHP: ; d39a
	ds 2
OTPartyMon6MaxHP: ; d39c
	ds 2
OTPartyMon6Atk: ; d39e
	ds 2
OTPartyMon6Def: ; d3a0
	ds 2
OTPartyMon6Spd: ; d3a2
	ds 2
OTPartyMon6SpclAtk: ; d3a4
	ds 2
OTPartyMon6SpclDef: ; d3a6
	ds 2

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


SECTION "Player",BSS[$d47b]
PlayerID: ; d47b
	ds 2
PlayerName: ; d47d
	ds 11

	ds 46
	
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

	ds 12

PlayerSprite: ; d4d8
	ds 1

	ds 5

PlayerDirection: ; d4de
; uses bits 2 and 3 / $0c / %00001100
; %00 down
; %01 up
; %10 left
; $11 right
	ds 1

SECTION "Status",BSS[$d841]
TimeOfDayPal: ; d841
	ds 1
	ds 4
; d846
	ds 1
	ds 1
CurTimeOfDay: ; d848
	ds 1
	
	ds 5

Money: ; d84e
	ds 3

	ds 6
	
Badges:
JohtoBadges: ; d857
	ds 1
KantoBadges: ; d858
	ds 1
	
SECTION "Items",BSS[$d859]
TMsHMs: ; d859
	ds 57

NumItems: ; d892
	ds 1
Items: ; d893
	ds 69

NumKeyItems: ; d8bc
	ds 1
KeyItems: ; d8bd
	ds 13
	
NumBalls: ; d8d7
	ds 1
Balls: ; d8d8
	ds 25
	
SECTION "overworld",BSS[$d95d]
PlayerState: ; d95d
; $00: normal
; $01: bicycle
; $04: surf
; $08: surf (pikachu)
	ds 1

SECTION "scriptram",BSS[$d962]
MooMooBerries: ; d962
	ds 1 ; how many berries fed to MooMoo
UndergroundSwitchPositions: ; d963
	ds 1 ; which positions the switches are in
FarfetchdPosition: ; d964
	ds 1 ; which position the ilex farfetch'd is in

SECTION "Events",BSS[$dad4]

;RoomDecorations: ; dac6
;	db 7

HoOhEvent: ; dad4
	ds 1
LugiaEvent: ; dad5
	ds 1

; TODO
;SuicuneEvent: ; dad8 (tin tower)
;TeamRocketAzaleaTownAttackEvent: ; db51
;SudowoodoEvent: ; db51
;PoliceAtElmsLabEvent: ; db52
;SalesmanMahoganyTownEvent: ; db5c
;RedGyaradosEvent: ; db5c

SECTION "BoxNames",BSS[$db75]
; 8 chars + $50
Box1Name: ; db75
	ds 9
Box2Name: ; dbce
	ds 9
Box3Name: ; dbd7
	ds 9
Box4Name: ; dbe0
	ds 9
Box5Name: ; dbe9
	ds 9
Box6Name: ; dbf2
	ds 9
Box7Name: ; dbfb
	ds 9
Box8Name: ; dc04
	ds 9
Box9Name: ; dc0d
	ds 9
Box10Name: ; dc16
	ds 9
Box11Name: ; dc1f
	ds 9
Box12Name: ; dc28
	ds 9
Box13Name: ; dc31
	ds 9
Box14Name: ; dc3a
	ds 9

SECTION "BackupMapInfo", BSS[$dcad]

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupMapGroup: ; dcad
	ds 1
BackupMapNumber: ; dcae
	ds 1

SECTION "PlayerMapInfo", BSS[$dcb4]

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

SECTION "PlayerParty",BSS[$dcd7]

PartyCount: ; dcd7
	ds 1 ; number of Pokémon in party
PartySpecies: ; dcd8
	ds 6 ; species of each Pokémon in party
; dcde
	ds 1 ; any empty slots including the 7th must be FF
	     ; or the routine will keep going
		 
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
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon1PP: ; dcf6
	ds 4
PartyMon1Happiness: ; dcfa
	ds 1
PartyMon1PokerusStatus: ; dcfb
	ds 1
PartyMon1CaughtData: ; dcfc
PartyMon1CaughtTime: ; dcfc
PartyMon1CaughtLevel ; dcfc
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
PartyMon2Species: ; dd0f
	ds 1
PartyMon2Item: ; dd10
	ds 1
PartyMon2Moves: ; dd11
PartyMon2Move1: ; dd11
	ds 1
PartyMon2Move2: ; dd12
	ds 1
PartyMon2Move3: ; dd13
	ds 1
PartyMon2Move4: ; dd14
	ds 1
PartyMon2ID: ; dd15
	ds 2
PartyMon2Exp: ; dd17
	ds 3
PartyMon2HPExp: ; dd1a
	ds 2
PartyMon2AtkExp: ; dd1c
	ds 2
PartyMon2DefExp: ; dd1e
	ds 2
PartyMon2SpdExp: ; dd20
	ds 2
PartyMon2SpclExp: ; dd22
	ds 2
PartyMon2DVs: ; dd24
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon2PP: ; dd26
	ds 4
PartyMon2Happiness: ; dd2a
	ds 1
PartyMon2PokerusStatus: ; dd2b
	ds 1
PartyMon2CaughtData: ; dd2c
PartyMon2CaughtTime: ; dd2c
PartyMon2CaughtLevel ; dd2c
	ds 1
PartyMon2CaughtGender: ; dd2d
PartyMon2CaughtLocation: ; dd2d
	ds 1
PartyMon2Level: ; dd2e
	ds 1
PartyMon2Status: ; dd2f
	ds 1
; dd30 unused
	ds 1
PartyMon2CurHP: ; dd31
	ds 2
PartyMon2MaxHP: ; dd33
	ds 2
PartyMon2Atk: ; dd35
	ds 2
PartyMon2Def: ; dd37
	ds 2
PartyMon2Spd: ; dd39
	ds 2
PartyMon2SpclAtk: ; dd3b
	ds 2
PartyMon2SpclDef: ; dd3d
	ds 2



PartyMon3: ; dd3f
PartyMon3Species: ; dd3f
	ds 1
PartyMon3Item: ; dd40
	ds 1
PartyMon3Moves: ; dd41
PartyMon3Move1: ; dd41
	ds 1
PartyMon3Move2: ; dd42
	ds 1
PartyMon3Move3: ; dd43
	ds 1
PartyMon3Move4: ; dd44
	ds 1
PartyMon3ID: ; dd45
	ds 2
PartyMon3Exp: ; dd47
	ds 3
PartyMon3HPExp: ; dd4a
	ds 2
PartyMon3AtkExp: ; dd4c
	ds 2
PartyMon3DefExp: ; dd4e
	ds 2
PartyMon3SpdExp: ; dd50
	ds 2
PartyMon3SpclExp: ; dd52
	ds 2
PartyMon3DVs: ; dd54
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon3PP: ; dd56
	ds 4
PartyMon3Happiness: ; dd5a
	ds 1
PartyMon3PokerusStatus: ; dd5b
	ds 1
PartyMon3CaughtData: ; dd5c
PartyMon3CaughtTime: ; dd5c
PartyMon3CaughtLevel ; dd5c
	ds 1
PartyMon3CaughtGender: ; dd5d
PartyMon3CaughtLocation: ; dd5d
	ds 1
PartyMon3Level: ; dd5e
	ds 1
PartyMon3Status: ; dd5f
	ds 1
; dd60 unused
	ds 1
PartyMon3CurHP: ; dd61
	ds 2
PartyMon3MaxHP: ; dd63
	ds 2
PartyMon3Atk: ; dd65
	ds 2
PartyMon3Def: ; dd67
	ds 2
PartyMon3Spd: ; dd69
	ds 2
PartyMon3SpclAtk: ; dd6b
	ds 2
PartyMon3SpclDef: ; dd6d
	ds 2



PartyMon4: ; dd6f
PartyMon4Species: ; dd6f
	ds 1
PartyMon4Item: ; dd70
	ds 1
PartyMon4Moves: ; dd71
PartyMon4Move1: ; dd71
	ds 1
PartyMon4Move2: ; dd72
	ds 1
PartyMon4Move3: ; dd73
	ds 1
PartyMon4Move4: ; dd74
	ds 1
PartyMon4ID: ; dd75
	ds 2
PartyMon4Exp: ; dd77
	ds 3
PartyMon4HPExp: ; dd7a
	ds 2
PartyMon4AtkExp: ; dd7c
	ds 2
PartyMon4DefExp: ; dd7e
	ds 2
PartyMon4SpdExp: ; dd80
	ds 2
PartyMon4SpclExp: ; dd82
	ds 2
PartyMon4DVs: ; dd84
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon4PP: ; dd86
	ds 4
PartyMon4Happiness: ; dd8a
	ds 1
PartyMon4PokerusStatus: ; dd8b
	ds 1
PartyMon4CaughtData: ; dd8c
PartyMon4CaughtTime: ; dd8c
PartyMon4CaughtLevel ; dd8c
	ds 1
PartyMon4CaughtGender: ; dd8d
PartyMon4CaughtLocation: ; dd8d
	ds 1
PartyMon4Level: ; dd8e
	ds 1
PartyMon4Status: ; dd8f
	ds 1
; dd90 unused
	ds 1
PartyMon4CurHP: ; dd91
	ds 2
PartyMon4MaxHP: ; dd93
	ds 2
PartyMon4Atk: ; dd95
	ds 2
PartyMon4Def: ; dd97
	ds 2
PartyMon4Spd: ; dd99
	ds 2
PartyMon4SpclAtk: ; dd9b
	ds 2
PartyMon4SpclDef: ; dd9d
	ds 2



PartyMon5: ; dd9f
PartyMon5Species: ; dd9f
	ds 1
PartyMon5Item: ; dda0
	ds 1
PartyMon5Moves: ; dda1
PartyMon5Move1: ; dda1
	ds 1
PartyMon5Move2: ; dda2
	ds 1
PartyMon5Move3: ; dda3
	ds 1
PartyMon5Move4: ; dda4
	ds 1
PartyMon5ID: ; dda5
	ds 2
PartyMon5Exp: ; dda7
	ds 3
PartyMon5HPExp: ; ddaa
	ds 2
PartyMon5AtkExp: ; ddac
	ds 2
PartyMon5DefExp: ; ddae
	ds 2
PartyMon5SpdExp: ; ddb0
	ds 2
PartyMon5SpclExp: ; ddb2
	ds 2
PartyMon5DVs: ; ddb4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon5PP: ; ddb6
	ds 4
PartyMon5Happiness: ; ddba
	ds 1
PartyMon5PokerusStatus: ; ddbb
	ds 1
PartyMon5CaughtData: ; ddbc
PartyMon5CaughtTime: ; ddbc
PartyMon5CaughtLevel ; ddbc
	ds 1
PartyMon5CaughtGender: ; ddbd
PartyMon5CaughtLocation: ; ddbd
	ds 1
PartyMon5Level: ; ddbe
	ds 1
PartyMon5Status: ; ddbf
	ds 1
; ddc0 unused
	ds 1
PartyMon5CurHP: ; ddc1
	ds 2
PartyMon5MaxHP: ; ddc3
	ds 2
PartyMon5Atk: ; ddc5
	ds 2
PartyMon5Def: ; ddc7
	ds 2
PartyMon5Spd: ; ddc9
	ds 2
PartyMon5SpclAtk: ; ddcb
	ds 2
PartyMon5SpclDef: ; ddcd
	ds 2



PartyMon6: ; ddcf
PartyMon6Species: ; ddcf
	ds 1
PartyMon6Item: ; ddd0
	ds 1
PartyMon6Moves: ; ddd1
PartyMon6Move1: ; ddd1
	ds 1
PartyMon6Move2: ; ddd2
	ds 1
PartyMon6Move3: ; ddd3
	ds 1
PartyMon6Move4: ; ddd4
	ds 1
PartyMon6ID: ; ddd5
	ds 2
PartyMon6Exp: ; ddd7
	ds 3
PartyMon6HPExp: ; ddda
	ds 2
PartyMon6AtkExp: ; dddc
	ds 2
PartyMon6DefExp: ; ddde
	ds 2
PartyMon6SpdExp: ; dde0
	ds 2
PartyMon6SpclExp: ; dde2
	ds 2
PartyMon6DVs: ; dde4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon6PP: ; dde6
	ds 4
PartyMon6Happiness: ; ddea
	ds 1
PartyMon6PokerusStatus: ; ddeb
	ds 1
PartyMon6CaughtData: ; ddec
PartyMon6CaughtTime: ; ddec
PartyMon6CaughtLevel ; ddec
	ds 1
PartyMon6CaughtGender: ; dded
PartyMon6CaughtLocation: ; dded
	ds 1
PartyMon6Level: ; ddee
	ds 1
PartyMon6Status: ; ddef
	ds 1
; ddf0 unused
	ds 1
PartyMon6CurHP: ; ddf1
	ds 2
PartyMon6MaxHP: ; ddf3
	ds 2
PartyMon6Atk: ; ddf5
	ds 2
PartyMon6Def: ; ddf7
	ds 2
PartyMon6Spd: ; ddf9
	ds 2
PartyMon6SpclAtk: ; ddfb
	ds 2
PartyMon6SpclDef: ; ddfd
	ds 2
	


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

SECTION "Pokedex",BSS[$de99]
PokedexSeen: ; de99
	ds 32
PokedexCaught: ; deb9
	ds 32
UnownDex: ; ded9
	ds 26
UnownUnlockedGroups: ; def3
	ds 1

SECTION "Breeding",BSS[$def5]
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
Breedmon1Species: ; df0c
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
BreedMon1Species: ; df45
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

SECTION "RoamMons",BSS[$dfcf]
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