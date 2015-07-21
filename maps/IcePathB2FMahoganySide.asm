IcePathB2FMahoganySide_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

BoulderScript_0x7e5a3:
	jumptext UnknownText_0x7e5ad

ItemFragment_0x7e5a6:
	db FULL_HEAL, 1

ItemFragment_0x7e5a8:
	db MAX_POTION, 1

MapIcePathB2FMahoganySideSignpostItem0:
	dwb EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_HIDDEN_CARBOS, CARBOS
	

UnknownText_0x7e5ad:
	text "It's immovably"
	line "imbedded in ice."
	done

IcePathB2FMahoganySide_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $1, $11, 2, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $b, $9, 1, GROUP_ICE_PATH_B3F, MAP_ICE_PATH_B3F
	warp_def $4, $b, 3, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $6, $4, 4, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $c, $4, 5, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F
	warp_def $c, $c, 6, GROUP_ICE_PATH_B1F, MAP_ICE_PATH_B1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 17, 0, SIGNPOST_ITEM, MapIcePathB2FMahoganySideSignpostItem0

.PersonEvents:
	db 6
	person_event SPRITE_BOULDER, 7, 15, OW_DOWN | $1, $0, -1, -1, $0, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_1A
	person_event SPRITE_BOULDER, 11, 8, OW_DOWN | $1, $0, -1, -1, $0, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_2A
	person_event SPRITE_BOULDER, 16, 7, OW_DOWN | $1, $0, -1, -1, $0, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_3A
	person_event SPRITE_BOULDER, 17, 16, OW_DOWN | $1, $0, -1, -1, $0, 0, BoulderScript_0x7e5a3, EVENT_BOULDER_IN_ICE_PATH_4A
	person_event SPRITE_POKE_BALL, 13, 12, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e5a6, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_FULL_HEAL
	person_event SPRITE_POKE_BALL, 6, 4, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7e5a8, EVENT_ICE_PATH_B2F_MAHOGANY_SIDE_MAX_POTION
