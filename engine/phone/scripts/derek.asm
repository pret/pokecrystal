DerekPhoneScript1:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .Nugget
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0988

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump UnknownScript_0xa0ad5

DerekPhoneScript2:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farscall PhoneScript_Random4
	ifequal 0, .Nugget
	farjump Phone_GenericCall_Male

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male
