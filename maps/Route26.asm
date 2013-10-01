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
	2writetext UnknownText_0x1a4f08
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
	2writetext UnknownText_0x1a4fe4
	keeptextopen
	setevent $026b
	2call UnknownScript_0x1a4dbf
	2jump UnknownScript_0x1a4d65
; 0x1a4d62

UnknownScript_0x1a4d62: ; 0x1a4d62
	2call UnknownScript_0x1a4dc3
UnknownScript_0x1a4d65: ; 0x1a4d65
	askforphonenumber $b
	if_equal $1, UnknownScript_0x1a4dd3
	if_equal $2, UnknownScript_0x1a4dcf
	trainertotext COOLTRAINERM, GAVEN3, $0
	2call UnknownScript_0x1a4dc7
	2jump UnknownScript_0x1a4dcb
; 0x1a4d79

UnknownScript_0x1a4d79: ; 0x1a4d79
	2call UnknownScript_0x1a4dd7
	winlosstext CooltrainermGaven3BeatenText, $0000
	copybytetovar $d9f5
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
	loadvar $d9f5, $1
	clearflag $0067
	end
; 0x1a4da9

UnknownScript_0x1a4da9: ; 0x1a4da9
	loadtrainer COOLTRAINERM, GAVEN1
	startbattle
	returnafterbattle
	loadvar $d9f5, $2
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
	2writetext UnknownText_0x1a50d7
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
	2writetext UnknownText_0x1a51d9
	keeptextopen
	setevent $026d
	2call UnknownScript_0x1a4e7b
	2jump UnknownScript_0x1a4e21
; 0x1a4e1e

UnknownScript_0x1a4e1e: ; 0x1a4e1e
	2call UnknownScript_0x1a4e7f
UnknownScript_0x1a4e21: ; 0x1a4e21
	askforphonenumber $c
	if_equal $1, UnknownScript_0x1a4e8f
	if_equal $2, UnknownScript_0x1a4e8b
	trainertotext COOLTRAINERF, BETH1, $0
	2call UnknownScript_0x1a4e83
	2jump UnknownScript_0x1a4e87
; 0x1a4e35

UnknownScript_0x1a4e35: ; 0x1a4e35
	2call UnknownScript_0x1a4e93
	winlosstext CooltrainerfBeth1BeatenText, $0000
	copybytetovar $d9f6
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
	loadvar $d9f6, $1
	clearflag $0068
	end
; 0x1a4e65

UnknownScript_0x1a4e65: ; 0x1a4e65
	loadtrainer COOLTRAINERF, BETH2
	startbattle
	returnafterbattle
	loadvar $d9f6, $2
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
	2writetext UnknownText_0x1a5278
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
	2writetext UnknownText_0x1a5326
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
	db $0, "I'm making my", $4f
	db "final preparations", $51
	db "for the #MON", $4f
	db "LEAGUE.", $57
; 0x1a4efc

CooltrainermJakeBeatenText: ; 0x1a4efc
	db $0, "I blew it!", $57
; 0x1a4f08

UnknownText_0x1a4f08: ; 0x1a4f08
	db $0, "It's going to be", $4f
	db "tough to win at", $55
	db "the LEAGUE.", $51
	db "I need to do some", $4f
	db "more training.", $51
	db "I hear that the", $4f
	db "LEAGUE's ELITE", $51
	db "FOUR are tougher", $4f
	db "than GYM LEADERS.", $57
; 0x1a4f97

CooltrainermGaven3SeenText: ; 0x1a4f97
	db $0, "By experiencing", $4f
	db "tough battles, you", $55
	db "gain power.", $57
; 0x1a4fc7

CooltrainermGaven3BeatenText: ; 0x1a4fc7
	db $0, "Gaah! Life is even", $4f
	db "tougher!", $57
; 0x1a4fe4

UnknownText_0x1a4fe4: ; 0x1a4fe4
	db $0, "To get to #MON", $4f
	db "LEAGUE, you have", $51
	db "to get through", $4f
	db "VICTORY ROAD.", $51
	db "But VICTORY ROAD", $4f
	db "is tough.", $51
	db "Practically nobody", $4f
	db "goes there!", $57
; 0x1a505c

CooltrainerfJoyceSeenText: ; 0x1a505c
	db $0, "Since you've come", $4f
	db "this far, you must", $55
	db "be good.", $51
	db "I'm going to give", $4f
	db "this battle every-", $55
	db "thing I've got!", $57
; 0x1a50bd

CooltrainerfJoyceBeatenText: ; 0x1a50bd
	db $0, "No! I don't", $4f
	db "believe this!", $57
; 0x1a50d7

UnknownText_0x1a50d7: ; 0x1a50d7
	db $0, "I've defeated", $4f
	db "eight GYM LEADERS,", $51
	db "so I was feeling", $4f
	db "confident.", $51
	db "I'll have to try", $4f
	db "harder next time.", $57
; 0x1a5136

CooltrainerfBeth1SeenText: ; 0x1a5136
	db $0, "I lost to a train-", $4f
	db "er named ", $53, ".", $51
	db "He was really", $4f
	db "strong, but…", $51
	db "It was as if he", $4f
	db "absolutely had to", $55
	db "win at any cost.", $51
	db "I felt sorry for", $4f
	db "his #MON.", $57
; 0x1a51bf

CooltrainerfBeth1BeatenText: ; 0x1a51bf
	db $0, "#MON aren't", $4f
	db "tools of war.", $57
; 0x1a51d9

UnknownText_0x1a51d9: ; 0x1a51d9
	db $0, "#MON are in-", $4f
	db "valuable, lifelong", $55
	db "partners.", $57
; 0x1a5204

PsychicRichardSeenText: ; 0x1a5204
	db $0, "Wow, look at all", $4f
	db "those BADGES!", $55
	db "I'm impressed.", $51
	db "But you're not", $4f
	db "satisfied by just", $51
	db "collecting them,", $4f
	db "right?", $57
; 0x1a526a

PsychicRichardBeatenText: ; 0x1a526a
	db $0, "Good battle!", $57
; 0x1a5278

UnknownText_0x1a5278: ; 0x1a5278
	db $0, "People and #MON", $4f
	db "grow from their", $55
	db "experiences.", $51
	db "Don't get lazy and", $4f
	db "complacent.", $57
; 0x1a52c4

FisherScottSeenText: ; 0x1a52c4
	db $0, "I'm feeling great", $4f
	db "today!", $51
	db "I feel like I", $4f
	db "could boot even", $55
	db "the LEAGUE CHAMP!", $57
; 0x1a530d

FisherScottBeatenText: ; 0x1a530d
	db $0, "No! Not in this", $4f
	db "battle!", $57
; 0x1a5326

UnknownText_0x1a5326: ; 0x1a5326
	db $0, "Just like in fish-", $4f
	db "ing, it's all over", $51
	db "in #MON if you", $4f
	db "give up.", $57
; 0x1a5364

UnknownText_0x1a5364: ; 0x1a5364
	db $0, "ROUTE 26", $51
	db "#MON LEAGUE", $4f
	db "RECEPTION GATE", $57
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

