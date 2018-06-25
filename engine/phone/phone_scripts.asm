UnusedPhoneScript:
	farwritetext UnusedPhoneText
	end

; Mom

MomPhoneScript:
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .bcec5
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	jump MomPhoneNoPokemonScript

.bcec5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_8
	iftrue MomPhoneHangUpScript
	farwritetext MomPhoneGreetingText
	buttonsound
	mapnametotext MEM_BUFFER_0
	checkcode VAR_ROOFPALETTE
	ifequal 1, MomPhonePalette1
	ifequal 2, MomPhonePalette2
	jump MomPhoneOther

MomPhoneLandmark:
	farwritetext MomPhoneLandmarkText
	buttonsound
	jump MomSavingMoney

MomPhonePalette1:
	checkcode VAR_MAPGROUP
	ifequal GROUP_NEW_BARK_TOWN, .newbark
	ifequal GROUP_CHERRYGROVE_CITY, .cherrygrove
	ifequal GROUP_VIOLET_CITY, .violet
	ifequal GROUP_AZALEA_TOWN, .azalea
	ifequal GROUP_GOLDENROD_CITY, .goldenrod
	farwritetext MomPhoneGenericAreaText
	buttonsound
	jump MomSavingMoney

.newbark
	farwritetext MomPhoneNewBarkText
	buttonsound
	jump MomSavingMoney

.cherrygrove
	farwritetext MomPhoneCherrygroveText
	buttonsound
	jump MomSavingMoney

.violet
	landmarktotext SPROUT_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark
.azalea
	landmarktotext SLOWPOKE_WELL, MEM_BUFFER_1
	jump MomPhoneLandmark
.goldenrod
	landmarktotext RADIO_TOWER, MEM_BUFFER_1
	jump MomPhoneLandmark

MomPhonePalette2:
	farwritetext MomOtherAreaText
	buttonsound
	jump MomSavingMoney

MomPhoneOther:
	farwritetext MomDeterminedText
	buttonsound
	jump MomSavingMoney

MomSavingMoney:
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse .NotSaving
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .SavingHasMoney
	jump .SavingNoMoney

.NotSaving:
	checkmoney MOMS_MONEY, 0
	ifequal HAVE_MORE, .HasMoney
	jump .NoMoney

.SavingHasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomCheckBalanceText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.SavingNoMoney:
	farwritetext MomImportantToSaveText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.NoMoney:
	farwritetext MomYoureNotSavingText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

.HasMoney:
	readmoney MOMS_MONEY, MEM_BUFFER_0
	farwritetext MomYouveSavedText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript:
	setflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomOKIllSaveText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript:
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	buttonsound
	jump MomPhoneHangUpScript

MomPhoneHangUpScript:
	farwritetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript:
	farwritetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript:
	farwritetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript:
	farwritetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript:
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_MOM_ACTIVE
	specialphonecall SPECIALCALL_NONE
	farwritetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

; Bill

BillPhoneScript1:
	checktime DAY
	iftrue .daygreet
	checktime NITE
	iftrue .nitegreet
	farwritetext BillPhoneMornGreetingText
	buttonsound
	jump .main

.daygreet
	farwritetext BillPhoneDayGreetingText
	buttonsound
	jump .main

.nitegreet
	farwritetext BillPhoneNiteGreetingText
	buttonsound
	jump .main

.main
	farwritetext BillPhoneGenericText
	buttonsound
	checkcode VAR_BOXSPACE
	vartomem MEM_BUFFER_0
	ifequal 0, .full
	ifless PARTY_LENGTH, .nearlyfull
	farwritetext BillPhoneNotFullText
	end

.nearlyfull
	farwritetext BillPhoneNearlyFullText
	end

.full
	farwritetext BillPhoneFullText
	end

BillPhoneScript2:
	farwritetext BillPhoneNewlyFullText
	waitbutton
	end

; Elm

ElmPhoneScript1:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_POKERUS, .pokerus
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

