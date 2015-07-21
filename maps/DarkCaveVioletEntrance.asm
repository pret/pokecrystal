DarkCaveVioletEntrance_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c68e:
	db POTION, 1

ItemFragment_0x18c690:
	db FULL_HEAL, 1

ItemFragment_0x18c692:
	db HYPER_POTION, 1

ItemFragment_0x18c694:
	db DIRE_HIT, 1

DarkCaveVioletEntranceRock:
	jumpstd smashrock

MapDarkCaveVioletEntranceSignpostItem0:
	dwb EVENT_DARK_CAVE_VIOLET_ENTRANCE_HIDDEN_ELIXER, ELIXER
	

DarkCaveVioletEntrance_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $f, $3, 3, GROUP_ROUTE_31, MAP_ROUTE_31
	warp_def $1, $11, 2, GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE
	warp_def $21, $23, 3, GROUP_ROUTE_46, MAP_ROUTE_46

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 3, 26, SIGNPOST_ITEM, MapDarkCaveVioletEntranceSignpostItem0

.PersonEvents:
	db 8
	person_event SPRITE_POKE_BALL, 12, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c68e, EVENT_DARK_CAVE_VIOLET_ENTRANCE_POTION
	person_event SPRITE_ROCK, 18, 20, OW_LEFT | $10, $0, -1, -1, $0, 0, DarkCaveVioletEntranceRock, -1
	person_event SPRITE_ROCK, 10, 31, OW_LEFT | $10, $0, -1, -1, $0, 0, DarkCaveVioletEntranceRock, -1
	person_event SPRITE_ROCK, 18, 11, OW_LEFT | $10, $0, -1, -1, $0, 0, DarkCaveVioletEntranceRock, -1
	person_event SPRITE_ROCK, 35, 40, OW_LEFT | $10, $0, -1, -1, $0, 0, DarkCaveVioletEntranceRock, -1
	person_event SPRITE_POKE_BALL, 26, 40, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c690, EVENT_DARK_CAVE_VIOLET_ENTRANCE_FULL_HEAL
	person_event SPRITE_POKE_BALL, 13, 39, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c692, EVENT_DARK_CAVE_VIOLET_ENTRANCE_HYPER_POTION
	person_event SPRITE_POKE_BALL, 32, 34, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c694, EVENT_DARK_CAVE_VIOLET_ENTRANCE_DIRE_HIT
