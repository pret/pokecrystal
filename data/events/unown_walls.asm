unownwall: MACRO
rept _NARG
if \1 == "-"
x = $64
elif \1 >= "Y"
x = 2 * (\1 - "Y") + $60
elif \1 >= "Q"
x = 2 * (\1 - "Q") + $40
elif \1 >= "I"
x = 2 * (\1 - "I") + $20
else
x = 2 * (\1 - "A")
endc
	db x
	shift
endr
	db -1 ; end
ENDM

UnownWalls:
; UNOWNWORDS_ESCAPE
	; db      $08, $44, $04, $00, $2e, $08, -1
	unownwall "E", "S", "C", "A", "P", "E"
; UNOWNWORDS_LIGHT
	; db      $26, $20, $0c, $0e, $46, -1
	unownwall "L", "I", "G", "H", "T"
; UNOWNWORDS_WATER
	; db      $4c, $00, $46, $08, $42, -1
	unownwall "W", "A", "T", "E", "R"
; UNOWNWORDS_HO_OH
	; db      $0e, $2c, $64, $2c, $0e, -1
	unownwall "H", "O", "-", "O", "H"

MenuHeaders_UnownWalls:
; UNOWNWORDS_ESCAPE
	db MENU_BACKUP_TILES ; flags
	menu_coords 3, 4, 16, 9
; UNOWNWORDS_LIGHT
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_WATER
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
; UNOWNWORDS_HO_OH
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, 15, 9
