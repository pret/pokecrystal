GoldenrodNameRatersHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

GentlemanScript_0x5577c:
	faceplayer
	loadfont
	special SpecialNameRater
	closetext
	loadmovesprites
	end

GoldenrodNameRatersHouseBookshelf:
	jumpstd difficultbookshelf

GoldenrodNameRatersHouseRadio:
	jumpstd radio2

INCLUDE "text/sweethoney.asm"

GoldenrodNameRatersHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

	; xy triggers
	db 0

	; signposts
	db 3
	signpost 1, 0, $0, GoldenrodNameRatersHouseBookshelf
	signpost 1, 1, $0, GoldenrodNameRatersHouseBookshelf
	signpost 1, 7, $0, GoldenrodNameRatersHouseRadio

	; people-events
	db 1
	person_event SPRITE_GENTLEMAN, 8, 6, $6, $2, 255, 255, $0, 0, GentlemanScript_0x5577c, EVENT_ALWAYS_THERE
