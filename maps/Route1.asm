Route1_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerSchoolboyDanny:
	trainer EVENT_BEAT_SCHOOLBOY_DANNY, SCHOOLBOY, DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, $0000, SchoolboyDannyScript

SchoolboyDannyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac5d7
	closetext
	loadmovesprites
	end

TrainerCooltrainerfQuinn:
	trainer EVENT_BEAT_COOLTRAINERF_QUINN, COOLTRAINERF, QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, $0000, CooltrainerfQuinnScript

CooltrainerfQuinnScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac640
	closetext
	loadmovesprites
	end

MapRoute1Signpost0Script:
	jumptext UnknownText_0x1ac675

FruitTreeScript_0x1ac581:
	fruittree $1a

SchoolboyDannySeenText:
	text "If trainers meet,"
	line "the first thing to"
	cont "do is battle."
	done

SchoolboyDannyBeatenText:
	text "Awww… I've got a"
	line "losing record…"
	done

UnknownText_0x1ac5d7:
	text "For trainers, it's"
	line "a given that we'll"

	para "battle whenever we"
	line "meet."
	done

CooltrainerfQuinnSeenText:
	text "You there!"
	line "Want to battle?"
	done

CooltrainerfQuinnBeatenText:
	text "Down and out…"
	done

UnknownText_0x1ac640:
	text "You're strong."

	para "You obviously must"
	line "have trained hard."
	done

UnknownText_0x1ac675:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 27, 7, SIGNPOST_READ, MapRoute1Signpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_YOUNGSTER, 16, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 4, TrainerSchoolboyDanny, -1
	person_event SPRITE_COOLTRAINER_F, 29, 13, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerCooltrainerfQuinn, -1
	person_event SPRITE_FRUIT_TREE, 11, 7, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1ac581, -1
