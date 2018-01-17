MobileTradeRoomMobile_MapScripts:
.SceneScripts:
	db 2
	scene_script .InitializeMobileTradeRoomMobile
	scene_script .DummyScene

.MapCallbacks:
	db 0

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
	special Special_Function1037c2
	writetext MobileTradeRoomMobile_EstablishingCommsText
	waitbutton
	reloadmappart
	special Special_Function101231
	closetext
	end

MobileTradeRoomMobile_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoomMobile_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 7, 5, POKECENTER_2F
	warp_def 5, 7, 5, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 4, 2, BGEVENT_UP, MapMobileTradeRoomMobileSignpost0Script

.ObjectEvents:
	db 0
