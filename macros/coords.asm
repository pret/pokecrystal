; Coordinate macros

DEF hlcoord EQUS "coord hl,"
DEF bccoord EQUS "coord bc,"
DEF decoord EQUS "coord de,"

MACRO coord
; register, x, y[, origin]
	if _NARG < 4
		ld \1, (\3) * SCREEN_WIDTH + (\2) + wTilemap
	else
		ld \1, (\3) * SCREEN_WIDTH + (\2) + \4
	endc
ENDM

DEF hlbgcoord EQUS "bgcoord hl,"
DEF bcbgcoord EQUS "bgcoord bc,"
DEF debgcoord EQUS "bgcoord de,"

MACRO bgcoord
; register, x, y[, origin]
	if _NARG < 4
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + vBGMap0
	else
		ld \1, (\3) * BG_MAP_WIDTH + (\2) + \4
	endc
ENDM

MACRO dwcoord
; x, y
	rept _NARG / 2
		dw (\2) * SCREEN_WIDTH + (\1) + wTilemap
		shift 2
	endr
ENDM

MACRO ldcoord_a
; x, y[, origin]
	if _NARG < 3
		ld [(\2) * SCREEN_WIDTH + (\1) + wTilemap], a
	else
		ld [(\2) * SCREEN_WIDTH + (\1) + \3], a
	endc
ENDM

MACRO lda_coord
; x, y[, origin]
	if _NARG < 3
		ld a, [(\2) * SCREEN_WIDTH + (\1) + wTilemap]
	else
		ld a, [(\2) * SCREEN_WIDTH + (\1) + \3]
	endc
ENDM

MACRO menu_coords
; x1, y1, x2, y2
	db \2, \1 ; start coords
	db \4, \3 ; end coords
ENDM
