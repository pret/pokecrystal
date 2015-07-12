DarkCaveVioletEntrance_MapScriptHeader:
	; trigger count
	db 0

	; callback count
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
	dw $009d
	db ELIXER
	

DarkCaveVioletEntrance_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $f, $3, 3, GROUP_ROUTE_31, MAP_ROUTE_31
	warp_def $1, $11, 2, GROUP_DARK_CAVE_BLACKTHORN_ENTRANCE, MAP_DARK_CAVE_BLACKTHORN_ENTRANCE
	warp_def $21, $23, 3, GROUP_ROUTE_46, MAP_ROUTE_46

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 3, 26, $7, MapDarkCaveVioletEntranceSignpostItem0

	; people-events
	db 8
	person_event SPRITE_POKE_BALL, 12, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c68e, EVENT_69E
	person_event SPRITE_ROCK, 18, 20, $18, $0, 255, 255, $0, 0, DarkCaveVioletEntranceRock, EVENT_ALWAYS_THERE
	person_event SPRITE_ROCK, 10, 31, $18, $0, 255, 255, $0, 0, DarkCaveVioletEntranceRock, EVENT_ALWAYS_THERE
	person_event SPRITE_ROCK, 18, 11, $18, $0, 255, 255, $0, 0, DarkCaveVioletEntranceRock, EVENT_ALWAYS_THERE
	person_event SPRITE_ROCK, 35, 40, $18, $0, 255, 255, $0, 0, DarkCaveVioletEntranceRock, EVENT_ALWAYS_THERE
	person_event SPRITE_POKE_BALL, 26, 40, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c690, EVENT_69F
	person_event SPRITE_POKE_BALL, 13, 39, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c692, EVENT_6A0
	person_event SPRITE_POKE_BALL, 32, 34, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c694, EVENT_7CE
