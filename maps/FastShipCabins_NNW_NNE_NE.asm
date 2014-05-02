FastShipCabins_NNW_NNE_NE_MapScriptHeader: ; 0x75577
	; trigger count
	db 0

	; callback count
	db 0
; 0x75579

TrainerCooltrainermSean: ; 0x75579
	; bit/flag number
	dw $557

	; trainer group && trainer id
	db COOLTRAINERM, SEAN

	; text when seen
	dw CooltrainermSeanSeenText

	; text when trainer beaten
	dw CooltrainermSeanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainermSeanScript
; 0x75585

CooltrainermSeanScript: ; 0x75585
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7567b
	closetext
	loadmovesprites
	end
; 0x7558d

TrainerCooltrainerfCarol: ; 0x7558d
	; bit/flag number
	dw $567

	; trainer group && trainer id
	db COOLTRAINERF, CAROL

	; text when seen
	dw CooltrainerfCarolSeenText

	; text when trainer beaten
	dw CooltrainerfCarolBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfCarolScript
; 0x75599

CooltrainerfCarolScript: ; 0x75599
	talkaftercancel
	loadfont
	2writetext UnknownText_0x756f7
	closetext
	loadmovesprites
	end
; 0x755a1

TrainerPokemaniacEthan: ; 0x755a1
	; bit/flag number
	dw $4eb

	; trainer group && trainer id
	db POKEMANIAC, ETHAN

	; text when seen
	dw PokemaniacEthanSeenText

	; text when trainer beaten
	dw PokemaniacEthanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PokemaniacEthanScript
; 0x755ad

PokemaniacEthanScript: ; 0x755ad
	talkaftercancel
	loadfont
	2writetext UnknownText_0x7574b
	closetext
	loadmovesprites
	end
; 0x755b5

TrainerHikerNoland: ; 0x755b5
	; bit/flag number
	dw $531

	; trainer group && trainer id
	db HIKER, NOLAND

	; text when seen
	dw HikerNolandSeenText

	; text when trainer beaten
	dw HikerNolandBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw HikerNolandScript
; 0x755c1

HikerNolandScript: ; 0x755c1
	talkaftercancel
	loadfont
	2writetext UnknownText_0x757d4
	closetext
	loadmovesprites
	end
; 0x755c9

TrainerGentlemanEdward: ; 0x755c9
	; bit/flag number
	dw $49b

	; trainer group && trainer id
	db GENTLEMAN, EDWARD

	; text when seen
	dw GentlemanEdwardSeenText

	; text when trainer beaten
	dw GentlemanEdwardBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw GentlemanEdwardScript
; 0x755d5

GentlemanEdwardScript: ; 0x755d5
	talkaftercancel
	loadfont
	2writetext UnknownText_0x75937
	closetext
	loadmovesprites
	end
; 0x755dd

TrainerBurglarCorey: ; 0x755dd
	; bit/flag number
	dw $42f

	; trainer group && trainer id
	db BURGLAR, COREY

	; text when seen
	dw BurglarCoreySeenText

	; text when trainer beaten
	dw BurglarCoreyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BurglarCoreyScript
; 0x755e9

BurglarCoreyScript: ; 0x755e9
	talkaftercancel
	loadfont
	2writetext UnknownText_0x75996
	closetext
	loadmovesprites
	end
; 0x755f1

SailorScript_0x755f1: ; 0x755f1
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	loadfont
	2writetext UnknownText_0x75812
	closetext
	loadmovesprites
	winlosstext UnknownText_0x75897, $0000
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special $001b
	setevent $057d
	loadfont
	2writetext UnknownText_0x758b1
	closetext
	loadmovesprites
	setevent $0033
	domaptrigger GROUP_FAST_SHIP_B1F, MAP_FAST_SHIP_B1F, $1
	checkcode $9
	if_equal $3, UnknownScript_0x75629
	applymovement $6, MovementData_0x75637
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end
; 0x75629

UnknownScript_0x75629: ; 0x75629
	applymovement $6, MovementData_0x7563c
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end
; 0x75634

MapFastShipCabins_NNW_NNE_NESignpost2Script: ; 0x75634
	jumpstd $000d
; 0x75637

MovementData_0x75637: ; 0x75637
	step_left
	step_left
	step_up
	step_up
	step_end
; 0x7563c

MovementData_0x7563c: ; 0x7563c
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end
; 0x75643

CooltrainermSeanSeenText: ; 0x75643
	text "I'm going to KANTO"
	line "to test my skills."
	done
; 0x75669

CooltrainermSeanBeatenText: ; 0x75669
	text "I wanted to win!"
	done
; 0x7567b

