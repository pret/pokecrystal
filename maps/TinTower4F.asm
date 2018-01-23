const_value set 2
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_POKE_BALL2
	const TINTOWER4F_POKE_BALL3

TinTower4F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TinTower4FUltraBall:
	itemball ULTRA_BALL

TinTower4FPPUp:
	itemball PP_UP

TinTower4FEscapeRope:
	itemball ESCAPE_ROPE

TinTower4FHiddenMaxPotion:
	hiddenitem EVENT_TIN_TOWER_4F_HIDDEN_MAX_POTION, MAX_POTION

TinTower4F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 2, 4, 2, TIN_TOWER_5F
	warp_def 16, 2, 2, TIN_TOWER_3F
	warp_def 2, 14, 3, TIN_TOWER_5F
	warp_def 17, 15, 4, TIN_TOWER_5F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 11, 6, BGEVENT_ITEM, TinTower4FHiddenMaxPotion

.ObjectEvents:
	db 3
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FUltraBall, EVENT_TIN_TOWER_4F_ULTRA_BALL
	object_event 17, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FPPUp, EVENT_TIN_TOWER_4F_PP_UP
	object_event 2, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FEscapeRope, EVENT_TIN_TOWER_4F_ESCAPE_ROPE
