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
	checkbit1 $02d7
	iffalse UnknownScript_0x7ca01
	changeblock $10, $6, $2d
UnknownScript_0x7ca01: ; 0x7ca01
	checkbit1 $02d8
	iffalse UnknownScript_0x7ca0b
	changeblock $a, $6, $2d
UnknownScript_0x7ca0b: ; 0x7ca0b
	checkbit1 $02d9
	iffalse UnknownScript_0x7ca15
	changeblock $2, $6, $2d
UnknownScript_0x7ca15: ; 0x7ca15
	checkbit1 $02da
	iffalse UnknownScript_0x7ca1f
	changeblock $2, $a, $2d
UnknownScript_0x7ca1f: ; 0x7ca15
	checkbit1 $02db
	iffalse UnknownScript_0x7ca29
	changeblock $a, $a, $2d
UnknownScript_0x7ca29: ; 0x7ca29
	checkbit1 $02dc
	iffalse UnknownScript_0x7ca33
	changeblock $10, $a, $2d
UnknownScript_0x7ca33: ; 0x7ca33
	checkbit1 $02dd
	iffalse UnknownScript_0x7ca41
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
UnknownScript_0x7ca41: ; 0x7ca41
	checkbit1 $02de
	iffalse UnknownScript_0x7ca4f
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
UnknownScript_0x7ca4f: ; 0x7ca4f
	checkbit1 $02df
	iffalse UnknownScript_0x7ca5d
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
UnknownScript_0x7ca5d: ; 0x7ca5d
	checkbit1 $02e0
	iffalse UnknownScript_0x7ca6b
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
UnknownScript_0x7ca6b: ; 0x7ca6b
	checkbit1 $02e1
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
	spriteface $0, $3
	showemote $0, $0, 15
	special $006a
	pause 15
	playsound $0023
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce87
	spriteface $0, $3
	2call UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce92
	playsound $0023
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end
; 0x7caaa

UnknownScript_0x7caaa: ; 0x7caaa
	spriteface $0, $3
	showemote $0, $0, 15
	special $006a
	pause 15
	playsound $0023
	appear $c
	waitbutton
	applymovement $c, MovementData_0x7ce8c
	spriteface $0, $3
	2call UnknownScript_0x7cad4
	applymovement $c, MovementData_0x7ce97
	playsound $0023
	disappear $c
	dotrigger $1
	waitbutton
	playmapmusic
	end
; 0x7cad4

UnknownScript_0x7cad4: ; 0x7cad4
	checkbit1 $06c5
	iftrue UnknownScript_0x7cae1
	setbit1 $06c5
	domaptrigger GROUP_BURNED_TOWER_1F, MAP_BURNED_TOWER_1F, $1
UnknownScript_0x7cae1: ; 0x7cae1
	playmusic $001f
	loadfont
	2writetext UnknownText_0x7ce9d
	closetext
	loadmovesprites
	setbit1 $06c1
	checkbit1 $001c
	iftrue UnknownScript_0x7cb09
	checkbit1 $001d
	iftrue UnknownScript_0x7cb19
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_12
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7cb29
; 0x7cb09

UnknownScript_0x7cb09: ; 0x7cb09
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_10
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7cb29
; 0x7cb19

UnknownScript_0x7cb19: ; 0x7cb19
	winlosstext UnknownText_0x7cf5d, UnknownText_0x7d102
	setlasttalked $c
	loadtrainer RIVAL1, RIVAL1_11
	startbattle
	reloadmapmusic
	returnafterbattle
	2jump UnknownScript_0x7cb29
; 0x7cb29

UnknownScript_0x7cb29: ; 0x7cb29
	playmusic $0020
	loadfont
	2writetext UnknownText_0x7cfc2
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
	2writetext UnknownText_0x7d290
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
	2writetext UnknownText_0x7d347
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
	2writetext UnknownText_0x7d3cf
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
	2writetext UnknownText_0x7d45b
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
	2writetext UnknownText_0x7d51f
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
	2writetext UnknownText_0x7d5e6
	closetext
	loadmovesprites
	end
; 0x7cbab

MapUndergroundPathSwitchRoomEntrancesSignpost0Script: ; 0x7cbab
	loadfont
	2writetext UnknownText_0x7d554
	keeptextopen
	checkbit1 $02d3
	iftrue UnknownScript_0x7cbcb
	2writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $1
	copyvartobyte UndergroundSwitchPositions
	setbit1 $02d3
	2jump UnknownScript_0x7cc8d
