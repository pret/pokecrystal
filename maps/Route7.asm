Route7_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MapRoute7Signpost0Script:
	jumptext UnknownText_0x1ad388

MapRoute7Signpost1Script:
	jumptext UnknownText_0x1ad456

UnknownText_0x1ad388:
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

UnknownText_0x1ad456:
	text "It's locked…"
	done

Route7_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $6, $f, 1, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE
	warp_def $7, $f, 2, GROUP_ROUTE_7_SAFFRON_GATE, MAP_ROUTE_7_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 11, 5, SIGNPOST_READ, MapRoute7Signpost0Script
	signpost 9, 6, SIGNPOST_READ, MapRoute7Signpost1Script

.PersonEvents:
	db 0
