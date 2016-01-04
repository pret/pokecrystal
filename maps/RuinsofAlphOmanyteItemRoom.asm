const_value set 2
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL1
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL2
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL3
	const RUINSOFALPHOMANYTEITEMROOM_POKE_BALL4

RuinsofAlphOmanyteItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RuinsofAlphOmanyteItemRoomMysteryberry:
	itemball MYSTERYBERRY

RuinsofAlphOmanyteItemRoomMysticWater:
	itemball MYSTIC_WATER

RuinsofAlphOmanyteItemRoomStardust:
	itemball STARDUST

RuinsofAlphOmanyteItemRoomStarPiece:
	itemball STAR_PIECE

MapRuinsofAlphOmanyteItemRoomSignpost1Script:
	jumptext UnknownText_0x59a37

UnknownText_0x59a37:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphOmanyteItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $9, $4, 5, RUINS_OF_ALPH_OMANYTE_CHAMBER
	warp_def $1, $3, 1, RUINS_OF_ALPH_OMANYTE_WORD_ROOM
	warp_def $1, $4, 2, RUINS_OF_ALPH_OMANYTE_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphOmanyteItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphOmanyteItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 6, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphOmanyteItemRoomMysteryberry, EVENT_PICKED_UP_MYSTERYBERRY_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 6, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphOmanyteItemRoomMysticWater, EVENT_PICKED_UP_MYSTIC_WATER_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 4, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphOmanyteItemRoomStardust, EVENT_PICKED_UP_STARDUST_FROM_OMANYTE_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphOmanyteItemRoomStarPiece, EVENT_PICKED_UP_STAR_PIECE_FROM_OMANYTE_ITEM_ROOM
