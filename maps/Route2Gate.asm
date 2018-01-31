const_value set 2 ; person constants
	const ROUTE2GATE_SCIENTIST

Route2Gate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route2GateScientistScript:
	jumptextfaceplayer Route2GateScientistText

Route2GateScientistText:
	text "Are you <PLAY_G>?"

	para "I work as PROF."
	line "OAK's AIDE."

	para "I had no idea that"
	line "you were out here."

	para "PROF.OAK's LAB is"
	line "nearby in PALLET"
	cont "TOWN."
	done

Route2Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 3, ROUTE_2
	warp_event 5, 0, 4, ROUTE_2
	warp_event 4, 7, 2, ROUTE_2
	warp_event 5, 7, 2, ROUTE_2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 6, 4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
