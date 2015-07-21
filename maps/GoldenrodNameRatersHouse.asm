GoldenrodNameRatersHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $3, 8, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, GoldenrodNameRatersHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, GoldenrodNameRatersHouseBookshelf
	signpost 1, 7, SIGNPOST_READ, GoldenrodNameRatersHouseRadio

.PersonEvents:
	db 1
	person_event SPRITE_GENTLEMAN, 8, 6, OW_UP | $2, $2, -1, -1, $0, 0, GentlemanScript_0x5577c, -1
