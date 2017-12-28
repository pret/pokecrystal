const_value set 2
	const ROUTE1_YOUNGSTER
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_FRUIT_TREE

Route1_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TrainerSchoolboyDanny:
	trainer EVENT_BEAT_SCHOOLBOY_DANNY, SCHOOLBOY, DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer EVENT_BEAT_COOLTRAINERF_QUINN, COOLTRAINERF, QUINN, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

FruitTreeScript_0x1ac581:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "If trainers meet,"
	line "the first thing to"
	cont "do is battle."
	done

SchoolboyDannyBeatenText:
	text "Awww… I've got a"
	line "losing record…"
	done

SchoolboyDannyAfterBattleText:
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

CooltrainerfQuinnAfterBattleText:
	text "You're strong."

	para "You obviously must"
	line "have trained hard."
	done

Route1SignText:
	text "ROUTE 1"

	para "PALLET TOWN -"
	line "VIRIDIAN CITY"
	done

Route1_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 27, 7, BGEVENT_READ, Route1Sign

.ObjectEvents:
	db 3
	object_event SPRITE_YOUNGSTER, 12, 4, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerSchoolboyDanny, -1
	object_event SPRITE_COOLTRAINER_F, 25, 9, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event SPRITE_FRUIT_TREE, 7, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FruitTreeScript_0x1ac581, -1
