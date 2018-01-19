const_value set 2
	const ECRUTEAKHOUSE_SAGE1
	const ECRUTEAKHOUSE_SAGE2
	const ECRUTEAKHOUSE_SAGE3
	const ECRUTEAKHOUSE_GRAMPS

EcruteakHouse_MapScripts:
.SceneScripts:
	db 2
	scene_script .DummyScene0
	scene_script .DummyScene1

.MapCallbacks:
	db 1
	callback MAPCALLBACK_OBJECTS, .InitializeSages

.DummyScene0:
	end

.DummyScene1:
	end

.InitializeSages:
	checkevent EVENT_FOUGHT_SUICUNE
	iftrue .DontBlockTower
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .DontBlockTower
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .BlockTower
	return

.BlockTower:
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_RANG_CLEAR_BELL_2
	setevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	checkitem CLEAR_BELL
	iftrue .NoClearBell
	setscene 0
.NoClearBell:
	return

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	return

EcruteakHouse_CoordEvent1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakHouse_CoordEvent_DontMove
	applymovement ECRUTEAKHOUSE_SAGE2, MovementData_0x980c7
	moveobject ECRUTEAKHOUSE_SAGE1, 4, 6
	appear ECRUTEAKHOUSE_SAGE1
	pause 5
	disappear ECRUTEAKHOUSE_SAGE2
	end

EcruteakHouse_CoordEvent2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakHouse_CoordEvent_DontMove
	applymovement ECRUTEAKHOUSE_SAGE1, MovementData_0x980cc
	moveobject ECRUTEAKHOUSE_SAGE2, 5, 6
	appear ECRUTEAKHOUSE_SAGE2
	pause 5
	disappear ECRUTEAKHOUSE_SAGE1
	end

EcruteakHouse_CoordEvent_DontMove:
	end

SageScript_0x98062:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .CheckForClearBell
	checkflag ENGINE_FOGBADGE
	iftrue .BlockPassage_GotFogBadge
	writetext UnknownText_0x980d1
	waitbutton
	closetext
	end

.BlockPassage_GotFogBadge:
	writetext UnknownText_0x98131
	waitbutton
	closetext
	end

.CheckForClearBell:
	checkevent EVENT_KOJI_ALLOWS_YOU_PASSAGE_TO_TIN_TOWER
	iftrue .AllowedThrough
	checkevent EVENT_GAVE_KURT_APRICORNS
	iftrue .Event000
	checkitem CLEAR_BELL
	iftrue .RingClearBell
	writetext UnknownText_0x981a4
	waitbutton
	closetext
	end

.RingClearBell:
	writetext UnknownText_0x98250
	waitbutton
	closetext
	setscene 1
	setevent EVENT_RANG_CLEAR_BELL_2
	clearevent EVENT_RANG_CLEAR_BELL_1
	setevent EVENT_GAVE_KURT_APRICORNS
	end

.AllowedThrough:
	writetext UnknownText_0x9837e
	waitbutton
	closetext
	end

.Event000:
	writetext UnknownText_0x98391
	waitbutton
	closetext
	end

SageScript_0x980b0:
	faceplayer
	opentext
	checkevent EVENT_GOT_CLEAR_BELL
	iftrue .GotClearBell
	writetext UnknownText_0x9840b
	waitbutton
	closetext
	end

.GotClearBell:
	writetext UnknownText_0x9846f
	waitbutton
	closetext
	end

EcruteakHouseGrampsScript:
	jumptextfaceplayer EcruteakHouseGrampsText

MovementData_0x980c7:
	fix_facing
	big_step LEFT
	remove_fixed_facing
	turn_head DOWN
	step_end

MovementData_0x980cc:
	fix_facing
	big_step RIGHT
	remove_fixed_facing
	turn_head DOWN
	step_end

UnknownText_0x980d1:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without ECRUTEAK"
	line "GYM's BADGE."

	para "Sorry, but you'll"
	line "have to leave."
	done

UnknownText_0x98131:
	text "TIN TOWER is off"
	line "limits to anyone"

	para "without ECRUTEAK"
	line "GYM's BADGE."

	para "Ah!"

	para "ECRUTEAK's GYM"
	line "BADGE! Please, go"
	cont "right through."
	done

UnknownText_0x981a4:
	text "A momentous event"
	line "has occurred."

	para "I beg your pardon,"
	line "but I must ask you"
	cont "to leave."

	para "…What soothes the"
	line "soul…"

	para "The WISE TRIO say"
	line "things that are so"

	para "very difficult to"
	line "understand…"
	done

UnknownText_0x98250:
	text "A momentous event"
	line "has occurred."

	para "I beg your pardon,"
	line "but I must ask you"
	cont "to leave."

	para "<……><……><……>"

	para "Ah!"

	para "The sound of that"
	line "CLEAR BELL!"

	para "It… It's sublime!"

	para "I've never heard"
	line "so beautiful a"
	cont "sound before!"

	para "That bell's chime"
	line "is indicative of"
	cont "the bearer's soul."

	para "You…"

	para "You may be able to"
	line "make it through"
	cont "TIN TOWER."

	para "Please, do go on."
	done

UnknownText_0x9837e:
	text "Please, do go on."
	done

UnknownText_0x98391:
	text "That bell's chime"
	line "is indicative of"
	cont "the bearer's soul."

	para "You…"

	para "You may be able to"
	line "make it through"
	cont "TIN TOWER."

	para "Please, do go on."
	done

UnknownText_0x9840b:
	text "The TIN TOWER"
	line "ahead is a nine-"

	para "tier tower of"
	line "divine beauty."

	para "It soothes the"
	line "soul of all who"
	cont "see it."
	done

UnknownText_0x9846f:
	text "The TIN TOWER"
	line "shook! A #MON"

	para "must have returned"
	line "to the top!"
	done

EcruteakHouseGrampsText:
	text "Two towers…"
	line "Two #MON…"

	para "But when one"
	line "burned down, both"

	para "#MON flew away,"
	line "never to return."
	done

EcruteakHouse_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 4, 17, 3, ECRUTEAK_CITY
	warp_def 5, 17, 3, ECRUTEAK_CITY
	warp_def 5, 3, 4, ECRUTEAK_HOUSE
	warp_def 17, 15, 3, ECRUTEAK_HOUSE
	warp_def 17, 3, 3, WISE_TRIOS_ROOM

.CoordEvents:
	db 2
	coord_event 4, 7, 0, EcruteakHouse_CoordEvent1
	coord_event 5, 7, 0, EcruteakHouse_CoordEvent2

.BGEvents:
	db 0

.ObjectEvents:
	db 4
	object_event 4, 6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScript_0x98062, EVENT_RANG_CLEAR_BELL_1
	object_event 5, 6, SPRITE_SAGE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScript_0x98062, EVENT_RANG_CLEAR_BELL_2
	object_event 6, 9, SPRITE_SAGE, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SageScript_0x980b0, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	object_event 3, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EcruteakHouseGrampsScript, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
