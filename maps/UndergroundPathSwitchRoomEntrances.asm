UndergroundPathSwitchRoomEntrances_MapScriptHeader: ; 0x7c9e8
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x7c9f5, $0000
	dw UnknownScript_0x7c9f6, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x7c9f7
; 0x7c9f5

UnknownScript_0x7c9f5: ; 0x7c9f5
	end
; 0x7c9f6

UnknownScript_0x7c9f6: ; 0x7c9f6
	end
; 0x7c9f7

UnknownScript_0x7c9f7: ; 0x7c9f7
	checkevent EVENT_SWITCH_4
	iffalse UnknownScript_0x7ca01
	changeblock $10, $6, $2d
UnknownScript_0x7ca01: ; 0x7ca01
	checkevent EVENT_SWITCH_5
	iffalse UnknownScript_0x7ca0b
	changeblock $a, $6, $2d
UnknownScript_0x7ca0b: ; 0x7ca0b
	checkevent EVENT_SWITCH_6
	iffalse UnknownScript_0x7ca15
	changeblock $2, $6, $2d
UnknownScript_0x7ca15: ; 0x7ca15
	checkevent EVENT_SWITCH_7
	iffalse UnknownScript_0x7ca1f
	changeblock $2, $a, $2d
UnknownScript_0x7ca1f: ; 0x7ca15
	checkevent EVENT_SWITCH_8
	iffalse UnknownScript_0x7ca29
	changeblock $a, $a, $2d
UnknownScript_0x7ca29: ; 0x7ca29
	checkevent EVENT_SWITCH_9
	iffalse UnknownScript_0x7ca33
	changeblock $10, $a, $2d
UnknownScript_0x7ca33: ; 0x7ca33
	checkevent EVENT_SWITCH_10
	iffalse UnknownScript_0x7ca41
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
UnknownScript_0x7ca41: ; 0x7ca41
	checkevent EVENT_SWITCH_11
	iffalse UnknownScript_0x7ca4f
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
UnknownScript_0x7ca4f: ; 0x7ca4f
	checkevent EVENT_SWITCH_12
	iffalse UnknownScript_0x7ca5d
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
UnknownScript_0x7ca5d: ; 0x7ca5d
	checkevent EVENT_SWITCH_13
	iffalse UnknownScript_0x7ca6b
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
UnknownScript_0x7ca6b: ; 0x7ca6b
	checkevent EVENT_SWITCH_14
	iffalse UnknownScript_0x7ca79
	changeblock $12, $a, $2a
	changeblock $12, $c, $2d
UnknownScript_0x7ca79: ; 0x7ca79
	return
; 0x7ca7a

SuperNerdScript_0x7ca7a: ; 0x7ca7a
	jumptextfaceplayer UnknownText_0x7d176
; 0x7ca7d

TeacherScript_0x7ca7d: ; 0x7ca7d
	jumptextfaceplayer UnknownText_0x7d1d0
; 0x7ca80

UnknownScript_0x7ca80: ; 0x7ca80
	spriteface $0, RIGHT
	showemote $0, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_EXIT_BUILDING
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce87
	spriteface $0, RIGHT
	scall UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce92
	playsound SFX_EXIT_BUILDING
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end
; 0x7caaa

UnknownScript_0x7caaa: ; 0x7caaa
	spriteface $0, RIGHT
	showemote $0, $0, 15
	special Functionc48f
	pause 15
	playsound SFX_EXIT_BUILDING
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce8c
	spriteface $0, RIGHT
	scall UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce97
	playsound SFX_EXIT_BUILDING
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end
; 0x7cad4

UnknownScript_0x7cad4: ; 0x7cad4
	checkevent $06c5
	iftrue UnknownScript_0x7cae1
	setevent $06c5
	domaptrigger GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F, $1
UnknownScript_0x7cae1: ; 0x7cae1
	playmusic MUSIC_RIVAL_ENCOUNTER
	loadfont
	writetext UnknownText_0x7ce9d
	closetext
	loadmovesprites
	setevent $06c1
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x7cb09
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x7cb19
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29
; 0x7cb09

UnknownScript_0x7cb09: ; 0x7cb09
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29
; 0x7cb19

UnknownScript_0x7cb19: ; 0x7cb19
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	reloadmapmusic
	returnafterbattle
	jump UnknownScript_0x7cb29
; 0x7cb29

