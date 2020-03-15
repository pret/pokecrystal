RalphPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	checkflag ENGINE_RALPH
	iftrue .Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue .CheckSwarm
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .CheckSwarm
	checktime MORN
	iftrue Ralph_WednesdayMorning
.CheckSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .ReportSwarm
	farsjump RalphNoItemScript

.Rematch:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	farsjump RalphReminderScript

.ReportSwarm:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	farsjump RalphHurryScript

RalphPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .CheckSwarm
	checkflag ENGINE_RALPH
	iftrue .CheckSwarm
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue .CheckSwarm
	farscall PhoneScript_Random2
	ifequal 0, Ralph_FightMe
.CheckSwarm:
	farscall PhoneScript_Random5
	ifequal 0, Ralph_SetUpSwarm
	farsjump Phone_GenericCall_Male

Ralph_WednesdayMorning:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING
Ralph_FightMe:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	setflag ENGINE_RALPH
	farsjump PhoneScript_WantsToBattle_Male

Ralph_SetUpSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .Generic
	setflag ENGINE_FISH_SWARM
	getmonname STRING_BUFFER_4, QWILFISH
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_32
	setval FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	farsjump RalphItemScript

.Generic:
	farsjump Phone_GenericCall_Male
