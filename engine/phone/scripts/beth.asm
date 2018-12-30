BethPhoneScript1:
	trainertotext COOLTRAINERF, BETH1, MEM_BUFFER_0
	checkflag ENGINE_BETH
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime DAY
	iftrue BethFridayAfternoon

.NotFriday:
	farjump UnknownScript_0xa0918

.WantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	farjump BethBattleReminderScript

BethPhoneScript2:
	trainertotext COOLTRAINERF, BETH1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BETH
	iftrue .Generic
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, BethWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

BethFridayAfternoon:
	setflag ENGINE_BETH_FRIDAY_AFTERNOON

BethWantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	setflag ENGINE_BETH
	farjump PhoneScript_WantsToBattle_Female
