; growth rate
	const_def
	const MEDIUM_FAST
	const SLIGHTLY_FAST
	const SLIGHTLY_SLOW
	const MEDIUM_SLOW
	const SLOW
	const FAST

; egg group constants
const_value SET 1
	const MONSTER
	const AMPHIBIAN
	const INSECT
	const AVIAN
	const FIELD
	const FAIRY
	const PLANT
	const HUMANSHAPE
	const INVERTEBRATE
	const INANIMATE
	const AMORPHOUS
	const FISH
	const LADIES_MAN
	const REPTILE
	const NO_EGGS


; menu sprites
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


; evolution types
const_value SET 1
	const EVOLVE_LEVEL
	const EVOLVE_ITEM
	const EVOLVE_TRADE
	const EVOLVE_HAPPINESS
	const EVOLVE_STAT


BASE_HAPPINESS        EQU 70
FRIEND_BALL_HAPPINESS EQU 200

; happiness evolution triggers
HAPPINESS_TO_EVOLVE EQU 220
const_value SET 1
	const TR_ANYTIME
	const TR_MORNDAY
	const TR_NITE


; stat evolution triggers
const_value SET 1
	const ATK_GT_DEF
	const ATK_LT_DEF
	const ATK_EQ_DEF
