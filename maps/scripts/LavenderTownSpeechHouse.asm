const_value set 2
	const LAVENDERTOWNSPEECHHOUSE_POKEFAN_F

LavenderTownSpeechHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

LavenderTownSpeechHousePokefanFScript:
	jumptextfaceplayer LavenderTownSpeechHousePokefanFText

LavenderTownSpeechHouseBookshelf:
	jumpstd picturebookshelf

LavenderTownSpeechHousePokefanFText:
	text "LAVENDER is a"
	line "tiny, quiet town"

	para "at the foot of the"
	line "mountains."

	para "It's gotten a bit"
	line "busier since the"

	para "RADIO TOWER was"
	line "built."
	done

LavenderTownSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, LAVENDER_TOWN
	warp_def $7, $3, 3, LAVENDER_TOWN

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, LavenderTownSpeechHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, LavenderTownSpeechHouseBookshelf

.ObjectEvents:
	db 1
	object_event SPRITE_POKEFAN_F, 3, 2, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderTownSpeechHousePokefanFScript, -1
