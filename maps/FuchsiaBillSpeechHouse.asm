const_value set 2
	const FUCHSIABILLSPEECHHOUSE_POKEFAN_F
	const FUCHSIABILLSPEECHHOUSE_YOUNGSTER

FuchsiaBillSpeechHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

FuchsiaBillSpeechHousePokefanFScript:
	jumptextfaceplayer FuchsiaBillSpeechHousePokefanFText

FuchsiaBillSpeechHouseYoungsterScript:
	jumptextfaceplayer FuchsiaBillSpeechHouseYoungsterText

FuchsiaBillSpeechHousePokefanFText:
	text "My grandpa is at "
	line "my brother BILL's"
	cont "on CERULEAN CAPE."
	done

FuchsiaBillSpeechHouseYoungsterText:
	text "I saw these weird,"
	line "slow #MON on"
	cont "CYCLING ROAD."
	done

FuchsiaBillSpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 4, FUCHSIA_CITY
	warp_def 3, 7, 4, FUCHSIA_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 2
	object_event 2, 3, SPRITE_POKEFAN_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaBillSpeechHousePokefanFScript, -1
	object_event 6, 4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaBillSpeechHouseYoungsterScript, -1