.sawmrpokemon
	farwritetext ElmPhoneSawMrPokemonText
	end

.stolen
	farwritetext ElmPhonePokemonStolenText
	end

.checkingegg
	farwritetext ElmPhoneCheckingEggText
	end

.assistant
	farwritetext ElmPhoneAssistantText
	end

.eggunhatched
	farwritetext ElmPhoneEggUnhatchedText
	end

.egghatched
	farwritetext ElmPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery
	random 2
	ifequal 0, .nextdiscovery
	farwritetext ElmPhoneDiscovery1Text
	end

.nextdiscovery
	farwritetext ElmPhoneDiscovery2Text
	end

.pokerus
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

ElmPhoneScript2:
	checkcode VAR_SPECIALPHONECALL
	ifequal SPECIALCALL_ROBBED, .disaster
	ifequal SPECIALCALL_ASSISTANT, .assistant
	ifequal SPECIALCALL_WEIRDBROADCAST, .rocket
	ifequal SPECIALCALL_SSTICKET, .gift
	ifequal SPECIALCALL_MASTERBALL, .gift
	farwritetext ElmPhonePokerusText
	specialphonecall SPECIALCALL_NONE
	end

.disaster
	farwritetext ElmPhoneDisasterText
	specialphonecall SPECIALCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant
	farwritetext ElmPhoneEggAssistantText
	specialphonecall SPECIALCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket
	farwritetext ElmPhoneRocketText
	specialphonecall SPECIALCALL_NONE
	end

.gift
	farwritetext ElmPhoneGiftText
	specialphonecall SPECIALCALL_NONE
	end

.unused
	farwritetext ElmPhoneUnusedText
	specialphonecall SPECIALCALL_NONE
	end

; Jack

JackPhoneScript1:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	checkflag ENGINE_JACK
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue JackMondayMorning

.NotMonday:
	farjump JackPhoneTips

.WantsBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump JackWantsBattleScript

JackPhoneScript2:
	trainertotext SCHOOLBOY, JACK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, JackBattleTrivia
	checkflag ENGINE_JACK
	iftrue .WaitingForBattle
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue .WaitingForBattle
	farscall PhoneScript_Random2
	ifequal 0, JackWantsToBattle

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, JackFindsRare
	farjump Phone_GenericCall_Male

JackMondayMorning:
	setflag ENGINE_JACK_MONDAY_MORNING

JackWantsToBattle:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	setflag ENGINE_JACK
	farjump PhoneScript_WantsToBattle_Male

JackFindsRare:
	farjump Phone_CheckIfUnseenRare_Male

JackBattleTrivia:
	farjump JackTriviaScript

; Beverly

BeverlyPhoneScript1:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farjump UnknownScript_0xa0900

.HasNugget:
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump UnknownScript_0xa0aa5

BeverlyPhoneScript2:
	trainertotext POKEFANF, BEVERLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue .HasNugget
	farscall PhoneScript_Random4
	ifequal 0, .FoundNugget

.HasNugget:
	farjump Phone_GenericCall_Female

.FoundNugget:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	landmarktotext NATIONAL_PARK, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

; Huey

HueyPhoneScript1:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	checkflag ENGINE_HUEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue HueyWednesdayNight

.NotWednesday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0908

.WantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	farjump HueyWantsBattleScript

HueyPhoneScript2:
	trainertotext SAILOR, HUEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_HUEY
	iftrue .Flavor
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue .Flavor
	farscall PhoneScript_Random3
	ifequal 0, HueyWantsBattle
	ifequal 1, HueyWantsBattle

.Flavor:
	farjump PhoneScript_MonFlavorText

HueyWednesdayNight:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

HueyWantsBattle:
	landmarktotext LIGHTHOUSE, MEM_BUFFER_2
	setflag ENGINE_HUEY
	farjump PhoneScript_WantsToBattle_Male

; Gaven

GavenPhoneScript1:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
	checkflag ENGINE_GAVEN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .NotThursday
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue GavenThursdayMorning

