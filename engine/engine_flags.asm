; All locations are in WRAM bank 1.

	; location, bit

	; pokegear
	dwb $d957, %00000010 ; radio card       ; $0
	dwb $d957, %00000001 ; map card
	dwb $d957, %00000100 ; phone card
	dwb $d957, %00001000 ; expn card
	dwb $d957, %10000000 ; on/off
	
	;   DaycareMan, %10000000 ; daycare 1 on
	dwb DaycareMan, %01000000 ; monster 1 and 2 are compatible
	;   DaycareMan, %00100000 ; egg is ready
	dwb DaycareMan, %00000001 ; monster 1 in daycare
	
	;   DaycareLady, %10000000 = daycare 2 on
	dwb DaycareLady, %00000001 ; monster 2 in daycare
	
	dwb $d854, %00000001 ; mom saving money ; $8
	dwb $d854, %10000000 ; dst
	
	dwb $dc39, %00000001
	
	dwb $d84c, %00000001 ; pokedex
	dwb $d84c, %00000010 ; unown dex
	dwb $d84c, %00001000 ; pokerus
	dwb $d84c, %00010000 ; rocket signal on ch20
	dwb $d84c, %01000000 ; credits skip
	dwb $d84c, %10000000 ; bug contest on   ; $10
	dwb $d84d, %00000100 ; bug contest timer
	dwb $d84d, %00000010 ; rockets in radio tower
	dwb $d84d, %00000001 ; bike shop call enabled (1024 bike steps reqd)
	dwb $d84d, %00010000
	dwb $d84d, %00100000 ; give pokerus; berry -> berry juice when trading?
	dwb $d84d, %01000000
	dwb $d84d, %10000000 ; rockets in mahogany
	
	dwb $dbf5, %00000001 ; strength active  ; $18
	dwb $dbf5, %00000010 ; always on bike (cant surf)
	dwb $dbf5, %00000100 ; downhill (cycling road)
	
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
	
	dwb $dc9d, %00000001 ; lucky number show
	dwb $d84d, %00001000
	
	dwb $dc1e, %00000001 ; kurt making balls  ; $50
	dwb $dc1e, %00000010
	dwb $dc1e, %00000100 ; special wilddata?
	dwb $dc1e, %00001000 ; time capsule (24h wait)
	dwb $dc1e, %00010000 ; all fruit trees
	dwb $dc1e, %00100000 ; shuckle given
	dwb $dc1e, %01000000 ; goldenrod underground merchant closed
	dwb $dc1e, %10000000 ; fought in trainer hall today
	
	dwb $dc1f, %00000001 ; mt moon square clefairy  ; $58
	dwb $dc1f, %00000010 ; union cave lapras
	dwb $dc1f, %00000100 ; goldenrod underground haircut used
	dwb $dc1f, %00001000 ; goldenrod mall happiness event floor05 person07
	dwb $dc1f, %00010000 ; tea in blues house
	dwb $dc1f, %00100000 ; indigo plateau rival fight
	dwb $dc1f, %01000000
	dwb $dc1f, %10000000
	
	dwb $dc20, %00000001 ; $60
	dwb $dc20, %00000010 ; goldenrod dept store sale is on
	
	dwb $cfbc, %10000000 ; $62
	
	dwb PlayerGender, %00000001 ; player is female
	
	dwb $dbf3, %00000100 ; have gs ball after kurt examined it
	
	; rematches
	dwb $dc4c, %00000001 ; jack
	dwb $dc4c, %00000010 ; huey
	dwb $dc4c, %00000100 ; gaven
	dwb $dc4c, %00001000 ; beth  ; $68
	dwb $dc4c, %00010000 ; jose
	dwb $dc4c, %00100000 ; reena
	dwb $dc4c, %01000000 ; joey
	dwb $dc4c, %10000000 ; wade
	dwb $dc4d, %00000001 ; ralph
	dwb $dc4d, %00000010 ; liz
	dwb $dc4d, %00000100 ; anthony
	dwb $dc4d, %00001000 ; todd  ; $70
	dwb $dc4d, %00010000 ; gina
	dwb $dc4d, %00100000 ; arnie
	dwb $dc4d, %01000000 ; alan
	dwb $dc4d, %10000000 ; dana
	dwb $dc4e, %00000001 ; chad
	dwb $dc4e, %00000010 ; tully
	dwb $dc4e, %00000100 ; brent
	dwb $dc4e, %00001000 ; tiffany  ; $78
	dwb $dc4e, %00010000 ; vance
	dwb $dc4e, %00100000 ; wilton
	dwb $dc4e, %01000000 ; parry
	dwb $dc4e, %10000000 ; erin
	
	dwb $dc50, %00000001 ; beverly has nugget
	dwb $dc50, %00000010 ; jose has star piece
	dwb $dc50, %00000100 ; wade has item (see bittable1 $032b-e)
	dwb $dc50, %00001000 ; gina has leaf stone  ; $80
	dwb $dc50, %00010000 ; alan has fire stone
	dwb $dc50, %00100000 ; liz has thunderstone
	dwb $dc50, %01000000 ; derek has nugget
	dwb $dc50, %10000000 ; tully has water stone
	
	dwb $dc51, %00000001 ; tiffany has pink bow
	dwb $dc51, %00000010 ; wilton has item (see bittable1 $032f-31)
	
	dwb $dc54, %00000001
	dwb $dc54, %00000010  ; $88
	dwb $dc54, %00000100
	dwb $dc54, %00001000
	dwb $dc54, %00010000
	dwb $dc54, %00100000
	dwb $dc54, %01000000
	dwb $dc54, %10000000
	
	dwb $dc55, %00000001
	dwb $dc55, %00000010  ; $90
	dwb $dc55, %00000100
	dwb $dc55, %00001000
	dwb $dc55, %00010000
	dwb $dc55, %00100000
	dwb $dc55, %01000000
	dwb $dc55, %10000000
	
	dwb $dc56, %00000001
	dwb $dc56, %00000010  ; $98
	dwb $dc56, %00000100
	dwb $dc56, %00001000
	dwb $dc56, %00010000
	dwb $dc56, %00100000
	dwb $dc56, %01000000
	dwb $dc56, %10000000
	
	dwb $d45b, %00000100 ; female player has been transformed into male
	
	dwb $dc20, %00000100 ; dunsparce swarm   ; $a0
	dwb $dc20, %00001000 ; yanma swarm
