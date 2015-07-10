Route5_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 4
	warp_def $f, $11, 1, GROUP_ROUTE_5_UNDERGROUND_ENTRANCE, MAP_ROUTE_5_UNDERGROUND_ENTRANCE
	warp_def $11, $8, 1, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $11, $9, 2, GROUP_ROUTE_5_SAFFRON_CITY_GATE, MAP_ROUTE_5_SAFFRON_CITY_GATE
	warp_def $b, $a, 1, GROUP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE, MAP_ROUTE_5_CLEANSE_TAG_SPEECH_HOUSE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 17, 17, $0, MapRoute5Signpost0Script
	signpost 11, 10, $0, MapRoute5Signpost1Script

	; people-events
	db 1
	person_event SPRITE_POKEFAN_M, 20, 21, $6, $0, 255, 255, $80, 0, PokefanMScript_0x1adb19, $0771