; 0x7cbcb

UnknownScript_0x7cbcb: ; 0x7cbcb
	2writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -1
	copyvartobyte UndergroundSwitchPositions
	clearbit1 $02d3
	2jump UnknownScript_0x7cc8d
; 0x7cbe0

MapUndergroundPathSwitchRoomEntrancesSignpost1Script: ; 0x7cbe0
	loadfont
	2writetext UnknownText_0x7d643
	keeptextopen
	checkbit1 $02d4
	iftrue UnknownScript_0x7cc00
	2writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $2
	copyvartobyte UndergroundSwitchPositions
	setbit1 $02d4
	2jump UnknownScript_0x7cc8d
; 0x7cc00

UnknownScript_0x7cc00: ; 0x7cc00
	2writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -2
	copyvartobyte UndergroundSwitchPositions
	clearbit1 $02d4
	2jump UnknownScript_0x7cc8d
; 0x7cc15

MapUndergroundPathSwitchRoomEntrancesSignpost2Script: ; 0x7cc15
	loadfont
	2writetext UnknownText_0x7d65a
	keeptextopen
	checkbit1 $02d5
	iftrue UnknownScript_0x7cc35
	2writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar $3
	copyvartobyte UndergroundSwitchPositions
	setbit1 $02d5
	2jump UnknownScript_0x7cc8d
; 0x7cc35

UnknownScript_0x7cc35: ; 0x7cc35
	2writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	copybytetovar UndergroundSwitchPositions
	addvar -3
	copyvartobyte UndergroundSwitchPositions
	clearbit1 $02d5
	2jump UnknownScript_0x7cc8d
; 0x7cc4a

MapUndergroundPathSwitchRoomEntrancesSignpost3Script: ; 0x7cc4a
	loadfont
	2writetext UnknownText_0x7d671
	keeptextopen
	checkbit1 $02d6
	iftrue UnknownScript_0x7cc70
	2writetext UnknownText_0x7d617
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $7
	copyvartobyte UndergroundSwitchPositions
	setbit1 $02d6
	setbit1 $02d3
	setbit1 $02d4
	setbit1 $02d5
	2jump UnknownScript_0x7cc8d
; 0x7cc70

UnknownScript_0x7cc70: ; 0x7cc70
	2writetext UnknownText_0x7d62d
	yesorno
	iffalse UnknownScript_0x7cc8b
	writebyte $0
	copyvartobyte UndergroundSwitchPositions
	clearbit1 $02d6
	clearbit1 $02d3
	clearbit1 $02d4
	clearbit1 $02d5
	2jump UnknownScript_0x7cc8d
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
	playsound $001f
	2call UnknownScript_0x7ce11
	2call UnknownScript_0x7ce19
	2call UnknownScript_0x7ce21
	2call UnknownScript_0x7ce29
	2call UnknownScript_0x7ce31
	2call UnknownScript_0x7ce39
	2call UnknownScript_0x7ce41
	2call UnknownScript_0x7ce4d
	2call UnknownScript_0x7ce59
	2call UnknownScript_0x7ce65
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7ccd7

UnknownScript_0x7ccd7: ; 0x7ccd7
	playsound $001f
	2call UnknownScript_0x7cda5
	2call UnknownScript_0x7cdd5
	2call UnknownScript_0x7cdf9
	2call UnknownScript_0x7ce39
	2call UnknownScript_0x7ce4d
	2call UnknownScript_0x7ce59
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7ccf2

UnknownScript_0x7ccf2: ; 0x7ccf2
	playsound $001f
	2call UnknownScript_0x7cdad
	2call UnknownScript_0x7cde1
	2call UnknownScript_0x7cded
	2call UnknownScript_0x7ce31
	2call UnknownScript_0x7ce41
	2call UnknownScript_0x7ce65
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd0d

UnknownScript_0x7cd0d: ; 0x7cd0d
	playsound $001f
	2call UnknownScript_0x7cdb5
	2call UnknownScript_0x7cdd5
	2call UnknownScript_0x7cdf9
	2call UnknownScript_0x7ce29
	2call UnknownScript_0x7ce4d
	2call UnknownScript_0x7ce59
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd28

