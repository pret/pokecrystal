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

; DecorationIDs indexes (see data/decorations/decorations.asm)
	const_def
	const DECOFLAG_FEATHERY_BED
	const DECOFLAG_PINK_BED
	const DECOFLAG_POLKADOT_BED
	const DECOFLAG_PIKACHU_BED
	const DECOFLAG_RED_CARPET
	const DECOFLAG_BLUE_CARPET
	const DECOFLAG_YELLOW_CARPET
	const DECOFLAG_GREEN_CARPET
	const DECOFLAG_MAGNAPLANT
	const DECOFLAG_TROPICPLANT
	const DECOFLAG_JUMBOPLANT
	const DECOFLAG_TOWN_MAP
	const DECOFLAG_PIKACHU_POSTER
	const DECOFLAG_CLEFAIRY_POSTER
	const DECOFLAG_JIGGLYPUFF_POSTER
	const DECOFLAG_FAMICOM
	const DECOFLAG_SNES
	const DECOFLAG_N64
	const DECOFLAG_VIRTUAL_BOY
	const DECOFLAG_PIKACHU_DOLL
	const DECOFLAG_SURF_PIKACHU_DOLL
	const DECOFLAG_CLEFAIRY_DOLL
	const DECOFLAG_JIGGLYPUFF_DOLL
	const DECOFLAG_BULBASAUR_DOLL
	const DECOFLAG_CHARMANDER_DOLL
	const DECOFLAG_SQUIRTLE_DOLL
	const DECOFLAG_POLIWAG_DOLL
	const DECOFLAG_DIGLETT_DOLL
	const DECOFLAG_STARYU_DOLL
	const DECOFLAG_MAGIKARP_DOLL
	const DECOFLAG_ODDISH_DOLL
	const DECOFLAG_GENGAR_DOLL
	const DECOFLAG_SHELLDER_DOLL
	const DECOFLAG_GRIMER_DOLL
	const DECOFLAG_VOLTORB_DOLL
	const DECOFLAG_WEEDLE_DOLL
	const DECOFLAG_UNOWN_DOLL
	const DECOFLAG_GEODUDE_DOLL
	const DECOFLAG_MACHOP_DOLL
	const DECOFLAG_TENTACOOL_DOLL
	const DECOFLAG_BIG_SNORLAX_DOLL
	const DECOFLAG_BIG_ONIX_DOLL
	const DECOFLAG_BIG_LAPRAS_DOLL
DEF NUM_NON_TROPHY_DECOS EQU const_value
	const DECOFLAG_GOLD_TROPHY_DOLL
	const DECOFLAG_SILVER_TROPHY_DOLL
DEF NUM_DECOS EQU const_value

; decorations:
; - DecorationAttributes (see data/decorations/attributes.asm)
	const_def 1
; FindOwnedBeds.beds values (see engine/overworld/decorations.asm)
	const BEDS
	const DECO_FEATHERY_BED
	const DECO_PINK_BED
	const DECO_POLKADOT_BED
	const DECO_PIKACHU_BED
; FindOwnedCarpets.carpets values (see engine/overworld/decorations.asm)
	const CARPETS
	const DECO_RED_CARPET
	const DECO_BLUE_CARPET
	const DECO_YELLOW_CARPET
	const DECO_GREEN_CARPET
; FindOwnedPlants.plants values (see engine/overworld/decorations.asm)
	const PLANTS
	const DECO_MAGNAPLANT
	const DECO_TROPICPLANT
	const DECO_JUMBOPLANT
; FindOwnedPosters.posters values (see engine/overworld/decorations.asm)
	const POSTERS
	const DECO_TOWN_MAP
	const DECO_PIKACHU_POSTER
	const DECO_CLEFAIRY_POSTER
	const DECO_JIGGLYPUFF_POSTER
; FindOwnedConsoles.consoles values (see engine/overworld/decorations.asm)
	const CONSOLES
	const DECO_FAMICOM
	const DECO_SNES
	const DECO_N64
	const DECO_VIRTUAL_BOY
; FindOwnedBigDolls.big_dolls values (see engine/overworld/decorations.asm)
	const BIG_DOLLS
	const DECO_BIG_SNORLAX_DOLL
	const DECO_BIG_ONIX_DOLL
	const DECO_BIG_LAPRAS_DOLL
; FindOwnedOrnaments.ornaments values (see engine/overworld/decorations.asm)
	const DOLLS
	const DECO_PIKACHU_DOLL
	const DECO_SURF_PIKACHU_DOLL
	const DECO_CLEFAIRY_DOLL
	const DECO_JIGGLYPUFF_DOLL
	const DECO_BULBASAUR_DOLL
	const DECO_CHARMANDER_DOLL
	const DECO_SQUIRTLE_DOLL
	const DECO_POLIWAG_DOLL
	const DECO_DIGLETT_DOLL
	const DECO_STARYU_DOLL
	const DECO_MAGIKARP_DOLL
	const DECO_ODDISH_DOLL
	const DECO_GENGAR_DOLL
	const DECO_SHELLDER_DOLL
	const DECO_GRIMER_DOLL
	const DECO_VOLTORB_DOLL
	const DECO_WEEDLE_DOLL
	const DECO_UNOWN_DOLL
	const DECO_GEODUDE_DOLL
	const DECO_MACHOP_DOLL
	const DECO_TENTACOOL_DOLL
	const DECO_GOLD_TROPHY_DOLL
	const DECO_SILVER_TROPHY_DOLL
DEF NUM_DECO_CATEGORIES EQU const_value - 1 - NUM_DECOS
