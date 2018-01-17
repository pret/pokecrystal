const_value set 2
	const WHIRLISLANDSW_POKE_BALL

WhirlIslandSW_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandSWUltraBall:
	itemball ULTRA_BALL

WhirlIslandSW_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 5, 7, 3, ROUTE_41
	warp_def 17, 3, 5, WHIRL_ISLAND_B1F
	warp_def 3, 3, 4, WHIRL_ISLAND_B1F
	warp_def 3, 15, 3, WHIRL_ISLAND_NW
	warp_def 17, 15, 4, WHIRL_ISLAND_B2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 15, 2, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
