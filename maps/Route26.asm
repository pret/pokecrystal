Route26_MapScriptHeader: ; 0x1a4d1d
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a4d1f

TrainerCooltrainermJake: ; 0x1a4d1f
	; bit/flag number
	dw $550

	; trainer group && trainer id
	db COOLTRAINERM, JAKE

	; text when seen
	dw CooltrainermJakeSeenText

	; text when trainer beaten
	dw CooltrainermJakeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermJakeScript
; 0x1a4d2b

CooltrainermJakeScript: ; 0x1a4d2b
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a4f08
	closetext
	loadmovesprites
	end
; 0x1a4d33

TrainerCooltrainermGaven3: ; 0x1a4d33
	; bit/flag number
	dw $551

	; trainer group && trainer id
	db COOLTRAINERM, GAVEN3

	; text when seen
	dw CooltrainermGaven3SeenText

	; text when trainer beaten
	dw CooltrainermGaven3BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermGaven3Script
; 0x1a4d3f

CooltrainermGaven3Script: ; 0x1a4d3f
	writecode $17, $b
	talkaftercancel
	loadfont
	checkflag $0067
	iftrue UnknownScript_0x1a4d79
	checkcellnum $b
	iftrue UnknownScript_0x1a4dcb
	checkevent $026b
	iftrue UnknownScript_0x1a4d62
	writetext UnknownText_0x1a4fe4
	keeptextopen
	setevent $026b
	scall UnknownScript_0x1a4dbf
	jump UnknownScript_0x1a4d65
; 0x1a4d62

UnknownScript_0x1a4d62: ; 0x1a4d62
	scall UnknownScript_0x1a4dc3
UnknownScript_0x1a4d65: ; 0x1a4d65
	askforphonenumber $b
	if_equal $1, UnknownScript_0x1a4dd3
	if_equal $2, UnknownScript_0x1a4dcf
	trainertotext COOLTRAINERM, GAVEN3, $0
	scall UnknownScript_0x1a4dc7
	jump UnknownScript_0x1a4dcb
; 0x1a4d79

UnknownScript_0x1a4d79: ; 0x1a4d79
	scall UnknownScript_0x1a4dd7
	winlosstext CooltrainermGaven3BeatenText, $0000
	copybytetovar wd9f5
	if_equal $2, UnknownScript_0x1a4d90
	if_equal $1, UnknownScript_0x1a4d96
	if_equal $0, UnknownScript_0x1a4d9c
UnknownScript_0x1a4d90: ; 0x1a4d90
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a4db6
UnknownScript_0x1a4d96: ; 0x1a4d96
	checkevent $0044
	iftrue UnknownScript_0x1a4da9
UnknownScript_0x1a4d9c: ; 0x1a4d9c
	loadtrainer COOLTRAINERM, GAVEN3
	startbattle
	returnafterbattle
	loadvar wd9f5, $1
	clearflag $0067
	end
; 0x1a4da9

UnknownScript_0x1a4da9: ; 0x1a4da9
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	returnafterbattle
	loadvar wd9f5, $2
	clearflag $0067
	end
; 0x1a4db6

UnknownScript_0x1a4db6: ; 0x1a4db6
	loadtrainer COOLTRAINERM, GAVEN2
	startbattle
	returnafterbattle
	clearflag $0067
	end
; 0x1a4dbf

UnknownScript_0x1a4dbf: ; 0x1a4dbf
	jumpstd $0019
	end
; 0x1a4dc3

UnknownScript_0x1a4dc3: ; 0x1a4dc3
	jumpstd $001a
	end
; 0x1a4dc7

UnknownScript_0x1a4dc7: ; 0x1a4dc7
	jumpstd $001b
	end
; 0x1a4dcb

UnknownScript_0x1a4dcb: ; 0x1a4dcb
	jumpstd $001c
	end
; 0x1a4dcf

UnknownScript_0x1a4dcf: ; 0x1a4dcf
	jumpstd $001d
	end
; 0x1a4dd3

UnknownScript_0x1a4dd3: ; 0x1a4dd3
	jumpstd $001e
	end
; 0x1a4dd7

UnknownScript_0x1a4dd7: ; 0x1a4dd7
	jumpstd $001f
	end
; 0x1a4ddb

TrainerCooltrainerfJoyce: ; 0x1a4ddb
	; bit/flag number
	dw $562

	; trainer group && trainer id
	db COOLTRAINERF, JOYCE

	; text when seen
	dw CooltrainerfJoyceSeenText

	; text when trainer beaten
	dw CooltrainerfJoyceBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfJoyceScript
; 0x1a4de7

CooltrainerfJoyceScript: ; 0x1a4de7
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a50d7
	closetext
	loadmovesprites
	end
; 0x1a4def

TrainerCooltrainerfBeth1: ; 0x1a4def
	; bit/flag number
	dw $563

	; trainer group && trainer id
	db COOLTRAINERF, BETH1

	; text when seen
	dw CooltrainerfBeth1SeenText

	; text when trainer beaten
	dw CooltrainerfBeth1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfBeth1Script
; 0x1a4dfb

