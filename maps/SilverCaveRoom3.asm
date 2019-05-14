INCLUDE "charmap.inc"
INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "macros/scripts/maps.inc"
INCLUDE "macros/scripts/text.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/gfx_constants.inc"
INCLUDE "constants/event_flags.inc"
INCLUDE "constants/map_constants.inc"
INCLUDE "constants/map_object_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/sprite_constants.inc"
INCLUDE "constants/sprite_data_constants.inc"
INCLUDE "constants/trainer_constants.inc"

	object_const_def ; object_event constants
	const SILVERCAVEROOM3_RED


SECTION "maps/SilverCaveRoom3.asm", ROMX

SilverCaveRoom3_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

Red:
	special FadeOutMusic
	faceplayer
	opentext
	writetext .Text1
	waitbutton
	closetext
	winlosstext .Text2, .Text2
	loadtrainer RED, RED1
	startbattle
	dontrestartmapmusic
	reloadmapafterbattle
	special FadeOutMusic
	opentext
	writetext .Text3
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	disappear SILVERCAVEROOM3_RED
	pause 15
	special FadeInQuickly
	pause 30
	special HealParty
	refreshscreen
	credits
	end

.Text1:
	text "<……>"
	line "<……>"
	done

.Text2:
	text "…"
	done

.Text3:
	text "<……>"
	line "<……>"
	done

SilverCaveRoom3_MapEvents::
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  9, 33, SILVER_CAVE_ROOM_2, 2

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  9, 10, SPRITE_RED, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Red, EVENT_RED_IN_MT_SILVER
