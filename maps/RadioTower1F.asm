RadioTower1F_MapScriptHeader: ; 0x5cd27
	; trigger count
	db 0

	; callback count
	db 0
; 0x5cd29

ReceptionistScript_0x5cd29: ; 0x5cd29
	faceplayer
	loadfont
	checkflag $0013
	iftrue UnknownScript_0x5cd37
	writetext UnknownText_0x5ce77
	closetext
	loadmovesprites
	end
; 0x5cd37

UnknownScript_0x5cd37: ; 0x5cd37
	writetext UnknownText_0x5ce81
	closetext
	loadmovesprites
	end
; 0x5cd3d

GentlemanScript_0x5cd3d: ; 0x5cd3d
	faceplayer
	loadfont
	writetext UnknownText_0x5ceba
	keeptextopen
	special $0053
	iffalse UnknownScript_0x5cd4c
	special $0054
UnknownScript_0x5cd4c: ; 0x5cd4c
	special $0055
	checkflag $004e
	iftrue UnknownScript_0x5cd84
	writetext UnknownText_0x5cf3a
	keeptextopen
	loadmovesprites
	applymovement $6, MovementData_0x5ce71
	loadfont
	writetext UnknownText_0x5cf5a
	keeptextopen
	waitbutton
	writetext UnknownText_0x5cf79
	playsound SFX_DEX_FANFARE_20_49
	waitbutton
	keeptextopen
	special $0052
	loadmovesprites
	applymovement $6, MovementData_0x5ce74
	loadfont
	if_equal $1, UnknownScript_0x5cd8a
	if_equal $2, UnknownScript_0x5cd9f
	if_equal $3, UnknownScript_0x5cdb4
	jump UnknownScript_0x5cdc9
; 0x5cd84

UnknownScript_0x5cd84: ; 0x5cd84
	writetext UnknownText_0x5cf7e
	closetext
	loadmovesprites
	end
; 0x5cd8a

UnknownScript_0x5cd8a: ; 0x5cd8a
	writetext UnknownText_0x5cfb5
	playsound SFX_1ST_PLACE
	waitbutton
	keeptextopen
	giveitem MASTER_BALL, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setflag $004e
	jump UnknownScript_0x5cd84
; 0x5cd9f

UnknownScript_0x5cd9f: ; 0x5cd9f
	writetext UnknownText_0x5d023
	playsound SFX_2ND_PLACE
	waitbutton
	keeptextopen
	giveitem EXP_SHARE, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setflag $004e
	jump UnknownScript_0x5cd84
; 0x5cdb4

UnknownScript_0x5cdb4: ; 0x5cdb4
	writetext UnknownText_0x5d076
	playsound SFX_3RD_PLACE
	waitbutton
	keeptextopen
	giveitem PP_UP, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setflag $004e
	jump UnknownScript_0x5cd84
; 0x5cdc9

UnknownScript_0x5cdc9: ; 0x5cdc9
	writetext UnknownText_0x5d0c0
	closetext
	loadmovesprites
	end
; 0x5cdcf

UnknownScript_0x5cdcf: ; 0x5cdcf
	writetext UnknownText_0x5d0e6
	closetext
	loadmovesprites
	end
; 0x5cdd5

CooltrainerFScript_0x5cdd5: ; 0x5cdd5
	faceplayer
	loadfont
	checkflag $0000
	iftrue UnknownScript_0x5ce2d
	writetext UnknownText_0x5d12d
	yesorno
	iffalse UnknownScript_0x5ce4b
	writetext UnknownText_0x5d1f2
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext UnknownText_0x5d231
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext UnknownText_0x5d282
	yesorno
	iftrue UnknownScript_0x5ce42
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext UnknownText_0x5d2bc
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext UnknownText_0x5d30e
	yesorno
	iftrue UnknownScript_0x5ce42
	playsound SFX_ELEVATOR_END
	waitbutton
	writetext UnknownText_0x5d37b
	keeptextopen
	stringtotext RadioCardText, $1
	scall UnknownScript_0x5ce3e
	writetext UnknownText_0x5d3c0
	keeptextopen
	setflag $0000
UnknownScript_0x5ce2d: ; 0x5ce2d
	writetext UnknownText_0x5d3e5
	closetext
	loadmovesprites
	end
; 0x5ce33

RadioCardText: ; 0x5ce33
	db "RADIO CARD@"
; 0x5ce3d

UnknownScript_0x5ce3e: ; 0x5ce3e
	jumpstd $002f
	end
; 0x5ce42

UnknownScript_0x5ce42: ; 0x5ce42
	playsound SFX_WRONG
	writetext UnknownText_0x5d409
	closetext
	loadmovesprites
	end
