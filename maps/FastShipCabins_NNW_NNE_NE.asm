const_value set 2
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_M
	const FASTSHIPCABINS_NNW_NNE_NE_COOLTRAINER_F
	const FASTSHIPCABINS_NNW_NNE_NE_SUPER_NERD
	const FASTSHIPCABINS_NNW_NNE_NE_POKEFAN_M
	const FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	const FASTSHIPCABINS_NNW_NNE_NE_GENTLEMAN
	const FASTSHIPCABINS_NNW_NNE_NE_PHARMACIST

FastShipCabins_NNW_NNE_NE_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerCooltrainermSean:
	trainer EVENT_BEAT_COOLTRAINERM_SEAN, COOLTRAINERM, SEAN, CooltrainermSeanSeenText, CooltrainermSeanBeatenText, 0, CooltrainermSeanScript

CooltrainermSeanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7567b
	waitbutton
	closetext
	end

TrainerCooltrainerfCarol:
	trainer EVENT_BEAT_COOLTRAINERF_CAROL, COOLTRAINERF, CAROL, CooltrainerfCarolSeenText, CooltrainerfCarolBeatenText, 0, CooltrainerfCarolScript

CooltrainerfCarolScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x756f7
	waitbutton
	closetext
	end

TrainerPokemaniacEthan:
	trainer EVENT_BEAT_POKEMANIAC_ETHAN, POKEMANIAC, ETHAN, PokemaniacEthanSeenText, PokemaniacEthanBeatenText, 0, PokemaniacEthanScript

PokemaniacEthanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x7574b
	waitbutton
	closetext
	end

TrainerHikerNoland:
	trainer EVENT_BEAT_HIKER_NOLAND, HIKER, NOLAND, HikerNolandSeenText, HikerNolandBeatenText, 0, HikerNolandScript

HikerNolandScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x757d4
	waitbutton
	closetext
	end

TrainerGentlemanEdward:
	trainer EVENT_BEAT_GENTLEMAN_EDWARD, GENTLEMAN, EDWARD, GentlemanEdwardSeenText, GentlemanEdwardBeatenText, 0, GentlemanEdwardScript

GentlemanEdwardScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x75937
	waitbutton
	closetext
	end

TrainerBurglarCorey:
	trainer EVENT_BEAT_BURGLAR_COREY, BURGLAR, COREY, BurglarCoreySeenText, BurglarCoreyBeatenText, 0, BurglarCoreyScript

BurglarCoreyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x75996
	waitbutton
	closetext
	end

SailorScript_0x755f1:
	playmusic MUSIC_HIKER_ENCOUNTER
	faceplayer
	opentext
	writetext UnknownText_0x75812
	waitbutton
	closetext
	winlosstext UnknownText_0x75897, 0
	loadtrainer SAILOR, STANLY
	startbattle
	reloadmap
	special HealParty
	setevent EVENT_BEAT_SAILOR_STANLY
	opentext
	writetext UnknownText_0x758b1
	waitbutton
	closetext
	setevent EVENT_FAST_SHIP_LAZY_SAILOR
	domaptrigger FAST_SHIP_B1F, $1
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x75629
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, MovementData_0x75637
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

UnknownScript_0x75629:
	applymovement FASTSHIPCABINS_NNW_NNE_NE_SAILOR, MovementData_0x7563c
	playsound SFX_EXIT_BUILDING
	disappear FASTSHIPCABINS_NNW_NNE_NE_SAILOR
	waitsfx
	end

FastShipCabins_NNW_NNE_NETrashcan:
	jumpstd trashcan

MovementData_0x75637:
	step LEFT
	step LEFT
	step UP
	step UP
	step_end

MovementData_0x7563c:
	step DOWN
	step LEFT
	step LEFT
	step UP
	step UP
	step UP
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

.Warps:
	db 3
	warp_def $0, $2, 2, FAST_SHIP_1F
	warp_def $c, $2, 3, FAST_SHIP_1F
	warp_def $18, $2, 4, FAST_SHIP_1F

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 13, 6, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan
	signpost 19, 7, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan
	signpost 31, 7, SIGNPOST_READ, FastShipCabins_NNW_NNE_NETrashcan

.PersonEvents:
	db 7
	person_event SPRITE_COOLTRAINER_M, 3, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerCooltrainermSean, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_COOLTRAINER_F, 5, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerCooltrainerfCarol, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_SUPER_NERD, 5, 1, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPokemaniacEthan, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
	person_event SPRITE_POKEFAN_M, 17, 4, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 3, TrainerHikerNoland, EVENT_FAST_SHIP_PASSENGERS_FIRST_TRIP
	person_event SPRITE_SAILOR, 26, 4, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, SailorScript_0x755f1, EVENT_FAST_SHIP_CABINS_NNW_NNE_NE_SAILOR
	person_event SPRITE_GENTLEMAN, 30, 7, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerGentlemanEdward, EVENT_FAST_SHIP_PASSENGERS_EASTBOUND
	person_event SPRITE_PHARMACIST, 30, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerBurglarCorey, EVENT_FAST_SHIP_PASSENGERS_WESTBOUND
