const_value set 2
	const CERULEANTRADESPEECHHOUSE_GRANNY
	const CERULEANTRADESPEECHHOUSE_GRAMPS
	const CERULEANTRADESPEECHHOUSE_RHYDON
	const CERULEANTRADESPEECHHOUSE_ZUBAT

CeruleanTradeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrannyScript_0x188133:
	jumptextfaceplayer UnknownText_0x18814d

GrampsScript_0x188136:
	jumptextfaceplayer UnknownText_0x18818a

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

UnknownText_0x18814d:
	text "My husband lives"
	line "happily with #-"
	cont "MON he got through"
	cont "trades."
	done

UnknownText_0x18818a:
	text "Ah… I'm so happy…"
	done

UnknownText_0x18819c:
	text "KANGASKHAN: Garu"
	line "garuu."
	done

UnknownText_0x1881b5:
	text "ZUBAT: Zuba zubaa."
	done

CeruleanTradeSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, CERULEAN_CITY
	warp_def $7, $3, 3, CERULEAN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_GRANNY, 4, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrannyScript_0x188133, -1
	person_event SPRITE_GRAMPS, 2, 1, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, GrampsScript_0x188136, -1
	person_event SPRITE_RHYDON, 2, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, RhydonScript_0x188139, -1
	person_event SPRITE_ZUBAT, 6, 5, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ZubatScript_0x188143, -1
