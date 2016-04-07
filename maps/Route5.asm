const_value set 2
	const ROUTE5_POKEFAN_M

Route5_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

PokefanMScript_0x1adb19:
	jumptextfaceplayer UnknownText_0x1adb22

Route5UndergroundPathSign:
	jumptext Route5UndergroundPathSignText

HouseForSaleSign:
	jumptext HouseForSaleSignText

UnknownText_0x1adb22:
	text "The road is closed"
	line "until the problem"

	para "at the POWER PLANT"
	line "is solved."
	done

Route5UndergroundPathSignText:
	text "UNDERGROUND PATH"

	para "CERULEAN CITY -"
	line "VERMILION CITY"
	done

HouseForSaleSignText:
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
	signpost 17, 17, SIGNPOST_READ, Route5UndergroundPathSign
	signpost 11, 10, SIGNPOST_READ, HouseForSaleSign

.PersonEvents:
	db 1
	person_event SPRITE_POKEFAN_M, 16, 17, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1adb19, EVENT_ROUTE_5_6_POKEFAN_M_BLOCKS_UNDERGROUND_PATH
