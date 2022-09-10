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

DEF palettes EQUS "* PALETTE_SIZE"
DEF palette  EQUS "+ PALETTE_SIZE *"
DEF color    EQUS "+ PAL_COLOR_SIZE *"

DEF tiles EQUS "* LEN_2BPP_TILE"
DEF tile  EQUS "+ LEN_2BPP_TILE *"

; extracts the middle two colors from a 2bpp binary palette
; example usage:
; INCBIN "foo.gbcpal", middle_colors
DEF middle_colors EQUS "PAL_COLOR_SIZE, PAL_COLOR_SIZE * 2"

MACRO dbpixel
	if _NARG >= 4
	; x tile, y tile, x pixel, y pixel
		db \1 * TILE_WIDTH + \3, \2 * TILE_WIDTH + \4
	else
	; x tile, y tile
		db \1 * TILE_WIDTH, \2 * TILE_WIDTH
	endc
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

DEF depixel EQUS "ldpixel de,"
DEF bcpixel EQUS "ldpixel bc,"

MACRO dbsprite
; x tile, y tile, x pixel, y pixel, vtile offset, attributes
	db (\2 * TILE_WIDTH) % $100 + \4, (\1 * TILE_WIDTH) % $100 + \3, \5, \6
ENDM
