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
INCLUDE "constants/mart_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"

	object_const_def ; object_event constants
	const FUCHSIAMART_CLERK
	const FUCHSIAMART_FISHER
	const FUCHSIAMART_COOLTRAINER_F


SECTION "maps/FuchsiaMart.asm", ROMX

FuchsiaMart_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

FuchsiaMartClerkScript:
	opentext
	pokemart MARTTYPE_STANDARD, MART_FUCHSIA
	closetext
	end

FuchsiaMartFisherScript:
	jumptextfaceplayer FuchsiaMartFisherText

FuchsiaMartCooltrainerFScript:
	jumptextfaceplayer FuchsiaMartCooltrainerFText

FuchsiaMartFisherText:
	text "I was hoping to"
	line "buy some SAFARI"

	para "ZONE souvenirs,"
	line "but it's closed…"
	done

FuchsiaMartCooltrainerFText:
	text "The SAFARI ZONE"
	line "WARDEN's grand-"
	cont "daughter lives in"
	cont "town."
	done

FuchsiaMart_MapEvents::
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, FUCHSIA_CITY, 1
	warp_event  3,  7, FUCHSIA_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FuchsiaMartClerkScript, -1
	object_event  3,  2, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, FuchsiaMartFisherScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FuchsiaMartCooltrainerFScript, -1
