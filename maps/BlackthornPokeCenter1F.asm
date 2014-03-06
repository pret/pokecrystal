BlackthornPokeCenter1F_MapScriptHeader: ; 0x195b77
	; trigger count
	db 0

	; callback count
	db 0
; 0x195b79

NurseScript_0x195b79: ; 0x195b79
	jumpstd $0000
; 0x195b7c

GentlemanScript_0x195b7c: ; 0x195b7c
	jumptextfaceplayer UnknownText_0x195b85
; 0x195b7f

TwinScript_0x195b7f: ; 0x195b7f
	jumptextfaceplayer UnknownText_0x195bfd
; 0x195b82

CooltrainerMScript_0x195b82: ; 0x195b82
	jumpstd $0033
; 0x195b85

UnknownText_0x195b85: ; 0x195b85
	text "Deep inside far-"
	line "off INDIGO PLATEAU"

	para "is the #MON"
	line "LEAGUE."

	para "I hear the best"
	line "trainers gather"

	para "there from around"
	line "the country."
	done
; 0x195bfd

UnknownText_0x195bfd: ; 0x195bfd
	text "There was this"
	line "move I just had"

	para "to teach my #-"
	line "MON."

	para "So I got the MOVE"
	line "DELETER to make it"
	cont "forget an HM move."
	done
; 0x195c69

BlackthornPokeCenter1F_MapEventHeader: ; 0x195c69
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 5, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $4, 5, GROUP_BLACKTHORN_CITY, MAP_BLACKTHORN_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x195b79, $ffff
	person_event SPRITE_GENTLEMAN, 7, 9, $6, $0, 255, 255, $0, 0, GentlemanScript_0x195b7c, $ffff
	person_event SPRITE_TWIN, 8, 5, $3, $0, 255, 255, $a0, 0, TwinScript_0x195b7f, $ffff
	person_event SPRITE_COOLTRAINER_M, 10, 11, $5, $1, 255, 255, $80, 0, CooltrainerMScript_0x195b82, $ffff
; 0x195cb2

