CherrygrovePokeCenter1F_MapScriptHeader: ; 0x19696b
	; trigger count
	db 0

	; callback count
	db 0
; 0x19696d

NurseScript_0x19696d: ; 0x19696d
	jumpstd $0000
; 0x196970

FisherScript_0x196970: ; 0x196970
	jumptextfaceplayer UnknownText_0x19698a
; 0x196973

GentlemanScript_0x196973: ; 0x196973
	jumptextfaceplayer UnknownText_0x1969c8
; 0x196976

TeacherScript_0x196976: ; 0x196976
	faceplayer
	loadfont
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
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
	text "It's great. I can"
	line "store any number"

	para "of #MON, and"
	line "it's all free."
	done
; 0x1969c8

UnknownText_0x1969c8: ; 0x1969c8
	text "That PC is free"
	line "for any trainer"
	cont "to use."
	done
; 0x1969f1

UnknownText_0x1969f1: ; 0x1969f1
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "But they're still"
	line "finishing it up."
	done
; 0x196a46

UnknownText_0x196a46: ; 0x196a46
	text "The COMMUNICATION"
	line "CENTER upstairs"
	cont "was just built."

	para "I traded #MON"
	line "there already!"
	done
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
	person_event SPRITE_NURSE, 5, 7, $6, $0, 255, 255, $0, 0, NurseScript_0x19696d, $ffff
	person_event SPRITE_FISHER, 7, 6, $7, $0, 255, 255, $80, 0, FisherScript_0x196970, $ffff
	person_event SPRITE_GENTLEMAN, 10, 12, $7, $0, 255, 255, $0, 0, GentlemanScript_0x196973, $ffff
	person_event SPRITE_TEACHER, 10, 5, $9, $0, 255, 255, $a0, 0, TeacherScript_0x196976, $ffff
; 0x196adf

