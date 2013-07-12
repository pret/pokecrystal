VermilionPort_MapScriptHeader: ; 0x74d90
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x74d9d, $0000
	dw UnknownScript_0x74d9e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x74da2
; 0x74d9d

UnknownScript_0x74d9d: ; 0x74d9d
	end
; 0x74d9e

UnknownScript_0x74d9e: ; 0x74d9e
	priorityjump UnknownScript_0x74da6
	end
; 0x74da2

UnknownScript_0x74da2: ; 0x74da2
	setbit2 $003a
	return
; 0x74da6

UnknownScript_0x74da6: ; 0x74da6
	applymovement $0, MovementData_0x74ef3
	appear $2
	dotrigger $0
	setbit1 $0731
	setbit1 $0730
	setbit1 $0739
	clearbit1 $0733
	setbit1 $0030
	setbit1 $0000
	blackoutmod GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	end
; 0x74dc4

SailorScript_0x74dc4: ; 0x74dc4
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x74e1a
	2writetext UnknownText_0x74f06
	closetext
	loadmovesprites
	spriteface $2, $0
	pause 10
	playsound $0023
	disappear $2
	waitbutton
	applymovement $0, MovementData_0x74ef1
	playsound $0023
	special $002e
	waitbutton
	setbit1 $073a
	clearbit1 $073b
	clearbit1 $04eb
	clearbit1 $042f
	clearbit1 $0540
	clearbit1 $0493
	clearbit1 $04d4
	clearbit1 $04dd
	clearbit1 $057c
	clearbit1 $05b7
	clearbit1 $0476
	clearbit1 $0477
	setbit1 $002f
	appear $2
	domaptrigger GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $1
	warp GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F, $19, $1
	end
; 0x74e1a

UnknownScript_0x74e1a: ; 0x74e1a
	2writetext UnknownText_0x74f31
	closetext
	loadmovesprites
	end
; 0x74e20

UnknownScript_0x74e20: ; 0x74e20
	spriteface $3, $3
	checkbit1 $0000
	iftrue UnknownScript_0x74e86
	checkbit1 $0001
	iftrue UnknownScript_0x74e86
	spriteface $0, $2
	loadfont
	checkcode $b
	if_equal MONDAY, UnknownScript_0x74e72
	if_equal TUESDAY, UnknownScript_0x74e72
	if_equal THURSDAY, UnknownScript_0x74e7c
	if_equal FRIDAY, UnknownScript_0x74e7c
	if_equal SATURDAY, UnknownScript_0x74e7c
	2writetext UnknownText_0x74f4d
	yesorno
	iffalse UnknownScript_0x74e8d
	2writetext UnknownText_0x74f8b
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x74e68
	2writetext UnknownText_0x74fc2
	closetext
	loadmovesprites
	setbit1 $0001
	applymovement $0, MovementData_0x74ef8
	2jump SailorScript_0x74dc4
; 0x74e68

UnknownScript_0x74e68: ; 0x74e68
	2writetext UnknownText_0x74ff2
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74ef5
	end
; 0x74e72

UnknownScript_0x74e72: ; 0x74e72
	2writetext UnknownText_0x75059
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74ef5
	end
; 0x74e7c

UnknownScript_0x74e7c: ; 0x74e7c
	2writetext UnknownText_0x75080
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74ef5
	end
; 0x74e86

UnknownScript_0x74e86: ; 0x74e86
	end
; 0x74e87

UnknownScript_0x74e87: ; 0x74e87
	2writetext UnknownText_0x74fa7
	closetext
	loadmovesprites
	end
; 0x74e8d

UnknownScript_0x74e8d: ; 0x74e8d
	2writetext UnknownText_0x74fa7
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x74ef5
	end
; 0x74e97

SailorScript_0x74e97: ; 0x74e97
	faceplayer
	loadfont
	checkbit1 $0000
	iftrue UnknownScript_0x74e1a
	checkcode $b
	if_equal MONDAY, UnknownScript_0x74eda
	if_equal TUESDAY, UnknownScript_0x74eda
	if_equal THURSDAY, UnknownScript_0x74ee0
	if_equal FRIDAY, UnknownScript_0x74ee0
	if_equal SATURDAY, UnknownScript_0x74ee0
	2writetext UnknownText_0x74f4d
	yesorno
	iffalse UnknownScript_0x74e87
	2writetext UnknownText_0x74f8b
	keeptextopen
	checkitem S_S_TICKET
	iffalse UnknownScript_0x74ed4
	2writetext UnknownText_0x74fc2
	closetext
	loadmovesprites
	setbit1 $0001
	applymovement $0, MovementData_0x74efe
	2jump SailorScript_0x74dc4
