; pc themes (see data/pc/theme_names.asm)
	const_def
	const THEME_POKEDEX
	const THEME_POKEGEAR_M
	const THEME_POKEGEAR_F
	const THEME_PACK_M
	const THEME_PACK_F
	const THEME_TRAINER_CARD_M
	const THEME_TRAINER_CARD_F
	const THEME_NORMAL
	const THEME_FIGHTING
	const THEME_FLYING
	const THEME_POISON
	const THEME_GROUND
	const THEME_ROCK
	const THEME_BUG
	const THEME_GHOST
	const THEME_STEEL
	const THEME_FIRE
	const THEME_WATER
	const THEME_GRASS
	const THEME_ELECTRIC
	const THEME_PSYCHIC
	const THEME_ICE
	const THEME_DRAGON
	const THEME_DARK
DEF NUM_BILLS_PC_THEMES EQU const_value

; sprite animation parameters
DEF PCANIM_STATIC      EQU  0 ; used when holding stuff, we don't want to bop then
DEF PCANIM_ANIMATE     EQU 90 ; baseline
DEF PCANIM_PICKUP      EQU 91 ; we're picking up/placing down something
DEF PCANIM_PICKUP_NEXT EQU 98 ; cursor is at the bottom, ready for pickup
DEF PCANIM_QUICKFRAMES EQU  9
