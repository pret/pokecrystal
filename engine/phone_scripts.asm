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
	if_equal $1, UnknownScript_0xbcee7
	if_equal $2, UnknownScript_0xbcf27
	jump UnknownScript_0xbcf2f

UnknownScript_0xbcedf: ; 0xbcedf
	farwritetext UnknownText_0x1b4021
	buttonsound
	jump UnknownScript_0xbcf37

UnknownScript_0xbcee7: ; 0xbcee7
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
	jump UnknownScript_0xbcedf
.azalea ; 0xbcf1b
	landmarktotext SLOWPOKE_WELL, 1
	jump UnknownScript_0xbcedf
.goldenrod ; 0xbcf21
	landmarktotext RADIO_TOWER, 1
	jump UnknownScript_0xbcedf

UnknownScript_0xbcf27: ; 0xbcf27
	farwritetext UnknownText_0x1b411c
	buttonsound
	jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	farwritetext UnknownText_0x1b4150
	buttonsound
	jump UnknownScript_0xbcf37

UnknownScript_0xbcf37: ; 0xbcf37
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse UnknownScript_0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf55
	jump UnknownScript_0xbcf63

UnknownScript_0xbcf49: ; 0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf79
	jump UnknownScript_0xbcf6e

UnknownScript_0xbcf55: ; 0xbcf55
	readmoney $1, $0
	farwritetext UnknownText_0x1b41a7
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf63: ; 0xbcf63
	farwritetext UnknownText_0x1b41ea
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf6e: ; 0xbcf6e
	farwritetext UnknownText_0x1b420d
	yesorno
	iftrue MomPhoneSaveMoneyScript
	jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf79: ; 0xbcf79
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
	farjump UnknownScript_0xa0376

UnknownScript_0xbd137:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd13b:
	farjump UnknownScript_0xa0654

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
	farjump UnknownScript_0xa061e

; Huey

HueyPhoneScript1:
	trainertotext SAILOR, HUEY1, $0
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1a2
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbd19b
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, UnknownScript_0xbd19b
	checknite
	iftrue UnknownScript_0xbd1cd

UnknownScript_0xbd19b:
	special RandomPhoneMon
	farjump UnknownScript_0xa0908

UnknownScript_0xbd1a2:
	landmarktotext LIGHTHOUSE, $2
	farjump UnknownScript_0xa0a32

HueyPhoneScript2:
	trainertotext SAILOR, HUEY1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1c9
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbd1c9
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd1d0
	if_equal $1, UnknownScript_0xbd1d0

UnknownScript_0xbd1c9:
	farjump PhoneScript_MonFlavorText

UnknownScript_0xbd1cd:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

UnknownScript_0xbd1d0:
	landmarktotext LIGHTHOUSE, $2
	setflag ENGINE_HUEY
	farjump UnknownScript_0xa0376

; Gaven

GavenPhoneScript1:
	trainertotext COOLTRAINERM, GAVEN3, $0
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd1fd
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue UnknownScript_0xbd1f9
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, UnknownScript_0xbd1f9
	checkmorn
	iftrue UnknownScript_0xbd22c

UnknownScript_0xbd1f9:
	farjump UnknownScript_0xa0910

UnknownScript_0xbd1fd:
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
	if_equal $0, UnknownScript_0xbd22f

UnknownScript_0xbd220:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd239
	farjump UnknownScript_0xa0000

UnknownScript_0xbd22c:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

UnknownScript_0xbd22f:
	landmarktotext ROUTE_26, $2
	setflag ENGINE_GAVEN
	farjump UnknownScript_0xa0376

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
	farjump UnknownScript_0xa037e

; Jose

JosePhoneScript1:
	trainertotext BIRD_KEEPER, JOSE2, $0
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2bd
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue UnknownScript_0xbd2b9
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2c4
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, UnknownScript_0xbd2b9
	checknite
	iftrue UnknownScript_0xbd301

UnknownScript_0xbd2b9:
	farjump UnknownScript_0xa0920

UnknownScript_0xbd2bd:
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

