BlackthornDragonSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GrannyScript_0x195949:
	jumptextfaceplayer UnknownText_0x19595c

EkansScript_0x19594c:
	loadfont
	writetext UnknownText_0x1959ee
	cry DRATINI
	closetext
	loadmovesprites
	end

UnknownScript_0x195956:
	jumpstd picturebookshelf

UnknownScript_0x195959:
	jumpstd magazinebookshelf

UnknownText_0x19595c:
	text "A clan of trainers"
	line "who can freely"

	para "command dragons"
	line "live right here in"
	cont "BLACKTHORN."

	para "As a result, there"
	line "are many legends"

	para "about dragons in"
	line "this town."
	done

UnknownText_0x1959ee:
	text "DRATINI: Draa!"
	done

BlackthornDragonSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 2, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 2, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_GRANNY, 7, 6, $3, $0, 255, 255, $0, 0, GrannyScript_0x195949, -1
	person_event SPRITE_EKANS, 9, 9, $16, $0, 255, 255, $90, 0, EkansScript_0x19594c, -1
