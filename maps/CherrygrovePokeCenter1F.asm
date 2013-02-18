CherrygrovePokeCenter1F_MapScriptHeader: ; 0x19696b
	; trigger count
	db 0

	; callback count
	db 0
; 0x19696d

UnknownScript_0x19696d: ; 0x19696d
	jumpstd $0000
; 0x196970

UnknownScript_0x196970: ; 0x196970
	jumptextfaceplayer UnknownText_0x19698a
; 0x196973

UnknownScript_0x196973: ; 0x196973
	jumptextfaceplayer UnknownText_0x1969c8
; 0x196976

UnknownScript_0x196976: ; 0x196976
	faceplayer
	loadfont
	checkbit1 $001f
	iftrue UnknownScript_0x196984
	2writetext UnknownText_0x1969f1
	closetext
	loadmovesprites
	end
; 0x196984

UnknownScript_0x196984: ; 0x196984
	2writetext UnknownText_0x196a46
	closetext
	loadmovesprites
	end
; 0x19698a

UnknownText_0x19698a: ; 0x19698a
	db $0, "It's great. I can", $4f
	db "store any number", $51
	db "of #MON, and", $4f
	db "it's all free.", $57
; 0x1969c8

UnknownText_0x1969c8: ; 0x1969c8
	db $0, "That PC is free", $4f
	db "for any trainer", $55
	db "to use.", $57
; 0x1969f1

UnknownText_0x1969f1: ; 0x1969f1
	db $0, "The COMMUNICATION", $4f
	db "CENTER upstairs", $55
	db "was just built.", $51
	db "But they're still", $4f
	db "finishing it up.", $57
; 0x196a46

UnknownText_0x196a46: ; 0x196a46
	db $0, "The COMMUNICATION", $4f
	db "CENTER upstairs", $55
	db "was just built.", $51
	db "I traded #MON", $4f
	db "there already!", $57
; 0x196a96

CherrygrovePokeCenter1F_MapEventHeader: ; 0x196a96
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $7, $3, 2, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $4, 2, GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	warp_def $7, $0, 1, GROUP_POKECENTER_2F, MAP_POKECENTER_2F

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 4
	person_event $37, 5, 7, $6, $0, 255, 255, $0, 0, UnknownScript_0x19696d, $ffff
	person_event $3a, 7, 6, $7, $0, 255, 255, $80, 0, UnknownScript_0x196970, $ffff
	person_event $40, 10, 12, $7, $0, 255, 255, $0, 0, UnknownScript_0x196973, $ffff
	person_event $29, 10, 5, $9, $0, 255, 255, $a0, 0, UnknownScript_0x196976, $ffff
; 0x196adf

