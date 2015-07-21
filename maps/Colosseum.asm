Colosseum_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw .Trigger1, $0000
	dw .Trigger2, $0000
	dw .Trigger3, $0000

.MapCallbacks:
	db 2

	; callbacks

	dbw 2, ColosseumScript_SetWhichChris

	dbw 5, ColosseumScript_InitializeCB

.Trigger1:
	priorityjump ColosseumScript_Initialize
	end

.Trigger2:
	end

.Trigger3:
	end

ColosseumScript_SetWhichChris:
	special Special_CableClubCheckWhichChris
	iffalse .Chris2
	disappear $3
	appear $2
	return

.Chris2:
	disappear $2
	appear $3
	return

ColosseumScript_InitializeCB:
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $2
	return

ColosseumScript_Initialize:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $2
	end

MapColosseumSignpost1Script:
	special Special_Colosseum
	newloadmap $f8
	end

ChrisScript_0x193499:
	loadfont
	writetext .FriendReadyText
	closetext
	loadmovesprites
	end

.FriendReadyText:
	text "Your friend is"
	line "ready."
	done

Colosseum_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $4, 3, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 3, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 4, SIGNPOST_RIGHT, MapColosseumSignpost1Script
	signpost 4, 5, SIGNPOST_LEFT, MapColosseumSignpost1Script

.PersonEvents:
	db 2
	person_event SPRITE_CHRIS, 8, 7, OW_LEFT | $1, $0, -1, -1, $0, 0, ChrisScript_0x193499, EVENT_GAVE_KURT_APRICORNS
	person_event SPRITE_CHRIS, 8, 10, OW_LEFT | $0, $0, -1, -1, $0, 0, ChrisScript_0x193499, EVENT_RECEIVED_BALLS_FROM_KURT
