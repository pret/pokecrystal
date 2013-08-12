BlackthornMart_MapScriptHeader: ; 0x195a5b
	; trigger count
	db 0

	; callback count
	db 0
; 0x195a5d

ClerkScript_0x195a5d: ; 0x195a5d
	loadfont
	pokemart $0, $0011
	loadmovesprites
	end
; 0x195a64

CooltrainerMScript_0x195a64: ; 0x195a64
	jumptextfaceplayer UnknownText_0x195a6a
; 0x195a67

BlackBeltScript_0x195a67: ; 0x195a67
	jumptextfaceplayer UnknownText_0x195ae9
; 0x195a6a

UnknownText_0x195a6a: ; 0x195a6a
	db $0, "You can't buy MAX", $4f
	db "REVIVE, but it", $51
	db "fully restores a", $4f
	db "fainted #MON.", $51
	db "Beware--it won't", $4f
	db "restore PP, the", $51
	db "POWER POINTS", $4f
	db "needed for moves.", $57
; 0x195ae9

UnknownText_0x195ae9: ; 0x195ae9
	db $0, "MAX REPEL keeps", $4f
	db "weak #MON away", $55
	db "from you.", $51
	db "It's the longest", $4f
	db "lasting of the", $55
	db "REPEL sprays.", $57
; 0x195b40

BlackthornMart_MapEventHeader: ; 0x195b40
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 4, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $3, 4, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x195a5d, $ffff
	person_event SPRITE_COOLTRAINER_M, 10, 11, $5, $2, 255, 255, $0, 0, CooltrainerMScript_0x195a64, $ffff
	person_event SPRITE_BLACK_BELT, 6, 9, $6, $0, 255, 255, $a0, 0, BlackBeltScript_0x195a67, $ffff
; 0x195b77

