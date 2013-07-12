VermilionMart_MapScriptHeader: ; 0x191f7c
	; trigger count
	db 0

	; callback count
	db 0
; 0x191f7e

ClerkScript_0x191f7e: ; 0x191f7e
	loadfont
	pokemart $0, $0016
	loadmovesprites
	end
; 0x191f85

SuperNerdScript_0x191f85: ; 0x191f85
	jumptextfaceplayer UnknownText_0x191f8b
; 0x191f88

BuenaScript_0x191f88: ; 0x191f88
	jumptextfaceplayer UnknownText_0x191fca
; 0x191f8b

UnknownText_0x191f8b: ; 0x191f8b
	db $0, "TEAM ROCKET is no", $4f
	db "longer in KANTO.", $51
	db "That alone makes", $4f
	db "me happy.", $57
; 0x191fca

UnknownText_0x191fca: ; 0x191fca
	db $0, "I'm thinking about", $4f
	db "going shopping in", $55
	db "SAFFRON.", $57
; 0x191ff8

VermilionMart_MapEventHeader: ; 0x191ff8
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY
	warp_def $7, $3, 5, GROUP_VERMILION_CITY, MAP_VERMILION_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x191f7e, $ffff
	person_event SPRITE_SUPER_NERD, 6, 9, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x191f85, $ffff
	person_event SPRITE_BUENA, 10, 12, $5, $1, 255, 255, $a0, 0, BuenaScript_0x191f88, $ffff
; 0x19202f

