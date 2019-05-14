INCLUDE "charmap.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/event_flags.inc"
INCLUDE "constants/item_constants.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"
INCLUDE "constants/std_constants.inc"

	object_const_def ; object_event constants
	const MRPSYCHICSHOUSE_FISHING_GURU


SECTION "maps/MrPsychicsHouse.asm", ROMX

MrPsychicsHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

MrPsychic:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM29_PSYCHIC
	iftrue .AlreadyGotItem
	writetext MrPsychicText1
	buttonsound
	verbosegiveitem TM_PSYCHIC_M
	iffalse .Done
	setevent EVENT_GOT_TM29_PSYCHIC
.AlreadyGotItem:
	writetext MrPsychicText2
	waitbutton
.Done:
	closetext
	end

MrPsychicsHouseBookshelf:
	jumpstd difficultbookshelf

MrPsychicText1:
	text "…"

	para "…"

	para "…"

	para "…I got it!"

	para "You wanted this!"
	done

MrPsychicText2:
	text "TM29 is PSYCHIC."

	para "It may lower the"
	line "target's SPCL.DEF."
	done

MrPsychicsHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, SAFFRON_CITY, 5
	warp_event  3,  7, SAFFRON_CITY, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, MrPsychicsHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, MrPsychicsHouseBookshelf

	db 1 ; object events
	object_event  5,  3, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, MrPsychic, -1
