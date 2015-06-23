GuideGentsHouse_MapScriptHeader: ; 0x196c05
	; trigger count
	db 0

	; callback count
	db 0
; 0x196c07

GrampsScript_0x196c07: ; 0x196c07
	jumptextfaceplayer UnknownText_0x196c0d
; 0x196c0a

MapGuideGentsHouseSignpost1Script: ; 0x196c0a
	jumpstd magazinebookshelf
; 0x196c0d

UnknownText_0x196c0d: ; 0x196c0d
	text "When I was a wee"
	line "lad, I was a hot-"
	cont "shot trainer!"

	para "Here's a word of"
	line "advice: Catch lots"
	cont "of #MON!"

	para "Treat them all"
	line "with kindness!"
	done
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
	person_event SPRITE_GRAMPS, 7, 6, $9, $0, 255, 255, $0, 0, GrampsScript_0x196c07, $06ff
; 0x196cb0