UnknownScript_0x7cd28: ; 0x7cd28
	playsound $001f
	2call UnknownScript_0x7cdbd
	2call UnknownScript_0x7cde1
	2call UnknownScript_0x7cded
	2call UnknownScript_0x7ce21
	2call UnknownScript_0x7ce41
	2call UnknownScript_0x7ce65
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd43

UnknownScript_0x7cd43: ; 0x7cd43
	playsound $001f
	2call UnknownScript_0x7cdc5
	2call UnknownScript_0x7cdd5
	2call UnknownScript_0x7cdf9
	2call UnknownScript_0x7ce19
	2call UnknownScript_0x7ce4d
	2call UnknownScript_0x7ce59
	2call UnknownScript_0x7ce71
	reloadmappart
	loadmovesprites
	end
; 0x7cd5e

UnknownScript_0x7cd5e: ; 0x7cd5e
	playsound $001f
	2call UnknownScript_0x7cdcd
	2call UnknownScript_0x7cde1
	2call UnknownScript_0x7cded
	2call UnknownScript_0x7ce05
	2call UnknownScript_0x7ce11
	2call UnknownScript_0x7ce41
	2call UnknownScript_0x7ce65
	reloadmappart
	loadmovesprites
	end
; 0x7cd79

UnknownScript_0x7cd79: ; 0x7cd79
	playsound $001f
	2call UnknownScript_0x7ce11
	2call UnknownScript_0x7ce19
	2call UnknownScript_0x7cdb5
	2call UnknownScript_0x7ce29
	2call UnknownScript_0x7cdc5
	2call UnknownScript_0x7cdcd
	2call UnknownScript_0x7ce41
	2call UnknownScript_0x7cde1
	2call UnknownScript_0x7cded
	2call UnknownScript_0x7ce65
	2call UnknownScript_0x7ce05
	reloadmappart
	loadmovesprites
	writebyte $6
	copyvartobyte UndergroundSwitchPositions
	end
; 0x7cda5

UnknownScript_0x7cda5: ; 0x7cda5
	changeblock $10, $6, $2d
	setbit1 $02d7
	end
; 0x7cdad

UnknownScript_0x7cdad: ; 0x7cdad
	changeblock $a, $6, $2d
	setbit1 $02d8
	end
; 0x7cdb5

UnknownScript_0x7cdb5: ; 0x7cdb5
	changeblock $2, $6, $2d
	setbit1 $02d9
	end
; 0x7cdbd

UnknownScript_0x7cdbd: ; 0x7cdbd
	changeblock $2, $a, $2d
	setbit1 $02da
	end
; 0x7cdc5

UnknownScript_0x7cdc5: ; 0x7cdc5
	changeblock $a, $a, $2d
	setbit1 $02db
	end
; 0x7cdcd

UnknownScript_0x7cdcd: ; 0x7cdcd
	changeblock $10, $a, $2d
	setbit1 $02dc
	end
; 0x7cdd5

UnknownScript_0x7cdd5: ; 0x7cdd5
	changeblock $c, $6, $2a
	changeblock $c, $8, $2d
	setbit1 $02dd
	end
; 0x7cde1

UnknownScript_0x7cde1: ; 0x7cde1
	changeblock $6, $6, $2a
	changeblock $6, $8, $2d
	setbit1 $02de
	end
; 0x7cded

UnknownScript_0x7cded: ; 0x7cded
	changeblock $c, $a, $2a
	changeblock $c, $c, $2d
	setbit1 $02df
	end
; 0x7cdf9

UnknownScript_0x7cdf9: ; 0x7cdf9
	changeblock $6, $a, $2a
	changeblock $6, $c, $2d
	setbit1 $02e0
	end
; 0x7ce05

UnknownScript_0x7ce05: ; 0x7ce05
	changeblock $12, $a, $2a
	changeblock $12, $c, $2d
	setbit1 $02e1
	end
; 0x7ce11

UnknownScript_0x7ce11: ; 0x7ce11
	changeblock $10, $6, $3e
	clearbit1 $02d7
	end
; 0x7ce19

UnknownScript_0x7ce19: ; 0x7ce19
	changeblock $a, $6, $3e
	clearbit1 $02d8
	end
; 0x7ce21

