	object_const_def
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_LASS
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_YOUNGSTER

CherrygroveEvolutionSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

CherrygroveEvolutionSpeechHouseYoungsterScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseYoungsterText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseLassScript:
	opentext
	writetext CherrygroveEvolutionSpeechHouseLassText
	waitbutton
	closetext
	end

CherrygroveEvolutionSpeechHouseBookshelf:
	jumpstd MagazineBookshelfScript

CherrygroveEvolutionSpeechHouseYoungsterText:
	text "Les #MON"
	line "gagnent de l'expé-"

	para "rience et évoluent"
	line "en combattant."
	done

CherrygroveEvolutionSpeechHouseLassText:
	text "Les #MON"
	line "évoluent?"

	para "Je serais curieuse"
	line "de voir ça!"
	done

CherrygroveEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CHERRYGROVE_CITY, 5
	warp_event  3,  7, CHERRYGROVE_CITY, 5

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf

	def_object_events
	object_event  3,  5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseLassScript, -1
	object_event  2,  5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CherrygroveEvolutionSpeechHouseYoungsterScript, -1
