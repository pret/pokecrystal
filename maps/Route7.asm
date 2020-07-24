Route7_MapScripts:
	def_scene_scripts

	def_callbacks

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
	db 0, 0 ; filler

	def_warp_events
	warp_event 15,  6, ROUTE_7_SAFFRON_GATE, 1
	warp_event 15,  7, ROUTE_7_SAFFRON_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  5, 11, BGEVENT_READ, Route7UndergroundPathSign
	bg_event  6,  9, BGEVENT_READ, Route7LockedDoor

	def_object_events
