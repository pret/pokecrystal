rating: MACRO
; count, sfx, text
	db \1
	dw \2, \3
ENDM

OakRatings:
; if you caught at most this many, play this sound, load this text
; (text is defined in engine/events/prof_oaks_pc.asm)
	rating   9, SFX_DEX_FANFARE_LESS_THAN_20, OakRating01
	rating  19, SFX_DEX_FANFARE_LESS_THAN_20, OakRating02
	rating  34, SFX_DEX_FANFARE_20_49,        OakRating03
	rating  49, SFX_DEX_FANFARE_20_49,        OakRating04
	rating  64, SFX_DEX_FANFARE_50_79,        OakRating05
	rating  79, SFX_DEX_FANFARE_50_79,        OakRating06
	rating  94, SFX_DEX_FANFARE_80_109,       OakRating07
	rating 109, SFX_DEX_FANFARE_80_109,       OakRating08
	rating 124, SFX_CAUGHT_MON,               OakRating09
	rating 139, SFX_CAUGHT_MON,               OakRating10
	rating 154, SFX_DEX_FANFARE_140_169,      OakRating11
	rating 169, SFX_DEX_FANFARE_140_169,      OakRating12
	rating 184, SFX_DEX_FANFARE_170_199,      OakRating13
	rating 199, SFX_DEX_FANFARE_170_199,      OakRating14
	rating 214, SFX_DEX_FANFARE_200_229,      OakRating15
	rating 229, SFX_DEX_FANFARE_200_229,      OakRating16
	rating 239, SFX_DEX_FANFARE_230_PLUS,     OakRating17
	rating 248, SFX_DEX_FANFARE_230_PLUS,     OakRating18
	rating 255, SFX_DEX_FANFARE_230_PLUS,     OakRating19
