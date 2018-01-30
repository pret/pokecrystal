const_value set 2
	const ROUTE15FUCHSIAGATE_OFFICER

Route15FuchsiaGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route15FuchsiaGateOfficerScript:
	jumptextfaceplayer Route15FuchsiaGateOfficerText

Route15FuchsiaGateOfficerText:
	text "You're working on"
	line "a #DEX? That's"

	para "really something."
	line "Don't give up!"
	done

Route15FuchsiaGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 0, 4, 8, FUCHSIA_CITY
	warp_event 0, 5, 9, FUCHSIA_CITY
	warp_event 9, 4, 1, ROUTE_15
	warp_event 9, 5, 2, ROUTE_15

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15FuchsiaGateOfficerScript, -1
