Route25_MapScriptHeader: ; 0x19ee94
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19ee9e, $0000
	dw UnknownScript_0x19ee9f, $0000

	; callback count
	db 0
; 0x19ee9e

UnknownScript_0x19ee9e: ; 0x19ee9e
	end
; 0x19ee9f

UnknownScript_0x19ee9f: ; 0x19ee9f
	end
; 0x19eea0

UnknownScript_0x19eea0: ; 0x19eea0
	showemote $4, $2, 15
	pause 30
	showemote $0, $3, 10
	spriteface $2, $0
	applymovement $3, MovementData_0x19efe8
	disappear $3
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface $2, $1
	pause 10
	applymovement $2, MovementData_0x19efed
	loadfont
	2writetext UnknownText_0x19f006
	closetext
	loadmovesprites
	spriteface $0, $0
	applymovement $2, MovementData_0x19effa
	spriteface $0, $2
	applymovement $2, MovementData_0x19f000
	disappear $2
	clearevent $076f
	dotrigger $0
	special $003d
	end
; 0x19eee0

UnknownScript_0x19eee0: ; 0x19eee0
	showemote $4, $2, 15
	pause 30
	showemote $0, $3, 10
	spriteface $2, $0
	applymovement $3, MovementData_0x19efea
	disappear $3
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface $2, $1
	pause 10
	applymovement $2, MovementData_0x19eff4
	loadfont
	2writetext UnknownText_0x19f006
	closetext
	loadmovesprites
	spriteface $0, $1
	applymovement $2, MovementData_0x19effd
	spriteface $0, $2
	applymovement $2, MovementData_0x19f000
	disappear $2
	clearevent $076f
	dotrigger $0
	special $003d
	end
; 0x19ef20

TrainerSchoolboyDudley: ; 0x19ef20
	; bit/flag number
	dw $472

	; trainer group && trainer id
	db SCHOOLBOY, DUDLEY

	; text when seen
	dw SchoolboyDudleySeenText

	; text when trainer beaten
	dw SchoolboyDudleyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyDudleyScript
; 0x19ef2c

SchoolboyDudleyScript: ; 0x19ef2c
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f1b5
	closetext
	loadmovesprites
	end
; 0x19ef34

TrainerLassEllen: ; 0x19ef34
	; bit/flag number
	dw $51f

	; trainer group && trainer id
	db LASS, ELLEN

	; text when seen
	dw LassEllenSeenText

	; text when trainer beaten
	dw LassEllenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassEllenScript
; 0x19ef40

LassEllenScript: ; 0x19ef40
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f208
	closetext
	loadmovesprites
	end
; 0x19ef48

TrainerSchoolboyJoe: ; 0x19ef48
	; bit/flag number
	dw $473

	; trainer group && trainer id
	db SCHOOLBOY, JOE

	; text when seen
	dw SchoolboyJoeSeenText

	; text when trainer beaten
	dw SchoolboyJoeBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyJoeScript
; 0x19ef54

SchoolboyJoeScript: ; 0x19ef54
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f25c
	closetext
	loadmovesprites
	end
; 0x19ef5c

TrainerLassLaura: ; 0x19ef5c
	; bit/flag number
	dw $51b

	; trainer group && trainer id
	db LASS, LAURA

	; text when seen
	dw LassLauraSeenText

	; text when trainer beaten
	dw LassLauraBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassLauraScript
; 0x19ef68

LassLauraScript: ; 0x19ef68
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f2a6
	closetext
	loadmovesprites
	end
; 0x19ef70

TrainerCamperLloyd: ; 0x19ef70
	; bit/flag number
	dw $41f

	; trainer group && trainer id
	db CAMPER, LLOYD

	; text when seen
	dw CamperLloydSeenText

	; text when trainer beaten
	dw CamperLloydBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperLloydScript
; 0x19ef7c

CamperLloydScript: ; 0x19ef7c
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f2f8
	closetext
	loadmovesprites
	end
; 0x19ef84

TrainerLassShannon: ; 0x19ef84
	; bit/flag number
	dw $51c

	; trainer group && trainer id
	db LASS, SHANNON

	; text when seen
	dw LassShannonSeenText

	; text when trainer beaten
	dw LassShannonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassShannonScript
; 0x19ef90

LassShannonScript: ; 0x19ef90
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f35b
	closetext
	loadmovesprites
	end
; 0x19ef98

