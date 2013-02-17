Route28_MapScriptHeader: ; 0x1a540b
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a540d

MapRoute28Signpost0Script: ; 0x1a540d
	jumptext UnknownText_0x1a5413
; 0x1a5410

MapRoute28SignpostItem1: ; 0x1a5410
	dw $00a3
	db RARE_CANDY
	
; 0x1a5413

UnknownText_0x1a5413: ; 0x1a5413
	db $0, "ROUTE 28", $57
; 0x1a541d

Route28_MapEventHeader: ; 0x1a541d
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $7, 1, GROUP_ROUTE_28_FAMOUS_SPEECH_HOUSE, MAP_ROUTE_28_FAMOUS_SPEECH_HOUSE
	warp_def $5, $21, 7, GROUP_VICTORY_ROAD_GATE, MAP_VICTORY_ROAD_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 5, 31, $0, MapRoute28Signpost0Script
	signpost 2, 25, $7, MapRoute28SignpostItem1

	; people-events
	db 0
; 0x1a5437

