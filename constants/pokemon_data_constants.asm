; BaseGrowthRate values
; GrowthRates indexes (see main.asm)
	const_def
	const MEDIUM_FAST
	const SLIGHTLY_FAST
	const SLIGHTLY_SLOW
	const MEDIUM_SLOW
	const FAST
	const SLOW

; BaseEggGroups values
const_value SET 1
	const MONSTER      ; 1
	const AMPHIBIAN    ; 2
	const INSECT       ; 3
	const AVIAN        ; 4
	const FIELD        ; 5
	const FAIRY        ; 6
	const PLANT        ; 7
	const HUMANSHAPE   ; 8
	const INVERTEBRATE ; 9
	const INANIMATE    ; a
	const AMORPHOUS    ; b
	const FISH         ; c
	const LADIES_MAN   ; d
	const REPTILE      ; e
	const NO_EGGS      ; f


; IconPointers indexes (see menu/mon_icons.asm)
const_value SET 1
	const ICON_POLIWAG
	const ICON_JIGGLYPUFF
	const ICON_DIGLETT
	const ICON_PIKACHU
	const ICON_STARYU
	const ICON_FISH
	const ICON_BIRD
	const ICON_MONSTER
	const ICON_CLEFAIRY
	const ICON_ODDISH
	const ICON_BUG
	const ICON_GHOST
	const ICON_LAPRAS
	const ICON_HUMANSHAPE
	const ICON_FOX
	const ICON_EQUINE
	const ICON_SHELL
	const ICON_BLOB
	const ICON_SERPENT
	const ICON_VOLTORB
	const ICON_SQUIRTLE
	const ICON_BULBASAUR
	const ICON_CHARMANDER
	const ICON_CATERPILLAR
	const ICON_UNOWN
	const ICON_GEODUDE
	const ICON_FIGHTER
	const ICON_EGG
	const ICON_JELLYFISH
	const ICON_MOTH
	const ICON_BAT
	const ICON_SNORLAX
	const ICON_HO_OH
	const ICON_LUGIA
	const ICON_GYARADOS
	const ICON_SLOWPOKE
	const ICON_SUDOWOODO
	const ICON_BIGMON


; evolution types (used in data/evos_attacks.asm)
const_value SET 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT

; EVOLVE_HAPPINESS triggers
const_value SET 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE

; EVOLVE_STAT triggers
const_value SET 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF


; significant happiness values
BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200
HAPPINESS_TO_EVOLVE   EQU 220


NUM_GRASSMON EQU 7 ; data/wild/*_grass.asm table size
NUM_WATERMON EQU 3 ; data/wild/*_water.asm table size

GRASS_WILDDATA_LENGTH EQU (NUM_GRASSMON * 2 + 1) * 3 + 2
WATER_WILDDATA_LENGTH EQU (NUM_WATERMON * 2 + 1) * 1 + 2


; swarms

SWARM_DUNSPARCE EQU 0
SWARM_YANMA     EQU 1

FISHSWARM_QWILFISH EQU 1
FISHSWARM_REMORAID EQU 2
