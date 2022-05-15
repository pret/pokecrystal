QuinnPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, QUINN1
	checkflag ENGINE_QUINN_READY_FOR_REMATCH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_QUINN_SATURDAY_AFTERNOON
	iftrue .NotSaturday
	readvar VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime DAY
	iftrue QuinnSaturdayAfternoon

.NotSaturday:
	farsjump QuinnHangUpScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_1
	farsjump QuinnBattleReminderScript

QuinnPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, QUINN1
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_QUINN_READY_FOR_REMATCH
	iftrue .Generic
	checkflag ENGINE_QUINN_SATURDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, QuinnWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

QuinnSaturdayAfternoon:
	setflag ENGINE_QUINN_SATURDAY_AFTERNOON

QuinnWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_1
	setflag ENGINE_QUINN_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female
