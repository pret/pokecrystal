const_value set 2
	const TINTOWER3F_POKE_BALL

TinTower3F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TinTower3FFullHeal:
	itemball FULL_HEAL

TinTower3F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $e, $a, 1, TIN_TOWER_2F
	warp_def $2, $10, 2, TIN_TOWER_4F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 14, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower3FFullHeal, EVENT_TIN_TOWER_3F_FULL_HEAL