UnknownScript_0x7cb29: ; 0x7cb29
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	writetext UnknownText_0x7cfc2
	closetext
	loadmovesprites
	end
; 0x7cb33

TrainerGruntM11: ; 0x7cb33
	; bit/flag number
	dw $4fb

	; trainer group && trainer id
	db GRUNTM, 11

	; text when seen
	dw GruntM11SeenText

	; text when trainer beaten
	dw GruntM11BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM11Script
; 0x7cb3f

GruntM11Script: ; 0x7cb3f
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d290
	closetext
	loadmovesprites
	end
; 0x7cb47

TrainerGruntM25: ; 0x7cb47
	; bit/flag number
	dw $509

	; trainer group && trainer id
	db GRUNTM, 25

	; text when seen
	dw GruntM25SeenText

	; text when trainer beaten
	dw GruntM25BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM25Script
; 0x7cb53

GruntM25Script: ; 0x7cb53
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d347
	closetext
	loadmovesprites
	end
; 0x7cb5b

TrainerBurglarDuncan: ; 0x7cb5b
	; bit/flag number
	dw $42d

	; trainer group && trainer id
	db BURGLAR, DUNCAN

	; text when seen
	dw BurglarDuncanSeenText

	; text when trainer beaten
	dw BurglarDuncanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BurglarDuncanScript
; 0x7cb67

BurglarDuncanScript: ; 0x7cb67
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d3cf
	closetext
	loadmovesprites
	end
; 0x7cb6f

TrainerBurglarEddie: ; 0x7cb6f
	; bit/flag number
	dw $42e

	; trainer group && trainer id
	db BURGLAR, EDDIE

	; text when seen
	dw BurglarEddieSeenText

	; text when trainer beaten
	dw BurglarEddieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BurglarEddieScript
; 0x7cb7b

BurglarEddieScript: ; 0x7cb7b
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d45b
	closetext
	loadmovesprites
	end
; 0x7cb83

TrainerGruntM13: ; 0x7cb83
	; bit/flag number
	dw $4fd

	; trainer group && trainer id
	db GRUNTM, 13

	; text when seen
	dw GruntM13SeenText

	; text when trainer beaten
	dw GruntM13BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM13Script
; 0x7cb8f

GruntM13Script: ; 0x7cb8f
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d51f
	closetext
	loadmovesprites
	end
; 0x7cb97

TrainerGruntF3: ; 0x7cb97
	; bit/flag number
	dw $512

	; trainer group && trainer id
	db GRUNTF, 3

	; text when seen
	dw GruntF3SeenText

	; text when trainer beaten
	dw GruntF3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntF3Script
; 0x7cba3

GruntF3Script: ; 0x7cba3
	talkaftercancel
	loadfont
	writetext UnknownText_0x7d5e6
	closetext
	loadmovesprites
	end
; 0x7cbab

MapUndergroundPathSwitchRoomEntrancesSignpost0Script: ; 0x7cbab
	loadfont
	writetext UnknownText_0x7d554
	keeptextopen
	checkevent EVENT_SWITCH_1
	iftrue UnknownScript_0x7cbcb
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $1
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_1
	jump UnknownScript_0x7cc8d
; 0x7cbcb

UnknownScript_0x7cbcb: ; 0x7cbcb
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -1
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_1
	jump UnknownScript_0x7cc8d
; 0x7cbe0

MapUndergroundPathSwitchRoomEntrancesSignpost1Script: ; 0x7cbe0
	loadfont
	writetext UnknownText_0x7d643
	keeptextopen
	checkevent EVENT_SWITCH_2
	iftrue UnknownScript_0x7cc00
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $2
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_2
	jump UnknownScript_0x7cc8d
; 0x7cc00

UnknownScript_0x7cc00: ; 0x7cc00
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -2
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_2
	jump UnknownScript_0x7cc8d
; 0x7cc15

MapUndergroundPathSwitchRoomEntrancesSignpost2Script: ; 0x7cc15
	loadfont
	writetext UnknownText_0x7d65a
	keeptextopen
	checkevent EVENT_SWITCH_3
	iftrue UnknownScript_0x7cc35
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $3
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d
; 0x7cc35

UnknownScript_0x7cc35: ; 0x7cc35
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -3
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d
; 0x7cc4a

