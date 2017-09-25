add_pic: MACRO
	db BANK(\1) - PICS_FIX
	dw \1
ENDM
