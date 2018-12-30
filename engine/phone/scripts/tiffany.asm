TiffanyPhoneScript1:
	trainertotext PICNICKER, TIFFANY3, MEM_BUFFER_0
	checkflag ENGINE_TIFFANY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue .NotTuesday
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime DAY
	iftrue TiffanyTuesdayAfternoon

.NotTuesday:
	farjump UnknownScript_0xa09a0

.WantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0a8c

.HasItem:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0ae5

TiffanyPhoneScript2:
	trainertotext PICNICKER, TIFFANY3, MEM_BUFFER_0
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
	landmarktotext ROUTE_43, MEM_BUFFER_2
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
	stringtotext GrandmaString, MEM_BUFFER_1
	jump .PoorClefairy

.Grandpa:
	stringtotext GrandpaString, MEM_BUFFER_1
	jump .PoorClefairy

.Mom:
	stringtotext MomString, MEM_BUFFER_1
	jump .PoorClefairy

.Dad:
	stringtotext DadString, MEM_BUFFER_1
	jump .PoorClefairy

.Sister:
	stringtotext SisterString, MEM_BUFFER_1
	jump .PoorClefairy

.Brother:
	stringtotext BrotherString, MEM_BUFFER_1
	jump .PoorClefairy

.PoorClefairy:
	farjump TiffanyItsAwful

TiffanyHasPinkBow:
	setflag ENGINE_TIFFANY_HAS_PINK_BOW
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female
