BeverlyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farsjump UnknownScript_0xa0900

.HasNugget:
	getlandmarkname STRING_BUFFER_5, NATIONAL_PARK
	farsjump UnknownScript_0xa0aa5

BeverlyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, POKEFANF, BEVERLY1
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farscall PhoneScript_Random4
	ifequal 0, .FoundNugget

.HasNugget:
	farsjump Phone_GenericCall_Female

.FoundNugget:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	getlandmarkname STRING_BUFFER_5, NATIONAL_PARK
	farsjump PhoneScript_FoundItem_Female
