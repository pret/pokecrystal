GoldenrodDeptStore4F_MapScriptHeader: ; 0x55ee7
	; trigger count
	db 0

	; callback count
	db 0
; 0x55ee9

UnknownScript_0x55ee9: ; 0x55ee9
	faceplayer
	loadfont
	pokemart $0, $0008
	loadmovesprites
	end
; 0x55ef1

UnknownScript_0x55ef1: ; 0x55ef1
	jumptextfaceplayer UnknownText_0x55f08
; 0x55ef4

UnknownScript_0x55ef4: ; 0x55ef4
	jumptextfaceplayer UnknownText_0x55f52
; 0x55ef7

UnknownScript_0x55ef7: ; 0x55ef7
	faceplayer
	loadfont
	2writetext UnknownText_0x55f74
	closetext
	loadmovesprites
	spriteface $5, $0
	end
; 0x55f02

MapGoldenrodDeptStore4FSignpost0Script: ; 0x55f02
	jumptext UnknownText_0x5600d
; 0x55f05

MapGoldenrodDeptStore4FSignpost1Script: ; 0x55f05
	jumpstd $0014
; 0x55f08

UnknownText_0x55f08: ; 0x55f08
	db $0, "Hey. I love strong", $4f
	db "#MON.", $51
	db "I feed them PRO-", $4f
	db "TEIN to crank up", $55
	db "their ATTACK.", $57
; 0x55f52

UnknownText_0x55f52: ; 0x55f52
	db $0, "IRON adds to your", $4f
	db "#MON's DEFENSE.", $57
; 0x55f74

UnknownText_0x55f74: ; 0x55f74
	db $0, "Some #MON", $4f
	db "evolve only by", $51
	db "being traded via a", $4f
	db "Game Link cable.", $51
	db "I know of four:", $4f
	db "MACHOKE, KADABRA,", $51
	db "HAUNTER and, um,", $4f
	db "GRAVELER.", $51
	db "I heard there are", $4f
	db "others too.", $57
; 0x5600d

UnknownText_0x5600d: ; 0x5600d
	db $0, "Let Us Pump Up", $4f
	db "Your #MON!", $51
	db "4F MEDICINE BOX", $57
; 0x56038

GoldenrodDeptStore4F_MapEventHeader: ; 0x56038
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_5F, MAP_GOLDENROD_DEPT_STORE_5F
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_3F, MAP_GOLDENROD_DEPT_STORE_3F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore4FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore4FSignpost1Script

	; people-events
	db 4
	person_event $39, 9, 17, $7, $0, 255, 255, $0, 0, UnknownScript_0x55ee9, $ffff
	person_event $23, 11, 15, $9, $0, 255, 255, $0, 0, UnknownScript_0x55ef1, $ffff
	person_event $25, 6, 11, $5, $1, 255, 255, $0, 0, UnknownScript_0x55ef4, $ffff
	person_event $3, 5, 9, $6, $0, 255, 255, $0, 0, UnknownScript_0x55ef7, $ffff
; 0x5608b

