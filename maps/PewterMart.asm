PewterMart_MapScriptHeader: ; 0x1a2dc9
	; trigger count
	db 0

	; callback count
	db 0
; 0x1a2dcb

ClerkScript_0x1a2dcb: ; 0x1a2dcb
	loadfont
	pokemart $0, $0013
	loadmovesprites
	end
; 0x1a2dd2

YoungsterScript_0x1a2dd2: ; 0x1a2dd2
	jumptextfaceplayer UnknownText_0x1a2dd8
; 0x1a2dd5

SuperNerdScript_0x1a2dd5: ; 0x1a2dd5
	jumptextfaceplayer UnknownText_0x1a2e3a
; 0x1a2dd8

UnknownText_0x1a2dd8: ; 0x1a2dd8
	db $0, "Hi! Check out my", $4f
	db "GYARADOS!", $51
	db "I raised it from a", $4f
	db "MAGIKARP. I can't", $51
	db "believe how strong", $4f
	db "it has become.", $57
; 0x1a2e3a

UnknownText_0x1a2e3a: ; 0x1a2e3a
	db $0, "There once was a", $4f
	db "weird old man who", $55
	db "sold MAGIKARP.", $51
	db "He was saying the", $4f
	db "MAGIKARP from the", $51
	db "LAKE OF RAGE were", $4f
	db "excellent.", $57
; 0x1a2eae

PewterMart_MapEventHeader: ; 0x1a2eae
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 3, GROUP_PEWTER_CITY, MAP_PEWTER_CITY
	warp_def $7, $3, 3, GROUP_PEWTER_CITY, MAP_PEWTER_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x1a2dcb, $ffff
	person_event SPRITE_YOUNGSTER, 6, 13, $5, $2, 255, 255, $0, 0, YoungsterScript_0x1a2dd2, $ffff
	person_event SPRITE_SUPER_NERD, 10, 10, $3, $0, 255, 255, $80, 0, SuperNerdScript_0x1a2dd5, $ffff
; 0x1a2ee5

