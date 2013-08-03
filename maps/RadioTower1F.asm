RadioTower1F_MapScriptHeader: ; 0x5cd27
	; trigger count
	db 0

	; callback count
	db 0
; 0x5cd29

ReceptionistScript_0x5cd29: ; 0x5cd29
	faceplayer
	loadfont
	checkbit2 $0013
	iftrue UnknownScript_0x5cd37
	2writetext UnknownText_0x5ce77
	closetext
	loadmovesprites
	end
; 0x5cd37

UnknownScript_0x5cd37: ; 0x5cd37
	2writetext UnknownText_0x5ce81
	closetext
	loadmovesprites
	end
; 0x5cd3d

GentlemanScript_0x5cd3d: ; 0x5cd3d
	faceplayer
	loadfont
	2writetext UnknownText_0x5ceba
	keeptextopen
	special $0053
	iffalse UnknownScript_0x5cd4c
	special $0054
UnknownScript_0x5cd4c: ; 0x5cd4c
	special $0055
	checkbit2 $004e
	iftrue UnknownScript_0x5cd84
	2writetext UnknownText_0x5cf3a
	keeptextopen
	loadmovesprites
	applymovement $6, MovementData_0x5ce71
	loadfont
	2writetext UnknownText_0x5cf5a
	keeptextopen
	waitbutton
	2writetext UnknownText_0x5cf79
	playsound $0009
	waitbutton
	keeptextopen
	special $0052
	loadmovesprites
	applymovement $6, MovementData_0x5ce74
	loadfont
	if_equal $1, UnknownScript_0x5cd8a
	if_equal $2, UnknownScript_0x5cd9f
	if_equal $3, UnknownScript_0x5cdb4
	2jump UnknownScript_0x5cdc9
; 0x5cd84

UnknownScript_0x5cd84: ; 0x5cd84
	2writetext UnknownText_0x5cf7e
	closetext
	loadmovesprites
	end
; 0x5cd8a

UnknownScript_0x5cd8a: ; 0x5cd8a
	2writetext UnknownText_0x5cfb5
	playsound $0099
	waitbutton
	keeptextopen
	giveitem MASTER_BALL, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setbit2 $004e
	2jump UnknownScript_0x5cd84
; 0x5cd9f

UnknownScript_0x5cd9f: ; 0x5cd9f
	2writetext UnknownText_0x5d023
	playsound $0098
	waitbutton
	keeptextopen
	giveitem EXP_SHARE, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setbit2 $004e
	2jump UnknownScript_0x5cd84
; 0x5cdb4

UnknownScript_0x5cdb4: ; 0x5cdb4
	2writetext UnknownText_0x5d076
	playsound $0094
	waitbutton
	keeptextopen
	giveitem PP_UP, $1
	iffalse UnknownScript_0x5cdcf
	itemnotify
	setbit2 $004e
	2jump UnknownScript_0x5cd84
; 0x5cdc9

UnknownScript_0x5cdc9: ; 0x5cdc9
	2writetext UnknownText_0x5d0c0
	closetext
	loadmovesprites
	end
; 0x5cdcf

UnknownScript_0x5cdcf: ; 0x5cdcf
	2writetext UnknownText_0x5d0e6
	closetext
	loadmovesprites
	end
; 0x5cdd5

CooltrainerFScript_0x5cdd5: ; 0x5cdd5
	faceplayer
	loadfont
	checkbit2 $0000
	iftrue UnknownScript_0x5ce2d
	2writetext UnknownText_0x5d12d
	yesorno
	iffalse UnknownScript_0x5ce4b
	2writetext UnknownText_0x5d1f2
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound $0027
	waitbutton
	2writetext UnknownText_0x5d231
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound $0027
	waitbutton
	2writetext UnknownText_0x5d282
	yesorno
	iftrue UnknownScript_0x5ce42
	playsound $0027
	waitbutton
	2writetext UnknownText_0x5d2bc
	yesorno
	iffalse UnknownScript_0x5ce42
	playsound $0027
	waitbutton
	2writetext UnknownText_0x5d30e
	yesorno
	iftrue UnknownScript_0x5ce42
	playsound $0027
	waitbutton
	2writetext UnknownText_0x5d37b
	keeptextopen
	stringtotext RadioCardText, $1
	2call UnknownScript_0x5ce3e
	2writetext UnknownText_0x5d3c0
	keeptextopen
	setbit2 $0000
