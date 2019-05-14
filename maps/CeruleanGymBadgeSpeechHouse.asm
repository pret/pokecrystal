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

	object_const_def ; object_event constants
	const CERULEANGYMBADGESPEECHHOUSE_POKEFAN_M


SECTION "maps/CeruleanGymBadgeSpeechHouse.asm", ROMX

CeruleanGymBadgeSpeechHouse_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanGymBadgeSpeechHousePokefanMScript:
	jumptextfaceplayer CeruleanGymBadgeSpeechHousePokefanMText

CeruleanGymBadgeSpeechHousePokefanMText:
	text "Are you collecting"
	line "KANTO GYM BADGES?"
	done

CeruleanGymBadgeSpeechHouse_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 1
	warp_event  3,  7, CERULEAN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHousePokefanMScript, -1
