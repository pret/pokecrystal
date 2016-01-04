const_value set 2
	const ICEPATH1F_POKE_BALL1
	const ICEPATH1F_POKE_BALL2
	const ICEPATH1F_POKE_BALL3

IcePath1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

IcePath1FHMWaterfall:
	itemball HM_WATERFALL

IcePath1FPPUp:
	itemball PP_UP

IcePath1FProtein:
	itemball PROTEIN

IcePath1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $13, $4, 1, ROUTE_44
	warp_def $1b, $24, 7, BLACKTHORN_CITY
	warp_def $5, $25, 1, ICE_PATH_B1F
	warp_def $d, $25, 7, ICE_PATH_B1F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 7, 31, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FHMWaterfall, EVENT_GOT_HM07_WATERFALL
	person_event SPRITE_POKE_BALL, 23, 32, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FPPUp, EVENT_ICE_PATH_1F_PP_UP
	person_event SPRITE_POKE_BALL, 9, 35, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, IcePath1FProtein, EVENT_ICE_PATH_1F_PROTEIN
