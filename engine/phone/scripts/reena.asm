ReenaPhoneScript1:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	checkflag ENGINE_REENA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .NotSunday
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue ReenaSundayMorning

.NotSunday:
	farjump UnknownScript_0xa0928

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a46

ReenaPhoneScript2:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_REENA
	iftrue .Generic
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, ReenaWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

ReenaSundayMorning:
	setflag ENGINE_REENA_SUNDAY_MORNING

ReenaWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_REENA
	farjump PhoneScript_WantsToBattle_Female
