const_value set 2
	const ROUTE2946GATE_OFFICER
	const ROUTE2946GATE_YOUNGSTER

Route2946Gate_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route2946GateOfficerScript:
	jumptextfaceplayer Route2946GateOfficerText

Route2946GateYoungsterScript:
	jumptextfaceplayer Route2946GateYoungsterText

Route2946GateOfficerText:
	text "You can't climb"
	line "ledges."

	para "But you can jump"
	line "down from them to"
	cont "take a shortcut."
	done

Route2946GateYoungsterText:
	text "Different kinds of"
	line "#MON appear"
	cont "past here."

	para "If you want to"
	line "catch them all,"

	para "you have to look"
	line "everywhere."
	done

Route2946Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $4, 1, ROUTE_46
	warp_def $0, $5, 2, ROUTE_46
	warp_def $7, $4, 1, ROUTE_29
	warp_def $7, $5, 1, ROUTE_29

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event SPRITE_OFFICER, 4, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2946GateOfficerScript, -1
	object_event SPRITE_YOUNGSTER, 4, 6, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2946GateYoungsterScript, -1
