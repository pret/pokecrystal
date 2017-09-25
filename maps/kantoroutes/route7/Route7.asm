Route7_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Route7UndergroundPathSign:
	jumptext Route7UndergroundPathSignText

Route7LockedDoor:
	jumptext Route7LockedDoorText

Route7UndergroundPathSignText:
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

Route7LockedDoorText:
	text "It's locked…"
	done

Route7_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $6, $f, 1, ROUTE_7_SAFFRON_GATE
	warp_def $7, $f, 2, ROUTE_7_SAFFRON_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 11, 5, SIGNPOST_READ, Route7UndergroundPathSign
	signpost 9, 6, SIGNPOST_READ, Route7LockedDoor

.PersonEvents:
	db 0
