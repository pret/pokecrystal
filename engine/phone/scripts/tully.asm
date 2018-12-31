TullyPhoneCalleeScript:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	checkflag ENGINE_TULLY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .WaterStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue TullySundayNight

.NotSunday:
	farjump UnknownScript_0xa0990

.WantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0a82

.WaterStone:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0add

TullyPhoneCallerScript:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TULLY
	iftrue .Generic
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, TullyWantsBattle
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftrue .WaterStone
	farscall PhoneScript_Random2
	ifequal 0, TullyFoundWaterStone

.WaterStone:
	farscall PhoneScript_Random11
	ifequal 0, TullyFoundWaterStone

.Generic:
	farjump Phone_GenericCall_Male

TullySundayNight:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

TullyWantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	setflag ENGINE_TULLY
	farjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male
