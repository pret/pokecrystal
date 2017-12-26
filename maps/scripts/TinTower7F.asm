const_value set 2
	const TINTOWER7F_POKE_BALL

TinTower7F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TinTower7FMaxRevive:
	itemball MAX_REVIVE

TinTower7F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $3, 1, TIN_TOWER_6F
	warp_def $f, $a, 1, TIN_TOWER_8F
	warp_def $7, $c, 4, TIN_TOWER_7F
	warp_def $3, $8, 3, TIN_TOWER_7F
	warp_def $9, $6, 5, TIN_TOWER_9F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_POKE_BALL, 1, 16, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower7FMaxRevive, EVENT_TIN_TOWER_7F_MAX_REVIVE
