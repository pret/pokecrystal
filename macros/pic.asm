add_pic: MACRO
	db BANK(\1) - $36
	dw \1
ENDM
