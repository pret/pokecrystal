TimeCapsule_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1934f8, $0000
	dw UnknownScript_0x1934fc, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1934fd

UnknownScript_0x1934f8:
	priorityjump UnknownScript_0x19350d
	end

UnknownScript_0x1934fc:
	end

UnknownScript_0x1934fd:
	special Function29f47
	iffalse UnknownScript_0x193508
	disappear $3
	appear $2
	return

UnknownScript_0x193508:
	disappear $2
	appear $3
	return

UnknownScript_0x19350d:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $3
	end

MapTimeCapsuleSignpost1Script:
	special Function29eaf
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

	; warps
	db 2
	warp_def $7, $4, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F
	warp_def $7, $5, 4, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 4, $3, MapTimeCapsuleSignpost1Script
	signpost 4, 5, $4, MapTimeCapsuleSignpost1Script

	; people-events
	db 2
	person_event SPRITE_CHRIS, 8, 7, $9, $0, 255, 255, $0, 0, ChrisScript_0x19351a, EVENT_000
	person_event SPRITE_CHRIS, 8, 10, $8, $0, 255, 255, $0, 0, ChrisScript_0x19351a, EVENT_001
