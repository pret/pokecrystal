INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/landmark_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "engine/phone/scripts/reena.asm", ROMX

ReenaPhoneCalleeScript::
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	checkflag ENGINE_REENA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .NotSunday
	readvar VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue ReenaSundayMorning

.NotSunday:
	farsjump UnknownScript_0xa0928

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	farsjump UnknownScript_0xa0a46

ReenaPhoneCallerScript::
	gettrainername STRING_BUFFER_3, COOLTRAINERF, REENA1
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_REENA
	iftrue .Generic
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, ReenaWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

ReenaSundayMorning:
	setflag ENGINE_REENA_SUNDAY_MORNING

ReenaWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_27
	setflag ENGINE_REENA
	farsjump PhoneScript_WantsToBattle_Female
