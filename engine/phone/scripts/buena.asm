BuenaPhoneCalleeScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue BuenaPhoneScript_Rocket
	readvar VAR_HOUR
	ifgreater 17, BuenaPhoneScript_AfterMidnight1
	scall BuenaPhoneScript_CheckTimeOfDay1
	sjump BuenaPhoneScript_Random1

BuenaPhoneCallerScript:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue BuenaPhoneScript_Rocket
	scall BuenaPhoneScript_CheckTimeOfDay2
	sjump BuenaPhoneScript_Random2

BuenaPhoneScript_CheckTimeOfDay1:
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	writetext BuenaPhoneNiteText
	buttonsound
	end

.morn
	writetext BuenaPhoneMorningText
	buttonsound
	end

.day
	writetext BuenaPhoneDayText
	buttonsound
	end

BuenaPhoneScript_AfterMidnight1:
	writetext BuenaPhoneMidnightText
	end

BuenaPhoneScript_CheckTimeOfDay2:
	readvar VAR_HOUR
	ifgreater 17, BuenaPhoneScript_AfterMidnight2
	checktime MORN
	iftrue .morn
	checktime DAY
	iftrue .day
	writetext BuenaPhoneNite2Text
	buttonsound
	end

.morn
	writetext BuenaPhoneMorning2Text
	buttonsound
	end

.day
	writetext BuenaPhoneDay2Text
	buttonsound
	end

BuenaPhoneScript_AfterMidnight2:
	writetext BuenaPhoneMidnight2Text
	buttonsound
	end

BuenaPhoneScript_Rocket:
	writetext BuenaPhoneRocketText
	end

BuenaPhoneScript_Random2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .PostE4
	random 11
	sjump .Jumptable

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
	writetext BuenaPhoneZeroRandom2Text
	sjump .finish

.one
	writetext BuenaPhoneOneRandom2Text
	sjump .finish

.two
	writetext BuenaPhoneTwoRandom2Text
	sjump .finish

.three
	writetext BuenaPhoneThreeRandom2Text
	sjump .finish

.four
	writetext BuenaPhoneFourRandom2Text
	sjump .finish

.five
	writetext BuenaPhoneFiveRandom2Text
	sjump .finish

.six
	writetext BuenaPhoneSixRandom2Text
	sjump .finish

.seven
	writetext BuenaPhoneSevenRandom2Text
	sjump .finish

.eight
	writetext BuenaPhoneEightRandom2Text
	sjump .finish

.nine
	writetext BuenaPhoneNineRandom2Text
	sjump .finish

.ten
	writetext BuenaPhoneTenRandom2Text
	sjump .finish

.eleven
	writetext BuenaPhoneElevenRandom2Text
	sjump .finish

.twelve
	writetext BuenaPhoneTwelveRandom2Text
	sjump .finish

.thirteen
	writetext BuenaPhoneThirteenRandom2Text

.finish
	end

BuenaPhoneScript_Random1:
	random 3
	ifequal 0, .zero
	ifequal 1, .one
	ifequal 2, .two

.zero
	writetext BuenaPhoneZeroRandomText
	end

.one
	writetext BuenaPhoneOneRandomText
	end

.two
	writetext BuenaPhoneTwoRandomText
	end

INCLUDE "data/phone/text/buena.asm"
