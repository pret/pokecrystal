Route22_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapRoute22Signpost0Script:
	jumptext UnknownText_0x7c005

UnknownText_0x7c005:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

Route22_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $d, 1, GROUP_VICTORY_ROAD_GATE, MAP_VICTORY_ROAD_GATE

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 7, 15, SIGNPOST_READ, MapRoute22Signpost0Script

.PersonEvents:
	db 0
