Route5SaffronCityGate_MapScriptHeader: ; 0x18b5b7
	; trigger count
	db 0

	; callback count
	db 0
; 0x18b5b9

UnknownScript_0x18b5b9: ; 0x18b5b9
	jumptextfaceplayer UnknownText_0x18b5bc
; 0x18b5bc

UnknownText_0x18b5bc: ; 0x18b5bc
	db $0, "You're from JOHTO,", $4f
	db "aren't you?", $51
	db "How do you like", $4f
	db "KANTO? It's nice,", $55
	db "don't you agree?", $57
; 0x18b60b

Route5SaffronCityGate_MapEventHeader: ; 0x18b60b
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $0, $4, 2, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $0, $5, 3, GROUP_ROUTE_5, MAP_ROUTE_5
	warp_def $7, $4, 9, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $7, $5, 9, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event $43, 8, 4, $9, $0, 255, 255, $90, 0, UnknownScript_0x18b5b9, $ffff
; 0x18b632

