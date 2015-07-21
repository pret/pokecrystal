Route3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerFirebreatherOtis:
	trainer EVENT_BEAT_FIREBREATHER_OTIS, FIREBREATHER, OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, $0000, FirebreatherOtisScript

FirebreatherOtisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1adff7
	closetext
	loadmovesprites
	end

TrainerYoungsterWarren:
	trainer EVENT_BEAT_YOUNGSTER_WARREN, YOUNGSTER, WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, $0000, YoungsterWarrenScript

YoungsterWarrenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae051
	closetext
	loadmovesprites
	end

TrainerYoungsterJimmy:
	trainer EVENT_BEAT_YOUNGSTER_JIMMY, YOUNGSTER, JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, $0000, YoungsterJimmyScript

YoungsterJimmyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae0a9
	closetext
	loadmovesprites
	end

TrainerFirebreatherBurt:
	trainer EVENT_BEAT_FIREBREATHER_BURT, FIREBREATHER, BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, $0000, FirebreatherBurtScript

FirebreatherBurtScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae118
	closetext
	loadmovesprites
	end

MapRoute3Signpost0Script:
	jumptext UnknownText_0x1ae163

FirebreatherOtisSeenText:
	text "Ah! The weather's"
	line "as fine as ever."
	done

FirebreatherOtisBeatenText:
	text "It's sunny, but"
	line "I'm all wet…"
	done

UnknownText_0x1adff7:
	text "When it rains,"
	line "it's hard to get"
	cont "ignition…"
	done

YoungsterWarrenSeenText:
	text "Hmmm… I don't know"
	line "what to do…"
	done

YoungsterWarrenBeatenText:
	text "I knew I'd lose…"
	done

UnknownText_0x1ae051:
	text "You looked strong."

	para "I was afraid to"
	line "take you on…"
	done

YoungsterJimmySeenText:
	text "I can run like the"
	line "wind!"
	done

YoungsterJimmyBeatenText:
	text "Blown away!"
	done

UnknownText_0x1ae0a9:
	text "I wear shorts the"
	line "whole year round."

	para "That's my fashion"
	line "policy."
	done

FirebreatherBurtSeenText:
	text "Step right up and"
	line "take a look!"
	done

FirebreatherBurtBeatenText:
	text "Yow! That's hot!"
	done

UnknownText_0x1ae118:
	text "The greatest fire-"
	line "breather in KANTO,"
	cont "that's me."

	para "But not the best"
	line "trainer…"
	done

UnknownText_0x1ae163:
	text "MT.MOON SQUARE"

	para "Just go up the"
	line "stairs."
	done

Route3_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $1, $34, 1, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 13, 49, SIGNPOST_READ, MapRoute3Signpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_FISHER, 16, 30, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerFirebreatherOtis, -1
	person_event SPRITE_YOUNGSTER, 11, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerYoungsterWarren, -1
	person_event SPRITE_YOUNGSTER, 7, 20, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerYoungsterJimmy, -1
	person_event SPRITE_FISHER, 9, 53, OW_LEFT | $2, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerFirebreatherBurt, -1
