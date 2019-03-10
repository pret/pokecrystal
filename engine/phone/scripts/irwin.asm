IrwinPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump UnknownScript_0xa09c8

.Rockets:
	farsjump IrwinRocketRumor

IrwinPhoneCallerScript:
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump IrwinRumorScript

.Rockets:
	farsjump IrwinRocketRumor
