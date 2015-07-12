RockTunnel1F_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

ItemFragment_0x743b5:
	db ELIXER, 1

ItemFragment_0x743b7:
	db TM_STEEL_WING, 1

MapRockTunnel1FSignpostItem0:
	dw $00e7
	db X_ACCURACY
	

MapRockTunnel1FSignpostItem1:
	dw $00e8
	db X_DEFEND
	

RockTunnel1F_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 6
	warp_def $3, $f, 1, GROUP_ROUTE_9, MAP_ROUTE_9
	warp_def $19, $b, 1, GROUP_ROUTE_10_SOUTH, MAP_ROUTE_10_SOUTH
	warp_def $3, $5, 3, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $9, $f, 2, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $3, $1b, 4, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F
	warp_def $d, $1b, 1, GROUP_ROCK_TUNNEL_B1F, MAP_ROCK_TUNNEL_B1F

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 4, 24, $7, MapRockTunnel1FSignpostItem0
	signpost 15, 21, $7, MapRockTunnel1FSignpostItem1

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 22, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x743b5, EVENT_77E
	person_event SPRITE_POKE_BALL, 19, 14, $1, $0, 255, 255, $1, 0, ItemFragment_0x743b7, EVENT_77F
