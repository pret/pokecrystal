MobileTradeRoomMobile_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeMobileTradeRoomMobile ; SCENE_MOBILETRADEROOMMOBILE_0
	scene_script .DummyScene ; SCENE_MOBILETRADEROOMMOBILE_1

	db 0 ; callbacks

.InitializeMobileTradeRoomMobile:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.InitializeAndPreparePokecenter2F:
	setscene SCENE_MOBILETRADEROOMMOBILE_1
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_4
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
