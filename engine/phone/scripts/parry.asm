ParryPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	checkflag ENGINE_PARRY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .WantsRematch
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .WantsRematch
	checktime DAY
	iftrue ParryFridayDay

.WantsRematch:
	farsjump ParryBattleWithMe

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_45
	farsjump ParryHaventYouGottenTo

ParryPhoneCallerScript:
	gettrainername STRING_BUFFER_3, HIKER, PARRY1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_PARRY
	iftrue .GenericCall
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .GenericCall
	farscall PhoneScript_Random2
	ifequal 0, ParryWantsBattle
	ifequal 1, ParryWantsBattle

.GenericCall:
	farsjump Phone_GenericCall_Male

ParryFridayDay:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

ParryWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_45
	setflag ENGINE_PARRY
	farsjump PhoneScript_WantsToBattle_Male