TrainerSupernerdPat: ; 0x19ef98
	; bit/flag number
	dw $588

	; trainer group && trainer id
	db SUPER_NERD, PAT

	; text when seen
	dw SupernerdPatSeenText

	; text when trainer beaten
	dw SupernerdPatBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SupernerdPatScript
; 0x19efa4

SupernerdPatScript: ; 0x19efa4
	talkaftercancel
	loadfont
	2writetext UnknownText_0x19f41a
	closetext
	loadmovesprites
	end
; 0x19efac

CooltrainerMScript_0x19efac: ; 0x19efac
	faceplayer
	loadfont
	checkevent $0558
	iftrue UnknownScript_0x19efda
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue UnknownScript_0x19efc7
	2writetext UnknownText_0x19f43b
	keeptextopen
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x19efde
	setevent EVENT_CLEARED_NUGGET_BRIDGE
UnknownScript_0x19efc7: ; 0x19efc7
	2writetext UnknownText_0x19f49d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19f4fd, $0000
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	returnafterbattle
	setevent $0558
	loadfont
UnknownScript_0x19efda: ; 0x19efda
	2writetext UnknownText_0x19f520
	closetext
UnknownScript_0x19efde: ; 0x19efde
	loadmovesprites
	end
; 0x19efe0

MapRoute25Signpost0Script: ; 0x19efe0
	jumptext UnknownText_0x19f567
; 0x19efe3

ItemFragment_0x19efe3: ; 0x19efe3
	db PROTEIN, 1
; 0x19efe5

MapRoute25SignpostItem1: ; 0x19efe5
	dw $00f8
	db POTION
	
; 0x19efe8

MovementData_0x19efe8: ; 0x19efe8
	big_step_down
	step_end
; 0x19efea

MovementData_0x19efea: ; 0x19efea
	big_step_down
	big_step_down
	step_end
; 0x19efed

MovementData_0x19efed: ; 0x19efed
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end
; 0x19eff4

MovementData_0x19eff4: ; 0x19eff4
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end
; 0x19effa

MovementData_0x19effa: ; 0x19effa
	step_down
	step_left
	step_end
; 0x19effd

MovementData_0x19effd: ; 0x19effd
	step_up
	step_left
	step_end
; 0x19f000

MovementData_0x19f000: ; 0x19f000
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x19f006

UnknownText_0x19f006: ; 0x19f006
	text "MISTY: Aww! Why"
	line "did you have to"

	para "show up and bug us"
	line "now?"

	para "Do you know what"
	line "they call people"
	cont "like you?"

	para "Pests! You heard"
	line "me right, pest!"

	para "…"

	para "…Oh? Those BADGES"
	line "you have… Are they"
	cont "JOHTO GYM BADGES?"

	para "If you have eight,"
	line "you must be good."

	para "OK, then. Come to"
	line "CERULEAN GYM."

	para "I'll be happy to"
	line "take you on."

	para "I'm MISTY, the"
	line "GYM LEADER in"
	cont "CERULEAN."
	done
; 0x19f14d

SchoolboyDudleySeenText: ; 0x19f14d
	text "Beat the six of us"
	line "trainers to win a"
	cont "fabulous prize!"

	para "Think you've got"
	line "what it takes?"
	done
; 0x19f1a2

SchoolboyDudleyBeatenText: ; 0x19f1a2
	text "Whoo! Good stuff."
	done
; 0x19f1b5

UnknownText_0x19f1b5: ; 0x19f1b5
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f1d8

LassEllenSeenText: ; 0x19f1d8
	text "I'm second."
	line "Now it's serious!"
	done
; 0x19f1f5

LassEllenBeatenText: ; 0x19f1f5
	text "How could I lose?"
	done
; 0x19f208

UnknownText_0x19f208: ; 0x19f208
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f22b

SchoolboyJoeSeenText: ; 0x19f22b
	text "Here's No. 3!"
	line "I won't be easy."
	done
; 0x19f249

SchoolboyJoeBeatenText: ; 0x19f249
	text "Ow! Stomped flat!"
	done
; 0x19f25c

UnknownText_0x19f25c: ; 0x19f25c
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f27f

LassLauraSeenText: ; 0x19f27f
	text "I'm No. 4!"
	line "Getting tired?"
	done
; 0x19f299

LassLauraBeatenText: ; 0x19f299
	text "I lost too…"
	done
; 0x19f2a6

UnknownText_0x19f2a6: ; 0x19f2a6
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f2c9

CamperLloydSeenText: ; 0x19f2c9
	text "OK! I'm No. 5."
	line "I'll stomp you!"
	done
