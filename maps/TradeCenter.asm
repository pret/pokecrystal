TradeCenter_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1933e9, $0000
	dw UnknownScript_0x1933ed, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1933ee

UnknownScript_0x1933e9:
	priorityjump UnknownScript_0x1933fe
	end

UnknownScript_0x1933ed:
	end

UnknownScript_0x1933ee:
	special Function29f47
	iffalse UnknownScript_0x1933f9
	disappear $3
	appear $2
	return

UnknownScript_0x1933f9:
	disappear $2
	appear $3
	return

UnknownScript_0x1933fe:
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $1
	end

MapTradeCenterSignpost1Script:
	special Function29ec4
	newloadmap $f8
	end

UnknownScript_0x19340b:
	loadfont
	writetext UnknownText_0x193412
	closetext
	loadmovesprites
	end

UnknownText_0x193412:
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
	signpost 4, 4, $3, MapTradeCenterSignpost1Script
	signpost 4, 5, $4, MapTradeCenterSignpost1Script

	; people-events
	db 2
	person_event SPRITE_CHRIS, 8, 7, $9, $0, 255, 255, $0, 0, ChrisScript_0x193499, EVENT_000
	person_event SPRITE_CHRIS, 8, 10, $8, $0, 255, 255, $0, 0, ChrisScript_0x193499, EVENT_001
