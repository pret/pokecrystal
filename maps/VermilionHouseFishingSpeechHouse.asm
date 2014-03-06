VermilionHouseFishingSpeechHouse_MapScriptHeader: ; 0x19148b
	; trigger count
	db 0

	; callback count
	db 0
; 0x19148d

FishingGuruScript_0x19148d: ; 0x19148d
	jumptextfaceplayer UnknownText_0x191496
; 0x191490

MapVermilionHouseFishingSpeechHouseSignpost0Script: ; 0x191490
	jumptext UnknownText_0x1915a3
; 0x191493

UnknownScript_0x191493: ; 0x191493
	jumpstd $0002
; 0x191496

UnknownText_0x191496: ; 0x191496
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
; 0x1915a3

UnknownText_0x1915a3: ; 0x1915a3
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done
; 0x1915df

VermilionHouseFishingSpeechHouse_MapEventHeader: ; 0x1915df
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 1, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 0, 3, $0, MapVermilionHouseFishingSpeechHouseSignpost0Script

	; people-events
	db 1
	person_event SPRITE_FISHING_GURU, 8, 6, $6, $0, 255, 255, $a0, 0, FishingGuruScript_0x19148d, $ffff
; 0x191601