; 0x19f2e7

CamperLloydBeatenText: ; 0x19f2e7
	text "Whoa! Too much."
	done
; 0x19f2f8

UnknownText_0x19f2f8: ; 0x19f2f8
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f31b

LassShannonSeenText: ; 0x19f31b
	text "I'm the last in"
	line "line, but I tell"
	cont "you, I'm tough!"
	done
; 0x19f34b

LassShannonBeatenText: ; 0x19f34b
	text "You're kidding."
	done
; 0x19f35b

UnknownText_0x19f35b: ; 0x19f35b
	text "I did my best."
	line "I have no regrets."
	done
; 0x19f37e

SupernerdPatSeenText: ; 0x19f37e
	text "Mufufufu…"

	para "I have nothing to"
	line "do with the six-"
	cont "pack trainers."

	para "I waited here to"
	line "beat you when you"

	para "were tired out by"
	line "all the battles."
	done
; 0x19f401

SupernerdPatBeatenText: ; 0x19f401
	text "Aren't you tired"
	line "at all?"
	done
; 0x19f41a

UnknownText_0x19f41a: ; 0x19f41a
	text "I'm sorry… I won't"
	line "cheat anymore…"
	done
; 0x19f43b

UnknownText_0x19f43b: ; 0x19f43b
	text "You took on one"
	line "more battle than"

	para "you expected, but"
	line "you won anyway."

	para "As promised, you"
	line "win a prize."
	done
; 0x19f49d

UnknownText_0x19f49d: ; 0x19f49d
	text "But after seeing"
	line "how you battle, I"

	para "want to see how"
	line "I'll fare."

	para "How about it? Let"
	line "me take you on."
	done
; 0x19f4fd

UnknownText_0x19f4fd: ; 0x19f4fd
	text "I've never had a"
	line "battle this good!"
	done
; 0x19f520

UnknownText_0x19f520: ; 0x19f520
	text "That was a great"
	line "battle!"

	para "You and your #-"
	line "MON are truly out-"
	cont "standing!"
	done
; 0x19f567

UnknownText_0x19f567: ; 0x19f567
	text "SEA COTTAGE"
	line "BILL'S HOUSE"
	done
; 0x19f581

UnknownText_0x19f581: ; 0x19f581
	text "BILL'S HOUSE"
	done
; 0x19f58f

Route25_MapEventHeader: ; 0x19f58f
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $5, $2f, 1, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE

	; xy triggers
	db 2
	xy_trigger 1, $6, $2a, $0, UnknownScript_0x19eea0, $0, $0
	xy_trigger 1, $7, $2a, $0, UnknownScript_0x19eee0, $0, $0

	; signposts
	db 2
	signpost 5, 45, $0, MapRoute25Signpost0Script
	signpost 5, 4, $7, MapRoute25SignpostItem1

	; people-events
	db 11
	person_event SPRITE_MISTY, 13, 50, $8, $0, 255, 255, $80, 0, ObjectEvent, $076e
	person_event SPRITE_COOLTRAINER_M, 14, 50, $8, $0, 255, 255, $a0, 0, ObjectEvent, $076e
	person_event SPRITE_YOUNGSTER, 12, 16, $6, $0, 255, 255, $92, 3, TrainerSchoolboyDudley, $ffff
	person_event SPRITE_LASS, 15, 20, $7, $0, 255, 255, $92, 3, TrainerLassEllen, $ffff
	person_event SPRITE_YOUNGSTER, 12, 25, $6, $0, 255, 255, $92, 1, TrainerSchoolboyJoe, $ffff
	person_event SPRITE_LASS, 10, 26, $9, $0, 255, 255, $92, 3, TrainerLassLaura, $ffff
	person_event SPRITE_YOUNGSTER, 8, 29, $6, $0, 255, 255, $a2, 2, TrainerCamperLloyd, $ffff
	person_event SPRITE_LASS, 15, 32, $7, $0, 255, 255, $92, 1, TrainerLassShannon, $ffff
	person_event SPRITE_SUPER_NERD, 11, 35, $6, $0, 255, 255, $b2, 1, TrainerSupernerdPat, $ffff
	person_event SPRITE_COOLTRAINER_M, 12, 41, $8, $0, 255, 255, $80, 0, CooltrainerMScript_0x19efac, $ffff
	person_event SPRITE_POKE_BALL, 8, 36, $1, $0, 255, 255, $1, 0, ItemFragment_0x19efe3, $078b
; 0x19f643



