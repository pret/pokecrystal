VancePhoneCalleeScript:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWednesdayNight

.NotWednesday:
	farjump VanceLookingForward

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump VanceHurryHurry

VancePhoneCallerScript:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .WantsBattle
	farscall PhoneScript_Random3
	ifequal 0, VanceWantsRematch
	ifequal 1, VanceWantsRematch

.WantsBattle:
	farjump Phone_GenericCall_Male

VanceWednesdayNight:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

VanceWantsRematch:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_VANCE
	farjump PhoneScript_WantsToBattle_Male
