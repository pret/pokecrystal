const_value set 2
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

Emy:
	faceplayer
	opentext
	trade $3
	waitbutton
	closetext
	end

EmysHouseBookshelf:
	jumpstd magazinebookshelf

BlackthornEmysHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, BLACKTHORN_CITY
	warp_def $7, $3, 3, BLACKTHORN_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 0, SIGNPOST_READ, EmysHouseBookshelf
	signpost 1, 1, SIGNPOST_READ, EmysHouseBookshelf

.PersonEvents:
	db 1
	person_event SPRITE_LASS, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, Emy, -1
