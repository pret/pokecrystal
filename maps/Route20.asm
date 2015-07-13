Route20_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, .ClearRocks

.ClearRocks
	setevent EVENT_CINNABAR_ROCKS_CLEARED
	return

TrainerSwimmerfNicole:
	; bit/flag number
	dw EVENT_BEAT_SWIMMERF_NICOLE

	; trainer group && trainer id
	db SWIMMERF, NICOLE

	; text when seen
	dw SwimmerfNicoleSeenText

	; text when trainer beaten
	dw SwimmerfNicoleBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfNicoleScript

SwimmerfNicoleScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1acd93
	closetext
	loadmovesprites
	end

TrainerSwimmerfLori:
	; bit/flag number
	dw EVENT_BEAT_SWIMMERF_LORI

	; trainer group && trainer id
	db SWIMMERF, LORI

	; text when seen
	dw SwimmerfLoriSeenText

	; text when trainer beaten
	dw SwimmerfLoriBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmerfLoriScript

SwimmerfLoriScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ace15
	closetext
	loadmovesprites
	end

TrainerSwimmermCameron:
	; bit/flag number
	dw EVENT_BEAT_SWIMMERM_CAMERON

	; trainer group && trainer id
	db SWIMMERM, CAMERON

	; text when seen
	dw SwimmermCameronSeenText

	; text when trainer beaten
	dw SwimmermCameronBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SwimmermCameronScript

SwimmermCameronScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ace8b
	closetext
	loadmovesprites
	end

MapRoute20Signpost0Script:
	jumptext UnknownText_0x1acec2

SwimmerfNicoleSeenText:
	text "I feel so much"
	line "lighter in water."
	done

SwimmerfNicoleBeatenText:
	text "Oh, no!"
	done

UnknownText_0x1acd93:
	text "Swimming exercises"
	line "your full body."

	para "It's really good"
	line "for you."
	done

SwimmerfLoriSeenText:
	text "What an impressive"
	line "collection of GYM"

	para "BADGES. We should"
	line "battle!"
	done

SwimmerfLoriBeatenText:
	text "No!"
	done

UnknownText_0x1ace15:
	text "SURF is no longer"
	line "the only HM move"
	cont "you use in water."
	done

SwimmermCameronSeenText:
	text "I guess it's im-"
	line "possible to swim"

	para "all the way to"
	line "JOHTO."
	done

SwimmermCameronBeatenText:
	text "Aiyah!"
	done

UnknownText_0x1ace8b:
	text "Besides the sea, I"
	line "can also swim in"
	cont "ponds and rivers."
	done

UnknownText_0x1acec2:
	text "What does this"
	line "sign say?"

	para "CINNABAR GYM"
	line "LEADER: BLAINE"
	done

Route20_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 1
	warp_def $7, $26, 1, GROUP_SEAFOAM_GYM, MAP_SEAFOAM_GYM

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 11, 37, $0, MapRoute20Signpost0Script

	; people-events
	db 3
	person_event SPRITE_SWIMMER_GIRL, 12, 56, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfNicole, -1
	person_event SPRITE_SWIMMER_GIRL, 17, 49, $a, $0, 255, 255, $a2, 3, TrainerSwimmerfLori, -1
	person_event SPRITE_SWIMMER_GUY, 17, 16, $a, $0, 255, 255, $82, 3, TrainerSwimmermCameron, -1
