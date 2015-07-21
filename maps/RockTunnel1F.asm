RockTunnel1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x743b5:
	db ELIXER, 1

ItemFragment_0x743b7:
	db TM_STEEL_WING, 1

MapRockTunnel1FSignpostItem0:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_ACCURACY, X_ACCURACY
	

MapRockTunnel1FSignpostItem1:
	dwb EVENT_ROCK_TUNNEL_1F_HIDDEN_X_DEFEND, X_DEFEND
	

RockTunnel1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $3, $f, 1, GROUP_ROUTE_9, MAP_ROUTE_9
	warp_def $19, $b, 1, GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH
	warp_def $3, $5, 3, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $9, $f, 2, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $3, $1b, 4, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $d, $1b, 1, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 4, 24, SIGNPOST_ITEM, MapRockTunnel1FSignpostItem0
	signpost 15, 21, SIGNPOST_ITEM, MapRockTunnel1FSignpostItem1

.PersonEvents:
	db 2
	person_event SPRITE_POKE_BALL, 22, 8, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x743b5, EVENT_ROCK_TUNNEL_1F_ELIXER
	person_event SPRITE_POKE_BALL, 19, 14, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x743b7, EVENT_ROCK_TUNNEL_1F_TM_STEEL_WING
