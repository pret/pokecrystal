TrainerHouseB1F_MapScriptHeader: ; 0x9b384
	; trigger count
	db 1

	; triggers
	dw UnknownScript_0x9b38a, $0000

	; callback count
	db 0
; 0x9b38a

UnknownScript_0x9b38a: ; 0x9b38a
	end
; 0x9b38b

UnknownScript_0x9b38b: ; 0x9b38b
	spriteface $0, $1
	loadfont
	checkflag $0057
	iftrue UnknownScript_0x9b3f7
	writetext UnknownText_0x9b420
	keeptextopen
	special SpecialTrainerHouse
	iffalse UnknownScript_0x9b3a6
	trainertotext CAL, CAL2, $0
	jump UnknownScript_0x9b3aa
; 0x9b3a6

UnknownScript_0x9b3a6: ; 0x9b3a6
	trainertotext CAL, CAL3, $0
UnknownScript_0x9b3aa: ; 0x9b3aa
	writetext UnknownText_0x9b46a
	keeptextopen
	writetext UnknownText_0x9b487
	yesorno
	iffalse UnknownScript_0x9b3ed
	setflag $0057
	writetext UnknownText_0x9b4a2
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b401
	loadfont
	writetext UnknownText_0x9b587
	closetext
	loadmovesprites
	special SpecialTrainerHouse
	iffalse UnknownScript_0x9b3dc
	winlosstext UnknownText_0x9b578, $0000
	setlasttalked $3
	loadtrainer CAL, CAL2
	startbattle
	returnafterbattle
	iffalse UnknownScript_0x9b3e8
UnknownScript_0x9b3dc: ; 0x9b3dc
	winlosstext UnknownText_0x9b578, $0000
	setlasttalked $3
	loadtrainer CAL, CAL3
	startbattle
	returnafterbattle
UnknownScript_0x9b3e8: ; 0x9b3e8
	applymovement $0, MovementData_0x9b40f
	end
; 0x9b3ed

UnknownScript_0x9b3ed: ; 0x9b3ed
	writetext UnknownText_0x9b4d6
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b41d
	end
; 0x9b3f7

UnknownScript_0x9b3f7: ; 0x9b3f7
	writetext UnknownText_0x9b51d
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b41d
	end
; 0x9b401

MovementData_0x9b401: ; 0x9b401
	step_left
	step_left
	step_left
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_down
	step_left
	turn_head_right
	step_end
; 0x9b40f

MovementData_0x9b40f: ; 0x9b40f
	step_up
	step_up
	step_up
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_right
	step_right
	step_right
	step_right
	step_end
; 0x9b41d

MovementData_0x9b41d: ; 0x9b41d
	step_right
	turn_head_left
	step_end
; 0x9b420

UnknownText_0x9b420: ; 0x9b420
	text "Hi. Welcome to our"
	line "TRAINING HALL."

	para "You may battle a"
	line "trainer once per"
	cont "day."
	done
; 0x9b46a

UnknownText_0x9b46a: ; 0x9b46a
	text_from_ram StringBuffer3
	text " is your"
	line "opponent today."
	done
; 0x9b487

UnknownText_0x9b487: ; 0x9b487
	text "Would you like to"
	line "battle?"
	done
; 0x9b4a2

UnknownText_0x9b4a2: ; 0x9b4a2
	text "Please go right"
	line "through."

	para "You may begin"
	line "right away."
	done
; 0x9b4d6

UnknownText_0x9b4d6: ; 0x9b4d6
	text "Sorry. Only those"
	line "trainers who will"

	para "be battling are"
	line "allowed to go in."
	done
; 0x9b51d

UnknownText_0x9b51d: ; 0x9b51d
	text "I'm sorry."
	line "This would be your"

	para "second time today."
	line "You're permitted"

	para "to enter just once"
	line "a day."
	done
; 0x9b578

UnknownText_0x9b578: ; 0x9b578
	text "I lost…"
	line "Darn…"
	done
; 0x9b587

UnknownText_0x9b587: ; 0x9b587
	text "I traveled out"
	line "here just so I"
	cont "could battle you."
	done
; 0x9b5b8

TrainerHouseB1F_MapEventHeader: ; 0x9b5b8
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $4, $9, 3, GROUP_TRAINER_HOUSE_1F, MAP_TRAINER_HOUSE_1F

	; xy triggers
	db 1
	xy_trigger 0, $3, $7, $0, UnknownScript_0x9b38b, $0, $0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_RECEPTIONIST, 5, 11, $6, $0, 255, 255, $a0, 0, ObjectEvent, $ffff
	person_event SPRITE_CHRIS, 15, 10, $8, $0, 255, 255, $80, 0, ObjectEvent, $ffff
; 0x9b5e5
