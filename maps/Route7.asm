Route7_MapScriptHeader: ; 0x1ad380
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ad382

MapRoute7Signpost0Script: ; 0x1ad382
	jumptext UnknownText_0x1ad388
; 0x1ad385

MapRoute7Signpost1Script: ; 0x1ad385
	jumptext UnknownText_0x1ad456
; 0x1ad388

UnknownText_0x1ad388: ; 0x1ad388
	text "What's this flyer?"

	para "… Uncouth trainers"
	line "have been holding"

	para "battles in the"
	line "UNDERGROUND PATH."

	para "Because of rising"
	line "complaints by lo-"
	cont "cal residents, the"
	cont "UNDERGROUND PATH"
	cont "has been sealed"
	cont "indefinitely."

	para "CELADON POLICE"
	done
; 0x1ad456

UnknownText_0x1ad456: ; 0x1ad456
	text "It's locked…"
	done
; 0x1ad463

Route7_MapEventHeader: ; 0x1ad463
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $6, $f, 1, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE
	warp_def $7, $f, 2, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 11, 5, $0, MapRoute7Signpost0Script
	signpost 9, 6, $0, MapRoute7Signpost1Script

	; people-events
	db 0
; 0x1ad47d

