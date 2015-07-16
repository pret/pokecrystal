TradeCenter_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, TradeCenter_SetWhichChris

.Trigger1:
	priorityjump TradeCenter_Initialize
	end

.Trigger2:
	end

TradeCenter_SetWhichChris:
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear $3
	appear $2
	return

.Chris2:
	disappear $2
	appear $3
	return

TradeCenter_Initialize:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $1
	end

MapTradeCenterSignpost1Script:
	special Special_TradeCenter
	newloadmap $f8
	end

ChrisScript_0x19340b:
	loadfont
	writetext .FriendReadyText
	closetext
	loadmovesprites
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

TradeCenter_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $4, 2, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 2, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, MapTradeCenterSignpost1Script
	signpost 4, 5, SIGNPOST_LEFT, MapTradeCenterSignpost1Script

	; people-events
	db 2
	person_event SPRITE_CHRIS, 8, 7, LEFT << 2 | $1, $0, -1, -1, $0, 0, ChrisScript_0x193499, EVENT_CHRIS1_IN_CABLE_CLUB
	person_event SPRITE_CHRIS, 8, 10, LEFT << 2 | $0, $0, -1, -1, $0, 0, ChrisScript_0x193499, EVENT_CHRIS2_IN_CABLE_CLUB
