ViridianMart_MapScriptHeader: ; 0x9b5e5
	; trigger count
	db 0

	; callback count
	db 0
; 0x9b5e7

UnknownScript_0x9b5e7: ; 0x9b5e7
	loadfont
	pokemart $0, $0012
	loadmovesprites
	end
; 0x9b5ee

UnknownScript_0x9b5ee: ; 0x9b5ee
	jumptextfaceplayer UnknownText_0x9b5f4
; 0x9b5f1

UnknownScript_0x9b5f1: ; 0x9b5f1
	jumptextfaceplayer UnknownText_0x9b61a
; 0x9b5f4

UnknownText_0x9b5f4: ; 0x9b5f4
	db $0, "The GYM LEADER", $4f
	db "here is totally", $55
	db "cool.", $57
; 0x9b61a

UnknownText_0x9b61a: ; 0x9b61a
	db $0, "Have you been to", $4f
	db "CINNABAR?", $51
	db "It's an island way", $4f
	db "south of here.", $57
; 0x9b657

ViridianMart_MapEventHeader: ; 0x9b657
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY
	warp_def $7, $3, 4, GROUP_VIRIDIAN_CITY, MAP_VIRIDIAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event $39, 7, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x9b5e7, $ffff
	person_event $28, 6, 11, $5, $2, 255, 255, $0, 0, UnknownScript_0x9b5ee, $ffff
	person_event $23, 10, 5, $7, $0, 255, 255, $0, 0, UnknownScript_0x9b5f1, $ffff
; 0x9b68e

