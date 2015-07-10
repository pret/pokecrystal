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
	signpost 1, 0, $0, EmysHouseBookshelf
	signpost 1, 1, $0, EmysHouseBookshelf

	; people-events
	db 1
	person_event SPRITE_LASS, 7, 6, $3, $0, 255, 255, $a0, 0, Emy, $ffff
