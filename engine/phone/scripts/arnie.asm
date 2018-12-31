ArniePhoneCalleeScript:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
	checkflag ENGINE_ARNIE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .NotTuesday
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime MORN
	iftrue ArnieTuesdayMorning

.NotTuesday:
	checkflag ENGINE_YANMA_SWARM
	iftrue .AlreadySwarming
	farjump UnknownScript_0xa0968

.WantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa0a6e

.AlreadySwarming:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa0aff

ArniePhoneCallerScript:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
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
	farjump Phone_GenericCall_Male

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

ArnieWantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	setflag ENGINE_ARNIE
	farjump PhoneScript_WantsToBattle_Male

ArnieYanmaSwarm: ; start swarm
	checkflag ENGINE_YANMA_SWARM
	iftrue ArnieYanmaAlreadySwarming
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, MEM_BUFFER_1
	swarm SWARM_YANMA, ROUTE_35
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa05ce

ArnieFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ArnieYanmaAlreadySwarming:
	farjump Phone_GenericCall_Male
