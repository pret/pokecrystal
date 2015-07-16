TinTower4F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x185a58:
	db ULTRA_BALL, 1

ItemFragment_0x185a5a:
	db PP_UP, 1

ItemFragment_0x185a5c:
	db ESCAPE_ROPE, 1

MapTinTower4FSignpostItem0:
	dw $007d
	db MAX_POTION
	

TinTower4F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $2, 2, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
	warp_def $2, $10, 2, GROUP_TIN_TOWER_3F, MAP_TIN_TOWER_3F
	warp_def $e, $2, 3, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
	warp_def $f, $11, 4, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 6, 11, SIGNPOST_ITEMIFSET, MapTinTower4FSignpostItem0

	; people-events
	db 3
	person_event SPRITE_POKE_BALL, 14, 18, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a58, EVENT_64C
	person_event SPRITE_POKE_BALL, 18, 21, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a5a, EVENT_64D
	person_event SPRITE_POKE_BALL, 16, 6, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a5c, EVENT_64E
