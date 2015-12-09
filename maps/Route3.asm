const_value set 2
	const ROUTE3_FISHER1
	const ROUTE3_YOUNGSTER1
	const ROUTE3_YOUNGSTER2
	const ROUTE3_FISHER2

Route3_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerFirebreatherOtis:
	trainer EVENT_BEAT_FIREBREATHER_OTIS, FIREBREATHER, OTIS, FirebreatherOtisSeenText, FirebreatherOtisBeatenText, 0, FirebreatherOtisScript

FirebreatherOtisScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1adff7
	waitbutton
	closetext
	end

TrainerYoungsterWarren:
	trainer EVENT_BEAT_YOUNGSTER_WARREN, YOUNGSTER, WARREN, YoungsterWarrenSeenText, YoungsterWarrenBeatenText, 0, YoungsterWarrenScript

YoungsterWarrenScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae051
	waitbutton
	closetext
	end

TrainerYoungsterJimmy:
	trainer EVENT_BEAT_YOUNGSTER_JIMMY, YOUNGSTER, JIMMY, YoungsterJimmySeenText, YoungsterJimmyBeatenText, 0, YoungsterJimmyScript

YoungsterJimmyScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae0a9
	waitbutton
	closetext
	end

TrainerFirebreatherBurt:
	trainer EVENT_BEAT_FIREBREATHER_BURT, FIREBREATHER, BURT, FirebreatherBurtSeenText, FirebreatherBurtBeatenText, 0, FirebreatherBurtScript

FirebreatherBurtScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1ae118
	waitbutton
	closetext
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
	warp_def $1, $34, 1, MOUNT_MOON

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 13, 49, SIGNPOST_READ, MapRoute3Signpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_FISHER, 12, 26, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 2, TrainerFirebreatherOtis, -1
	person_event SPRITE_YOUNGSTER, 7, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterWarren, -1
	person_event SPRITE_YOUNGSTER, 3, 16, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 1, TrainerYoungsterJimmy, -1
	person_event SPRITE_FISHER, 5, 49, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 3, TrainerFirebreatherBurt, -1
