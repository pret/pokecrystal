	const_def 2 ; object constants
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanTradeSpeechHouseGrannyScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrannyText

CeruleanTradeSpeechHouseGrampsScript:
	jumptextfaceplayer CeruleanTradeSpeechHouseGrampsText

RhydonScript_0x188139:
	opentext
	writetext UnknownText_0x18819c
	cry KANGASKHAN
	waitbutton
	closetext
	end

ZubatScript_0x188143:
	opentext
	writetext UnknownText_0x1881b5
	cry ZUBAT
	waitbutton
	closetext
	end

CeruleanTradeSpeechHouseGrannyText:
	text "My husband lives"
	line "happily with #-"
	cont "MON he got through"
	cont "trades."
	done

CeruleanTradeSpeechHouseGrampsText:
	text "Ah… I'm so happy…"
	done

UnknownText_0x18819c:
	text "KANGASKHAN: Garu"
	line "garuu."
	done

UnknownText_0x1881b5:
	text "ZUBAT: Zuba zubaa."
	done

CeruleanTradeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 3
	warp_event  3,  7, CERULEAN_CITY, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  2,  4, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrannyScript, -1
	object_event  1,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, CeruleanTradeSpeechHouseGrampsScript, -1
	object_event  5,  2, SPRITE_RHYDON, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, RhydonScript_0x188139, -1
	object_event  5,  6, SPRITE_ZUBAT, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ZubatScript_0x188143, -1
