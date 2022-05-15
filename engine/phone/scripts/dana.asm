DanaPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	checkflag ENGINE_DANA_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .NotThursday
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime NITE
	iftrue DanaThursdayNight

.NotThursday:
	farsjump DanaHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	farsjump DanaReminderScript

.HasThunderstone:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	farsjump DanaComePickUpScript

DanaPhoneCallerScript:
	gettrainername STRING_BUFFER_3, LASS, DANA1
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_DANA_READY_FOR_REMATCH
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
	farsjump Phone_GenericCall_Female

DanaThursdayNight:
	setflag ENGINE_DANA_THURSDAY_NIGHT

DanaWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	setflag ENGINE_DANA_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female

DanaFoundRare:
	farsjump Phone_CheckIfUnseenRare_Female

DanaHasThunderstone:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_38
	farsjump PhoneScript_FoundItem_Female
