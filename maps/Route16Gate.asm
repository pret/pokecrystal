Route16Gate_MapScriptHeader:
.MapTriggers:
	db 1

	; triggers
	dw UnknownScript_0x733e9, $0000

.MapCallbacks:
	db 0

UnknownScript_0x733e9:
	end

OfficerScript_0x733ea:
	jumptextfaceplayer UnknownText_0x73408

UnknownScript_0x733ed:
	checkitem BICYCLE
	iffalse UnknownScript_0x733f3
	end

UnknownScript_0x733f3:
	showemote EMOTE_SHOCK, $2, 15
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x73496
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x73405
	end

MovementData_0x73405:
	step_right
	turn_head_left
	step_end

UnknownText_0x73408:
	text "CYCLING ROAD"
	line "starts here."

	para "It's all downhill,"
	line "so it's totally"
	cont "exhilarating."

	para "It's a great sort"
	line "of feeling that"

	para "you can't get from"
	line "a ship or train."
	done

UnknownText_0x73496:
	text "Hey! Whoa! Stop!"

	para "You can't go out"
	line "on the CYCLING"

	para "ROAD without a"
	line "BICYCLE."
	done

Route16Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $4, $0, 4, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $5, $0, 5, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $4, $9, 2, GROUP_ROUTE_16, MAP_ROUTE_16
	warp_def $5, $9, 3, GROUP_ROUTE_16, MAP_ROUTE_16

.XYTriggers:
	db 2
	xy_trigger 0, $4, $5, $0, UnknownScript_0x733ed, $0, $0
	xy_trigger 0, $5, $5, $0, UnknownScript_0x733ed, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_OFFICER, 6, 9, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x733ea, -1
