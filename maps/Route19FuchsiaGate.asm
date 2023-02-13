	object_const_def
	const ROUTE19FUCHSIAGATE_OFFICER

Route19FuchsiaGate_MapScripts:
	def_scene_scripts

	def_callbacks

Route19FuchsiaGateOfficerScript:
	faceplayer
	opentext
	checkevent EVENT_CINNABAR_ROCKS_CLEARED
	iftrue .RocksCleared
	writetext Route19FuchsiaGateOfficerText
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19FuchsiaGateOfficerText_RocksCleared
	waitbutton
	closetext
	end

Route19FuchsiaGateOfficerText:
	text "Le volcan de"
	line "CRAMOIS'ILE est en"
	cont "éruption."

	para "Il a craché des"
	line "rochers bloquant"
	cont "la ROUTE 19."

	para "Les habitants de"
	line "CRAMOIS'ILE sont-"
	cont "ils en sécurité?"
	done

Route19FuchsiaGateOfficerText_RocksCleared:
	text "Aucun habitant de"
	line "CRAMOIS'ILE n'a"

	para "été blessé pendant"
	line "l'éruption. Cool!"
	done

Route19FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  0, FUCHSIA_CITY, 10
	warp_event  5,  0, FUCHSIA_CITY, 11
	warp_event  4,  7, ROUTE_19, 1
	warp_event  5,  7, ROUTE_19, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  0,  4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route19FuchsiaGateOfficerScript, -1