UnknownScript_0x7ce21: ; 0x7ce21
	changeblock $2, $6, $3e
	clearbit1 $02d9
	end
; 0x7ce29

UnknownScript_0x7ce29: ; 0x7ce29
	changeblock $2, $a, $3e
	clearbit1 $02da
	end
; 0x7ce31

UnknownScript_0x7ce31: ; 0x7ce31
	changeblock $a, $a, $3e
	clearbit1 $02db
	end
; 0x7ce39

UnknownScript_0x7ce39: ; 0x7ce39
	changeblock $10, $a, $3e
	clearbit1 $02dc
	end
; 0x7ce41

UnknownScript_0x7ce41: ; 0x7ce41
	changeblock $c, $6, $3f
	changeblock $c, $8, $3d
	clearbit1 $02dd
	end
; 0x7ce4d

UnknownScript_0x7ce4d: ; 0x7ce4d
	changeblock $6, $6, $3f
	changeblock $6, $8, $3d
	clearbit1 $02de
	end
; 0x7ce59

UnknownScript_0x7ce59: ; 0x7ce59
	changeblock $c, $a, $3f
	changeblock $c, $c, $3d
	clearbit1 $02df
	end
; 0x7ce65

UnknownScript_0x7ce65: ; 0x7ce65
	changeblock $6, $a, $3f
	changeblock $6, $c, $3d
	clearbit1 $02e0
	end
; 0x7ce71

UnknownScript_0x7ce71: ; 0x7ce71
	changeblock $12, $a, $3f
	changeblock $12, $c, $3d
	clearbit1 $02e1
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
	db $0, "Hold it!", $51
	db "I saw you, so I", $4f
	db "tailed you.", $51
	db "I don't need you", $4f
	db "underfoot while I", $51
	db "take care of TEAM", $4f
	db "ROCKET.", $51
	db "…Wait a second.", $4f
	db "You beat me be-", $55
	db "fore, didn't you?", $51
	db "That was just a", $4f
	db "fluke.", $51
	db "But I repay my", $4f
	db "debts!", $57
; 0x7cf5d

UnknownText_0x7cf5d: ; 0x7cf5d
	db $0, "…Why…", $4f
	db "Why do I lose?", $51
	db "I've assembled the", $4f
	db "toughest #MON.", $51
	db "I didn't ease up", $4f
	db "on the gas.", $51
	db "So why do I lose?", $57
; 0x7cfc2

UnknownText_0x7cfc2: ; 0x7cfc2
	db $0, "…I don't under-", $4f
	db "stand…", $51
	db "Is what that LANCE", $4f
	db "guy said true?", $51
	db "That I don't treat", $4f
	db "#MON properly?", $51
	db "Love…", $51
	db "Trust…", $51
	db "Are they really", $4f
	db "what I lack?", $51
	db "Are they keeping", $4f
	db "me from winning?", $51
	db "I… I just don't", $4f
	db "understand.", $51
	db "But it's not going", $4f
	db "to end here.", $51
	db "Not now. Not", $4f
	db "because of this.", $51
	db "I won't give up my", $4f
	db "dream of becoming", $51
	db "the world's best", $4f
	db "#MON trainer!", $57
; 0x7d102

UnknownText_0x7d102: ; 0x7d102
	db $0, "Humph. This is my", $4f
	db "real power, wimp.", $51
	db "I'll make TEAM", $4f
	db "ROCKET history.", $51
	db "And I'm going to", $4f
	db "grind that LANCE", $55
	db "under my heels.", $57
; 0x7d176

UnknownText_0x7d176: ; 0x7d176
	db $0, "I was challenged", $4f
	db "to a battle down-", $55
	db "stairs.", $51
	db "It's rough down", $4f
	db "there. You'd", $55
	db "better be careful.", $57
; 0x7d1d0

UnknownText_0x7d1d0: ; 0x7d1d0
	db $0, "There are some", $4f
	db "shops downstairs…", $51
	db "But there are", $4f
	db "also trainers.", $51
	db "I'm scared to go", $4f
	db "down there.", $57
; 0x7d22b

GruntM11SeenText: ; 0x7d22b
	db $0, "Open one shutter,", $4f
	db "another closes.", $51
	db "Bet you can't get", $4f
	db "where you want!", $57
; 0x7d26f

