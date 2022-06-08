; decoration attributes
rsreset
DEF DECOATTR_TYPE       rb
DEF DECOATTR_NAME       rb
DEF DECOATTR_ACTION     rb
DEF DECOATTR_EVENT_FLAG rw
DEF DECOATTR_SPRITE     rb
DEF DECOATTR_STRUCT_LENGTH EQU _RS

; decoration types
	const_def 1
	const DECO_PLANT
	const DECO_BED
	const DECO_CARPET
	const DECO_POSTER
	const DECO_DOLL
	const DECO_BIGDOLL
DEF NUM_DECO_TYPES EQU const_value - 1

; DecorationNames indexes (see data/decorations/names.asm)
	const_def
	const CANCEL_DECO
	const PUT_IT_AWAY
	const MAGNAPLANT
	const TROPICPLANT
	const JUMBOPLANT
	const TOWN_MAP_POSTER
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
DEF NUM_DECO_NAMES EQU const_value

; DoDecorationAction2.DecoActions indexes (see engine/overworld/decorations.asm)
	const_def 1
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
DEF NUM_DECO_ACTIONS EQU const_value - 1

DEF __deco_value__ = 0

MACRO deco
	const DECO_\1
	DEF DECOFLAG_\1 EQU __deco_value__
	DEF __deco_value__ += 1
ENDM

; decorations:
; - DecorationAttributes (see data/decorations/attributes.asm)
; - DecorationIDs (see data/decorations/decorations.asm)
	const_def 1
; FindOwnedBeds.beds values (see engine/overworld/decorations.asm)
	const BEDS
	deco  FEATHERY_BED
	deco  PINK_BED
	deco  POLKADOT_BED
	deco  PIKACHU_BED
; FindOwnedCarpets.carpets values (see engine/overworld/decorations.asm)
	const CARPETS
	deco  RED_CARPET
	deco  BLUE_CARPET
	deco  YELLOW_CARPET
	deco  GREEN_CARPET
; FindOwnedPlants.plants values (see engine/overworld/decorations.asm)
	const PLANTS
	deco  MAGNAPLANT
	deco  TROPICPLANT
	deco  JUMBOPLANT
; FindOwnedPosters.posters values (see engine/overworld/decorations.asm)
	const POSTERS
	deco  TOWN_MAP
	deco  PIKACHU_POSTER
	deco  CLEFAIRY_POSTER
	deco  JIGGLYPUFF_POSTER
; FindOwnedConsoles.consoles values (see engine/overworld/decorations.asm)
	const CONSOLES
	deco  FAMICOM
	deco  SNES
	deco  N64
	deco  VIRTUAL_BOY
; FindOwnedBigDolls.big_dolls values (see engine/overworld/decorations.asm)
	const BIG_DOLLS
	deco  BIG_SNORLAX_DOLL
	deco  BIG_ONIX_DOLL
	deco  BIG_LAPRAS_DOLL
; FindOwnedOrnaments.ornaments values (see engine/overworld/decorations.asm)
	const DOLLS
	deco  PIKACHU_DOLL
	deco  SURF_PIKACHU_DOLL
	deco  CLEFAIRY_DOLL
	deco  JIGGLYPUFF_DOLL
	deco  BULBASAUR_DOLL
	deco  CHARMANDER_DOLL
	deco  SQUIRTLE_DOLL
	deco  POLIWAG_DOLL
	deco  DIGLETT_DOLL
	deco  STARMIE_DOLL
	deco  MAGIKARP_DOLL
	deco  ODDISH_DOLL
	deco  GENGAR_DOLL
	deco  SHELLDER_DOLL
	deco  GRIMER_DOLL
	deco  VOLTORB_DOLL
	deco  WEEDLE_DOLL
	deco  UNOWN_DOLL
	deco  GEODUDE_DOLL
	deco  MACHOP_DOLL
	deco  TENTACOOL_DOLL
DEF NUM_NON_TROPHY_DECOS EQU __deco_value__
	deco  GOLD_TROPHY_DOLL
	deco  SILVER_TROPHY_DOLL
DEF NUM_DECOS EQU __deco_value__
DEF NUM_DECO_CATEGORIES EQU const_value - 1 - NUM_DECOS