UnknownScript_0xbd301:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

UnknownScript_0xbd304:
	landmarktotext ROUTE_27, $2
	setflag ENGINE_JOSE
	farjump UnknownScript_0xa0376

UnknownScript_0xbd30e:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd312:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	landmarktotext ROUTE_27, $2
	farjump UnknownScript_0xa05e6

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
	farjump UnknownScript_0xa037e

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
	farjump UnknownScript_0xa0376

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
	farjump UnknownScript_0xa05a4

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
	if_equal $0, UnknownScript_0xbd44c
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue UnknownScript_0xbd44c
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0xbd480
	if_equal THURSDAY, UnknownScript_0xbd480
	if_equal SATURDAY, UnknownScript_0xbd480

UnknownScript_0xbd44c:
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

UnknownScript_0xbd480:
	farjump UnknownScript_0xa05a4

UnknownScript_0xbd484:
	setflag ENGINE_WADE_TUESDAY_NIGHT

UnknownScript_0xbd487:
	landmarktotext ROUTE_31, $2
	setflag ENGINE_WADE
	farjump UnknownScript_0xa0376

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
	farjump UnknownScript_0xa05e6

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
	farjump UnknownScript_0xa0376

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
	iftrue UnknownScript_0xbd57f
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, UnknownScript_0xbd57f
	checkday
	iftrue UnknownScript_0xbd5c3

UnknownScript_0xbd57f:
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

UnknownScript_0xbd5c3:
	setflag ENGINE_LIZ_THURSDAY_AFTERNOON

UnknownScript_0xbd5c6:
	landmarktotext ROUTE_32, $2
	setflag ENGINE_LIZ
	farjump UnknownScript_0xa037e

UnknownScript_0xbd5d0:
	farjump UnknownScript_0xa047a

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
	iftrue UnknownScript_0xbd653
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbd653
	checknite
	iftrue UnknownScript_0xbd699

UnknownScript_0xbd653:
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
	farjump UnknownScript_0xa0376

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
	iftrue UnknownScript_0xbd6e0
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, UnknownScript_0xbd6e0
	checkmorn
	iftrue UnknownScript_0xbd72b

UnknownScript_0xbd6e0:
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
	iffalse UnknownScript_0xbd71f
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd72e

UnknownScript_0xbd717:
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbd73c

UnknownScript_0xbd71f:
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd738
	farjump UnknownScript_0xa0000

UnknownScript_0xbd72b:
	setflag ENGINE_TODD_SATURDAY_MORNING

UnknownScript_0xbd72e:
	landmarktotext ROUTE_34, $2
	setflag ENGINE_TODD
	farjump UnknownScript_0xa0376

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
	iftrue UnknownScript_0xbd768
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0xbd77d
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, UnknownScript_0xbd768
	checkday
	iftrue UnknownScript_0xbd7cc

UnknownScript_0xbd768:
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd772
	farjump UnknownScript_0xa0960

UnknownScript_0xbd772:
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

UnknownScript_0xbd7cc:
	setflag ENGINE_GINA_SUNDAY_AFTERNOON

UnknownScript_0xbd7cf:
	landmarktotext ROUTE_34, $2
	setflag ENGINE_GINA
	farjump UnknownScript_0xa037e

UnknownScript_0xbd7d9:
	farjump UnknownScript_0xa05c6

UnknownScript_0xbd7dd:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	landmarktotext ROUTE_34, $2
	farjump UnknownScript_0xa061e

; Irwin

IrwinPhoneScript1:
	trainertotext JUGGLER, IRWIN1, $0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd7f9
	farjump UnknownScript_0xa09c8

UnknownScript_0xbd7f9:
	farjump UnknownScript_0xa05be

IrwinPhoneScript2:
	trainertotext JUGGLER, IRWIN1, $0
	farscall PhoneScript_GreetPhone_Male
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd80f
	farjump UnknownScript_0xa0848

UnknownScript_0xbd80f:
	farjump UnknownScript_0xa05be

; Arnie

