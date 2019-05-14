INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/rst.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/text_constants.inc"
INCLUDE "constants/floating_constants.inc"
INCLUDE "constants/pokemon_data_constants.inc"


SECTION "engine/pokemon/breedmon_level_growth.asm", ROMX, BANK[BANK_MOVE_MON]

GetBreedMon1LevelGrowth::
	ld hl, wBreedMon1Stats
	ld de, wTempMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	callfar CalcLevel
	ld a, [wBreedMon1Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret

GetBreedMon2LevelGrowth::
	ld hl, wBreedMon2Stats
	ld de, wTempMon
	ld bc, BOXMON_STRUCT_LENGTH
	call CopyBytes
	callfar CalcLevel
	ld a, [wBreedMon2Level]
	ld b, a
	ld a, d
	ld e, a
	sub b
	ld d, a
	ret
