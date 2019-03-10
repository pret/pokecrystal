TullyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
	checkflag ENGINE_TULLY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .WaterStone
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue TullySundayNight

.NotSunday:
	farsjump UnknownScript_0xa0990

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	farsjump UnknownScript_0xa0a82

.WaterStone:
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	farsjump UnknownScript_0xa0add

TullyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, TULLY1
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
	farsjump Phone_GenericCall_Male

TullySundayNight:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

TullyWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	setflag ENGINE_TULLY
	farsjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	getlandmarkname STRING_BUFFER_5, ROUTE_42
	farsjump PhoneScript_FoundItem_Male
