RockTunnelB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x74409:
	db IRON, 1

ItemFragment_0x7440b:
	db PP_UP, 1

ItemFragment_0x7440d:
	db REVIVE, 1

MapRockTunnelB1FSignpostItem0:
	dwb EVENT_ROCK_TUNNEL_B1F_HIDDEN_MAX_POTION, MAX_POTION
	

RockTunnelB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $3, $3, 6, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $9, $11, 4, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $3, $17, 3, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $17, $19, 5, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 14, 4, SIGNPOST_ITEM, MapRockTunnelB1FSignpostItem0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 29, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x74409, EVENT_ROCK_TUNNEL_B1F_IRON
	person_event SPRITE_POKE_BALL, 21, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7440b, EVENT_ROCK_TUNNEL_B1F_PP_UP
	person_event SPRITE_POKE_BALL, 6, 19, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7440d, EVENT_ROCK_TUNNEL_B1F_REVIVE
