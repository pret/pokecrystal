const_value set 2
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD

Route16FuchsiaSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route16FuchsiaSpeechHouseSuperNerdScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseSuperNerdText

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd picturebookshelf

Route16FuchsiaSpeechHouseSuperNerdText:
	text "If you cruise down"
	line "CYCLING ROAD, you"

	para "will end up in"
	line "FUCHSIA CITY."
	done

Route16FuchsiaSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, ROUTE_16
	warp_def $7, $3, 1, ROUTE_16

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, Route16FuchsiaSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, Route16FuchsiaSpeechHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, PERSONTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseSuperNerdScript, -1
