; Graphics macros

MACRO assert_valid_rgb
	rept _NARG
		assert 0 <= (\1) && (\1) <= 31, "RGB channel must be 0-31"
		shift
	endr
ENDM

MACRO RGB
	rept _NARG / 3
		assert_valid_rgb \1, \2, \3
		dw palred (\1) + palgreen (\2) + palblue (\3)
		shift 3
	endr
ENDM

DEF palred   EQUS "(1 << B_COLOR_RED) *"
DEF palgreen EQUS "(1 << B_COLOR_GREEN) *"
DEF palblue  EQUS "(1 << B_COLOR_BLUE) *"

DEF palettes EQUS "* PAL_SIZE"
DEF palette  EQUS "+ PAL_SIZE *"
DEF color    EQUS "+ COLOR_SIZE *"
DEF colors   EQUS "* COLOR_SIZE"

DEF tiles EQUS "* TILE_SIZE"
DEF tile  EQUS "+ TILE_SIZE *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
DEF middle_colors EQUS "COLOR_SIZE, COLOR_SIZE * 2"

MACRO dbpixel
	if _NARG >= 4
	; x tile, y tile, x pixel, y pixel
		db \1 * TILE_WIDTH + \3, \2 * TILE_WIDTH + \4
	else
	; x tile, y tile
		db \1 * TILE_WIDTH, \2 * TILE_WIDTH
	endc
ENDM

MACRO hlpixel
	ldpixel hl, \#
ENDM

MACRO bcpixel
	ldpixel bc, \#
ENDM

MACRO depixel
	ldpixel de, \#
ENDM

MACRO ldpixel
	if _NARG >= 5
	; register, x tile, y tile, x pixel, y pixel
		lb \1, \2 * TILE_WIDTH + \4, \3 * TILE_WIDTH + \5
	else
	; register, x tile, y tile
		lb \1, \2 * TILE_WIDTH, \3 * TILE_WIDTH
	endc
ENDM

MACRO dbsprite
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	db (\2 * TILE_WIDTH) % $100 + \4, (\1 * TILE_WIDTH) % $100 + \3, \5, \6
ENDM
