Route16_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	checkcode VAR_YCOORD
	if_less_than 5, .CanWalk
	checkcode VAR_XCOORD
	if_greater_than 13, .CanWalk
	setflag ENGINE_ALWAYS_ON_BIKE
	return

.CanWalk:
	clearflag ENGINE_ALWAYS_ON_BIKE
	return

CyclingRoadSign:
	jumptext CyclingRoadSignText

CyclingRoadSignText:
	text "CYCLING ROAD"

	para "DOWNHILL COASTING"
	line "ALL THE WAY!"
	done

Route16_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 3, 1, 1, ROUTE_16_FUCHSIA_SPEECH_HOUSE
	warp_event 14, 6, 3, ROUTE_16_GATE
	warp_event 14, 7, 4, ROUTE_16_GATE
	warp_event 9, 6, 1, ROUTE_16_GATE
	warp_event 9, 7, 2, ROUTE_16_GATE

	db 0 ; coord events

	db 1 ; bg events
	bg_event 5, 5, BGEVENT_READ, CyclingRoadSign

	db 0 ; object events
