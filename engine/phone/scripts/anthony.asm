AnthonyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
	checkflag ENGINE_ANTHONY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue AnthonyFridayNight

.NotFriday:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .AlreadySwarming
	farsjump UnknownScript_0xa0950

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_33
	farsjump UnknownScript_0xa0a5f

.AlreadySwarming:
	getlandmarkname STRING_BUFFER_5, ROUTE_33
	farsjump UnknownScript_0xa0afa

AnthonyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, ANTHONY2
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
	farsjump Phone_GenericCall_Male

AnthonyFridayNight:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

AnthonyWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_33
	setflag ENGINE_ANTHONY
	farsjump PhoneScript_WantsToBattle_Male

AnthonyTriesDunsparceSwarm:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .Generic
	setflag ENGINE_DUNSPARCE_SWARM
	getmonname STRING_BUFFER_4, DUNSPARCE
	swarm SWARM_DUNSPARCE, DARK_CAVE_VIOLET_ENTRANCE
	getlandmarkname STRING_BUFFER_5, DARK_CAVE
	farsjump UnknownScript_0xa05de

.Generic:
	farsjump Phone_GenericCall_Male
