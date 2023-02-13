	object_const_def
	const LAVENDERSPEECHHOUSE_POKEFAN_F

LavenderSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

LavenderSpeechHousePokefanFScript:
	jumptextfaceplayer LavenderSpeechHousePokefanFText

LavenderSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

LavenderSpeechHousePokefanFText:
	text "LAVANVILLE est"
	line "une petite ville"

	para "calme au pied des"
	line "montagnes."

	para "Il y a plus de"
	line "passage depuis la"

	para "construction de la"
	line "TOUR RADIO."
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, LAVENDER_TOWN, 3
	warp_event  3,  7, LAVENDER_TOWN, 3

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
