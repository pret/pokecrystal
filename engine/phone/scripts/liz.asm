LizPhoneCalleeScript:
	trainertotext PICNICKER, LIZ1, MEM_BUFFER_0
	checkflag ENGINE_LIZ
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_LIZ_THURSDAY_AFTERNOON
	iftrue .NotThursday
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime DAY
	iftrue LizThursdayAfternoon

.NotThursday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0948

.WantsBattle:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0a5a

LizPhoneCallerScript:
	trainertotext PICNICKER, LIZ1, MEM_BUFFER_0
	farscall PhoneScript_Random4
	ifequal 0, LizWrongNumber
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_LIZ
	iftrue .next
	checkflag ENGINE_LIZ_THURSDAY_AFTERNOON
	iftrue .next

.next:
	farscall PhoneScript_Random2
	ifequal 0, LizGossip
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .Generic
	farscall PhoneScript_Random2
	ifequal 0, LizWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

LizThursdayAfternoon:
	setflag ENGINE_LIZ_THURSDAY_AFTERNOON

LizWantsBattle:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	setflag ENGINE_LIZ
	farjump PhoneScript_WantsToBattle_Female

LizWrongNumber:
	farjump LizWrongNumberScript

LizGossip:
	random 9
	ifequal 0, .CoolTrainerM
	ifequal 1, .Beauty
	ifequal 2, .Grunt
	ifequal 3, .Teacher
	ifequal 4, .SwimmerF
	ifequal 5, .KimonoGirl
	ifequal 6, .Skier
	ifequal 7, .Medium
	ifequal 8, .PokefanM

.CoolTrainerM:
	trainerclassname COOLTRAINERM, NICK
	jump LizGossipScript

.Beauty:
	trainerclassname BEAUTY, VICTORIA
	jump LizGossipScript

.Grunt:
	trainerclassname GRUNTM, GRUNTM_1
	jump LizGossipScript

.Teacher:
	trainerclassname TEACHER, COLETTE
	jump LizGossipScript

.SwimmerF:
	trainerclassname SWIMMERF, ELAINE
	jump LizGossipScript

.KimonoGirl:
	trainerclassname KIMONO_GIRL, NAOKO1
	jump LizGossipScript

.Skier:
	trainerclassname SKIER, ROXANNE
	jump LizGossipScript

.Medium:
	trainerclassname MEDIUM, MARTHA
	jump LizGossipScript

.PokefanM:
	trainerclassname POKEFANM, WILLIAM
	jump LizGossipScript

LizGossipScript:
	farjump UnknownScript_0xa06da
