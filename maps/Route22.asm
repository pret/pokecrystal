INCLUDE "charmap.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/script_constants.inc"


SECTION "maps/Route22.asm", ROMX

Route22_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

VictoryRoadEntranceSignText:
	text "#MON LEAGUE"

	para "VICTORY ROAD"
	line "ENTRANCE"
	done

Route22_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	db 0 ; object events
