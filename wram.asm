SECTION "BoxNames",BSS[$db75]
; 8 chars + $50
Box1Name: ; 0xdb75
ds 9;
Box2Name: ; 0xdbce
ds 9;
Box3Name: ; 0xdbd7
ds 9;
Box4Name: ; 0xdbe0
ds 9;
Box5Name: ; 0xdbe9
ds 9;
Box6Name: ; 0xdbf2
ds 9;
Box7Name: ; 0xdbfb
ds 9;
Box8Name: ; 0xdc04
ds 9;
Box9Name: ; 0xdc0d
ds 9;
Box10Name: ; 0xdc16
ds 9;
Box11Name: ; 0xdc1f
ds 9;
Box12Name: ; 0xdb28
ds 9;
Box13Name: ; 0xdb31
ds 9;
Box14Name: ; 0xdb3a
ds 9;


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