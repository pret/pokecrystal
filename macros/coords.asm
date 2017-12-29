bccoord EQUS "coord bc,"
decoord EQUS "coord de,"
hlcoord EQUS "coord hl,"

coord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, TileMap + SCREEN_WIDTH * (\3) + (\2)
	else
	ld \1, \4 + SCREEN_WIDTH * (\3) + (\2)
	endc
ENDM

dwcoord: MACRO
	rept _NARG / 2
	dw TileMap + SCREEN_WIDTH * (\2) + (\1)
	shift
	shift
	endr
ENDM

ldcoord_a: MACRO
	if _NARG < 3
	ld [TileMap + SCREEN_WIDTH * (\2) + (\1)], a
	else
	ld [\3 + SCREEN_WIDTH * (\2) + (\1)], a
	endc
ENDM

lda_coord: MACRO
	if _NARG < 3
	ld a, [TileMap + SCREEN_WIDTH * (\2) + (\1)]
	else
	ld a, [\3 + SCREEN_WIDTH * (\2) + (\1)]
	endc
ENDM


bgrows EQUS "* $20" ; SCREEN_WIDTH

hlbgcoord EQUS "bgcoord hl,"
debgcoord EQUS "bgcoord de,"
bcbgcoord EQUS "bgcoord bc,"

bgcoord: MACRO
	if _NARG >= 4
	ld \1, \3 bgrows + \2 + \4
	else
	ld \1, \3 bgrows + \2 + vBGMap0
	endc
ENDM
