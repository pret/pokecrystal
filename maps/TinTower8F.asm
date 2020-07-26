	object_const_def
	const TINTOWER8F_POKE_BALL1
	const TINTOWER8F_POKE_BALL2
	const TINTOWER8F_POKE_BALL3

TinTower8F_MapScripts:
	def_scene_scripts

	def_callbacks

TinTower8FNugget:
	itemball NUGGET

TinTower8FMaxElixer:
	itemball MAX_ELIXER

TinTower8FFullRestore:
	itemball FULL_RESTORE

TinTower8F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  5, TIN_TOWER_7F, 2
	warp_event  2, 11, TIN_TOWER_9F, 1
	warp_event 16,  7, TIN_TOWER_9F, 2
	warp_event 10,  3, TIN_TOWER_9F, 3
	warp_event 14, 15, TIN_TOWER_9F, 6
	warp_event  6,  9, TIN_TOWER_9F, 7

	def_coord_events

	def_bg_events

	def_object_events
	object_event  7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FNugget, EVENT_TIN_TOWER_8F_NUGGET
	object_event 11,  6, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FMaxElixer, EVENT_TIN_TOWER_8F_MAX_ELIXER
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower8FFullRestore, EVENT_TIN_TOWER_8F_FULL_RESTORE
