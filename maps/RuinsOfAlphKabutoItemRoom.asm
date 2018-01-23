const_value set 2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL1
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL3
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL4

RuinsOfAlphKabutoItemRoom_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphKabutoItemRoomBerry:
	itemball BERRY

RuinsOfAlphKabutoItemRoomPsncureberry:
	itemball PSNCUREBERRY

RuinsOfAlphKabutoItemRoomHealPowder:
	itemball HEAL_POWDER

RuinsOfAlphKabutoItemRoomEnergypowder:
	itemball ENERGYPOWDER

MapRuinsOfAlphKabutoItemRoomSignpost1Script:
	jumptext UnknownText_0x599ad

UnknownText_0x599ad:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphKabutoItemRoom_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 3, 9, 5, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def 4, 9, 5, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def 3, 1, 1, RUINS_OF_ALPH_KABUTO_WORD_ROOM
	warp_def 4, 1, 2, RUINS_OF_ALPH_KABUTO_WORD_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 2, 1, BGEVENT_READ, MapRuinsOfAlphKabutoItemRoomSignpost1Script
	bg_event 5, 1, BGEVENT_READ, MapRuinsOfAlphKabutoItemRoomSignpost1Script

.ObjectEvents:
	db 4
	object_event 2, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomBerry, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	object_event 5, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomPsncureberry, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	object_event 2, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomHealPowder, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	object_event 5, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphKabutoItemRoomEnergypowder, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
