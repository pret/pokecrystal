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
	warp_def $5, $b, 7, WHIRL_ISLAND_B1F
	warp_def $b, $7, 8, WHIRL_ISLAND_B1F
	warp_def $19, $7, 1, WHIRL_ISLAND_LUGIA_CHAMBER
	warp_def $1f, $d, 5, WHIRL_ISLAND_SW

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_POKE_BALL, 11, 10, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x18c4b8, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 4, 6, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x18c4ba, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 12, 5, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x18c4bc, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
