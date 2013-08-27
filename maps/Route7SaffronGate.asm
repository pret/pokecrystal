Route7SaffronGate_MapScriptHeader: ; 0x73516
	; trigger count
	db 0

	; callback count
	db 0
; 0x73518

OfficerScript_0x73518: ; 0x73518
	faceplayer
	loadfont
	checkbit1 $00c9
	iftrue UnknownScript_0x73526
	2writetext UnknownText_0x7352c
	closetext
	loadmovesprites
	end
; 0x73526

UnknownScript_0x73526: ; 0x73526
	2writetext UnknownText_0x73592
	closetext
	loadmovesprites
	end
; 0x7352c

UnknownText_0x7352c: ; 0x7352c
	db $0, "Did you hear about", $4f
	db "the accident at", $55
	db "the POWER PLANT?", $51
	db "It's located in", $4f
	db "the East, close to", $55
	db "LAVENDER TOWN.", $57
; 0x73592

UnknownText_0x73592: ; 0x73592
	db $0, "I take my GUARD", $4f
	db "job seriously.", $51
	db "Hey! You have a", $4f
	db "#DEX.", $51
	db "OK. You can go", $4f
	db "through.", $57
; 0x735e0

Route7SaffronGate_MapEventHeader: ; 0x735e0
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $4, $0, 1, GROUP_ROUTE_7, MAP_ROUTE_7
	warp_def $5, $0, 2, GROUP_ROUTE_7, MAP_ROUTE_7
	warp_def $4, $9, 10, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY
	warp_def $5, $9, 11, GROUP_SAFFRON_CITY, MAP_SAFFRON_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 1
	person_event SPRITE_OFFICER, 6, 9, $6, $0, 255, 255, $90, 0, OfficerScript_0x73518, $ffff
; 0x73607

