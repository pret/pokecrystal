UnusedPhoneScript: ; 0xbcea5
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript: ; 0xbceaa
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .bcec5
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	jump MomPhoneNoPokemonScript

.bcec5 ; 0xbcec5
	checkevent EVENT_IN_YOUR_ROOM
	iftrue MomPhoneHangUpScript
	farwritetext MomPhoneGreetingText
	buttonsound
	mapnametotext $0
	checkcode VAR_ROOFPALETTE
	if_equal $1, MomPhonePalette1
	if_equal $2, MomPhonePalette2
	jump UnknownScript_0xbcf2f

MomPhoneLandmark: ; 0xbcedf
	farwritetext MomPhoneLandmarkText
	buttonsound
	jump UnknownScript_0xbcf37

MomPhonePalette1: ; 0xbcee7
	checkcode VAR_MAPGROUP
	if_equal GROUP_NEW_BARK_TOWN, .newbark
	if_equal GROUP_CHERRYGROVE_CITY, .cherrygrove
	if_equal GROUP_VIOLET_CITY, .violet
	if_equal GROUP_AZALEA_TOWN, .azalea
	if_equal GROUP_GOLDENROD_CITY, .goldenrod
	farwritetext MomPhoneGenericAreaText
	buttonsound
	jump UnknownScript_0xbcf37

.newbark ; 0xbcf05
	farwritetext MomPhoneNewBarkText
	buttonsound
	jump UnknownScript_0xbcf37

.cherrygrove ; 0xbcf0d
	farwritetext MomPhoneCherrygroveText
	buttonsound
	jump UnknownScript_0xbcf37

.violet ; 0xbcf15
	landmarktotext SPROUT_TOWER, 1
	jump MomPhoneLandmark
.azalea ; 0xbcf1b
	landmarktotext SLOWPOKE_WELL, 1
	jump MomPhoneLandmark
.goldenrod ; 0xbcf21
	landmarktotext RADIO_TOWER, 1
	jump MomPhoneLandmark

MomPhonePalette2: ; 0xbcf27
	farwritetext MomOtherAreaText
	buttonsound
	jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	farwritetext MomDeterminedText
	buttonsound
	jump UnknownScript_0xbcf37

UnknownScript_0xbcf37: ; 0xbcf37
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse CheckIfMomHasMoney
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf55
	jump UnknownScript_0xbcf63

CheckIfMomHasMoney: ; 0xbcf49
	checkmoney $1, 0
	if_equal $0, MomHasMoney
	jump MomHasNoMoney

UnknownScript_0xbcf55: ; 0xbcf55
	readmoney $1, $0
	farwritetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf63: ; 0xbcf63
	farwritetext UnknownText_0x1b41ea
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomHasNoMoney: ; 0xbcf6e
	farwritetext UnknownText_0x1b420d
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomHasMoney: ; 0xbcf79
	readmoney $1, $0
	farwritetext UnknownText_0x1b4249
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript: ; 0xbcf87
	setflag ENGINE_MOM_SAVING_MONEY
	farwritetext UnknownText_0x1b4289
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript: ; 0xbcf92
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneHangUpScript: ; 0xbcf9d
	farwritetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript: ; 0xbcfa2
	farwritetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript: ; 0xbcfa7
	farwritetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript: ; 0xbcfac
	farwritetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript: ; 0xbcfb1
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_DST
	specialphonecall SPECIALCALL_NONE
	farwritetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

; Bill

BillPhoneScript1: ; 0xbcfc5
	checkday
	iftrue .daygreet
	checknite
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	jump .main

.daygreet ; 0xbcfd7
	farwritetext BillPhoneDayGreetingText
	buttonsound
	jump .main

.nitegreet ; 0xbcfdf
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	jump .main

.main ; 0xbcfe7
	farwritetext BillPhoneGeneriText
	buttonsound
	checkcode VAR_BOXSPACE
	RAM2MEM $0
	if_equal $0, .full
	if_less_than $6, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull ; 0xbcffd
	farwritetext BillPhoneNearlyFullText
	end

.full ; 0xbd002
	farwritetext BillPhoneFullText
	end

BillPhoneScript2: ; 0xbd007
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end

; Elm

ElmPhoneScript1: ; 0xbd00d
	checkcode VAR_SPECIALPHONECALL
	if_equal $1, .pokerus
	checkevent EVENT_SHOWED_TOGEPI_TO_ELM
	iftrue .discovery
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iffalse .next
	checkevent EVENT_TOGEPI_HATCHED
	iftrue .egghatched
.next
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .eggunhatched
	checkevent EVENT_ELMS_AIDE_IN_LAB
	iftrue .assistant
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .checkingegg
	checkevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	iftrue .stolen
	checkevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	iftrue .sawmrpokemon
	farwritetext ElmPhoneStartText
	end

.sawmrpokemon ; 0xbd048
	farwritetext ElmPhoneSawMrPokemonText
	end

.stolen ; 0xbd04d
	farwritetext ElmPhonePokemonStolenText
	end

.checkingegg ; 0xbd052
	farwritetext ElmPhoneCheckingEggText
	end

