RockTunnelB1F_MapScriptHeader: ; 0x74407
	; trigger count
	db 0

	; callback count
	db 0
; 0x74409

ItemFragment_0x74409: ; 0x74409
	db IRON, 1
; 0x7440b

ItemFragment_0x7440b: ; 0x7440b
	db PP_UP, 1
; 0x7440d

ItemFragment_0x7440d: ; 0x7440d
	db REVIVE, 1
; 0x7440f

MapRockTunnelB1FSignpostItem0: ; 0x7440f
	dw $00e9
	db MAX_POTION
	
; 0x74412

RockTunnelB1F_MapEventHeader: ; 0x74412
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $3, $3, 6, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $9, $11, 4, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $3, $17, 3, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F
	warp_def $17, $19, 5, GROUP_ROCK_TUNNEL_1F, MAP_ROCK_TUNNEL_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 14, 4, $7, MapRockTunnelB1FSignpostItem0

	; people-events
	db 3
	person_event SPRITE_POKE_BALL, 29, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x74409, $0780
	person_event SPRITE_POKE_BALL, 21, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x7440b, $0781
	person_event SPRITE_POKE_BALL, 6, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x7440d, $0782
; 0x74458
