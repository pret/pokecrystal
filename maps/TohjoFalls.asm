INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/event_flags.inc"
INCLUDE "constants/item_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"

	object_const_def ; object_event constants
	const TOHJOFALLS_POKE_BALL


SECTION "maps/TohjoFalls.asm", ROMX

TohjoFalls_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFalls_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 13, 15, ROUTE_27, 2
	warp_event 25, 15, ROUTE_27, 3

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
