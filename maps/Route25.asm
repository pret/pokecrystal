const_value set 2
	const ROUTE25_MISTY
	const ROUTE25_COOLTRAINER_M1
	const ROUTE25_YOUNGSTER1
	const ROUTE25_LASS1
	const ROUTE25_YOUNGSTER2
	const ROUTE25_LASS2
	const ROUTE25_YOUNGSTER3
	const ROUTE25_LASS3
	const ROUTE25_SUPER_NERD
	const ROUTE25_COOLTRAINER_M2
	const ROUTE25_POKE_BALL

Route25_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0
	scene_script .DummyScene1

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

UnknownScript_0x19eea0:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	spriteface ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efe8
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19efed
	opentext
	writetext UnknownText_0x19f006
	waitbutton
	closetext
	spriteface PLAYER, DOWN
	applymovement ROUTE25_MISTY, MovementData_0x19effa
	spriteface PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene 0
	special RestartMapMusic
	end

UnknownScript_0x19eee0:
	showemote EMOTE_HEART, ROUTE25_MISTY, 15
	pause 30
	showemote EMOTE_SHOCK, ROUTE25_COOLTRAINER_M1, 10
	spriteface ROUTE25_MISTY, DOWN
	applymovement ROUTE25_COOLTRAINER_M1, MovementData_0x19efea
	disappear ROUTE25_COOLTRAINER_M1
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface ROUTE25_MISTY, UP
	pause 10
	applymovement ROUTE25_MISTY, MovementData_0x19eff4
	opentext
	writetext UnknownText_0x19f006
	waitbutton
	closetext
	spriteface PLAYER, UP
	applymovement ROUTE25_MISTY, MovementData_0x19effd
	spriteface PLAYER, LEFT
	applymovement ROUTE25_MISTY, MovementData_0x19f000
	disappear ROUTE25_MISTY
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setscene 0
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer SCHOOLBOY, DUDLEY, EVENT_BEAT_SCHOOLBOY_DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SchoolboyDudleyAfterBattleText
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer LASS, ELLEN, EVENT_BEAT_LASS_ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassEllenAfterBattleText
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer SCHOOLBOY, JOE, EVENT_BEAT_SCHOOLBOY_JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SchoolboyJoeAfterBattleText
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer LASS, LAURA, EVENT_BEAT_LASS_LAURA, LassLauraSeenText, LassLauraBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassLauraAfterBattleText
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer CAMPER, LLOYD, EVENT_BEAT_CAMPER_LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperLloydAfterBattleText
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer LASS, SHANNON, EVENT_BEAT_LASS_SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext LassShannonAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer SUPER_NERD, PAT, EVENT_BEAT_SUPER_NERD_PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SupernerdPatAfterBattleText
	waitbutton
	closetext
	end

CooltrainerMScript_0x19efac:
	faceplayer
	opentext
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue UnknownScript_0x19efda
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue UnknownScript_0x19efc7
	writetext UnknownText_0x19f43b
	buttonsound
	verbosegiveitem NUGGET
	iffalse UnknownScript_0x19efde
	setevent EVENT_CLEARED_NUGGET_BRIDGE
UnknownScript_0x19efc7:
	writetext UnknownText_0x19f49d
	waitbutton
	closetext
	winlosstext UnknownText_0x19f4fd, 0
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	opentext
UnknownScript_0x19efda:
	writetext UnknownText_0x19f520
	waitbutton
UnknownScript_0x19efde:
	closetext
	end

BillsHouseSign:
	jumptext BillsHouseSignText

Route25Protein:
	itemball PROTEIN

Route25HiddenPotion:
	hiddenitem POTION, EVENT_ROUTE_25_HIDDEN_POTION

MovementData_0x19efe8:
	big_step DOWN
	step_end

MovementData_0x19efea:
	big_step DOWN
	big_step DOWN
	step_end

MovementData_0x19efed:
	step UP
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19eff4:
	step UP
	step UP
	step LEFT
	step LEFT
	step LEFT
	step_end

MovementData_0x19effa:
	step DOWN
	step LEFT
	step_end

MovementData_0x19effd:
	step UP
	step LEFT
	step_end

MovementData_0x19f000:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step_end

UnknownText_0x19f006:
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

SchoolboyDudleySeenText:
	text "Beat the six of us"
	line "trainers to win a"
	cont "fabulous prize!"

	para "Think you've got"
	line "what it takes?"
	done

SchoolboyDudleyBeatenText:
	text "Whoo! Good stuff."
	done

SchoolboyDudleyAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

LassEllenSeenText:
	text "I'm second."
	line "Now it's serious!"
	done

LassEllenBeatenText:
	text "How could I lose?"
	done

LassEllenAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

SchoolboyJoeSeenText:
	text "Here's No. 3!"
	line "I won't be easy."
	done

SchoolboyJoeBeatenText:
	text "Ow! Stomped flat!"
	done

SchoolboyJoeAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

LassLauraSeenText:
	text "I'm No. 4!"
	line "Getting tired?"
	done

LassLauraBeatenText:
	text "I lost too…"
	done

LassLauraAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

CamperLloydSeenText:
	text "OK! I'm No. 5."
	line "I'll stomp you!"
	done

CamperLloydBeatenText:
	text "Whoa! Too much."
	done

CamperLloydAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

LassShannonSeenText:
	text "I'm the last in"
	line "line, but I tell"
	cont "you, I'm tough!"
	done

LassShannonBeatenText:
	text "You're kidding."
	done

LassShannonAfterBattleText:
	text "I did my best."
	line "I have no regrets."
	done

SupernerdPatSeenText:
	text "Mufufufu…"

	para "I have nothing to"
	line "do with the six-"
	cont "pack trainers."

	para "I waited here to"
	line "beat you when you"

	para "were tired out by"
	line "all the battles."
	done

SupernerdPatBeatenText:
	text "Aren't you tired"
	line "at all?"
	done

SupernerdPatAfterBattleText:
	text "I'm sorry… I won't"
	line "cheat anymore…"
	done

UnknownText_0x19f43b:
	text "You took on one"
	line "more battle than"

	para "you expected, but"
	line "you won anyway."

	para "As promised, you"
	line "win a prize."
	done

UnknownText_0x19f49d:
	text "But after seeing"
	line "how you battle, I"

	para "want to see how"
	line "I'll fare."

	para "How about it? Let"
	line "me take you on."
	done

UnknownText_0x19f4fd:
	text "I've never had a"
	line "battle this good!"
	done

UnknownText_0x19f520:
	text "That was a great"
	line "battle!"

	para "You and your #-"
	line "MON are truly out-"
	cont "standing!"
	done

BillsHouseSignText:
	text "SEA COTTAGE"
	line "BILL'S HOUSE"
	done

; unused
	text "BILL'S HOUSE"
	done

Route25_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 47, 5, 1, BILLS_HOUSE

	db 2 ; coord events
	coord_event 42, 6, 1, UnknownScript_0x19eea0
	coord_event 42, 7, 1, UnknownScript_0x19eee0

	db 2 ; bg events
	bg_event 45, 5, BGEVENT_READ, BillsHouseSign
	bg_event 4, 5, BGEVENT_ITEM, Route25HiddenPotion

	db 11 ; object events
	object_event 46, 9, SPRITE_MISTY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 46, 10, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	object_event 12, 8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	object_event 16, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassEllen, -1
	object_event 21, 8, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	object_event 22, 6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerLassLaura, -1
	object_event 25, 4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	object_event 28, 11, SPRITE_LASS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassShannon, -1
	object_event 31, 7, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	object_event 37, 8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CooltrainerMScript_0x19efac, -1
	object_event 32, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
