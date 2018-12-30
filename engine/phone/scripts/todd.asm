ToddPhoneScript1:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	checkflag ENGINE_TODD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue ToddSaturdayMorning

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleOn
	farjump UnknownScript_0xa0958

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a64

.SaleOn:
	farjump UnknownScript_0xa0b04

ToddPhoneScript2:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TODD
	iftrue .TryForSale
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .TryForSale
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoGoldenrod
	farscall PhoneScript_Random2
	ifequal 0, ToddWantsBattle

.TryForSale:
	farscall PhoneScript_Random2
	ifequal 0, ToddDeptStoreSale

.NoGoldenrod:
	farscall PhoneScript_Random3
	ifequal 0, ToddFoundRare
	farjump Phone_GenericCall_Male

ToddSaturdayMorning:
	setflag ENGINE_TODD_SATURDAY_MORNING

ToddWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_TODD
	farjump PhoneScript_WantsToBattle_Male

ToddFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ToddDeptStoreSale:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farjump UnknownScript_0xa0644
