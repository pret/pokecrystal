VictoryRoadGate_MapScriptHeader: ; 0x9b9f1
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x9b9fb, $0000
	dw UnknownScript_0x9b9fc, $0000

	; callback count
	db 0
; 0x9b9fb

UnknownScript_0x9b9fb: ; 0x9b9fb
	end
; 0x9b9fc

UnknownScript_0x9b9fc: ; 0x9b9fc
	end
; 0x9b9fd

UnknownScript_0x9b9fd: ; 0x9b9fd
	spriteface $0, $2
	2jump UnknownScript_0x9ba04
; 0x9ba03

UnknownScript_0x9ba03: ; 0x9ba03
	faceplayer
UnknownScript_0x9ba04: ; 0x9ba04
	loadfont
	2writetext UnknownText_0x9ba29
	keeptextopen
	checkcode $7
	if_less_than $7, UnknownScript_0x9ba19
	2writetext UnknownText_0x9ba5f
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9ba27
	end
; 0x9ba19

UnknownScript_0x9ba19: ; 0x9ba19
	2writetext UnknownText_0x9bab4
	closetext
	loadmovesprites
	dotrigger $1
	end
; 0x9ba21

UnknownScript_0x9ba21: ; 0x9ba21
	jumptextfaceplayer UnknownText_0x9baf1
; 0x9ba24

UnknownScript_0x9ba24: ; 0x9ba24
	jumptextfaceplayer UnknownText_0x9bb37
; 0x9ba27

MovementData_0x9ba27: ; 0x9ba27
	step_down
	step_end
; 0x9ba29

UnknownText_0x9ba29: ; 0x9ba29
	db $0, "Only trainers who", $4f
	db "have proven them-", $55
	db "selves may pass.", $57
; 0x9ba5f

UnknownText_0x9ba5f: ; 0x9ba5f
	db $0, "You don't have all", $4f
	db "the GYM BADGES of", $55
	db "JOHTO.", $51
	db "I'm sorry, but I", $4f
	db "can't let you go", $55
	db "through.", $57
; 0x9bab4

UnknownText_0x9bab4: ; 0x9bab4
	db $0, "Oh! The eight", $4f
	db "BADGES of JOHTO!", $51
	db "Please, go right", $4f
	db "on through!", $57
; 0x9baf1

UnknownText_0x9baf1: ; 0x9baf1
	db $0, "This way leads to", $4f
	db "MT.SILVER.", $51
	db "You'll see scary-", $4f
	db "strong #MON out", $55
	db "there.", $57
; 0x9bb37

UnknownText_0x9bb37: ; 0x9bb37
	db $0, "Off to the #MON", $4f
	db "LEAGUE, are you?", $51
	db "The ELITE FOUR are", $4f
	db "so strong it's", $51
	db "scary, and they're", $4f
	db "ready for you!", $57
; 0x9bb9b

VictoryRoadGate_MapEventHeader: ; 0x9bb9b
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $7, $11, 1, GROUP_ROUTE_22, MAP_ROUTE_22
	warp_def $7, $12, 1, GROUP_ROUTE_22, MAP_ROUTE_22
	warp_def $11, $9, 1, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $11, $a, 1, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $0, $9, 1, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $0, $a, 1, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $7, $1, 2, GROUP_ROUTE_28, MAP_ROUTE_28
	warp_def $7, $2, 2, GROUP_ROUTE_28, MAP_ROUTE_28

	; xy triggers
	db 1
	xy_trigger 0, $b, $a, $0, UnknownScript_0x9b9fd, $0, $0

	; signposts
	db 0

	; people-events
	db 3
	person_event $43, 15, 12, $9, $0, 255, 255, $0, 0, UnknownScript_0x9ba03, $ffff
	person_event $41, 9, 11, $9, $0, 255, 255, $0, 0, UnknownScript_0x9ba21, $074f
	person_event $41, 9, 16, $8, $0, 255, 255, $0, 0, UnknownScript_0x9ba24, $0750
; 0x9bbf8