.assistant ; 0xbd057
	farwritetext ElmPhoneAssistantText
	end

.eggunhatched ; 0xbd05c
	farwritetext ElmPhoneEggUnhatchedText
	end

.egghatched ; 0xbd061
	farwritetext ElmPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery ; 0xbd069
	random $2
	if_equal $0, .nextdiscovery
	farwritetext ElmPhoneDiscovery1Text
	end

.nextdiscovery ; 0xbd074
	farwritetext ElmPhoneDiscovery2Text
	end

.pokerus ; 0xbd079
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

ElmPhoneScript2: ; 0xbd081
	checkcode VAR_SPECIALPHONECALL
	if_equal $2, .disaster
	if_equal $3, .assistant
	if_equal $4, .rocket
	if_equal $5, .gift
	if_equal $8, .gift
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster ; 0xbd09f
	farwritetext ElmPhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant ; 0xbd0aa
	farwritetext ElmPhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket ; 0xbd0b8
	farwritetext ElmPhoneRocketText
	specialphonecall SPECIALCALL_NONE
	end

.gift ; 0xbd0c0
	farwritetext ElmPhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.unused ; 0xbd0c8
	farwritetext ElmPhoneUnusedText
	specialphonecall SPECIALCALL_NONE
	end
; bd0d0

; Jack

JackPhoneScript1:
	trainertotext SCHOOLBOY, JACK1, $0
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd0f3
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue UnknownScript_0xbd0ef
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0xbd0ef
	checkmorn
	iftrue UnknownScript_0xbd12a

UnknownScript_0xbd0ef:
	farjump UnknownScript_0xa08f8

UnknownScript_0xbd0f3:
	landmarktotext NATIONAL_PARK, $2
	farjump UnknownScript_0xa0a2d

JackPhoneScript2:
	trainertotext SCHOOLBOY, JACK1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd13b
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd11e
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue UnknownScript_0xbd11e
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd12d

UnknownScript_0xbd11e:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd137
	farjump UnknownScript_0xa0000

UnknownScript_0xbd12a:
	setflag ENGINE_JACK_MONDAY_MORNING

UnknownScript_0xbd12d:
	landmarktotext NATIONAL_PARK, $2
	setflag ENGINE_JACK
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd137:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd13b:
	farjump JackTriviaScript

; Beverly

BeverlyPhoneScript1:
	trainertotext POKEFANF, BEVERLY1, $0
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd151
	farjump UnknownScript_0xa0900

UnknownScript_0xbd151:
	landmarktotext NATIONAL_PARK, $2
	farjump UnknownScript_0xa0aa5

BeverlyPhoneScript2:
	trainertotext POKEFANF, BEVERLY1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd16e
	farscall PhoneScript_Random4
	if_equal $0, UnknownScript_0xbd172

UnknownScript_0xbd16e:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd172:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	landmarktotext NATIONAL_PARK, $2
	farjump PhoneScript_FoundItem_Female

; Huey

HueyPhoneScript1:
	trainertotext SAILOR, HUEY1, $0
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, .NotWednesday
	checknite
	iftrue HueyWednesdayNight

.NotWednesday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0908

.WantsBattle:
	landmarktotext LIGHTHOUSE, $2
	farjump UnknownScript_0xa0a32

HueyPhoneScript2:
	trainertotext SAILOR, HUEY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_HUEY
	iftrue .Flavor
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .Flavor
	farscall PhoneScript_Random3
	if_equal $0, HueyWantsBattle
	if_equal $1, HueyWantsBattle

.Flavor:
	farjump PhoneScript_MonFlavorText

HueyWednesdayNight:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

HueyWantsBattle:
	landmarktotext LIGHTHOUSE, $2
	setflag ENGINE_HUEY
	farjump PhoneScript_WantsToBattle_Male

; Gaven

GavenPhoneScript1:
	trainertotext COOLTRAINERM, GAVEN3, $0
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .NotThursday
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, .NotThursday
	checkmorn
	iftrue GavenThursdayMorning

.NotThursday:
	farjump UnknownScript_0xa0910

.WantsBattle:
	landmarktotext ROUTE_26, $2
	farjump UnknownScript_0xa0a37

GavenPhoneScript2:
	trainertotext COOLTRAINERM, GAVEN3, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd220
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue UnknownScript_0xbd220
	farscall PhoneScript_Random2
	if_equal $0, GavenWantsRematch

UnknownScript_0xbd220:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd239
	farjump UnknownScript_0xa0000

GavenThursdayMorning:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

GavenWantsRematch:
	landmarktotext ROUTE_26, $2
	setflag ENGINE_GAVEN
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd239:
	farjump UnknownScript_0xa0584

; Beth

BethPhoneScript1:
	trainertotext COOLTRAINERF, BETH1, $0
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd260
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbd25c
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbd25c
	checkday
	iftrue UnknownScript_0xbd287

UnknownScript_0xbd25c:
	farjump UnknownScript_0xa0918

UnknownScript_0xbd260:
	landmarktotext ROUTE_26, $2
	farjump UnknownScript_0xa0a3c

