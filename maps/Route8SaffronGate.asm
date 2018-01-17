const_value set 2
	const ROUTE8SAFFRONGATE_OFFICER

Route8SaffronGate_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Route8SaffronGateOfficerScript:
	jumptextfaceplayer Route8SaffronGateOfficerText

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 14, SAFFRON_CITY
	warp_def 0, 5, 15, SAFFRON_CITY
	warp_def 9, 4, 1, ROUTE_8
	warp_def 9, 5, 2, ROUTE_8

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
