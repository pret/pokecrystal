const_value set 2
	const ROUTE16GATE_OFFICER

Route16Gate_MapScripts:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DummyScene:
	end

Route16GateOfficerScript:
	jumptextfaceplayer Route16GateOfficerText

UnknownScript_0x733ed:
	checkitem BICYCLE
	iffalse UnknownScript_0x733f3
	end

UnknownScript_0x733f3:
	showemote EMOTE_SHOCK, ROUTE16GATE_OFFICER, 15
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x73496
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x73405
	end

MovementData_0x73405:
	step RIGHT
	turn_head LEFT
	step_end

Route16GateOfficerText:
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

Route16Gate_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 4, ROUTE_16
	warp_def 0, 5, 5, ROUTE_16
	warp_def 9, 4, 2, ROUTE_16
	warp_def 9, 5, 3, ROUTE_16

.CoordEvents:
	db 2
	coord_event 5, 4, 0, UnknownScript_0x733ed
	coord_event 5, 5, 0, UnknownScript_0x733ed

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route16GateOfficerScript, -1
