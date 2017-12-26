const_value set 2
	const GOLDENRODNAMERATER_NAME_RATER

GoldenrodNameRater_MapScriptHeader:
.SceneScripts:
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

INCLUDE "text/unused_sweet_honey.asm"

GoldenrodNameRater_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 8, GOLDENROD_CITY
	warp_def $7, $3, 8, GOLDENROD_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 1, 0, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event 1, 1, BGEVENT_READ, GoldenrodNameRaterBookshelf
	bg_event 1, 7, BGEVENT_READ, GoldenrodNameRaterRadio

.ObjectEvents:
	db 1
	object_event SPRITE_GENTLEMAN, 4, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, GoldenrodNameRater, -1
