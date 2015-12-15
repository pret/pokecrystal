const_value set 2
	const TINTOWER6F_POKE_BALL

TinTower6F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TinTower6FMaxPotion:
	itemball MAX_POTION

TinTower6F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $9, $3, 1, TIN_TOWER_7F
	warp_def $f, $b, 1, TIN_TOWER_5F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 8, 8, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TinTower6FMaxPotion, EVENT_TIN_TOWER_6F_MAX_POTION
