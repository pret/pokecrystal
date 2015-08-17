Route5_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x1adb19:
	jumptextfaceplayer UnknownText_0x1adb22

MapRoute5Signpost0Script:
	jumptext UnknownText_0x1adb66

MapRoute5Signpost1Script:
	jumptext UnknownText_0x1adb97

UnknownText_0x1adb22:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

UnknownText_0x1adb66:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

UnknownText_0x1adb97:
	text "What's this?"

	para "House for Sale…"
	line "Nobody lives here."
	done

Route5_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $f, $11, 1, ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $11, $8, 1, ROUTE_5_SAFFRON_CITY_GATE
	warp_def $11, $9, 2, ROUTE_5_SAFFRON_CITY_GATE
	warp_def $b, $a, 1, ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 17, 17, SIGNPOST_READ, MapRoute5Signpost0Script
	signpost 11, 10, SIGNPOST_READ, MapRoute5Signpost1Script

.PersonEvents:
	db 1
	person_event SPRITE_POKEFAN_M, 20, 21, $6, 0, 0, -1, -1, 8 + PAL_OW_RED, 0, 0, PokefanMScript_0x1adb19, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
