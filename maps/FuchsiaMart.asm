FuchsiaMart_MapScriptHeader: ; 0x195ce6
	; trigger count
	db 0

	; callback count
	db 0
; 0x195ce8

ClerkScript_0x195ce8: ; 0x195ce8
	loadfont
	pokemart $0, $001d
	loadmovesprites
	end
; 0x195cef

FisherScript_0x195cef: ; 0x195cef
	jumptextfaceplayer UnknownText_0x195cf5
; 0x195cf2

CooltrainerFScript_0x195cf2: ; 0x195cf2
	jumptextfaceplayer UnknownText_0x195d36
; 0x195cf5

UnknownText_0x195cf5: ; 0x195cf5
	text "I was hoping to"
	line "buy some SAFARI"

	para "ZONE souvenirs,"
	line "but it's closed…"
	done
; 0x195d36

UnknownText_0x195d36: ; 0x195d36
	text "The SAFARI ZONE"
	line "WARDEN's grand-"
	cont "daughter lives in"
	cont "town."
	done
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
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x195ce8, $ffff
	person_event SPRITE_FISHER, 6, 7, $8, $0, 255, 255, $80, 0, FisherScript_0x195cef, $ffff
	person_event SPRITE_COOLTRAINER_F, 10, 11, $5, $2, 255, 255, $a0, 0, CooltrainerFScript_0x195cf2, $ffff
; 0x195da5
