TinTower5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x185aa9:
	db RARE_CANDY, 1

MapTinTower5FSignpostItem0:
	dwb EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE, FULL_RESTORE
	

MapTinTower5FSignpostItem1:
	dwb EVENT_TIN_TOWER_5F_HIDDEN_CARBOS, CARBOS
	

TinTower5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $f, $b, 2, GROUP_TIN_TOWER_6F, MAP_TIN_TOWER_6F
	warp_def $4, $2, 1, GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F
	warp_def $e, $2, 3, GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F
	warp_def $f, $11, 4, GROUP_TIN_TOWER_4F, MAP_TIN_TOWER_4F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 14, 16, SIGNPOST_ITEM, MapTinTower5FSignpostItem0
	signpost 15, 3, SIGNPOST_ITEM, MapTinTower5FSignpostItem1

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 13, 13, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x185aa9, EVENT_TIN_TOWER_5F_RARE_CANDY
