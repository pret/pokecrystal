AlanPhoneScript1:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	checkflag ENGINE_ALAN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .NotWednesday
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .FireStone
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime DAY
	iftrue AlanWednesdayDay

.NotWednesday:
	farjump UnknownScript_0xa0970

.WantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0a73

.FireStone:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0ac5

AlanPhoneScript2:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
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
	farjump Phone_GenericCall_Male

AlanWednesdayDay:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

AlanWantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	setflag ENGINE_ALAN
	farjump PhoneScript_WantsToBattle_Male

AlanHasFireStone:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male
