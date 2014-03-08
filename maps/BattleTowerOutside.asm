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
	clearevent $07cf
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
	text "Wow, the BATTLE"
	line "TOWER is huge! My"

	para "neck is tired from"
	line "looking up at it."
	done
; 0x9f8b3

UnknownText_0x9f8b3: ; 0x9f8b3
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#MON."
	done
; 0x9f930

UnknownText_0x9f930: ; 0x9f930
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "There must be many"
	line "kinds of #MON"
	cont "in there!"
	done
; 0x9f97b

UnknownText_0x9f97b: ; 0x9f97b
	text "What on earth do"
	line "they do here?"

	para "If the name says"
	line "anything, I guess"

	para "it must be for"
	line "#MON battles."
	done
; 0x9f9db

UnknownText_0x9f9db: ; 0x9f9db
	text "You can use only"
	line "three #MON."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done
; 0x9fa32

UnknownText_0x9fa32: ; 0x9fa32
	text "Ehehehe…"
	line "I sneaked out of"
	cont "work to come here."

	para "I'm never giving"
	line "up until I become"
	cont "a LEADER!"
	done
; 0x9fa8c

UnknownText_0x9fa8c: ; 0x9fa8c
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done
; 0x9faee

UnknownText_0x9faee: ; 0x9faee
	text "BATTLE TOWER"
	done
; 0x9fafc

UnknownText_0x9fafc: ; 0x9fafc
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done
; 0x9fb2f

UnknownText_0x9fb2f: ; 0x9fb2f
	text "The BATTLE TOWER's"
	line "doors are closed…"
	done
; 0x9fb54

UnknownText_0x9fb54: ; 0x9fb54
	text "It's open!"
	done
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


