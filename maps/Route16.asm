Route16_MapScriptHeader: ; 0x1ad313
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x1ad318
; 0x1ad318

UnknownScript_0x1ad318: ; 0x1ad318
	checkcode $13
	if_less_than $5, UnknownScript_0x1ad328
	checkcode $12
	if_greater_than $d, UnknownScript_0x1ad328
	setflag $0019
	return
; 0x1ad328

UnknownScript_0x1ad328: ; 0x1ad328
	clearflag $0019
	return
; 0x1ad32c

MapRoute16Signpost0Script: ; 0x1ad32c
	jumptext UnknownText_0x1ad32f
; 0x1ad32f

UnknownText_0x1ad32f: ; 0x1ad32f
	db $0, "CYCLING ROAD", $51
	db "DOWNHILL COASTING", $4f
	db "ALL THE WAY!", $57
; 0x1ad35c

Route16_MapEventHeader: ; 0x1ad35c
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $1, $3, 1, GROUP_ROUTE_16_FUCHSIA_SPEECH_HOUSE, MAP_ROUTE_16_FUCHSIA_SPEECH_HOUSE
	warp_def $6, $e, 3, GROUP_ROUTE_16_GATE, MAP_ROUTE_16_GATE
	warp_def $7, $e, 4, GROUP_ROUTE_16_GATE, MAP_ROUTE_16_GATE
	warp_def $6, $9, 1, GROUP_ROUTE_16_GATE, MAP_ROUTE_16_GATE
	warp_def $7, $9, 2, GROUP_ROUTE_16_GATE, MAP_ROUTE_16_GATE

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 5, 5, $0, MapRoute16Signpost0Script

	; people-events
	db 0
; 0x1ad380

