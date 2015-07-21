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
	warp_def $7, $2, 5, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 5, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, PewterSnoozeSpeechHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_GRAMPS, 7, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, GrampsScript_0x1a3059, -1
