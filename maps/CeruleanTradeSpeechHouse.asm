CeruleanTradeSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GrannyScript_0x188133:
	jumptextfaceplayer UnknownText_0x18814d

GrampsScript_0x188136:
	jumptextfaceplayer UnknownText_0x18818a

RhydonScript_0x188139:
	loadfont
	writetext UnknownText_0x18819c
	cry KANGASKHAN
	closetext
	loadmovesprites
	end

ZubatScript_0x188143:
	loadfont
	writetext UnknownText_0x1881b5
	cry ZUBAT
	closetext
	loadmovesprites
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

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 3, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_GRANNY, 8, 6, $9, $0, 255, 255, $90, 0, GrannyScript_0x188133, $ffff
	person_event SPRITE_GRAMPS, 6, 5, $2, $0, 255, 255, $a0, 0, GrampsScript_0x188136, $ffff
	person_event SPRITE_RHYDON, 6, 9, $16, $0, 255, 255, $b0, 0, RhydonScript_0x188139, $ffff
	person_event SPRITE_ZUBAT, 10, 9, $16, $0, 255, 255, $0, 0, ZubatScript_0x188143, $ffff
