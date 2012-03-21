SECTION "PlayerTeam",BSS[$dcd7]

TeamCount: ; 0xdcd7
	ds 1 ; number of Pokémon in party
TeamSpecies: ; 0xdcd8
	ds 6 ; species of each Pokémon in party
; 0xdcde
; XXX what is this
	ds 1

TeamMon1:
TeamMon1Species: ; 0xdcdf
	ds 1
TeamMon1Item: ; 0xdce0
	ds 1
TeamMon1Moves: ; 0xdce1
	ds 4
TeamMon1ID: ; 0xdce5
	ds 2
TeamMon1Exp: ; 0xdce7
	ds 3
TeamMon1HPExp: ; 0xdcea
	ds 2
TeamMon1AtkExp: ; 0xdcec
	ds 2
TeamMon1DefExp: ; 0xdcee
	ds 2
TeamMon1SpdExp: ; 0xdcf0
	ds 2
TeamMon1SpclExp: ; 0xdcf2
	ds 2
TeamMon1DVs: ; 0xdcf4
	ds 2 ; Atk/Def/Spd/Spcl, HP is the high bits of these four nybbles
TeamMon1PP: ; 0xdcf6
	ds 4
TeamMon1Happiness: ; 0xdcfa
	ds 1
TeamMon1PokerusStatus: ; 0xdcfb
	ds 1
TeamMon1SeerModifier: ; 0xdcfc
	ds 2
TeamMon1Level: ; 0xdcfe
	ds 1
TeamMon1Status: ; 0xdcff
	ds 1

; 0xdd00
; XXX what is this
	ds 1

TeamMon1CurHP: ; 0xdd01
	ds 2
TeamMon1MaxHP: ; 0xdd03
	ds 2
TeamMon1Atk: ; 0xdd05
	ds 2
TeamMon1Def: ; 0xdd07
	ds 2
TeamMon1Spd: ; 0xdd09
	ds 2
TeamMon1SpclAtk: ; 0xdd0b
	ds 2
TeamMon1SpclDef: ; 0xdd0d
	ds 2

TeamMon2: ; 0xdd00
	ds 5 * (TeamMon2 - TeamMon1)
