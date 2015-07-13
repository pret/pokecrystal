Route3_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerFirebreatherOtis:
	; bit/flag number
	dw EVENT_BEAT_FIREBREATHER_OTIS

	; trainer group && trainer id
	db FIREBREATHER, OTIS

	; text when seen
	dw FirebreatherOtisSeenText

	; text when trainer beaten
	dw FirebreatherOtisBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherOtisScript

FirebreatherOtisScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1adff7
	closetext
	loadmovesprites
	end

TrainerYoungsterWarren:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_WARREN

	; trainer group && trainer id
	db YOUNGSTER, WARREN

	; text when seen
	dw YoungsterWarrenSeenText

	; text when trainer beaten
	dw YoungsterWarrenBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterWarrenScript

YoungsterWarrenScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae051
	closetext
	loadmovesprites
	end

TrainerYoungsterJimmy:
	; bit/flag number
	dw EVENT_BEAT_YOUNGSTER_JIMMY

	; trainer group && trainer id
	db YOUNGSTER, JIMMY

	; text when seen
	dw YoungsterJimmySeenText

	; text when trainer beaten
	dw YoungsterJimmyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterJimmyScript

YoungsterJimmyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ae0a9
	closetext
	loadmovesprites
	end

TrainerFirebreatherBurt:
	; bit/flag number
	dw EVENT_BEAT_FIREBREATHER_BURT

	; trainer group && trainer id
	db FIREBREATHER, BURT

	; text when seen
	dw FirebreatherBurtSeenText

	; text when trainer beaten
	dw FirebreatherBurtBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FirebreatherBurtScript

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

	; warps
	db 1
	warp_def $1, $34, 1, GROUP_MOUNT_MOON, MAP_MOUNT_MOON

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 13, 49, $0, MapRoute3Signpost0Script

	; people-events
	db 4
	person_event SPRITE_FISHER, 16, 30, $7, $0, 255, 255, $82, 2, TrainerFirebreatherOtis, -1
	person_event SPRITE_YOUNGSTER, 11, 14, $8, $0, 255, 255, $92, 3, TrainerYoungsterWarren, -1
	person_event SPRITE_YOUNGSTER, 7, 20, $a, $0, 255, 255, $92, 1, TrainerYoungsterJimmy, -1
	person_event SPRITE_FISHER, 9, 53, $a, $0, 255, 255, $82, 3, TrainerFirebreatherBurt, -1
