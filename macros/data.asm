; Value macros

; Many arbitrary percentages are simple base-10 or base-16 values:
; -  10 = 4 percent
; -  15 = 6 percent
; - $10 = 6 percent + 1 = 7 percent - 1
; -  20 = 8 percent
; -  25 = 10 percent
; -  30 = 12 percent
; -  40 = 16 percent
; -  50 = 20 percent - 1
; -  60 = 24 percent - 1
; -  70 = 28 percent - 1
; -  80 = 31 percent + 1 = 32 percent - 1
; -  85 = 33 percent + 1 = 34 percent - 1
; - 100 = 39 percent + 1 = 40 percent - 2
; - 120 = 47 percent + 1
; - 123 = 49 percent - 1
; - 160 = 63 percent
; - 180 = 71 percent - 1 = 70 percent + 2
; - 200 = 79 percent - 1
; - 230 = 90 percent + 1
DEF percent EQUS "* $ff / 100"

; e.g. 1 out_of 2 == 50 percent + 1 == $80
DEF out_of EQUS "* $100 /"

MACRO assert_power_of_2
	assert (\1) & ((\1) - 1) == 0, "\1 must be a power of 2"
ENDM

; Constant data (db, dw, dl) macros

MACRO dwb
	dw \1
	db \2
ENDM

MACRO dbw
	db \1
	dw \2
ENDM

MACRO dn ; nybbles
	rept _NARG / 2
		db ((\1) << 4) | (\2)
		shift 2
	endr
ENDM

MACRO dc ; "crumbs"
	rept _NARG / 4
		db ((\1) << 6) | ((\2) << 4) | ((\3) << 2) | (\4)
		shift 4
	endr
ENDM

MACRO dt ; three-byte (big-endian)
	db LOW((\1) >> 16), HIGH(\1), LOW(\1)
ENDM

MACRO dd ; four-byte (big-endian)
	db HIGH((\1) >> 16), LOW((\1) >> 16), HIGH(\1), LOW(\1)
ENDM

MACRO bigdw ; big-endian word
	db HIGH(\1), LOW(\1)
ENDM

MACRO dba ; dbw bank, address
	rept _NARG
		dbw BANK(\1), \1
		shift
	endr
ENDM

MACRO dab ; dwb address, bank
	rept _NARG
		dwb \1, BANK(\1)
		shift
	endr
ENDM

MACRO dba_pic ; dbw bank, address
	db BANK(\1) - PICS_FIX
	dw \1
ENDM

MACRO bcd
	rept _NARG
		dn ((\1) % 100) / 10, (\1) % 10
		shift
	endr
ENDM

MACRO sine_table
; \1 samples of sin(x) from x=0 to x<0.5 turns (pi radians)
	for x, \1
		dw sin(x * 0.5 / (\1))
	endr
ENDM
