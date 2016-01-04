const_value set 2
	const PEWTERSNOOZESPEECHHOUSE_GRAMPS

PewterSnoozeSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GrampsScript_0x1a3059:
	jumptextfaceplayer UnknownText_0x1a305f

PewterSnoozeSpeechHouseBookshelf:
	jumpstd picturebookshelf

UnknownText_0x1a305f:
	text "I like snoozing"
	line "with the radio on…"
	cont "…Zzzz…"
	done

PewterSnoozeSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 5, PEWTER_CITY
	warp_def $7, $3, 5, PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_GRAMPS, 3, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, GrampsScript_0x1a3059, -1
