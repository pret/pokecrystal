RalphPhoneCalleeScript:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
	checkflag ENGINE_RALPH
	iftrue .Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue .CheckSwarm
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .CheckSwarm
	checktime MORN
	iftrue Ralph_WednesdayMorning
.CheckSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .ReportSwarm
	farjump UnknownScript_0xa0940

.Rematch:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0a55

.ReportSwarm:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0af5

RalphPhoneCallerScript:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
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
	farjump Phone_GenericCall_Male

Ralph_WednesdayMorning:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING
Ralph_FightMe:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	setflag ENGINE_RALPH
	farjump PhoneScript_WantsToBattle_Male

Ralph_SetUpSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .Generic
	setflag ENGINE_FISH_SWARM
	pokenamemem QWILFISH, MEM_BUFFER_1
	landmarktotext ROUTE_32, MEM_BUFFER_2
	writebyte FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	farjump UnknownScript_0xa05d6

.Generic:
	farjump Phone_GenericCall_Male
