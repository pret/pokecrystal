VancePhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWednesdayNight

.NotWednesday:
	farsjump VanceLookingForward

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	farsjump VanceHurryHurry

VancePhoneCallerScript:
	gettrainername STRING_BUFFER_3, BIRD_KEEPER, VANCE1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .WantsBattle
	farscall PhoneScript_Random3
	ifequal 0, VanceWantsRematch
	ifequal 1, VanceWantsRematch

.WantsBattle:
	farsjump Phone_GenericCall_Male

VanceWednesdayNight:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

VanceWantsRematch:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	setflag ENGINE_VANCE
	farsjump PhoneScript_WantsToBattle_Male
