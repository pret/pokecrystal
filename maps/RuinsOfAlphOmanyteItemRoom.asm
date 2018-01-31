const_value set 2 ; person constants
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL1
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL2
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL3
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL4

RuinsOfAlphOmanyteItemRoom_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RuinsOfAlphOmanyteItemRoomMysteryberry:
	itemball MYSTERYBERRY

RuinsOfAlphOmanyteItemRoomMysticWater:
	itemball MYSTIC_WATER

RuinsOfAlphOmanyteItemRoomStardust:
	itemball STARDUST

RuinsOfAlphOmanyteItemRoomStarPiece:
	itemball STAR_PIECE

MapRuinsOfAlphOmanyteItemRoomSignpost1Script:
	jumptext UnknownText_0x59a37

UnknownText_0x59a37:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphOmanyteItemRoom_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 3, 9, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_event 4, 9, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_event 3, 1, 1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_event 4, 1, 2, RUINS_OF_ALPH_OMANYTE_WORD_ROOM

	db 0 ; coord events

	db 2 ; bg events
	bg_event 2, 1, BGEVENT_READ, MapRuinsOfAlphOmanyteItemRoomSignpost1Script
	bg_event 5, 1, BGEVENT_READ, MapRuinsOfAlphOmanyteItemRoomSignpost1Script

	db 4 ; object events
	object_event 2, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphOmanyteItemRoomMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	object_event 5, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphOmanyteItemRoomMysticWater, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	object_event 2, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphOmanyteItemRoomStardust, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
	object_event 5, 4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RuinsOfAlphOmanyteItemRoomStarPiece, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
