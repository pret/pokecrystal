const_value set 2
	const TINTOWER3F_POKE_BALL

TinTower3F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TinTower3FFullHeal:
	itemball FULL_HEAL

TinTower3F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 10, 14, 1, TIN_TOWER_2F
	warp_def 16, 2, 2, TIN_TOWER_4F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 3, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower3FFullHeal, EVENT_TIN_TOWER_3F_FULL_HEAL