.NotThursday:
	farjump UnknownScript_0xa0910

.WantsBattle:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	farjump UnknownScript_0xa0a37

GavenPhoneScript2:
	trainertotext COOLTRAINERM, GAVEN3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_GAVEN
	iftrue .WaitingForBattle
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue .WaitingForBattle
	farscall PhoneScript_Random2
	ifequal 0, GavenWantsRematch

.WaitingForBattle:
	farscall PhoneScript_Random3
	ifequal 0, GavenFoundRare
	farjump Phone_GenericCall_Male

GavenThursdayMorning:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

GavenWantsRematch:
	landmarktotext ROUTE_26, MEM_BUFFER_2
	setflag ENGINE_GAVEN
	farjump PhoneScript_WantsToBattle_Male

GavenFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

; Beth

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

; Jose

JosePhoneScript1:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	checkflag ENGINE_JOSE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue JoseSaturdayNight

.NotSaturday:
	farjump UnknownScript_0xa0920

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

.HasItem:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a41

JosePhoneScript2:
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOSE
	iftrue .Generic
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoseWantsBattle
	farscall PhoneScript_Random3
	ifequal 0, JoseHasStarPiece

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, JoseFoundRare
	farjump Phone_GenericCall_Male

JoseSaturdayNight:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

JoseWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_JOSE
	farjump PhoneScript_WantsToBattle_Male

JoseFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

JoseHasStarPiece:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

; Reena

ReenaPhoneScript1:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	checkflag ENGINE_REENA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .NotSunday
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime MORN
	iftrue ReenaSundayMorning

.NotSunday:
	farjump UnknownScript_0xa0928

.WantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	farjump UnknownScript_0xa0a46

ReenaPhoneScript2:
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_REENA
	iftrue .Generic
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, ReenaWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

ReenaSundayMorning:
	setflag ENGINE_REENA_SUNDAY_MORNING

ReenaWantsBattle:
	landmarktotext ROUTE_27, MEM_BUFFER_2
	setflag ENGINE_REENA
	farjump PhoneScript_WantsToBattle_Female

; Joey

JoeyPhoneScript1:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	checkflag ENGINE_JOEY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime DAY
	iftrue JoeyMondayAfternoon

.NotMonday:
	special RandomPhoneMon
	farjump UnknownScript_0xa0930

.WantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	farjump UnknownScript_0xa0a4b

JoeyPhoneScript2:
	trainertotext YOUNGSTER, JOEY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_JOEY
	iftrue .Generic
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, JoeyWantsBattle
	ifequal 1, JoeyWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

JoeyMondayAfternoon:
	setflag ENGINE_JOEY_MONDAY_AFTERNOON

JoeyWantsBattle:
	landmarktotext ROUTE_30, MEM_BUFFER_2
	setflag ENGINE_JOEY
	farjump PhoneScript_WantsToBattle_Male

; Wade

WadePhoneScript1:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	checkflag ENGINE_WADE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .NotTuesday
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime NITE
	iftrue WadeTuesdayNight

.NotTuesday:
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0938

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.WantsBattle:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0a50

.HasItem:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	farjump UnknownScript_0xa0ab5

WadePhoneScript2:
	trainertotext BUG_CATCHER, WADE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	checkflag ENGINE_WADE
	iftrue .next
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue .next
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue .next
	farscall PhoneScript_Random2
	ifequal 0, WadeHasItem2
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .next
	farscall PhoneScript_Random2
	ifequal 0, WadeWantsBattle2

.next:
	farscall PhoneScript_Random3
	ifequal 0, WadeFoundRare
	farjump Phone_GenericCall_Male

.ContestToday:
	farjump PhoneScript_BugCatchingContest

WadeTuesdayNight:
	setflag ENGINE_WADE_TUESDAY_NIGHT

WadeWantsBattle2:
	landmarktotext ROUTE_31, MEM_BUFFER_2
	setflag ENGINE_WADE
	farjump PhoneScript_WantsToBattle_Male

WadeFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

WadeHasItem2:
	setflag ENGINE_WADE_HAS_ITEM
	landmarktotext ROUTE_31, MEM_BUFFER_2
	clearevent EVENT_WADE_HAS_BERRY
	clearevent EVENT_WADE_HAS_PSNCUREBERRY
	clearevent EVENT_WADE_HAS_PRZCUREBERRY
	clearevent EVENT_WADE_HAS_BITTER_BERRY
	random 4
	ifequal 0, .Berry
	ifequal 1, .PsnCureBerry
	ifequal 2, .PrzCureBerry
	ifequal 3, .Bitterberry

.Berry:
	setevent EVENT_WADE_HAS_BERRY
	jump .FoundBerry

.PsnCureBerry:
	setevent EVENT_WADE_HAS_PSNCUREBERRY
	jump .FoundBerry

.PrzCureBerry:
	setevent EVENT_WADE_HAS_PRZCUREBERRY
	jump .FoundBerry

.Bitterberry:
	setevent EVENT_WADE_HAS_BITTER_BERRY

.FoundBerry:
	farjump PhoneScript_FoundItem_Male

; Ralph

RalphPhoneScript1:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
	checkflag ENGINE_RALPH
	iftrue .Rematch
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue .CheckSwarm
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .CheckSwarm
	checktime MORN
	iftrue Ralph_WednesdayMorning
.CheckSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .ReportSwarm
	farjump UnknownScript_0xa0940

.Rematch:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0a55

.ReportSwarm:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	farjump UnknownScript_0xa0af5

RalphPhoneScript2:
	trainertotext FISHER, RALPH1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .CheckSwarm
	checkflag ENGINE_RALPH
	iftrue .CheckSwarm
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue .CheckSwarm
	farscall PhoneScript_Random2
	ifequal 0, Ralph_FightMe
.CheckSwarm:
	farscall PhoneScript_Random5
	ifequal 0, Ralph_SetUpSwarm
	farjump Phone_GenericCall_Male

Ralph_WednesdayMorning:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING
Ralph_FightMe:
	landmarktotext ROUTE_32, MEM_BUFFER_2
	setflag ENGINE_RALPH
	farjump PhoneScript_WantsToBattle_Male

Ralph_SetUpSwarm:
	checkflag ENGINE_FISH_SWARM
	iftrue .Generic
	setflag ENGINE_FISH_SWARM
	pokenamemem QWILFISH, MEM_BUFFER_1
	landmarktotext ROUTE_32, MEM_BUFFER_2
	writebyte FISHSWARM_QWILFISH
	special ActivateFishingSwarm
	farjump UnknownScript_0xa05d6

.Generic:
	farjump Phone_GenericCall_Male

; Liz

LizPhoneScript1:
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

LizPhoneScript2:
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

; Anthony

AnthonyPhoneScript1:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	checkflag ENGINE_ANTHONY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime NITE
	iftrue AnthonyFridayNight

.NotFriday:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .AlreadySwarming
	farjump UnknownScript_0xa0950

.WantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	farjump UnknownScript_0xa0a5f

.AlreadySwarming:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	farjump UnknownScript_0xa0afa

AnthonyPhoneScript2:
	trainertotext HIKER, ANTHONY2, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .TriesSwarm
	checkflag ENGINE_ANTHONY
	iftrue .TriesSwarm
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue .TriesSwarm
	farscall PhoneScript_Random2
	ifequal 0, AnthonyWantsBattle

.TriesSwarm:
	farscall PhoneScript_Random5
	ifequal 0, AnthonyTriesDunsparceSwarm
	farjump Phone_GenericCall_Male

AnthonyFridayNight:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

AnthonyWantsBattle:
	landmarktotext ROUTE_33, MEM_BUFFER_2
	setflag ENGINE_ANTHONY
	farjump PhoneScript_WantsToBattle_Male