UnknownText_0x7567b: ; 0x7567b
	text "Trainers from"
	line "JOHTO can battle"

	para "with KANTO GYM"
	line "LEADERS."
	done
; 0x756b3

CooltrainerfCarolSeenText: ; 0x756b3
	text "I'm training to"
	line "become the CHAMP!"
	done
; 0x756d5

CooltrainerfCarolBeatenText: ; 0x756d5
	text "What's so differ-"
	line "ent between us?"
	done
; 0x756f7

UnknownText_0x756f7: ; 0x756f7
	text "I'm going to beat"
	line "you someday!"
	done
; 0x75716

PokemaniacEthanSeenText: ; 0x75716
	text "Do you know LILY?"
	line "She's a hot DJ in"
	cont "KANTO."
	done
; 0x75741

PokemaniacEthanBeatenText: ; 0x75741
	text "Gyaaaah!"
	done
; 0x7574b

UnknownText_0x7574b: ; 0x7574b
	text "LILY's nice, but"
	line "MARY's the best!"

	para "I want to check"
	line "out JOHTO's radio"
	cont "programs!"
	done
; 0x75797

HikerNolandSeenText: ; 0x75797
	text "Are you alone?"
	line "Then let's battle!"
	done
; 0x757b9

HikerNolandBeatenText: ; 0x757b9
	text "That's too much to"
	line "handle!"
	done
; 0x757d4

UnknownText_0x757d4: ; 0x757d4
	text "I wonder if there"
	line "are any mountains"

	para "worth climbing in"
	line "KANTO?"
	done
; 0x75812

UnknownText_0x75812: ; 0x75812
	text "Yeah, I'm a sail-"
	line "or, all right."

	para "I wasn't goofing"
	line "off!"

	para "This cabin was"
	line "vacant, so I just"
	cont "took a quick nap!"

	para "Ah, forget it!"
	line "Let's battle!"
	done
; 0x75897

UnknownText_0x75897: ; 0x75897
	text "Sorry! It's all my"
	line "fault!"
	done
; 0x758b1

UnknownText_0x758b1: ; 0x758b1
	text "Being a sailor, I"
	line "have to do phys-"
	cont "ical labor. It's"
	cont "exhausting!"
	done
; 0x758f1

GentlemanEdwardSeenText: ; 0x758f1
	text "Oh, no. I've lost"
	line "something that's"
	cont "very important."
	done
; 0x75923

GentlemanEdwardBeatenText: ; 0x75923
	text "I… I can't find"
	line "it…"
	done
; 0x75937

UnknownText_0x75937: ; 0x75937
	text "I give up."
	line "You don't have to"

	para "look. Just forget"
	line "about it!"
	done
; 0x75970

BurglarCoreySeenText: ; 0x75970
	text "Yeehaw!"
	line "Lucky!"
	done
; 0x75980

BurglarCoreyBeatenText: ; 0x75980
	text "How unlucky!"
	line "I lost!"
	done
; 0x75996

UnknownText_0x75996: ; 0x75996
	text "I found a pretty"
	line "coin here."

	para "Someone must have"
	line "lost it…"
	done
; 0x759ce

FastShipCabins_NNW_NNE_NE_MapEventHeader: ; 0x759ce
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $2, 2, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $c, $2, 3, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F
	warp_def $18, $2, 4, GROUP_FAST_SHIP_1F, MAP_FAST_SHIP_1F

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 13, 6, $0, MapFastShipCabins_NNW_NNE_NESignpost2Script
	signpost 19, 7, $0, MapFastShipCabins_NNW_NNE_NESignpost2Script
	signpost 31, 7, $0, MapFastShipCabins_NNW_NNE_NESignpost2Script

	; people-events
	db 7
	person_event SPRITE_COOLTRAINER_M, 7, 8, $a, $0, 255, 255, $82, 2, TrainerCooltrainermSean, $073a
	person_event SPRITE_COOLTRAINER_F, 9, 5, $7, $0, 255, 255, $82, 3, TrainerCooltrainerfCarol, $073a
	person_event SPRITE_SUPER_NERD, 9, 5, $7, $0, 255, 255, $92, 3, TrainerPokemaniacEthan, $073b
	person_event SPRITE_POKEFAN_M, 21, 8, $7, $0, 255, 255, $b2, 3, TrainerHikerNoland, $0739
	person_event SPRITE_SAILOR, 30, 8, $3, $0, 255, 255, $90, 0, SailorScript_0x755f1, $072d
	person_event SPRITE_GENTLEMAN, 34, 11, $3, $0, 255, 255, $92, 1, TrainerGentlemanEdward, $073a
	person_event SPRITE_PHARMACIST, 34, 6, $7, $0, 255, 255, $a2, 4, TrainerBurglarCorey, $073b
; 0x75a4d

