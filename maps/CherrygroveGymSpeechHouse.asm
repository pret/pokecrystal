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
	db $0, "You're trying to", $4f
	db "see how good you", $51
	db "are as a #MON", $4f
	db "trainer?", $51
	db "You better visit", $4f
	db "the #MON GYMS", $51
	db "all over JOHTO and", $4f
	db "collect BADGES.", $57
; 0x196b65

UnknownText_0x196b65: ; 0x196b65
	db $0, "When I get older,", $4f
	db "I'm going to be a", $55
	db "GYM LEADER!", $51
	db "I make my #MON", $4f
	db "battle with my", $51
	db "friend's to make", $4f
	db "them tougher!", $57
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

