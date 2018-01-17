const_value set 2
	const WHIRLISLANDB1F_POKE_BALL1
	const WHIRLISLANDB1F_POKE_BALL2
	const WHIRLISLANDB1F_POKE_BALL3
	const WHIRLISLANDB1F_POKE_BALL4
	const WHIRLISLANDB1F_POKE_BALL5
	const WHIRLISLANDB1F_BOULDER

WhirlIslandB1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

WhirlIslandB1FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB1FCarbos:
	itemball CARBOS

WhirlIslandB1FCalcium:
	itemball CALCIUM

WhirlIslandB1FNugget:
	itemball NUGGET

WhirlIslandB1FEscapeRope:
	itemball ESCAPE_ROPE

WhirlIslandB1FBoulder:
	jumpstd strengthboulder

WhirlIslandB1FHiddenRareCandy:
	hiddenitem EVENT_WHIRL_ISLAND_B1F_HIDDEN_RARE_CANDY, RARE_CANDY

WhirlIslandB1FHiddenUltraBall:
	hiddenitem EVENT_WHIRL_ISLAND_B1F_HIDDEN_ULTRA_BALL, ULTRA_BALL

WhirlIslandB1FHiddenFullRestore:
	hiddenitem EVENT_WHIRL_ISLAND_B1F_HIDDEN_FULL_RESTORE, FULL_RESTORE

WhirlIslandB1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 9
	warp_def 5, 5, 2, WHIRL_ISLAND_NW
	warp_def 35, 3, 2, WHIRL_ISLAND_NE
	warp_def 29, 9, 3, WHIRL_ISLAND_NE
	warp_def 9, 31, 3, WHIRL_ISLAND_SW
	warp_def 23, 31, 2, WHIRL_ISLAND_SW
	warp_def 31, 29, 2, WHIRL_ISLAND_SE
	warp_def 25, 21, 1, WHIRL_ISLAND_B2F
	warp_def 13, 27, 2, WHIRL_ISLAND_B2F
	warp_def 17, 21, 1, WHIRL_ISLAND_CAVE

.CoordEvents:
	db 0

.BGEvents:
	db 3
	bg_event 30, 4, BGEVENT_ITEM, WhirlIslandB1FHiddenRareCandy
	bg_event 36, 18, BGEVENT_ITEM, WhirlIslandB1FHiddenUltraBall
	bg_event 2, 23, BGEVENT_ITEM, WhirlIslandB1FHiddenFullRestore

.ObjectEvents:
	db 6
	object_event 7, 13, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FFullRestore, EVENT_WHIRL_ISLAND_B1F_FULL_RESTORE
	object_event 2, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCarbos, EVENT_WHIRL_ISLAND_B1F_CARBOS
	object_event 33, 23, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FCalcium, EVENT_WHIRL_ISLAND_B1F_CALCIUM
	object_event 17, 8, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FNugget, EVENT_WHIRL_ISLAND_B1F_NUGGET
	object_event 19, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, WhirlIslandB1FEscapeRope, EVENT_WHIRL_ISLAND_B1F_ESCAPE_ROPE
	object_event 23, 26, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WhirlIslandB1FBoulder, -1
