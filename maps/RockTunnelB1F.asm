const_value set 2
	const ROCKTUNNELB1F_POKE_BALL1
	const ROCKTUNNELB1F_POKE_BALL2
	const ROCKTUNNELB1F_POKE_BALL3

RockTunnelB1F_MapScriptHeader:
.SceneScripts:
	db 0

.MapCallbacks:
	db 0

RockTunnelB1FIron:
	itemball IRON

RockTunnelB1FPPUp:
	itemball PP_UP

RockTunnelB1FRevive:
	itemball REVIVE

RockTunnelB1FHiddenMaxPotion:
	dwb EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION, MAX_POTION


RockTunnelB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $3, $3, 6, ROCK_TUNNEL_1F
	warp_def $9, $11, 4, ROCK_TUNNEL_1F
	warp_def $3, $17, 3, ROCK_TUNNEL_1F
	warp_def $17, $19, 5, ROCK_TUNNEL_1F

.CoordEvents:
	db 0

.BGEvents:
	db 1
	bg_event 14, 4, BGEVENT_ITEM, RockTunnelB1FHiddenMaxPotion

.ObjectEvents:
	db 3
	object_event SPRITE_POKE_BALL, 25, 7, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FIron, EVENT_ROCK_TUNNEL_B1F_IRON
	object_event SPRITE_POKE_BALL, 17, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FPPUp, EVENT_ROCK_TUNNEL_B1F_PP_UP
	object_event SPRITE_POKE_BALL, 2, 15, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, RockTunnelB1FRevive, EVENT_ROCK_TUNNEL_B1F_REVIVE
