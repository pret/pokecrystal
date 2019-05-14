INCLUDE "macros/data.inc"
INCLUDE "macros/enum.inc"
INCLUDE "macros/scripts/events.inc"
INCLUDE "constants/engine_flags.inc"
INCLUDE "constants/script_constants.inc"
INCLUDE "constants/trainer_constants.inc"


SECTION "engine/phone/scripts/irwin.asm", ROMX

IrwinPhoneCalleeScript::
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump UnknownScript_0xa09c8

.Rockets:
	farsjump IrwinRocketRumor

IrwinPhoneCallerScript::
	gettrainername STRING_BUFFER_3, JUGGLER, IRWIN1
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farsjump IrwinRumorScript

.Rockets:
	farsjump IrwinRocketRumor
