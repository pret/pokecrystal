GoldenrodDeptStore3F_MapScriptHeader: ; 0x55db6
	; trigger count
	db 0

	; callback count
	db 0
; 0x55db8

ClerkScript_0x55db8: ; 0x55db8
	faceplayer
	loadfont
	pokemart $0, $0007
	loadmovesprites
	end
; 0x55dc0

SuperNerdScript_0x55dc0: ; 0x55dc0
	jumptextfaceplayer UnknownText_0x55dcc
; 0x55dc3

RockerScript_0x55dc3: ; 0x55dc3
	jumptextfaceplayer UnknownText_0x55e15
; 0x55dc6

MapGoldenrodDeptStore3FSignpost0Script: ; 0x55dc6
	jumptext UnknownText_0x55e74
; 0x55dc9

MapGoldenrodDeptStore3FSignpost1Script: ; 0x55dc9
	jumpstd elevatorbutton
; 0x55dcc

UnknownText_0x55dcc: ; 0x55dcc
	text "I, I, I'm really"
	line "impatient!"

	para "I use X SPEED in"
	line "battle to speed up"
	cont "my #MON."
	done
; 0x55e15

UnknownText_0x55e15: ; 0x55e15
	text "Hey! When you bat-"
	line "tle, do you use X"
	cont "SPECIAL?"

	para "It's awesome. It"
	line "really jacks up"
	cont "SPECIAL ATTACK!"
	done
; 0x55e74

UnknownText_0x55e74: ; 0x55e74
	text "For Victory"
	line "Seekers"

	para "3F BATTLE"
	line "   COLLECTION"
	done
; 0x55ea1

GoldenrodDeptStore3F_MapEventHeader: ; 0x55ea1
	; filler
	db 0, 0

	; warps
	db 3
	warp_def $0, $c, 1, GROUP_GOLDENROD_DEPT_STORE_2F, MAP_GOLDENROD_DEPT_STORE_2F
	warp_def $0, $f, 2, GROUP_GOLDENROD_DEPT_STORE_4F, MAP_GOLDENROD_DEPT_STORE_4F
	warp_def $0, $2, 1, GROUP_GOLDENROD_DEPT_STORE_ELEVATOR, MAP_GOLDENROD_DEPT_STORE_ELEVATOR

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 0, 14, $0, MapGoldenrodDeptStore3FSignpost0Script
	signpost 0, 3, $0, MapGoldenrodDeptStore3FSignpost1Script

	; people-events
	db 3
	person_event SPRITE_CLERK, 5, 10, $6, $0, 255, 255, $0, 0, ClerkScript_0x55db8, $ffff
	person_event SPRITE_SUPER_NERD, 9, 16, $a, $10, 255, 255, $80, 0, SuperNerdScript_0x55dc0, $ffff
	person_event SPRITE_ROCKER, 9, 6, $4, $10, 255, 255, $0, 0, RockerScript_0x55dc3, $ffff
; 0x55ee7
