CherrygroveGymSpeechHouse_MapScriptHeader: ; 0x196adf
	; trigger count
	db 0

	; callback count
	db 0
; 0x196ae1

PokefanMScript_0x196ae1: ; 0x196ae1
	jumptextfaceplayer UnknownText_0x196aea
; 0x196ae4

BugCatcherScript_0x196ae4: ; 0x196ae4
	jumptextfaceplayer UnknownText_0x196b65
; 0x196ae7

MapCherrygroveGymSpeechHouseSignpost1Script: ; 0x196ae7
	jumpstd $0002
; 0x196aea

UnknownText_0x196aea: ; 0x196aea
	text "You're trying to"
	line "see how good you"

	para "are as a #MON"
	line "trainer?"

	para "You better visit"
	line "the #MON GYMS"

	para "all over JOHTO and"
	line "collect BADGES."
	done
; 0x196b65

UnknownText_0x196b65: ; 0x196b65
	text "When I get older,"
	line "I'm going to be a"
	cont "GYM LEADER!"

	para "I make my #MON"
	line "battle with my"

	para "friend's to make"
	line "them tougher!"
	done
; 0x196bd1

CherrygroveGymSpeechHouse_MapEventHeader: ; 0x196bd1
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 3, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapCherrygroveGymSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapCherrygroveGymSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_POKEFAN_M, 7, 6, $6, $0, 255, 255, $0, 0, PokefanMScript_0x196ae1, $ffff
	person_event SPRITE_BUG_CATCHER, 9, 9, $5, $1, 255, 255, $80, 0, BugCatcherScript_0x196ae4, $ffff
; 0x196c05

