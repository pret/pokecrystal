TiffanyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	checkflag ENGINE_TIFFANY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue .NotTuesday
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasItem
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue TiffanyTuesdayAfternoon

.NotTuesday:
	farjump UnknownScript_0xa09a0

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	farjump UnknownScript_0xa0a8c

.HasItem:
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	farjump UnknownScript_0xa0ae5

TiffanyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	farscall PhoneScript_Random4
	ifequal 0, TiffanysFamilyMembers
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_TIFFANY
	iftrue .Generic
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue .Generic
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, TiffanyWantsBattle
	checkevent EVENT_TIFFANY_GAVE_PINK_BOW
	iftrue .PinkBow
	farscall PhoneScript_Random2
	ifequal 0, TiffanyHasPinkBow

.PinkBow:
	farscall PhoneScript_Random11
	ifequal 0, TiffanyHasPinkBow

.Generic:
	farjump Phone_GenericCall_Female

TiffanyTuesdayAfternoon:
	setflag ENGINE_TIFFANY_TUESDAY_AFTERNOON

TiffanyWantsBattle:
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	setflag ENGINE_TIFFANY
	farjump PhoneScript_WantsToBattle_Female

TiffanysFamilyMembers:
	random 6
	ifequal 0, .Grandma
	ifequal 1, .Grandpa
	ifequal 2, .Mom
	ifequal 3, .Dad
	ifequal 4, .Sister
	ifequal 5, .Brother

.Grandma:
	getstring STRING_BUFFER_4, GrandmaString
	jump .PoorClefairy

.Grandpa:
	getstring STRING_BUFFER_4, GrandpaString
	jump .PoorClefairy

.Mom:
	getstring STRING_BUFFER_4, MomString
	jump .PoorClefairy

.Dad:
	getstring STRING_BUFFER_4, DadString
	jump .PoorClefairy

.Sister:
	getstring STRING_BUFFER_4, SisterString
	jump .PoorClefairy

.Brother:
	getstring STRING_BUFFER_4, BrotherString
	jump .PoorClefairy

.PoorClefairy:
	farjump TiffanyItsAwful

TiffanyHasPinkBow:
	setflag ENGINE_TIFFANY_HAS_PINK_BOW
	getlandmarkname STRING_BUFFER_5, ROUTE_43
	farjump PhoneScript_FoundItem_Female
