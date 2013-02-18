SilverCavePokeCenter1F_MapScriptHeader: ; 0x1ae598
	; trigger count
	db 0

	; callback count
	db 0
; 0x1ae59a

UnknownScript_0x1ae59a: ; 0x1ae59a
	jumpstd $0000
; 0x1ae59d

UnknownScript_0x1ae59d: ; 0x1ae59d
	jumptextfaceplayer UnknownText_0x1ae5a0
; 0x1ae5a0

UnknownText_0x1ae5a0: ; 0x1ae5a0
	db $0, "Trainers who seek", $4f
	db "power climb MT.", $51
	db "SILVER despite its", $4f
	db "many dangers…", $51
	db "With their trusted", $4f
	db "#MON, they must", $51
	db "feel they can go", $4f
	db "anywhere…", $57
; 0x1ae622

SilverCavePokeCenter1F_MapEventHeader: ; 0x1ae622
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $4, 1, GROUP_SILVER_CAVE_OUTSIDE, MAP_SILVER_CAVE_OUTSIDE
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x1ae59a, $ffff
	person_event $30, 9, 5, $8, $12, 255, 255, $0, 0, UnknownScript_0x1ae59d, $ffff
; 0x1ae651

