BuenaPhoneScript1:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue BuenaPhoneScript_Rocket
	checkcode VAR_HOUR
	ifgreater 17, BuenaPhoneScript_AfterMidnight1
	scall BuenaPhoneScript_CheckTimeOfDay1
	jump BuenaPhoneScript_Random1

BuenaPhoneScript2:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue BuenaPhoneScript_Rocket
	scall BuenaPhoneScript_CheckTimeOfDay2
	jump BuenaPhoneScript_Random2

BuenaPhoneScript_CheckTimeOfDay1:
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	writetext UnknownText_0xa0d42
	buttonsound
	end

.morn
	writetext UnknownText_0xa0c28
	buttonsound
	end

.day
	writetext UnknownText_0xa0c72
	buttonsound
	end

BuenaPhoneScript_AfterMidnight1:
	writetext UnknownText_0xa0caf
	end

BuenaPhoneScript_CheckTimeOfDay2:
	checkcode VAR_HOUR
	ifgreater 17, BuenaPhoneScript_AfterMidnight2
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	writetext UnknownText_0xa0e29
	buttonsound
	end

.morn
	writetext UnknownText_0xa0d96
	buttonsound
	end

.day
	writetext UnknownText_0xa0dcf
	buttonsound
	end

BuenaPhoneScript_AfterMidnight2:
	writetext UnknownText_0xa0e01
	buttonsound
	end

BuenaPhoneScript_Rocket:
	writetext UnknownText_0xa0e5e
	end

BuenaPhoneScript_Random2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostE4
	random 11
	jump .Jumptable

.PostE4:
	random 14

.Jumptable:
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two
	ifequal 3, .three
	ifequal 4, .four
	ifequal 5, .five
	ifequal 6, .six
	ifequal 7, .seven
	ifequal 8, .eight
	ifequal 9, .nine
	ifequal 10, .ten
	ifequal 11, .eleven
	ifequal 12, .twelve
	ifequal 13, .thirteen

.zero
	writetext UnknownText_0xa0efb
	jump .finish

.one
	writetext UnknownText_0xa0fcf
	jump .finish

.two
	writetext UnknownText_0xa109d
	jump .finish

.three
	writetext UnknownText_0xa1143
	jump .finish

.four
	writetext UnknownText_0xa1244
	jump .finish

.five
	writetext UnknownText_0xa1318
	jump .finish

.six
	writetext UnknownText_0xa13d8
	jump .finish

.seven
	writetext UnknownText_0xa1488
	jump .finish

.eight
	writetext UnknownText_0xa15de
	jump .finish

.nine
	writetext UnknownText_0xa1717
	jump .finish

.ten
	writetext UnknownText_0xa183d
	jump .finish

.eleven
	writetext UnknownText_0xa19b1
	jump .finish

.twelve
	writetext UnknownText_0xa1ac0
	jump .finish

.thirteen
	writetext UnknownText_0xa1bed

.finish
	end

BuenaPhoneScript_Random1:
	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	writetext UnknownText_0xa1c88
	end

.one
	writetext UnknownText_0xa1d5f
	end

.two
	writetext UnknownText_0xa1e2f
	end

INCLUDE "data/phone/text/buena.asm"
