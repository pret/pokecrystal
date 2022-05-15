	object_const_def
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3

WhirlIslandB2F_MapScripts:
	def_scene_scripts

	def_callbacks

WhirlIslandB2FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER

WhirlIslandB2F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11,  5, WHIRL_ISLAND_B1F, 7
	warp_event  7, 11, WHIRL_ISLAND_B1F, 8
	warp_event  7, 25, WHIRL_ISLAND_LUGIA_CHAMBER, 1
	warp_event 13, 31, WHIRL_ISLAND_SW, 5

	def_coord_events

	def_bg_events

	def_object_events
	object_event 10, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	object_event  6,  4, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	object_event  5, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