AnthonyTriesDunsparceSwarm:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue .Generic
	setflag ENGINE_DUNSPARCE_SWARM
	pokenamemem DUNSPARCE, MEM_BUFFER_1
	swarm SWARM_DUNSPARCE, DARK_CAVE_VIOLET_ENTRANCE
	landmarktotext DARK_CAVE, MEM_BUFFER_2
	farjump UnknownScript_0xa05de

.Generic:
	farjump Phone_GenericCall_Male

; Todd

ToddPhoneScript1:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	checkflag ENGINE_TODD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime MORN
	iftrue ToddSaturdayMorning

.NotSaturday:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleOn
	farjump UnknownScript_0xa0958

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a64

.SaleOn:
	farjump UnknownScript_0xa0b04

ToddPhoneScript2:
	trainertotext CAMPER, TODD1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TODD
	iftrue .TryForSale
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue .TryForSale
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .NoGoldenrod
	farscall PhoneScript_Random2
	ifequal 0, ToddWantsBattle

.TryForSale:
	farscall PhoneScript_Random2
	ifequal 0, ToddDeptStoreSale

.NoGoldenrod:
	farscall PhoneScript_Random3
	ifequal 0, ToddFoundRare
	farjump Phone_GenericCall_Male

ToddSaturdayMorning:
	setflag ENGINE_TODD_SATURDAY_MORNING

ToddWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_TODD
	farjump PhoneScript_WantsToBattle_Male

ToddFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ToddDeptStoreSale:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farjump UnknownScript_0xa0644

; Gina

GinaPhoneScript1:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	checkflag ENGINE_GINA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .NotSunday
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .HasLeafStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime DAY
	iftrue GinaSundayDay

.NotSunday:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa0960

.Rockets:
	farjump UnknownScript_0xa05c6

.WantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0a69

.HasLeafStone:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump UnknownScript_0xa0abd

GinaPhoneScript2:
	trainertotext PICNICKER, GINA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue GinaRockets
	checkflag ENGINE_GINA
	iftrue .Generic
	checkflag ENGINE_GINA_SUNDAY_AFTERNOON
	iftrue .Generic
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .Generic
	checkevent EVENT_GINA_GAVE_LEAF_STONE
	iftrue .GaveLeafStone
	farscall PhoneScript_Random2
	ifequal 0, GinaHasLeafStone

.GaveLeafStone:
	farscall PhoneScript_Random11
	ifequal 0, GinaHasLeafStone
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse .Generic
	farscall PhoneScript_Random3
	ifequal 0, GinaWantsBattle

.Generic:
	farjump Phone_GenericCall_Female

GinaSundayDay:
	setflag ENGINE_GINA_SUNDAY_AFTERNOON

GinaWantsBattle:
	landmarktotext ROUTE_34, MEM_BUFFER_2
	setflag ENGINE_GINA
	farjump PhoneScript_WantsToBattle_Female

GinaRockets:
	farjump UnknownScript_0xa05c6

GinaHasLeafStone:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	landmarktotext ROUTE_34, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

; Irwin

IrwinPhoneScript1:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump UnknownScript_0xa09c8

.Rockets:
	farjump IrwinRocketRumor

IrwinPhoneScript2:
	trainertotext JUGGLER, IRWIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue .Rockets
	farjump IrwinRumorScript

.Rockets:
	farjump IrwinRocketRumor

; Arnie

ArniePhoneScript1:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
	checkflag ENGINE_ARNIE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .NotTuesday
	checkcode VAR_WEEKDAY
	ifnotequal TUESDAY, .NotTuesday
	checktime MORN
	iftrue ArnieTuesdayMorning

.NotTuesday:
	checkflag ENGINE_YANMA_SWARM
	iftrue .AlreadySwarming
	farjump UnknownScript_0xa0968

.WantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa0a6e

.AlreadySwarming:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa0aff

ArniePhoneScript2:
	trainertotext BUG_CATCHER, ARNIE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ARNIE
	iftrue .Swarm
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue .Swarm
	farscall PhoneScript_Random2
	ifequal 0, ArnieWantsBattle

