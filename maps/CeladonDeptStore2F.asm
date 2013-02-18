CeladonDeptStore2F_MapScriptHeader: ; 0x70bab
	; trigger count
	db 0

	; callback count
	db 0
; 0x70bad

UnknownScript_0x70bad: ; 0x70bad
	faceplayer
	loadfont
	pokemart $0, $0017
	loadmovesprites
	end
; 0x70bb5

UnknownScript_0x70bb5: ; 0x70bb5
	faceplayer
	loadfont
	pokemart $0, $0018
	loadmovesprites
	end
; 0x70bbd

UnknownScript_0x70bbd: ; 0x70bbd
	jumptextfaceplayer UnknownText_0x70bc9
; 0x70bc0

UnknownScript_0x70bc0: ; 0x70bc0
	jumptextfaceplayer UnknownText_0x70c3e
; 0x70bc3

MapCeladonDeptStore2FSignpost0Script: ; 0x70bc3
	jumptext UnknownText_0x70c9c
; 0x70bc6

MapCeladonDeptStore2FSignpost1Script: ; 0x70bc6
	jumpstd $0014
; 0x70bc9

UnknownText_0x70bc9: ; 0x70bc9
	db $0, "I just recently", $4f
	db "became a trainer.", $51
	db "My son encouraged", $4f
	db "me to do it.", $51
	db "I'm impressed by", $4f
	db "the selection of", $55
	db "convenient items.", $57
; 0x70c3e

UnknownText_0x70c3e: ; 0x70c3e
	db $0, "My dad's having a", $4f
	db "hard time learning", $51
	db "the names of items", $4f
	db "and how they are", $51
	db "supposed to be", $4f
	db "used…", $57
; 0x70c9c

UnknownText_0x70c9c: ; 0x70c9c
	db $0, "Top Grade Items", $4f
	db "for Trainers!", $51
	db "2F: TRAINER'S", $4f
	db "    MARKET", $57
; 0x70cd4

CeladonDeptStore2F_MapEventHeader: ; 0x70cd4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	warp_def $0, $f, 3, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore2FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore2FSignpost1Script

	; people-events
	db 4
	person_event $39, 9, 17, $7, $0, 255, 255, $90, 0, UnknownScript_0x70bad, $ffff
	person_event $39, 9, 18, $7, $0, 255, 255, $90, 0, UnknownScript_0x70bb5, $ffff
	person_event $2d, 6, 9, $7, $0, 255, 255, $80, 0, UnknownScript_0x70bbd, $ffff
	person_event $27, 6, 10, $8, $0, 255, 255, $a0, 0, UnknownScript_0x70bc0, $ffff
; 0x70d27