; 0x5ce4b

UnknownScript_0x5ce4b: ; 0x5ce4b
	writetext UnknownText_0x5d443
	closetext
	loadmovesprites
	end
; 0x5ce51

LassScript_0x5ce51: ; 0x5ce51
	jumptextfaceplayer UnknownText_0x5d476
; 0x5ce54

YoungsterScript_0x5ce54: ; 0x5ce54
	jumptextfaceplayer UnknownText_0x5d4ac
; 0x5ce57

TrainerGruntM3: ; 0x5ce57
	; bit/flag number
	dw $4f3

	; trainer group && trainer id
	db GRUNTM, 3

	; text when seen
	dw GruntM3SeenText

	; text when trainer beaten
	dw GruntM3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GruntM3Script
; 0x5ce63

GruntM3Script: ; 0x5ce63
	talkaftercancel
	loadfont
	writetext UnknownText_0x5d5a2
	closetext
	loadmovesprites
	end
; 0x5ce6b

MapRadioTower1FSignpost0Script: ; 0x5ce6b
	jumptext UnknownText_0x5d5e7
; 0x5ce6e

MapRadioTower1FSignpost1Script: ; 0x5ce6e
	jumptext UnknownText_0x5d631
; 0x5ce71

MovementData_0x5ce71: ; 0x5ce71
	step_right
	turn_head_up
	step_end
; 0x5ce74

MovementData_0x5ce74: ; 0x5ce74
	step_left
	turn_head_up
	step_end
; 0x5ce77

UnknownText_0x5ce77: ; 0x5ce77
	text "Welcome!"
	done
; 0x5ce81

UnknownText_0x5ce81: ; 0x5ce81
	text "Hello. I'm sorry,"
	line "but we're not"
	cont "offering any tours"
	cont "today."
	done
; 0x5ceba

UnknownText_0x5ceba: ; 0x5ceba
	text "Hi, are you here"
	line "for the LUCKY NUM-"
	cont "BER SHOW?"

	para "Want me to check"
	line "the ID numbers of"
	cont "your #MON?"

	para "If you get lucky,"
	line "you win a prize."
	done
; 0x5cf3a

UnknownText_0x5cf3a: ; 0x5cf3a
	text "This week's ID"
	line "number is @"
	text_from_ram StringBuffer3
	text "."
	done
; 0x5cf5a

UnknownText_0x5cf5a: ; 0x5cf5a
	text "Let's see if you"
	line "have a match."
	done
; 0x5cf79

UnknownText_0x5cf79: ; 0x5cf79
	db $0, $56, $4f
	db $56, $57
; 0x5cf7e

UnknownText_0x5cf7e: ; 0x5cf7e
	text "Please come back"
	line "next week for the"
	cont "next LUCKY NUMBER."
	done
; 0x5cfb5

UnknownText_0x5cfb5: ; 0x5cfb5
	text "Wow! You have a"
	line "perfect match of"
	cont "all five numbers!"

	para "We have a grand"
	line "prize winner!"

	para "You have won a"
	line "MASTER BALL!"
	done
; 0x5d023

UnknownText_0x5d023: ; 0x5d023
	text "Hey! You've"
	line "matched the last"
	cont "three numbers!"

	para "You've won second"
	line "prize, an EXP."
	cont "SHARE!"
	done
; 0x5d076

UnknownText_0x5d076: ; 0x5d076
	text "Ooh, you've"
	line "matched the last"
	cont "two numbers."

	para "You've won third"
	line "prize, a PP UP."
	done
; 0x5d0c0

UnknownText_0x5d0c0: ; 0x5d0c0
	text "Nope, none of your"
	line "ID numbers match."
	done
; 0x5d0e6

UnknownText_0x5d0e6: ; 0x5d0e6
	text "You've got no room"
	line "for your prize."

	para "Make room and come"
	line "back right away."
	done
; 0x5d12d

UnknownText_0x5d12d: ; 0x5d12d
	text "We have a special"
	line "quiz campaign on"
	cont "right now."

	para "Answer five ques-"
	line "tions correctly to"
	cont "win a RADIO CARD."

	para "Slide it into your"
	line "#GEAR to play"

	para "the radio anytime,"
	line "anywhere."

	para "Would you like to"
	line "take the quiz?"
	done
; 0x5d1f2

UnknownText_0x5d1f2: ; 0x5d1f2
	text "Question 1:"

	para "Is there a #MON"
	line "that appears only"
	cont "in the morning?"
	done
; 0x5d231

UnknownText_0x5d231: ; 0x5d231
	text "Correct!"
	line "Question 2:"

	para "Is this statement"
	line "correct?"

	para "You can't buy a"
	line "BERRY at a MART."
	done
