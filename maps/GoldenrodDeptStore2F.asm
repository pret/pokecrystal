GoldenrodDeptStore2F_MapScriptHeader: ; 0x55b5b
	; trigger count
	db 0

	; callback count
	db 0
; 0x55b5d

ClerkScript_0x55b5d: ; 0x55b5d
	faceplayer
	loadfont
	pokemart $0, $0005
	loadmovesprites
	end
; 0x55b65

ClerkScript_0x55b65: ; 0x55b65
	faceplayer
	loadfont
	pokemart $0, $0006
	loadmovesprites
	end
; 0x55b6d

YoungsterScript_0x55b6d: ; 0x55b6d
	jumptextfaceplayer UnknownText_0x55c25
; 0x55b70

CooltrainerFScript_0x55b70: ; 0x55b70
	jumptextfaceplayer UnknownText_0x55c7b
; 0x55b73

GentlemanScript_0x55b73: ; 0x55b73
	jumptextfaceplayer UnknownText_0x55cb7
; 0x55b76

MapGoldenrodDeptStore2FSignpost0Script: ; 0x55b76
	jumptext UnknownText_0x55d28
; 0x55b79

MapGoldenrodDeptStore2FSignpost1Script: ; 0x55b79
	jumpstd elevatorbutton
; 0x55b7c

; possibly unused
UnknownText_0x55b7c: ; 0x55b7c
	text "We intend to sell"
	line "items for #MON"
	cont "to hold."

	para "This is a free"
	line "gift. Have a #-"
	cont "MON hold it."
	done
; 0x55bd3

; possibly unused
UnknownText_0x55bd3: ; 0x55bd3
	text "By giving #MON"
	line "items to hold, I"

	para "bet trainers will"
	line "develop new battle"
	cont "techniques."
	done
; 0x55c25

UnknownText_0x55c25: ; 0x55c25
	text "#GEAR can store"
	line "up to ten phone"
	cont "numbers."

	para "It's hard to de-"
	line "cide which numbers"
	cont "to keep."
	done
; 0x55c7b

UnknownText_0x55c7b: ; 0x55c7b
	text "I got my ABRA at"
	line "the GAME CORNER."

	para "Now it's my best"
	line "partner."
	done
; 0x55cb7

UnknownText_0x55cb7: ; 0x55cb7
	text "This DEPT.STORE"
	line "makes me realize"

	para "that GOLDENROD is"
	line "a big city."

	para "The selection here"
	line "is unmatched any-"
	cont "where else."
	done
; 0x55d28

UnknownText_0x55d28: ; 0x55d28
	text "Your Travel"
	line "Companion"

	para "2F TRAINER'S"
	line "   MARKET"
	done
; 0x55d56

GoldenrodDeptStore2F_MapEventHeader: ; 0x55d56
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_3F, MAP_GOLDENROD_DEPT_STORE_3F
	warp_def $0, $f, 3, GROUP_GOLDENROD_DEPT_STORE_1F, MAP_GOLDENROD_DEPT_STORE_1F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore2FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore2FSignpost1Script

	; people-events
	db 5
	person_event SPRITE_CLERK, 9, 17, $7, $0, 255, 255, $0, 0, ClerkScript_0x55b5d, $ffff
	person_event SPRITE_CLERK, 10, 17, $8, $0, 255, 255, $0, 0, ClerkScript_0x55b65, $ffff
	person_event SPRITE_YOUNGSTER, 10, 13, $4, $10, 255, 255, $0, 0, YoungsterScript_0x55b6d, $ffff
	person_event SPRITE_COOLTRAINER_F, 6, 10, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x55b70, $ffff
	person_event SPRITE_GENTLEMAN, 10, 6, $3, $0, 255, 255, $0, 0, GentlemanScript_0x55b73, $ffff
; 0x55db6
