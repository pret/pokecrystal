BeverlyPhoneCalleeScript:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farjump UnknownScript_0xa0900

.HasNugget:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump UnknownScript_0xa0aa5

BeverlyPhoneCallerScript:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farscall PhoneScript_Random4
	ifequal 0, .FoundNugget

.HasNugget:
	farjump Phone_GenericCall_Female

.FoundNugget:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female
