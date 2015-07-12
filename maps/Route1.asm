Route1_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerSchoolboyDanny:
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_DANNY

	; trainer group && trainer id
	db SCHOOLBOY, DANNY

	; text when seen
	dw SchoolboyDannySeenText

	; text when trainer beaten
	dw SchoolboyDannyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyDannyScript

SchoolboyDannyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac5d7
	closetext
	loadmovesprites
	end

TrainerCooltrainerfQuinn:
	; bit/flag number
	dw EVENT_BEAT_COOLTRAINERF_QUINN

	; trainer group && trainer id
	db COOLTRAINERF, QUINN

	; text when seen
	dw CooltrainerfQuinnSeenText

	; text when trainer beaten
	dw CooltrainerfQuinnBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CooltrainerfQuinnScript

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

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 27, 7, $0, MapRoute1Signpost0Script

	; people-events
	db 3
	person_event SPRITE_YOUNGSTER, 16, 8, $9, $0, 255, 255, $92, 4, TrainerSchoolboyDanny, EVENT_ALWAYS_THERE
	person_event SPRITE_COOLTRAINER_F, 29, 13, $a, $0, 255, 255, $82, 2, TrainerCooltrainerfQuinn, EVENT_ALWAYS_THERE
	person_event SPRITE_FRUIT_TREE, 11, 7, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1ac581, EVENT_ALWAYS_THERE
