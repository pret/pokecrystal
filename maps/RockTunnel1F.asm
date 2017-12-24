const_value set 2
	const ROCKTUNNEL1F_POKE_BALL1
	const ROCKTUNNEL1F_POKE_BALL2

RockTunnel1F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RockTunnel1FElixer:
	itemball ELIXER

RockTunnel1FTMSteelWing:
	itemball TM_STEEL_WING

RockTunnel1FHiddenXAccuracy:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY, X_ACCURACY


RockTunnel1FHiddenXDefend:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND, X_DEFEND


RockTunnel1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $3, $f, 1, ROUTE_9
	warp_def $19, $b, 1, ROUTE_10_SOUTH
	warp_def $3, $5, 3, ROCK_TUNNEL_B1F
	warp_def $9, $f, 2, ROCK_TUNNEL_B1F
	warp_def $3, $1b, 4, ROCK_TUNNEL_B1F
	warp_def $d, $1b, 1, ROCK_TUNNEL_B1F

.CoordEvents:
	db 0

.BGEvents:
	db 2
	bg_event 4, 24, BGEVENT_ITEM, RockTunnel1FHiddenXAccuracy
	bg_event 15, 21, BGEVENT_ITEM, RockTunnel1FHiddenXDefend

.ObjectEvents:
	db 2
	object_event SPRITE_POKE_BALL, 18, 4, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FElixer, EVENT_ROCK_TUNNEL_1F_ELIXER
	object_event SPRITE_POKE_BALL, 15, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnel1FTMSteelWing, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
