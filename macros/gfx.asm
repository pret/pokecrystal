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

DEF palred   EQUS "(1 << 0) *"
DEF palgreen EQUS "(1 << 5) *"
DEF palblue  EQUS "(1 << 10) *"

DEF palettes EQUS "* PAL_B"
DEF palette  EQUS "+ PAL_B *"
DEF color    EQUS "+ COLOR_B *"
DEF colors   EQUS "* COLOR_B"

DEF tiles EQUS "* TILE_B"
DEF tile  EQUS "+ TILE_B *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
DEF middle_colors EQUS "COLOR_B, COLOR_B * 2"

MACRO dbpixel
	if _NARG >= 4
	; x tile, y tile, x pixel, y pixel
		db \1 * TILE_X + \3, \2 * TILE_X + \4
	else
	; x tile, y tile
		db \1 * TILE_X, \2 * TILE_X
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
		lb \1, \2 * TILE_X + \4, \3 * TILE_X + \5
	else
	; register, x tile, y tile
		lb \1, \2 * TILE_X, \3 * TILE_X
	endc
ENDM

MACRO dbsprite
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	db (\2 * TILE_X) % $100 + \4, (\1 * TILE_X) % $100 + \3, \5, \6
ENDM
