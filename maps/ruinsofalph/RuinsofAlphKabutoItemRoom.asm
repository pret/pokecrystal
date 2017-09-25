const_value set 2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL1
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL2
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL3
	const RUINSOFALPHKABUTOITEMROOM_POKE_BALL4

RuinsofAlphKabutoItemRoom_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

RuinsofAlphKabutoItemRoomBerry:
	itemball BERRY

RuinsofAlphKabutoItemRoomPsncureberry:
	itemball PSNCUREBERRY

RuinsofAlphKabutoItemRoomHealPowder:
	itemball HEAL_POWDER

RuinsofAlphKabutoItemRoomEnergypowder:
	itemball ENERGYPOWDER

MapRuinsofAlphKabutoItemRoomSignpost1Script:
	jumptext UnknownText_0x599ad

UnknownText_0x599ad:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsofAlphKabutoItemRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $9, $3, 5, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $9, $4, 5, RUINS_OF_ALPH_KABUTO_CHAMBER
	warp_def $1, $3, 1, RUINS_OF_ALPH_KABUTO_WORD_ROOM
	warp_def $1, $4, 2, RUINS_OF_ALPH_KABUTO_WORD_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 1, 2, SIGNPOST_READ, MapRuinsofAlphKabutoItemRoomSignpost1Script
	signpost 1, 5, SIGNPOST_READ, MapRuinsofAlphKabutoItemRoomSignpost1Script

.PersonEvents:
	db 4
	person_event SPRITE_POKE_BALL, 6, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphKabutoItemRoomBerry, EVENT_PICKED_UP_BERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 6, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphKabutoItemRoomPsncureberry, EVENT_PICKED_UP_PSNCUREBERRY_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 4, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphKabutoItemRoomHealPowder, EVENT_PICKED_UP_HEAL_POWDER_FROM_KABUTO_ITEM_ROOM
	person_event SPRITE_POKE_BALL, 4, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, RuinsofAlphKabutoItemRoomEnergypowder, EVENT_PICKED_UP_ENERGYPOWDER_FROM_KABUTO_ITEM_ROOM