MapUndergroundPathSwitchRoomEntrancesSignpost3Script: ; 0x7cc4a
	loadfont
	writetext UnknownText_0x7d671
	keeptextopen
	checkevent EVENT_EMERGENCY_SWITCH
	iftrue UnknownScript_0x7cc70
	writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $7
	copyvartobyte UndergroundSwitchPositions
	setevent EVENT_EMERGENCY_SWITCH
	setevent EVENT_SWITCH_1
	setevent EVENT_SWITCH_2
	setevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d
; 0x7cc70

UnknownScript_0x7cc70: ; 0x7cc70
	writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	clearevent EVENT_EMERGENCY_SWITCH
	clearevent EVENT_SWITCH_1
	clearevent EVENT_SWITCH_2
	clearevent EVENT_SWITCH_3
	jump UnknownScript_0x7cc8d
; 0x7cc8b

UnknownScript_0x7cc8b: ; 0x7cc8b
	loadmovesprites
	end
; 0x7cc8d

UnknownScript_0x7cc8d: ; 0x7cc8d
	copybytetovar UndergroundSwitchPositions
	if_equal $0, UnknownScript_0x7ccb0
	if_equal $1, UnknownScript_0x7ccd7
	if_equal $2, UnknownScript_0x7ccf2
	if_equal $3, UnknownScript_0x7cd0d
	if_equal $4, UnknownScript_0x7cd28
	if_equal $5, UnknownScript_0x7cd43
	if_equal $6, UnknownScript_0x7cd5e
	if_equal $7, UnknownScript_0x7cd79
UnknownScript_0x7ccb0: ; 0x7ccb0
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7ce21
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7ce31
	scall UnknownScript_0x7ce39
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7ccd7

UnknownScript_0x7ccd7: ; 0x7ccd7
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cda5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce39
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7ccf2

UnknownScript_0x7ccf2: ; 0x7ccf2
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdad
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce31
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd0d

UnknownScript_0x7cd0d: ; 0x7cd0d
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdb5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd28

UnknownScript_0x7cd28: ; 0x7cd28
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdbd
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce21
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd43

UnknownScript_0x7cd43: ; 0x7cd43
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdc5
	scall UnknownScript_0x7cdd5
	scall UnknownScript_0x7cdf9
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7ce4d
	scall UnknownScript_0x7ce59
	scall UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd5e

UnknownScript_0x7cd5e: ; 0x7cd5e
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7cdcd
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce05
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7ce65
	reloadmappart
	loadmovesprites
	end
; 0x7cd79

UnknownScript_0x7cd79: ; 0x7cd79
	playsound SFX_ENTER_DOOR
	scall UnknownScript_0x7ce11
	scall UnknownScript_0x7ce19
	scall UnknownScript_0x7cdb5
	scall UnknownScript_0x7ce29
	scall UnknownScript_0x7cdc5
	scall UnknownScript_0x7cdcd
	scall UnknownScript_0x7ce41
	scall UnknownScript_0x7cde1
	scall UnknownScript_0x7cded
	scall UnknownScript_0x7ce65
	scall UnknownScript_0x7ce05
	reloadmappart
	loadmovesprites
	writebyte $6
	copyvartobyte UndergroundSwitchPositions
	end
; 0x7cda5

UnknownScript_0x7cda5: ; 0x7cda5
	changeblock $10, $6, $2d
	setevent EVENT_SWITCH_4
	end
; 0x7cdad

UnknownScript_0x7cdad: ; 0x7cdad
	changeblock $a, $6, $2d
	setevent EVENT_SWITCH_5
	end
; 0x7cdb5

UnknownScript_0x7cdb5: ; 0x7cdb5
	changeblock $2, $6, $2d
	setevent EVENT_SWITCH_6
	end
; 0x7cdbd

UnknownScript_0x7cdbd: ; 0x7cdbd
	changeblock $2, $a, $2d
	setevent EVENT_SWITCH_7
	end
; 0x7cdc5

UnknownScript_0x7cdc5: ; 0x7cdc5
	changeblock $a, $a, $2d
	setevent EVENT_SWITCH_8
	end
; 0x7cdcd

UnknownScript_0x7cdcd: ; 0x7cdcd
	changeblock $10, $a, $2d
	setevent EVENT_SWITCH_9
	end
; 0x7cdd5

UnknownScript_0x7cdd5: ; 0x7cdd5
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
	setevent EVENT_SWITCH_10
	end
; 0x7cde1

UnknownScript_0x7cde1: ; 0x7cde1
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
	setevent EVENT_SWITCH_11
	end
