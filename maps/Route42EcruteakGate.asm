const_value set 2
	const ROUTE42ECRUTEAKGATE_OFFICER

Route42EcruteakGate_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route42EcruteakGateOfficerScript:
	jumptextfaceplayer Route42EcruteakGateOfficerText

Route42EcruteakGateOfficerText:
	text "MT.MORTAR is like"
	line "a maze inside."

	para "Be careful. Don't"
	line "get lost in there."
	done

Route42EcruteakGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 1, ECRUTEAK_CITY
	warp_def $5, $0, 2, ECRUTEAK_CITY
	warp_def $4, $9, 1, ROUTE_42
	warp_def $5, $9, 2, ROUTE_42

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_OFFICER, 2, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route42EcruteakGateOfficerScript, -1
