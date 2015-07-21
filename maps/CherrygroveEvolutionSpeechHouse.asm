CherrygroveEvolutionSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CherrygroveEvolutionSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CherrygroveEvolutionSpeechHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_LASS, 9, 7, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x196cb9, -1
	person_event SPRITE_YOUNGSTER, 9, 6, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x196cb2, -1
