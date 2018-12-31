ErinPhoneCalleeScript:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue ErinSaturdayNight

.NotSaturday:
	farjump ErinWorkingHardScript

.WantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	farjump ErinComeBattleScript

ErinPhoneCallerScript:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ERIN
	iftrue .GenericCall
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue .GenericCall
	farscall PhoneScript_Random3
	ifequal 0, ErinWantsBattle
	ifequal 1, ErinWantsBattle

.GenericCall:
	farjump Phone_GenericCall_Female

ErinSaturdayNight:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

ErinWantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	setflag ENGINE_ERIN
	farjump PhoneScript_WantsToBattle_Female
