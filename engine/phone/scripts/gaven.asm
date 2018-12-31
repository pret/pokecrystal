GavenPhoneCalleeScript:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .NotThursday
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue GavenThursdayMorning

.NotThursday:
	farjump UnknownScript_0xa0910

.WantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	farjump UnknownScript_0xa0a37

GavenPhoneCallerScript:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
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
	farjump Phone_GenericCall_Male

GavenThursdayMorning:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

GavenWantsRematch:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	setflag ENGINE_GAVEN
	farjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farjump Phone_CheckIfUnseenRare_Male
