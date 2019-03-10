WiltonPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
	checkflag ENGINE_WILTON
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WILTON_THURSDAY_MORNING
	iftrue .NotThursday
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	readvar VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue WiltonThursdayMorning

.NotThursday:
	farsjump WiltonHaventFoundAnything

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	farsjump WiltonNotBiting

.HasItem:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	farsjump WiltonWantThis

WiltonPhoneCallerScript:
	gettrainername STRING_BUFFER_3, FISHER, WILTON1
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
	farsjump Phone_GenericCall_Male

WiltonThursdayMorning:
	setflag ENGINE_WILTON_THURSDAY_MORNING

WiltonWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	setflag ENGINE_WILTON
	farsjump PhoneScript_WantsToBattle_Male

WiltonHasItem:
	setflag ENGINE_WILTON_HAS_ITEM
	getlandmarkname STRING_BUFFER_5, ROUTE_44
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random 5
	ifequal 0, .UltraBall
	random 3
	ifequal 0, .GreatBall
	sjump .PokeBall

.UltraBall:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	sjump .FoundItem

.GreatBall:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	sjump .FoundItem

.PokeBall:
	setevent EVENT_WILTON_HAS_POKE_BALL

.FoundItem:
	farsjump PhoneScript_FoundItem_Male
