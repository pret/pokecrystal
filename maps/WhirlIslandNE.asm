const_value set 2
	const WHIRLISLANDNE_POKE_BALL

WhirlIslandNE_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WhirlIslandNEUltraBall:
	itemball ULTRA_BALL

WhirlIslandNE_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $d, $3, 2, ROUTE_41
	warp_def $3, $11, 2, WHIRL_ISLAND_B1F
	warp_def $b, $d, 3, WHIRL_ISLAND_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 11, 11, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandNEUltraBall, EVENT_WHIRL_ISLAND_NE_ULTRA_BALL
