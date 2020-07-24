	object_const_def
	const ROUTE16FUCHSIASPEECHHOUSE_SUPER_NERD

Route16FuchsiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

Route16FuchsiaSpeechHouseSuperNerdScript:
	jumptextfaceplayer Route16FuchsiaSpeechHouseSuperNerdText

Route16FuchsiaSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

Route16FuchsiaSpeechHouseSuperNerdText:
	text "If you cruise down"
	line "CYCLING ROAD, you"

	para "will end up in"
	line "FUCHSIA CITY."
	done

Route16FuchsiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_16, 1
	warp_event  3,  7, ROUTE_16, 1

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, Route16FuchsiaSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route16FuchsiaSpeechHouseSuperNerdScript, -1
