	object_const_def
	const ROUTE17ROUTE18GATE_OFFICER

Route17Route18Gate_MapScripts:
	def_scene_scripts
	scene_script Route17Route18GateNoopScene, SCENE_ROUTE17ROUTE18GATE_BICYCLE_CHECK

	def_callbacks

Route17Route18GateNoopScene:
	end

Route17Route18GateOfficerScript:
	jumptextfaceplayer Route17Route18GateOfficerText

Route17Route18GateBicycleCheck:
	checkitem BICYCLE
	iffalse .NoBicycle
	end

.NoBicycle:
	showemote EMOTE_SHOCK, ROUTE17ROUTE18GATE_OFFICER, 15
	turnobject PLAYER, UP
	opentext
	writetext Route17Route18GateCannotPassText
	waitbutton
	closetext
	applymovement PLAYER, Route17Route18GateCannotPassMovement
	end

Route17Route18GateCannotPassMovement:
	step RIGHT
	turn_head LEFT
	step_end

Route17Route18GateOfficerText:
	text "CYCLING ROAD"
	line "Uphill Starts Here"
	done

Route17Route18GateCannotPassText:
	text "Hang on! Don't you"
	line "have a BICYCLE?"

	para "The CYCLING ROAD"
	line "is beyond here."

	para "You have to have a"
	line "BICYCLE to go on."
	done

Route17Route18Gate_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  4, ROUTE_17, 1
	warp_event  0,  5, ROUTE_17, 2
	warp_event  9,  4, ROUTE_18, 1
	warp_event  9,  5, ROUTE_18, 2

	def_coord_events
	coord_event  5,  4, SCENE_ROUTE17ROUTE18GATE_BICYCLE_CHECK, Route17Route18GateBicycleCheck
	coord_event  5,  5, SCENE_ROUTE17ROUTE18GATE_BICYCLE_CHECK, Route17Route18GateBicycleCheck

	def_bg_events

	def_object_events
	object_event  5,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route17Route18GateOfficerScript, -1
