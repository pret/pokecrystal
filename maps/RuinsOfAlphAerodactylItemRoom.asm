const_value set 2 ; person constants
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL1
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL2
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL3
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL4

RuinsOfAlphAerodactylItemRoom_MapScripts:
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

MapRuinsOfAlphAerodactylItemRoomSignpost1Script:
	jumptext UnknownText_0x59ac1

UnknownText_0x59ac1:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphAerodactylItemRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 9, 5, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_event 4, 9, 5, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_event 3, 1, 1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	warp_event 4, 1, 2, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM

	db 0 ; coord events

	db 2 ; bg events
	bg_event 2, 1, BGEVENT_READ, MapRuinsOfAlphAerodactylItemRoomSignpost1Script
	bg_event 5, 1, BGEVENT_READ, MapRuinsOfAlphAerodactylItemRoomSignpost1Script

	db 4 ; object events
	object_event 2, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomGoldBerry, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM
	object_event 5, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM
	object_event 2, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomHealPowder, EVENT_PICKED_UP_HEAL_POWDER_FROM_AERODACTYL_ITEM_ROOM
	object_event 5, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomEnergyRoot, EVENT_PICKED_UP_ENERGY_ROOT_FROM_AERODACTYL_ITEM_ROOM
