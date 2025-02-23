MACRO text
	db TX_START, \# ; Start writing text
ENDM

MACRO next
	db "<NEXT>", \# ; Move a line down
ENDM

MACRO line
	db "<LINE>", \# ; Start writing at the bottom line
ENDM

MACRO page
	db "@", \# ; Start a new Pokédex page
ENDM

MACRO para
	db "<PARA>", \# ; Start a new paragraph
ENDM

MACRO cont
	db "<CONT>", \# ; Scroll to the next line
ENDM

MACRO done
	db "<DONE>" ; End a text box
ENDM

MACRO prompt
	db "<PROMPT>" ; Prompt the player to end a text box (initiating some other event)
ENDM

; TextCommands indexes (see home/text.asm)
	const_def

	const TX_START ; $00
MACRO text_start
	db TX_START
ENDM

	const TX_RAM ; $01
MACRO text_ram
	db TX_RAM
	dw \1
ENDM

	const TX_BCD ; $02
MACRO text_bcd
	db TX_BCD
	dw \1
	db \2
ENDM

	const TX_MOVE ; $03
MACRO text_move
	db TX_MOVE
	dw \1
ENDM

	const TX_BOX ; $04
MACRO text_box
	db TX_BOX
	dw \1
	db \2, \3
ENDM

	const TX_LOW ; $05
MACRO text_low
	db TX_LOW
ENDM

	const TX_PROMPT_BUTTON ; $06
MACRO text_promptbutton
	db TX_PROMPT_BUTTON
ENDM

	const TX_SCROLL ; $07
MACRO text_scroll
	db TX_SCROLL
ENDM

	const TX_START_ASM ; $08
MACRO text_asm
	db TX_START_ASM
ENDM

	const TX_DECIMAL ; $09
MACRO text_decimal
	db TX_DECIMAL
	dw \1 ; address
	dn \2, \3 ; bytes, digits
ENDM

	const TX_PAUSE ; $0a
MACRO text_pause
	db TX_PAUSE
ENDM

	const TX_SOUND_DEX_FANFARE_50_79 ; $0b
MACRO sound_dex_fanfare_50_79
	db TX_SOUND_DEX_FANFARE_50_79
ENDM

	const TX_DOTS ; $0c
MACRO text_dots
	db TX_DOTS
	db \1
ENDM

	const TX_WAIT_BUTTON ; $0d
MACRO text_waitbutton
	db TX_WAIT_BUTTON
ENDM

	const TX_SOUND_DEX_FANFARE_20_49 ; $0e
MACRO sound_dex_fanfare_20_49
	db TX_SOUND_DEX_FANFARE_20_49
ENDM

	const TX_SOUND_ITEM ; $0f
MACRO sound_item
	db TX_SOUND_ITEM
ENDM

	const TX_SOUND_CAUGHT_MON ; $10
MACRO sound_caught_mon
	db TX_SOUND_CAUGHT_MON
ENDM

	const TX_SOUND_DEX_FANFARE_80_109 ; $11
MACRO sound_dex_fanfare_80_109
	db TX_SOUND_DEX_FANFARE_80_109
ENDM

	const TX_SOUND_FANFARE ; $12
MACRO sound_fanfare
	db TX_SOUND_FANFARE
ENDM

	const TX_SOUND_SLOT_MACHINE_START ; $13
MACRO sound_slot_machine_start
	db TX_SOUND_SLOT_MACHINE_START
ENDM

	const TX_STRINGBUFFER ; $14
MACRO text_buffer
	db TX_STRINGBUFFER
	db \1
ENDM

	const TX_DAY ; $15
MACRO text_today
	db TX_DAY
ENDM

	const TX_FAR ; $16
MACRO text_far
	db TX_FAR
	dw \1
	db BANK(\1)
ENDM

DEF NUM_TEXT_CMDS EQU const_value

	const_next $50

	const TX_END ; $50
MACRO text_end
	db TX_END
ENDM
