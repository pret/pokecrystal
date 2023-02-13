	object_const_def
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf: ; unreferenced
	jumpstd PictureBookshelfScript

FishingDudeText:
	text "Moi chuis le"
	line "GARS QUI PECHE,"
	cont "l'aîné des FRERES"
	cont "PECHEURS."

	para "As-tu vu le MAITRE"
	line "PECHEUR au LAC"
	cont "COLERE?"

	para "Il rêve de voir le"
	line "plus grand MAGI-"
	cont "CARPE du monde."

	para "Si ça t'embête pas"
	line "trop, peux-tu lui"

	para "montrer les"
	line "MAGICARPE que"
	cont "tu attrapes?"

	para "Qui sait, tu"
	line "attraperas peut-"
	cont "être le MAGICARPE"
	cont "de ses rêves."
	done

FishingDudesHousePhotoText:
	text "C'est une photo de"
	line "pêcheurs..."

	para "Ils ont l'air de"
	line "s'amuser..."
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	def_object_events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
