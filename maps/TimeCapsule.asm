const_value set 2
	const TIMECAPSULE_CHRIS1
	const TIMECAPSULE_CHRIS2

TimeCapsule_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, TimeCapsule_SetWhichChris

.Trigger0:
	priorityjump TimeCapsule_Initialize
	end

.Trigger1:
	end

TimeCapsule_SetWhichChris:
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear TIMECAPSULE_CHRIS2
	appear TIMECAPSULE_CHRIS1
	return

.Chris2:
	disappear TIMECAPSULE_CHRIS1
	appear TIMECAPSULE_CHRIS2
	return

TimeCapsule_Initialize:
	dotrigger $1
	domaptrigger POKECENTER_2F, $3
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
	warp_def $7, $4, 4, POKECENTER_2F
	warp_def $7, $5, 4, POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, MapTimeCapsuleSignpost1Script
	signpost 4, 5, SIGNPOST_LEFT, MapTimeCapsuleSignpost1Script

.PersonEvents:
	db 2
	person_event SPRITE_CHRIS, 4, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChrisScript_0x19351a, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_CHRIS, 4, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ChrisScript_0x19351a, EVENT_RECEIVED_BALLS_FROM_KURT
