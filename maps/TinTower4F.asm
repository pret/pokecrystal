TinTower4F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x185a58:
	db ULTRA_BALL, 1

ItemFragment_0x185a5a:
	db PP_UP, 1

ItemFragment_0x185a5c:
	db ESCAPE_ROPE, 1

MapTinTower4FSignpostItem0:
	dwb EVENT_TIN_TOWER_4F_HIDDEN_MAX_POTION, MAX_POTION
	

TinTower4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $2, 2, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
	warp_def $2, $10, 2, GROUP_TIN_TOWER_3F, MAP_TIN_TOWER_3F
	warp_def $e, $2, 3, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F
	warp_def $f, $11, 4, GROUP_TIN_TOWER_5F, MAP_TIN_TOWER_5F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 11, SIGNPOST_ITEM, MapTinTower4FSignpostItem0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 14, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a58, EVENT_TIN_TOWER_4F_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 18, 21, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a5a, EVENT_TIN_TOWER_4F_PP_UP
	person_event SPRITE_POKE_BALL, 16, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185a5c, EVENT_TIN_TOWER_4F_ESCAPE_ROPE
