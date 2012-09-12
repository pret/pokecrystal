SECTION "linkbattle",BSS[$c2dc]

InLinkBattle: ; 0xc2dc
	ds 1 ; nonzero when in a link battle

SECTION "BattleMons",BSS[$c62a]

BattleMonSpecies: ; c62a
	ds 1
	ds 1
BattleMonSpecies2: ; c62c
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

SECTION "EnemyMon",BSS[$d204]

EnemyMonSpecies: ; d204
	ds 1
	ds 1
EnemyMonSpecies2: ; d206
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
	
EnemyMonHP: ; d216
	ds 2
EnemyMonMaxHP: ; d218
	ds 2

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

SECTION "OtherTrainerClass",BSS[$d22f]

OtherTrainerClass: ; 0xd22f
; class (Youngster, Bug Catcher, etc.) of opposing trainer
; 0 if opponent is a wild Pokémon, not a trainer
	ds 1

Wramd230: ; 0xd230
; XXX what is this for
	ds 1

OtherTrainerID: ; 0xd231
; which trainer of the class that you're fighting
; (Joey, Mikey, Albert, etc.)
	ds 1

SECTION "Timeofday",BSS[$d269]

TimeOfDay: ; 0xd269
; 0 if morn
; 1 if day
; 2 if nite
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
PlayerID: ; 0xd47b
	ds 2
PlayerName: ; 0xd47d
	ds 11

PlayerSprite: ; 0xd4d8
	ds 1

SECTION "Misc",BSS[$d857]
Money: ; d84e
	ds 3

Badges: ; d857
	ds 2
	
SECTION "Items",BSS[$d8bd]
TMsHMs: ; d859
	ds 57

NumItems: ; d892
	ds 1
Items: ; d893
	ds 69

NumKeyItems: ; d88c
	ds 1
KeyItems: ; d88d
	ds 13
	
NumBalls: ; d8d7
	ds 1
Balls: ; d8d8
	ds 25

SECTION "scriptram",BSS[$d962]
MooMooBerries: ; 0xd962
	ds 1 ; how many berries fed to MooMoo
UndergroundSwitchPositions: ; 0xd963
	ds 1 ; which positions the switches are in
FarfetchdPosition: ; 0xd964
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
Box1Name: ; 0xdb75
	ds 9
Box2Name: ; 0xdbce
	ds 9
Box3Name: ; 0xdbd7
	ds 9
Box4Name: ; 0xdbe0
	ds 9
Box5Name: ; 0xdbe9
	ds 9
Box6Name: ; 0xdbf2
	ds 9
Box7Name: ; 0xdbfb
	ds 9
Box8Name: ; 0xdc04
	ds 9
Box9Name: ; 0xdc0d
	ds 9
Box10Name: ; 0xdc16
	ds 9
Box11Name: ; 0xdc1f
	ds 9
Box12Name: ; 0xdb28
	ds 9
Box13Name: ; 0xdb31
	ds 9
Box14Name: ; 0xdb3a
	ds 9

SECTION "BackupMapInfo", BSS[$dcad]

; used on maps like second floor pokécenter, which are reused, so we know which
; map to return to
BackupMapGroup: ; 0xdcad
	ds 1
BackupMapNumber: ; 0xdcae
	ds 1

SECTION "PlayerMapInfo", BSS[$dcb4]

WarpNumber: ; 0xdcb4
	ds 1
MapGroup: ; 0xdcb5
	ds 1 ; map group of current map
MapNumber: ; 0xdcb6
	ds 1 ; map number of current map
YCoord: ; 0xdcb7
	ds 1 ; current y coordinate relative to top-left corner of current map
XCoord: ; 0xdcb8
	ds 1 ; current x coordinate relative to top-left corner of current map

SECTION "PlayerParty",BSS[$dcd7]

PartyCount: ; 0xdcd7
	ds 1 ; number of Pokémon in party
PartySpecies: ; 0xdcd8
	ds 6 ; species of each Pokémon in party
; 0xdcde
	ds 1 ; any empty slots including the 7th must be FF
	     ; or the routine will keep going
		 
		 
PartyMon1:
PartyMon1Species: ; 0xdcdf
	ds 1
PartyMon1Item: ; 0xdce0
	ds 1
PartyMon1Moves: ; 0xdce1
PartyMon1Move1: ; 0xdce1
	ds 1
