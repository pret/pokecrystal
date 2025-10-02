KenjiPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI2
	farscall PhoneScript_AnswerPhone_Male
	farsjump KenjiAnswerPhoneScript

KenjiPhoneCallerScript:
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI2
	farscall PhoneScript_GreetPhone_Male
	farsjump KenjiCallingPhoneScript
