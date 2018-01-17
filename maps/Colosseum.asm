const_value set 2
	const COLOSSEUM_CHRIS1
	const COLOSSEUM_CHRIS2

Colosseum_MapScripts:
.SceneScripts:
	db 3
	scene_script .InitializeColosseum
	scene_script .DummyScene1
	scene_script .DummyScene2

.MapCallbacks:
	db 2
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
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear COLOSSEUM_CHRIS2
	appear COLOSSEUM_CHRIS1
	return

.Chris2:
	disappear COLOSSEUM_CHRIS1
	appear COLOSSEUM_CHRIS2
	return

.PreparePokecenter2F:
	setmapscene POKECENTER_2F, 2
	return

.InitializeAndPreparePokecenter2F:
	setscene 1
	setmapscene POKECENTER_2F, 2
	end

MapColosseumSignpost1Script:
	special Special_Colosseum
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
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 7, 3, POKECENTER_2F
	warp_def 5, 7, 3, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 4, 4, BGEVENT_RIGHT, MapColosseumSignpost1Script
	bg_event 5, 4, BGEVENT_LEFT, MapColosseumSignpost1Script

.ObjectEvents:
	db 2
	object_event 3, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_GAVE_KURT_APRICORNS
	object_event 6, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x193499, EVENT_RECEIVED_BALLS_FROM_KURT