BethPhoneScript2:
	trainertotext COOLTRAINERF, BETH1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd283
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbd283
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd28a

UnknownScript_0xbd283:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd287:
	setflag ENGINE_BETH_FRIDAY_AFTERNOON

UnknownScript_0xbd28a:
	landmarktotext ROUTE_26, $2
	setflag ENGINE_BETH
	farjump PhoneScript_WantsToBattle_Female

; Jose

JosePhoneScript1:
	trainertotext BIRD_KEEPER, JOSE2, $0
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2c4
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, .NotSaturday
	checknite
	iftrue JoseSaturdayNight

.NotSaturday:
	farjump UnknownScript_0xa0920

.WantsBattle:
	landmarktotext ROUTE_27, $2
	farjump UnknownScript_0xa0a41

UnknownScript_0xbd2c4:
	landmarktotext ROUTE_27, $2
	farjump UnknownScript_0xa0a41

JosePhoneScript2:
	trainertotext BIRD_KEEPER, JOSE2, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2f5
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd304
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd312

UnknownScript_0xbd2f5:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd30e
	farjump UnknownScript_0xa0000

JoseSaturdayNight:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

UnknownScript_0xbd304:
	landmarktotext ROUTE_27, $2
	setflag ENGINE_JOSE
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd30e:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd312:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	landmarktotext ROUTE_27, $2
	farjump PhoneScript_FoundItem_Male

; Reena

ReenaPhoneScript1:
	trainertotext COOLTRAINERF, REENA1, $0
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd33f
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue UnknownScript_0xbd33b
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, UnknownScript_0xbd33b
	checkmorn
	iftrue UnknownScript_0xbd366

UnknownScript_0xbd33b:
	farjump UnknownScript_0xa0928

UnknownScript_0xbd33f:
	landmarktotext ROUTE_27, $2
	farjump UnknownScript_0xa0a46

ReenaPhoneScript2:
	trainertotext COOLTRAINERF, REENA1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd362
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue UnknownScript_0xbd362
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd369

UnknownScript_0xbd362:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd366:
	setflag ENGINE_REENA_SUNDAY_MORNING

UnknownScript_0xbd369:
	landmarktotext ROUTE_27, $2
	setflag ENGINE_REENA
	farjump PhoneScript_WantsToBattle_Female

; Joey

JoeyPhoneScript1:
	trainertotext YOUNGSTER, JOEY1, $0
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd399
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue UnknownScript_0xbd392
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0xbd392
	checkday
	iftrue UnknownScript_0xbd3c4

UnknownScript_0xbd392:
	special RandomPhoneMon
	farjump UnknownScript_0xa0930

UnknownScript_0xbd399:
	landmarktotext ROUTE_30, $2
	farjump UnknownScript_0xa0a4b

JoeyPhoneScript2:
	trainertotext YOUNGSTER, JOEY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd3c0
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue UnknownScript_0xbd3c0
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd3c7
	if_equal $1, UnknownScript_0xbd3c7

UnknownScript_0xbd3c0:
	farjump UnknownScript_0xa0000

UnknownScript_0xbd3c4:
	setflag ENGINE_JOEY_MONDAY_AFTERNOON

UnknownScript_0xbd3c7:
	landmarktotext ROUTE_30, $2
	setflag ENGINE_JOEY
	farjump PhoneScript_WantsToBattle_Male

; Wade

WadePhoneScript1:
	trainertotext BUG_CATCHER, WADE1, $0
	checkflag ENGINE_WADE
	iftrue UnknownScript_0xbd41a
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue UnknownScript_0xbd3f6
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0xbd421
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, UnknownScript_0xbd3f6
	checknite
	iftrue UnknownScript_0xbd484

UnknownScript_0xbd3f6:
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd412
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue UnknownScript_0xbd412
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0xbd416
	if_equal THURSDAY, UnknownScript_0xbd416
	if_equal SATURDAY, UnknownScript_0xbd416

UnknownScript_0xbd412:
	farjump UnknownScript_0xa0938

UnknownScript_0xbd416:
	farjump PhoneScript_BugCatchingContest

UnknownScript_0xbd41a:
	landmarktotext ROUTE_31, $2
	farjump UnknownScript_0xa0a50

UnknownScript_0xbd421:
	landmarktotext ROUTE_31, $2
	farjump UnknownScript_0xa0ab5

WadePhoneScript2:
	trainertotext BUG_CATCHER, WADE1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, Wade_ContestToday
	if_equal THURSDAY, Wade_ContestToday
	if_equal SATURDAY, Wade_ContestToday

.NoContest:
	checkflag ENGINE_WADE
	iftrue UnknownScript_0xbd474
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue UnknownScript_0xbd474
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0xbd474
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd495
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd474
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd487

UnknownScript_0xbd474:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd491
	farjump UnknownScript_0xa0000

Wade_ContestToday:
	farjump PhoneScript_BugCatchingContest

UnknownScript_0xbd484:
	setflag ENGINE_WADE_TUESDAY_NIGHT

