const_value set 2
	const ROUTE40BATTLETOWERGATE_ROCKER
	const ROUTE40BATTLETOWERGATE_TWIN

Route40BattleTowerGate_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, UnknownScript_0x9f665

UnknownScript_0x9f665:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	return

RockerScript_0x9f669:
	jumptextfaceplayer UnknownText_0x9f716

TwinScript_0x9f66c:
	jumptextfaceplayer UnknownText_0x9f7c8

UnknownText_0x9f66f:
	text "Did you come to"
	line "see the BATTLE"
	cont "TOWER too?"

	para "But I guess you"
	line "can't go in yet."
	done

UnknownText_0x9f6ba:
	text "BATTLE TOWER has"
	line "opened."

	para "I want to go, but"
	line "I haven't thought"

	para "up a cool line for"
	line "when I win."
	done

UnknownText_0x9f716:
	text "Are you going to"
	line "the BATTLE TOWER?"

	para "This is a secret,"
	line "but if you win a"

	para "whole lot, you can"
	line "win special gifts."
	done

UnknownText_0x9f783:
	text "I'm going to train"
	line "my #MON so I'll"

	para "be all ready for"
	line "the BATTLE TOWER."
	done

UnknownText_0x9f7c8:
	text "The levels of the"
	line "#MON I want to"

	para "use are all"
	line "different."

	para "I have to go train"
	line "them now!"
	done

Route40BattleTowerGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $7, $4, 1, ROUTE_40
	warp_def $7, $5, 1, ROUTE_40
	warp_def $0, $4, 1, BATTLE_TOWER_OUTSIDE
	warp_def $0, $5, 2, BATTLE_TOWER_OUTSIDE

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_ROCKER, 3, 3, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, RockerScript_0x9f669, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	person_event SPRITE_TWIN, 5, 7, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, TwinScript_0x9f66c, -1
