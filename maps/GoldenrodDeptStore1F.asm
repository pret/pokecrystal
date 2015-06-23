GoldenrodDeptStore1F_MapScriptHeader: ; 0x5597f
	; trigger count
	db 0

	; callback count
	db 0
; 0x55981

ReceptionistScript_0x55981: ; 0x55981
	jumptextfaceplayer UnknownText_0x55993
; 0x55984

GentlemanScript_0x55984: ; 0x55984
	jumptextfaceplayer UnknownText_0x559b7
; 0x55987

PokefanFScript_0x55987: ; 0x55987
	jumptextfaceplayer UnknownText_0x55a1a
; 0x5598a

BugCatcherScript_0x5598a: ; 0x5598a
	jumptextfaceplayer UnknownText_0x55a3a
; 0x5598d

MapGoldenrodDeptStore1FSignpost0Script: ; 0x5598d
	jumptext UnknownText_0x55a80
; 0x55990

MapGoldenrodDeptStore1FSignpost1Script: ; 0x55990
	jumpstd $0014
; 0x55993

UnknownText_0x55993: ; 0x55993
	text "Welcome to GOLDEN-"
	line "ROD DEPT.STORE."
	done
; 0x559b7

UnknownText_0x559b7: ; 0x559b7
	text "The DEPT.STORE"
	line "has a decent se-"
	cont "lection."

	para "But some items"
	line "are only available"

	para "as GAME CORNER"
	line "prizes."
	done
; 0x55a1a

UnknownText_0x55a1a: ; 0x55a1a
	text "I'm raring to shop"
	line "again today!"
	done
; 0x55a3a

UnknownText_0x55a3a: ; 0x55a3a
	text "Mom's good at"
	line "bargain hunting."

	para "She always buys"
	line "stuff at lower"
	cont "prices."
	done
; 0x55a80

UnknownText_0x55a80: ; 0x55a80
	text "1F SERVICE COUNTER"

	para "2F TRAINER'S"
	line "   MARKET"

	para "3F BATTLE"
	line "   COLLECTION"

	para "4F MEDICINE BOX"

	para "5F TM CORNER"

	para "6F TRANQUIL SQUARE"

	para "ROOFTOP LOOKOUT"
	done
; 0x55b03

GoldenrodDeptStore1F_MapEventHeader: ; 0x55b03
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $7, $7, 9, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $7, $8, 9, GROUP_GOLDENROD_CITY, MAP_GOLDENROD_CITY
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_2F, MAP_GOLDENROD_DEPT_STORE_2F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore1FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore1FSignpost1Script

	; people-events
	db 4
	person_event SPRITE_RECEPTIONIST, 5, 14, $6, $0, 255, 255, $0, 0, ReceptionistScript_0x55981, $ffff
	person_event SPRITE_POKEFAN_F, 8, 9, $6, $0, 255, 255, $0, 0, PokefanFScript_0x55987, $ffff
	person_event SPRITE_BUG_CATCHER, 9, 9, $5, $1, 255, 255, $a0, 0, BugCatcherScript_0x5598a, $ffff
	person_event SPRITE_GENTLEMAN, 9, 15, $2, $11, 255, 255, $0, 0, GentlemanScript_0x55984, $ffff
; 0x55b5b
