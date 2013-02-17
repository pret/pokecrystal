VermilionHouseFishingSpeechHouse_MapScriptHeader: ; 0x19148b
	; trigger count
	db 0

	; callback count
	db 0
; 0x19148d

UnknownScript_0x19148d: ; 0x19148d
	jumptextfaceplayer UnknownText_0x191496
; 0x191490

MapVermilionHouseFishingSpeechHouseSignpost0Script: ; 0x191490
	jumptext UnknownText_0x1915a3
; 0x191493

UnknownScript_0x191493: ; 0x191493
	jumpstd $0002
; 0x191496

UnknownText_0x191496: ; 0x191496
	db $0, "I am the FISHING", $4f
	db "DUDE, the elder of", $55
	db "the FISHING BROS.", $51
	db "Have you met the", $4f
	db "FISHING GURU at", $55
	db "LAKE OF RAGE?", $51
	db "He dreams about", $4f
	db "seeing the world's", $55
	db "greatest MAGIKARP.", $51
	db "If you don't mind,", $4f
	db "could you show him", $51
	db "any MAGIKARP you", $4f
	db "catch?", $51
	db "Who knows, you may", $4f
	db "catch the MAGIKARP", $55
	db "of his dreams.", $57
; 0x1915a3

UnknownText_0x1915a3: ; 0x1915a3
	db $0, "It's a photo of", $4f
	db "people fishing…", $51
	db "They're having a", $4f
	db "great time…", $57
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
	person_event $3b, 8, 6, $6, $0, 255, 255, $a0, 0, UnknownScript_0x19148d, $ffff
; 0x191601