ArniePhoneScript1:
	trainertotext BUG_CATCHER, ARNIE1, $0
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd83c
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue UnknownScript_0xbd832
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, UnknownScript_0xbd832
	checkmorn
	iftrue UnknownScript_0xbd87a

UnknownScript_0xbd832:
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
	if_equal $0, UnknownScript_0xbd887
	farscall PhoneScript_Random3
	if_equal $0, UnknownScript_0xbd89e
	farjump UnknownScript_0xa0000

UnknownScript_0xbd87a:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

UnknownScript_0xbd87d:
	landmarktotext ROUTE_35, $2
	setflag ENGINE_ARNIE
	farjump UnknownScript_0xa0376

UnknownScript_0xbd887: ; start swarm
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0xbd8a2
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, $1
	swarm SWARM_YANMA, ROUTE_35
	landmarktotext ROUTE_35, $2
	farjump UnknownScript_0xa05ce

UnknownScript_0xbd89e:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd8a2:
	farjump UnknownScript_0xa0000

; Alan

AlanPhoneScript1:
	trainertotext SCHOOLBOY, ALAN1, $0
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd8cf
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue UnknownScript_0xbd8cb
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0xbd8d6
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, UnknownScript_0xbd8cb
	checkday
	iftrue UnknownScript_0xbd919

UnknownScript_0xbd8cb:
	farjump UnknownScript_0xa0970

UnknownScript_0xbd8cf:
	landmarktotext ROUTE_36, $2
	farjump UnknownScript_0xa0a73

UnknownScript_0xbd8d6:
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

UnknownScript_0xbd919:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

UnknownScript_0xbd91c:
	landmarktotext ROUTE_36, $2
	setflag ENGINE_ALAN
	farjump UnknownScript_0xa0376

UnknownScript_0xbd926:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	landmarktotext ROUTE_36, $2
	farjump UnknownScript_0xa05e6

; Dana

DanaPhoneScript1:
	trainertotext LASS, DANA1, $0
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd959
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue UnknownScript_0xbd955
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue UnknownScript_0xbd960
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, UnknownScript_0xbd955
	checknite
	iftrue UnknownScript_0xbd9ab

UnknownScript_0xbd955:
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
	farjump UnknownScript_0xa037e

UnknownScript_0xbd9b8:
	farjump UnknownScript_0xa0592

UnknownScript_0xbd9bc:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	landmarktotext ROUTE_38, $2
	farjump UnknownScript_0xa061e

; Chad

ChadPhoneScript1:
	trainertotext SCHOOLBOY, CHAD1, $0
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbd9e9
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue UnknownScript_0xbd9e5
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbd9e5
	checkmorn
	iftrue UnknownScript_0xbda20

UnknownScript_0xbd9e5:
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
	farjump UnknownScript_0xa0376

UnknownScript_0xbda2d:
	farjump UnknownScript_0xa0584

UnknownScript_0xbda31:
	farjump UnknownScript_0xa0754

DerekPhoneScript1:
	trainertotext POKEFANM, DEREK1, $0
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue UnknownScript_0xbda67
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbda5f
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue UnknownScript_0xbda5f
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0xbda63
	if_equal THURSDAY, UnknownScript_0xbda63
	if_equal SATURDAY, UnknownScript_0xbda63

UnknownScript_0xbda5f:
	farjump UnknownScript_0xa0988

UnknownScript_0xbda63:
	farjump UnknownScript_0xa05a4

UnknownScript_0xbda67:
	landmarktotext ROUTE_39, $2
	farjump UnknownScript_0xa0ad5

DerekPhoneScript2:
	trainertotext POKEFANM, DEREK1, $0
	farscall PhoneScript_GreetPhone_Male
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbda92
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue UnknownScript_0xbda92
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0xbda9e
	if_equal THURSDAY, UnknownScript_0xbda9e
	if_equal SATURDAY, UnknownScript_0xbda9e

UnknownScript_0xbda92:
	farscall PhoneScript_Random4
	if_equal $0, UnknownScript_0xbdaa2
	farjump UnknownScript_0xa0000

