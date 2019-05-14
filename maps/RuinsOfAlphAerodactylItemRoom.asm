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

	object_const_def ; object_event constants
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL1
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL2
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL3
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL4


SECTION "maps/RuinsOfAlphAerodactylItemRoom.asm", ROMX

RuinsOfAlphAerodactylItemRoom_MapScripts::
	db 0 ; scene scripts

	db 0 ; callbacks

RuinsOfAlphAerodactylItemRoomGoldBerry:
	itemball GOLD_BERRY

RuinsOfAlphAerodactylItemRoomMoonStone:
	itemball MOON_STONE

RuinsOfAlphAerodactylItemRoomHealPowder:
	itemball HEAL_POWDER

RuinsOfAlphAerodactylItemRoomEnergyRoot:
	itemball ENERGY_ROOT

RuinsOfAlphAerodactylItemRoomAncientReplica:
	jumptext RuinsOfAlphAerodactylItemRoomAncientReplicaText

RuinsOfAlphAerodactylItemRoomAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphAerodactylItemRoom_MapEvents::
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 5
	warp_event  4,  9, RUINS_OF_ALPH_AERODACTYL_CHAMBER, 5
	warp_event  3,  1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, 1
	warp_event  4,  1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  2,  1, BGEVENT_READ, RuinsOfAlphAerodactylItemRoomAncientReplica
	bg_event  5,  1, BGEVENT_READ, RuinsOfAlphAerodactylItemRoomAncientReplica

	db 4 ; object events
	object_event  2,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomGoldBerry, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM
	object_event  5,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM
	object_event  2,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomHealPowder, EVENT_PICKED_UP_HEAL_POWDER_FROM_AERODACTYL_ITEM_ROOM
	object_event  5,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomEnergyRoot, EVENT_PICKED_UP_ENERGY_ROOT_FROM_AERODACTYL_ITEM_ROOM
