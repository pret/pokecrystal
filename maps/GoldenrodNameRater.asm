const_value set 2
	const GOLDENRODNAMERATER_NAME_RATER

GoldenrodNameRater_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

GoldenrodNameRater:
	faceplayer
	opentext
	special SpecialNameRater
	waitbutton
	closetext
	end

GoldenrodNameRaterBookshelf:
	jumpstd difficultbookshelf

GoldenrodNameRaterRadio:
	jumpstd radio2

INCLUDE "text/sweethoney.asm"

GoldenrodNameRater_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 8, GOLDENROD_CITY
	warp_def $7, $3, 8, GOLDENROD_CITY

.XYTriggers:
	db 0

.Signposts:
	db 3
	signpost 1, 0, SIGNPOST_READ, GoldenrodNameRaterBookshelf
	signpost 1, 1, SIGNPOST_READ, GoldenrodNameRaterBookshelf
	signpost 1, 7, SIGNPOST_READ, GoldenrodNameRaterRadio

.PersonEvents:
	db 1
	person_event SPRITE_GENTLEMAN, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GoldenrodNameRater, -1