UnknownScript_0xbda9e:
	farjump UnknownScript_0xa05a4

UnknownScript_0xbdaa2:
	setflag ENGINE_DEREK_HAS_NUGGET
	landmarktotext ROUTE_39, $2
	farjump UnknownScript_0xa05e6

TullyPhoneScript1:
	trainertotext FISHER, TULLY1, $0
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdad5
	farscall PhoneScript_AnswerPhone_Male
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue UnknownScript_0xbdad1
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0xbdadc
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, UnknownScript_0xbdad1
	checknite
	iftrue UnknownScript_0xbdb1f

UnknownScript_0xbdad1:
	farjump UnknownScript_0xa0990

UnknownScript_0xbdad5:
	landmarktotext ROUTE_42, $2
	farjump UnknownScript_0xa0a82

UnknownScript_0xbdadc:
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
	iftrue UnknownScript_0xbdb13
	farscall PhoneScript_Random2
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb13:
	farscall PhoneScript_Random11
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb1b:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdb1f:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

UnknownScript_0xbdb22:
	landmarktotext ROUTE_42, $2
	setflag ENGINE_TULLY
	farjump UnknownScript_0xa0376

UnknownScript_0xbdb2c:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	landmarktotext ROUTE_42, $2
	farjump UnknownScript_0xa05e6

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
	if_equal $0, UnknownScript_0xbdb95
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
	farjump UnknownScript_0xa0376

UnknownScript_0xbdb95:
	farjump UnknownScript_0xa07ce

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
	farjump UnknownScript_0xa037e

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
	farjump UnknownScript_0xa061e

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
	farjump UnknownScript_0xa0376

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
	farjump UnknownScript_0xa0376

UnknownScript_0xbdd40:
	setflag ENGINE_WILTON_HAS_ITEM
	landmarktotext ROUTE_44, $2
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random $5
	if_equal $0, UnknownScript_0xbdd5e
	random $3
	if_equal $0, UnknownScript_0xbdd64
	jump UnknownScript_0xbdd6a

UnknownScript_0xbdd5e:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	jump UnknownScript_0xbdd6d

UnknownScript_0xbdd64:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	jump UnknownScript_0xbdd6d

UnknownScript_0xbdd6a:
	setevent EVENT_WILTON_HAS_POKE_BALL

UnknownScript_0xbdd6d:
	farjump UnknownScript_0xa05e6

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
	farjump UnknownScript_0xa0376

; Erin

ErinPhoneScript1:
	trainertotext PICNICKER, ERIN1, $0
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde07
	farscall PhoneScript_AnswerPhone_Female
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue UnknownScript_0xbde03
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, UnknownScript_0xbde03
	checknite
	iftrue UnknownScript_0xbde32

UnknownScript_0xbde03:
	farjump UnknownScript_0xa09c0

UnknownScript_0xbde07:
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

UnknownScript_0xbde32:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

UnknownScript_0xbde35:
	landmarktotext ROUTE_46, $2
	setflag ENGINE_ERIN
	farjump UnknownScript_0xa037e

PhoneScript_Random2:
	random 2
	end

PhoneScript_Random3:
	random 3
	end

PhoneScript_Random4:
	random 4
	end

PhoneScript_Random5:
	random 5
	end

PhoneScript_Random11:
	random 11
	end

PhoneScript_AnswerPhone_Male:
	checkday
	iftrue PhoneScript_AnswerPhone_Male_Day
	checknite
	iftrue PhoneScript_AnswerPhone_Male_Nite
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4dc5
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b5073
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5270
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55ae
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b589a
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a3b
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5c10
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5f7a
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b60f5
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b638c
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6454
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b659d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b67e2
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69a8
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b39
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6c96
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7019
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b71d5
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b730b
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b73c7
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Day:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4ded
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b509b
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b52a5
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55da
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b58c2
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a74
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5c63
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5f9e
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b611b
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63a8
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b647e
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b65c7
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b680e
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69d2
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b65
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6cc6
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7057
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b71fc
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7331
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b73ef
	buttonsound
	end

