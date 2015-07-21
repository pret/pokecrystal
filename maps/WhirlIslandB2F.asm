WhirlIslandB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

ItemFragment_0x18c4b8:
	db FULL_RESTORE, 1

ItemFragment_0x18c4ba:
	db MAX_REVIVE, 1

ItemFragment_0x18c4bc:
	db MAX_ELIXER, 1

WhirlIslandB2F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $5, $b, 7, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $b, $7, 8, GROUP_WHIRL_ISLAND_B1F, MAP_WHIRL_ISLAND_B1F
	warp_def $19, $7, 1, GROUP_WHIRL_ISLAND_LUGIA_CHAMBER, MAP_WHIRL_ISLAND_LUGIA_CHAMBER
	warp_def $1f, $d, 5, GROUP_WHIRL_ISLAND_SW, MAP_WHIRL_ISLAND_SW

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 15, 14, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c4b8, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 8, 10, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c4ba, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 16, 9, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x18c4bc, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
