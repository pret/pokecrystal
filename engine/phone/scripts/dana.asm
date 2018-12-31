DanaPhoneCalleeScript:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	checkflag ENGINE_DANA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .NotThursday
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime NITE
	iftrue DanaThursdayNight

.NotThursday:
	farjump UnknownScript_0xa0978

.WantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0a78

.HasThunderstone:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0acd

DanaPhoneCallerScript:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_DANA
	iftrue .Generic
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, DanaWantsBattle
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue .Thunderstone
	farscall PhoneScript_Random2
	ifequal 0, DanaHasThunderstone

.Thunderstone:
	farscall PhoneScript_Random11
	ifequal 0, DanaHasThunderstone

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, DanaFoundRare
	farjump Phone_GenericCall_Female

DanaThursdayNight:
	setflag ENGINE_DANA_THURSDAY_NIGHT

DanaWantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	setflag ENGINE_DANA
	farjump PhoneScript_WantsToBattle_Female

DanaFoundRare:
	farjump Phone_CheckIfUnseenRare_Female

DanaHasThunderstone:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female
