const_value set 2 ; object constants
	const ROUTE5SAFFRONGATE_OFFICER

Route5SaffronGate_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Route5SaffronGateOfficerScript:
	jumptextfaceplayer Route5SaffronGateOfficerText

Route5SaffronGateOfficerText:
	text "You're from JOHTO,"
	line "aren't you?"

	para "How do you like"
	line "KANTO? It's nice,"
	cont "don't you agree?"
	done

Route5SaffronGate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 4, 0, 2, ROUTE_5
	warp_event 5, 0, 3, ROUTE_5
	warp_event 4, 7, 9, SAFFRON_CITY
	warp_event 5, 7, 9, SAFFRON_CITY

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 0, 4, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route5SaffronGateOfficerScript, -1
