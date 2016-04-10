const_value set 2
	const TINTOWER5F_POKE_BALL

TinTower5F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	dwb EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE, FULL_RESTORE


TinTower5FHiddenCarbos:
	dwb EVENT_TIN_TOWER_5F_HIDDEN_CARBOS, CARBOS


TinTower5F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $f, $b, 2, TIN_TOWER_6F
	warp_def $4, $2, 1, TIN_TOWER_4F
	warp_def $e, $2, 3, TIN_TOWER_4F
	warp_def $f, $11, 4, TIN_TOWER_4F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 14, 16, SIGNPOST_ITEM, TinTower5FHiddenFullRestore
	signpost 15, 3, SIGNPOST_ITEM, TinTower5FHiddenCarbos

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 9, 9, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