UnknownScript_0xbd487:
	landmarktotext ROUTE_31, $2
	setflag ENGINE_WADE
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd491:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd495:
	setflag ENGINE_WADE_HAS_ITEM
	landmarktotext ROUTE_31, $2
	clearevent EVENT_WADE_HAS_BERRY
	clearevent EVENT_WADE_HAS_PSNCUREBERRY
	clearevent EVENT_WADE_HAS_PRZCUREBERRY
	clearevent EVENT_WADE_HAS_BITTER_BERRY
	random $4
	if_equal $0, UnknownScript_0xbd4b9
	if_equal $1, UnknownScript_0xbd4bf
	if_equal $2, UnknownScript_0xbd4c5
	if_equal $3, UnknownScript_0xbd4cb

UnknownScript_0xbd4b9:
	setevent EVENT_WADE_HAS_BERRY
	jump UnknownScript_0xbd4ce

UnknownScript_0xbd4bf:
	setevent EVENT_WADE_HAS_PSNCUREBERRY
	jump UnknownScript_0xbd4ce

UnknownScript_0xbd4c5:
	setevent EVENT_WADE_HAS_PRZCUREBERRY
	jump UnknownScript_0xbd4ce

UnknownScript_0xbd4cb:
	setevent EVENT_WADE_HAS_BITTER_BERRY

UnknownScript_0xbd4ce:
	farjump PhoneScript_FoundItem_Male

; Ralph

RalphPhoneScript1:
	trainertotext FISHER, RALPH1, $0
	checkflag ENGINE_RALPH
	iftrue Ralph_Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue Ralph_CheckSwarm
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, Ralph_CheckSwarm
	checkmorn
	iftrue Ralph_WednesdayMorning
Ralph_CheckSwarm:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue Ralph_ReportSwarm
	farjump UnknownScript_0xa0940

Ralph_Rematch:
	landmarktotext ROUTE_32, $2
	farjump UnknownScript_0xa0a55

Ralph_ReportSwarm:
	landmarktotext ROUTE_32, $2
	farjump UnknownScript_0xa0af5

RalphPhoneScript2:
	trainertotext FISHER, RALPH1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse Ralph_CheckSwarm2
	checkflag ENGINE_RALPH
	iftrue Ralph_CheckSwarm2
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue Ralph_CheckSwarm2
	farscall PhoneScript_Random2
	if_equal $0, Ralph_FightMe
Ralph_CheckSwarm2:
	farscall PhoneScript_Random5
	if_equal $0, Ralph_SetUpSwarm
	farjump UnknownScript_0xa0000

Ralph_WednesdayMorning:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING
Ralph_FightMe:
	landmarktotext ROUTE_32, $2
	setflag ENGINE_RALPH
	farjump PhoneScript_WantsToBattle_Male

Ralph_SetUpSwarm:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue UnknownScript_0xbd55c
	setflag ENGINE_SPECIAL_WILDDATA
	pokenamemem QWILFISH, $1
	landmarktotext ROUTE_32, $2
	writebyte FISHSWARM_QWILFISH
	special Special_ActivateFishingSwarm
	farjump UnknownScript_0xa05d6

UnknownScript_0xbd55c:
	farjump UnknownScript_0xa0000

; Liz

LizPhoneScript1:
	trainertotext PICNICKER, LIZ1, $0
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd586
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_LIZ_THURSDAY_AFTERNOON
	iftrue .NotThursday
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, .NotThursday
	checkday
	iftrue LizThursdayAfternoon

.NotThursday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0948

UnknownScript_0xbd586:
	landmarktotext ROUTE_32, $2
	farjump UnknownScript_0xa0a5a

LizPhoneScript2:
	trainertotext PICNICKER, LIZ1, $0
	farscall PhoneScript_Random4
	if_equal $0, UnknownScript_0xbd5d0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd5a9
	checkflag ENGINE_LIZ_THURSDAY_AFTERNOON
	iftrue UnknownScript_0xbd5a9

UnknownScript_0xbd5a9:
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd5d4
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd5bf
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd5c6

UnknownScript_0xbd5bf:
	farjump UnknownScript_0xa0017

LizThursdayAfternoon:
	setflag ENGINE_LIZ_THURSDAY_AFTERNOON

UnknownScript_0xbd5c6:
	landmarktotext ROUTE_32, $2
	setflag ENGINE_LIZ
	farjump PhoneScript_WantsToBattle_Female

UnknownScript_0xbd5d0:
	farjump LizWrongNumber

UnknownScript_0xbd5d4:
	random $9
	if_equal $0, UnknownScript_0xbd5fa
	if_equal $1, UnknownScript_0xbd600
	if_equal $2, UnknownScript_0xbd606
	if_equal $3, UnknownScript_0xbd60c
	if_equal $4, UnknownScript_0xbd612
	if_equal $5, UnknownScript_0xbd618
	if_equal $6, UnknownScript_0xbd61e
	if_equal $7, UnknownScript_0xbd624
	if_equal $8, UnknownScript_0xbd62a