PartyMon1Move2: ; 0xdce2
	ds 1
PartyMon1Move3: ; 0xdce3
	ds 1
PartyMon1Move4: ; 0xdce4
	ds 1
PartyMon1ID: ; 0xdce5
	ds 2
PartyMon1Exp: ; 0xdce7
	ds 3
PartyMon1HPExp: ; 0xdcea
	ds 2
PartyMon1AtkExp: ; 0xdcec
	ds 2
PartyMon1DefExp: ; 0xdcee
	ds 2
PartyMon1SpdExp: ; 0xdcf0
	ds 2
PartyMon1SpclExp: ; 0xdcf2
	ds 2
PartyMon1DVs: ; 0xdcf4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon1PP: ; 0xdcf6
	ds 4
PartyMon1Happiness: ; 0xdcfa
	ds 1
PartyMon1PokerusStatus: ; 0xdcfb
	ds 1
PartyMon1CaughtData: ; 0xdcfc
PartyMon1CaughtTime: ; 0xdcfc
PartyMon1CaughtLevel ; 0xdcfc
	ds 1
PartyMon1CaughtGender: ; 0xdcfd
PartyMon1CaughtLocation: ; 0xdcfd
	ds 1
PartyMon1Level: ; 0xdcfe
	ds 1
PartyMon1Status: ; 0xdcff
	ds 1
; 0xdd00 unused
	ds 1
PartyMon1CurHP: ; 0xdd01
	ds 2
PartyMon1MaxHP: ; 0xdd03
	ds 2
PartyMon1Atk: ; 0xdd05
	ds 2
PartyMon1Def: ; 0xdd07
	ds 2
PartyMon1Spd: ; 0xdd09
	ds 2
PartyMon1SpclAtk: ; 0xdd0b
	ds 2
PartyMon1SpclDef: ; 0xdd0d
	ds 2



PartyMon2: ; 0xdd0f
PartyMon2Species: ; 0xdd0f
	ds 1
PartyMon2Item: ; 0xdd10
	ds 1
PartyMon2Moves: ; 0xdd11
PartyMon2Move1: ; 0xdd11
	ds 1
PartyMon2Move2: ; 0xdd12
	ds 1
PartyMon2Move3: ; 0xdd13
	ds 1
PartyMon2Move4: ; 0xdd14
	ds 1
PartyMon2ID: ; 0xdd15
	ds 2
PartyMon2Exp: ; 0xdd17
	ds 3
PartyMon2HPExp: ; 0xdd1a
	ds 2
PartyMon2AtkExp: ; 0xdd1c
	ds 2
PartyMon2DefExp: ; 0xdd1e
	ds 2
PartyMon2SpdExp: ; 0xdd20
	ds 2
PartyMon2SpclExp: ; 0xdd22
	ds 2
PartyMon2DVs: ; 0xdd24
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon2PP: ; 0xdd26
	ds 4
PartyMon2Happiness: ; 0xdd2a
	ds 1
PartyMon2PokerusStatus: ; 0xdd2b
	ds 1
PartyMon2CaughtData: ; 0xdd2c
PartyMon2CaughtTime: ; 0xdd2c
PartyMon2CaughtLevel ; 0xdd2c
	ds 1
PartyMon2CaughtGender: ; 0xdd2d
PartyMon2CaughtLocation: ; 0xdd2d
	ds 1
PartyMon2Level: ; 0xdd2e
	ds 1
PartyMon2Status: ; 0xdd2f
	ds 1
; 0xdd30 unused
	ds 1
PartyMon2CurHP: ; 0xdd31
	ds 2
PartyMon2MaxHP: ; 0xdd33
	ds 2
PartyMon2Atk: ; 0xdd35
	ds 2
PartyMon2Def: ; 0xdd37
	ds 2
PartyMon2Spd: ; 0xdd39
	ds 2
PartyMon2SpclAtk: ; 0xdd3b
	ds 2
PartyMon2SpclDef: ; 0xdd3d
	ds 2



PartyMon3: ; 0xdd3f
PartyMon3Species: ; 0xdd3f
	ds 1
PartyMon3Item: ; 0xdd40
	ds 1
PartyMon3Moves: ; 0xdd41
PartyMon3Move1: ; 0xdd41
	ds 1
PartyMon3Move2: ; 0xdd42
	ds 1
PartyMon3Move3: ; 0xdd43
	ds 1
