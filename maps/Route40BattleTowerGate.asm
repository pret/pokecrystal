Route40BattleTowerGate_MapScriptHeader: ; 0x9f660
	; trigger count
	db 0

	; callback count
	db 1

	; callbacks

	dbw 2, UnknownScript_0x9f665
; 0x9f665

UnknownScript_0x9f665: ; 0x9f665
	clearevent $07cf
	return
; 0x9f669

RockerScript_0x9f669: ; 0x9f669
	jumptextfaceplayer UnknownText_0x9f716
; 0x9f66c

TwinScript_0x9f66c: ; 0x9f66c
	jumptextfaceplayer UnknownText_0x9f7c8
; 0x9f66f

UnknownText_0x9f66f: ; 0x9f66f
	db $0, "Did you come to", $4f
	db "see the BATTLE", $55
	db "TOWER too?", $51
	db "But I guess you", $4f
	db "can't go in yet.", $57
; 0x9f6ba

UnknownText_0x9f6ba: ; 0x9f6ba
	db $0, "BATTLE TOWER has", $4f
	db "opened.", $51
	db "I want to go, but", $4f
	db "I haven't thought", $51
	db "up a cool line for", $4f
	db "when I win.", $57
; 0x9f716

UnknownText_0x9f716: ; 0x9f716
	db $0, "Are you going to", $4f
	db "the BATTLE TOWER?", $51
	db "This is a secret,", $4f
	db "but if you win a", $51
	db "whole lot, you can", $4f
	db "win special gifts.", $57
; 0x9f783

UnknownText_0x9f783: ; 0x9f783
	db $0, "I'm going to train", $4f
	db "my #MON so I'll", $51
	db "be all ready for", $4f
	db "the BATTLE TOWER.", $57
; 0x9f7c8

UnknownText_0x9f7c8: ; 0x9f7c8
	db $0, "The levels of the", $4f
	db "#MON I want to", $51
	db "use are all", $4f
	db "different.", $51
	db "I have to go train", $4f
	db "them now!", $57
; 0x9f81e

Route40BattleTowerGate_MapEventHeader: ; 0x9f81e
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $7, $4, 1, GROUP_ROUTE_40, MAP_ROUTE_40
	warp_def $7, $5, 1, GROUP_ROUTE_40, MAP_ROUTE_40
	warp_def $0, $4, 1, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE
	warp_def $0, $5, 2, GROUP_BATTLE_TOWER_OUTSIDE, MAP_BATTLE_TOWER_OUTSIDE

	; xy triggers
	db 0

	; signposts
	db 0

	; people-events
	db 2
	person_event SPRITE_ROCKER, 7, 7, $3, $0, 255, 255, $a0, 0, RockerScript_0x9f669, $07cf
	person_event SPRITE_TWIN, 9, 11, $4, $10, 255, 255, $80, 0, TwinScript_0x9f66c, $ffff
; 0x9f852

