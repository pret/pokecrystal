MrPsychicsHouse_MapScriptHeader: ; 0x18a778
	; trigger count
	db 0

	; callback count
	db 0
; 0x18a77a

FishingGuruScript_0x18a77a: ; 0x18a77a
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue UnknownScript_0x18a78f
	writetext UnknownText_0x18a798
	keeptextopen
	verbosegiveitem TM_29, 1
	iffalse UnknownScript_0x18a793
	setevent EVENT_GOT_TM29_PSYCHIC
UnknownScript_0x18a78f: ; 0x18a78f
	writetext UnknownText_0x18a7bb
	closetext
UnknownScript_0x18a793: ; 0x18a793
	loadmovesprites
	end
; 0x18a795

MapMrPsychicsHouseSignpost1Script: ; 0x18a795
	jumpstd $0001
; 0x18a798

UnknownText_0x18a798: ; 0x18a798
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done
; 0x18a7bb

UnknownText_0x18a7bb: ; 0x18a7bb
	text "TM29 is PSYCHIC."

	para "It may lower the"
	line "target's SPCL.DEF."
	done
; 0x18a7f0

MrPsychicsHouse_MapEventHeader: ; 0x18a7f0
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $3, 5, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapMrPsychicsHouseSignpost1Script
	signpost 1, 1, $0, MapMrPsychicsHouseSignpost1Script

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 7, 9, $8, $0, 255, 255, $a0, 0, FishingGuruScript_0x18a77a, $ffff
; 0x18a817
