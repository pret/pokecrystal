Route22_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 1
	warp_def $5, $d, 1, GROUP_VICTORY_ROAD_GATE, MAP_VICTORY_ROAD_GATE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 7, 15, $0, MapRoute22Signpost0Script

	; people-events
	db 0
