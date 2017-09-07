const_value set 2
	const ECRUTEAKHOUSE_SAGE1
	const ECRUTEAKHOUSE_SAGE2
	const ECRUTEAKHOUSE_SAGE3
	const ECRUTEAKHOUSE_GRAMPS

EcruteakHouse_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .InitializeSages

.Trigger0:
	end

.Trigger1:
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
	dotrigger $0
.NoClearBell:
	return

.DontBlockTower:
	clearevent EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	return

EcruteakHouse_XYTrigger1:
	checkevent EVENT_RANG_CLEAR_BELL_2
	iftrue EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE2, MovementData_0x980c7
	moveperson ECRUTEAKHOUSE_SAGE1, $4, $6
	appear ECRUTEAKHOUSE_SAGE1
	pause 5
	disappear ECRUTEAKHOUSE_SAGE2
	end

EcruteakHouse_XYTrigger2:
	checkevent EVENT_RANG_CLEAR_BELL_1
	iftrue EcruteakHouse_XYTrigger_DontMove
	applymovement ECRUTEAKHOUSE_SAGE1, MovementData_0x980cc
	moveperson ECRUTEAKHOUSE_SAGE2, $5, $6
	appear ECRUTEAKHOUSE_SAGE2
	pause 5
	disappear ECRUTEAKHOUSE_SAGE1
	end

EcruteakHouse_XYTrigger_DontMove:
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
	dotrigger $1
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

GrampsScript_0x980c4:
	jumptextfaceplayer UnknownText_0x984ab

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

	para $56, $56, $56

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

UnknownText_0x984ab:
	text "Two towers…"
	line "Two #MON…"

	para "But when one"
	line "burned down, both"

	para "#MON flew away,"
	line "never to return."
	done

EcruteakHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $11, $4, 3, ECRUTEAK_CITY
	warp_def $11, $5, 3, ECRUTEAK_CITY
	warp_def $3, $5, 4, ECRUTEAK_HOUSE
	warp_def $f, $11, 3, ECRUTEAK_HOUSE
	warp_def $3, $11, 3, WISE_TRIOS_ROOM

.XYTriggers:
	db 2
	xy_trigger 0, $7, $4, $0, EcruteakHouse_XYTrigger1, $0, $0
	xy_trigger 0, $7, $5, $0, EcruteakHouse_XYTrigger2, $0, $0

.Signposts:
	db 0

.PersonEvents:
	db 4
	person_event SPRITE_SAGE, 6, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x98062, EVENT_RANG_CLEAR_BELL_1
	person_event SPRITE_SAGE, 6, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x98062, EVENT_RANG_CLEAR_BELL_2
	person_event SPRITE_SAGE, 9, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SageScript_0x980b0, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
	person_event SPRITE_GRAMPS, 11, 3, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrampsScript_0x980c4, EVENT_ECRUTEAK_HOUSE_WANDERING_SAGE
