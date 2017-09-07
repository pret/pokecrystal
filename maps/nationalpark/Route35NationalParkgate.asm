const_value set 2
	const ROUTE35NATIONALPARKGATE_OFFICER1
	const ROUTE35NATIONALPARKGATE_YOUNGSTER
	const ROUTE35NATIONALPARKGATE_OFFICER2

Route35NationalParkgate_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw Route35NationalParkgate_Trigger1, 0
	dw Route35NationalParkgate_Trigger2, 0
	dw Route35NationalParkgate_Trigger3, 0

.MapCallbacks:
	db 2

	; callbacks

	dbw MAPCALLBACK_NEWMAP, Route35NationalParkgate_CheckIfStillInContest

	dbw MAPCALLBACK_OBJECTS, Route35NationalParkgate_CheckIfContestDay

Route35NationalParkgate_Trigger1:
	end

Route35NationalParkgate_Trigger2:
	end

Route35NationalParkgate_Trigger3:
	priorityjump Route35NationalParkGate_LeavingContestEarly
	end

Route35NationalParkgate_CheckIfStillInContest:
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkgate_Yes
	dotrigger $0
	return

Route35NationalParkgate_Yes:
	dotrigger $2
	return

Route35NationalParkgate_CheckIfContestDay:
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, Route35NationalParkgate_IsContestDay
	if_equal THURSDAY, Route35NationalParkgate_IsContestDay
	if_equal SATURDAY, Route35NationalParkgate_IsContestDay
	checkflag ENGINE_BUG_CONTEST_TIMER
	iftrue Route35NationalParkgate_Yes
	disappear ROUTE35NATIONALPARKGATE_OFFICER1
	appear ROUTE35NATIONALPARKGATE_YOUNGSTER
	appear ROUTE35NATIONALPARKGATE_OFFICER2
	return

Route35NationalParkgate_IsContestDay:
	appear ROUTE35NATIONALPARKGATE_OFFICER1
	disappear ROUTE35NATIONALPARKGATE_YOUNGSTER
	disappear ROUTE35NATIONALPARKGATE_OFFICER2
	return

Route35NationalParkGate_LeavingContestEarly:
	applymovement PLAYER, MovementData_0x6a2e2
	spriteface ROUTE35NATIONALPARKGATE_OFFICER1, RIGHT
	opentext
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6a79a
	yesorno
	iffalse Route35NationalParkgate_GoBackIn
	writetext UnknownText_0x6a7db
	waitbutton
	closetext
	jumpstd bugcontestresultswarp

Route35NationalParkgate_GoBackIn:
	writetext UnknownText_0x6a823
	waitbutton
	closetext
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

OfficerScript_0x6a204:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, Route35NationalParkgate_NoContestToday
	if_equal MONDAY, Route35NationalParkgate_NoContestToday
	if_equal WEDNESDAY, Route35NationalParkgate_NoContestToday
	if_equal FRIDAY, Route35NationalParkgate_NoContestToday
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	scall Route35NationalParkgate_GetDayOfWeek
	writetext UnknownText_0x6a2eb
	yesorno
	iffalse Route35NationalParkgate_DeclinedToParticipate
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, Route35NationalParkgate_LeaveTheRestBehind
	special ContestDropOffMons
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkgate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6a39d
	buttonsound
	writetext UnknownText_0x6a3c7
	playsound SFX_ITEM
	waitsfx
	writetext UnknownText_0x6a3e2
	waitbutton
	closetext
	special Special_GiveParkBalls
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeOutPalettes
	waitsfx
	special Special_SelectRandomBugContestContestants
	warpfacing UP, NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

Route35NationalParkgate_EnterContest:
	checkcode VAR_FACING
	if_equal LEFT, Route35NationalParkgate_FacingLeft
	applymovement PLAYER, MovementData_0x6a2e5
	end

Route35NationalParkgate_FacingLeft:
	applymovement PLAYER, MovementData_0x6a2e9
	end

Route35NationalParkgate_LeaveTheRestBehind:
	checkcode VAR_PARTYCOUNT
	if_less_than 6, Route35NationalParkgate_LessThanFullParty
	checkcode VAR_BOXSPACE
	if_equal 0, Route35NationalParkgate_NoRoomInBox

Route35NationalParkgate_LessThanFullParty: ; 6a27d
	special CheckFirstMonIsEgg
	if_equal $1, Route35NationalParkgate_FirstMonIsEgg
	writetext UnknownText_0x6a4c6
	yesorno
	iffalse Route35NationalParkgate_DeclinedToLeaveMonsBehind
	special ContestDropOffMons
	iftrue Route35NationalParkgate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6a537
	buttonsound
	writetext UnknownText_0x6a56b
	playsound SFX_GOT_SAFARI_BALLS
	waitsfx
	buttonsound
	jump Route35NationalParkgate_OkayToProceed

Route35NationalParkgate_DeclinedToParticipate:
	writetext UnknownText_0x6a5dc
	waitbutton
	closetext
	end

Route35NationalParkgate_DeclinedToLeaveMonsBehind:
	writetext UnknownText_0x6a597
	waitbutton
	closetext
	end

Route35NationalParkgate_FirstMonIsFainted:
	writetext UnknownText_0x6a608
	waitbutton
	closetext
	end

Route35NationalParkgate_NoRoomInBox:
	writetext UnknownText_0x6a67c
	waitbutton
	closetext
	end

