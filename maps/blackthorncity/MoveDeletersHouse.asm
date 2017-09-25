const_value set 2
	const MOVEDELETERSHOUSE_SUPER_NERD

MoveDeletersHouse_MapScriptHeader:
.MapTriggers:
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

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, MoveDeletersHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, MoveDeletersHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_SUPER_NERD, 3, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MoveDeleter, -1
