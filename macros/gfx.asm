RGB: MACRO
rept _NARG / 3
	dw palred (\1) + palgreen (\2) + palblue (\3)
	shift 3
endr
ENDM

palred   EQUS "(1 << 0) *"
palgreen EQUS "(1 << 5) *"
palblue  EQUS "(1 << 10) *"

palettes EQUS "* PALETTE_SIZE"
palette  EQUS "+ PALETTE_SIZE *"
color    EQUS "+ PAL_COLOR_SIZE *"

tiles EQUS "* LEN_2BPP_TILE"
tile  EQUS "+ LEN_2BPP_TILE *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
middle_colors EQUS "PAL_COLOR_SIZE, PAL_COLOR_SIZE * 2"

dbpixel: MACRO
if _NARG >= 4
; x tile, y tile, x pixel, y pixel
	db \1 * TILE_WIDTH + \3, \2 * TILE_WIDTH + \4
else
; x tile, y tile
	db \1 * TILE_WIDTH, \2 * TILE_WIDTH
endc
ENDM

ldpixel: MACRO
if _NARG >= 5
; register, x tile, y tile, x pixel, y pixel
	lb \1, \2 * TILE_WIDTH + \4, \3 * TILE_WIDTH + \5
else
; register, x tile, y tile
	lb \1, \2 * TILE_WIDTH, \3 * TILE_WIDTH
endc
ENDM

depixel EQUS "ldpixel de,"
bcpixel EQUS "ldpixel bc,"

dbsprite: MACRO
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	db (\2 * TILE_WIDTH) % $100 + \4, (\1 * TILE_WIDTH) % $100 + \3, \5, \6
ENDM
