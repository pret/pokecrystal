const_value set 2
	const ROUTE11_YOUNGSTER1
	const ROUTE11_YOUNGSTER2
	const ROUTE11_YOUNGSTER3
	const ROUTE11_YOUNGSTER4
	const ROUTE11_FRUIT_TREE

Route11_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerYoungsterOwen:
	trainer EVENT_BEAT_YOUNGSTER_OWEN, YOUNGSTER, OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, 0, YoungsterOwenScript

YoungsterOwenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x680b2
	waitbutton
	closetext
	end

TrainerYoungsterJason:
	trainer EVENT_BEAT_YOUNGSTER_JASON, YOUNGSTER, JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, 0, YoungsterJasonScript

YoungsterJasonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6814a
	waitbutton
	closetext
	end

TrainerPsychicHerman:
	trainer EVENT_BEAT_PSYCHIC_HERMAN, PSYCHIC_T, HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, 0, PsychicHermanScript

PsychicHermanScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x6817b
	waitbutton
	closetext
	end

TrainerPsychicFidel:
	trainer EVENT_BEAT_PSYCHIC_FIDEL, PSYCHIC_T, FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, 0, PsychicFidelScript

PsychicFidelScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x681ec
	waitbutton
	closetext
	end

Route11Sign:
	jumptext Route11SignText

FruitTreeScript_0x68055:
	fruittree FRUITTREE_ROUTE_11

Route11HiddenRevive:
	dwb EVENT_ROUTE_11_HIDDEN_REVIVE, REVIVE


YoungsterOwenSeenText:
	text "There's no cheat-"
	line "ing in #MON."

	para "Let's keep it fair"
	line "and square!"
	done

YoungsterOwenBeatenText:
	text "Huh? How did this"
	line "happen?"
	done

UnknownText_0x680b2:
	text "I fought fair and"
	line "square with honor."

	para "I don't regret"
	line "this at all."
	done

YoungsterJasonSeenText:
	text "It itches and"
	line "tickles a bit when"

	para "I wear shorts in"
	line "the grass."
	done

YoungsterJasonBeatenText:
	text "Aiyaaah!"
	line "I got stomped!"
	done

UnknownText_0x6814a:
	text "I'm going to catch"
	line "more #MON in"
	cont "the grass."
	done

PsychicHermanSeenText:
	text "…"
	done

PsychicHermanBeatenText:
	text "…"
	done

UnknownText_0x6817b:
	text "…"

	para "I lost while I had"
	line "my eyes closed…"
	done

PsychicFidelSeenText:
	text "I can see it…"

	para "Everything to see"
	line "about you…"
	done

PsychicFidelBeatenText:
	text "I couldn't foresee"
	line "your power…"
	done

UnknownText_0x681ec:
	text "Strength in con-"
	line "viction…"

	para "You're strong be-"
	line "cause you believe"
	cont "in your #MON."
	done

Route11SignText:
	text "ROUTE 11"
	done

Route11_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 0

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 3, SIGNPOST_READ, Route11Sign
	signpost 5, 32, SIGNPOST_ITEM, Route11HiddenRevive

.PersonEvents:
	db 5
	person_event SPRITE_YOUNGSTER, 14, 22, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterOwen, -1
	person_event SPRITE_YOUNGSTER, 4, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterJason, -1
	person_event SPRITE_YOUNGSTER, 7, 28, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerPsychicHerman, -1
	person_event SPRITE_YOUNGSTER, 6, 8, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerPsychicFidel, -1
	person_event SPRITE_FRUIT_TREE, 2, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FruitTreeScript_0x68055, -1