.Swarm:
	farscall PhoneScript_Random5
	ifequal 0, ArnieYanmaSwarm
	farscall PhoneScript_Random3
	ifequal 0, ArnieFoundRare
	farjump Phone_GenericCall_Male

ArnieTuesdayMorning:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

ArnieWantsBattle:
	landmarktotext ROUTE_35, MEM_BUFFER_2
	setflag ENGINE_ARNIE
	farjump PhoneScript_WantsToBattle_Male

ArnieYanmaSwarm: ; start swarm
	checkflag ENGINE_YANMA_SWARM
	iftrue ArnieYanmaAlreadySwarming
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, MEM_BUFFER_1
	swarm SWARM_YANMA, ROUTE_35
	landmarktotext ROUTE_35, MEM_BUFFER_2
	farjump UnknownScript_0xa05ce

ArnieFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ArnieYanmaAlreadySwarming:
	farjump Phone_GenericCall_Male

; Alan

AlanPhoneScript1:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	checkflag ENGINE_ALAN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .NotWednesday
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .FireStone
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime DAY
	iftrue AlanWednesdayDay

.NotWednesday:
	farjump UnknownScript_0xa0970

.WantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0a73

.FireStone:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump UnknownScript_0xa0ac5

AlanPhoneScript2:
	trainertotext SCHOOLBOY, ALAN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ALAN
	iftrue .Generic
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue .Generic
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, AlanWantsBattle
	checkevent EVENT_ALAN_GAVE_FIRE_STONE
	iftrue .FireStone
	farscall PhoneScript_Random2
	ifequal 0, AlanHasFireStone

.FireStone:
	farscall PhoneScript_Random11
	ifequal 0, AlanHasFireStone

.Generic:
	farjump Phone_GenericCall_Male

AlanWednesdayDay:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

AlanWantsBattle:
	landmarktotext ROUTE_36, MEM_BUFFER_2
	setflag ENGINE_ALAN
	farjump PhoneScript_WantsToBattle_Male

AlanHasFireStone:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	landmarktotext ROUTE_36, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

; Dana

DanaPhoneScript1:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	checkflag ENGINE_DANA
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .NotThursday
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .HasThunderstone
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime NITE
	iftrue DanaThursdayNight

.NotThursday:
	farjump UnknownScript_0xa0978

.WantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0a78

.HasThunderstone:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0acd

DanaPhoneScript2:
	trainertotext LASS, DANA1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_DANA
	iftrue .Generic
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, DanaWantsBattle
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue .Thunderstone
	farscall PhoneScript_Random2
	ifequal 0, DanaHasThunderstone

.Thunderstone:
	farscall PhoneScript_Random11
	ifequal 0, DanaHasThunderstone

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, DanaFoundRare
	farjump Phone_GenericCall_Female

DanaThursdayNight:
	setflag ENGINE_DANA_THURSDAY_NIGHT

DanaWantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	setflag ENGINE_DANA
	farjump PhoneScript_WantsToBattle_Female

DanaFoundRare:
	farjump Phone_CheckIfUnseenRare_Female

DanaHasThunderstone:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Female

; Chad

ChadPhoneScript1:
	trainertotext SCHOOLBOY, CHAD1, MEM_BUFFER_0
	checkflag ENGINE_CHAD
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue .NotFriday
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checktime MORN
	iftrue ChadFridayMorning

.NotFriday:
	farjump UnknownScript_0xa0980

.WantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	farjump UnknownScript_0xa0a7d

ChadPhoneScript2:
	trainertotext SCHOOLBOY, CHAD1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, ChadOakGossip
	checkflag ENGINE_CHAD
	iftrue .Generic
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, ChadWantsBattle

.Generic:
	farscall PhoneScript_Random3
	ifequal 0, ChadFoundRare
	farjump Phone_GenericCall_Male

ChadFridayMorning:
	setflag ENGINE_CHAD_FRIDAY_MORNING

