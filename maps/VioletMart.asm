VioletMart_MapScriptHeader: ; 0x68293
	; trigger count
	db 0

	; callback count
	db 0
; 0x68295

ClerkScript_0x68295: ; 0x68295
	loadfont
	pokemart $0, $0002
	loadmovesprites
	end
; 0x6829c

GrannyScript_0x6829c: ; 0x6829c
	jumptextfaceplayer UnknownText_0x682a2
; 0x6829f

CooltrainerMScript_0x6829f: ; 0x6829f
	jumptextfaceplayer UnknownText_0x68323
; 0x682a2

UnknownText_0x682a2: ; 0x682a2
	text "When you first"
	line "catch a #MON,"
	cont "it may be weak."

	para "But it will even-"
	line "tually grow to be"
	cont "strong."

	para "It's important to"
	line "treat #MON with"
	cont "love."
	done
; 0x68323

UnknownText_0x68323: ; 0x68323
	text "#MON can hold"
	line "items like POTION"
	cont "and ANTIDOTE."

	para "But they don't"
	line "appear to know how"

	para "to use manmade"
	line "items."
	done
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
	person_event SPRITE_CLERK, 7, 5, $9, $0, 255, 255, $0, 0, ClerkScript_0x68295, $ffff
	person_event SPRITE_GRANNY, 10, 11, $5, $1, 255, 255, $0, 0, GrannyScript_0x6829c, $ffff
	person_event SPRITE_COOLTRAINER_M, 6, 9, $3, $0, 255, 255, $80, 0, CooltrainerMScript_0x6829f, $ffff
; 0x683c0

