KenjiPhoneScript1:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	farjump KenjiAnswerPhoneScript

KenjiPhoneScript2:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farjump KenjiCallingPhoneScript
