CeladonDeptStore2F_MapScriptHeader: ; 0x70bab
	; trigger count
	db 0

	; callback count
	db 0
; 0x70bad

ClerkScript_0x70bad: ; 0x70bad
	faceplayer
	loadfont
	pokemart $0, $0017
	loadmovesprites
	end
; 0x70bb5

ClerkScript_0x70bb5: ; 0x70bb5
	faceplayer
	loadfont
	pokemart $0, $0018
	loadmovesprites
	end
; 0x70bbd

PokefanMScript_0x70bbd: ; 0x70bbd
	jumptextfaceplayer UnknownText_0x70bc9
; 0x70bc0

YoungsterScript_0x70bc0: ; 0x70bc0
	jumptextfaceplayer UnknownText_0x70c3e
; 0x70bc3

MapCeladonDeptStore2FSignpost0Script: ; 0x70bc3
	jumptext UnknownText_0x70c9c
; 0x70bc6

MapCeladonDeptStore2FSignpost1Script: ; 0x70bc6
	jumpstd elevatorbutton
; 0x70bc9

UnknownText_0x70bc9: ; 0x70bc9
	text "I just recently"
	line "became a trainer."

	para "My son encouraged"
	line "me to do it."

	para "I'm impressed by"
	line "the selection of"
	cont "convenient items."
	done
; 0x70c3e

UnknownText_0x70c3e: ; 0x70c3e
	text "My dad's having a"
	line "hard time learning"

	para "the names of items"
	line "and how they are"

	para "supposed to be"
	line "used…"
	done
; 0x70c9c

UnknownText_0x70c9c: ; 0x70c9c
	text "Top Grade Items"
	line "for Trainers!"

	para "2F: TRAINER'S"
	line "    MARKET"
	done
; 0x70cd4

CeladonDeptStore2F_MapEventHeader: ; 0x70cd4
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_CELADON_DEPT_STORE_3F, MAP_CELADON_DEPT_STORE_3F
	warp_def $0, $f, 3, GROUP_CELADON_DEPT_STORE_1F, MAP_CELADON_DEPT_STORE_1F
	warp_def $0, $2, 1, GROUP_CELADON_DEPT_STORE_ELEVATOR, MAP_CELADON_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapCeladonDeptStore2FSignpost0Script
	signpost 0, 3, $0, MapCeladonDeptStore2FSignpost1Script

	; people-events
	db 4
	person_event SPRITE_CLERK, 9, 17, $7, $0, 255, 255, $90, 0, ClerkScript_0x70bad, $ffff
	person_event SPRITE_CLERK, 9, 18, $7, $0, 255, 255, $90, 0, ClerkScript_0x70bb5, $ffff
	person_event SPRITE_POKEFAN_M, 6, 9, $7, $0, 255, 255, $80, 0, PokefanMScript_0x70bbd, $ffff
	person_event SPRITE_YOUNGSTER, 6, 10, $8, $0, 255, 255, $a0, 0, YoungsterScript_0x70bc0, $ffff
; 0x70d27