PhoneScript_AnswerPhone_Male_Nite:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4e16
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b50c2
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b52cc
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b55fc
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b58ea
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5a9f
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5cb6
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5fc9
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b6149
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63c4
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b64a8
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b65e3
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6836
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b69f8
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6b92
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6cf6
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7092
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b722a
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7357
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b7417
	buttonsound
	end

PhoneScript_AnswerPhone_Female:
	checkday
	iftrue PhoneScript_AnswerPhone_Female_Day
	checknite
	iftrue PhoneScript_AnswerPhone_Female_Nite
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b4f21
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b53f7
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5702
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5d9f
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b626a
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b66c8
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6e7c
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b751a
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Day:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b4f4d
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5424
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b572e
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5dcc
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6296
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b66ec
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ea6
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b7548
	buttonsound
	end

PhoneScript_AnswerPhone_Female_Nite:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b4f75
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5446
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b575a
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5df8
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b62c5
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6713
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ec9
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b756f
	buttonsound
	end

PhoneScript_GreetPhone_Male:
	checkday
	iftrue PhoneScript_GreetPhone_Male_Day
	checknite
	iftrue PhoneScript_GreetPhone_Male_Nite
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4e3e
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b50e9
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5301
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5628
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b5912
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5ad8
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d09
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b5ff6
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b616e
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b63e3
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b64d2
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b660d
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6862
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a22
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6bb9
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d26
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b70e7
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b725c
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b737f
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b743f
	buttonsound
	end

PhoneScript_GreetPhone_Male_Day:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4e72
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b511a
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5335
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b564c
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b5948
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b0b
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d21
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b6017
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b618f
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b6407
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6506
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b6624
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b6890
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a56
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6bef
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d57
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7112
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b7283
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b7397
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b746f
	buttonsound
	end

PhoneScript_GreetPhone_Male_Nite:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_SAILOR_HUEY, .Huey
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_JUGGLER_IRWIN, .Irwin
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_BLACKBELT_KENJI, .Kenji
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4e9e
	buttonsound
	end

.Huey:
	farwritetext UnknownText_0x1b5154
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b535f
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5670
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b597c
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b37
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d39
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b6041
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b61bd
	buttonsound
	end

.Irwin:
	farwritetext UnknownText_0x1b642c
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b6539
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b663b
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b68ba
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6a8b
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6c23
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6d88
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7132
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b72a5
	buttonsound
	end

.Kenji:
	farwritetext UnknownText_0x1b73af
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b749b
	buttonsound
	end

PhoneScript_GreetPhone_Female:
	checkday
	iftrue PhoneScript_GreetPhone_Female_Day
	checknite
	iftrue PhoneScript_GreetPhone_Female_Nite
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b4fa1
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5472
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5786
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e25
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b62f1
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6738
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6ef3
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b758f
	buttonsound
	end

PhoneScript_GreetPhone_Female_Day:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b4fda
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b54a6
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b57b7
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e59
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b630e
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6757
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f1c
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75ac
	buttonsound
	end

PhoneScript_GreetPhone_Female_Nite:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b5004
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b54d4
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b57e8
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5e8e
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6331
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6776
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f37
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75c9
	buttonsound
	end

PhoneScript_Generic_Male:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK, .Jack
	if_equal PHONE_COOLTRAINERM_GAVEN, .Gaven
	if_equal PHONE_BIRDKEEPER_JOSE, .Jose
	if_equal PHONE_YOUNGSTER_JOEY, .Joey
	if_equal PHONE_BUG_CATCHER_WADE, .Wade
	if_equal PHONE_FISHER_RALPH, .Ralph
	if_equal PHONE_HIKER_ANTHONY, .Anthony
	if_equal PHONE_CAMPER_TODD, .Todd
	if_equal PHONE_BUG_CATCHER_ARNIE, .Arnie
	if_equal PHONE_SCHOOLBOY_ALAN, .Alan
	if_equal PHONE_SCHOOLBOY_CHAD, .Chad
	if_equal PHONE_POKEFANM_DEREK, .Derek
	if_equal PHONE_FISHER_TULLY, .Tully
	if_equal PHONE_POKEMANIAC_BRENT, .Brent
	if_equal PHONE_BIRDKEEPER_VANCE, .Vance
	if_equal PHONE_FISHER_WILTON, .Wilton
	if_equal PHONE_HIKER_PARRY, .Parry

