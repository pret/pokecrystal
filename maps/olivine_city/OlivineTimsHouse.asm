const_value set 2
	const OLIVINETIMSHOUSE_TIM

OlivineTimsHouse_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

Tim:
	faceplayer
	opentext
	trade NPCTRADE_TIM
	waitbutton
	closetext
	end

TimsHouseBookshelf:
	jumpstd magazinebookshelf

OlivineTimsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 3, OLIVINE_CITY
	warp_def $7, $3, 3, OLIVINE_CITY

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 0, BGEVENT_READ, TimsHouseBookshelf
	bg_event 1, 1, BGEVENT_READ, TimsHouseBookshelf

.ObjectEvents:
	db 1
	object_event SPRITE_FISHING_GURU, 3, 2, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Tim, -1
