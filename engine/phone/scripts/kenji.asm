KenjiPhoneCalleeScript:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	farjump KenjiAnswerPhoneScript

KenjiPhoneCallerScript:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farjump KenjiCallingPhoneScript