CooltrainerfBeth1Script: ; 0x1a4dfb
	writecode $17, $c
	talkaftercancel
	loadfont
	checkflag $0068
	iftrue UnknownScript_0x1a4e35
	checkcellnum $c
	iftrue UnknownScript_0x1a4e87
	checkevent $026d
	iftrue UnknownScript_0x1a4e1e
	writetext UnknownText_0x1a51d9
	keeptextopen
	setevent $026d
	scall UnknownScript_0x1a4e7b
	jump UnknownScript_0x1a4e21
; 0x1a4e1e

UnknownScript_0x1a4e1e: ; 0x1a4e1e
	scall UnknownScript_0x1a4e7f
UnknownScript_0x1a4e21: ; 0x1a4e21
	askforphonenumber $c
	if_equal $1, UnknownScript_0x1a4e8f
	if_equal $2, UnknownScript_0x1a4e8b
	trainertotext COOLTRAINERF, BETH1, $0
	scall UnknownScript_0x1a4e83
	jump UnknownScript_0x1a4e87
; 0x1a4e35

UnknownScript_0x1a4e35: ; 0x1a4e35
	scall UnknownScript_0x1a4e93
	winlosstext CooltrainerfBeth1BeatenText, $0000
	copybytetovar wd9f6
	if_equal $2, UnknownScript_0x1a4e4c
	if_equal $1, UnknownScript_0x1a4e52
	if_equal $0, UnknownScript_0x1a4e58
UnknownScript_0x1a4e4c: ; 0x1a4e4c
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a4e72
UnknownScript_0x1a4e52: ; 0x1a4e52
	checkevent $0044
	iftrue UnknownScript_0x1a4e65
UnknownScript_0x1a4e58: ; 0x1a4e58
	loadtrainer COOLTRAINERF, BETH1
	startbattle
	returnafterbattle
	loadvar wd9f6, $1
	clearflag $0068
	end
; 0x1a4e65

UnknownScript_0x1a4e65: ; 0x1a4e65
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	returnafterbattle
	loadvar wd9f6, $2
	clearflag $0068
	end
; 0x1a4e72

UnknownScript_0x1a4e72: ; 0x1a4e72
	loadtrainer COOLTRAINERF, BETH3
	startbattle
	returnafterbattle
	clearflag $0068
	end
; 0x1a4e7b

UnknownScript_0x1a4e7b: ; 0x1a4e7b
	jumpstd $0023
	end
; 0x1a4e7f

UnknownScript_0x1a4e7f: ; 0x1a4e7f
	jumpstd $0024
	end
; 0x1a4e83

UnknownScript_0x1a4e83: ; 0x1a4e83
	jumpstd $0025
	end
; 0x1a4e87

UnknownScript_0x1a4e87: ; 0x1a4e87
	jumpstd $0026
	end
; 0x1a4e8b

UnknownScript_0x1a4e8b: ; 0x1a4e8b
	jumpstd $0027
	end
; 0x1a4e8f

UnknownScript_0x1a4e8f: ; 0x1a4e8f
	jumpstd $0028
	end
; 0x1a4e93

UnknownScript_0x1a4e93: ; 0x1a4e93
	jumpstd $0029
	end
; 0x1a4e97

TrainerPsychicRichard: ; 0x1a4e97
	; bit/flag number
	dw $442

	; trainer group && trainer id
	db PSYCHIC_T, RICHARD

	; text when seen
	dw PsychicRichardSeenText

	; text when trainer beaten
	dw PsychicRichardBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicRichardScript
; 0x1a4ea3

PsychicRichardScript: ; 0x1a4ea3
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5278
	closetext
	loadmovesprites
	end
; 0x1a4eab

TrainerFisherScott: ; 0x1a4eab
	; bit/flag number
	dw $462

	; trainer group && trainer id
	db FISHER, SCOTT

	; text when seen
	dw FisherScottSeenText

	; text when trainer beaten
	dw FisherScottBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherScottScript
; 0x1a4eb7

FisherScottScript: ; 0x1a4eb7
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a5326
	closetext
	loadmovesprites
	end
; 0x1a4ebf

MapRoute26Signpost0Script: ; 0x1a4ebf
	jumptext UnknownText_0x1a5364
; 0x1a4ec2

FruitTreeScript_0x1a4ec2: ; 0x1a4ec2
	fruittree $e
; 0x1a4ec4

ItemFragment_0x1a4ec4: ; 0x1a4ec4
	db MAX_ELIXER, 1
; 0x1a4ec6

CooltrainermJakeSeenText: ; 0x1a4ec6
	text "I'm making my"
	line "final preparations"

	para "for the #MON"
	line "LEAGUE."
	done
; 0x1a4efc

CooltrainermJakeBeatenText: ; 0x1a4efc
	text "I blew it!"
	done
; 0x1a4f08

UnknownText_0x1a4f08: ; 0x1a4f08
	text "It's going to be"
	line "tough to win at"
	cont "the LEAGUE."

	para "I need to do some"
	line "more training."

	para "I hear that the"
	line "LEAGUE's ELITE"

	para "FOUR are tougher"
	line "than GYM LEADERS."
	done
; 0x1a4f97