ChadWantsBattle:
	landmarktotext ROUTE_38, MEM_BUFFER_2
	setflag ENGINE_CHAD
	farjump PhoneScript_WantsToBattle_Male

ChadFoundRare:
	farjump Phone_CheckIfUnseenRare_Male

ChadOakGossip:
	farjump ChadOakGossipScript

DerekPhoneScript1:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue .Nugget
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farjump UnknownScript_0xa0988

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump UnknownScript_0xa0ad5

DerekPhoneScript2:
	trainertotext POKEFANM, DEREK1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, .NoContest
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue .NoContest
	checkcode VAR_WEEKDAY
	ifequal TUESDAY, .ContestToday
	ifequal THURSDAY, .ContestToday
	ifequal SATURDAY, .ContestToday

.NoContest:
	farscall PhoneScript_Random4
	ifequal 0, .Nugget
	farjump Phone_GenericCall_Male

.ContestToday:
	farjump PhoneScript_BugCatchingContest

.Nugget:
	setflag ENGINE_DEREK_HAS_NUGGET
	landmarktotext ROUTE_39, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

TullyPhoneScript1:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	checkflag ENGINE_TULLY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .NotSunday
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .WaterStone
	checkcode VAR_WEEKDAY
	ifnotequal SUNDAY, .NotSunday
	checktime NITE
	iftrue TullySundayNight

.NotSunday:
	farjump UnknownScript_0xa0990

.WantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0a82

.WaterStone:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump UnknownScript_0xa0add

TullyPhoneScript2:
	trainertotext FISHER, TULLY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_TULLY
	iftrue .Generic
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue .Generic
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue .Generic
	farscall PhoneScript_Random3
	ifequal 0, TullyWantsBattle
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftrue .WaterStone
	farscall PhoneScript_Random2
	ifequal 0, TullyFoundWaterStone

.WaterStone:
	farscall PhoneScript_Random11
	ifequal 0, TullyFoundWaterStone

.Generic:
	farjump Phone_GenericCall_Male

TullySundayNight:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

TullyWantsBattle:
	landmarktotext ROUTE_42, MEM_BUFFER_2
	setflag ENGINE_TULLY
	farjump PhoneScript_WantsToBattle_Male

TullyFoundWaterStone:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	landmarktotext ROUTE_42, MEM_BUFFER_2
	farjump PhoneScript_FoundItem_Male

BrentPhoneScript1:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	checkflag ENGINE_BRENT
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .NotMonday
	checkcode VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checktime MORN
	iftrue BrentMondayMorning

.NotMonday:
	farjump UnknownScript_0xa0998

.WantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	farjump UnknownScript_0xa0a87

BrentPhoneScript2:
	trainertotext POKEMANIAC, BRENT1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	ifequal 0, BrentBillTrivia
	checkflag ENGINE_BRENT
	iftrue .Generic
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue .Generic
	farscall PhoneScript_Random2
	ifequal 0, BrentWantsBattle

.Generic:
	farjump Phone_GenericCall_Male

BrentMondayMorning:
	setflag ENGINE_BRENT_MONDAY_MORNING

BrentWantsBattle:
	landmarktotext ROUTE_43, MEM_BUFFER_2
	setflag ENGINE_BRENT
	farjump PhoneScript_WantsToBattle_Male

BrentBillTrivia:
	farjump BrentBillTriviaScript

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

; Vance

VancePhoneScript1:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .NotWednesday
	checkcode VAR_WEEKDAY
	ifnotequal WEDNESDAY, .NotWednesday
	checktime NITE
	iftrue VanceWednesdayNight

.NotWednesday:
	farjump VanceLookingForward

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump VanceHurryHurry

VancePhoneScript2:
	trainertotext BIRD_KEEPER, VANCE1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_VANCE
	iftrue .WantsBattle
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue .WantsBattle
	farscall PhoneScript_Random3
	ifequal 0, VanceWantsRematch
	ifequal 1, VanceWantsRematch

