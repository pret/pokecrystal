MobileTradeRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeMobileTradeRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 0 ; callbacks

.InitializeMobileTradeRoom:
	prioritysjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_FINISHED
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	end

MobileTradeRoomConsoleScript:
	refreshscreen
	special Function1037c2
	writetext MobileTradeRoom_EstablishingCommsText
	waitbutton
	reloadmappart
	special Function101231
	closetext
	end

MobileTradeRoom_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoom_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, POKECENTER_2F, 5
	warp_event  5,  7, POKECENTER_2F, 5

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  2, BGEVENT_UP, MobileTradeRoomConsoleScript

	db 0 ; object events
