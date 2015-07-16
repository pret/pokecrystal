BlackthornDodrioTradeHouse_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

Emy:
	faceplayer
	loadfont
	trade $3
	closetext
	loadmovesprites
	end

EmysHouseBookshelf:
	jumpstd magazinebookshelf

BlackthornDodrioTradeHouse_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 1, 0, SIGNPOST_READ, EmysHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, EmysHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_LASS, 7, 6, DOWN << 2 | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, Emy, -1
