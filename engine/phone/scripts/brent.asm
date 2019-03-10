BrentPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .NotMonday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentMondayMorning

.NotMonday:
	farjump UnknownScript_0xa0998

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	farjump UnknownScript_0xa0a87

BrentPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEMANIAC, BRENT1
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
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	setflag ENGINE_BRENT
	farjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farjump BrentBillTriviaScript
