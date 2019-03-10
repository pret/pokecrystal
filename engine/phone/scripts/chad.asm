ChadPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	checkflag ENGINE_CHAD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime MORN
	iftrue ChadFridayMorning

.NotFriday:
	farsjump UnknownScript_0xa0980

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_38
	farsjump UnknownScript_0xa0a7d

ChadPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, CHAD1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, ChadOakGossip
	checkflag ENGINE_CHAD
	iftrue .Generic
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, ChadWantsBattle

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, ChadFoundRare
	farsjump Phone_GenericCall_Male

ChadFridayMorning:
	setflag ENGINE_CHAD_FRIDAY_MORNING

ChadWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_38
	setflag ENGINE_CHAD
	farsjump PhoneScript_WantsToBattle_Male

ChadFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ChadOakGossip:
	farsjump ChadOakGossipScript
