VioletMart_MapScriptHeader: ; 0x68293
	; trigger count
	db 0

	; callback count
	db 0
; 0x68295

UnknownScript_0x68295: ; 0x68295
	loadfont
	pokemart $0, $0002
	loadmovesprites
	end
; 0x6829c

UnknownScript_0x6829c: ; 0x6829c
	jumptextfaceplayer UnknownText_0x682a2
; 0x6829f

UnknownScript_0x6829f: ; 0x6829f
	jumptextfaceplayer UnknownText_0x68323
; 0x682a2

UnknownText_0x682a2: ; 0x682a2
	db $0, "When you first", $4f
	db "catch a #MON,", $55
	db "it may be weak.", $51
	db "But it will even-", $4f
	db "tually grow to be", $55
	db "strong.", $51
	db "It's important to", $4f
	db "treat #MON with", $55
	db "love.", $57
; 0x68323

UnknownText_0x68323: ; 0x68323
	db $0, "#MON can hold", $4f
	db "items like POTION", $55
	db "and ANTIDOTE.", $51
	db "But they don't", $4f
	db "appear to know how", $51
	db "to use manmade", $4f
	db "items.", $57
; 0x68389

VioletMart_MapEventHeader: ; 0x68389
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $7, $2, 1, GROUP_VIOLET_CITY, MAP_VIOLET_CITY
	warp_def $7, $3, 1, GROUP_VIOLET_CITY, MAP_VIOLET_CITY

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 3
	person_event $39, 7, 5, $9, $0, 255, 255, $0, 0, UnknownScript_0x68295, $ffff
	person_event $30, 10, 11, $5, $1, 255, 255, $0, 0, UnknownScript_0x6829c, $ffff
	person_event $23, 6, 9, $3, $0, 255, 255, $80, 0, UnknownScript_0x6829f, $ffff
; 0x683c0

