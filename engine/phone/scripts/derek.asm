DerekPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .Nugget
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farsjump UnknownScript_0xa0988

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

.Nugget:
	getlandmarkname STRING_BUFFER_5, ROUTE_39
	farsjump UnknownScript_0xa0ad5

DerekPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANM, DEREK1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	readvar VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farscall PhoneScript_Random4
	ifequal 0, .Nugget
	farsjump Phone_GenericCall_Male

.ContestToday:
	farsjump PhoneScript_BugCatchingContest

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, ROUTE_39
	farsjump PhoneScript_FoundItem_Male
