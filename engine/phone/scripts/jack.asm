JackPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .NotMonday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue JackMondayMorning

.NotMonday:
	farsjump JackPhoneTipsScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	farsjump JackWantsBattleScript

JackPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, JACK1
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JackBattleTrivia
	checkflag ENGINE_JACK_READY_FOR_REMATCH
	iftrue .WaitingForBattle
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .WaitingForBattle
	farscall PhoneScript_Random2
	ifequal 0, JackWantsToBattle

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, JackFindsRare
	farsjump Phone_GenericCall_Male

JackMondayMorning:
	setflag ENGINE_JACK_MONDAY_MORNING

JackWantsToBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_NATIONAL_PARK
	setflag ENGINE_JACK_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farsjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farsjump JackTriviaScript
