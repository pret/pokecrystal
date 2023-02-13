	object_const_def
	const CERULEANPOLICESTATION_FISHING_GURU
	const CERULEANPOLICESTATION_POKEFAN_F
	const CERULEANPOLICESTATION_DIGLETT

CeruleanPoliceStation_MapScripts:
	def_scene_scripts

	def_callbacks

CeruleanPoliceStationFishingGuruScript:
	jumptextfaceplayer CeruleanPoliceStationFishingGuruText

CeruleanPoliceStationPokefanFScript:
	jumptextfaceplayer CeruleanPoliceStationPokefanFText

CeruleanDiglett:
	opentext
	writetext CeruleanDiglettText
	cry DIGLETT
	waitbutton
	closetext
	end

CeruleanPoliceStationFishingGuruText:
	text "On raconte qu'un"
	line "drôle de type"
	cont "rode dans le coin."

	para "Si c'est un vo-"
	line "leur, ça craint."
	done

CeruleanPoliceStationPokefanFText:
	text "Des voleurs nous"
	line "ont déjà volés."
	done

CeruleanDiglettText:
	text "TAUPIQUEUR: Topi!"
	done

CeruleanPoliceStation_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, CERULEAN_CITY, 2
	warp_event  3,  7, CERULEAN_CITY, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationFishingGuruScript, -1
	object_event  5,  4, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanPoliceStationPokefanFScript, -1
	object_event  3,  5, SPRITE_DIGLETT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CeruleanDiglett, -1
