text   EQUS "db \"<START>\"," ; Start writing text.
next   EQUS "db \"<NEXT>\","  ; Move a line down.
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokédex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

; TextCommands indexes (see home/text.asm)
	enum_start $01

	enum TX_RAM ; $01
text_from_ram: MACRO
	db TX_RAM
	dw \1
	ENDM

	enum TX_BCD ; $02
text_bcd: macro
	db TX_BCD
	dw \1
	db \2
	ENDM

	enum TX_MOVE ; $03
text_move: macro
	db TX_MOVE
	dw \1
	ENDM

	enum TX_BOX ; $04
text_box: macro
	db TX_BOX
	dw \1
	db \2, \3
	ENDM

	enum TX_LOW ; $05
text_low: macro
	db TX_LOW
	endm

	enum WAIT_BUTTON ; $06
text_waitbutton: macro
	db WAIT_BUTTON
	endm

	enum TX_SCROLL ; $07
text_scroll: macro
	db TX_SCROLL
	endm

	enum START_ASM ; $08
start_asm: macro
	db START_ASM
	endm

	enum TX_NUM ; $09
deciram: macro
	db TX_NUM
	dw \1 ; address
	dn \2, \3 ; bytes, digits
	endm

	enum TX_EXIT ; $0a
interpret_data: macro
	db TX_EXIT
	endm

	enum TX_SOUND_0B ; $0b
sound_dex_fanfare_50_79: macro
	db TX_SOUND_0B
	endm

	enum TX_DOTS ; $0c
limited_interpret_data: macro
	db TX_DOTS
	db \1
	endm

	enum TX_LINK_WAIT_BUTTON ; $0d
link_wait_button: macro
	db TX_LINK_WAIT_BUTTON
	endm

	enum TX_SOUND_0E ; $0e
sound_dex_fanfare_20_49: macro
	db TX_SOUND_0E
	endm

	enum TX_SOUND_0F ; $0f
sound_item: macro
	db TX_SOUND_0F
	endm

	enum TX_SOUND_10 ; $10
sound_caught_mon: macro
	db TX_SOUND_10
	endm

	enum TX_SOUND_11 ; $11
sound_dex_fanfare_80_109: macro
	db TX_SOUND_11
	endm

	enum TX_SOUND_12 ; $12
sound_fanfare: macro
	db TX_SOUND_12
	endm

	enum TX_SOUND_13 ; $13
sound_slot_machine_start: macro
	db TX_SOUND_13
	endm

	enum TX_STRINGBUFFER ; $14
text_buffer: macro
	db TX_STRINGBUFFER
	db \1
	endm

	enum TX_DAY ; $15
current_day: macro
	db TX_DAY
	endm

	enum TX_FAR ; $16
text_jump: MACRO
	db TX_FAR
	dw \1
	db BANK(\1)
	ENDM
