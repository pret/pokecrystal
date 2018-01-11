unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
else
if \1 >= "Y"
x = 2 * (\1 - "Y") + $60
else
if \1 >= "Q"
x = 2 * (\1 - "Q") + $40
else
if \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
endc
endc
endc
	db x
shift
endr
	db -1 ; end
ENDM

UnownWalls: ; 8aebc
; UNOWNWORDS_ESCAPE
	; db      $08, $44, $04, $00, $2e, $08, $ff
	unownwall "E", "S", "C", "A", "P", "E"
; UNOWNWORDS_LIGHT
	; db      $26, $20, $0c, $0e, $46, $ff
	unownwall "L", "I", "G", "H", "T"
; UNOWNWORDS_WATER
	; db      $4c, $00, $46, $08, $42, $ff
	unownwall "W", "A", "T", "E", "R"
; UNOWNWORDS_HO_OH
	; db      $0e, $2c, $64, $2c, $0e, $ff
	unownwall "H", "O", "-", "O", "H"
; 8aed5

MenuDataHeaders_UnownWalls: ; 0x8aed5
; UNOWNWORDS_ESCAPE
	db $40 ; flags
	db 04, 03 ; start coords
	db 09, 16 ; end coords
; UNOWNWORDS_LIGHT
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; UNOWNWORDS_WATER
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; UNOWNWORDS_HO_OH
	db $40 ; flags
	db 04, 04 ; start coords
	db 09, 15 ; end coords
; 8aee9
