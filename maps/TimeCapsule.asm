const_value set 2
	const TIMECAPSULE_CHRIS1
	const TIMECAPSULE_CHRIS2

TimeCapsule_MapScriptHeader:
.SceneScripts:
	db 2
	scene_script .InitializeTimeCapsule
	scene_script .DummyScene

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_OBJECTS, .SetWhichChris

.InitializeTimeCapsule:
	priorityjump .InitializeAndPreparePokecenter2F
	end

.DummyScene:
	end

.SetWhichChris:
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear TIMECAPSULE_CHRIS2
	appear TIMECAPSULE_CHRIS1
	return

.Chris2:
	disappear TIMECAPSULE_CHRIS1
	appear TIMECAPSULE_CHRIS2
	return

.InitializeAndPreparePokecenter2F:
	setscene 1
	setmapscene POKECENTER_2F, 3
	end

MapTimeCapsuleSignpost1Script:
	special Special_TimeCapsule
	newloadmap MAPSETUP_LINKRETURN
	end

ChrisScript_0x19351a:
	opentext
	writetext UnknownText_0x193521
	waitbutton
	closetext
	end

UnknownText_0x193521:
	text "Your friend is"
	line "ready."
	done

TimeCapsule_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 4, 7, 4, POKECENTER_2F
	warp_def 5, 7, 4, POKECENTER_2F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 4, 4, BGEVENT_RIGHT, MapTimeCapsuleSignpost1Script
	bg_event 5, 4, BGEVENT_LEFT, MapTimeCapsuleSignpost1Script

.ObjectEvents:
	db 2
	object_event 3, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x19351a, EVENT_GAVE_KURT_APRICORNS
	object_event 6, 4, SPRITE_CHRIS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ChrisScript_0x19351a, EVENT_RECEIVED_BALLS_FROM_KURT
