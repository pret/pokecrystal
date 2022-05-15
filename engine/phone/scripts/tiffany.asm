TiffanyPhoneCalleeScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
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
	farsjump TiffanyNoItemScript

.WantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump TiffanyAsleepScript

.HasItem:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump TiffanyHurryScript

TiffanyPhoneCallerScript:
	gettrainername STRING_BUFFER_3, PICNICKER, TIFFANY3
	farscall PhoneScript_Random4
	ifequal 0, TiffanysFamilyMembers
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_TIFFANY_READY_FOR_REMATCH
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
	farsjump Phone_GenericCall_Female

TiffanyTuesdayAfternoon:
	setflag ENGINE_TIFFANY_TUESDAY_AFTERNOON

TiffanyWantsBattle:
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	setflag ENGINE_TIFFANY_READY_FOR_REMATCH
	farsjump PhoneScript_WantsToBattle_Female

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
	sjump .PoorClefairy

.Grandpa:
	getstring STRING_BUFFER_4, GrandpaString
	sjump .PoorClefairy

.Mom:
	getstring STRING_BUFFER_4, MomString
	sjump .PoorClefairy

.Dad:
	getstring STRING_BUFFER_4, DadString
	sjump .PoorClefairy

.Sister:
	getstring STRING_BUFFER_4, SisterString
	sjump .PoorClefairy

.Brother:
	getstring STRING_BUFFER_4, BrotherString
	sjump .PoorClefairy

.PoorClefairy:
	farsjump TiffanyItsAwful

TiffanyHasPinkBow:
	setflag ENGINE_TIFFANY_HAS_PINK_BOW
	getlandmarkname STRING_BUFFER_5, LANDMARK_ROUTE_43
	farsjump PhoneScript_FoundItem_Female
