GavenPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .NotThursday
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue GavenThursdayMorning

.NotThursday:
	farsjump UnknownScript_0xa0910

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_26
	farsjump UnknownScript_0xa0a37

GavenPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERM, GAVEN3
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_GAVEN
	iftrue .WaitingForBattle
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .WaitingForBattle
	farscall PhoneScript_Random2
	ifequal 0, GavenWantsRematch

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, GavenFoundRare
	farsjump Phone_GenericCall_Male

GavenThursdayMorning:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

GavenWantsRematch:
	getlandmarkname STRING_BUFFER_5, ROUTE_26
	setflag ENGINE_GAVEN
	farsjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male
