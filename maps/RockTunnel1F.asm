const_value set 2
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2

RockTunnel1F_MapScripts:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	hiddenitem EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY, X_ACCURACY

RockTunnel1FHiddenXDefend:
	hiddenitem EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND, X_DEFEND

RockTunnel1F_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def 15, 3, 1, ROUTE_9
	warp_def 11, 25, 1, ROUTE_10_SOUTH
	warp_def 5, 3, 3, ROCK_TUNNEL_B1F
	warp_def 15, 9, 2, ROCK_TUNNEL_B1F
	warp_def 27, 3, 4, ROCK_TUNNEL_B1F
	warp_def 27, 13, 1, ROCK_TUNNEL_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 24, 4, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 21, 15, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

.ObjectEvents:
	db 2
	object_event 4, 18, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event 10, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
