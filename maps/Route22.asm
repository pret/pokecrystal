Route22_MapScriptHeader: ; 0x7c000
	; trigger count
	db 0

	; callback count
	db 0
; 0x7c002

MapRoute22Signpost0Script: ; 0x7c002
	jumptext UnknownText_0x7c005
; 0x7c005

UnknownText_0x7c005: ; 0x7c005
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done
; 0x7c028

Route22_MapEventHeader: ; 0x7c028
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
; 0x7c038

