const_value = 1
	const DECO_PLANT
	const DECO_BED
	const DECO_CARPET
	const DECO_POSTER
	const DECO_DOLL
	const DECO_BIGDOLL

const_value = 1
	const PUT_IT_AWAY
	const MAGNAPLANT
	const TROPICPLANT
	const JUMBOPLANT
	const TOWN_MAP_D
	const FAMICOM
	const SUPER_NES
	const NINTENDO_64
	const VIRTUAL_BOY
	const GOLD_TROPHY
	const SILVER_TROPHY
	const SURF_PIKA_DOLL
	const _BED
	const _CARPET
	const _POSTER
	const _DOLL
	const BIG_
	const FEATHERY_BED
	const PIKACHU_BED
	const PINK_BED
	const POLKADOT_BED
	const RED_CARPET
	const BLUE_CARPET
	const YELLOW_CARPET
	const GREEN_CARPET

const_value = 1
	const SET_UP_BED
	const PUT_AWAY_BED
	const SET_UP_CARPET
	const PUT_AWAY_CARPET
	const SET_UP_PLANT
	const PUT_AWAY_PLANT
	const SET_UP_POSTER
	const PUT_AWAY_POSTER
	const SET_UP_CONSOLE
	const PUT_AWAY_CONSOLE
	const SET_UP_BIG_DOLL
	const PUT_AWAY_BIG_DOLL
	const SET_UP_DOLL
	const PUT_AWAY_DOLL
	const SET_UP_ORNAMENT
	const PUT_AWAY_ORNAMENT

deco: MACRO
	const DECO_\1
	enum DECOFLAG_\1
endm

const_value = 1
__enum__ = 0
	const BEDS
	deco  FEATHERY_BED ; 2 (0)
	deco  PINK_BED ; 3 (1)
	deco  POLKADOT_BED ; 4 (2)
	deco  PIKACHU_BED ; 5 (3)

	const CARPETS
	deco  RED_CARPET ; 7 (4)
	deco  BLUE_CARPET ; 8 (5)
	deco  YELLOW_CARPET ; 9 (6)
	deco  GREEN_CARPET ; a (7)

	const PLANTS
	deco  MAGNAPLANT ; c (8)
	deco  TROPICPLANT ; d (9)
	deco  JUMBOPLANT ; e (a)

	const POSTERS
	deco  TOWN_MAP ; 10 (b)
	deco  PIKACHU_POSTER ; 11 (c)
	deco  CLEFAIRY_POSTER ; 12 (d)
	deco  JIGGLYPUFF_POSTER ; 13(e)

	const CONSOLES
	deco  FAMICOM ; 15 (f)
	deco  SNES ; 16 (10)
	deco  N64 ; 17 (11)
	deco  VIRTUAL_BOY ; 18 (12)

	const BIG_DOLLS
	deco  BIG_SNORLAX_DOLL ; 1a (13)
	deco  BIG_ONIX_DOLL ; 1b (14)
	deco  BIG_LAPRAS_DOLL ; 1c (15)

	const DOLLS
	deco  PIKACHU_DOLL ; 1e (16)
	deco  SURF_PIKACHU_DOLL ; 1f (17)
	deco  CLEFAIRY_DOLL ; 20 (18)
	deco  JIGGLYPUFF_DOLL ; 21 (19)
	deco  BULBASAUR_DOLL ; 22 (1a)
	deco  CHARMANDER_DOLL ; 23 (1b)
	deco  SQUIRTLE_DOLL ; 24 (1c)
	deco  POLIWAG_DOLL ; 25 (1d)
	deco  DIGLETT_DOLL ; 26 (1e)
	deco  STARMIE_DOLL ; 27 (1f)
	deco  MAGIKARP_DOLL ; 28 (20)
	deco  ODDISH_DOLL ; 29 (21)
	deco  GENGAR_DOLL ; 2a (22)
	deco  SHELLDER_DOLL ; 2b (23)
	deco  GRIMER_DOLL ; 2c (24)
	deco  VOLTORB_DOLL ; 2d (25)
	deco  WEEDLE_DOLL ; 2e (26)
	deco  UNOWN_DOLL ; 2f (27)
	deco  GEODUDE_DOLL ; 30 (28)
	deco  MACHOP_DOLL ; 31 (29)
	deco  TENTACOOL_DOLL ; 32 (2a)
	deco  GOLD_TROPHY_DOLL ; 33 (2b)
	deco  SILVER_TROPHY_DOLL ; 34 (2c)

NUM_NON_TROPHY_DECOS EQU $2b
NUM_DECOS EQU $2d
