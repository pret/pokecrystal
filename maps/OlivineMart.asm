OlivineMart_MapScriptHeader: ; 0x9cac5
	; trigger count
	db 0

	; callback count
	db 0
; 0x9cac7

ClerkScript_0x9cac7: ; 0x9cac7
	loadfont
	pokemart $0, $000d
	loadmovesprites
	end
; 0x9cace

CooltrainerFScript_0x9cace: ; 0x9cace
	jumptextfaceplayer UnknownText_0x9cad4
; 0x9cad1

LassScript_0x9cad1: ; 0x9cad1
	jumptextfaceplayer UnknownText_0x9cb16
; 0x9cad4

UnknownText_0x9cad4: ; 0x9cad4
	db $0, "Do your #MON", $4f
	db "already know the", $51
	db "move for carrying", $4f
	db "people on water?", $57
; 0x9cb16

UnknownText_0x9cb16: ; 0x9cb16
	db $0, "My BUTTERFREE came", $4f
	db "from my boyfriend", $55
	db "overseas.", $51
	db "It carried some", $4f
	db "MAIL from him.", $51
	db "Want to know what", $4f
	db "it says?", $51
	db "Let's see… Nope!", $4f
	db "It's a secret!", $57
; 0x9cb9e

OlivineMart_MapEventHeader: ; 0x9cb9e
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 8, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY
	warp_def $7, $3, 8, GROUP_OLIVINE_CITY, MAP_OLIVINE_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x9cac7, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 10, $5, $2, 255, 255, $a0, 0, CooltrainerFScript_0x9cace, $ffff
	person_event SPRITE_LASS, 10, 5, $8, $0, 255, 255, $0, 0, LassScript_0x9cad1, $ffff
; 0x9cbd5

