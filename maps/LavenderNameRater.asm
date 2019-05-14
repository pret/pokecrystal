INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"
INCLUDE "constants/std_constants.inc"

	object_const_def ; object_event constants
	const LAVENDERNAMERATER_NAME_RATER


SECTION "maps/LavenderNameRater.asm", ROMX

LavenderNameRater_MapScripts::
	db 1 ; scene scripts
	scene_script .DummyScene

	db 0 ; callbacks

.DummyScene:
	end

LavenderNameRater:
	faceplayer
	opentext
	special NameRater
	waitbutton
	closetext
	end

LavenderNameRaterUnusedBookshelf:
; unused
	jumpstd difficultbookshelf

LavenderNameRater_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, LAVENDER_TOWN, 4
	warp_event  3,  7, LAVENDER_TOWN, 4

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderNameRater, -1
