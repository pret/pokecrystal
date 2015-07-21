Route25_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19ee9e, $0000
	dw UnknownScript_0x19ee9f, $0000

.MapCallbacks:
	db 0

UnknownScript_0x19ee9e:
	end

UnknownScript_0x19ee9f:
	end

UnknownScript_0x19eea0:
	showemote $4, $2, 15
	pause 30
	showemote EMOTE_SHOCK, $3, 10
	spriteface $2, DOWN
	applymovement $3, MovementData_0x19efe8
	disappear $3
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface $2, UP
	pause 10
	applymovement $2, MovementData_0x19efed
	loadfont
	writetext UnknownText_0x19f006
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $2, MovementData_0x19effa
	spriteface $0, LEFT
	applymovement $2, MovementData_0x19f000
	disappear $2
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	dotrigger $0
	special RestartMapMusic
	end

UnknownScript_0x19eee0:
	showemote $4, $2, 15
	pause 30
	showemote EMOTE_SHOCK, $3, 10
	spriteface $2, DOWN
	applymovement $3, MovementData_0x19efea
	disappear $3
	pause 15
	playmusic MUSIC_BEAUTY_ENCOUNTER
	spriteface $2, UP
	pause 10
	applymovement $2, MovementData_0x19eff4
	loadfont
	writetext UnknownText_0x19f006
	closetext
	loadmovesprites
	spriteface $0, UP
	applymovement $2, MovementData_0x19effd
	spriteface $0, LEFT
	applymovement $2, MovementData_0x19f000
	disappear $2
	clearevent EVENT_TRAINERS_IN_CERULEAN_GYM
	dotrigger $0
	special RestartMapMusic
	end

TrainerSchoolboyDudley:
	trainer EVENT_BEAT_SCHOOLBOY_DUDLEY, SCHOOLBOY, DUDLEY, SchoolboyDudleySeenText, SchoolboyDudleyBeatenText, $0000, SchoolboyDudleyScript

SchoolboyDudleyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f1b5
	closetext
	loadmovesprites
	end

TrainerLassEllen:
	trainer EVENT_BEAT_LASS_ELLEN, LASS, ELLEN, LassEllenSeenText, LassEllenBeatenText, $0000, LassEllenScript

LassEllenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f208
	closetext
	loadmovesprites
	end

TrainerSchoolboyJoe:
	trainer EVENT_BEAT_SCHOOLBOY_JOE, SCHOOLBOY, JOE, SchoolboyJoeSeenText, SchoolboyJoeBeatenText, $0000, SchoolboyJoeScript

SchoolboyJoeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f25c
	closetext
	loadmovesprites
	end

TrainerLassLaura:
	trainer EVENT_BEAT_LASS_LAURA, LASS, LAURA, LassLauraSeenText, LassLauraBeatenText, $0000, LassLauraScript

LassLauraScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f2a6
	closetext
	loadmovesprites
	end

TrainerCamperLloyd:
	trainer EVENT_BEAT_CAMPER_LLOYD, CAMPER, LLOYD, CamperLloydSeenText, CamperLloydBeatenText, $0000, CamperLloydScript

CamperLloydScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f2f8
	closetext
	loadmovesprites
	end

TrainerLassShannon:
	trainer EVENT_BEAT_LASS_SHANNON, LASS, SHANNON, LassShannonSeenText, LassShannonBeatenText, $0000, LassShannonScript

LassShannonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f35b
	closetext
	loadmovesprites
	end

TrainerSupernerdPat:
	trainer EVENT_BEAT_SUPER_NERD_PAT, SUPER_NERD, PAT, SupernerdPatSeenText, SupernerdPatBeatenText, $0000, SupernerdPatScript

SupernerdPatScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19f41a
	closetext
	loadmovesprites
	end

CooltrainerMScript_0x19efac:
	faceplayer
	loadfont
	checkevent EVENT_BEAT_COOLTRAINERM_KEVIN
	iftrue UnknownScript_0x19efda
	checkevent EVENT_CLEARED_NUGGET_BRIDGE
	iftrue UnknownScript_0x19efc7
	writetext UnknownText_0x19f43b
	keeptextopen
	verbosegiveitem NUGGET, 1
	iffalse UnknownScript_0x19efde
	setevent EVENT_CLEARED_NUGGET_BRIDGE
UnknownScript_0x19efc7:
	writetext UnknownText_0x19f49d
	closetext
	loadmovesprites
	winlosstext UnknownText_0x19f4fd, $0000
	loadtrainer COOLTRAINERM, KEVIN
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_COOLTRAINERM_KEVIN
	loadfont
UnknownScript_0x19efda:
	writetext UnknownText_0x19f520
	closetext
UnknownScript_0x19efde:
	loadmovesprites
	end

MapRoute25Signpost0Script:
	jumptext UnknownText_0x19f567

ItemFragment_0x19efe3:
	db PROTEIN, 1

MapRoute25SignpostItem1:
	dwb EVENT_ROUTE_25_HIDDEN_POTION, POTION
	

MovementData_0x19efe8:
	big_step_down
	step_end

MovementData_0x19efea:
	big_step_down
	big_step_down
	step_end

MovementData_0x19efed:
	step_up
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

MovementData_0x19eff4:
	step_up
	step_up
	step_left
	step_left
	step_left
	step_end

MovementData_0x19effa:
	step_down
	step_left
	step_end

MovementData_0x19effd:
	step_up
	step_left
	step_end

MovementData_0x19f000:
	step_left
	step_left
	step_left
	step_left
	step_left
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

UnknownText_0x19f567:
	text "SEA COTTAGE"
	line "BILL'S HOUSE"
	done

UnknownText_0x19f581:
	text "BILL'S HOUSE"
	done

Route25_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $2f, 1, GROUP_BILLS_HOUSE, MAP_BILLS_HOUSE

.XYTriggers:
	db 2
	xy_trigger 1, $6, $2a, $0, UnknownScript_0x19eea0, $0, $0
	xy_trigger 1, $7, $2a, $0, UnknownScript_0x19eee0, $0, $0

.Signposts:
	db 2
	signpost 5, 45, SIGNPOST_READ, MapRoute25Signpost0Script
	signpost 5, 4, SIGNPOST_ITEM, MapRoute25SignpostItem1

.PersonEvents:
	db 11
	person_event SPRITE_MISTY, 13, 50, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	person_event SPRITE_COOLTRAINER_M, 14, 50, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ObjectEvent, EVENT_ROUTE_25_MISTY_BOYFRIEND
	person_event SPRITE_YOUNGSTER, 12, 16, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerSchoolboyDudley, -1
	person_event SPRITE_LASS, 15, 20, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerLassEllen, -1
	person_event SPRITE_YOUNGSTER, 12, 25, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyJoe, -1
	person_event SPRITE_LASS, 10, 26, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerLassLaura, -1
	person_event SPRITE_YOUNGSTER, 8, 29, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 2, TrainerCamperLloyd, -1
	person_event SPRITE_LASS, 15, 32, OW_UP | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerLassShannon, -1
	person_event SPRITE_SUPER_NERD, 11, 35, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 1, TrainerSupernerdPat, -1
	person_event SPRITE_COOLTRAINER_M, 12, 41, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerMScript_0x19efac, -1
	person_event SPRITE_POKE_BALL, 8, 36, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x19efe3, EVENT_ROUTE_25_PROTEIN
