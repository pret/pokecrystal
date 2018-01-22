const_value set 2
	const PEWTERSNOOZESPEECHHOUSE_GRAMPS

PewterSnoozeSpeechHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

PewterSnoozeSpeechHouseGrampsScript:
	jumptextfaceplayer PewterSnoozeSpeechHouseGrampsText

PewterSnoozeSpeechHouseBookshelf:
	jumpstd picturebookshelf

PewterSnoozeSpeechHouseGrampsText:
	text "I like snoozing"
	line "with the radio on…"
	cont "…Zzzz…"
	done

PewterSnoozeSpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 5, PEWTER_CITY
	warp_def 3, 7, 5, PEWTER_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, PewterSnoozeSpeechHouseBookshelf

.ObjectEvents:
	db 1
	object_event 5, 3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PewterSnoozeSpeechHouseGrampsScript, -1
