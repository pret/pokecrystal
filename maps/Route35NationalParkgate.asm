Route35NationalParkgate_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	dw Route35NationalParkgate_Trigger1, $0000
	dw Route35NationalParkgate_Trigger2, $0000
	dw Route35NationalParkgate_Trigger3, $0000

.MapCallbacks:
	db 2

	; callbacks

	dbw 5, Route35NationalParkgate_CheckIfStillInContest

	dbw 2, Route35NationalParkgate_CheckIfContestDay

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
	disappear $2
	appear $3
	appear $4
	return

Route35NationalParkgate_IsContestDay:
	appear $2
	disappear $3
	disappear $4
	return

Route35NationalParkGate_LeavingContestEarly:
	applymovement $0, MovementData_0x6a2e2
	spriteface $2, RIGHT
	loadfont
	checkcode VAR_CONTESTMINUTES
	addvar $1
	RAM2MEM $0
	writetext UnknownText_0x6a79a
	yesorno
	iffalse Route35NationalParkgate_GoBackIn
	writetext UnknownText_0x6a7db
	closetext
	loadmovesprites
	jumpstd bugcontestresultswarp

Route35NationalParkgate_GoBackIn:
	writetext UnknownText_0x6a823
	closetext
	loadmovesprites
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackBGMap
	waitbutton
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

OfficerScript_0x6a204:
	checkcode VAR_WEEKDAY
	if_equal SUNDAY, Route35NationalParkgate_NoContestToday
	if_equal MONDAY, Route35NationalParkgate_NoContestToday
	if_equal WEDNESDAY, Route35NationalParkgate_NoContestToday
	if_equal FRIDAY, Route35NationalParkgate_NoContestToday
	faceplayer
	loadfont
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	scall Route35NationalParkgate_GetDayOfWeek
	writetext UnknownText_0x6a2eb
	yesorno
	iffalse Route35NationalParkgate_DeclinedToParticipate
	checkcode VAR_PARTYCOUNT
	if_greater_than $1, Route35NationalParkgate_LeaveTheRestBehind
	special CheckFirstMonFainted
	clearevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
Route35NationalParkgate_OkayToProceed:
	setflag ENGINE_BUG_CONTEST_TIMER
	special PlayMapMusic
	writetext UnknownText_0x6a39d
	keeptextopen
	writetext UnknownText_0x6a3c7
	playsound SFX_ITEM
	waitbutton
	writetext UnknownText_0x6a3e2
	closetext
	loadmovesprites
	special Special_GiveParkBalls
	scall Route35NationalParkgate_EnterContest
	playsound SFX_ENTER_DOOR
	special FadeBlackBGMap
	waitbutton
	special Special_SelectRandomBugContestContestants
	warpfacing $1, GROUP_NATIONAL_PARK_BUG_CONTEST, MAP_NATIONAL_PARK_BUG_CONTEST, $a, $2f
	end

Route35NationalParkgate_EnterContest:
	checkcode VAR_FACING
	if_equal LEFT, Route35NationalParkgate_FacingLeft
	applymovement $0, MovementData_0x6a2e5
	end

Route35NationalParkgate_FacingLeft:
	applymovement $0, MovementData_0x6a2e9
	end

Route35NationalParkgate_LeaveTheRestBehind:
	checkcode VAR_PARTYCOUNT
	if_less_than 6, Route35NationalParkgate_LessThanFullParty
	checkcode VAR_BOXSPACE
	if_equal 0, Route35NationalParkgate_NoRoomInBox

Route35NationalParkgate_LessThanFullParty: ; 6a27d
	special Function71ac
	if_equal $1, Route35NationalParkgate_FirstMonIsEgg
	writetext UnknownText_0x6a4c6
	yesorno
	iffalse Route35NationalParkgate_DeclinedToLeaveMonsBehind
	special CheckFirstMonFainted
	iftrue Route35NationalParkgate_FirstMonIsFainted
	setevent EVENT_LEFT_MONS_WITH_CONTEST_OFFICER
	writetext UnknownText_0x6a537
	keeptextopen
	writetext UnknownText_0x6a56b
	playsound SFX_GOT_SAFARI_BALLS
	waitbutton
	keeptextopen
	jump Route35NationalParkgate_OkayToProceed

Route35NationalParkgate_DeclinedToParticipate:
	writetext UnknownText_0x6a5dc
	closetext
	loadmovesprites
	end

Route35NationalParkgate_DeclinedToLeaveMonsBehind:
	writetext UnknownText_0x6a597
	closetext
	loadmovesprites
	end

Route35NationalParkgate_FirstMonIsFainted:
	writetext UnknownText_0x6a608
	closetext
	loadmovesprites
	end

Route35NationalParkgate_NoRoomInBox:
	writetext UnknownText_0x6a67c
	closetext
	loadmovesprites
	end

Route35NationalParkgate_FirstMonIsEgg:
	writetext UnknownText_0x6a71f
	closetext
	loadmovesprites
	end

Route35NationalParkgate_ContestIsOver:
	writetext UnknownText_0x6a84f
	closetext
	loadmovesprites
	end

Route35NationalParkgate_NoContestToday:
	jumptextfaceplayer UnknownText_0x6a894

OfficerScript_0x6a2ca:
	faceplayer
	loadfont
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue Route35NationalParkgate_ContestIsOver
	writetext UnknownText_0x6a894
	closetext
	loadmovesprites
	end

YoungsterScript_0x6a2d8:
	jumptextfaceplayer UnknownText_0x6a8d8

MapRoute36NationalParkgateSignpost0Script:
	jumptext UnknownText_0x6a90e

Route35NationalParkgate_GetDayOfWeek:
	jumpstd daytotext
	end

MovementData_0x6a2e2:
	step_down
	turn_head_left
	step_end

MovementData_0x6a2e5:
	step_right
	step_up
	step_up
	step_end

MovementData_0x6a2e9:
	step_up
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
	warp_def $0, $3, 3, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $0, $4, 4, GROUP_NATIONAL_PARK, MAP_NATIONAL_PARK
	warp_def $7, $3, 3, GROUP_ROUTE_35, MAP_ROUTE_35
	warp_def $7, $4, 3, GROUP_ROUTE_35, MAP_ROUTE_35

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 0, 5, SIGNPOST_READ, MapRoute36NationalParkgateSignpost0Script

.PersonEvents:
	db 3
	person_event SPRITE_OFFICER, 5, 6, OW_UP | $2, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, OfficerScript_0x6a204, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_CONTEST_DAY
	person_event SPRITE_YOUNGSTER, 9, 10, OW_DOWN | $2, $11, -1, -1, (PAL_OW_RED << 4) | $80, 0, YoungsterScript_0x6a2d8, EVENT_ROUTE_35_NATIONAL_PARK_GATE_YOUNGSTER
	person_event SPRITE_OFFICER, 7, 4, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, OfficerScript_0x6a2ca, EVENT_ROUTE_35_NATIONAL_PARK_GATE_OFFICER_NOT_CONTEST_DAY
