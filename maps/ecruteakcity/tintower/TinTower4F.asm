const_value set 2
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_POKE_BALL2
	const TINTOWER4F_POKE_BALL3

TinTower4F_MapScriptHeader:
.MapTriggers:
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
	dwb EVENT_TIN_TOWER_4F_HIDDEN_MAX_POTION, MAX_POTION


TinTower4F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $2, 2, TIN_TOWER_5F
	warp_def $2, $10, 2, TIN_TOWER_3F
	warp_def $e, $2, 3, TIN_TOWER_5F
	warp_def $f, $11, 4, TIN_TOWER_5F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 11, SIGNPOST_ITEM, TinTower4FHiddenMaxPotion

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 10, 14, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower4FUltraBall, EVENT_TIN_TOWER_4F_ULTRA_BALL
	person_event SPRITE_POKE_BALL, 14, 17, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower4FPPUp, EVENT_TIN_TOWER_4F_PP_UP
	person_event SPRITE_POKE_BALL, 12, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower4FEscapeRope, EVENT_TIN_TOWER_4F_ESCAPE_ROPE
