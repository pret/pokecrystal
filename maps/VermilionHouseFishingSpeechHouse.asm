const_value set 2
	const VERMILIONHOUSEFISHINGSPEECHHOUSE_FISHING_GURU

VermilionHouseFishingSpeechHouse_MapScripts:
.SceneScripts:
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

VermilionHouseFishingSpeechHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 1, VERMILION_CITY
	warp_def 3, 7, 1, VERMILION_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 3, 0, BGEVENT_READ, FishingDudesHousePhoto

.ObjectEvents:
	db 1
	object_event 2, 4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
