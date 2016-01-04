const_value set 2
	const WHIRLISLANDB2F_POKE_BALL1
	const WHIRLISLANDB2F_POKE_BALL2
	const WHIRLISLANDB2F_POKE_BALL3

WhirlIslandB2F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

WhirlIslandB2FFullRestore:
	itemball FULL_RESTORE

WhirlIslandB2FMaxRevive:
	itemball MAX_REVIVE

WhirlIslandB2FMaxElixer:
	itemball MAX_ELIXER

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
	person_event SPRITE_POKE_BALL, 11, 10, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FFullRestore, EVENT_WHIRL_ISLAND_B2F_FULL_RESTORE
	person_event SPRITE_POKE_BALL, 4, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FMaxRevive, EVENT_WHIRL_ISLAND_B2F_MAX_REVIVE
	person_event SPRITE_POKE_BALL, 12, 5, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, WhirlIslandB2FMaxElixer, EVENT_WHIRL_ISLAND_B2F_MAX_ELIXER
