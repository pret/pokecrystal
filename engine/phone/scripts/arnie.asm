ArniePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	checkflag ENGINE_ARNIE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .NotTuesday
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime MORN
	iftrue ArnieTuesdayMorning

.NotTuesday:
	checkflag ENGINE_YANMA_SWARM
	iftrue .AlreadySwarming
	farsjump UnknownScript_0xa0968

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_35
	farsjump UnknownScript_0xa0a6e

.AlreadySwarming:
	getlandmarkname STRING_BUFFER_5, ROUTE_35
	farsjump UnknownScript_0xa0aff

ArniePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BUG_CATCHER, ARNIE1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ARNIE
	iftrue .Swarm
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .Swarm
	farscall PhoneScript_Random2
	ifequal 0, ArnieWantsBattle

.Swarm:
	farscall PhoneScript_Random5
	ifequal 0, ArnieYanmaSwarm
	farscall PhoneScript_Random3
	ifequal 0, ArnieFoundRare
	farsjump Phone_GenericCall_Male

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

ArnieWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_35
	setflag ENGINE_ARNIE
	farsjump PhoneScript_WantsToBattle_Male

ArnieYanmaSwarm: ; start swarm
	checkflag ENGINE_YANMA_SWARM
	iftrue ArnieYanmaAlreadySwarming
	setflag ENGINE_YANMA_SWARM
	getmonname STRING_BUFFER_4, YANMA
	swarm SWARM_YANMA, ROUTE_35
	getlandmarkname STRING_BUFFER_5, ROUTE_35
	farsjump UnknownScript_0xa05ce

ArnieFoundRare:
	farsjump Phone_CheckIfUnseenRare_Male

ArnieYanmaAlreadySwarming:
	farsjump Phone_GenericCall_Male
