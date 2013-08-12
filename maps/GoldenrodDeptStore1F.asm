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
	db $0, "Welcome to GOLDEN-", $4f
	db "ROD DEPT.STORE.", $57
; 0x559b7

UnknownText_0x559b7: ; 0x559b7
	db $0, "The DEPT.STORE", $4f
	db "has a decent se-", $55
	db "lection.", $51
	db "But some items", $4f
	db "are only available", $51
	db "as GAME CORNER", $4f
	db "prizes.", $57
; 0x55a1a

UnknownText_0x55a1a: ; 0x55a1a
	db $0, "I'm raring to shop", $4f
	db "again today!", $57
; 0x55a3a

UnknownText_0x55a3a: ; 0x55a3a
	db $0, "Mom's good at", $4f
	db "bargain hunting.", $51
	db "She always buys", $4f
	db "stuff at lower", $55
	db "prices.", $57
; 0x55a80

UnknownText_0x55a80: ; 0x55a80
	db $0, "1F SERVICE COUNTER", $51
	db "2F TRAINER'S", $4f
	db "   MARKET", $51
	db "3F BATTLE", $4f
	db "   COLLECTION", $51
	db "4F MEDICINE BOX", $51
	db "5F TM CORNER", $51
	db "6F TRANQUIL SQUARE", $51
	db "ROOFTOP LOOKOUT", $57
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

