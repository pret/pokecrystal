const_value set 2
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL1
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL2
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL3
	const RUINSOFALPHAERODACTYLITEMROOM_POKE_BALL4

RuinsOfAlphAerodactylItemRoom_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

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

RuinsOfAlphAerodactylItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $9, $4, 5, RUINS_OF_ALPH_AERODACTYL_CHAMBER
	warp_def $1, $3, 1, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM
	warp_def $1, $4, 2, RUINS_OF_ALPH_AERODACTYL_WORD_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 1, 2, BGEVENT_READ, MapRuinsOfAlphAerodactylItemRoomSignpost1Script
	bg_event 1, 5, BGEVENT_READ, MapRuinsOfAlphAerodactylItemRoomSignpost1Script

.ObjectEvents:
	db 4
	object_event SPRITE_POKE_BALL, 6, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomGoldBerry, EVENT_PICKED_UP_GOLD_BERRY_FROM_AERODACTYL_ITEM_ROOM
	object_event SPRITE_POKE_BALL, 6, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomMoonStone, EVENT_PICKED_UP_MOON_STONE_FROM_AERODACTYL_ITEM_ROOM
	object_event SPRITE_POKE_BALL, 4, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomHealPowder, EVENT_PICKED_UP_HEAL_POWDER_FROM_AERODACTYL_ITEM_ROOM
	object_event SPRITE_POKE_BALL, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphAerodactylItemRoomEnergyRoot, EVENT_PICKED_UP_ENERGY_ROOT_FROM_AERODACTYL_ITEM_ROOM