PartyMon3Move4: ; 0xdd44
	ds 1
PartyMon3ID: ; 0xdd45
	ds 2
PartyMon3Exp: ; 0xdd47
	ds 3
PartyMon3HPExp: ; 0xdd4a
	ds 2
PartyMon3AtkExp: ; 0xdd4c
	ds 2
PartyMon3DefExp: ; 0xdd4e
	ds 2
PartyMon3SpdExp: ; 0xdd50
	ds 2
PartyMon3SpclExp: ; 0xdd52
	ds 2
PartyMon3DVs: ; 0xdd54
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon3PP: ; 0xdd56
	ds 4
PartyMon3Happiness: ; 0xdd5a
	ds 1
PartyMon3PokerusStatus: ; 0xdd5b
	ds 1
PartyMon3CaughtData: ; 0xdd5c
PartyMon3CaughtTime: ; 0xdd5c
PartyMon3CaughtLevel ; 0xdd5c
	ds 1
PartyMon3CaughtGender: ; 0xdd5d
PartyMon3CaughtLocation: ; 0xdd5d
	ds 1
PartyMon3Level: ; 0xdd5e
	ds 1
PartyMon3Status: ; 0xdd5f
	ds 1
; 0xdd60 unused
	ds 1
PartyMon3CurHP: ; 0xdd61
	ds 2
PartyMon3MaxHP: ; 0xdd63
	ds 2
PartyMon3Atk: ; 0xdd65
	ds 2
PartyMon3Def: ; 0xdd67
	ds 2
PartyMon3Spd: ; 0xdd69
	ds 2
PartyMon3SpclAtk: ; 0xdd6b
	ds 2
PartyMon3SpclDef: ; 0xdd6d
	ds 2



PartyMon4: ; 0xdd6f
PartyMon4Species: ; 0xdd6f
	ds 1
PartyMon4Item: ; 0xdd70
	ds 1
PartyMon4Moves: ; 0xdd71
PartyMon4Move1: ; 0xdd71
	ds 1
PartyMon4Move2: ; 0xdd72
	ds 1
PartyMon4Move3: ; 0xdd73
	ds 1
PartyMon4Move4: ; 0xdd74
	ds 1
PartyMon4ID: ; 0xdd75
	ds 2
PartyMon4Exp: ; 0xdd77
	ds 3
PartyMon4HPExp: ; 0xdd7a
	ds 2
PartyMon4AtkExp: ; 0xdd7c
	ds 2
PartyMon4DefExp: ; 0xdd7e
	ds 2
PartyMon4SpdExp: ; 0xdd80
	ds 2
PartyMon4SpclExp: ; 0xdd82
	ds 2
PartyMon4DVs: ; 0xdd84
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon4PP: ; 0xdd86
	ds 4
PartyMon4Happiness: ; 0xdd8a
	ds 1
PartyMon4PokerusStatus: ; 0xdd8b
	ds 1
PartyMon4CaughtData: ; 0xdd8c
PartyMon4CaughtTime: ; 0xdd8c
PartyMon4CaughtLevel ; 0xdd8c
	ds 1
PartyMon4CaughtGender: ; 0xdd8d
PartyMon4CaughtLocation: ; 0xdd8d
	ds 1
PartyMon4Level: ; 0xdd8e
	ds 1
PartyMon4Status: ; 0xdd8f
	ds 1
; 0xdd90 unused
	ds 1
PartyMon4CurHP: ; 0xdd91
	ds 2
PartyMon4MaxHP: ; 0xdd93
	ds 2
PartyMon4Atk: ; 0xdd95
	ds 2
PartyMon4Def: ; 0xdd97
	ds 2
PartyMon4Spd: ; 0xdd99
	ds 2
PartyMon4SpclAtk: ; 0xdd9b
	ds 2
PartyMon4SpclDef: ; 0xdd9d
	ds 2



PartyMon5: ; 0xdd9f
PartyMon5Species: ; 0xdd9f
	ds 1
PartyMon5Item: ; 0xdda0
	ds 1
PartyMon5Moves: ; 0xdda1
PartyMon5Move1: ; 0xdda1
	ds 1
PartyMon5Move2: ; 0xdda2
	ds 1
PartyMon5Move3: ; 0xdda3
	ds 1
PartyMon5Move4: ; 0xdda4
	ds 1
PartyMon5ID: ; 0xdda5
	ds 2
