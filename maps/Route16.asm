Route16_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_NEWMAP, .AlwaysOnBike

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

Route16_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 3, 1, 1, ROUTE_16_FUCHSIA_SPEECH_HOUSE
	warp_def 14, 6, 3, ROUTE_16_GATE
	warp_def 14, 7, 4, ROUTE_16_GATE
	warp_def 9, 6, 1, ROUTE_16_GATE
	warp_def 9, 7, 2, ROUTE_16_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 5, 5, BGEVENT_READ, CyclingRoadSign

.ObjectEvents:
	db 0
