BattleTowerOutside_MapScriptHeader: ; 0x9f852
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 1, UnknownScript_0x9f85a

	dbw 2, UnknownScript_0x9f85b
; 0x9f85a

UnknownScript_0x9f85a: ; 0x9f85a
	return
; 0x9f85b

UnknownScript_0x9f85b: ; 0x9f85b
	clearbit1 $07cf
	return
; 0x9f85f

StandingYoungsterScript_0x9f85f: ; 0x9f85f
	jumptextfaceplayer UnknownText_0x9f930
; 0x9f862

BuenaScript_0x9f862: ; 0x9f862
	jumptextfaceplayer UnknownText_0x9f9db
; 0x9f865

SailorScript_0x9f865: ; 0x9f865
	jumptextfaceplayer UnknownText_0x9fa8c
; 0x9f868

MapBattleTowerOutsideSignpost0Script: ; 0x9f868
	jumptext UnknownText_0x9fafc
; 0x9f86b

UnknownText_0x9f86b: ; 0x9f86b
	db $0, "Wow, the BATTLE", $4f
	db "TOWER is huge! My", $51
	db "neck is tired from", $4f
	db "looking up at it.", $57
; 0x9f8b3

UnknownText_0x9f8b3: ; 0x9f8b3
	db $0, "Wow, the BATTLE", $4f
	db "TOWER is huge!", $51
	db "Since there are a", $4f
	db "whole bunch of", $51
	db "trainers inside,", $4f
	db "there must also be", $51
	db "a wide variety of", $4f
	db "#MON.", $57
; 0x9f930

UnknownText_0x9f930: ; 0x9f930
	db $0, "Wow, the BATTLE", $4f
	db "TOWER is huge!", $51
	db "There must be many", $4f
	db "kinds of #MON", $55
	db "in there!", $57
; 0x9f97b

UnknownText_0x9f97b: ; 0x9f97b
	db $0, "What on earth do", $4f
	db "they do here?", $51
	db "If the name says", $4f
	db "anything, I guess", $51
	db "it must be for", $4f
	db "#MON battles.", $57
; 0x9f9db

UnknownText_0x9f9db: ; 0x9f9db
	db $0, "You can use only", $4f
	db "three #MON.", $51
	db "It's so hard to", $4f
	db "decide which three", $51
	db "should go into", $4f
	db "battle…", $57
; 0x9fa32

UnknownText_0x9fa32: ; 0x9fa32
	db $0, "Ehehehe…", $4f
	db "I sneaked out of", $55
	db "work to come here.", $51
	db "I'm never giving", $4f
	db "up until I become", $55
	db "a LEADER!", $57
; 0x9fa8c

UnknownText_0x9fa8c: ; 0x9fa8c
	db $0, "Hehehe, I snuck", $4f
	db "out from work.", $51
	db "I can't bail out", $4f
	db "until I've won!", $51
	db "I have to win it", $4f
	db "all. That I must!", $57
; 0x9faee

UnknownText_0x9faee: ; 0x9faee
	db $0, "BATTLE TOWER", $57
; 0x9fafc

UnknownText_0x9fafc: ; 0x9fafc
	db $0, "BATTLE TOWER", $51
	db "Take the Ultimate", $4f
	db "Trainer Challenge!", $57
; 0x9fb2f

UnknownText_0x9fb2f: ; 0x9fb2f
	db $0, "The BATTLE TOWER's", $4f
	db "doors are closed…", $57
; 0x9fb54

UnknownText_0x9fb54: ; 0x9fb54
	db $0, "It's open!", $57
; 0x9fb5f

BattleTowerOutside_MapEventHeader: ; 0x9fb5f
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $15, $8, 3, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE
	warp_def $15, $9, 4, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE
	warp_def $9, $8, 1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F
	warp_def $9, $9, 2, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F

	; xy triggers
	db 0

	; signposts
	db 1
	signpost 10, 10, $0, MapBattleTowerOutsideSignpost0Script

	; people-events
	db 4
	person_event SPRITE_STANDING_YOUNGSTER, 16, 10, $7, $0, 255, 255, $80, 0, StandingYoungsterScript_0x9f85f, $ffff
	person_event SPRITE_BUENA, 15, 17, $2, $11, 255, 255, $a0, 0, BuenaScript_0x9f862, $ffff
	person_event SPRITE_SAILOR, 22, 16, $5, $1, 255, 255, $0, 0, SailorScript_0x9f865, $07cf
	person_event SPRITE_LASS, 28, 16, $3, $0, 255, 255, $a0, 0, ObjectEvent, $ffff
; 0x9fbb2


