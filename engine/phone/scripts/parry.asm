ParryPhoneScript1:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	checkflag ENGINE_PARRY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .WantsRematch
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .WantsRematch
	checktime DAY
	iftrue ParryFridayDay

.WantsRematch:
	farjump ParryBattleWithMe

.WantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	farjump ParryHaventYouGottenTo

ParryPhoneScript2:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_PARRY
	iftrue .GenericCall
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .GenericCall
	farscall PhoneScript_Random2
	ifequal 0, ParryWantsBattle
	ifequal 1, ParryWantsBattle

.GenericCall:
	farjump Phone_GenericCall_Male

ParryFridayDay:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

ParryWantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	setflag ENGINE_PARRY
	farjump PhoneScript_WantsToBattle_Male
