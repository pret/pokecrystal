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
	2writetext UnknownText_0x9b420
	keeptextopen
	special $0067
	iffalse UnknownScript_0x9b3a6
	trainertotext CAL, CAL2, $0
	2jump UnknownScript_0x9b3aa
; 0x9b3a6

UnknownScript_0x9b3a6: ; 0x9b3a6
	trainertotext CAL, CAL3, $0
UnknownScript_0x9b3aa: ; 0x9b3aa
	2writetext UnknownText_0x9b46a
	keeptextopen
	2writetext UnknownText_0x9b487
	yesorno
	iffalse UnknownScript_0x9b3ed
	setflag $0057
	2writetext UnknownText_0x9b4a2
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b401
	loadfont
	2writetext UnknownText_0x9b587
	closetext
	loadmovesprites
	special $0067
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
	2writetext UnknownText_0x9b4d6
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9b41d
	end
; 0x9b3f7

UnknownScript_0x9b3f7: ; 0x9b3f7
	2writetext UnknownText_0x9b51d
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
	db $0, "Hi. Welcome to our", $4f
	db "TRAINING HALL.", $51
	db "You may battle a", $4f
	db "trainer once per", $55
	db "day.", $57
; 0x9b46a

UnknownText_0x9b46a: ; 0x9b46a
	text_from_ram $d099
	db $0, " is your", $4f
	db "opponent today.", $57
; 0x9b487

UnknownText_0x9b487: ; 0x9b487
	db $0, "Would you like to", $4f
	db "battle?", $57
; 0x9b4a2

UnknownText_0x9b4a2: ; 0x9b4a2
	db $0, "Please go right", $4f
	db "through.", $51
	db "You may begin", $4f
	db "right away.", $57
; 0x9b4d6

UnknownText_0x9b4d6: ; 0x9b4d6
	db $0, "Sorry. Only those", $4f
	db "trainers who will", $51
	db "be battling are", $4f
	db "allowed to go in.", $57
; 0x9b51d

UnknownText_0x9b51d: ; 0x9b51d
	db $0, "I'm sorry.", $4f
	db "This would be your", $51
	db "second time today.", $4f
	db "You're permitted", $51
	db "to enter just once", $4f
	db "a day.", $57
; 0x9b578

UnknownText_0x9b578: ; 0x9b578
	db $0, "I lost…", $4f
	db "Darn…", $57
; 0x9b587

UnknownText_0x9b587: ; 0x9b587
	db $0, "I traveled out", $4f
	db "here just so I", $55
	db "could battle you.", $57
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

