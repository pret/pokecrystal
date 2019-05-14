INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/npc_trade_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"
INCLUDE "constants/std_constants.inc"

	object_const_def ; object_event constants
	const OLIVINETIMSHOUSE_TIM


SECTION "maps/OlivineTimsHouse.asm", ROMX

OlivineTimsHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Tim:
	faceplayer
	opentext
	trade NPC_TRADE_TIM
	waitbutton
	closetext
	end

TimsHouseBookshelf:
	jumpstd magazinebookshelf

OlivineTimsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, OLIVINE_CITY, 3
	warp_event  3,  7, OLIVINE_CITY, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, TimsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, TimsHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Tim, -1
