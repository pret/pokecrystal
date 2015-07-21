BlackthornDodrioTradeHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
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

.Warps:
	db 2
	warp_def $7, $2, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 3, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, EmysHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, EmysHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_LASS, 7, 6, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, Emy, -1
