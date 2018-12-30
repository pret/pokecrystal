WiltonPhoneScript1:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	checkflag ENGINE_WILTON
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WILTON_THURSDAY_MORNING
	iftrue .NotThursday
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue WiltonThursdayMorning

.NotThursday:
	farjump WiltonHaventFoundAnything

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump WiltonNotBiting

.HasItem:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump WiltonWantThis

WiltonPhoneScript2:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_WILTON
	iftrue .GenericCall
	checkflag ENGINE_WILTON_THURSDAY_MORNING
	iftrue .GenericCall
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .GenericCall
	farscall PhoneScript_Random2
	ifequal 0, WiltonWantsBattle
	farscall PhoneScript_Random2
	ifequal 0, WiltonHasItem

.GenericCall:
	farjump Phone_GenericCall_Male

WiltonThursdayMorning:
	setflag ENGINE_WILTON_THURSDAY_MORNING

WiltonWantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_WILTON
	farjump PhoneScript_WantsToBattle_Male

WiltonHasItem:
	setflag ENGINE_WILTON_HAS_ITEM
	landmarktotext ROUTE_44, MEM_BUFFER_2
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random 5
	ifequal 0, .UltraBall
	random 3
	ifequal 0, .GreatBall
	jump .PokeBall

.UltraBall:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	jump .FoundItem

.GreatBall:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	jump .FoundItem

.PokeBall:
	setevent EVENT_WILTON_HAS_POKE_BALL

.FoundItem:
	farjump PhoneScript_FoundItem_Male