GruntM11BeatenText: ; 0x7d26f
	db $0, "Drat! I was sunk", $4f
	db "by indecision!", $57
; 0x7d290

UnknownText_0x7d290: ; 0x7d290
	db $0, "I'm confused too…", $4f
	db "The switch on the", $51
	db "end is the one to", $4f
	db "press first, but…", $57
; 0x7d2d8

GruntM25SeenText: ; 0x7d2d8
	db $0, "Kwahaha!", $51
	db "Confounded by the", $4f
	db "shutters, are we?", $51
	db "I'll let you in on", $4f
	db "a secret if you", $55
	db "can beat me!", $57
; 0x7d335

GruntM25BeatenText: ; 0x7d335
	db $0, "Uwww…", $4f
	db "I blew it.", $57
; 0x7d347

UnknownText_0x7d347: ; 0x7d347
	db $0, "All right. A hint!", $51
	db "Change the order", $4f
	db "of switching.", $51
	db "That'll change the", $4f
	db "ways the shutters", $55
	db "open and close.", $57
; 0x7d3ae

BurglarDuncanSeenText: ; 0x7d3ae
	db $0, "Fork over your", $4f
	db "goodies!", $57
; 0x7d3c7

BurglarDuncanBeatenText: ; 0x7d3c7
	db $0, "Mercy!", $57
; 0x7d3cf

UnknownText_0x7d3cf: ; 0x7d3cf
	db $0, "Steal and sell!", $4f
	db "That's basic in", $55
	db "crime, kid!", $57
; 0x7d3fb

BurglarEddieSeenText: ; 0x7d3fb
	db $0, "They ditched this", $4f
	db "project before", $55
	db "they finished.", $51
	db "I'm searching for", $4f
	db "leftover loot.", $57
; 0x7d44c

BurglarEddieBeatenText: ; 0x7d44c
	db $0, "Over the top!", $57
; 0x7d45b

UnknownText_0x7d45b: ; 0x7d45b
	db $0, "UNDERGROUND WARE-", $4f
	db "HOUSE?", $51
	db "What do you want", $4f
	db "to go there for?", $51
	db "There's nothing", $4f
	db "down there.", $57
; 0x7d4b2

GruntM13SeenText: ; 0x7d4b2
	db $0, "I don't care if", $4f
	db "you're lost.", $51
	db "You show up here,", $4f
	db "you're nothing but", $55
	db "a victim!", $57
; 0x7d4fc

GruntM13BeatenText: ; 0x7d4fc
	db $0, "Urk! Yeah, think", $4f
	db "you're cool, huh?", $57
; 0x7d51f

UnknownText_0x7d51f: ; 0x7d51f
	db $0, "You must have ice", $4f
	db "in your veins to", $55
	db "dis TEAM ROCKET.", $57
; 0x7d554

UnknownText_0x7d554: ; 0x7d554
	db $0, "It's labeled", $4f
	db "SWITCH 1.", $57
; 0x7d56b

GruntF3SeenText: ; 0x7d56b
	db $0, "Are you lost? No,", $4f
	db "you can't be.", $51
	db "You don't have", $4f
	db "that scared look.", $51
	db "I'll give you", $4f
	db "something to be", $55
	db "scared about!", $57
; 0x7d5d6

GruntF3BeatenText: ; 0x7d5d6
	db $0, "How could you?", $57
; 0x7d5e6

UnknownText_0x7d5e6: ; 0x7d5e6
	db $0, "Go wherever you'd", $4f
	db "like! Get lost!", $55
	db "See if I care!", $57
; 0x7d617

UnknownText_0x7d617: ; 0x7d617
	db $0, "It's OFF.", $4f
	db "Turn it ON?", $57
; 0x7d62d

UnknownText_0x7d62d: ; 0x7d62d
	db $0, "It's ON.", $4f
	db "Turn it OFF?", $57
; 0x7d643

UnknownText_0x7d643: ; 0x7d643
	db $0, "It's labeled", $4f
	db "SWITCH 2.", $57
; 0x7d65a

UnknownText_0x7d65a: ; 0x7d65a
	db $0, "It's labeled", $4f
	db "SWITCH 3.", $57
; 0x7d671

UnknownText_0x7d671: ; 0x7d671
	db $0, "It's labeled", $4f
	db "EMERGENCY.", $57
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

