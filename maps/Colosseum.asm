	const_def 2 ; object constants
	const COLOSSEUM_CHRIS1
	const COLOSSEUM_CHRIS2

Colosseum_MapScripts:
	db 3 ; scene scripts
	scene_script .InitializeColosseum ; SCENE_COLOSSEUM_0
	scene_script .DummyScene1 ; SCENE_COLOSSEUM_1
	scene_script .DummyScene2 ; SCENE_COLOSSEUM_2

	db 2 ; callbacks
	callback MAPCALLBACK_OBJECTS, .SetWhichChris
	callback MAPCALLBACK_NEWMAP, .PreparePokecenter2F

.InitializeColosseum:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene1:
	end

.DummyScene2:
	end

.SetWhichChris:
	special CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_CHRIS2
	appear COLOSSEUM_CHRIS1
	return

.Chris2:
	disappear COLOSSEUM_CHRIS1
	appear COLOSSEUM_CHRIS2
	return

.PreparePokecenter2F:
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_2
	return

.InitializeAndPreparePokecenter2F:
	setscene SCENE_COLOSSEUM_1
	setmapscene POKECENTER_2F, SCENE_POKECENTER2F_2
	end

MapColosseumSignpost1Script:
	special Colosseum
	newloadmap MAPSETUP_LINKRETURN
	end

ChrisScript_0x193499:
	opentext
	writetext .FriendReadyText
	waitbutton
	closetext
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

Colosseum_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 4, 7, 3, POKECENTER_2F
	warp_event 5, 7, 3, POKECENTER_2F

	db 0 ; coord events

	db 2 ; bg events
	bg_event 4, 4, BGEVENT_RIGHT, MapColosseumSignpost1Script
	bg_event 5, 4, BGEVENT_LEFT, MapColosseumSignpost1Script

	db 2 ; object events
	object_event 3, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event 6, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
