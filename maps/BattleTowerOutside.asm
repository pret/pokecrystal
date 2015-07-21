BattleTowerOutside_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw 1, .Callback1
	dbw 2, .Callback2

.Callback1
	return

.Callback2
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

StandingYoungsterScript_0x9f85f:
	jumptextfaceplayer UnknownText_0x9f930

BuenaScript_0x9f862:
	jumptextfaceplayer UnknownText_0x9f9db

SailorScript_0x9f865:
	jumptextfaceplayer UnknownText_0x9fa8c

MapBattleTowerOutsideSignpost0Script:
	jumptext UnknownText_0x9fafc

UnknownText_0x9f86b:
	text "Wow, the BATTLE"
	line "TOWER is huge! My"

	para "neck is tired from"
	line "looking up at it."
	done

UnknownText_0x9f8b3:
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "Since there are a"
	line "whole bunch of"

	para "trainers inside,"
	line "there must also be"

	para "a wide variety of"
	line "#MON."
	done

UnknownText_0x9f930:
	text "Wow, the BATTLE"
	line "TOWER is huge!"

	para "There must be many"
	line "kinds of #MON"
	cont "in there!"
	done

UnknownText_0x9f97b:
	text "What on earth do"
	line "they do here?"

	para "If the name says"
	line "anything, I guess"

	para "it must be for"
	line "#MON battles."
	done

UnknownText_0x9f9db:
	text "You can use only"
	line "three #MON."

	para "It's so hard to"
	line "decide which three"

	para "should go into"
	line "battle…"
	done

UnknownText_0x9fa32:
	text "Ehehehe…"
	line "I sneaked out of"
	cont "work to come here."

	para "I'm never giving"
	line "up until I become"
	cont "a LEADER!"
	done

UnknownText_0x9fa8c:
	text "Hehehe, I snuck"
	line "out from work."

	para "I can't bail out"
	line "until I've won!"

	para "I have to win it"
	line "all. That I must!"
	done

UnknownText_0x9faee:
	text "BATTLE TOWER"
	done

UnknownText_0x9fafc:
	text "BATTLE TOWER"

	para "Take the Ultimate"
	line "Trainer Challenge!"
	done

UnknownText_0x9fb2f:
	text "The BATTLE TOWER's"
	line "doors are closed…"
	done

UnknownText_0x9fb54:
	text "It's open!"
	done

BattleTowerOutside_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $15, $8, 3, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE
	warp_def $15, $9, 4, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE
	warp_def $9, $8, 1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F
	warp_def $9, $9, 2, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 10, 10, SIGNPOST_READ, MapBattleTowerOutsideSignpost0Script

.PersonEvents:
	db 4
	person_event SPRITE_STANDING_YOUNGSTER, 16, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, StandingYoungsterScript_0x9f85f, -1
	person_event SPRITE_BUENA, 15, 17, OW_DOWN | $2, $11, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, BuenaScript_0x9f862, -1
	person_event SPRITE_SAILOR, 22, 16, OW_UP | $1, $1, -1, -1, $0, 0, SailorScript_0x9f865, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	person_event SPRITE_LASS, 28, 16, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, ObjectEvent, -1
