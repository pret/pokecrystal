CherrygroveEvolutionSpeechHouse_MapScriptHeader: ; 0x196cb0
	; trigger count
	db 0

	; callback count
	db 0
; 0x196cb2

YoungsterScript_0x196cb2: ; 0x196cb2
	loadfont
	2writetext UnknownText_0x196cc3
	closetext
	loadmovesprites
	end
; 0x196cb9

LassScript_0x196cb9: ; 0x196cb9
	loadfont
	2writetext UnknownText_0x196cfc
	closetext
	loadmovesprites
	end
; 0x196cc0

MapCherrygroveEvolutionSpeechHouseSignpost1Script: ; 0x196cc0
	jumpstd $0003
; 0x196cc3

UnknownText_0x196cc3: ; 0x196cc3
	db $0, "#MON gain expe-", $4f
	db "rience in battle", $51
	db "and change their", $4f
	db "form.", $57
; 0x196cfc

UnknownText_0x196cfc: ; 0x196cfc
	db $0, "#MON change?", $51
	db "I would be shocked", $4f
	db "if one did that!", $57
; 0x196d2e

CherrygroveEvolutionSpeechHouse_MapEventHeader: ; 0x196d2e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 5, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapCherrygroveEvolutionSpeechHouseSignpost1Script
	signpost 1, 1, $0, MapCherrygroveEvolutionSpeechHouseSignpost1Script

	; people-events
	db 2
	person_event SPRITE_LASS, 9, 7, $8, $0, 255, 255, $a0, 0, LassScript_0x196cb9, $ffff
	person_event SPRITE_YOUNGSTER, 9, 6, $9, $0, 255, 255, $80, 0, YoungsterScript_0x196cb2, $ffff
; 0x196d62

