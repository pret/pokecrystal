SilverCaveRoom1_MapScriptHeader: ; 0x18c552
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c554

ItemFragment_0x18c554: ; 0x18c554
	db MAX_ELIXER, 1
; 0x18c556

ItemFragment_0x18c556: ; 0x18c556
	db PROTEIN, 1
; 0x18c558

ItemFragment_0x18c558: ; 0x18c558
	db ESCAPE_ROPE, 1
; 0x18c55a

ItemFragment_0x18c55a: ; 0x18c55a
	db ULTRA_BALL, 1
; 0x18c55c

MapSilverCaveRoom1SignpostItem0: ; 0x18c55c
	dw $009a
	db DIRE_HIT
	
; 0x18c55f

MapSilverCaveRoom1SignpostItem1: ; 0x18c55f
	dw $009b
	db ULTRA_BALL
	
; 0x18c562

SilverCaveRoom1_MapEventHeader: ; 0x18c562
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $21, $9, 2, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $1, $f, 1, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 23, 16, $7, MapSilverCaveRoom1SignpostItem0
	signpost 12, 17, $7, MapSilverCaveRoom1SignpostItem1

	; people-events
	db 4
	person_event SPRITE_POKE_BALL, 13, 8, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c554, $0699
	person_event SPRITE_POKE_BALL, 33, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c556, $069a
	person_event SPRITE_POKE_BALL, 34, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c558, $069b
	person_event SPRITE_POKE_BALL, 22, 11, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c55a, $07c1
; 0x18c5b0

