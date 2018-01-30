const_value set 2
	const TRADECENTER_CHRIS1
	const TRADECENTER_CHRIS2

TradeCenter_MapScripts:
	db 2 ; scene scripts
	scene_script .InitializeTradeCenter
	scene_script .DummyScene

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichChris

.InitializeTradeCenter:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.SetWhichChris:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear TRADECENTER_CHRIS2
	appear TRADECENTER_CHRIS1
	return

.Chris2:
	disappear TRADECENTER_CHRIS1
	appear TRADECENTER_CHRIS2
	return

.InitializeAndPreparePokecenter2F:
	setscene 1
	setmapscene POKECENTER_2F, 1
	end

MapTradeCenterSignpost1Script:
	special TradeCenter
	newloadmap MAPSETUP_LINKRETURN
	end

ChrisScript_0x19340b:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

TradeCenter_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, 2, POKECENTER_2F
	warp_event 5, 7, 2, POKECENTER_2F

	db 0 ; coord events

	db 2 ; bg events
	bg_event 4, 4, BGEVENT_RIGHT, MapTradeCenterSignpost1Script
	bg_event 5, 4, BGEVENT_LEFT, MapTradeCenterSignpost1Script

	db 2 ; object events
	object_event 3, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event 6, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
