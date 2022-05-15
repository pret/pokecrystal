JoeyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
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
	farsjump JoeyHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_30
	farsjump JoeyReminderScript

JoeyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, YOUNGSTER, JOEY1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOEY_READY_FOR_REMATCH
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
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_30
	setflag ENGINE_JOEY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male
