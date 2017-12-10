; TypeNames indexes (see text/types.asm)
; also used in:
; - TypeMatchup (see battle.type_matchup.asm)
; - Pokedex_SearchForMons.TypeConversionTable and Pokedex_PlaceSearchScreenTypeStrings.TypeStrings (see engine/pokedex.asm)
	const_def

PHYSICAL EQU const_value
	const NORMAL
	const FIGHTING
	const FLYING
	const POISON
	const GROUND
	const ROCK
	const BIRD
	const BUG
	const GHOST
	const STEEL

UNUSED_TYPES EQU const_value
	const TYPE_10
	const TYPE_11
	const TYPE_12
	const TYPE_13
	const TYPE_14
	const TYPE_15
	const TYPE_16
	const TYPE_17
	const TYPE_18
	const CURSE_T
UNUSED_TYPES_END EQU const_value

SPECIAL EQU const_value
	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC
	const ICE
	const DRAGON
	const DARK

TYPES_END EQU const_value
