; All locations are in WRAM bank 1.

	; location, bit

	; pokegear
	dwb wPokegearFlags, %00000010 ; radio card       ; $0
	dwb wPokegearFlags, %00000001 ; map card
	dwb wPokegearFlags, %00000100 ; phone card
	dwb wPokegearFlags, %00001000 ; expn card
	dwb wPokegearFlags, %10000000 ; on/off

	;   wDaycareMan, %10000000 ; daycare 1 on
	dwb wDaycareMan, %01000000 ; monster 1 and 2 are compatible
	;   wDaycareMan, %00100000 ; egg is ready
	dwb wDaycareMan, %00000001 ; monster 1 in daycare

	;   wDaycareLady, %10000000 = daycare 2 on
	dwb wDaycareLady, %00000001 ; monster 2 in daycare

	dwb wMomSavingMoney, %00000001 ; mom saving money ; $8
	dwb wMomSavingMoney, %10000000 ; dst

	dwb wdc39, %00000001

	dwb StatusFlags, %00000001 ; pokedex
	dwb StatusFlags, %00000010 ; unown dex
	dwb StatusFlags, %00001000 ; pokerus
	dwb StatusFlags, %00010000 ; rocket signal on ch20
	dwb StatusFlags, %01000000 ; credits skip
	dwb StatusFlags, %10000000 ; bug contest on   ; $10
	dwb StatusFlags2, %00000100 ; bug contest timer
	dwb StatusFlags2, %00000010 ; rockets in radio tower
	dwb StatusFlags2, %00000001 ; bike shop call enabled (1024 bike steps reqd)
	dwb StatusFlags2, %00010000
	dwb StatusFlags2, %00100000 ; give pokerus; berry -> berry juice when trading?
	dwb StatusFlags2, %01000000
	dwb StatusFlags2, %10000000 ; rockets in mahogany

	dwb BikeFlags, %00000001 ; strength active  ; $18
	dwb BikeFlags, %00000010 ; always on bike (cant surf)
	dwb BikeFlags, %00000100 ; downhill (cycling road)

	dwb JohtoBadges, %00000001 ; zephyrbadge
	dwb JohtoBadges, %00000010 ; hivebadge
	dwb JohtoBadges, %00000100 ; plainbadge
	dwb JohtoBadges, %00001000 ; fogbadge
	dwb JohtoBadges, %00010000 ; mineralbadge
	dwb JohtoBadges, %00100000 ; stormbadge ; $20
	dwb JohtoBadges, %01000000 ; glacierbadge
	dwb JohtoBadges, %10000000 ; risingbadge

	dwb KantoBadges, %00000001 ; boulderbadge
	dwb KantoBadges, %00000010 ; cascadebadge
	dwb KantoBadges, %00000100 ; thunderbadge
	dwb KantoBadges, %00001000 ; rainbowbadge
	dwb KantoBadges, %00010000 ; soulbadge
	dwb KantoBadges, %00100000 ; marshbadge ; $28
	dwb KantoBadges, %01000000 ; volcanobadge
	dwb KantoBadges, %10000000 ; earthbadge

	; unown sets
	dwb UnlockedUnowns, %00000001 ; 1
	dwb UnlockedUnowns, %00000010 ; 2
	dwb UnlockedUnowns, %00000100 ; 3
	dwb UnlockedUnowns, %00001000 ; 4
	dwb UnlockedUnowns, %00010000 ; 5
	dwb UnlockedUnowns, %00100000 ; 6       ; $30
	dwb UnlockedUnowns, %01000000 ; 7
	dwb UnlockedUnowns, %10000000 ; 8

	; fly
	dwb VisitedSpawns, %00000001 ; your house
	dwb VisitedSpawns, %00000010 ; viridian pokecenter
	dwb VisitedSpawns, %00000100 ; pallet
	dwb VisitedSpawns, %00001000 ; viridian
	dwb VisitedSpawns, %00010000 ; pewter
	dwb VisitedSpawns, %00100000 ; cerulean ; $38
	dwb VisitedSpawns, %01000000 ; rock tunnel
	dwb VisitedSpawns, %10000000 ; vermilion
	dwb VisitedSpawns + 1, %00000001 ; lavender
	dwb VisitedSpawns + 1, %00000010 ; saffron
	dwb VisitedSpawns + 1, %00000100 ; celadon
	dwb VisitedSpawns + 1, %00001000 ; fuchsia
	dwb VisitedSpawns + 1, %00010000 ; cinnabar
	dwb VisitedSpawns + 1, %00100000 ; indigo plateau ; $40
	dwb VisitedSpawns + 1, %01000000 ; new bark
	dwb VisitedSpawns + 1, %10000000 ; cherrygrove
	dwb VisitedSpawns + 2, %00000001 ; violet
	dwb VisitedSpawns + 2, %00000100 ; azalea
	dwb VisitedSpawns + 2, %00001000 ; cianwood
	dwb VisitedSpawns + 2, %00010000 ; goldenrod
	dwb VisitedSpawns + 2, %00100000 ; olivine
	dwb VisitedSpawns + 2, %01000000 ; ecruteak  ; $48
	dwb VisitedSpawns + 2, %10000000 ; mahogany
	dwb VisitedSpawns + 3, %00000001 ; lake of rage
	dwb VisitedSpawns + 3, %00000010 ; blackthorn
	dwb VisitedSpawns + 3, %00000100 ; silver cave
	dwb VisitedSpawns + 3, %00010000 ; unused

	dwb wdc9d, %00000001 ; lucky number show
	dwb StatusFlags2, %00001000

	dwb DailyFlags, %00000001 ; kurt making balls  ; $50
	dwb DailyFlags, %00000010
	dwb DailyFlags, %00000100 ; special wilddata?
	dwb DailyFlags, %00001000 ; time capsule (24h wait)
	dwb DailyFlags, %00010000 ; all fruit trees
	dwb DailyFlags, %00100000 ; shuckle given
	dwb DailyFlags, %01000000 ; goldenrod underground merchant closed
	dwb DailyFlags, %10000000 ; fought in trainer hall today

	dwb WeeklyFlags, %00000001 ; mt moon square clefairy  ; $58
	dwb WeeklyFlags, %00000010 ; union cave lapras
	dwb WeeklyFlags, %00000100 ; goldenrod underground haircut used
	dwb WeeklyFlags, %00001000 ; goldenrod mall happiness event floor05 person07
	dwb WeeklyFlags, %00010000 ; tea in blues house
	dwb WeeklyFlags, %00100000 ; indigo plateau rival fight
	dwb WeeklyFlags, %01000000
	dwb WeeklyFlags, %10000000

	dwb SwarmFlags, %00000001 ; $60
	dwb SwarmFlags, %00000010 ; goldenrod dept store sale is on

	dwb GameTimerPause, %10000000 ; $62

	dwb PlayerGender, %00000001 ; player is female

	dwb wdbf3, %00000100 ; have gs ball after kurt examined it

	; rematches
	dwb wdc4c, %00000001 ; jack
	dwb wdc4c, %00000010 ; huey
	dwb wdc4c, %00000100 ; gaven
	dwb wdc4c, %00001000 ; beth  ; $68
	dwb wdc4c, %00010000 ; jose
	dwb wdc4c, %00100000 ; reena
	dwb wdc4c, %01000000 ; joey
	dwb wdc4c, %10000000 ; wade
	dwb wdc4c + 1, %00000001 ; ralph
	dwb wdc4c + 1, %00000010 ; liz
	dwb wdc4c + 1, %00000100 ; anthony
	dwb wdc4c + 1, %00001000 ; todd  ; $70
	dwb wdc4c + 1, %00010000 ; gina
	dwb wdc4c + 1, %00100000 ; arnie
	dwb wdc4c + 1, %01000000 ; alan
	dwb wdc4c + 1, %10000000 ; dana
	dwb wdc4c + 2, %00000001 ; chad
	dwb wdc4c + 2, %00000010 ; tully
	dwb wdc4c + 2, %00000100 ; brent
	dwb wdc4c + 2, %00001000 ; tiffany  ; $78
	dwb wdc4c + 2, %00010000 ; vance
	dwb wdc4c + 2, %00100000 ; wilton
	dwb wdc4c + 2, %01000000 ; parry
	dwb wdc4c + 2, %10000000 ; erin

	dwb wdc50, %00000001 ; beverly has nugget
	dwb wdc50, %00000010 ; jose has star piece
	dwb wdc50, %00000100 ; wade has item (see bittable1 $032b-e)
	dwb wdc50, %00001000 ; gina has leaf stone  ; $80
	dwb wdc50, %00010000 ; alan has fire stone
	dwb wdc50, %00100000 ; liz has thunderstone
	dwb wdc50, %01000000 ; derek has nugget
	dwb wdc50, %10000000 ; tully has water stone

	dwb wdc50 + 1, %00000001 ; tiffany has pink bow
	dwb wdc50 + 1, %00000010 ; wilton has item (see bittable1 $032f-31)

	dwb wdc54, %00000001
	dwb wdc54, %00000010  ; $88
	dwb wdc54, %00000100
	dwb wdc54, %00001000
	dwb wdc54, %00010000
	dwb wdc54, %00100000
	dwb wdc54, %01000000
	dwb wdc54, %10000000

	dwb wdc54 + 1, %00000001
	dwb wdc54 + 1, %00000010  ; $90
	dwb wdc54 + 1, %00000100
	dwb wdc54 + 1, %00001000
	dwb wdc54 + 1, %00010000
	dwb wdc54 + 1, %00100000
	dwb wdc54 + 1, %01000000
	dwb wdc54 + 1, %10000000

	dwb wdc54 + 2, %00000001
	dwb wdc54 + 2, %00000010  ; $98
	dwb wdc54 + 2, %00000100
	dwb wdc54 + 2, %00001000
	dwb wdc54 + 2, %00010000
	dwb wdc54 + 2, %00100000
	dwb wdc54 + 2, %01000000
	dwb wdc54 + 2, %10000000

	dwb wd45b, %00000100 ; female player has been transformed into male

	dwb SwarmFlags, %00000100 ; dunsparce swarm   ; $a0
	dwb SwarmFlags, %00001000 ; yanma swarm
