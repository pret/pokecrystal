AnthonyPhoneScript1:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	checkflag ENGINE_ANTHONY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue AnthonyFridayNight

.NotFriday:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .AlreadySwarming
	farjump UnknownScript_0xa0950

.WantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	farjump UnknownScript_0xa0a5f

.AlreadySwarming:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	farjump UnknownScript_0xa0afa

AnthonyPhoneScript2:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .TriesSwarm
	checkflag ENGINE_ANTHONY
	iftrue .TriesSwarm
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .TriesSwarm
	farscall PhoneScript_Random2
	ifequal 0, AnthonyWantsBattle

.TriesSwarm:
	farscall PhoneScript_Random5
	ifequal 0, AnthonyTriesDunsparceSwarm
	farjump Phone_GenericCall_Male

AnthonyFridayNight:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

AnthonyWantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	setflag ENGINE_ANTHONY
	farjump PhoneScript_WantsToBattle_Male

AnthonyTriesDunsparceSwarm:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .Generic
	setflag ENGINE_DUNSPARCE_SWARM
	pokenamemem DUNSPARCE, MEM_BUFFER_1
	swarm SWARM_DUNSPARCE, DARK_CAVE_VIOLET_ENTRANCE
	landmarktotext DARK_CAVE, MEM_BUFFER_2
	farjump UnknownScript_0xa05de

.Generic:
	farjump Phone_GenericCall_Male