PartyMon5Exp: ; 0xdda7
	ds 3
PartyMon5HPExp: ; 0xddaa
	ds 2
PartyMon5AtkExp: ; 0xddac
	ds 2
PartyMon5DefExp: ; 0xddae
	ds 2
PartyMon5SpdExp: ; 0xddb0
	ds 2
PartyMon5SpclExp: ; 0xddb2
	ds 2
PartyMon5DVs: ; 0xddb4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon5PP: ; 0xddb6
	ds 4
PartyMon5Happiness: ; 0xddba
	ds 1
PartyMon5PokerusStatus: ; 0xddbb
	ds 1
PartyMon5CaughtData: ; 0xddbc
PartyMon5CaughtTime: ; 0xddbc
PartyMon5CaughtLevel ; 0xddbc
	ds 1
PartyMon5CaughtGender: ; 0xddbd
PartyMon5CaughtLocation: ; 0xddbd
	ds 1
PartyMon5Level: ; 0xddbe
	ds 1
PartyMon5Status: ; 0xddbf
	ds 1
; 0xddc0 unused
	ds 1
PartyMon5CurHP: ; 0xddc1
	ds 2
PartyMon5MaxHP: ; 0xddc3
	ds 2
PartyMon5Atk: ; 0xddc5
	ds 2
PartyMon5Def: ; 0xddc7
	ds 2
PartyMon5Spd: ; 0xddc9
	ds 2
PartyMon5SpclAtk: ; 0xddcb
	ds 2
PartyMon5SpclDef: ; 0xddcd
	ds 2



PartyMon6: ; 0xddcf
PartyMon6Species: ; 0xddcf
	ds 1
PartyMon6Item: ; 0xddd0
	ds 1
PartyMon6Moves: ; 0xddd1
PartyMon6Move1: ; 0xddd1
	ds 1
PartyMon6Move2: ; 0xddd2
	ds 1
PartyMon6Move3: ; 0xddd3
	ds 1
PartyMon6Move4: ; 0xddd4
	ds 1
PartyMon6ID: ; 0xddd5
	ds 2
PartyMon6Exp: ; 0xddd7
	ds 3
PartyMon6HPExp: ; 0xddda
	ds 2
PartyMon6AtkExp: ; 0xdddc
	ds 2
PartyMon6DefExp: ; 0xddde
	ds 2
PartyMon6SpdExp: ; 0xdde0
	ds 2
PartyMon6SpclExp: ; 0xdde2
	ds 2
PartyMon6DVs: ; 0xdde4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
PartyMon6PP: ; 0xdde6
	ds 4
PartyMon6Happiness: ; 0xddea
	ds 1
PartyMon6PokerusStatus: ; 0xddeb
	ds 1
PartyMon6CaughtData: ; 0xddec
PartyMon6CaughtTime: ; 0xddec
PartyMon6CaughtLevel ; 0xddec
	ds 1
PartyMon6CaughtGender: ; 0xdded
PartyMon6CaughtLocation: ; 0xdded
	ds 1
PartyMon6Level: ; 0xddee
	ds 1
PartyMon6Status: ; 0xddef
	ds 1
; 0xddf0 unused
	ds 1
PartyMon6CurHP: ; 0xddf1
	ds 2
PartyMon6MaxHP: ; 0xddf3
	ds 2
PartyMon6Atk: ; 0xddf5
	ds 2
PartyMon6Def: ; 0xddf7
	ds 2
PartyMon6Spd: ; 0xddf9
	ds 2
PartyMon6SpclAtk: ; 0xddfb
	ds 2
PartyMon6SpclDef: ; 0xddfd
	ds 2
	


PartyMon1OT: ; 0xddff
	ds 11
PartyMon2OT: ; 0xde0a
	ds 11
PartyMon3OT: ; 0xde15
	ds 11
PartyMon4OT: ; 0xde20
	ds 11
PartyMon5OT: ; 0xde2b
	ds 11
PartyMon6OT: ; 0xde36
	ds 11

PartyMon1Nickname: ; 0xde41
	ds 11
PartyMon2Nickname: ; 0xde4c
	ds 11
PartyMon3Nickname: ; 0xde57
	ds 11
PartyMon4Nickname: ; 0xde62
	ds 11
PartyMon5Nickname: ; 0xde6d
	ds 11
PartyMon6Nickname: ; 0xde78
	ds 11
