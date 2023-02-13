	object_const_def
	const GOLDENRODPPSPEECHHOUSE_FISHER
	const GOLDENRODPPSPEECHHOUSE_LASS

GoldenrodPPSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

GoldenrodPPSpeechHouseFisherScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseFisherText

GoldenrodPPSpeechHouseLassScript:
	jumptextfaceplayer GoldenrodPPSpeechHouseLassText

GoldenrodPPSpeechHouseBookshelf2:
	jumpstd DifficultBookshelfScript

GoldenrodPPSpeechHouseBookshelf1:
	jumpstd MagazineBookshelfScript

GoldenrodPPSpeechHouseRadio:
	jumpstd Radio2Script

GoldenrodPPSpeechHouseFisherText:
	text "Une fois lorsque"
	line "je me battais, mes"

	para "#MON ne"
	line "pouvaient plus"
	cont "attaquer."

	para "Les POINTS de"
	line "POUVOIR, ou PP,"

	para "de mes attaques"
	line "étaient épuisés."
	done

GoldenrodPPSpeechHouseLassText:
	text "Quelques fois, un"
	line "#MON en pleine"

	para "forme ne peut pas"
	line "utiliser ses"
	cont "attaques."

	para "Si cela se produit"
	line "soigne-le dans un"
	cont "CENTRE #MON ou"
	cont "utilise un objet."
	done

GoldenrodPPSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, GOLDENROD_CITY, 7
	warp_event  3,  7, GOLDENROD_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, GoldenrodPPSpeechHouseBookshelf2
	bg_event  7,  1, BGEVENT_READ, GoldenrodPPSpeechHouseRadio

	def_object_events
	object_event  2,  4, SPRITE_FISHER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseFisherScript, -1
	object_event  5,  3, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodPPSpeechHouseLassScript, -1
