	const_def 2 ; object constants
	const ROUTE17ROUTE18GATE_OFFICER

Route17Route18Gate_MapScripts:
	db 1 ; scene scripts
	scene_script .DummyScene ; SCENE_DEFAULT

	db 0 ; callbacks

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

Route17Route18Gate_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  4, ROUTE_17, 1
	warp_event  0,  5, ROUTE_17, 2
	warp_event  9,  4, ROUTE_18, 1
	warp_event  9,  5, ROUTE_18, 2

	db 2 ; coord events
	coord_event  5,  4, SCENE_DEFAULT, UnknownScript_0x73611
	coord_event  5,  5, SCENE_DEFAULT, UnknownScript_0x73611

	db 0 ; bg events

	db 1 ; object events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateOfficerScript, -1
