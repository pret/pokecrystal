CeladonDeptStore1F_MapScriptHeader: ; 0x709de
	; trigger count
	db 0

	; callback count
	db 0
; 0x709e0

ReceptionistScript_0x709e0: ; 0x709e0
	jumptextfaceplayer UnknownText_0x709ef
; 0x709e3

GentlemanScript_0x709e3: ; 0x709e3
	jumptextfaceplayer UnknownText_0x70a35
; 0x709e6

TeacherScript_0x709e6: ; 0x709e6
	jumptextfaceplayer UnknownText_0x70aa9
; 0x709e9

MapCeladonDeptStore1FSignpost0Script: ; 0x709e9
	jumptext UnknownText_0x70aea
; 0x709ec

MapCeladonDeptStore6FSignpost1Script: ; 0x709ec
	jumpstd elevatorbutton
; 0x709ef

UnknownText_0x709ef: ; 0x709ef
	text "Hello! Welcome to"
	line "CELADON DEPT."
	cont "STORE!"

	para "The directory is"
	line "on the wall."
	done
; 0x70a35

UnknownText_0x70a35: ; 0x70a35
	text "This DEPT.STORE is"
	line "part of the same"

	para "chain as the one"
	line "in GOLDENROD CITY."

	para "They were both"
	line "renovated at the"
	cont "same time."
	done
; 0x70aa9

UnknownText_0x70aa9: ; 0x70aa9
	text "This is my first"
	line "time here."

	para "It's so big…"

	para "I'm afraid I'll"
	line "get lost."
	done
; 0x70aea

UnknownText_0x70aea: ; 0x70aea
	text "1F: SERVICE"
	line "    COUNTER"

	para "2F: TRAINER'S"
	line "    MARKET"

	para "3F: TM SHOP"

	para "4F: WISEMAN GIFTS"

	para "5F: DRUG STORE"

	para "6F: ROOFTOP"
	line "    SQUARE"
	done
; 0x70b60

CeladonDeptStore1F_MapEventHeader: ; 0x70b60
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $7, $7, 1, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $7, $8, 1, GROUP_CELADON_CITY, MAP_CELADON_CITY
	warp_def $0, $f, 2, GROUP_CELADON_DEPT_STORE_2F, MAP_CELADON_DEPT_STORE_2F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore1FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore6FSignpost1Script

	; people-events
	db 3
	person_event SPRITE_RECEPTIONIST, 5, 14, $6, $0, 255, 255, $80, 0, ReceptionistScript_0x709e0, $ffff
	person_event SPRITE_GENTLEMAN, 8, 15, $2, $11, 255, 255, $0, 0, GentlemanScript_0x709e3, $ffff
	person_event SPRITE_TEACHER, 7, 9, $5, $1, 255, 255, $a0, 0, TeacherScript_0x709e6, $ffff
; 0x70bab
