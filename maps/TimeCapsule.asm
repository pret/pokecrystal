TimeCapsule_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, TimeCapsule_SetWhichChris

.Trigger1:
	priorityjump TimeCapsule_Initialize
	end

.Trigger2:
	end

TimeCapsule_SetWhichChris:
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear $3
	appear $2
	return

.Chris2:
	disappear $2
	appear $3
	return

TimeCapsule_Initialize:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $3
	end

MapTimeCapsuleSignpost1Script:
	special Special_TimeCapsule
	newloadmap $f8
	end

ChrisScript_0x19351a:
	loadfont
	writetext UnknownText_0x193521
	closetext
	loadmovesprites
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
	warp_def $7, $4, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, MapTimeCapsuleSignpost1Script
	signpost 4, 5, SIGNPOST_LEFT, MapTimeCapsuleSignpost1Script

.PersonEvents:
	db 2
	person_event SPRITE_CHRIS, 8, 7, OW_LEFT | $1, $0, -1, -1, $0, 0, ChrisScript_0x19351a, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_CHRIS, 8, 10, OW_LEFT | $0, $0, -1, -1, $0, 0, ChrisScript_0x19351a, EVENT_RECEIVED_BALLS_FROM_KURT
