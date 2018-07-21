; Value macros

percent EQUS "* $ff / 100"

; Constant data (db, dw, dl) macros

dwb: MACRO
	dw \1
	db \2
ENDM

dbw: MACRO
	db \1
	dw \2
ENDM

dbbw: MACRO
	db \1, \2
	dw \3
ENDM

dbww: MACRO
	db \1
	dw \2, \3
ENDM

dbwww: MACRO
	db \1
	dw \2, \3, \4
ENDM

dn: MACRO ; nybbles
rept _NARG / 2
	db ((\1) << 4) | (\2)
	shift
	shift
endr
ENDM

dc: MACRO ; "crumbs"
rept _NARG / 4
	db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
	shift
	shift
	shift
	shift
endr
ENDM

dx: MACRO
x = 8 * ((\1) - 1)
rept \1
	db ((\2) >> x) & $ff
x = x + -8
endr
ENDM

dt: MACRO ; three-byte (big-endian)
	dx 3, \1
ENDM

dd: MACRO ; four-byte (big-endian)
	dx 4, \1
ENDM

bigdw: MACRO ; big-endian word
	dx 2, \1
ENDM

dba: MACRO ; dbw bank, address
rept _NARG
	dbw BANK(\1), \1
	shift
endr
ENDM

dab: MACRO ; dwb address, bank
rept _NARG
	dwb \1, BANK(\1)
	shift
endr
ENDM

dba_pic: MACRO ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM

dbpixel: MACRO
if _NARG >= 4
; x tile, x pxl, y tile, y pxl
	db \1 * 8 + \3, \2 * 8 + \4
else
; x, y
	db \1 * 8, \2 * 8
endc
ENDM

dsprite: MACRO
; y tile, y pxl, x tile, x pxl, vtile offset, flags, attributes
	db (\1 * 8) % $100 + \2, (\3 * 8) % $100 + \4, \5, \6
ENDM

menu_coords: MACRO
; x1, y1, x2, y2
	db \2, \1 ; start coords
	db \4, \3 ; end coords
ENDM

bcd: MACRO
rept _NARG
	dn ((\1) % 100) / 10, (\1) % 10
	shift
endr
ENDM

sine_table: MACRO
; \1 samples of sin(x) from x=0 to x<32768 (pi radians)
x = 0
rept \1
	dw (sin(x) + (sin(x) & $ff)) >> 8 ; round up
x = x + DIV(32768, \1) ; a circle has 65536 "degrees"
endr
ENDM
