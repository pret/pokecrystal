MobileTradeRoomMobile_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 0

.Trigger1:
	priorityjump MobileTradeRoomMobile_Initialize
	end

.Trigger2:
	end

MobileTradeRoomMobile_Initialize:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $4
	end

MapMobileTradeRoomMobileSignpost0Script:
	refreshscreen $0
	special Function1037c2
	writetext MobileTradeRoomMobile_EstablishingCommsText
	closetext
	reloadmappart
	special Function101231
	loadmovesprites
	end

MobileTradeRoomMobile_EstablishingCommsText:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoomMobile_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $4, 5, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 5, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 2, 4, SIGNPOST_UP, MapMobileTradeRoomMobileSignpost0Script

.PersonEvents:
	db 0
