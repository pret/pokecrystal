FastShipCabins_NNW_NNE_NE_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerCooltrainermSean:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERM_SEAN

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

CooltrainermSeanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7567b
	closetext
	loadmovesprites
	end

TrainerCooltrainerfCarol:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERF_CAROL

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

CooltrainerfCarolScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x756f7
	closetext
	loadmovesprites
	end

TrainerPokemaniacEthan:
	; bit/flag number
	dw EVENT_BEAT_POKEMANIAC_ETHAN

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

PokemaniacEthanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x7574b
	closetext
	loadmovesprites
	end

TrainerHikerNoland:
	; bit/flag number
	dw EVENT_BEAT_HIKER_NOLAND

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

HikerNolandScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x757d4
	closetext
	loadmovesprites
	end

TrainerGentlemanEdward:
	; bit/flag number
	dw EVENT_BEAT_GENTLEMAN_EDWARD

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

GentlemanEdwardScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x75937
	closetext
	loadmovesprites
	end

TrainerBurglarCorey:
	; bit/flag number
	dw EVENT_BEAT_BURGLAR_COREY

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

BurglarCoreyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x75996
	closetext
	loadmovesprites
	end

SailorScript_0x755f1:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	loadfont
	writetext UnknownText_0x75812
	closetext
	loadmovesprites
	winlosstext UnknownText_0x75897, $0000
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	loadfont
	writetext UnknownText_0x758b1
	closetext
	loadmovesprites
	setevent EVENT_033
	domaptrigger GROUP_FAST_SHIP_B1F, MAP_FAST_SHIP_B1F, $1
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x75629
	applymovement $6, MovementData_0x75637
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end

UnknownScript_0x75629:
	applymovement $6, MovementData_0x7563c
	playsound SFX_EXIT_BUILDING
	disappear $6
	waitbutton
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

MovementData_0x75637:
	step_left
	step_left
	step_up
	step_up
	step_end

MovementData_0x7563c:
	step_down
	step_left
	step_left
	step_up
	step_up
	step_up
	step_end

CooltrainermSeanSeenText:
	text "I'm going to KANTO"
	line "to test my skills."
	done

CooltrainermSeanBeatenText:
	text "I wanted to win!"
	done

UnknownText_0x7567b:
	text "Trainers from"
	line "JOHTO can battle"

	para "with KANTO GYM"
	line "LEADERS."
	done

CooltrainerfCarolSeenText:
	text "I'm training to"
	line "become the CHAMP!"
	done

CooltrainerfCarolBeatenText:
	text "What's so differ-"
	line "ent between us?"
	done

UnknownText_0x756f7:
	text "I'm going to beat"
	line "you someday!"
	done

PokemaniacEthanSeenText:
	text "Do you know LILY?"
	line "She's a hot DJ in"
	cont "KANTO."
	done

PokemaniacEthanBeatenText:
	text "Gyaaaah!"
	done

UnknownText_0x7574b:
	text "LILY's nice, but"
	line "MARY's the best!"

	para "I want to check"
	line "out JOHTO's radio"
	cont "programs!"
	done

HikerNolandSeenText:
	text "Are you alone?"
	line "Then let's battle!"
	done

HikerNolandBeatenText:
	text "That's too much to"
	line "handle!"
	done

UnknownText_0x757d4:
	text "I wonder if there"
	line "are any mountains"

	para "worth climbing in"
	line "KANTO?"
	done

UnknownText_0x75812:
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

UnknownText_0x75897:
	text "Sorry! It's all my"
	line "fault!"
	done

UnknownText_0x758b1:
	text "Being a sailor, I"
	line "have to do phys-"
	cont "ical labor. It's"
	cont "exhausting!"
	done

GentlemanEdwardSeenText:
	text "Oh, no. I've lost"
	line "something that's"
	cont "very important."
	done

GentlemanEdwardBeatenText:
	text "I… I can't find"
	line "it…"
	done

UnknownText_0x75937:
	text "I give up."
	line "You don't have to"

	para "look. Just forget"
	line "about it!"
	done

BurglarCoreySeenText:
	text "Yeehaw!"
	line "Lucky!"
	done

BurglarCoreyBeatenText:
	text "How unlucky!"
	line "I lost!"
	done

UnknownText_0x75996:
	text "I found a pretty"
	line "coin here."

	para "Someone must have"
	line "lost it…"
	done

FastShipCabins_NNW_NNE_NE_MapEventHeader:
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
	signpost 13, 6, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan
	signpost 19, 7, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan
	signpost 31, 7, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan

	; people-events
	db 7
	person_event SPRITE_COOLTRAINER_M, 7, 8, LEFT << 2 | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_COOLTRAINER_F, 9, 5, UP << 2 | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_SUPER_NERD, 9, 5, UP << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_POKEFAN_M, 21, 8, UP << 2 | $3, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SAILOR, 30, 8, DOWN << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, SailorScript_0x755f1, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	person_event SPRITE_GENTLEMAN, 34, 11, DOWN << 2 | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_PHARMACIST, 34, 6, UP << 2 | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
