BlackthornPokeCenter1F_MapScriptHeader: ; 0x195b77
	; trigger count
	db 0

	; callback count
	db 0
; 0x195b79

UnknownScript_0x195b79: ; 0x195b79
	jumpstd $0000
; 0x195b7c

UnknownScript_0x195b7c: ; 0x195b7c
	jumptextfaceplayer UnknownText_0x195b85
; 0x195b7f

UnknownScript_0x195b7f: ; 0x195b7f
	jumptextfaceplayer UnknownText_0x195bfd
; 0x195b82

UnknownScript_0x195b82: ; 0x195b82
	jumpstd $0033
; 0x195b85

UnknownText_0x195b85: ; 0x195b85
	db $0, "Deep inside far-", $4f
	db "off INDIGO PLATEAU", $51
	db "is the #MON", $4f
	db "LEAGUE.", $51
	db "I hear the best", $4f
	db "trainers gather", $51
	db "there from around", $4f
	db "the country.", $57
; 0x195bfd

UnknownText_0x195bfd: ; 0x195bfd
	db $0, "There was this", $4f
	db "move I just had", $51
	db "to teach my #-", $4f
	db "MON.", $51
	db "So I got the MOVE", $4f
	db "DELETER to make it", $55
	db "forget an HM move.", $57
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
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x195b79, $ffff
	person_event $40, 7, 9, $6, $0, 255, 255, $0, 0, UnknownScript_0x195b7c, $ffff
	person_event $26, 8, 5, $3, $0, 255, 255, $a0, 0, UnknownScript_0x195b7f, $ffff
	person_event $23, 10, 11, $5, $1, 255, 255, $80, 0, UnknownScript_0x195b82, $ffff
; 0x195cb2