; 0x7cded

UnknownScript_0x7cded: ; 0x7cded
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
	setevent EVENT_SWITCH_12
	end
; 0x7cdf9

UnknownScript_0x7cdf9: ; 0x7cdf9
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
	setevent EVENT_SWITCH_13
	end
; 0x7ce05

UnknownScript_0x7ce05: ; 0x7ce05
	changeblock $12, $a, $2a
	changeblock $12, $c, $2d
	setevent EVENT_SWITCH_14
	end
; 0x7ce11

UnknownScript_0x7ce11: ; 0x7ce11
	changeblock $10, $6, $3e
	clearevent EVENT_SWITCH_4
	end
; 0x7ce19

UnknownScript_0x7ce19: ; 0x7ce19
	changeblock $a, $6, $3e
	clearevent EVENT_SWITCH_5
	end
; 0x7ce21

UnknownScript_0x7ce21: ; 0x7ce21
	changeblock $2, $6, $3e
	clearevent EVENT_SWITCH_6
	end
; 0x7ce29

UnknownScript_0x7ce29: ; 0x7ce29
	changeblock $2, $a, $3e
	clearevent EVENT_SWITCH_7
	end
; 0x7ce31

UnknownScript_0x7ce31: ; 0x7ce31
	changeblock $a, $a, $3e
	clearevent EVENT_SWITCH_8
	end
; 0x7ce39

UnknownScript_0x7ce39: ; 0x7ce39
	changeblock $10, $a, $3e
	clearevent EVENT_SWITCH_9
	end
; 0x7ce41

UnknownScript_0x7ce41: ; 0x7ce41
	changeblock $c, $6, $3f
	changeblock $c, $8, $3d
	clearevent EVENT_SWITCH_10
	end
; 0x7ce4d

UnknownScript_0x7ce4d: ; 0x7ce4d
	changeblock $6, $6, $3f
	changeblock $6, $8, $3d
	clearevent EVENT_SWITCH_11
	end
; 0x7ce59

UnknownScript_0x7ce59: ; 0x7ce59
	changeblock $c, $a, $3f
	changeblock $c, $c, $3d
	clearevent EVENT_SWITCH_12
	end
; 0x7ce65

UnknownScript_0x7ce65: ; 0x7ce65
	changeblock $6, $a, $3f
	changeblock $6, $c, $3d
	clearevent EVENT_SWITCH_13
	end
; 0x7ce71

UnknownScript_0x7ce71: ; 0x7ce71
	changeblock $12, $a, $3f
	changeblock $12, $c, $3d
	clearevent EVENT_SWITCH_14
	end
; 0x7ce7d

ItemFragment_0x7ce7d: ; 0x7ce7d
	db SMOKE_BALL, 1
; 0x7ce7f

ItemFragment_0x7ce7f: ; 0x7ce7f
	db FULL_HEAL, 1
; 0x7ce81

MapUndergroundPathSwitchRoomEntrancesSignpostItem4: ; 0x7ce81
	dw $008e
	db MAX_POTION
	
; 0x7ce84

MapUndergroundPathSwitchRoomEntrancesSignpostItem5: ; 0x7ce84
	dw $008f
	db REVIVE
	
; 0x7ce87

MovementData_0x7ce87: ; 0x7ce87
	step_down
	step_left
	step_left
	step_left
	step_end
; 0x7ce8c

MovementData_0x7ce8c: ; 0x7ce8c
	step_down
	step_down
	step_left
	step_left
	step_left
	step_end
; 0x7ce92

MovementData_0x7ce92: ; 0x7ce92
	step_right
	step_right
	step_right
	step_up
	step_end
; 0x7ce97

MovementData_0x7ce97: ; 0x7ce97
	step_right
	step_right
	step_right
	step_up
	step_up
	step_end
; 0x7ce9d

UnknownText_0x7ce9d: ; 0x7ce9d
	text "Hold it!"

	para "I saw you, so I"
	line "tailed you."

	para "I don't need you"
	line "underfoot while I"

	para "take care of TEAM"
	line "ROCKET."

	para "…Wait a second."
	line "You beat me be-"
	cont "fore, didn't you?"

	para "That was just a"
	line "fluke."

	para "But I repay my"
	line "debts!"
	done
; 0x7cf5d

