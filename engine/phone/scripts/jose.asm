JosePhoneScript1:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue JoseSaturdayNight

.NotSaturday:
	farjump UnknownScript_0xa0920

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

.HasItem:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

JosePhoneScript2:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOSE
	iftrue .Generic
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoseWantsBattle
	farscall PhoneScript_Random3
	ifequal 0, JoseHasStarPiece

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, JoseFoundRare
	farjump Phone_GenericCall_Male

JoseSaturdayNight:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

JoseWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_JOSE
	farjump PhoneScript_WantsToBattle_Male

JoseFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male
