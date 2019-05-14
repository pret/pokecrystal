INCLUDE "macros/enum.inc"
INCLUDE "constants/wram_constants.inc"


SECTION "engine/events/checktime.asm", ROMX

CheckTime::
	ld a, [wTimeOfDay]
	ld hl, .TimeOfDayTable
	ld de, 2
	call IsInArray
	inc hl
	ld c, [hl]
	ret c

	xor a
	ld c, a
	ret

.TimeOfDayTable:
	db MORN_F, MORN
	db DAY_F,  DAY
	db NITE_F, NITE
	db NITE_F, NITE
	db -1
