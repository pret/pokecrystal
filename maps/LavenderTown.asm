	object_const_def
	const LAVENDERTOWN_POKEFAN_M
	const LAVENDERTOWN_TEACHER
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LavenderTownFlypointCallback

LavenderTownFlypointCallback:
	setflag ENGINE_FLYPOINT_LAVENDER
	endcallback

LavenderTownPokefanMScript:
	jumptextfaceplayer LavenderTownPokefanMText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownYoungsterScript:
	jumptextfaceplayer LavenderTownYoungsterText

LavenderTownSign:
	jumptext LavenderTownSignText

KantoRadioStationSign:
	jumptext KantoRadioStationSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd PokecenterSignScript

LavenderMartSignText:
	jumpstd MartSignScript

LavenderTownPokefanMText:
	text "Quel bâtiment,"
	line "hein?"

	para "C'est la TOUR"
	line "RADIO de KANTO."
	done

LavenderTownTeacherText:
	text "KANTO a beaucoup"
	line "d'émissions radio."
	done

LavenderTownGrampsText:
	text "Les gens viennent"
	line "de loin pour sa-"

	para "luer le départ des"
	line "âmes des pauvres"
	cont "#MON."
	done

LavenderTownYoungsterText:
	text "Il faut une #"
	line "FLUTE pour réveil-"
	cont "ler un #MON."

	para "Tout le monde sait"
	line "ça, voyons!"
	done

LavenderTownSignText:
	text "LAVANVILLE"

	para "La ville d'un"
	line "pourpre royal"
	done

KantoRadioStationSignText:
	text "STATION de RADIO"
	line "de KANTO"

	para "Vos émissions"
	line "favorites!"
	done

VolunteerPokemonHouseSignText:
	text "BENEVOLAT de"
	line "LAVANVILLE"
	done

SoulHouseSignText:
	text "MAISON DES AMES"

	para "Que les âmes des"
	line "#MON reposent"
	cont "en paix"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  5,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  5,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event  1,  5, LAVENDER_MART, 2
	warp_event 13, 11, SOUL_HOUSE, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	def_coord_events

	def_bg_events
	bg_event 11,  3, BGEVENT_READ, LavenderTownSign
	bg_event 15,  7, BGEVENT_READ, KantoRadioStationSign
	bg_event  3,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event 15, 13, BGEVENT_READ, SoulHouseSign
	bg_event  6,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event  2,  5, BGEVENT_READ, LavenderMartSignText

	def_object_events
	object_event 12,  7, SPRITE_POKEFAN_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownPokefanMScript, -1
	object_event  2, 15, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event 14, 12, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownGrampsScript, -1
	object_event  6, 11, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownYoungsterScript, -1
