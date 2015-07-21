TrainerHouseB1F_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x9b38a, $0000

.MapCallbacks:
	db 0

UnknownScript_0x9b38a:
	end

UnknownScript_0x9b38b:
	spriteface $0, UP
	loadfont
	checkflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
	iftrue UnknownScript_0x9b3f7
	writetext UnknownText_0x9b420
	keeptextopen
	special SpecialTrainerHouse
	iffalse UnknownScript_0x9b3a6
	trainertotext CAL, CAL2, $0
	jump UnknownScript_0x9b3aa

UnknownScript_0x9b3a6:
	trainertotext CAL, CAL3, $0
UnknownScript_0x9b3aa:
	writetext UnknownText_0x9b46a
	keeptextopen
	writetext UnknownText_0x9b487
	yesorno
	iffalse UnknownScript_0x9b3ed
	setflag ENGINE_FOUGHT_IN_TRAINER_HALL_TODAY
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
UnknownScript_0x9b3dc:
	winlosstext UnknownText_0x9b578, $0000
	setlasttalked $3
	loadtrainer CAL, CAL3
	startbattle
	returnafterbattle
UnknownScript_0x9b3e8:
	applymovement $0, MovementData_0x9b40f
	end

UnknownScript_0x9b3ed:
	writetext UnknownText_0x9b4d6
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b41d
	end

UnknownScript_0x9b3f7:
	writetext UnknownText_0x9b51d
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b41d
	end

MovementData_0x9b401:
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

MovementData_0x9b40f:
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

MovementData_0x9b41d:
	step_right
	turn_head_left
	step_end

UnknownText_0x9b420:
	text "Hi. Welcome to our"
	line "TRAINING HALL."

	para "You may battle a"
	line "trainer once per"
	cont "day."
	done

UnknownText_0x9b46a:
	text_from_ram StringBuffer3
	text " is your"
	line "opponent today."
	done

UnknownText_0x9b487:
	text "Would you like to"
	line "battle?"
	done

UnknownText_0x9b4a2:
	text "Please go right"
	line "through."

	para "You may begin"
	line "right away."
	done

UnknownText_0x9b4d6:
	text "Sorry. Only those"
	line "trainers who will"

	para "be battling are"
	line "allowed to go in."
	done

UnknownText_0x9b51d:
	text "I'm sorry."
	line "This would be your"

	para "second time today."
	line "You're permitted"

	para "to enter just once"
	line "a day."
	done

UnknownText_0x9b578:
	text "I lost…"
	line "Darn…"
	done

UnknownText_0x9b587:
	text "I traveled out"
	line "here just so I"
	cont "could battle you."
	done

TrainerHouseB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $4, $9, 3, GROUP_TRAINER_HOUSE_1F, MAP_TRAINER_HOUSE_1F

.XYTriggers:
	db 1
	xy_trigger 0, $3, $7, $0, UnknownScript_0x9b38b, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_RECEPTIONIST, 5, 11, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ObjectEvent, -1
	person_event SPRITE_CHRIS, 15, 10, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ObjectEvent, -1
