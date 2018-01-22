const_value set 2
	const TINTOWER5F_POKE_BALL

TinTower5F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	hiddenitem EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE, FULL_RESTORE

TinTower5FHiddenCarbos:
	hiddenitem EVENT_TIN_TOWER_5F_HIDDEN_CARBOS, CARBOS

TinTower5F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 11, 15, 2, TIN_TOWER_6F
	warp_def 2, 4, 1, TIN_TOWER_4F
	warp_def 2, 14, 3, TIN_TOWER_4F
	warp_def 17, 15, 4, TIN_TOWER_4F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 16, 14, BGEVENT_ITEM, TinTower5FHiddenFullRestore
	bg_event 3, 15, BGEVENT_ITEM, TinTower5FHiddenCarbos

.ObjectEvents:
	db 1
	object_event 9, 9, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