UnknownText_0x7cf5d: ; 0x7cf5d
	text "…Why…"
	line "Why do I lose?"

	para "I've assembled the"
	line "toughest #MON."

	para "I didn't ease up"
	line "on the gas."

	para "So why do I lose?"
	done
; 0x7cfc2

UnknownText_0x7cfc2: ; 0x7cfc2
	text "…I don't under-"
	line "stand…"

	para "Is what that LANCE"
	line "guy said true?"

	para "That I don't treat"
	line "#MON properly?"

	para "Love…"

	para "Trust…"

	para "Are they really"
	line "what I lack?"

	para "Are they keeping"
	line "me from winning?"

	para "I… I just don't"
	line "understand."

	para "But it's not going"
	line "to end here."

	para "Not now. Not"
	line "because of this."

	para "I won't give up my"
	line "dream of becoming"

	para "the world's best"
	line "#MON trainer!"
	done
; 0x7d102

UnknownText_0x7d102: ; 0x7d102
	text "Humph. This is my"
	line "real power, wimp."

	para "I'll make TEAM"
	line "ROCKET history."

	para "And I'm going to"
	line "grind that LANCE"
	cont "under my heels."
	done
; 0x7d176

UnknownText_0x7d176: ; 0x7d176
	text "I was challenged"
	line "to a battle down-"
	cont "stairs."

	para "It's rough down"
	line "there. You'd"
	cont "better be careful."
	done
; 0x7d1d0

UnknownText_0x7d1d0: ; 0x7d1d0
	text "There are some"
	line "shops downstairs…"

	para "But there are"
	line "also trainers."

	para "I'm scared to go"
	line "down there."
	done
; 0x7d22b

GruntM11SeenText: ; 0x7d22b
	text "Open one shutter,"
	line "another closes."

	para "Bet you can't get"
	line "where you want!"
	done
; 0x7d26f

GruntM11BeatenText: ; 0x7d26f
	text "Drat! I was sunk"
	line "by indecision!"
	done
; 0x7d290

UnknownText_0x7d290: ; 0x7d290
	text "I'm confused too…"
	line "The switch on the"

	para "end is the one to"
	line "press first, but…"
	done
; 0x7d2d8

GruntM25SeenText: ; 0x7d2d8
	text "Kwahaha!"

	para "Confounded by the"
	line "shutters, are we?"

	para "I'll let you in on"
	line "a secret if you"
	cont "can beat me!"
	done
; 0x7d335

GruntM25BeatenText: ; 0x7d335
	text "Uwww…"
	line "I blew it."
	done
; 0x7d347

UnknownText_0x7d347: ; 0x7d347
	text "All right. A hint!"

	para "Change the order"
	line "of switching."

	para "That'll change the"
	line "ways the shutters"
	cont "open and close."
	done
; 0x7d3ae

BurglarDuncanSeenText: ; 0x7d3ae
	text "Fork over your"
	line "goodies!"
	done
; 0x7d3c7

BurglarDuncanBeatenText: ; 0x7d3c7
	text "Mercy!"
	done
; 0x7d3cf

UnknownText_0x7d3cf: ; 0x7d3cf
	text "Steal and sell!"
	line "That's basic in"
	cont "crime, kid!"
	done
; 0x7d3fb

BurglarEddieSeenText: ; 0x7d3fb
	text "They ditched this"
	line "project before"
	cont "they finished."

	para "I'm searching for"
	line "leftover loot."
	done
; 0x7d44c

BurglarEddieBeatenText: ; 0x7d44c
	text "Over the top!"
	done
; 0x7d45b

UnknownText_0x7d45b: ; 0x7d45b
	text "UNDERGROUND WARE-"
	line "HOUSE?"

	para "What do you want"
	line "to go there for?"

	para "There's nothing"
	line "down there."
	done
; 0x7d4b2

GruntM13SeenText: ; 0x7d4b2
	text "I don't care if"
	line "you're lost."

	para "You show up here,"
	line "you're nothing but"
	cont "a victim!"
	done
; 0x7d4fc

GruntM13BeatenText: ; 0x7d4fc
	text "Urk! Yeah, think"
	line "you're cool, huh?"
	done
; 0x7d51f

UnknownText_0x7d51f: ; 0x7d51f
	text "You must have ice"
	line "in your veins to"
	cont "dis TEAM ROCKET."
	done
; 0x7d554

UnknownText_0x7d554: ; 0x7d554
	text "It's labeled"
	line "SWITCH 1."
	done
; 0x7d56b

