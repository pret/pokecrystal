CeladonDeptStore5F_MapScriptHeader: ; 0x71002
	; trigger count
	db 0

	; callback count
	db 0
; 0x71004

UnknownScript_0x71004: ; 0x71004
	faceplayer
	loadfont
	pokemart $0, $001b
	loadmovesprites
	end
; 0x7100c

UnknownScript_0x7100c: ; 0x7100c
	faceplayer
	loadfont
	pokemart $0, $001c
	loadmovesprites
	end
; 0x71014

UnknownScript_0x71014: ; 0x71014
	jumptextfaceplayer UnknownText_0x71023
; 0x71017

UnknownScript_0x71017: ; 0x71017
	jumptextfaceplayer UnknownText_0x71072
; 0x7101a

UnknownScript_0x7101a: ; 0x7101a
	jumptextfaceplayer UnknownText_0x710b6
; 0x7101d

MapCeladonDeptStore5FSignpost0Script: ; 0x7101d
	jumptext UnknownText_0x71100
; 0x71020

MapCeladonDeptStore5FSignpost1Script: ; 0x71020
	jumpstd $0014
; 0x71023

UnknownText_0x71023: ; 0x71023
	db $0, "I want to buy some", $4f
	db "items that raise", $51
	db "#MON stats, but", $4f
	db "I don't have", $55
	db "enough money…", $57
; 0x71072

UnknownText_0x71072: ; 0x71072
	db $0, "I want PP UP, so I", $4f
	db "can raise the PP", $51
	db "of moves. But you", $4f
	db "can't buy it…", $57
; 0x710b6

UnknownText_0x710b6: ; 0x710b6
	db $0, "Using items on", $4f
	db "them makes #-", $55
	db "MON happy.", $51
	db "They hate certain", $4f
	db "items, though…", $57
; 0x71100

UnknownText_0x71100: ; 0x71100
	db $0, "5F: DRUG STORE", $57
; 0x71110

CeladonDeptStore5F_MapEventHeader: ; 0x71110
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_4F, MAP_CELADON_DEPT_STORE_4F
	warp_def $0, $f, 1, GROUP_CELADON_DEPT_STORE_6F, MAP_CELADON_DEPT_STORE_6F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore5FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore5FSignpost1Script

	; people-events
	db 5
	person_event $39, 9, 11, $7, $0, 255, 255, $90, 0, UnknownScript_0x71004, $ffff
	person_event $39, 9, 12, $7, $0, 255, 255, $90, 0, UnknownScript_0x7100c, $ffff
	person_event $40, 9, 17, $2, $11, 255, 255, $80, 0, UnknownScript_0x71014, $ffff
	person_event $49, 8, 7, $2, $11, 255, 255, $90, 0, UnknownScript_0x71017, $ffff
	person_event $29, 11, 5, $9, $0, 255, 255, $a0, 0, UnknownScript_0x7101a, $ffff
; 0x71170

