CeladonDeptStore5F_MapScriptHeader: ; 0x71002
	; trigger count
	db 0

	; callback count
	db 0
; 0x71004

ClerkScript_0x71004: ; 0x71004
	faceplayer
	loadfont
	pokemart $0, $001b
	loadmovesprites
	end
; 0x7100c

ClerkScript_0x7100c: ; 0x7100c
	faceplayer
	loadfont
	pokemart $0, $001c
	loadmovesprites
	end
; 0x71014

GentlemanScript_0x71014: ; 0x71014
	jumptextfaceplayer UnknownText_0x71023
; 0x71017

SailorScript_0x71017: ; 0x71017
	jumptextfaceplayer UnknownText_0x71072
; 0x7101a

TeacherScript_0x7101a: ; 0x7101a
	jumptextfaceplayer UnknownText_0x710b6
; 0x7101d

MapCeladonDeptStore5FSignpost0Script: ; 0x7101d
	jumptext UnknownText_0x71100
; 0x71020

MapCeladonDeptStore5FSignpost1Script: ; 0x71020
	jumpstd elevatorbutton
; 0x71023

UnknownText_0x71023: ; 0x71023
	text "I want to buy some"
	line "items that raise"

	para "#MON stats, but"
	line "I don't have"
	cont "enough money…"
	done
; 0x71072

UnknownText_0x71072: ; 0x71072
	text "I want PP UP, so I"
	line "can raise the PP"

	para "of moves. But you"
	line "can't buy it…"
	done
; 0x710b6

UnknownText_0x710b6: ; 0x710b6
	text "Using items on"
	line "them makes #-"
	cont "MON happy."

	para "They hate certain"
	line "items, though…"
	done
; 0x71100

UnknownText_0x71100: ; 0x71100
	text "5F: DRUG STORE"
	done
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
	person_event SPRITE_CLERK, 9, 11, $7, $0, 255, 255, $90, 0, ClerkScript_0x71004, $ffff
	person_event SPRITE_CLERK, 9, 12, $7, $0, 255, 255, $90, 0, ClerkScript_0x7100c, $ffff
	person_event SPRITE_GENTLEMAN, 9, 17, $2, $11, 255, 255, $80, 0, GentlemanScript_0x71014, $ffff
	person_event SPRITE_SAILOR, 8, 7, $2, $11, 255, 255, $90, 0, SailorScript_0x71017, $ffff
	person_event SPRITE_TEACHER, 11, 5, $9, $0, 255, 255, $a0, 0, TeacherScript_0x7101a, $ffff
; 0x71170