GruntF3SeenText: ; 0x7d56b
	text "Are you lost? No,"
	line "you can't be."

	para "You don't have"
	line "that scared look."

	para "I'll give you"
	line "something to be"
	cont "scared about!"
	done
; 0x7d5d6

GruntF3BeatenText: ; 0x7d5d6
	text "How could you?"
	done
; 0x7d5e6

UnknownText_0x7d5e6: ; 0x7d5e6
	text "Go wherever you'd"
	line "like! Get lost!"
	cont "See if I care!"
	done
; 0x7d617

UnknownText_0x7d617: ; 0x7d617
	text "It's OFF."
	line "Turn it ON?"
	done
; 0x7d62d

UnknownText_0x7d62d: ; 0x7d62d
	text "It's ON."
	line "Turn it OFF?"
	done
; 0x7d643

UnknownText_0x7d643: ; 0x7d643
	text "It's labeled"
	line "SWITCH 2."
	done
; 0x7d65a

UnknownText_0x7d65a: ; 0x7d65a
	text "It's labeled"
	line "SWITCH 3."
	done
; 0x7d671

UnknownText_0x7d671: ; 0x7d671
	text "It's labeled"
	line "EMERGENCY."
	done
; 0x7d689

UndergroundPathSwitchRoomEntrances_MapEventHeader: ; 0x7d689
	; filler
	db 0, 0

	; warps
	db 9
	warp_def $3, $17, 6, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $a, $16, 1, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $a, $17, 2, GROUP_UNDERGROUND_WAREHOUSE, MAP_UNDERGROUND_WAREHOUSE
	warp_def $19, $5, 2, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1d, $4, 14, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $1d, $5, 14, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $19, $15, 1, GROUP_WAREHOUSE_ENTRANCE, MAP_WAREHOUSE_ENTRANCE
	warp_def $1d, $14, 13, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $1d, $15, 13, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 2
	xy_trigger 0, $4, $13, $0, UnknownScript_0x7ca80, $0, $0
	xy_trigger 0, $5, $13, $0, UnknownScript_0x7caaa, $0, $0

	; signposts
	db 6
	signpost 1, 16, $0, MapUndergroundPathSwitchRoomEntrancesSignpost0Script
	signpost 1, 10, $0, MapUndergroundPathSwitchRoomEntrancesSignpost1Script
	signpost 1, 2, $0, MapUndergroundPathSwitchRoomEntrancesSignpost2Script
	signpost 11, 20, $0, MapUndergroundPathSwitchRoomEntrancesSignpost3Script
	signpost 9, 8, $7, MapUndergroundPathSwitchRoomEntrancesSignpostItem4
	signpost 8, 1, $7, MapUndergroundPathSwitchRoomEntrancesSignpostItem5

	; people-events
	db 11
	person_event SPRITE_PHARMACIST, 16, 13, $9, $0, 255, 255, $a2, 2, TrainerBurglarDuncan, $06ce
	person_event SPRITE_PHARMACIST, 12, 8, $8, $0, 255, 255, $a2, 2, TrainerBurglarEddie, $06ce
	person_event SPRITE_ROCKET, 6, 21, $6, $0, 255, 255, $2, 3, TrainerGruntM13, $06ce
	person_event SPRITE_ROCKET, 6, 15, $6, $0, 255, 255, $2, 3, TrainerGruntM11, $06ce
	person_event SPRITE_ROCKET, 6, 7, $6, $0, 255, 255, $2, 3, TrainerGruntM25, $06ce
	person_event SPRITE_ROCKET_GIRL, 16, 23, $6, $0, 255, 255, $82, 1, TrainerGruntF3, $06ce
	person_event SPRITE_TEACHER, 31, 7, $6, $0, 255, 255, $0, 0, TeacherScript_0x7ca7d, $ffff
	person_event SPRITE_SUPER_NERD, 31, 23, $6, $0, 255, 255, $0, 0, SuperNerdScript_0x7ca7a, $ffff
	person_event SPRITE_POKE_BALL, 16, 5, $1, $0, 255, 255, $1, 0, ItemFragment_0x7ce7d, $0673
	person_event SPRITE_POKE_BALL, 13, 18, $1, $0, 255, 255, $1, 0, ItemFragment_0x7ce7f, $0674
	person_event SPRITE_SILVER, 7, 27, $6, $0, 255, 255, $0, 0, ObjectEvent, $06c1
; 0x7d779
