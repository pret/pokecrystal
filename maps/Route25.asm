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

Route25_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19ee9e, 0
	dw UnknownScript_0x19ee9f, 0

.MapCallbacks:
	db 0

UnknownScript_0x19ee9e:
	end

UnknownScript_0x19ee9f:
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
	dotrigger $0
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
	dotrigger $0
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer EVENT_BEAT_SCHOOLBOY_DUDLEY, SCHOOLBOY, DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, 0, SchoolboyDudleyScript

SchoolboyDudleyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f1b5
	waitbutton
	closetext
	end

TrainerLassEllen:
	trainer EVENT_BEAT_LASS_ELLEN, LASS, ELLEN, LassEllenSeenText, LassEllenBeatenText, 0, LassEllenScript

LassEllenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f208
	waitbutton
	closetext
	end

TrainerSchoolboyJoe:
	trainer EVENT_BEAT_SCHOOLBOY_JOE, SCHOOLBOY, JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, 0, SchoolboyJoeScript

SchoolboyJoeScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f25c
	waitbutton
	closetext
	end

TrainerLassLaura:
	trainer EVENT_BEAT_LASS_LAURA, LASS, LAURA, LassLauraSeenText, LassLauraBeatenText, 0, LassLauraScript

LassLauraScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f2a6
	waitbutton
	closetext
	end

TrainerCamperLloyd:
	trainer EVENT_BEAT_CAMPER_LLOYD, CAMPER, LLOYD, CamperLloydSeenText, CamperLloydBeatenText, 0, CamperLloydScript

CamperLloydScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f2f8
	waitbutton
	closetext
	end

TrainerLassShannon:
	trainer EVENT_BEAT_LASS_SHANNON, LASS, SHANNON, LassShannonSeenText, LassShannonBeatenText, 0, LassShannonScript

LassShannonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f35b
	waitbutton
	closetext
	end

TrainerSupernerdPat:
	trainer EVENT_BEAT_SUPER_NERD_PAT, SUPER_NERD, PAT, SupernerdPatSeenText, SupernerdPatBeatenText, 0, SupernerdPatScript

SupernerdPatScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x19f41a
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
	dwb EVENT_ROUTE_25_HIDDEN_POTION, POTION


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

UnknownText_0x19f1b5:
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

UnknownText_0x19f208:
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

UnknownText_0x19f25c:
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

UnknownText_0x19f2a6:
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

UnknownText_0x19f2f8:
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

UnknownText_0x19f35b:
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

UnknownText_0x19f41a:
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

Route25_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $2f, 1, BILLS_HOUSE

.XYTriggers:
	db 2
	xy_trigger 1, $6, $2a, $0, UnknownScript_0x19eea0, $0, $0
	xy_trigger 1, $7, $2a, $0, UnknownScript_0x19eee0, $0, $0

.Signposts:
	db 2
	signpost 5, 45, SIGNPOST_READ, BillsHouseSign
	signpost 5, 4, SIGNPOST_ITEM, Route25HiddenPotion

.PersonEvents:
	db 11
	person_event SPRITE_MISTY, 9, 46, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	person_event SPRITE_COOLTRAINER_M, 10, 46, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	person_event SPRITE_YOUNGSTER, 8, 12, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerSchoolboyDudley, -1
	person_event SPRITE_LASS, 11, 16, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassEllen, -1
	person_event SPRITE_YOUNGSTER, 8, 21, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerSchoolboyJoe, -1
	person_event SPRITE_LASS, 6, 22, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerLassLaura, -1
	person_event SPRITE_YOUNGSTER, 4, 25, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 2, TrainerCamperLloyd, -1
	person_event SPRITE_LASS, 11, 28, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerLassShannon, -1
	person_event SPRITE_SUPER_NERD, 7, 31, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_TRAINER, 1, TrainerSupernerdPat, -1
	person_event SPRITE_COOLTRAINER_M, 8, 37, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerMScript_0x19efac, -1
	person_event SPRITE_POKE_BALL, 4, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route25Protein, EVENT_ROUTE_25_PROTEIN
