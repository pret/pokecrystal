text_from_ram: macro
	db 1
	dw \1
	endm

text_dunno1: macro
	db 5
	endm

text_waitbutton: macro
	db 6
	endm

text_dunno2: macro
	db 7
	endm

start_asm: macro
	db 8
	endm

deciram: macro
	db 9
	dw \1
	db \2
	endm

interpret_data: macro
	db 10
	endm

sound0: macro
	db 11
	endm

limited_interpret_data: macro
	db 12
	db \1
	endm

sound0x0F: macro
	db $f
	endm

sound0x02: macro
	db $10
	endm

sound0x0A: macro
	db $11
	endm

sound0x2C: macro
	db $13
	endm

current_day: macro
	db $15
	endm

text_jump: macro
	db $16
	dw \1
	db BANK(\1)
	endm
