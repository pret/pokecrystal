const_value set 2 ; person constants
	const TINTOWER7F_POKE_BALL

TinTower7F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower7FMaxRevive:
	itemball MAX_REVIVE

TinTower7F_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 3, 9, 1, TIN_TOWER_6F
	warp_event 10, 15, 1, TIN_TOWER_8F
	warp_event 12, 7, 4, TIN_TOWER_7F
	warp_event 8, 3, 3, TIN_TOWER_7F
	warp_event 6, 9, 5, TIN_TOWER_9F

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 16, 1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower7FMaxRevive, EVENT_TIN_TOWER_7F_MAX_REVIVE