.Jack:
	farwritetext UnknownText_0x1b4ecd
	buttonsound
	end

.Unknown:
	farwritetext UnknownText_0x1b518b
	buttonsound
	end

.Gaven:
	farwritetext UnknownText_0x1b5393
	buttonsound
	end

.Jose:
	farwritetext UnknownText_0x1b5694
	buttonsound
	end

.Joey:
	farwritetext UnknownText_0x1b59b2
	buttonsound
	end

.Wade:
	farwritetext UnknownText_0x1b5b68
	buttonsound
	end

.Ralph:
	farwritetext UnknownText_0x1b5d51
	buttonsound
	end

.Anthony:
	farwritetext UnknownText_0x1b606f
	buttonsound
	end

.Todd:
	farwritetext UnknownText_0x1b61f2
	buttonsound
	end

.Arnie:
	farwritetext UnknownText_0x1b656c
	buttonsound
	end

.Alan:
	farwritetext UnknownText_0x1b6652
	buttonsound
	end

.Chad:
	farwritetext UnknownText_0x1b68e8
	buttonsound
	end

.Derek:
	farwritetext UnknownText_0x1b6ac2
	buttonsound
	end

.Tully:
	farwritetext UnknownText_0x1b6c56
	buttonsound
	end

.Brent:
	farwritetext UnknownText_0x1b6db9
	buttonsound
	end

.Vance:
	farwritetext UnknownText_0x1b7161
	buttonsound
	end

.Wilton:
	farwritetext UnknownText_0x1b72d0
	buttonsound
	end

.Parry:
	farwritetext UnknownText_0x1b74c8
	buttonsound
	end

PhoneScript_Generic_Female:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY, .Beverly
	if_equal PHONE_COOLTRAINERF_BETH, .Beth
	if_equal PHONE_COOLTRAINERF_REENA, .Reena
	if_equal PHONE_PICNICKER_LIZ, .Liz
	if_equal PHONE_PICNICKER_GINA, .Gina
	if_equal PHONE_LASS_DANA, .Dana
	if_equal PHONE_PICNICKER_TIFFANY, .Tiffany
	if_equal PHONE_PICNICKER_ERIN, .Erin

.Beverly:
	farwritetext UnknownText_0x1b502b
	buttonsound
	end

.Beth:
	farwritetext UnknownText_0x1b5510
	buttonsound
	end

.Reena:
	farwritetext UnknownText_0x1b5819
	buttonsound
	end

.Liz:
	farwritetext UnknownText_0x1b5ebe
	buttonsound
	end

.Gina:
	farwritetext UnknownText_0x1b6352
	buttonsound
	end

.Dana:
	farwritetext UnknownText_0x1b6795
	buttonsound
	end

.Tiffany:
	farwritetext UnknownText_0x1b6f60
	buttonsound
	end

.Erin:
	farwritetext UnknownText_0x1b75e5
	buttonsound
	end

PhoneScript_MonFlavorText:
	special RandomPhoneMon
	farscall PhoneScript_Random2
	if_equal $0, .TooEnergetic
	farwritetext UnknownText_0x1b518b
	buttonsound
	farjump PhoneScript_HangupText_Male

.TooEnergetic:
	farjump .unnecessary

.unnecessary
	farwritetext UnknownText_0x1b522b
	buttonsound
	farjump PhoneScript_HangupText_Male
; be643


String_be643: db "Grandma@"
String_be64b: db "Grandpa@"
String_be653: db "Mom@"
String_be657: db "Dad@"
String_be65b: db "Sister@"
String_be662: db "Brother@"

