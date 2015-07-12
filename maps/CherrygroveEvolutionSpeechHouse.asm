CherrygroveEvolutionSpeechHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

YoungsterScript_0x196cb2:
	loadfont
	writetext UnknownText_0x196cc3
	closetext
	loadmovesprites
	end

LassScript_0x196cb9:
	loadfont
	writetext UnknownText_0x196cfc
	closetext
	loadmovesprites
	end

CherrygroveEvolutionSpeechHouseBookshelf:
	jumpstd magazinebookshelf

UnknownText_0x196cc3:
	text "#MON gain expe-"
	line "rience in battle"

	para "and change their"
	line "form."
	done

UnknownText_0x196cfc:
	text "#MON change?"

	para "I would be shocked"
	line "if one did that!"
	done

CherrygroveEvolutionSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, CherrygroveEvolutionSpeechHouseBookshelf
	signpost 1, 1, $0, CherrygroveEvolutionSpeechHouseBookshelf

	; people-events
	db 2
	person_event SPRITE_LASS, 9, 7, $8, $0, 255, 255, $a0, 0, LassScript_0x196cb9, EVENT_ALWAYS_THERE
	person_event SPRITE_YOUNGSTER, 9, 6, $9, $0, 255, 255, $80, 0, YoungsterScript_0x196cb2, EVENT_ALWAYS_THERE
