TradeCenter_MapScriptHeader: ; 0x1933dc
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x1933e9, $0000
	dw UnknownScript_0x1933ed, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x1933ee
; 0x1933e9

UnknownScript_0x1933e9: ; 0x1933e9
	priorityjump UnknownScript_0x1933fe
	end
; 0x1933ed

UnknownScript_0x1933ed: ; 0x1933ed
	end
; 0x1933ee

UnknownScript_0x1933ee: ; 0x1933ee
	special Function29f47
	iffalse UnknownScript_0x1933f9
	disappear $3
	appear $2
	return
; 0x1933f9

UnknownScript_0x1933f9: ; 0x1933f9
	disappear $2
	appear $3
	return
; 0x1933fe

UnknownScript_0x1933fe: ; 0x1933fe
	dotrigger $1
	domaptrigger GROUP_POKECENTER_2F, MAP_POKECENTER_2F, $1
	end
; 0x193405

MapTradeCenterSignpost1Script: ; 0x193405
	special Function29ec4
	newloadmap $f8
	end
; 0x19340b

UnknownScript_0x19340b: ; 0x19340b
	loadfont
	writetext UnknownText_0x193412
	closetext
	loadmovesprites
	end
; 0x193412

UnknownText_0x193412: ; 0x193412
	text "Your friend is"
	line "ready."
	done
; 0x193429

TradeCenter_MapEventHeader: ; 0x193429
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
	person_event SPRITE_CHRIS, 8, 7, $9, $0, 255, 255, $0, 0, ChrisScript_0x193499, $0000
	person_event SPRITE_CHRIS, 8, 10, $8, $0, 255, 255, $0, 0, ChrisScript_0x193499, $0001
; 0x19345d
