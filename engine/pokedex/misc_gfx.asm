INCLUDE "macros/code.inc"
INCLUDE "macros/gfx.inc"
INCLUDE "constants/gfx_constants.inc"


SECTION "engine/pokedex/misc_gfx@LoadSGBPokedexGFX", ROMX

LoadSGBPokedexGFX::
	ld hl, SGBPokedexGFX_LZ
	ld de, vTiles2 tile $31
	call Decompress
	ret

LoadSGBPokedexGFX2::
	ld hl, SGBPokedexGFX_LZ
	ld de, vTiles2 tile $31
	lb bc, BANK(SGBPokedexGFX_LZ), 58
	call DecompressRequest2bpp
	ret

SGBPokedexGFX_LZ:
INCBIN "gfx/pokedex/sgb.2bpp.lz"


SECTION "engine/pokedex/misc_gfx@LoadQuestionMarkPic", ROMX

LoadQuestionMarkPic::
	ld hl, .QuestionMarkLZ
	ld de, sScratch
	call Decompress
	ret

.QuestionMarkLZ:
INCBIN "gfx/pokedex/question_mark.2bpp.lz"
