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
	playmusic $000a
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
	setbit1 $057d
	loadfont
	2writetext UnknownText_0x758b1
	closetext
	loadmovesprites
	setbit1 $0033
	domaptrigger GROUP_FAST_SHIP_B1F, MAP_FAST_SHIP_B1F, $1
	checkcode $9
	if_equal $3, UnknownScript_0x75629
	applymovement $6, MovementData_0x75637
	playsound $0023
	disappear $6
	waitbutton
	end
; 0x75629

UnknownScript_0x75629: ; 0x75629
	applymovement $6, MovementData_0x7563c
	playsound $0023
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
	db $0, "I'm going to KANTO", $4f
	db "to test my skills.", $57
; 0x75669

CooltrainermSeanBeatenText: ; 0x75669
	db $0, "I wanted to win!", $57
; 0x7567b

UnknownText_0x7567b: ; 0x7567b
	db $0, "Trainers from", $4f
	db "JOHTO can battle", $51
	db "with KANTO GYM", $4f
	db "LEADERS.", $57
; 0x756b3

CooltrainerfCarolSeenText: ; 0x756b3
	db $0, "I'm training to", $4f
	db "become the CHAMP!", $57
; 0x756d5

CooltrainerfCarolBeatenText: ; 0x756d5
	db $0, "What's so differ-", $4f
	db "ent between us?", $57
; 0x756f7

UnknownText_0x756f7: ; 0x756f7
	db $0, "I'm going to beat", $4f
	db "you someday!", $57
; 0x75716

PokemaniacEthanSeenText: ; 0x75716
	db $0, "Do you know LILY?", $4f
	db "She's a hot DJ in", $55
	db "KANTO.", $57
; 0x75741

PokemaniacEthanBeatenText: ; 0x75741
	db $0, "Gyaaaah!", $57
; 0x7574b

UnknownText_0x7574b: ; 0x7574b
	db $0, "LILY's nice, but", $4f
	db "MARY's the best!", $51
	db "I want to check", $4f
	db "out JOHTO's radio", $55
	db "programs!", $57
; 0x75797

HikerNolandSeenText: ; 0x75797
	db $0, "Are you alone?", $4f
	db "Then let's battle!", $57
; 0x757b9

HikerNolandBeatenText: ; 0x757b9
	db $0, "That's too much to", $4f
	db "handle!", $57
; 0x757d4

UnknownText_0x757d4: ; 0x757d4
	db $0, "I wonder if there", $4f
	db "are any mountains", $51
	db "worth climbing in", $4f
	db "KANTO?", $57
; 0x75812

UnknownText_0x75812: ; 0x75812
	db $0, "Yeah, I'm a sail-", $4f
	db "or, all right.", $51
	db "I wasn't goofing", $4f
	db "off!", $51
	db "This cabin was", $4f
	db "vacant, so I just", $55
	db "took a quick nap!", $51
	db "Ah, forget it!", $4f
	db "Let's battle!", $57
; 0x75897

UnknownText_0x75897: ; 0x75897
	db $0, "Sorry! It's all my", $4f
	db "fault!", $57
; 0x758b1

UnknownText_0x758b1: ; 0x758b1
	db $0, "Being a sailor, I", $4f
	db "have to do phys-", $55
	db "ical labor. It's", $55
	db "exhausting!", $57
; 0x758f1

GentlemanEdwardSeenText: ; 0x758f1
	db $0, "Oh, no. I've lost", $4f
	db "something that's", $55
	db "very important.", $57
; 0x75923

GentlemanEdwardBeatenText: ; 0x75923
	db $0, "I… I can't find", $4f
	db "it…", $57
; 0x75937

UnknownText_0x75937: ; 0x75937
	db $0, "I give up.", $4f
	db "You don't have to", $51
	db "look. Just forget", $4f
	db "about it!", $57
; 0x75970

BurglarCoreySeenText: ; 0x75970
	db $0, "Yeehaw!", $4f
	db "Lucky!", $57
; 0x75980

BurglarCoreyBeatenText: ; 0x75980
	db $0, "How unlucky!", $4f
	db "I lost!", $57
; 0x75996

UnknownText_0x75996: ; 0x75996
	db $0, "I found a pretty", $4f
	db "coin here.", $51
	db "Someone must have", $4f
	db "lost it…", $57
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