; 0x74ed4

UnknownScript_0x74ed4: ; 0x74ed4
	2writetext UnknownText_0x74ff2
	closetext
	loadmovesprites
	end
; 0x74eda

UnknownScript_0x74eda: ; 0x74eda
	2writetext UnknownText_0x75059
	closetext
	loadmovesprites
	end
; 0x74ee0

UnknownScript_0x74ee0: ; 0x74ee0
	2writetext UnknownText_0x75080
	closetext
	loadmovesprites
	end
; 0x74ee6

SuperNerdScript_0x74ee6: ; 0x74ee6
	faceplayer
	loadfont
	2writetext UnknownText_0x750a6
	closetext
	loadmovesprites
	end
; 0x74eee

MapVermilionPortSignpostItem0: ; 0x74eee
	dw $00eb
	db IRON
	
; 0x74ef1

MovementData_0x74ef1: ; 0x74ef1
	step_down
	step_end
; 0x74ef3

MovementData_0x74ef3: ; 0x74ef3
	step_up
	step_end
; 0x74ef5

MovementData_0x74ef5: ; 0x74ef5
	step_right
	turn_head_left
	step_end
; 0x74ef8

MovementData_0x74ef8: ; 0x74ef8
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74efe

MovementData_0x74efe: ; 0x74efe
	step_right
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_end
; 0x74f06

UnknownText_0x74f06: ; 0x74f06
	db $0, "We're departing", $4f
	db "soon. Please get", $55
	db "on board.", $57
; 0x74f31

UnknownText_0x74f31: ; 0x74f31
	db $0, "Sorry. You can't", $4f
	db "board now.", $57
; 0x74f4d

UnknownText_0x74f4d: ; 0x74f4d
	db $0, "Welcome to FAST", $4f
	db "SHIP S.S.AQUA.", $51
	db "Will you be board-", $4f
	db "ing today?", $57
; 0x74f8b

UnknownText_0x74f8b: ; 0x74f8b
	db $0, "May I see your", $4f
	db "S.S.TICKET?", $57
; 0x74fa7

UnknownText_0x74fa7: ; 0x74fa7
	db $0, "We hope to see you", $4f
	db "again!", $57
; 0x74fc2

UnknownText_0x74fc2: ; 0x74fc2
	db $0, $52, " flashed", $4f
	db "the S.S.TICKET.", $51
	db "That's it.", $4f
	db "Thank you!", $57
; 0x74ff2

UnknownText_0x74ff2: ; 0x74ff2
	db $0, $52, " tried to", $4f
	db "show the S.S.", $55
	db "TICKET…", $51
	db "…But no TICKET!", $51
	db "Sorry!", $4f
	db "You may board only", $51
	db "if you have an", $4f
	db "S.S.TICKET.", $57
; 0x75059

UnknownText_0x75059: ; 0x75059
	db $0, "The FAST SHIP will", $4f
	db "sail on Wednesday.", $57
; 0x75080

UnknownText_0x75080: ; 0x75080
	db $0, "The FAST SHIP will", $4f
	db "sail next Sunday.", $57
; 0x750a6

UnknownText_0x750a6: ; 0x750a6
	db $0, "You came from", $4f
	db "JOHTO?", $51
	db "I hear many rare", $4f
	db "#MON live over", $55
	db "there.", $57
; 0x750e3

VermilionPort_MapEventHeader: ; 0x750e3
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $9, 5, GROUP_VERMILION_PORT_PASSAGE, MAP_VERMILION_PORT_PASSAGE
	warp_def $11, $7, 1, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 1
	xy_trigger 0, $b, $7, $0, UnknownScript_0x74e20, $0, $0

	; signposts
	db 1
	signpost 13, 16, $7, MapVermilionPortSignpostItem0

	; people-events
	db 3
	person_event SPRITE_SAILOR, 21, 11, $7, $0, 255, 255, $0, 0, SailorScript_0x74dc4, $072b
	person_event SPRITE_SAILOR, 15, 10, $9, $0, 255, 255, $0, 0, SailorScript_0x74e97, $ffff
	person_event SPRITE_SUPER_NERD, 15, 15, $5, $2, 255, 255, $0, 0, SuperNerdScript_0x74ee6, $ffff
; 0x75127