.WantsBattle:
	farjump Phone_GenericCall_Male

VanceWednesdayNight:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

VanceWantsRematch:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_VANCE
	farjump PhoneScript_WantsToBattle_Male

WiltonPhoneScript1:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	checkflag ENGINE_WILTON
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_WILTON_THURSDAY_MORNING
	iftrue .NotThursday
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .HasItem
	checkcode VAR_WEEKDAY
	ifnotequal THURSDAY, .NotThursday
	checktime MORN
	iftrue WiltonThursdayMorning

.NotThursday:
	farjump WiltonHaventFoundAnything

.WantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump WiltonNotBiting

.HasItem:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	farjump WiltonWantThis

WiltonPhoneScript2:
	trainertotext FISHER, WILTON1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_WILTON
	iftrue .GenericCall
	checkflag ENGINE_WILTON_THURSDAY_MORNING
	iftrue .GenericCall
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue .GenericCall
	farscall PhoneScript_Random2
	ifequal 0, WiltonWantsBattle
	farscall PhoneScript_Random2
	ifequal 0, WiltonHasItem

.GenericCall:
	farjump Phone_GenericCall_Male

WiltonThursdayMorning:
	setflag ENGINE_WILTON_THURSDAY_MORNING

WiltonWantsBattle:
	landmarktotext ROUTE_44, MEM_BUFFER_2
	setflag ENGINE_WILTON
	farjump PhoneScript_WantsToBattle_Male

WiltonHasItem:
	setflag ENGINE_WILTON_HAS_ITEM
	landmarktotext ROUTE_44, MEM_BUFFER_2
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random 5
	ifequal 0, .UltraBall
	random 3
	ifequal 0, .GreatBall
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
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_AnswerPhone_Male
	farjump KenjiAnswerPhoneScript

KenjiPhoneScript2:
	trainertotext BLACKBELT_T, KENJI3, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	farjump KenjiCallingPhoneScript

; Parry

ParryPhoneScript1:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	checkflag ENGINE_PARRY
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .WantsRematch
	checkcode VAR_WEEKDAY
	ifnotequal FRIDAY, .WantsRematch
	checktime DAY
	iftrue ParryFridayDay

.WantsRematch:
	farjump ParryBattleWithMe

.WantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	farjump ParryHaventYouGottenTo

ParryPhoneScript2:
	trainertotext HIKER, PARRY1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_PARRY
	iftrue .GenericCall
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue .GenericCall
	farscall PhoneScript_Random2
	ifequal 0, ParryWantsBattle
	ifequal 1, ParryWantsBattle

.GenericCall:
	farjump Phone_GenericCall_Male

ParryFridayDay:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

ParryWantsBattle:
	landmarktotext ROUTE_45, MEM_BUFFER_2
	setflag ENGINE_PARRY
	farjump PhoneScript_WantsToBattle_Male

; Erin

ErinPhoneScript1:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	checkflag ENGINE_ERIN
	iftrue .WantsBattle
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue .NotSaturday
	checkcode VAR_WEEKDAY
	ifnotequal SATURDAY, .NotSaturday
	checktime NITE
	iftrue ErinSaturdayNight

.NotSaturday:
	farjump ErinWorkingHardScript

.WantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	farjump ErinComeBattleScript

ErinPhoneScript2:
	trainertotext PICNICKER, ERIN1, MEM_BUFFER_0
	farscall PhoneScript_GreetPhone_Female
	checkflag ENGINE_ERIN
	iftrue .GenericCall
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue .GenericCall
	farscall PhoneScript_Random3
	ifequal 0, ErinWantsBattle
	ifequal 1, ErinWantsBattle

.GenericCall:
	farjump Phone_GenericCall_Female

ErinSaturdayNight:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

ErinWantsBattle:
	landmarktotext ROUTE_46, MEM_BUFFER_2
	setflag ENGINE_ERIN
	farjump PhoneScript_WantsToBattle_Female