CooltrainermGaven3SeenText: ; 0x1a4f97
	text "By experiencing"
	line "tough battles, you"
	cont "gain power."
	done
; 0x1a4fc7

CooltrainermGaven3BeatenText: ; 0x1a4fc7
	text "Gaah! Life is even"
	line "tougher!"
	done
; 0x1a4fe4

UnknownText_0x1a4fe4: ; 0x1a4fe4
	text "To get to #MON"
	line "LEAGUE, you have"

	para "to get through"
	line "VICTORY ROAD."

	para "But VICTORY ROAD"
	line "is tough."

	para "Practically nobody"
	line "goes there!"
	done
; 0x1a505c

CooltrainerfJoyceSeenText: ; 0x1a505c
	text "Since you've come"
	line "this far, you must"
	cont "be good."

	para "I'm going to give"
	line "this battle every-"
	cont "thing I've got!"
	done
; 0x1a50bd

CooltrainerfJoyceBeatenText: ; 0x1a50bd
	text "No! I don't"
	line "believe this!"
	done
; 0x1a50d7

UnknownText_0x1a50d7: ; 0x1a50d7
	text "I've defeated"
	line "eight GYM LEADERS,"

	para "so I was feeling"
	line "confident."

	para "I'll have to try"
	line "harder next time."
	done
; 0x1a5136

CooltrainerfBeth1SeenText: ; 0x1a5136
	text "I lost to a train-"
	line "er named ", $53, "."

	para "He was really"
	line "strong, but…"

	para "It was as if he"
	line "absolutely had to"
	cont "win at any cost."

	para "I felt sorry for"
	line "his #MON."
	done
; 0x1a51bf

CooltrainerfBeth1BeatenText: ; 0x1a51bf
	text "#MON aren't"
	line "tools of war."
	done
; 0x1a51d9

UnknownText_0x1a51d9: ; 0x1a51d9
	text "#MON are in-"
	line "valuable, lifelong"
	cont "partners."
	done
; 0x1a5204

PsychicRichardSeenText: ; 0x1a5204
	text "Wow, look at all"
	line "those BADGES!"
	cont "I'm impressed."

	para "But you're not"
	line "satisfied by just"

	para "collecting them,"
	line "right?"
	done
; 0x1a526a

PsychicRichardBeatenText: ; 0x1a526a
	text "Good battle!"
	done
; 0x1a5278

UnknownText_0x1a5278: ; 0x1a5278
	text "People and #MON"
	line "grow from their"
	cont "experiences."

	para "Don't get lazy and"
	line "complacent."
	done
; 0x1a52c4

FisherScottSeenText: ; 0x1a52c4
	text "I'm feeling great"
	line "today!"

	para "I feel like I"
	line "could boot even"
	cont "the LEAGUE CHAMP!"
	done
; 0x1a530d

FisherScottBeatenText: ; 0x1a530d
	text "No! Not in this"
	line "battle!"
	done
; 0x1a5326

UnknownText_0x1a5326: ; 0x1a5326
	text "Just like in fish-"
	line "ing, it's all over"

	para "in #MON if you"
	line "give up."
	done
; 0x1a5364

UnknownText_0x1a5364: ; 0x1a5364
	text "ROUTE 26"

	para "#MON LEAGUE"
	line "RECEPTION GATE"
	done
; 0x1a5389

Route26_MapEventHeader: ; 0x1a5389
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $5, $7, 3, GROUP_VICTORY_ROAD_GATE, MAP_VICTORY_ROAD_GATE
	warp_def $39, $f, 1, GROUP_ROUTE_26_HEAL_SPEECH_HOUSE, MAP_ROUTE_26_HEAL_SPEECH_HOUSE
	warp_def $47, $5, 1, GROUP_ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE, MAP_ROUTE_26_DAY_OF_WEEK_SIBLINGS_HOUSE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 6, 8, $0, MapRoute26Signpost0Script

	; people-events
	db 8
	person_event SPRITE_COOLTRAINER_M, 28, 18, $8, $0, 255, 255, $82, 2, TrainerCooltrainermJake, $ffff
	person_event SPRITE_COOLTRAINER_M, 42, 13, $8, $0, 255, 255, $82, 3, TrainerCooltrainermGaven3, $ffff
	person_event SPRITE_COOLTRAINER_F, 60, 14, $a, $0, 255, 255, $82, 3, TrainerCooltrainerfJoyce, $ffff
	person_event SPRITE_COOLTRAINER_F, 12, 9, $9, $0, 255, 255, $82, 4, TrainerCooltrainerfBeth1, $ffff
	person_event SPRITE_YOUNGSTER, 83, 17, $9, $0, 255, 255, $92, 2, TrainerPsychicRichard, $ffff
	person_event SPRITE_FISHER, 96, 14, $6, $0, 255, 255, $a2, 3, TrainerFisherScott, $ffff
	person_event SPRITE_FRUIT_TREE, 58, 18, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a4ec2, $ffff
	person_event SPRITE_POKE_BALL, 19, 13, $1, $0, 255, 255, $1, 0, ItemFragment_0x1a4ec4, $06aa
; 0x1a540b

