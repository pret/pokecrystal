TohjoFalls_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x18db02:
	db MOON_STONE, 1

TohjoFalls_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $f, $d, 2, GROUP_ROUTE_27, MAP_ROUTE_27
	warp_def $f, $19, 3, GROUP_ROUTE_27, MAP_ROUTE_27

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_POKE_BALL, 10, 6, DOWN << 2 | $1, $0, -1, -1, $1, 0, ItemFragment_0x18db02, EVENT_TOHJO_FALLS_MOON_STONE