UnknownScript_0xbd5fa:
	trainerclassname COOLTRAINERM, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd600:
	trainerclassname BEAUTY, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd606:
	trainerclassname GRUNTM, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd60c:
	trainerclassname TEACHER, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd612:
	trainerclassname SWIMMERF, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd618:
	trainerclassname KIMONO_GIRL, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd61e:
	trainerclassname SKIER, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd624:
	trainerclassname MEDIUM, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd62a:
	trainerclassname POKEFANM, $1
	jump UnknownScript_0xbd630

UnknownScript_0xbd630:
	farjump UnknownScript_0xa06da

; Anthony

AnthonyPhoneScript1:
	trainertotext HIKER, ANTHONY2, $0
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd65d
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, .NotFriday
	checknite
	iftrue UnknownScript_0xbd699

.NotFriday:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0xbd664
	farjump UnknownScript_0xa0950

UnknownScript_0xbd65d:
	landmarktotext ROUTE_33, $2
	farjump UnknownScript_0xa0a5f

UnknownScript_0xbd664:
	landmarktotext ROUTE_33, $2
	farjump UnknownScript_0xa0afa

AnthonyPhoneScript2:
	trainertotext HIKER, ANTHONY2, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd68d
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd68d
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue UnknownScript_0xbd68d
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd69c

UnknownScript_0xbd68d:
	farscall PhoneScript_Random5
	if_equal $0, UnknownScript_0xbd6a6
	farjump UnknownScript_0xa0000

UnknownScript_0xbd699:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

UnknownScript_0xbd69c:
	landmarktotext ROUTE_33, $2
	setflag ENGINE_ANTHONY
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd6a6:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0xbd6bd
	setflag ENGINE_DUNSPARCE_SWARM
	pokenamemem DUNSPARCE, $1
	swarm SWARM_DUNSPARCE, DARK_CAVE_VIOLET_ENTRANCE
	landmarktotext DARK_CAVE, $2
	farjump UnknownScript_0xa05de

UnknownScript_0xbd6bd:
	farjump UnknownScript_0xa0000

; Todd

ToddPhoneScript1:
	trainertotext CAMPER, TODD1, $0
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd6ea
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, .NotSaturday
	checkmorn
	iftrue ToddSaturdayMorning

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue UnknownScript_0xbd6f1
	farjump UnknownScript_0xa0958

UnknownScript_0xbd6ea:
	landmarktotext ROUTE_34, $2
	farjump UnknownScript_0xa0a64

UnknownScript_0xbd6f1:
	farjump UnknownScript_0xa0b04

ToddPhoneScript2:
	trainertotext CAMPER, TODD1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse ToddNoGoldenrod
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd72e

UnknownScript_0xbd717:
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd73c

ToddNoGoldenrod:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd738
	farjump UnknownScript_0xa0000

ToddSaturdayMorning:
	setflag ENGINE_TODD_SATURDAY_MORNING

UnknownScript_0xbd72e:
	landmarktotext ROUTE_34, $2
	setflag ENGINE_TODD
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd738:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd73c:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farjump UnknownScript_0xa0644

; Gina

GinaPhoneScript1:
	trainertotext PICNICKER, GINA1, $0
	checkflag ENGINE_GINA
	iftrue UnknownScript_0xbd776
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .NotSunday
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0xbd77d
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, .NotSunday
	checkday
	iftrue GinaSundayDay

.NotSunday:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa0960

.Rockets:
	farjump UnknownScript_0xa05c6

UnknownScript_0xbd776:
	landmarktotext ROUTE_34, $2
	farjump UnknownScript_0xa0a69

UnknownScript_0xbd77d:
	landmarktotext ROUTE_34, $2
	farjump UnknownScript_0xa0abd

GinaPhoneScript2:
	trainertotext PICNICKER, GINA1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd7d9
	checkflag ENGINE_GINA
	iftrue UnknownScript_0xbd7c8
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue UnknownScript_0xbd7c8
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0xbd7c8
	checkevent EVENT_GINA_GAVE_LEAF_STONE
	iftrue UnknownScript_0xbd7b2
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd7dd

UnknownScript_0xbd7b2:
	farscall PhoneScript_Random11
	if_equal $0, UnknownScript_0xbd7dd
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd7c8
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd7cf

UnknownScript_0xbd7c8:
	farjump UnknownScript_0xa0017

GinaSundayDay:
	setflag ENGINE_GINA_SUNDAY_AFTERNOON

UnknownScript_0xbd7cf:
	landmarktotext ROUTE_34, $2
	setflag ENGINE_GINA
	farjump PhoneScript_WantsToBattle_Female

UnknownScript_0xbd7d9:
	farjump UnknownScript_0xa05c6

UnknownScript_0xbd7dd:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	landmarktotext ROUTE_34, $2
	farjump PhoneScript_FoundItem_Female

; Irwin

IrwinPhoneScript1:
	trainertotext JUGGLER, IRWIN1, $0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa09c8

.Rockets:
	farjump UnknownScript_0xa05be

IrwinPhoneScript2:
	trainertotext JUGGLER, IRWIN1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump IrwinRumorScript

.Rockets:
	farjump UnknownScript_0xa05be

