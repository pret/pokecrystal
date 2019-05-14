INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "engine/phone/scripts/kenji.asm", ROMX

KenjiPhoneCalleeScript::
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	farscall PhoneScript_AnswerPhone_Male
	farsjump KenjiAnswerPhoneScript

KenjiPhoneCallerScript::
	gettrainername STRING_BUFFER_3, BLACKBELT_T, KENJI3
	farscall PhoneScript_GreetPhone_Male
	farsjump KenjiCallingPhoneScript
