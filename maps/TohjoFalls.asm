const_value set 2
	const TOHJOFALLS_POKE_BALL

TohjoFalls_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFalls_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def 13, 15, 2, ROUTE_27
	warp_def 25, 15, 3, ROUTE_27

.CoordEvents:
	db 0

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 2, 6, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
