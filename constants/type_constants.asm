; TypeNames indexes (see data/types/names.asm)
; also used in:
; - PokedexTypeSearchConversionTable (see data/types/search_types.asm)
; - PokedexTypeSearchStrings (see data/types/search_strings.asm)
; - TypeMatchups (see data/types/type_matchups.asm)
; - TypeBoostItems (see data/types/type_boost_items.asm)
	const_def

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

DEF UNUSED_TYPES EQU const_value
	const_next 19
	const CURSE_TYPE
DEF UNUSED_TYPES_END EQU const_value

	const FIRE
	const WATER
	const GRASS
	const ELECTRIC
	const PSYCHIC_TYPE
	const ICE
	const DRAGON
	const DARK
	const FAIRY
DEF TYPES_END EQU const_value

DEF TYPE_MASK EQU %00111111
DEF PHYSICAL  EQU %01000000
DEF SPECIAL   EQU %10000000
DEF STATUS    EQU %11000000

DEF NUM_TYPES EQU TYPES_END + UNUSED_TYPES - UNUSED_TYPES_END - 1 ; discount BIRD

DEF POKEDEX_TYPE_STRING_LENGTH EQU 9
