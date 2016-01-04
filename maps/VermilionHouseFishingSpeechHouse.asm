const_value set 2
	const VERMILIONHOUSEFISHINGSPEECHHOUSE_FISHING_GURU

VermilionHouseFishingSpeechHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

FishingDude:
	jumptextfaceplayer FishingDudeText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "I am the FISHING"
	line "DUDE, the elder of"
	cont "the FISHING BROS."

	para "Have you met the"
	line "FISHING GURU at"
	cont "LAKE OF RAGE?"

	para "He dreams about"
	line "seeing the world's"
	cont "greatest MAGIKARP."

	para "If you don't mind,"
	line "could you show him"

	para "any MAGIKARP you"
	line "catch?"

	para "Who knows, you may"
	line "catch the MAGIKARP"
	cont "of his dreams."
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done

VermilionHouseFishingSpeechHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 1, VERMILION_CITY
	warp_def $7, $3, 1, VERMILION_CITY

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 0, 3, SIGNPOST_READ, FishingDudesHousePhoto

.PersonEvents:
	db 1
	person_event SPRITE_FISHING_GURU, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, FishingDude, -1
