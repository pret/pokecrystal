CeruleanMart_MapScriptHeader: ; 0x188abe
	; trigger count
	db 0

	; callback count
	db 0
; 0x188ac0

ClerkScript_0x188ac0: ; 0x188ac0
	loadfont
	pokemart $0, $0014
	loadmovesprites
	end
; 0x188ac7

CooltrainerMScript_0x188ac7: ; 0x188ac7
	jumptextfaceplayer UnknownText_0x188acd
; 0x188aca

CooltrainerFScript_0x188aca: ; 0x188aca
	jumptextfaceplayer UnknownText_0x188b46
; 0x188acd

UnknownText_0x188acd: ; 0x188acd
	db $0, "You'll run into", $4f
	db "many trainers on", $51
	db "the way to CERU-", $4f
	db "LEAN's CAPE.", $51
	db "They want to see", $4f
	db "how they stack", $51
	db "up against other", $4f
	db "trainers.", $57
; 0x188b46

UnknownText_0x188b46: ; 0x188b46
	db $0, "MISTY is about the", $4f
	db "only person in", $51
	db "town who can beat", $4f
	db "the trainers at", $55
	db "CERULEAN's CAPE.", $57
; 0x188b9b

CeruleanMart_MapEventHeader: ; 0x188b9b
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 6, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY
	warp_def $7, $3, 6, GROUP_CERULEAN_CITY, MAP_CERULEAN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x188ac0, $ffff
	person_event SPRITE_COOLTRAINER_M, 10, 5, $6, $0, 255, 255, $a0, 0, CooltrainerMScript_0x188ac7, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 11, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x188aca, $ffff
; 0x188bd2

