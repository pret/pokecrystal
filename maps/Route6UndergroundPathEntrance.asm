INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "constants/map_constants.inc"


SECTION "maps/Route6UndergroundPathEntrance.asm", ROMX

Route6UndergroundPathEntrance_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route6UndergroundPathEntrance_MapEvents::
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  3,  7, ROUTE_6, 1
	warp_event  4,  7, ROUTE_6, 1
	warp_event  4,  3, UNDERGROUND_PATH, 2

	db 0 ; coord events

	db 0 ; bg events

	db 0 ; object events
