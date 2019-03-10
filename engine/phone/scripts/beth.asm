BethPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	checkflag ENGINE_BETH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue .NotFriday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue BethFridayAfternoon

.NotFriday:
	farsjump UnknownScript_0xa0918

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_26
	farsjump BethBattleReminderScript

BethPhoneCallerScript:
	gettrainername STRING_BUFFER_3, COOLTRAINERF, BETH1
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BETH
	iftrue .Generic
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, BethWantsBattle

.Generic:
	farsjump Phone_GenericCall_Female

BethFridayAfternoon:
	setflag ENGINE_BETH_FRIDAY_AFTERNOON

BethWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_26
	setflag ENGINE_BETH
	farsjump PhoneScript_WantsToBattle_Female
