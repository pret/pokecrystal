const_value set 2
	const TINTOWER7F_POKE_BALL

TinTower7F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TinTower7FMaxRevive:
	itemball MAX_REVIVE

TinTower7F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 3, 9, 1, TIN_TOWER_6F
	warp_def 10, 15, 1, TIN_TOWER_8F
	warp_def 12, 7, 4, TIN_TOWER_7F
	warp_def 8, 3, 3, TIN_TOWER_7F
	warp_def 6, 9, 5, TIN_TOWER_9F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 16, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower7FMaxRevive, EVENT_TIN_TOWER_7F_MAX_REVIVE
