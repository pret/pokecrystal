MobileTradeRoomMobile_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x193576, $0000
	dw UnknownScript_0x19357a, $0000

	; callback count
	db 0

UnknownScript_0x193576:
	priorityjump UnknownScript_0x19357b
	end

UnknownScript_0x19357a:
	end

UnknownScript_0x19357b:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $4
	end

MapMobileTradeRoomMobileSignpost0Script:
	refreshscreen $0
	special Function1037c2
	writetext UnknownText_0x193591
	closetext
	reloadmappart
	special Function101231
	loadmovesprites
	end

UnknownText_0x193591:
	text "Establishing"
	line "communications…"
	done

MobileTradeRoomMobile_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 5, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 5, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 2, 4, $1, MapMobileTradeRoomMobileSignpost0Script

	; people-events
	db 0
