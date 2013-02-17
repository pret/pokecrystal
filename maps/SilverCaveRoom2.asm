SilverCaveRoom2_MapScriptHeader: ; 0x18c5b0
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c5b2

ItemFragment_0x18c5b2: ; 0x18c5b2
	db CALCIUM, 1
; 0x18c5b4

ItemFragment_0x18c5b4: ; 0x18c5b4
	db ULTRA_BALL, 1
; 0x18c5b6

ItemFragment_0x18c5b6: ; 0x18c5b6
	db PP_UP, 1
; 0x18c5b8

MapSilverCaveRoom2SignpostItem0: ; 0x18c5b8
	dw $009c
	db MAX_POTION
	
; 0x18c5bb

SilverCaveRoom2_MapEventHeader: ; 0x18c5bb
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $1f, $11, 2, GROUP_SILVER_CAVE_ROOM_1, MAP_SILVER_CAVE_ROOM_1
	warp_def $5, $b, 1, GROUP_SILVER_CAVE_ROOM_3, MAP_SILVER_CAVE_ROOM_3
	warp_def $15, $d, 1, GROUP_SILVER_CAVE_ITEM_ROOMS, MAP_SILVER_CAVE_ITEM_ROOMS
	warp_def $3, $17, 2, GROUP_SILVER_CAVE_ITEM_ROOMS, MAP_SILVER_CAVE_ITEM_ROOMS

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 31, 14, $7, MapSilverCaveRoom2SignpostItem0

	; people-events
	db 3
	person_event $54, 14, 28, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c5b2, $07c2
	person_event $54, 28, 26, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c5b4, $07c3
	person_event $54, 24, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c5b6, $07c4
; 0x18c601

