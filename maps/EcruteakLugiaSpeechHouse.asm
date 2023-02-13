	object_const_def
	const ECRUTEAKLUGIASPEECHHOUSE_GRAMPS
	const ECRUTEAKLUGIASPEECHHOUSE_YOUNGSTER

EcruteakLugiaSpeechHouse_MapScripts:
	def_scene_scripts

	def_callbacks

EcruteakLugiaSpeechHouseGrampsScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseGrampsText

EcruteakLugiaSpeechHouseYoungsterScript:
	jumptextfaceplayer EcruteakLugiaSpeechHouseYoungsterText

LugiaSpeechHouseRadio:
	jumpstd Radio2Script

EcruteakLugiaSpeechHouseGrampsText:
	text "Ca s'est passé"
	line "lorsque j'étais"
	cont "jeune."

	para "Le ciel est"
	line "soudainement deve-"

	para "nu noir. Un #-"
	line "MON gigantesque"
	cont "cachait les rayons"
	cont "du soleil."

	para "Je me demande quel"
	line "#MON c'était..."

	para "C'était comme un"
	line "oiseau ou un"
	cont "dragon."
	done

EcruteakLugiaSpeechHouseYoungsterText:
	text "Existe-t-il un"
	line "#MON aussi"

	para "grand? Si c'est le"
	line "cas, il doit être"
	cont "puissant."
	done

EcruteakLugiaSpeechHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  7, ECRUTEAK_CITY, 7
	warp_event  4,  7, ECRUTEAK_CITY, 7

	def_coord_events

	def_bg_events
	bg_event  2,  1, BGEVENT_READ, LugiaSpeechHouseRadio

	def_object_events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseGrampsScript, -1
	object_event  5,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakLugiaSpeechHouseYoungsterScript, -1
