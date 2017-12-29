screenrows EQUS "* SCREEN_WIDTH"
bgrows     EQUS "* BG_MAP_WIDTH"

hlcoord EQUS "coord hl,"
bccoord EQUS "coord bc,"
decoord EQUS "coord de,"

coord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) screenrows + (\2) + TileMap
	else
	ld \1, (\3) screenrows + (\2) + \4
	endc
ENDM

hlbgcoord EQUS "bgcoord hl,"
bcbgcoord EQUS "bgcoord bc,"
debgcoord EQUS "bgcoord de,"

bgcoord: MACRO
; register, x, y[, origin]
	if _NARG < 4
	ld \1, (\3) bgrows + (\2) + vBGMap0
	else
	ld \1, (\3) bgrows + (\2) + \4
	endc
ENDM

hldims EQUS "dims hl,"
bcdims EQUS "dims bc,"
dedims EQUS "dims de,"

dims: MACRO
; register, width, height
	lb \1, \3, \2
ENDM

dwcoord: MACRO
; x, y
	rept _NARG / 2
	dw (\2) screenrows + (\1) + TileMap
	shift
	shift
	endr
ENDM

ldcoord_a: MACRO
; x, y[, origin]
	if _NARG < 3
	ld [(\2) screenrows + (\1) + TileMap], a
	else
	ld [(\2) screenrows + (\1) + \3], a
	endc
ENDM

lda_coord: MACRO
; x, y[, origin]
	if _NARG < 3
	ld a, [(\2) screenrows + (\1) + TileMap]
	else
	ld a, [(\2) screenrows + (\1) + \3]
	endc
ENDM
