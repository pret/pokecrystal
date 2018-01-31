const_value set 2 ; person constants
	const BLACKTHORNEMYSHOUSE_EMY

BlackthornEmysHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

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
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 2, 7, 3, BLACKTHORN_CITY
	warp_event 3, 7, 3, BLACKTHORN_CITY

	db 0 ; coord events

	db 2 ; bg events
	bg_event 0, 1, BGEVENT_READ, EmysHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, EmysHouseBookshelf

	db 1 ; object events
	object_event 2, 3, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Emy, -1
