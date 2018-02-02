	const_def 2 ; object constants
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_LASS
	const CHERRYGROVEEVOLUTIONSPEECHHOUSE_YOUNGSTER

CherrygroveEvolutionSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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

CherrygroveEvolutionSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, CHERRYGROVE_CITY, 5
	warp_event 3, 7, CHERRYGROVE_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event 0, 1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, CherrygroveEvolutionSpeechHouseBookshelf

	db 2 ; object events
	object_event 3, 5, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LassScript_0x196cb9, -1
	object_event 2, 5, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, YoungsterScript_0x196cb2, -1
