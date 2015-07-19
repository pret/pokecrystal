Route16FuchsiaSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

SuperNerdScript_0x73373:
	jumptextfaceplayer UnknownText_0x73379

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x73379:
	text "If you cruise down"
	line "CYCLING ROAD, you"

	para "will end up in"
	line "FUCHSIA CITY."
	done

Route16FuchsiaSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $7, $3, 1, GROUP_ROUTE_16, MAP_ROUTE_16

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, SIGNPOST_READ, Route16FuchsiaSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route16FuchsiaSpeechHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_SUPER_NERD, 7, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, SuperNerdScript_0x73373, -1
