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
	playmusic $0038
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
	clearbit1 $076f
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
	playmusic $0038
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
	clearbit1 $076f
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
	checkbit1 $0558
	iftrue UnknownScript_0x19efda
	checkbit1 $00d8
	iftrue UnknownScript_0x19efc7
	2writetext UnknownText_0x19f43b
	keeptextopen
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x19efde
	setbit1 $00d8
UnknownScript_0x19efc7: ; 0x19efc7
	2writetext UnknownText_0x19f49d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19f4fd, $0000
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	returnafterbattle
	setbit1 $0558
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
	db $0, "MISTY: Aww! Why", $4f
	db "did you have to", $51
	db "show up and bug us", $4f
	db "now?", $51
	db "Do you know what", $4f
	db "they call people", $55
	db "like you?", $51
	db "Pests! You heard", $4f
	db "me right, pest!", $51
	db "…", $51
	db "…Oh? Those BADGES", $4f
	db "you have… Are they", $55
	db "JOHTO GYM BADGES?", $51
	db "If you have eight,", $4f
	db "you must be good.", $51
	db "OK, then. Come to", $4f
	db "CERULEAN GYM.", $51
	db "I'll be happy to", $4f
	db "take you on.", $51
	db "I'm MISTY, the", $4f
	db "GYM LEADER in", $55
	db "CERULEAN.", $57
; 0x19f14d

SchoolboyDudleySeenText: ; 0x19f14d
	db $0, "Beat the six of us", $4f
	db "trainers to win a", $55
	db "fabulous prize!", $51
	db "Think you've got", $4f
	db "what it takes?", $57
; 0x19f1a2

SchoolboyDudleyBeatenText: ; 0x19f1a2
	db $0, "Whoo! Good stuff.", $57
; 0x19f1b5

UnknownText_0x19f1b5: ; 0x19f1b5
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f1d8

LassEllenSeenText: ; 0x19f1d8
	db $0, "I'm second.", $4f
	db "Now it's serious!", $57
; 0x19f1f5

LassEllenBeatenText: ; 0x19f1f5
	db $0, "How could I lose?", $57
; 0x19f208

UnknownText_0x19f208: ; 0x19f208
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f22b

SchoolboyJoeSeenText: ; 0x19f22b
	db $0, "Here's No. 3!", $4f
	db "I won't be easy.", $57
; 0x19f249

SchoolboyJoeBeatenText: ; 0x19f249
	db $0, "Ow! Stomped flat!", $57
; 0x19f25c

UnknownText_0x19f25c: ; 0x19f25c
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f27f

LassLauraSeenText: ; 0x19f27f
	db $0, "I'm No. 4!", $4f
	db "Getting tired?", $57
; 0x19f299

LassLauraBeatenText: ; 0x19f299
	db $0, "I lost too…", $57
; 0x19f2a6

UnknownText_0x19f2a6: ; 0x19f2a6
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f2c9

CamperLloydSeenText: ; 0x19f2c9
	db $0, "OK! I'm No. 5.", $4f
	db "I'll stomp you!", $57
; 0x19f2e7

CamperLloydBeatenText: ; 0x19f2e7
	db $0, "Whoa! Too much.", $57
; 0x19f2f8

UnknownText_0x19f2f8: ; 0x19f2f8
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f31b

LassShannonSeenText: ; 0x19f31b
	db $0, "I'm the last in", $4f
	db "line, but I tell", $55
	db "you, I'm tough!", $57
; 0x19f34b

LassShannonBeatenText: ; 0x19f34b
	db $0, "You're kidding.", $57
; 0x19f35b

UnknownText_0x19f35b: ; 0x19f35b
	db $0, "I did my best.", $4f
	db "I have no regrets.", $57
; 0x19f37e

SupernerdPatSeenText: ; 0x19f37e
	db $0, "Mufufufu…", $51
	db "I have nothing to", $4f
	db "do with the six-", $55
	db "pack trainers.", $51
	db "I waited here to", $4f
	db "beat you when you", $51
	db "were tired out by", $4f
	db "all the battles.", $57
; 0x19f401

SupernerdPatBeatenText: ; 0x19f401
	db $0, "Aren't you tired", $4f
	db "at all?", $57
; 0x19f41a

UnknownText_0x19f41a: ; 0x19f41a
	db $0, "I'm sorry… I won't", $4f
	db "cheat anymore…", $57
; 0x19f43b

UnknownText_0x19f43b: ; 0x19f43b
	db $0, "You took on one", $4f
	db "more battle than", $51
	db "you expected, but", $4f
	db "you won anyway.", $51
	db "As promised, you", $4f
	db "win a prize.", $57
; 0x19f49d

UnknownText_0x19f49d: ; 0x19f49d
	db $0, "But after seeing", $4f
	db "how you battle, I", $51
	db "want to see how", $4f
	db "I'll fare.", $51
	db "How about it? Let", $4f
	db "me take you on.", $57
; 0x19f4fd

UnknownText_0x19f4fd: ; 0x19f4fd
	db $0, "I've never had a", $4f
	db "battle this good!", $57
; 0x19f520

UnknownText_0x19f520: ; 0x19f520
	db $0, "That was a great", $4f
	db "battle!", $51
	db "You and your #-", $4f
	db "MON are truly out-", $55
	db "standing!", $57
; 0x19f567

UnknownText_0x19f567: ; 0x19f567
	db $0, "SEA COTTAGE", $4f
	db "BILL'S HOUSE", $57
; 0x19f581

UnknownText_0x19f581: ; 0x19f581
	db $0, "BILL'S HOUSE", $57
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



