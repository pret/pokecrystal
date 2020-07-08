text   EQUS "db TX_START,"    ; Start writing text.
next   EQUS "db \"<NEXT>\","  ; Move a line down.
line   EQUS "db \"<LINE>\","  ; Start writing at the bottom line.
page   EQUS "db \"@\","       ; Start a new Pokédex page.
para   EQUS "db \"<PARA>\","  ; Start a new paragraph.
cont   EQUS "db \"<CONT>\","  ; Scroll to the next line.
done   EQUS "db \"<DONE>\""   ; End a text box.
prompt EQUS "db \"<PROMPT>\"" ; Prompt the player to end a text box (initiating some other event).

; TextCommands indexes (see home/text.asm)
	const_def

	const TX_START ; $00
text_start: MACRO
	db TX_START
ENDM

	const TX_RAM ; $01
text_ram: MACRO
	db TX_RAM
	dw \1
ENDM

	const TX_BCD ; $02
text_bcd: MACRO
	db TX_BCD
	dw \1
	db \2
ENDM

	const TX_MOVE ; $03
text_move: MACRO
	db TX_MOVE
	dw \1
ENDM

	const TX_BOX ; $04
text_box: MACRO
	db TX_BOX
	dw \1
	db \2, \3
ENDM

	const TX_LOW ; $05
text_low: MACRO
	db TX_LOW
ENDM

	const TX_PROMPT_BUTTON ; $06
text_promptbutton: MACRO
	db TX_PROMPT_BUTTON
ENDM

	const TX_SCROLL ; $07
text_scroll: MACRO
	db TX_SCROLL
ENDM

	const TX_START_ASM ; $08
text_asm: MACRO
	db TX_START_ASM
ENDM

	const TX_NUM ; $09
text_decimal: MACRO
	db TX_NUM
	dw \1 ; address
	dn \2, \3 ; bytes, digits
ENDM

	const TX_PAUSE ; $0a
text_pause: MACRO
	db TX_PAUSE
ENDM

	const TX_SOUND_DEX_FANFARE_50_79 ; $0b
sound_dex_fanfare_50_79: MACRO
	db TX_SOUND_DEX_FANFARE_50_79
ENDM

	const TX_DOTS ; $0c
text_dots: MACRO
	db TX_DOTS
	db \1
ENDM

	const TX_WAIT_BUTTON ; $0d
text_waitbutton: MACRO
	db TX_WAIT_BUTTON
ENDM

	const TX_SOUND_DEX_FANFARE_20_49 ; $0e
sound_dex_fanfare_20_49: MACRO
	db TX_SOUND_DEX_FANFARE_20_49
ENDM

	const TX_SOUND_ITEM ; $0f
sound_item: MACRO
	db TX_SOUND_ITEM
ENDM

	const TX_SOUND_CAUGHT_MON ; $10
sound_caught_mon: MACRO
	db TX_SOUND_CAUGHT_MON
ENDM

	const TX_SOUND_DEX_FANFARE_80_109 ; $11
sound_dex_fanfare_80_109: MACRO
	db TX_SOUND_DEX_FANFARE_80_109
ENDM

	const TX_SOUND_FANFARE ; $12
sound_fanfare: MACRO
	db TX_SOUND_FANFARE
ENDM

	const TX_SOUND_SLOT_MACHINE_START ; $13
sound_slot_machine_start: MACRO
	db TX_SOUND_SLOT_MACHINE_START
ENDM

	const TX_STRINGBUFFER ; $14
text_buffer: MACRO
	db TX_STRINGBUFFER
	db \1
ENDM

	const TX_DAY ; $15
text_today: MACRO
	db TX_DAY
ENDM

	const TX_FAR ; $16
text_far: MACRO
	db TX_FAR
	dw \1
	db BANK(\1)
ENDM

	const_next $50

	const TX_END ; $50
text_end: MACRO
	db TX_END
ENDM
