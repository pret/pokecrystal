const_value set 2
	const RUINSOFALPHHOOHITEMROOM_POKE_BALL1
	const RUINSOFALPHHOOHITEMROOM_POKE_BALL2
	const RUINSOFALPHHOOHITEMROOM_POKE_BALL3
	const RUINSOFALPHHOOHITEMROOM_POKE_BALL4

RuinsOfAlphHoOhItemRoom_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RuinsOfAlphHoOhItemRoomGoldBerry:
	itemball GOLD_BERRY

RuinsOfAlphHoOhItemRoomMysteryberry:
	itemball MYSTERYBERRY

RuinsOfAlphHoOhItemRoomRevivalHerb:
	itemball REVIVAL_HERB

RuinsOfAlphHoOhItemRoomCharcoal:
	itemball CHARCOAL

MapRuinsOfAlphHoOhItemRoomSignpost1Script:
	jumptext UnknownText_0x59923

UnknownText_0x59923:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphHoOhItemRoom_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 3, 9, 5, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def 4, 9, 5, RUINS_OF_ALPH_HO_OH_CHAMBER
	warp_def 3, 1, 1, RUINS_OF_ALPH_HO_OH_WORD_ROOM
	warp_def 4, 1, 2, RUINS_OF_ALPH_HO_OH_WORD_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 2, 1, BGEVENT_READ, MapRuinsOfAlphHoOhItemRoomSignpost1Script
	bg_event 5, 1, BGEVENT_READ, MapRuinsOfAlphHoOhItemRoomSignpost1Script

.ObjectEvents:
	db 4
	object_event 2, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphHoOhItemRoomGoldBerry, EVENT_PICKED_UP_GOLD_BERRY_FROM_HO_OH_ITEM_ROOM
	object_event 5, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphHoOhItemRoomMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_HO_OH_ITEM_ROOM
	object_event 2, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphHoOhItemRoomRevivalHerb, EVENT_PICKED_UP_REVIVAL_HERB_FROM_HO_OH_ITEM_ROOM
	object_event 5, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphHoOhItemRoomCharcoal, EVENT_PICKED_UP_CHARCOAL_FROM_HO_OH_ITEM_ROOM
