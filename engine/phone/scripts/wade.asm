WadePhoneCalleeScript:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	checkflag ENGINE_WADE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .NotTuesday
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue WadeTuesdayNight

.NotTuesday:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0938

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.WantsBattle:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0a50

.HasItem:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0ab5

WadePhoneCallerScript:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	checkflag ENGINE_WADE
	iftrue .next
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .next
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .next
	farscall PhoneScript_Random2
	ifequal 0, WadeHasItem2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .next
	farscall PhoneScript_Random2
	ifequal 0, WadeWantsBattle2

.next:
	farscall PhoneScript_Random3
	ifequal 0, WadeFoundRare
	farjump Phone_GenericCall_Male

.ContestToday:
	farjump PhoneScript_BugCatchingContest

WadeTuesdayNight:
	setflag ENGINE_WADE_TUESDAY_NIGHT

WadeWantsBattle2:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	setflag ENGINE_WADE
	farjump PhoneScript_WantsToBattle_Male

WadeFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

WadeHasItem2:
	setflag ENGINE_WADE_HAS_ITEM
	landmarktotext ROUTE_31, MEM_BUFFER_2
	clearevent EVENT_WADE_HAS_BERRY
	clearevent EVENT_WADE_HAS_PSNCUREBERRY
	clearevent EVENT_WADE_HAS_PRZCUREBERRY
	clearevent EVENT_WADE_HAS_BITTER_BERRY
	random 4
	ifequal 0, .Berry
	ifequal 1, .PsnCureBerry
	ifequal 2, .PrzCureBerry
	ifequal 3, .Bitterberry

.Berry:
	setevent EVENT_WADE_HAS_BERRY
	jump .FoundBerry

.PsnCureBerry:
	setevent EVENT_WADE_HAS_PSNCUREBERRY
	jump .FoundBerry

.PrzCureBerry:
	setevent EVENT_WADE_HAS_PRZCUREBERRY
	jump .FoundBerry

.Bitterberry:
	setevent EVENT_WADE_HAS_BITTER_BERRY

.FoundBerry:
	farjump PhoneScript_FoundItem_Male
