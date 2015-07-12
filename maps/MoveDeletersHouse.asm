MoveDeletersHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 6, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, $0, MoveDeletersHouseBookshelf
	signpost 1, 1, $0, MoveDeletersHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_SUPER_NERD, 7, 6, $6, $0, 255, 255, $0, 0, MoveDeleter, EVENT_ALWAYS_THERE