; Arnie

ArniePhoneScript1:
	trainertotext BUG_CATCHER, ARNIE1, $0
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd83c
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .NotTuesday
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, .NotTuesday
	checkmorn
	iftrue ArnieTuesdayMorning

.NotTuesday:
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0xbd843
	farjump UnknownScript_0xa0968

UnknownScript_0xbd83c:
	landmarktotext ROUTE_35, $2
	farjump UnknownScript_0xa0a6e

UnknownScript_0xbd843:
	landmarktotext ROUTE_35, $2
	farjump UnknownScript_0xa0aff

ArniePhoneScript2:
	trainertotext BUG_CATCHER, ARNIE1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd866
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue UnknownScript_0xbd866
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd87d

UnknownScript_0xbd866:
	farscall PhoneScript_Random5
	if_equal $0, ArnieYanmaSwarm
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd89e
	farjump UnknownScript_0xa0000

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

UnknownScript_0xbd87d:
	landmarktotext ROUTE_35, $2
	setflag ENGINE_ARNIE
	farjump PhoneScript_WantsToBattle_Male

ArnieYanmaSwarm: ; start swarm
	checkflag ENGINE_YANMA_SWARM
	iftrue ArnieYanmaAlreadySwarming
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, $1
	swarm SWARM_YANMA, ROUTE_35
	landmarktotext ROUTE_35, $2
	farjump UnknownScript_0xa05ce

UnknownScript_0xbd89e:
	farjump UnknownScript_0xa0584

ArnieYanmaAlreadySwarming:
	farjump UnknownScript_0xa0000

; Alan

AlanPhoneScript1:
	trainertotext SCHOOLBOY, ALAN1, $0
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd8cf
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .NotWednesday
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue AlanHasFireStone
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, .NotWednesday
	checkday
	iftrue AlanWednesdayDay

.NotWednesday:
	farjump UnknownScript_0xa0970

UnknownScript_0xbd8cf:
	landmarktotext ROUTE_36, $2
	farjump UnknownScript_0xa0a73

AlanHasFireStone:
	landmarktotext ROUTE_36, $2
	farjump UnknownScript_0xa0ac5

AlanPhoneScript2:
	trainertotext SCHOOLBOY, ALAN1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd915
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue UnknownScript_0xbd915
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0xbd915
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd91c
	checkevent EVENT_ALAN_GAVE_FIRE_STONE
	iftrue UnknownScript_0xbd90d
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd90d:
	farscall PhoneScript_Random11
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd915:
	farjump UnknownScript_0xa0000

AlanWednesdayDay:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

UnknownScript_0xbd91c:
	landmarktotext ROUTE_36, $2
	setflag ENGINE_ALAN
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbd926:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	landmarktotext ROUTE_36, $2
	farjump PhoneScript_FoundItem_Male

; Dana

DanaPhoneScript1:
	trainertotext LASS, DANA1, $0
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd959
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .NotThursday
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue UnknownScript_0xbd960
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, .NotThursday
	checknite
	iftrue UnknownScript_0xbd9ab

.NotThursday:
	farjump UnknownScript_0xa0978

UnknownScript_0xbd959:
	landmarktotext ROUTE_38, $2
	farjump UnknownScript_0xa0a78

UnknownScript_0xbd960:
	landmarktotext ROUTE_38, $2
	farjump UnknownScript_0xa0acd

DanaPhoneScript2:
	trainertotext LASS, DANA1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd99f
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue UnknownScript_0xbd99f
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue UnknownScript_0xbd99f
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd9ae
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue UnknownScript_0xbd997
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd997:
	farscall PhoneScript_Random11
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd99f:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd9b8
	farjump UnknownScript_0xa0017

UnknownScript_0xbd9ab:
	setflag ENGINE_DANA_THURSDAY_NIGHT

UnknownScript_0xbd9ae:
	landmarktotext ROUTE_38, $2
	setflag ENGINE_DANA
	farjump PhoneScript_WantsToBattle_Female

UnknownScript_0xbd9b8:
	farjump UnknownScript_0xa0592

UnknownScript_0xbd9bc:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	landmarktotext ROUTE_38, $2
	farjump PhoneScript_FoundItem_Female

; Chad

ChadPhoneScript1:
	trainertotext SCHOOLBOY, CHAD1, $0
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbd9e9
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, .NotFriday
	checkmorn
	iftrue UnknownScript_0xbda20

.NotFriday:
	farjump UnknownScript_0xa0980

UnknownScript_0xbd9e9:
	landmarktotext ROUTE_38, $2
	farjump UnknownScript_0xa0a7d

ChadPhoneScript2:
	trainertotext SCHOOLBOY, CHAD1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbda31
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbda14
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue UnknownScript_0xbda14
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbda23

UnknownScript_0xbda14:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbda2d
	farjump UnknownScript_0xa0000

UnknownScript_0xbda20:
	setflag ENGINE_CHAD_FRIDAY_MORNING

UnknownScript_0xbda23:
	landmarktotext ROUTE_38, $2
	setflag ENGINE_CHAD
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbda2d:
	farjump UnknownScript_0xa0584

