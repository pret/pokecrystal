HueyPhoneScript1:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue HueyWednesdayNight

.NotWednesday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0908

.WantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	farjump HueyWantsBattleScript

HueyPhoneScript2:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_HUEY
	iftrue .Flavor
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .Flavor
	farscall PhoneScript_Random3
	ifequal 0, HueyWantsBattle
	ifequal 1, HueyWantsBattle

.Flavor:
	farjump PhoneScript_MonFlavorText

HueyWednesdayNight:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

HueyWantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	setflag ENGINE_HUEY
	farjump PhoneScript_WantsToBattle_Male
