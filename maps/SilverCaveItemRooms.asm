const_value set 2
	const SILVERCAVEITEMROOMS_POKE_BALL1
	const SILVERCAVEITEMROOMS_POKE_BALL2

SilverCaveItemRooms_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c65e:
	itemfragment MAX_REVIVE

ItemFragment_0x18c660:
	itemfragment FULL_RESTORE

SilverCaveItemRooms_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $d, 3, SILVER_CAVE_ROOM_2
	warp_def $f, $7, 4, SILVER_CAVE_ROOM_2

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 3, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x18c65e, EVENT_SILVER_CAVE_ITEM_ROOMS_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 11, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMFRAGMENT, 0, ItemFragment_0x18c660, EVENT_SILVER_CAVE_ITEM_ROOMS_FULL_RESTORE
