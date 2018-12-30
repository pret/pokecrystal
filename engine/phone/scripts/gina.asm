GinaPhoneScript1:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	checkflag ENGINE_GINA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .NotSunday
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .HasLeafStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime DAY
	iftrue GinaSundayDay

.NotSunday:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa0960

.Rockets:
	farjump UnknownScript_0xa05c6

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a69

.HasLeafStone:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0abd

GinaPhoneScript2:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRockets
	checkflag ENGINE_GINA
	iftrue .Generic
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .Generic
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .Generic
	checkevent EVENT_GINA_GAVE_LEAF_STONE
	iftrue .GaveLeafStone
	farscall PhoneScript_Random2
	ifequal 0, GinaHasLeafStone

.GaveLeafStone:
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .Generic
	farscall PhoneScript_Random3
	ifequal 0, GinaWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

GinaSundayDay:
	setflag ENGINE_GINA_SUNDAY_AFTERNOON

GinaWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_GINA
	farjump PhoneScript_WantsToBattle_Female

GinaRockets:
	farjump UnknownScript_0xa05c6

GinaHasLeafStone:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female
