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
	text "Did you come to"
	line "see the BATTLE"
	cont "TOWER too?"

	para "But I guess you"
	line "can't go in yet."
	done
; 0x9f6ba

UnknownText_0x9f6ba: ; 0x9f6ba
	text "BATTLE TOWER has"
	line "opened."

	para "I want to go, but"
	line "I haven't thought"

	para "up a cool line for"
	line "when I win."
	done
; 0x9f716

UnknownText_0x9f716: ; 0x9f716
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done
; 0x9f783

UnknownText_0x9f783: ; 0x9f783
	text "I'm going to train"
	line "my #MON so I'll"

	para "be all ready for"
	line "the BATTLE TOWER."
	done
; 0x9f7c8

UnknownText_0x9f7c8: ; 0x9f7c8
	text "The levels of the"
	line "#MON I want to"

	para "use are all"
	line "different."

	para "I have to go train"
	line "them now!"
	done
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
