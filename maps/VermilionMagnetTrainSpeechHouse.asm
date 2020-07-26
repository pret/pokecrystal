	object_const_def
	const VERMILIONMAGNETTRAINSPEECHHOUSE_POKEFAN_F
	const VERMILIONMAGNETTRAINSPEECHHOUSE_YOUNGSTER

VermilionMagnetTrainSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

VermilionMagnetTrainSpeechHousePokefanFScript:
	jumptextfaceplayer VermilionMagnetTrainSpeechHousePokefanFText

VermilionMagnetTrainSpeechHouseYoungsterScript:
	jumptextfaceplayer VermilionMagnetTrainSpeechHouseYoungsterText

VermilionMagnetTrainSpeechHouseBookshelf:
	jumpstd PictureBookshelfScript

VermilionMagnetTrainSpeechHousePokefanFText:
	text "Do you know about"
	line "the MAGNET TRAIN?"

	para "It's a railway"
	line "that goes to GOL-"
	cont "DENROD in JOHTO."
	done

VermilionMagnetTrainSpeechHouseYoungsterText:
	text "I want to go to"
	line "SAFFRON to see"
	cont "the MAGNET TRAIN."
	done

VermilionMagnetTrainSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 4
	warp_event  3,  7, VERMILION_CITY, 4

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, VermilionMagnetTrainSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, VermilionMagnetTrainSpeechHouseBookshelf

	def_object_events
	object_event  2,  3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMagnetTrainSpeechHousePokefanFScript, -1
	object_event  0,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMagnetTrainSpeechHouseYoungsterScript, -1
