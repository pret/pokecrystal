JoeyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	checkflag ENGINE_JOEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .NotMonday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue JoeyMondayAfternoon

.NotMonday:
	special RandomPhoneMon
	farsjump UnknownScript_0xa0930

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_30
	farsjump UnknownScript_0xa0a4b

JoeyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOEY
	iftrue .Generic
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoeyWantsBattle
	ifequal 1, JoeyWantsBattle

.Generic:
	farsjump Phone_GenericCall_Male

JoeyMondayAfternoon:
	setflag ENGINE_JOEY_MONDAY_AFTERNOON

JoeyWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_30
	setflag ENGINE_JOEY
	farsjump PhoneScript_WantsToBattle_Male