UnknownScript_0xbda31:
	farjump UnknownScript_0xa0754

DerekPhoneScript1:
	trainertotext POKEFANM, DEREK1, $0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .Nugget
	farscall PhoneScript_Random2
	if_equal $0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .ContestToday
	if_equal THURSDAY, .ContestToday
	if_equal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0988

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	landmarktotext ROUTE_39, $2
	farjump UnknownScript_0xa0ad5

DerekPhoneScript2:
	trainertotext POKEFANM, DEREK1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, .BugCatchingContest
	if_equal THURSDAY, .BugCatchingContest
	if_equal SATURDAY, .BugCatchingContest

.NoContest:
	farscall PhoneScript_Random4
	if_equal $0, .Nugget
	farjump UnknownScript_0xa0000

.BugCatchingContest:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	landmarktotext ROUTE_39, $2
	farjump PhoneScript_FoundItem_Male

TullyPhoneScript1:
	trainertotext FISHER, TULLY1, $0
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdad5
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue TullyHasWaterStone
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, .NotSunday
	checknite
	iftrue TullySundayNight

.NotSunday:
	farjump UnknownScript_0xa0990

UnknownScript_0xbdad5:
	landmarktotext ROUTE_42, $2
	farjump UnknownScript_0xa0a82

TullyHasWaterStone:
	landmarktotext ROUTE_42, $2
	farjump UnknownScript_0xa0add

TullyPhoneScript2:
	trainertotext FISHER, TULLY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdb1b
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue UnknownScript_0xbdb1b
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0xbdb1b
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbdb22
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftrue .WaterStone
	farscall PhoneScript_Random2
	if_equal $0, TullyFoundWaterStone

.WaterStone:
	farscall PhoneScript_Random11
	if_equal $0, TullyFoundWaterStone

UnknownScript_0xbdb1b:
	farjump UnknownScript_0xa0000

TullySundayNight:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

UnknownScript_0xbdb22:
	landmarktotext ROUTE_42, $2
	setflag ENGINE_TULLY
	farjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	landmarktotext ROUTE_42, $2
	farjump PhoneScript_FoundItem_Male

BrentPhoneScript1:
	trainertotext POKEMANIAC, BRENT1, $0
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb59
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue UnknownScript_0xbdb55
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0xbdb55
	checkmorn
	iftrue UnknownScript_0xbdb88

UnknownScript_0xbdb55:
	farjump UnknownScript_0xa0998

UnknownScript_0xbdb59:
	landmarktotext ROUTE_43, $2
	farjump UnknownScript_0xa0a87

BrentPhoneScript2:
	trainertotext POKEMANIAC, BRENT1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, BrentBillTrivia
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb84
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue UnknownScript_0xbdb84
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbdb8b

UnknownScript_0xbdb84:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdb88:
	setflag ENGINE_BRENT_MONDAY_MORNING

UnknownScript_0xbdb8b:
	landmarktotext ROUTE_43, $2
	setflag ENGINE_BRENT
	farjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farjump BrentBillTriviaScript

TiffanyPhoneScript1:
	trainertotext PICNICKER, TIFFANY3, $0
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0xbdbc2
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue UnknownScript_0xbdbbe
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0xbdbc9
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, UnknownScript_0xbdbbe
	checkday
	iftrue UnknownScript_0xbdc14

UnknownScript_0xbdbbe:
	farjump UnknownScript_0xa09a0

UnknownScript_0xbdbc2:
	landmarktotext ROUTE_43, $2
	farjump UnknownScript_0xa0a8c

UnknownScript_0xbdbc9:
	landmarktotext ROUTE_43, $2
	farjump UnknownScript_0xa0ae5

TiffanyPhoneScript2:
	trainertotext PICNICKER, TIFFANY3, $0
	farscall PhoneScript_Random4
	if_equal $0, UnknownScript_0xbdc21
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0xbdc10
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue UnknownScript_0xbdc10
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0xbdc10
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbdc17
	checkevent EVENT_TIFFANY_GAVE_PINK_BOW
	iftrue UnknownScript_0xbdc08
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc08:
	farscall PhoneScript_Random11
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc10:
	farjump UnknownScript_0xa0017

UnknownScript_0xbdc14:
	setflag ENGINE_TIFFANY_TUESDAY_AFTERNOON

UnknownScript_0xbdc17:
	landmarktotext ROUTE_43, $2
	setflag ENGINE_TIFFANY
	farjump PhoneScript_WantsToBattle_Female

UnknownScript_0xbdc21:
	random $6
	if_equal $0, UnknownScript_0xbdc3b
	if_equal $1, UnknownScript_0xbdc42
	if_equal $2, UnknownScript_0xbdc49
	if_equal $3, UnknownScript_0xbdc50
	if_equal $4, UnknownScript_0xbdc57
	if_equal $5, UnknownScript_0xbdc5e

UnknownScript_0xbdc3b:
	stringtotext String_be643, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc42:
	stringtotext String_be64b, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc49:
	stringtotext String_be653, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc50:
	stringtotext String_be657, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc57:
	stringtotext String_be65b, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc5e:
	stringtotext String_be662, $1
	jump UnknownScript_0xbdc65

