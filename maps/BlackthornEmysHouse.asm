const_value set 2
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Emy:
	faceplayer
	opentext
	trade NPCTRADE_EMY
	waitbutton
	closetext
	end

EmysHouseBookshelf:
	jumpstd magazinebookshelf

BlackthornEmysHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 2, 7, 3, BLACKTHORN_CITY
	warp_def 3, 7, 3, BLACKTHORN_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 0, 1, BGEVENT_READ, EmysHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, EmysHouseBookshelf

.ObjectEvents:
	db 1
	object_event 2, 3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
