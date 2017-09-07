const_value set 2
	const TOHJOFALLS_POKE_BALL

TohjoFalls_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TohjoFallsMoonStone:
	itemball MOON_STONE

TohjoFalls_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $f, $d, 2, ROUTE_27
	warp_def $f, $19, 3, ROUTE_27

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_POKE_BALL, 6, 2, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, TohjoFallsMoonStone, EVENT_TOHJO_FALLS_MOON_STONE
