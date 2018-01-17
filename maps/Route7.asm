Route7_MapScripts:
.SceneScripts:
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

Route7_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 15, 6, 1, ROUTE_7_SAFFRON_GATE
	warp_def 15, 7, 2, ROUTE_7_SAFFRON_GATE

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event 6, 9, BGEVENT_READ, Route7LockedDoor

.ObjectEvents:
	db 0
