FuchsiaMart_MapScriptHeader: ; 0x195ce6
	; trigger count
	db 0

	; callback count
	db 0
; 0x195ce8

UnknownScript_0x195ce8: ; 0x195ce8
	loadfont
	pokemart $0, $001d
	loadmovesprites
	end
; 0x195cef

UnknownScript_0x195cef: ; 0x195cef
	jumptextfaceplayer UnknownText_0x195cf5
; 0x195cf2

UnknownScript_0x195cf2: ; 0x195cf2
	jumptextfaceplayer UnknownText_0x195d36
; 0x195cf5

UnknownText_0x195cf5: ; 0x195cf5
	db $0, "I was hoping to", $4f
	db "buy some SAFARI", $51
	db "ZONE souvenirs,", $4f
	db "but it's closed…", $57
; 0x195d36

UnknownText_0x195d36: ; 0x195d36
	db $0, "The SAFARI ZONE", $4f
	db "WARDEN's grand-", $55
	db "daughter lives in", $55
	db "town.", $57
; 0x195d6e

FuchsiaMart_MapEventHeader: ; 0x195d6e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY
	warp_def $7, $3, 1, GROUP_FUCHSIA_CITY, MAP_FUCHSIA_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event $39, 7, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x195ce8, $ffff
	person_event $3a, 6, 7, $8, $0, 255, 255, $80, 0, UnknownScript_0x195cef, $ffff
	person_event $24, 10, 11, $5, $2, 255, 255, $a0, 0, UnknownScript_0x195cf2, $ffff
; 0x195da5

