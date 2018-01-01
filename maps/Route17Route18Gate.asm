const_value set 2
	const ROUTE17ROUTE18GATE_OFFICER

Route17Route18Gate_MapScriptHeader:
.SceneScripts:
	db 1
	scene_script .DummyScene

.MapCallbacks:
	db 0

.DummyScene:
	end

Route17Route18GateOfficerScript:
	jumptextfaceplayer Route17Route18GateOfficerText

UnknownScript_0x73611:
	checkitem BICYCLE
	iffalse UnknownScript_0x73617
	end

UnknownScript_0x73617:
	showemote EMOTE_SHOCK, ROUTE17ROUTE18GATE_OFFICER, 15
	spriteface PLAYER, UP
	opentext
	writetext UnknownText_0x7364d
	waitbutton
	closetext
	applymovement PLAYER, MovementData_0x73629
	end

MovementData_0x73629:
	step RIGHT
	turn_head LEFT
	step_end

Route17Route18GateOfficerText:
	text "CYCLING ROAD"
	line "Uphill Starts Here"
	done

UnknownText_0x7364d:
	text "Hang on! Don't you"
	line "have a BICYCLE?"

	para "The CYCLING ROAD"
	line "is beyond here."

	para "You have to have a"
	line "BICYCLE to go on."
	done

Route17Route18Gate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def 0, 4, 1, ROUTE_17
	warp_def 0, 5, 2, ROUTE_17
	warp_def 9, 4, 1, ROUTE_18
	warp_def 9, 5, 2, ROUTE_18

.CoordEvents:
	db 2
	coord_event 5, 4, 0, UnknownScript_0x73611
	coord_event 5, 5, 0, UnknownScript_0x73611

.BGEvents:
	db 0

.ObjectEvents:
	db 1
	object_event 5, 2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateOfficerScript, -1
