Route10North_MapScriptHeader: ; 0x1b207e
	; trigger count
	db 0

	; callback count
	db 0
; 0x1b2080

MapRoute10NorthSignpost0Script: ; 0x1b2080
	jumptext UnknownText_0x1b2086
; 0x1b2083

MapRoute10NorthSignpost1Script: ; 0x1b2083
	jumpstd $0010
; 0x1b2086

UnknownText_0x1b2086: ; 0x1b2086
	db $0, "KANTO POWER PLANT", $57
; 0x1b2099

Route10North_MapEventHeader: ; 0x1b2099
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $1, $b, 1, GROUP_ROUTE_10_POKECENTER_1F, MAP_ROUTE_10_POKECENTER_1F
	warp_def $9, $3, 1, GROUP_POWER_PLANT, MAP_POWER_PLANT

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 5, $0, MapRoute10NorthSignpost0Script
	signpost 1, 12, $0, MapRoute10NorthSignpost1Script

	; people-events
	db 0
; 0x1b20b3


