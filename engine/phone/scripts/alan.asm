AlanPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	checkflag ENGINE_ALAN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .NotWednesday
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .FireStone
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime DAY
	iftrue AlanWednesdayDay

.NotWednesday:
	farsjump UnknownScript_0xa0970

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_36
	farsjump UnknownScript_0xa0a73

.FireStone:
	getlandmarkname STRING_BUFFER_5, ROUTE_36
	farsjump UnknownScript_0xa0ac5

AlanPhoneCallerScript:
	gettrainername STRING_BUFFER_3, SCHOOLBOY, ALAN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ALAN
	iftrue .Generic
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .Generic
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, AlanWantsBattle
	checkevent EVENT_ALAN_GAVE_FIRE_STONE
	iftrue .FireStone
	farscall PhoneScript_Random2
	ifequal 0, AlanHasFireStone

.FireStone:
	farscall PhoneScript_Random11
	ifequal 0, AlanHasFireStone

.Generic:
	farsjump Phone_GenericCall_Male

AlanWednesdayDay:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

AlanWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_36
	setflag ENGINE_ALAN
	farsjump PhoneScript_WantsToBattle_Male

AlanHasFireStone:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	getlandmarkname STRING_BUFFER_5, ROUTE_36
	farsjump PhoneScript_FoundItem_Male