UnknownScript_0x5ce2d: ; 0x5ce2d
	2writetext UnknownText_0x5d3e5
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
	playsound $0019
	2writetext UnknownText_0x5d409
	closetext
	loadmovesprites
	end
; 0x5ce4b

UnknownScript_0x5ce4b: ; 0x5ce4b
	2writetext UnknownText_0x5d443
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
	2writetext UnknownText_0x5d5a2
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
	db $0, "Welcome!", $57
; 0x5ce81

UnknownText_0x5ce81: ; 0x5ce81
	db $0, "Hello. I'm sorry,", $4f
	db "but we're not", $55
	db "offering any tours", $55
	db "today.", $57
; 0x5ceba

UnknownText_0x5ceba: ; 0x5ceba
	db $0, "Hi, are you here", $4f
	db "for the LUCKY NUM-", $55
	db "BER SHOW?", $51
	db "Want me to check", $4f
	db "the ID numbers of", $55
	db "your #MON?", $51
	db "If you get lucky,", $4f
	db "you win a prize.", $57
; 0x5cf3a

UnknownText_0x5cf3a: ; 0x5cf3a
	db $0, "This week's ID", $4f
	db "number is @"
	text_from_ram $d099
	db $0, ".", $57
; 0x5cf5a

UnknownText_0x5cf5a: ; 0x5cf5a
	db $0, "Let's see if you", $4f
	db "have a match.", $57
; 0x5cf79

UnknownText_0x5cf79: ; 0x5cf79
	db $0, $56, $4f
	db $56, $57
; 0x5cf7e

UnknownText_0x5cf7e: ; 0x5cf7e
	db $0, "Please come back", $4f
	db "next week for the", $55
	db "next LUCKY NUMBER.", $57
; 0x5cfb5

UnknownText_0x5cfb5: ; 0x5cfb5
	db $0, "Wow! You have a", $4f
	db "perfect match of", $55
	db "all five numbers!", $51
	db "We have a grand", $4f
	db "prize winner!", $51
	db "You have won a", $4f
	db "MASTER BALL!", $57
; 0x5d023

UnknownText_0x5d023: ; 0x5d023
	db $0, "Hey! You've", $4f
	db "matched the last", $55
	db "three numbers!", $51
	db "You've won second", $4f
	db "prize, an EXP.", $55
	db "SHARE!", $57
; 0x5d076

UnknownText_0x5d076: ; 0x5d076
	db $0, "Ooh, you've", $4f
	db "matched the last", $55
	db "two numbers.", $51
	db "You've won third", $4f
	db "prize, a PP UP.", $57
; 0x5d0c0

UnknownText_0x5d0c0: ; 0x5d0c0
	db $0, "Nope, none of your", $4f
	db "ID numbers match.", $57
; 0x5d0e6

UnknownText_0x5d0e6: ; 0x5d0e6
	db $0, "You've got no room", $4f
	db "for your prize.", $51
	db "Make room and come", $4f
	db "back right away.", $57
; 0x5d12d

UnknownText_0x5d12d: ; 0x5d12d
	db $0, "We have a special", $4f
	db "quiz campaign on", $55
	db "right now.", $51
	db "Answer five ques-", $4f
	db "tions correctly to", $55
	db "win a RADIO CARD.", $51
	db "Slide it into your", $4f
	db "#GEAR to play", $51
	db "the radio anytime,", $4f
	db "anywhere.", $51
	db "Would you like to", $4f
	db "take the quiz?", $57
; 0x5d1f2

UnknownText_0x5d1f2: ; 0x5d1f2
	db $0, "Question 1:", $51
	db "Is there a #MON", $4f
	db "that appears only", $55
	db "in the morning?", $57
