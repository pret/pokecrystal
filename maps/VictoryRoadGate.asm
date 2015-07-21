VictoryRoadGate_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x9b9fb, $0000
	dw UnknownScript_0x9b9fc, $0000

.MapCallbacks:
	db 0

UnknownScript_0x9b9fb:
	end

UnknownScript_0x9b9fc:
	end

UnknownScript_0x9b9fd:
	spriteface $0, LEFT
	jump UnknownScript_0x9ba04

OfficerScript_0x9ba03:
	faceplayer
UnknownScript_0x9ba04:
	loadfont
	writetext UnknownText_0x9ba29
	keeptextopen
	checkcode VAR_BADGES
	if_greater_than 7, UnknownScript_0x9ba19
	writetext UnknownText_0x9ba5f
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x9ba27
	end

UnknownScript_0x9ba19:
	writetext UnknownText_0x9bab4
	closetext
	loadmovesprites
	dotrigger $1
	end

BlackBeltScript_0x9ba21:
	jumptextfaceplayer UnknownText_0x9baf1

BlackBeltScript_0x9ba24:
	jumptextfaceplayer UnknownText_0x9bb37

MovementData_0x9ba27:
	step_down
	step_end

UnknownText_0x9ba29:
	text "Only trainers who"
	line "have proven them-"
	cont "selves may pass."
	done

UnknownText_0x9ba5f:
	text "You don't have all"
	line "the GYM BADGES of"
	cont "JOHTO."

	para "I'm sorry, but I"
	line "can't let you go"
	cont "through."
	done

UnknownText_0x9bab4:
	text "Oh! The eight"
	line "BADGES of JOHTO!"

	para "Please, go right"
	line "on through!"
	done

UnknownText_0x9baf1:
	text "This way leads to"
	line "MT.SILVER."

	para "You'll see scary-"
	line "strong #MON out"
	cont "there."
	done

UnknownText_0x9bb37:
	text "Off to the #MON"
	line "LEAGUE, are you?"

	para "The ELITE FOUR are"
	line "so strong it's"

	para "scary, and they're"
	line "ready for you!"
	done

VictoryRoadGate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 8
	warp_def $7, $11, 1, GROUP_ROUTE_22, MAP_ROUTE_22
	warp_def $7, $12, 1, GROUP_ROUTE_22, MAP_ROUTE_22
	warp_def $11, $9, 1, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $11, $a, 1, GROUP_ROUTE_26, MAP_ROUTE_26
	warp_def $0, $9, 1, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $0, $a, 1, GROUP_VICTORY_ROAD, MAP_VICTORY_ROAD
	warp_def $7, $1, 2, GROUP_ROUTE_28, MAP_ROUTE_28
	warp_def $7, $2, 2, GROUP_ROUTE_28, MAP_ROUTE_28

.XYTriggers:
	db 1
	xy_trigger 0, $b, $a, $0, UnknownScript_0x9b9fd, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 15, 12, OW_LEFT | $1, $0, -1, -1, $0, 0, OfficerScript_0x9ba03, -1
	person_event SPRITE_BLACK_BELT, 9, 11, OW_LEFT | $1, $0, -1, -1, $0, 0, BlackBeltScript_0x9ba21, EVENT_OPENED_MT_SILVER
	person_event SPRITE_BLACK_BELT, 9, 16, OW_LEFT | $0, $0, -1, -1, $0, 0, BlackBeltScript_0x9ba24, EVENT_FOUGHT_SNORLAX
