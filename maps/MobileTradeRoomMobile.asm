MobileTradeRoomMobile_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeMobileTradeRoomMobile
	scene_script .DummyScene

	db 0 ; callbacks

.InitializeMobileTradeRoomMobile:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene 1
	setmapscene POKECENTER_2F, 4
	end

MapMobileTradeRoomMobileSignpost0Script:
	refreshscreen
	special Function1037c2
	writetext MobileTradeRoomMobile_EstablishingCommsText
	waitbutton
	reloadmappart
	special Function101231
	closetext
	end

MobileTradeRoomMobile_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoomMobile_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, 5, POKECENTER_2F
	warp_event 5, 7, 5, POKECENTER_2F

	db 0 ; coord events

	db 1 ; bg events
	bg_event 4, 2, BGEVENT_UP, MapMobileTradeRoomMobileSignpost0Script

	db 0 ; object events
