IrwinPhoneScript1:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa09c8

.Rockets:
	farjump IrwinRocketRumor

IrwinPhoneScript2:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump IrwinRumorScript

.Rockets:
	farjump IrwinRocketRumor
