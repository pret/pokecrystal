MoveDeletersHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

MoveDeleter:
	faceplayer
	loadfont
	special MoveDeletion
	closetext
	loadmovesprites
	end

MoveDeletersHouseBookshelf:
	jumpstd difficultbookshelf

MoveDeletersHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, MoveDeletersHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, MoveDeletersHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_SUPER_NERD, 7, 6, OW_UP | $2, $0, -1, -1, $0, 0, MoveDeleter, -1
