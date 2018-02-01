MobileTradeRoom_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeMobileTradeRoom ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_MOBILETRADEROOM_NOTHING

	db 0 ; callbacks

.InitializeMobileTradeRoom:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_MOBILETRADEROOM_NOTHING
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_LEAVE_MOBILE_TRADE_ROOM
	end

MapMobileTradeRoomSignpost0Script:
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
	warp_event 4, 7, 5, POKECENTER_2F
	warp_event 5, 7, 5, POKECENTER_2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 2, BGEVENT_UP, MapMobileTradeRoomSignpost0Script

	db 0 ; object events
