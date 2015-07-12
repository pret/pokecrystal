Route11_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerYoungsterOwen:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_OWEN

	; trainer group && trainer id
	db YOUNGSTER, OWEN

	; text when seen
	dw YoungsterOwenSeenText

	; text when trainer beaten
	dw YoungsterOwenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterOwenScript

YoungsterOwenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x680b2
	closetext
	loadmovesprites
	end

TrainerYoungsterJason:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_JASON

	; trainer group && trainer id
	db YOUNGSTER, JASON

	; text when seen
	dw YoungsterJasonSeenText

	; text when trainer beaten
	dw YoungsterJasonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJasonScript

YoungsterJasonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6814a
	closetext
	loadmovesprites
	end

TrainerPsychicHerman:
	; bit/flag number
	dw EVENT_BEAT_PSYCHIC_HERMAN

	; trainer group && trainer id
	db PSYCHIC_T, HERMAN

	; text when seen
	dw PsychicHermanSeenText

	; text when trainer beaten
	dw PsychicHermanBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicHermanScript

PsychicHermanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x6817b
	closetext
	loadmovesprites
	end

TrainerPsychicFidel:
	; bit/flag number
	dw EVENT_BEAT_PSYCHIC_FIDEL

	; trainer group && trainer id
	db PSYCHIC_T, FIDEL

	; text when seen
	dw PsychicFidelSeenText

	; text when trainer beaten
	dw PsychicFidelBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PsychicFidelScript

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
	dw $00f5
	db REVIVE
	

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

	; warps
	db 0

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 3, $0, MapRoute11Signpost0Script
	signpost 5, 32, $7, MapRoute11SignpostItem1

	; people-events
	db 5
	person_event SPRITE_YOUNGSTER, 18, 26, $a, $0, 255, 255, $92, 3, TrainerYoungsterOwen, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 8, 24, $6, $0, 255, 255, $92, 3, TrainerYoungsterJason, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 11, 32, $6, $0, 255, 255, $92, 1, TrainerPsychicHerman, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 10, 12, $a, $0, 255, 255, $92, 3, TrainerPsychicFidel, EVENT_ALWAYS_THERE
	person_event SPRITE_FRUIT_TREE, 6, 36, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x68055, EVENT_ALWAYS_THERE
