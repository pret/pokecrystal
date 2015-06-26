IcePathB3F_MapScriptHeader: ; 0x7e66d
	; trigger count
	db 0

	; callback count
	db 0
; 0x7e66f

ItemFragment_0x7e66f: ; 0x7e66f
	db NEVERMELTICE, 1
; 0x7e671

IcePathB3FRock:
	jumpstd smashrock

IcePathB3F_MapEventHeader: ; 0x7e674
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $5, $3, 2, GROUP_ICE_PATH_B2F_MAHOGANY_SIDE, MAP_ICE_PATH_B2F_MAHOGANY_SIDE
	warp_def $5, $f, 2, GROUP_ICE_PATH_B2F_BLACKTHORN_SIDE, MAP_ICE_PATH_B2F_BLACKTHORN_SIDE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_POKE_BALL, 11, 9, $1, $0, 255, 255, $1, 0, ItemFragment_0x7e66f, $068e
	person_event SPRITE_ROCK, 10, 10, $18, $0, 255, 255, $0, 0, IcePathB3FRock, $ffff
; 0x7e69e
