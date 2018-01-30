Route23_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_INDIGO_PLATEAU
	return

IndigoPlateauSign:
	jumptext IndigoPlateauSignText

IndigoPlateauSignText:
	text "INDIGO PLATEAU"

	para "The Ultimate Goal"
	line "for Trainers!"

	para "#MON LEAGUE HQ"
	done

Route23_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 9, 5, 1, INDIGO_PLATEAU_POKECENTER_1F
	warp_event 10, 5, 2, INDIGO_PLATEAU_POKECENTER_1F
	warp_event 9, 13, 10, VICTORY_ROAD
	warp_event 10, 13, 10, VICTORY_ROAD

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11, 7, BGEVENT_READ, IndigoPlateauSign

	db 0 ; object events