; 0x5d282

UnknownText_0x5d282: ; 0x5d282
	text "Bull's-eye!"
	line "Question 3:"

	para "Does HM01 contain"
	line "the move FLASH?"
	done
; 0x5d2bc

UnknownText_0x5d2bc: ; 0x5d2bc
	text "So far so good!"
	line "Question 4:"

	para "Is FALKNER the"
	line "VIOLET GYM LEADER"

	para "who uses bird"
	line "#MON?"
	done
; 0x5d30e

UnknownText_0x5d30e: ; 0x5d30e
	text "Wow! Right again!"
	line "Here's the final"
	cont "question:"

	para "Do GOLDENROD GAME"
	line "CORNER's slots"

	para "have CHARMANDER"
	line "on their reels?"
	done
; 0x5d37b

UnknownText_0x5d37b: ; 0x5d37b
	text "Bingo! You got it!"
	line "Congratulations!"

	para "Here's your prize,"
	line "a RADIO CARD!"
	done
; 0x5d3c0

UnknownText_0x5d3c0: ; 0x5d3c0
	text $52, "'s #GEAR"
	line "can now double as"
	cont "a radio!"
	done
; 0x5d3e5

UnknownText_0x5d3e5: ; 0x5d3e5
	text "Please tune in to"
	line "our radio shows."
	done
; 0x5d409

UnknownText_0x5d409: ; 0x5d409
	text "Oh, dear."
	line "Sorry, but you"

	para "got it wrong."
	line "Please try again!"
	done
; 0x5d443

UnknownText_0x5d443: ; 0x5d443
	text "Oh. I see. Please"
	line "see me if you"
	cont "change your mind."
	done
; 0x5d476

UnknownText_0x5d476: ; 0x5d476
	text "BEN is a fabulous"
	line "DJ."

	para "His sweet voice"
	line "makes me melt!"
	done
; 0x5d4ac

UnknownText_0x5d4ac: ; 0x5d4ac
	text "I love MARY, from"
	line "#MON TALK."

	para "I only know what"
	line "she sounds like,"
	cont "though."
	done
; 0x5d4f4

GruntM3SeenText: ; 0x5d4f4
	text "We've finally"
	line "taken over the"
	cont "RADIO TOWER!"

	para "Now everyone will"
	line "get to experience"

	para "the true terror of"
	line "TEAM ROCKET!"

	para "We'll show you"
	line "how scary we are!"
	done
; 0x5d582

GruntM3BeatenText: ; 0x5d582
	text "Too strong! We"
	line "must watch you…"
	done
; 0x5d5a2

UnknownText_0x5d5a2: ; 0x5d5a2
	text "You're too strong."

	para "Our plan could be"
	line "ruined. I must"
	cont "warn the others…"
	done
; 0x5d5e7

UnknownText_0x5d5e7: ; 0x5d5e7
	text "1F RECEPTION"
	line "2F SALES"

	para "3F PERSONNEL"
	line "4F PRODUCTION"

	para "5F DIRECTOR'S"
	line "   OFFICE"
	done
; 0x5d631

UnknownText_0x5d631: ; 0x5d631
	text "LUCKY CHANNEL!"

	para "Win with #MON"
	line "ID numbers!"

	para "Trade your #MON"
	line "to collect differ-"
	cont "ent ID numbers!"
	done
; 0x5d68e

RadioTower1F_MapEventHeader: ; 0x5d68e
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $2, 11, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 11, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $0, $f, 2, GROUP_RADIO_TOWER_2F, MAP_RADIO_TOWER_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 3, $0, MapRadioTower1FSignpost0Script
	signpost 0, 13, $0, MapRadioTower1FSignpost1Script

	; people-events
	db 6
	person_event SPRITE_RECEPTIONIST, 10, 9, $8, $0, 255, 255, $80, 0, ReceptionistScript_0x5cd29, $ffff
	person_event SPRITE_LASS, 8, 20, $8, $0, 255, 255, $80, 0, LassScript_0x5ce51, $06cf
	person_event SPRITE_YOUNGSTER, 8, 19, $9, $0, 255, 255, $90, 0, YoungsterScript_0x5ce54, $06cf
	person_event SPRITE_ROCKET, 5, 18, $6, $0, 255, 255, $2, 3, TrainerGruntM3, $06ce
	person_event SPRITE_GENTLEMAN, 10, 12, $7, $0, 255, 255, $90, 0, GentlemanScript_0x5cd3d, $06cf
	person_event SPRITE_COOLTRAINER_F, 10, 16, $7, $0, 255, 255, $a0, 0, CooltrainerFScript_0x5cdd5, $06cf
; 0x5d6fb

