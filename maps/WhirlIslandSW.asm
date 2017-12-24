const_value set 2
	const WHIRLISLANDSW_POKE_BALL

WhirlIslandSW_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandSWUltraBall:
	itemball ULTRA_BALL

WhirlIslandSW_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $7, $5, 3, ROUTE_41
	warp_def $3, $11, 5, WHIRL_ISLAND_B1F
	warp_def $3, $3, 4, WHIRL_ISLAND_B1F
	warp_def $f, $3, 3, WHIRL_ISLAND_NW
	warp_def $f, $11, 4, WHIRL_ISLAND_B2F

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event SPRITE_POKE_BALL, 2, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandSWUltraBall, EVENT_WHIRL_ISLAND_SW_ULTRA_BALL
