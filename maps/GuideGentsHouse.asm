GuideGentsHouse_MapScriptHeader: ; 0x196c05
	; trigger count
	db 0

	; callback count
	db 0
; 0x196c07

UnknownScript_0x196c07: ; 0x196c07
	jumptextfaceplayer UnknownText_0x196c0d
; 0x196c0a

MapGuideGentsHouseSignpost1Script: ; 0x196c0a
	jumpstd $0003
; 0x196c0d

UnknownText_0x196c0d: ; 0x196c0d
	db $0, "When I was a wee", $4f
	db "lad, I was a hot-", $55
	db "shot trainer!", $51
	db "Here's a word of", $4f
	db "advice: Catch lots", $55
	db "of #MON!", $51
	db "Treat them all", $4f
	db "with kindness!", $57
; 0x196c89

GuideGentsHouse_MapEventHeader: ; 0x196c89
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $3, 4, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MapGuideGentsHouseSignpost1Script
	signpost 1, 1, $0, MapGuideGentsHouseSignpost1Script

	; people-events
	db 1
	person_event $2f, 7, 6, $9, $0, 255, 255, $0, 0, UnknownScript_0x196c07, $06ff
; 0x196cb0

