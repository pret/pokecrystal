INCLUDE "charmap.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"

	object_const_def ; object_event constants
	const ROUTE8SAFFRONGATE_OFFICER


SECTION "maps/Route8SaffronGate.asm", ROMX

Route8SaffronGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Route8SaffronGateOfficerScript:
	jumptextfaceplayer Route8SaffronGateOfficerText

Route8SaffronGateOfficerText:
	text "Have you been to"
	line "LAVENDER TOWN?"

	para "There's a tall"
	line "RADIO TOWER there."
	done

Route8SaffronGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, SAFFRON_CITY, 14
	warp_event  0,  5, SAFFRON_CITY, 15
	warp_event  9,  4, ROUTE_8, 1
	warp_event  9,  5, ROUTE_8, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route8SaffronGateOfficerScript, -1
