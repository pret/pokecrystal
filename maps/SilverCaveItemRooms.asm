SilverCaveItemRooms_MapScriptHeader: ; 0x18c65c
	; trigger count
	db 0

	; callback count
	db 0
; 0x18c65e

ItemFragment_0x18c65e: ; 0x18c65e
	db MAX_REVIVE, 1
; 0x18c660

ItemFragment_0x18c660: ; 0x18c660
	db FULL_RESTORE, 1
; 0x18c662

SilverCaveItemRooms_MapEventHeader: ; 0x18c662
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $3, $d, 3, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2
	warp_def $f, $7, 4, GROUP_SILVER_CAVE_ROOM_2, MAP_SILVER_CAVE_ROOM_2

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 7, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c65e, $069c
	person_event SPRITE_POKE_BALL, 15, 19, $1, $0, 255, 255, $1, 0, ItemFragment_0x18c660, $069d
; 0x18c68c

