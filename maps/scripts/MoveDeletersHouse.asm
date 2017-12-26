const_value set 2
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

MoveDeleter:
	faceplayer
	opentext
	special MoveDeletion
	waitbutton
	closetext
	end

MoveDeletersHouseBookshelf:
	jumpstd difficultbookshelf

MoveDeletersHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, BLACKTHORN_CITY
	warp_def $7, $3, 6, BLACKTHORN_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, MoveDeletersHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, MoveDeletersHouseBookshelf

.ObjectEvents:
	db 1
	object_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoveDeleter, -1
