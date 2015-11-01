Route11_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerYoungsterOwen:
	trainer EVENT_BEAT_YOUNGSTER_OWEN, YOUNGSTER, OWEN, YoungsterOwenSeenText, YoungsterOwenBeatenText, NONE, YoungsterOwenScript

YoungsterOwenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x680b2
	closetext
	loadmovesprites
	end

TrainerYoungsterJason:
	trainer EVENT_BEAT_YOUNGSTER_JASON, YOUNGSTER, JASON, YoungsterJasonSeenText, YoungsterJasonBeatenText, NONE, YoungsterJasonScript

YoungsterJasonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6814a
	closetext
	loadmovesprites
	end

TrainerPsychicHerman:
	trainer EVENT_BEAT_PSYCHIC_HERMAN, PSYCHIC_T, HERMAN, PsychicHermanSeenText, PsychicHermanBeatenText, NONE, PsychicHermanScript

PsychicHermanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6817b
	closetext
	loadmovesprites
	end

TrainerPsychicFidel:
	trainer EVENT_BEAT_PSYCHIC_FIDEL, PSYCHIC_T, FIDEL, PsychicFidelSeenText, PsychicFidelBeatenText, NONE, PsychicFidelScript

PsychicFidelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x681ec
	closetext
	loadmovesprites
	end

MapRoute11Signpost0Script:
	jumptext UnknownText_0x68238

FruitTreeScript_0x68055:
	fruittree $18

MapRoute11SignpostItem1:
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

UnknownText_0x68238:
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
	signpost 7, 3, SIGNPOST_READ, MapRoute11Signpost0Script
	signpost 5, 32, SIGNPOST_ITEM, MapRoute11SignpostItem1

.PersonEvents:
	db 5
	person_event SPRITE_YOUNGSTER, 14, 22, SPRITEMOVEDATA_0A, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerYoungsterOwen, -1
	person_event SPRITE_YOUNGSTER, 4, 20, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerYoungsterJason, -1
	person_event SPRITE_YOUNGSTER, 7, 28, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 1, TrainerPsychicHerman, -1
	person_event SPRITE_YOUNGSTER, 6, 8, SPRITEMOVEDATA_0A, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerPsychicFidel, -1
	person_event SPRITE_FRUIT_TREE, 2, 32, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 0, 0, FruitTreeScript_0x68055, -1