Route35NationalParkgate_FirstMonIsEgg:
	writetext UnknownText_0x6a71f
	waitbutton
	closetext
	end

Route35NationalParkgate_ContestIsOver:
	writetext UnknownText_0x6a84f
	waitbutton
	closetext
	end

Route35NationalParkgate_NoContestToday:
	jumptextfaceplayer UnknownText_0x6a894

OfficerScript_0x6a2ca:
	faceplayer
	opentext
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	writetext UnknownText_0x6a894
	waitbutton
	closetext
	end

YoungsterScript_0x6a2d8:
	jumptextfaceplayer UnknownText_0x6a8d8

MapRoute36NationalParkgateSignpost0Script:
	jumptext UnknownText_0x6a90e

Route35NationalParkgate_GetDayOfWeek:
	jumpstd daytotext
	end

MovementData_0x6a2e2:
	step DOWN
	turn_head LEFT
	step_end

MovementData_0x6a2e5:
	step RIGHT
	step UP
	step UP
	step_end

MovementData_0x6a2e9:
	step UP
	step_end

UnknownText_0x6a2eb:
	text "Today's @"
	text_from_ram StringBuffer3
	text "."
	line "That means the"

	para "Bug-Catching Con-"
	line "test is on today."

	para "The rules are sim-"
	line "ple."

	para "Using one of your"
	line "#MON, catch a"

	para "bug #MON to be"
	line "judged."

	para "Would you like to"
	line "give it a try?"
	done

UnknownText_0x6a39d:
	text "Here are the PARK"
	line "BALLS for the"
	cont "Contest."
	done

UnknownText_0x6a3c7:
	text "<PLAYER> received"
	line "20 PARK BALLS."
	done

UnknownText_0x6a3e2:
	text "The person who"
	line "gets the strong-"
	cont "est bug #MON"
	cont "is the winner."

	para "You have 20"
	line "minutes."

	para "If you run out of"
	line "PARK BALLS, you're"
	cont "done."

	para "You can keep the"
	line "last #MON you"
	cont "catch as your own."

	para "Go out and catch"
	line "the strongest bug"

	para "#MON you can"
	line "find!"
	done

UnknownText_0x6a4c6:
	text "Uh-oh…"

	para "You have more than"
	line "one #MON."

	para "You'll have to use"
	line "@"
	text_from_ram StringBuffer3
	text ", the"

	para "first #MON in"
	line "your party."

	para "Is that OK with"
	line "you?"
	done

UnknownText_0x6a537:
	text "Fine, we'll hold"
	line "your other #MON"
	cont "while you compete."
	done

UnknownText_0x6a56b:
	text "<PLAYER>'s #MON"
	line "were left with the"
	cont "CONTEST HELPER."
	done

UnknownText_0x6a597:
	text "Please choose the"
	line "#MON to be used"

	para "in the Contest,"
	line "then come see me."
	done

UnknownText_0x6a5dc:
	text "OK. We hope you'll"
	line "take part in the"
	cont "future."
	done

UnknownText_0x6a608:
	text "Uh-oh…"
	line "The first #MON"

	para "in your party"
	line "can't battle."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6a67c:
	text "Uh-oh…"
	line "Both your party"

	para "and your PC BOX"
	line "are full."

	para "You have no room"
	line "to put the bug"
	cont "#MON you catch."

	para "Please make room"
	line "in your party or"

	para "your PC BOX, then"
	line "come see me."
	done

UnknownText_0x6a71f:
	text "Uh-oh…"
	line "You have an EGG as"

	para "the first #MON"
	line "in your party."

	para "Please switch it"
	line "with the #MON"

	para "you want to use,"
	line "then come see me."
	done

UnknownText_0x6a79a:
	text "You still have @"
	text_from_ram StringBuffer3
	text ""
	line "minute(s) left."

	para "Do you want to"
	line "finish now?"
	done

UnknownText_0x6a7db:
	text "OK. Please wait at"
	line "the North Gate for"

	para "the announcement"
	line "of the winners."
	done

UnknownText_0x6a823:
	text "OK. Please get"
	line "back outside and"
	cont "finish up."
	done

UnknownText_0x6a84f:
	text "Today's Contest is"
	line "over. We hope you"

	para "will participate"
	line "in the future."
	done

UnknownText_0x6a894:
	text "We hold Contests"
	line "regularly in the"

	para "PARK. You should"
	line "give it a shot."
	done

UnknownText_0x6a8d8:
	text "When is the next"
	line "Bug-Catching Con-"
	cont "test going to be?"
	done

UnknownText_0x6a90e:
	text "The Bug-Catching"
	line "Contest is held on"

	para "Tuesday, Thursday"
	line "and Saturday."

	para "Not only do you"
	line "earn a prize just"

	para "for participating,"
	line "you also get to"

	para "keep the bug"
	line "#MON you may"

	para "have at the end of"
	line "the contest."
	done

Route35NationalParkgate_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $0, $3, 3, NATIONAL_PARK
	warp_def $0, $4, 4, NATIONAL_PARK
	warp_def $7, $3, 3, ROUTE_35
	warp_def $7, $4, 3, ROUTE_35

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 0, 5, SIGNPOST_READ, MapRoute36NationalParkgateSignpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 1, 2, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6a204, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	person_event SPRITE_YOUNGSTER, 5, 6, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x6a2d8, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	person_event SPRITE_OFFICER, 3, 0, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, OfficerScript_0x6a2ca, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
