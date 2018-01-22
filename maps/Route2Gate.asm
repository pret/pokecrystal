const_value set 2
	const ROUTE2GATE_SCIENTIST

Route2Gate_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

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
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 4, 0, 3, ROUTE_2
	warp_def 5, 0, 4, ROUTE_2
	warp_def 4, 7, 2, ROUTE_2
	warp_def 5, 7, 2, ROUTE_2

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 6, 4, SPRITE_SCIENTIST, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route2GateScientistScript, -1
