const_value set 2
	const ROUTE15FUCHSIAGATE_OFFICER

Route15FuchsiaGate_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route15FuchsiaGateOfficerScript:
	jumptextfaceplayer Route15FuchsiaGateOfficerText

Route15FuchsiaGateOfficerText:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 8, FUCHSIA_CITY
	warp_def 0, 5, 9, FUCHSIA_CITY
	warp_def 9, 4, 1, ROUTE_15
	warp_def 9, 5, 2, ROUTE_15

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FuchsiaGateOfficerScript, -1
