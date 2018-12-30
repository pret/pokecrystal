BrentPhoneScript1:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentMondayMorning

.NotMonday:
	farjump UnknownScript_0xa0998

.WantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0a87

BrentPhoneScript2:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BrentBillTrivia
	checkflag ENGINE_BRENT
	iftrue .Generic
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, BrentWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

BrentMondayMorning:
	setflag ENGINE_BRENT_MONDAY_MORNING

BrentWantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	setflag ENGINE_BRENT
	farjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farjump BrentBillTriviaScript
