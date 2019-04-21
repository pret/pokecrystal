	object_const_def ; object_event constants
	const TINTOWER6F_POKE_BALL

TinTower6F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower6FMaxPotion:
	itemball MAX_POTION

TinTower6F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, TIN_TOWER_7F, 1
	warp_event 11, 15, TIN_TOWER_5F, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  8,  8, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower6FMaxPotion, EVENT_TIN_TOWER_6F_MAX_POTION