UnknownScript_0xbdc65:
	farjump UnknownScript_0xa047f

UnknownScript_0xbdc69:
	setflag ENGINE_TIFFANY_HAS_PINK_BOW
	landmarktotext ROUTE_43, $2
	farjump PhoneScript_FoundItem_Female

; Vance

VancePhoneScript1:
	trainertotext BIRD_KEEPER, VANCE1, $0
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdc96
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbdc92
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, UnknownScript_0xbdc92
	checknite
	iftrue UnknownScript_0xbdcc1

UnknownScript_0xbdc92:
	farjump UnknownScript_0xa09a8

UnknownScript_0xbdc96:
	landmarktotext ROUTE_44, $2
	farjump UnknownScript_0xa0a91

VancePhoneScript2:
	trainertotext BIRD_KEEPER, VANCE1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdcbd
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbdcbd
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbdcc4
	if_equal $1, UnknownScript_0xbdcc4

UnknownScript_0xbdcbd:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdcc1:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

UnknownScript_0xbdcc4:
	landmarktotext ROUTE_44, $2
	setflag ENGINE_VANCE
	farjump PhoneScript_WantsToBattle_Male

WiltonPhoneScript1:
	trainertotext FISHER, WILTON1, $0
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdcf7
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WILTON_THRUSDAY_MORNING
	iftrue UnknownScript_0xbdcf3
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0xbdcfe
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, UnknownScript_0xbdcf3
	checkmorn
	iftrue UnknownScript_0xbdd33

UnknownScript_0xbdcf3:
	farjump UnknownScript_0xa09b0

UnknownScript_0xbdcf7:
	landmarktotext ROUTE_44, $2
	farjump UnknownScript_0xa0a96

UnknownScript_0xbdcfe:
	landmarktotext ROUTE_44, $2
	farjump UnknownScript_0xa0aed

WiltonPhoneScript2:
	trainertotext FISHER, WILTON1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_WILTON_THRUSDAY_MORNING
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0xbdd2f
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbdd36
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbdd40

UnknownScript_0xbdd2f:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdd33:
	setflag ENGINE_WILTON_THRUSDAY_MORNING

UnknownScript_0xbdd36:
	landmarktotext ROUTE_44, $2
	setflag ENGINE_WILTON
	farjump PhoneScript_WantsToBattle_Male

UnknownScript_0xbdd40:
	setflag ENGINE_WILTON_HAS_ITEM
	landmarktotext ROUTE_44, $2
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random $5
	if_equal $0, .UltraBall
	random $3
	if_equal $0, .GreatBall
	jump .PokeBall

.UltraBall:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	jump .FoundItem

.GreatBall:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	jump .FoundItem

.PokeBall:
	setevent EVENT_WILTON_HAS_POKE_BALL

.FoundItem:
	farjump PhoneScript_FoundItem_Male

; Kenji

KenjiPhoneScript1:
	trainertotext BLACKBELT_T, KENJI3, $0
	farscall PhoneScript_AnswerPhone_Male
	farjump UnknownScript_0xa09ee

KenjiPhoneScript2:
	trainertotext BLACKBELT_T, KENJI3, $0
	farscall PhoneScript_GreetPhone_Male
	farjump UnknownScript_0xa064c

; Parry

ParryPhoneScript1:
	trainertotext HIKER, PARRY1, $0
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddac
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbdda8
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbdda8
	checkday
	iftrue UnknownScript_0xbddd7

UnknownScript_0xbdda8:
	farjump UnknownScript_0xa09b8

UnknownScript_0xbddac:
	landmarktotext ROUTE_45, $2
	farjump UnknownScript_0xa0a9b

ParryPhoneScript2:
	trainertotext HIKER, PARRY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddd3
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbddd3
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbddda
	if_equal $1, UnknownScript_0xbddda

UnknownScript_0xbddd3:
	farjump UnknownScript_0xa0000

UnknownScript_0xbddd7:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

UnknownScript_0xbddda:
	landmarktotext ROUTE_45, $2
	setflag ENGINE_PARRY
	farjump PhoneScript_WantsToBattle_Male

; Erin

ErinPhoneScript1:
	trainertotext PICNICKER, ERIN1, $0
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, .NotSaturday
	checknite
	iftrue ErinSaturdayNight

.NotSaturday:
	farjump UnknownScript_0xa09c0

.WantsBattle:
	landmarktotext ROUTE_46, $2
	farjump UnknownScript_0xa0aa0

ErinPhoneScript2:
	trainertotext PICNICKER, ERIN1, $0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde2e
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue UnknownScript_0xbde2e
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbde35
	if_equal $1, UnknownScript_0xbde35

UnknownScript_0xbde2e:
	farjump UnknownScript_0xa0017

ErinSaturdayNight:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

UnknownScript_0xbde35:
	landmarktotext ROUTE_46, $2
	setflag ENGINE_ERIN
	farjump PhoneScript_WantsToBattle_Female
