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
	jumpstd $0014
; 0x55b7c

; possibly unused
UnknownText_0x55b7c: ; 0x55b7c
	db $0, "We intend to sell", $4f
	db "items for #MON", $55
	db "to hold.", $51
	db "This is a free", $4f
	db "gift. Have a #-", $55
	db "MON hold it.", $57
; 0x55bd3

; possibly unused
UnknownText_0x55bd3: ; 0x55bd3
	db $0, "By giving #MON", $4f
	db "items to hold, I", $51
	db "bet trainers will", $4f
	db "develop new battle", $55
	db "techniques.", $57
; 0x55c25

UnknownText_0x55c25: ; 0x55c25
	db $0, "#GEAR can store", $4f
	db "up to ten phone", $55
	db "numbers.", $51
	db "It's hard to de-", $4f
	db "cide which numbers", $55
	db "to keep.", $57
; 0x55c7b

UnknownText_0x55c7b: ; 0x55c7b
	db $0, "I got my ABRA at", $4f
	db "the GAME CORNER.", $51
	db "Now it's my best", $4f
	db "partner.", $57
; 0x55cb7

UnknownText_0x55cb7: ; 0x55cb7
	db $0, "This DEPT.STORE", $4f
	db "makes me realize", $51
	db "that GOLDENROD is", $4f
	db "a big city.", $51
	db "The selection here", $4f
	db "is unmatched any-", $55
	db "where else.", $57
; 0x55d28

UnknownText_0x55d28: ; 0x55d28
	db $0, "Your Travel", $4f
	db "Companion", $51
	db "2F TRAINER'S", $4f
	db "   MARKET", $57
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

