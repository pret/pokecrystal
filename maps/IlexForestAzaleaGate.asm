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
	const ILEXFORESTAZALEAGATE_OFFICER
	const ILEXFORESTAZALEAGATE_GRANNY


SECTION "maps/IlexForestAzaleaGate.asm", ROMX

IlexForestAzaleaGate_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

IlexForestAzaleaGateOfficerScript:
	jumptextfaceplayer IlexForestAzaleaGateOfficerText

IlexForestAzaleaGateGrannyScript:
	jumptextfaceplayer IlexForestAzaleaGateGrannyText

IlexForestAzaleaGateOfficerText:
	text "ILEX FOREST is"
	line "big. Be careful!"
	cont "Don't get lost."
	done

IlexForestAzaleaGateGrannyText:
	text "The FOREST is"
	line "watched over by"
	cont "its protector."

	para "Stay out of"
	line "mischief!"
	done

IlexForestAzaleaGate_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ILEX_FOREST, 2
	warp_event  0,  5, ILEX_FOREST, 3
	warp_event  9,  4, AZALEA_TOWN, 7
	warp_event  9,  5, AZALEA_TOWN, 8

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateOfficerScript, -1
	object_event  1,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestAzaleaGateGrannyScript, -1
