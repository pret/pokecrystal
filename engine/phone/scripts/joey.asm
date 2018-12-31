JoeyPhoneCalleeScript:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	checkflag ENGINE_JOEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue JoeyMondayAfternoon

.NotMonday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0930

.WantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	farjump UnknownScript_0xa0a4b

JoeyPhoneCallerScript:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOEY
	iftrue .Generic
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoeyWantsBattle
	ifequal 1, JoeyWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

JoeyMondayAfternoon:
	setflag ENGINE_JOEY_MONDAY_AFTERNOON

JoeyWantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	setflag ENGINE_JOEY
	farjump PhoneScript_WantsToBattle_Male
