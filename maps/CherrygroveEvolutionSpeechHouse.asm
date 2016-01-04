const_value set 2
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_LASS
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_YOUNGSTER

CherrygroveEvolutionSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

YoungsterScript_0x196cb2:
	opentext
	writetext UnknownText_0x196cc3
	waitbutton
	closetext
	end

LassScript_0x196cb9:
	opentext
	writetext UnknownText_0x196cfc
	waitbutton
	closetext
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
	warp_def $7, $2, 5, CHERRYGROVE_CITY
	warp_def $7, $3, 5, CHERRYGROVE_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, CherrygroveEvolutionSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, CherrygroveEvolutionSpeechHouseBookshelf

.PersonEvents:
	db 2
	person_event SPRITE_LASS, 5, 3, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x196cb9, -1
	person_event SPRITE_YOUNGSTER, 5, 2, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x196cb2, -1