; 0x5d231

UnknownText_0x5d231: ; 0x5d231
	db $0, "Correct!", $4f
	db "Question 2:", $51
	db "Is this statement", $4f
	db "correct?", $51
	db "You can't buy a", $4f
	db "BERRY at a MART.", $57
; 0x5d282

UnknownText_0x5d282: ; 0x5d282
	db $0, "Bull's-eye!", $4f
	db "Question 3:", $51
	db "Does HM01 contain", $4f
	db "the move FLASH?", $57
; 0x5d2bc

UnknownText_0x5d2bc: ; 0x5d2bc
	db $0, "So far so good!", $4f
	db "Question 4:", $51
	db "Is FALKNER the", $4f
	db "VIOLET GYM LEADER", $51
	db "who uses bird", $4f
	db "#MON?", $57
; 0x5d30e

UnknownText_0x5d30e: ; 0x5d30e
	db $0, "Wow! Right again!", $4f
	db "Here's the final", $55
	db "question:", $51
	db "Do GOLDENROD GAME", $4f
	db "CORNER's slots", $51
	db "have CHARMANDER", $4f
	db "on their reels?", $57
; 0x5d37b

UnknownText_0x5d37b: ; 0x5d37b
	db $0, "Bingo! You got it!", $4f
	db "Congratulations!", $51
	db "Here's your prize,", $4f
	db "a RADIO CARD!", $57
; 0x5d3c0

UnknownText_0x5d3c0: ; 0x5d3c0
	db $0, $52, "'s #GEAR", $4f
	db "can now double as", $55
	db "a radio!", $57
; 0x5d3e5

UnknownText_0x5d3e5: ; 0x5d3e5
	db $0, "Please tune in to", $4f
	db "our radio shows.", $57
; 0x5d409

UnknownText_0x5d409: ; 0x5d409
	db $0, "Oh, dear.", $4f
	db "Sorry, but you", $51
	db "got it wrong.", $4f
	db "Please try again!", $57
; 0x5d443

UnknownText_0x5d443: ; 0x5d443
	db $0, "Oh. I see. Please", $4f
	db "see me if you", $55
	db "change your mind.", $57
; 0x5d476

UnknownText_0x5d476: ; 0x5d476
	db $0, "BEN is a fabulous", $4f
	db "DJ.", $51
	db "His sweet voice", $4f
	db "makes me melt!", $57
; 0x5d4ac

UnknownText_0x5d4ac: ; 0x5d4ac
	db $0, "I love MARY, from", $4f
	db "#MON TALK.", $51
	db "I only know what", $4f
	db "she sounds like,", $55
	db "though.", $57
; 0x5d4f4

GruntM3SeenText: ; 0x5d4f4
	db $0, "We've finally", $4f
	db "taken over the", $55
	db "RADIO TOWER!", $51
	db "Now everyone will", $4f
	db "get to experience", $51
	db "the true terror of", $4f
	db "TEAM ROCKET!", $51
	db "We'll show you", $4f
	db "how scary we are!", $57
; 0x5d582

GruntM3BeatenText: ; 0x5d582
	db $0, "Too strong! We", $4f
	db "must watch you…", $57
; 0x5d5a2

UnknownText_0x5d5a2: ; 0x5d5a2
	db $0, "You're too strong.", $51
	db "Our plan could be", $4f
	db "ruined. I must", $55
	db "warn the others…", $57
; 0x5d5e7

UnknownText_0x5d5e7: ; 0x5d5e7
	db $0, "1F RECEPTION", $4f
	db "2F SALES", $51
	db "3F PERSONNEL", $4f
	db "4F PRODUCTION", $51
	db "5F DIRECTOR'S", $4f
	db "   OFFICE", $57
; 0x5d631

UnknownText_0x5d631: ; 0x5d631
	db $0, "LUCKY CHANNEL!", $51
	db "Win with #MON", $4f
	db "ID numbers!", $51
	db "Trade your #MON", $4f
	db "to collect differ-", $55
	db "ent ID numbers!", $57
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

