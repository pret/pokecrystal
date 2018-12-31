JackPhoneCalleeScript:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	checkflag ENGINE_JACK
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue JackMondayMorning

.NotMonday:
	farjump JackPhoneTips

.WantsBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump JackWantsBattleScript

JackPhoneCallerScript:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JackBattleTrivia
	checkflag ENGINE_JACK
	iftrue .WaitingForBattle
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .WaitingForBattle
	farscall PhoneScript_Random2
	ifequal 0, JackWantsToBattle

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, JackFindsRare
	farjump Phone_GenericCall_Male

JackMondayMorning:
	setflag ENGINE_JACK_MONDAY_MORNING

JackWantsToBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	setflag ENGINE_JACK
	farjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farjump JackTriviaScript
