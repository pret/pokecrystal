INCLUDE "macros/data.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/wram_constants.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/landmark_constants.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "engine/phone/scripts/huey.asm", ROMX

HueyPhoneCalleeScript::
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue HueyWednesdayNight

.NotWednesday:
	special RandomPhoneMon
	farsjump UnknownScript_0xa0908

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LIGHTHOUSE
	farsjump HueyWantsBattleScript

HueyPhoneCallerScript::
	gettrainername STRING_BUFFER_3, SAILOR, HUEY1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_HUEY
	iftrue .Flavor
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .Flavor
	farscall PhoneScript_Random3
	ifequal 0, HueyWantsBattle
	ifequal 1, HueyWantsBattle

.Flavor:
	farsjump PhoneScript_MonFlavorText

HueyWednesdayNight:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

HueyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LIGHTHOUSE
	setflag ENGINE_HUEY
	farsjump PhoneScript_WantsToBattle_Male
