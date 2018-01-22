const_value set 2
	const WHIRLISLANDNE_POKE_BALL

WhirlIslandNE_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandNE_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def 3, 13, 2, ROUTE_41
	warp_def 17, 3, 2, WHIRL_ISLAND_B1F
	warp_def 13, 11, 3, WHIRL_ISLAND_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 11, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
