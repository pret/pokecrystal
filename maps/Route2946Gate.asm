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
	warp_def 4, 0, 1, ROUTE_46
	warp_def 5, 0, 2, ROUTE_46
	warp_def 4, 7, 1, ROUTE_29
	warp_def 5, 7, 1, ROUTE_29

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route2946GateOfficerScript, -1
	object_event 6, 4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route2946GateYoungsterScript, -1
