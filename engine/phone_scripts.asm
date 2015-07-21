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
	keeptextopen
	mapnametotext $0
	checkcode VAR_ROOFPALETTE
	if_equal $1, UnknownScript_0xbcee7
	if_equal $2, UnknownScript_0xbcf27
	jump UnknownScript_0xbcf2f

UnknownScript_0xbcedf: ; 0xbcedf
	farwritetext UnknownText_0x1b4021
	keeptextopen
	jump UnknownScript_0xbcf37

UnknownScript_0xbcee7: ; 0xbcee7
	checkcode VAR_MAPGROUP
	if_equal GROUP_NEW_BARK_TOWN, .newbark
	if_equal GROUP_CHERRYGROVE_CITY, .cherrygrove
	if_equal GROUP_VIOLET_CITY, .violet
	if_equal GROUP_AZALEA_TOWN, .azalea
	if_equal GROUP_GOLDENROD_CITY, .goldenrod
	farwritetext MomPhoneGenericAreaText
	keeptextopen
	jump UnknownScript_0xbcf37

.newbark ; 0xbcf05
	farwritetext MomPhoneNewBarkText
	keeptextopen
	jump UnknownScript_0xbcf37

.cherrygrove ; 0xbcf0d
	farwritetext MomPhoneCherrygroveText
	keeptextopen
	jump UnknownScript_0xbcf37

.violet ; 0xbcf15
	displaylocation SPROUT_TOWER, 1
	jump UnknownScript_0xbcedf
.azalea ; 0xbcf1b
	displaylocation SLOWPOKE_WELL, 1
	jump UnknownScript_0xbcedf
.goldenrod ; 0xbcf21
	displaylocation RADIO_TOWER, 1
	jump UnknownScript_0xbcedf

UnknownScript_0xbcf27: ; 0xbcf27
	farwritetext UnknownText_0x1b411c
	keeptextopen
	jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	farwritetext UnknownText_0x1b4150
	keeptextopen
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
	keeptextopen
	jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript: ; 0xbcf92
	clearflag ENGINE_MOM_SAVING_MONEY
	farwritetext MomPhoneWontSaveMoneyText
	keeptextopen
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
	specialphonecall ELMCALL_NONE
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
	keeptextopen
	jump .main

.daygreet ; 0xbcfd7
	farwritetext BillPhoneDayGreetingText
	keeptextopen
	jump .main

.nitegreet ; 0xbcfdf
	farwritetext BillPhoneNiteGreetingText
	keeptextopen
	jump .main

.main ; 0xbcfe7
	farwritetext BillPhoneGeneriText
	keeptextopen
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
	closetext
	end

; Elm

ElmPhoneScript1: ; 0xbd00d
	checkcode VAR_POKERUS
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
	specialphonecall ELMCALL_NONE
	end

ElmPhoneScript2: ; 0xbd081
	checkcode VAR_POKERUS
	if_equal $2, .disaster
	if_equal $3, .assistant
	if_equal $4, .rocket
	if_equal $5, .gift
	if_equal $8, .gift
	farwritetext ElmPhonePokerusText
	specialphonecall ELMCALL_NONE
	end

.disaster ; 0xbd09f
	farwritetext ElmPhoneDisasterText
	specialphonecall ELMCALL_NONE
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant ; 0xbd0aa
	farwritetext ElmPhoneEggAssistantText
	specialphonecall ELMCALL_NONE
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket ; 0xbd0b8
	farwritetext ElmPhoneRocketText
	specialphonecall ELMCALL_NONE
	end

.gift ; 0xbd0c0
	farwritetext ElmPhoneGiftText
	specialphonecall ELMCALL_NONE
	end

.unused ; 0xbd0c8
	farwritetext ElmPhoneUnusedText
	specialphonecall ELMCALL_NONE
	end
; bd0d0

; Jack

UnknownScript_0xbd0d0:
	trainertotext SCHOOLBOY, JACK1, $0
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd0f3
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue UnknownScript_0xbd0ef
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0xbd0ef
	checkmorn
	iftrue UnknownScript_0xbd12a

UnknownScript_0xbd0ef:
	farjump UnknownScript_0xa08f8

UnknownScript_0xbd0f3:
	displaylocation NATIONAL_PARK, $2
	farjump UnknownScript_0xa0a2d

UnknownScript_0xbd0fa:
	trainertotext SCHOOLBOY, JACK1, $0
	farscall UnknownScript_0xbe1b6
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd13b
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd11e
	checkflag ENGINE_JACK_MONDAY_MORNING
	iftrue UnknownScript_0xbd11e
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd12d

UnknownScript_0xbd11e:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd137
	farjump UnknownScript_0xa0000

UnknownScript_0xbd12a:
	setflag ENGINE_JACK_MONDAY_MORNING

UnknownScript_0xbd12d:
	displaylocation NATIONAL_PARK, $2
	setflag ENGINE_JACK
	farjump UnknownScript_0xa0376

UnknownScript_0xbd137:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd13b:
	farjump UnknownScript_0xa0654

; Beverly

UnknownScript_0xbd13f:
	trainertotext POKEFANF, BEVERLY1, $0
	farscall UnknownScript_0xbe0b6
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd151
	farjump UnknownScript_0xa0900

UnknownScript_0xbd151:
	displaylocation NATIONAL_PARK, $2
	farjump UnknownScript_0xa0aa5

UnknownScript_0xbd158:
	trainertotext POKEFANF, BEVERLY1, $0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd16e
	farscall UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbd172

UnknownScript_0xbd16e:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd172:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	displaylocation NATIONAL_PARK, $2
	farjump UnknownScript_0xa061e

; Huey

UnknownScript_0xbd17c:
	trainertotext SAILOR, HUEY1, $0
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1a2
	farscall UnknownScript_0xbde4e
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
	displaylocation LIGHTHOUSE, $2
	farjump UnknownScript_0xa0a32

UnknownScript_0xbd1a9:
	trainertotext SAILOR, HUEY1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1c9
	checkflag ENGINE_HUEY_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbd1c9
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd1d0
	if_equal $1, UnknownScript_0xbd1d0

UnknownScript_0xbd1c9:
	farjump UnknownScript_0xbe622

UnknownScript_0xbd1cd:
	setflag ENGINE_HUEY_WEDNESDAY_NIGHT

UnknownScript_0xbd1d0:
	displaylocation LIGHTHOUSE, $2
	setflag ENGINE_HUEY
	farjump UnknownScript_0xa0376

; Gaven

UnknownScript_0xbd1da:
	trainertotext COOLTRAINERM, GAVEN3, $0
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd1fd
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue UnknownScript_0xbd1f9
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, UnknownScript_0xbd1f9
	checkmorn
	iftrue UnknownScript_0xbd22c

UnknownScript_0xbd1f9:
	farjump UnknownScript_0xa0910

UnknownScript_0xbd1fd:
	displaylocation ROUTE_26, $2
	farjump UnknownScript_0xa0a37

UnknownScript_0xbd204:
	trainertotext COOLTRAINERM, GAVEN3, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd220
	checkflag ENGINE_GAVEN_THURSDAY_MORNING
	iftrue UnknownScript_0xbd220
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd22f

UnknownScript_0xbd220:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd239
	farjump UnknownScript_0xa0000

UnknownScript_0xbd22c:
	setflag ENGINE_GAVEN_THURSDAY_MORNING

UnknownScript_0xbd22f:
	displaylocation ROUTE_26, $2
	setflag ENGINE_GAVEN
	farjump UnknownScript_0xa0376

UnknownScript_0xbd239:
	farjump UnknownScript_0xa0584

; Beth

UnknownScript_0xbd23d:
	trainertotext COOLTRAINERF, BETH1, $0
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd260
	farscall UnknownScript_0xbe0b6
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbd25c
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbd25c
	checkday
	iftrue UnknownScript_0xbd287

UnknownScript_0xbd25c:
	farjump UnknownScript_0xa0918

UnknownScript_0xbd260:
	displaylocation ROUTE_26, $2
	farjump UnknownScript_0xa0a3c

UnknownScript_0xbd267:
	trainertotext COOLTRAINERF, BETH1, $0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd283
	checkflag ENGINE_BETH_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbd283
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd28a

UnknownScript_0xbd283:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd287:
	setflag ENGINE_BETH_FRIDAY_AFTERNOON

UnknownScript_0xbd28a:
	displaylocation ROUTE_26, $2
	setflag ENGINE_BETH
	farjump UnknownScript_0xa037e

; Jose

UnknownScript_0xbd294:
	trainertotext BIRD_KEEPER, JOSE2, $0
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2bd
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_27, $2
	farjump UnknownScript_0xa0a41

UnknownScript_0xbd2c4:
	displaylocation ROUTE_27, $2
	farjump UnknownScript_0xa0a41

UnknownScript_0xbd2cb:
	trainertotext BIRD_KEEPER, JOSE2, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_JOSE_SATURDAY_NIGHT
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2f5
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd304
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd312

UnknownScript_0xbd2f5:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd30e
	farjump UnknownScript_0xa0000

UnknownScript_0xbd301:
	setflag ENGINE_JOSE_SATURDAY_NIGHT

UnknownScript_0xbd304:
	displaylocation ROUTE_27, $2
	setflag ENGINE_JOSE
	farjump UnknownScript_0xa0376

UnknownScript_0xbd30e:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd312:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	displaylocation ROUTE_27, $2
	farjump UnknownScript_0xa05e6

; Reena

UnknownScript_0xbd31c:
	trainertotext COOLTRAINERF, REENA1, $0
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd33f
	farscall UnknownScript_0xbe0b6
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue UnknownScript_0xbd33b
	checkcode VAR_WEEKDAY
	if_not_equal SUNDAY, UnknownScript_0xbd33b
	checkmorn
	iftrue UnknownScript_0xbd366

UnknownScript_0xbd33b:
	farjump UnknownScript_0xa0928

UnknownScript_0xbd33f:
	displaylocation ROUTE_27, $2
	farjump UnknownScript_0xa0a46

UnknownScript_0xbd346:
	trainertotext COOLTRAINERF, REENA1, $0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd362
	checkflag ENGINE_REENA_SUNDAY_MORNING
	iftrue UnknownScript_0xbd362
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd369

UnknownScript_0xbd362:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd366:
	setflag ENGINE_REENA_SUNDAY_MORNING

UnknownScript_0xbd369:
	displaylocation ROUTE_27, $2
	setflag ENGINE_REENA
	farjump UnknownScript_0xa037e

; Joey

UnknownScript_0xbd373:
	trainertotext YOUNGSTER, JOEY1, $0
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd399
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_30, $2
	farjump UnknownScript_0xa0a4b

UnknownScript_0xbd3a0:
	trainertotext YOUNGSTER, JOEY1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd3c0
	checkflag ENGINE_JOEY_MONDAY_AFTERNOON
	iftrue UnknownScript_0xbd3c0
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd3c7
	if_equal $1, UnknownScript_0xbd3c7

UnknownScript_0xbd3c0:
	farjump UnknownScript_0xa0000

UnknownScript_0xbd3c4:
	setflag ENGINE_JOEY_MONDAY_AFTERNOON

UnknownScript_0xbd3c7:
	displaylocation ROUTE_30, $2
	setflag ENGINE_JOEY
	farjump UnknownScript_0xa0376

; Wade

UnknownScript_0xbd3d1:
	trainertotext BUG_CATCHER, WADE1, $0
	checkflag ENGINE_WADE
	iftrue UnknownScript_0xbd41a
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_WADE_TUESDAY_NIGHT
	iftrue UnknownScript_0xbd3f6
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0xbd421
	checkcode VAR_WEEKDAY
	if_not_equal TUESDAY, UnknownScript_0xbd3f6
	checknite
	iftrue UnknownScript_0xbd484

UnknownScript_0xbd3f6:
	farscall UnknownScript_0xbde3f
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
	displaylocation ROUTE_31, $2
	farjump UnknownScript_0xa0a50

UnknownScript_0xbd421:
	displaylocation ROUTE_31, $2
	farjump UnknownScript_0xa0ab5

UnknownScript_0xbd428:
	trainertotext BUG_CATCHER, WADE1, $0
	farscall UnknownScript_0xbe1b6
	farscall UnknownScript_0xbde3f
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
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd495
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd474
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd487

UnknownScript_0xbd474:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd491
	farjump UnknownScript_0xa0000

UnknownScript_0xbd480:
	farjump UnknownScript_0xa05a4

UnknownScript_0xbd484:
	setflag ENGINE_WADE_TUESDAY_NIGHT

UnknownScript_0xbd487:
	displaylocation ROUTE_31, $2
	setflag ENGINE_WADE
	farjump UnknownScript_0xa0376

UnknownScript_0xbd491:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd495:
	setflag ENGINE_WADE_HAS_ITEM
	displaylocation ROUTE_31, $2
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

UnknownScript_0xbd4d2:
	trainertotext FISHER, RALPH1, $0
	checkflag ENGINE_RALPH
	iftrue UnknownScript_0xbd4fb
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue UnknownScript_0xbd4f1
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, UnknownScript_0xbd4f1
	checkmorn
	iftrue UnknownScript_0xbd537

UnknownScript_0xbd4f1:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue UnknownScript_0xbd502
	farjump UnknownScript_0xa0940

UnknownScript_0xbd4fb:
	displaylocation ROUTE_32, $2
	farjump UnknownScript_0xa0a55

UnknownScript_0xbd502:
	displaylocation ROUTE_32, $2
	farjump UnknownScript_0xa0af5

UnknownScript_0xbd509:
	trainertotext FISHER, RALPH1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd52b
	checkflag ENGINE_RALPH
	iftrue UnknownScript_0xbd52b
	checkflag ENGINE_RALPH_WEDNESDAY_MORNING
	iftrue UnknownScript_0xbd52b
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd53a

UnknownScript_0xbd52b:
	farscall UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd544
	farjump UnknownScript_0xa0000

UnknownScript_0xbd537:
	setflag ENGINE_RALPH_WEDNESDAY_MORNING

UnknownScript_0xbd53a:
	displaylocation ROUTE_32, $2
	setflag ENGINE_RALPH
	farjump UnknownScript_0xa0376

UnknownScript_0xbd544:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue UnknownScript_0xbd55c
	setflag ENGINE_SPECIAL_WILDDATA
	pokenamemem QWILFISH, $1
	displaylocation ROUTE_32, $2
	writebyte $1
	special Functionc3fc
	farjump UnknownScript_0xa05d6

UnknownScript_0xbd55c:
	farjump UnknownScript_0xa0000

; Liz

UnknownScript_0xbd560:
	trainertotext PICNICKER, LIZ1, $0
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd586
	farscall UnknownScript_0xbe0b6
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
	displaylocation ROUTE_32, $2
	farjump UnknownScript_0xa0a5a

UnknownScript_0xbd58d:
	trainertotext PICNICKER, LIZ1, $0
	farscall UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbd5d0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd5a9
	checkflag ENGINE_LIZ_THURSDAY_AFTERNOON
	iftrue UnknownScript_0xbd5a9

UnknownScript_0xbd5a9:
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd5d4
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd5bf
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd5c6

UnknownScript_0xbd5bf:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd5c3:
	setflag ENGINE_LIZ_THURSDAY_AFTERNOON

UnknownScript_0xbd5c6:
	displaylocation ROUTE_32, $2
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

UnknownScript_0xbd634:
	trainertotext HIKER, ANTHONY2, $0
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd65d
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_33, $2
	farjump UnknownScript_0xa0a5f

UnknownScript_0xbd664:
	displaylocation ROUTE_33, $2
	farjump UnknownScript_0xa0afa

UnknownScript_0xbd66b:
	trainertotext HIKER, ANTHONY2, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd68d
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd68d
	checkflag ENGINE_ANTHONY_FRIDAY_NIGHT
	iftrue UnknownScript_0xbd68d
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd69c

UnknownScript_0xbd68d:
	farscall UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd6a6
	farjump UnknownScript_0xa0000

UnknownScript_0xbd699:
	setflag ENGINE_ANTHONY_FRIDAY_NIGHT

UnknownScript_0xbd69c:
	displaylocation ROUTE_33, $2
	setflag ENGINE_ANTHONY
	farjump UnknownScript_0xa0376

UnknownScript_0xbd6a6:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0xbd6bd
	setflag ENGINE_DUNSPARCE_SWARM
	pokenamemem DUNSPARCE, $1
	loadwilddata $0, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE
	displaylocation DARK_CAVE, $2
	farjump UnknownScript_0xa05de

UnknownScript_0xbd6bd:
	farjump UnknownScript_0xa0000

; Todd

UnknownScript_0xbd6c1:
	trainertotext CAMPER, TODD1, $0
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd6ea
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_34, $2
	farjump UnknownScript_0xa0a64

UnknownScript_0xbd6f1:
	farjump UnknownScript_0xa0b04

UnknownScript_0xbd6f5:
	trainertotext CAMPER, TODD1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_TODD_SATURDAY_MORNING
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd71f
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd72e

UnknownScript_0xbd717:
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd73c

UnknownScript_0xbd71f:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd738
	farjump UnknownScript_0xa0000

UnknownScript_0xbd72b:
	setflag ENGINE_TODD_SATURDAY_MORNING

UnknownScript_0xbd72e:
	displaylocation ROUTE_34, $2
	setflag ENGINE_TODD
	farjump UnknownScript_0xa0376

UnknownScript_0xbd738:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd73c:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	farjump UnknownScript_0xa0644

; Gina

UnknownScript_0xbd743:
	trainertotext PICNICKER, GINA1, $0
	checkflag ENGINE_GINA
	iftrue UnknownScript_0xbd776
	farscall UnknownScript_0xbe0b6
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
	displaylocation ROUTE_34, $2
	farjump UnknownScript_0xa0a69

UnknownScript_0xbd77d:
	displaylocation ROUTE_34, $2
	farjump UnknownScript_0xa0abd

UnknownScript_0xbd784:
	trainertotext PICNICKER, GINA1, $0
	farscall UnknownScript_0xbe41e
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
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd7dd

UnknownScript_0xbd7b2:
	farscall UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd7dd
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd7c8
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd7cf

UnknownScript_0xbd7c8:
	farjump UnknownScript_0xa0017

UnknownScript_0xbd7cc:
	setflag ENGINE_GINA_SUNDAY_AFTERNOON

UnknownScript_0xbd7cf:
	displaylocation ROUTE_34, $2
	setflag ENGINE_GINA
	farjump UnknownScript_0xa037e

UnknownScript_0xbd7d9:
	farjump UnknownScript_0xa05c6

UnknownScript_0xbd7dd:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	displaylocation ROUTE_34, $2
	farjump UnknownScript_0xa061e

; Irwin

UnknownScript_0xbd7e7:
	trainertotext JUGGLER, IRWIN1, $0
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd7f9
	farjump UnknownScript_0xa09c8

UnknownScript_0xbd7f9:
	farjump UnknownScript_0xa05be

UnknownScript_0xbd7fd:
	trainertotext JUGGLER, IRWIN1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_ROCKETS_IN_RADIO_TOWER
	iftrue UnknownScript_0xbd80f
	farjump UnknownScript_0xa0848

UnknownScript_0xbd80f:
	farjump UnknownScript_0xa05be

; Arnie

UnknownScript_0xbd813:
	trainertotext BUG_CATCHER, ARNIE1, $0
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd83c
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_35, $2
	farjump UnknownScript_0xa0a6e

UnknownScript_0xbd843:
	displaylocation ROUTE_35, $2
	farjump UnknownScript_0xa0aff

UnknownScript_0xbd84a:
	trainertotext BUG_CATCHER, ARNIE1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd866
	checkflag ENGINE_ARNIE_TUESDAY_MORNING
	iftrue UnknownScript_0xbd866
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd87d

UnknownScript_0xbd866:
	farscall UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd887
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd89e
	farjump UnknownScript_0xa0000

UnknownScript_0xbd87a:
	setflag ENGINE_ARNIE_TUESDAY_MORNING

UnknownScript_0xbd87d:
	displaylocation ROUTE_35, $2
	setflag ENGINE_ARNIE
	farjump UnknownScript_0xa0376

UnknownScript_0xbd887:
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0xbd8a2
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, $1
	loadwilddata $1, GROUP_ROUTE_35, MAP_ROUTE_35
	displaylocation ROUTE_35, $2
	farjump UnknownScript_0xa05ce

UnknownScript_0xbd89e:
	farjump UnknownScript_0xa0584

UnknownScript_0xbd8a2:
	farjump UnknownScript_0xa0000

; Alan

UnknownScript_0xbd8a6:
	trainertotext SCHOOLBOY, ALAN1, $0
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd8cf
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_36, $2
	farjump UnknownScript_0xa0a73

UnknownScript_0xbd8d6:
	displaylocation ROUTE_36, $2
	farjump UnknownScript_0xa0ac5

UnknownScript_0xbd8dd:
	trainertotext SCHOOLBOY, ALAN1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd915
	checkflag ENGINE_ALAN_WEDNESDAY_AFTERNOON
	iftrue UnknownScript_0xbd915
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0xbd915
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd91c
	checkevent EVENT_ALAN_GAVE_FIRE_STONE
	iftrue UnknownScript_0xbd90d
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd90d:
	farscall UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd915:
	farjump UnknownScript_0xa0000

UnknownScript_0xbd919:
	setflag ENGINE_ALAN_WEDNESDAY_AFTERNOON

UnknownScript_0xbd91c:
	displaylocation ROUTE_36, $2
	setflag ENGINE_ALAN
	farjump UnknownScript_0xa0376

UnknownScript_0xbd926:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	displaylocation ROUTE_36, $2
	farjump UnknownScript_0xa05e6

; Dana

UnknownScript_0xbd930:
	trainertotext LASS, DANA1, $0
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd959
	farscall UnknownScript_0xbe0b6
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
	displaylocation ROUTE_38, $2
	farjump UnknownScript_0xa0a78

UnknownScript_0xbd960:
	displaylocation ROUTE_38, $2
	farjump UnknownScript_0xa0acd

UnknownScript_0xbd967:
	trainertotext LASS, DANA1, $0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd99f
	checkflag ENGINE_DANA_THURSDAY_NIGHT
	iftrue UnknownScript_0xbd99f
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue UnknownScript_0xbd99f
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd9ae
	checkevent EVENT_DANA_GAVE_THUNDERSTONE
	iftrue UnknownScript_0xbd997
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd997:
	farscall UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd99f:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd9b8
	farjump UnknownScript_0xa0017

UnknownScript_0xbd9ab:
	setflag ENGINE_DANA_THURSDAY_NIGHT

UnknownScript_0xbd9ae:
	displaylocation ROUTE_38, $2
	setflag ENGINE_DANA
	farjump UnknownScript_0xa037e

UnknownScript_0xbd9b8:
	farjump UnknownScript_0xa0592

UnknownScript_0xbd9bc:
	setflag ENGINE_DANA_HAS_THUNDERSTONE
	displaylocation ROUTE_38, $2
	farjump UnknownScript_0xa061e

; Chad

UnknownScript_0xbd9c6:
	trainertotext SCHOOLBOY, CHAD1, $0
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbd9e9
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue UnknownScript_0xbd9e5
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbd9e5
	checkmorn
	iftrue UnknownScript_0xbda20

UnknownScript_0xbd9e5:
	farjump UnknownScript_0xa0980

UnknownScript_0xbd9e9:
	displaylocation ROUTE_38, $2
	farjump UnknownScript_0xa0a7d

UnknownScript_0xbd9f0:
	trainertotext SCHOOLBOY, CHAD1, $0
	farscall UnknownScript_0xbe1b6
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda31
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbda14
	checkflag ENGINE_CHAD_FRIDAY_MORNING
	iftrue UnknownScript_0xbda14
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda23

UnknownScript_0xbda14:
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbda2d
	farjump UnknownScript_0xa0000

UnknownScript_0xbda20:
	setflag ENGINE_CHAD_FRIDAY_MORNING

UnknownScript_0xbda23:
	displaylocation ROUTE_38, $2
	setflag ENGINE_CHAD
	farjump UnknownScript_0xa0376

UnknownScript_0xbda2d:
	farjump UnknownScript_0xa0584

UnknownScript_0xbda31:
	farjump UnknownScript_0xa0754

UnknownScript_0xbda35:
	trainertotext POKEFANM, DEREK1, $0
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue UnknownScript_0xbda67
	farscall UnknownScript_0xbde3f
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
	displaylocation ROUTE_39, $2
	farjump UnknownScript_0xa0ad5

UnknownScript_0xbda6e:
	trainertotext POKEFANM, DEREK1, $0
	farscall UnknownScript_0xbe1b6
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda92
	checkflag ENGINE_DAILY_BUG_CONTEST
	iftrue UnknownScript_0xbda92
	checkcode VAR_WEEKDAY
	if_equal TUESDAY, UnknownScript_0xbda9e
	if_equal THURSDAY, UnknownScript_0xbda9e
	if_equal SATURDAY, UnknownScript_0xbda9e

UnknownScript_0xbda92:
	farscall UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbdaa2
	farjump UnknownScript_0xa0000

UnknownScript_0xbda9e:
	farjump UnknownScript_0xa05a4

UnknownScript_0xbdaa2:
	setflag ENGINE_DEREK_HAS_NUGGET
	displaylocation ROUTE_39, $2
	farjump UnknownScript_0xa05e6

UnknownScript_0xbdaac:
	trainertotext FISHER, TULLY1, $0
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdad5
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_42, $2
	farjump UnknownScript_0xa0a82

UnknownScript_0xbdadc:
	displaylocation ROUTE_42, $2
	farjump UnknownScript_0xa0add

UnknownScript_0xbdae3:
	trainertotext FISHER, TULLY1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdb1b
	checkflag ENGINE_TULLY_SUNDAY_NIGHT
	iftrue UnknownScript_0xbdb1b
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0xbdb1b
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdb22
	checkevent EVENT_TULLY_GAVE_WATER_STONE
	iftrue UnknownScript_0xbdb13
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb13:
	farscall UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb1b:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdb1f:
	setflag ENGINE_TULLY_SUNDAY_NIGHT

UnknownScript_0xbdb22:
	displaylocation ROUTE_42, $2
	setflag ENGINE_TULLY
	farjump UnknownScript_0xa0376

UnknownScript_0xbdb2c:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	displaylocation ROUTE_42, $2
	farjump UnknownScript_0xa05e6

UnknownScript_0xbdb36:
	trainertotext POKEMANIAC, BRENT1, $0
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb59
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue UnknownScript_0xbdb55
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, UnknownScript_0xbdb55
	checkmorn
	iftrue UnknownScript_0xbdb88

UnknownScript_0xbdb55:
	farjump UnknownScript_0xa0998

UnknownScript_0xbdb59:
	displaylocation ROUTE_43, $2
	farjump UnknownScript_0xa0a87

UnknownScript_0xbdb60:
	trainertotext POKEMANIAC, BRENT1, $0
	farscall UnknownScript_0xbe1b6
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb95
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb84
	checkflag ENGINE_BRENT_MONDAY_MORNING
	iftrue UnknownScript_0xbdb84
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb8b

UnknownScript_0xbdb84:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdb88:
	setflag ENGINE_BRENT_MONDAY_MORNING

UnknownScript_0xbdb8b:
	displaylocation ROUTE_43, $2
	setflag ENGINE_BRENT
	farjump UnknownScript_0xa0376

UnknownScript_0xbdb95:
	farjump UnknownScript_0xa07ce

UnknownScript_0xbdb99:
	trainertotext PICNICKER, TIFFANY3, $0
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0xbdbc2
	farscall UnknownScript_0xbe0b6
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
	displaylocation ROUTE_43, $2
	farjump UnknownScript_0xa0a8c

UnknownScript_0xbdbc9:
	displaylocation ROUTE_43, $2
	farjump UnknownScript_0xa0ae5

UnknownScript_0xbdbd0:
	trainertotext PICNICKER, TIFFANY3, $0
	farscall UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbdc21
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0xbdc10
	checkflag ENGINE_TIFFANY_TUESDAY_AFTERNOON
	iftrue UnknownScript_0xbdc10
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0xbdc10
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdc17
	checkevent EVENT_TIFFANY_GAVE_PINK_BOW
	iftrue UnknownScript_0xbdc08
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc08:
	farscall UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc10:
	farjump UnknownScript_0xa0017

UnknownScript_0xbdc14:
	setflag ENGINE_TIFFANY_TUESDAY_AFTERNOON

UnknownScript_0xbdc17:
	displaylocation ROUTE_43, $2
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
	displaylocation ROUTE_43, $2
	farjump UnknownScript_0xa061e

; Vance

UnknownScript_0xbdc73:
	trainertotext BIRD_KEEPER, VANCE1, $0
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdc96
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbdc92
	checkcode VAR_WEEKDAY
	if_not_equal WEDNESDAY, UnknownScript_0xbdc92
	checknite
	iftrue UnknownScript_0xbdcc1

UnknownScript_0xbdc92:
	farjump UnknownScript_0xa09a8

UnknownScript_0xbdc96:
	displaylocation ROUTE_44, $2
	farjump UnknownScript_0xa0a91

UnknownScript_0xbdc9d:
	trainertotext BIRD_KEEPER, VANCE1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdcbd
	checkflag ENGINE_VANCE_WEDNESDAY_NIGHT
	iftrue UnknownScript_0xbdcbd
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdcc4
	if_equal $1, UnknownScript_0xbdcc4

UnknownScript_0xbdcbd:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdcc1:
	setflag ENGINE_VANCE_WEDNESDAY_NIGHT

UnknownScript_0xbdcc4:
	displaylocation ROUTE_44, $2
	setflag ENGINE_VANCE
	farjump UnknownScript_0xa0376

UnknownScript_0xbdcce:
	trainertotext FISHER, WILTON1, $0
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdcf7
	farscall UnknownScript_0xbde4e
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
	displaylocation ROUTE_44, $2
	farjump UnknownScript_0xa0a96

UnknownScript_0xbdcfe:
	displaylocation ROUTE_44, $2
	farjump UnknownScript_0xa0aed

UnknownScript_0xbdd05:
	trainertotext FISHER, WILTON1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_WILTON_THRUSDAY_MORNING
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0xbdd2f
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdd36
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdd40

UnknownScript_0xbdd2f:
	farjump UnknownScript_0xa0000

UnknownScript_0xbdd33:
	setflag ENGINE_WILTON_THRUSDAY_MORNING

UnknownScript_0xbdd36:
	displaylocation ROUTE_44, $2
	setflag ENGINE_WILTON
	farjump UnknownScript_0xa0376

UnknownScript_0xbdd40:
	setflag ENGINE_WILTON_HAS_ITEM
	displaylocation ROUTE_44, $2
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

UnknownScript_0xbdd71:
	trainertotext BLACKBELT_T, KENJI3, $0
	farscall UnknownScript_0xbde4e
	farjump UnknownScript_0xa09ee

UnknownScript_0xbdd7d:
	trainertotext BLACKBELT_T, KENJI3, $0
	farscall UnknownScript_0xbe1b6
	farjump UnknownScript_0xa064c

; Parry

UnknownScript_0xbdd89:
	trainertotext HIKER, PARRY1, $0
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddac
	farscall UnknownScript_0xbde4e
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbdda8
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, UnknownScript_0xbdda8
	checkday
	iftrue UnknownScript_0xbddd7

UnknownScript_0xbdda8:
	farjump UnknownScript_0xa09b8

UnknownScript_0xbddac:
	displaylocation ROUTE_45, $2
	farjump UnknownScript_0xa0a9b

UnknownScript_0xbddb3:
	trainertotext HIKER, PARRY1, $0
	farscall UnknownScript_0xbe1b6
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddd3
	checkflag ENGINE_PARRY_FRIDAY_AFTERNOON
	iftrue UnknownScript_0xbddd3
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbddda
	if_equal $1, UnknownScript_0xbddda

UnknownScript_0xbddd3:
	farjump UnknownScript_0xa0000

UnknownScript_0xbddd7:
	setflag ENGINE_PARRY_FRIDAY_AFTERNOON

UnknownScript_0xbddda:
	displaylocation ROUTE_45, $2
	setflag ENGINE_PARRY
	farjump UnknownScript_0xa0376

; Erin

UnknownScript_0xbdde4:
	trainertotext PICNICKER, ERIN1, $0
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde07
	farscall UnknownScript_0xbe0b6
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue UnknownScript_0xbde03
	checkcode VAR_WEEKDAY
	if_not_equal SATURDAY, UnknownScript_0xbde03
	checknite
	iftrue UnknownScript_0xbde32

UnknownScript_0xbde03:
	farjump UnknownScript_0xa09c0

UnknownScript_0xbde07:
	displaylocation ROUTE_46, $2
	farjump UnknownScript_0xa0aa0

UnknownScript_0xbde0e:
	trainertotext PICNICKER, ERIN1, $0
	farscall UnknownScript_0xbe41e
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde2e
	checkflag ENGINE_ERIN_SATURDAY_NIGHT
	iftrue UnknownScript_0xbde2e
	farscall UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbde35
	if_equal $1, UnknownScript_0xbde35

UnknownScript_0xbde2e:
	farjump UnknownScript_0xa0017

UnknownScript_0xbde32:
	setflag ENGINE_ERIN_SATURDAY_NIGHT

UnknownScript_0xbde35:
	displaylocation ROUTE_46, $2
	setflag ENGINE_ERIN
	farjump UnknownScript_0xa037e

UnknownScript_0xbde3f:
	random $2
	end

UnknownScript_0xbde42:
	random $3
	end

UnknownScript_0xbde45:
	random $4
	end

UnknownScript_0xbde48:
	random $5
	end

UnknownScript_0xbde4b:
	random $b
	end

UnknownScript_0xbde4e:
	checkday
	iftrue UnknownScript_0xbdf22
	checknite
	iftrue UnknownScript_0xbdfec
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbdeaa
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbdeb0
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbdeb6
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbdebc
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbdec2
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbdec8
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbdece
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbded4
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbdeda
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbdee0
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbdee6
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbdeec
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbdef2
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbdef8
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbdefe
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbdf04
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbdf0a
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbdf10
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbdf16
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbdf1c

UnknownScript_0xbdeaa:
	farwritetext UnknownText_0x1b4dc5
	keeptextopen
	end

UnknownScript_0xbdeb0:
	farwritetext UnknownText_0x1b5073
	keeptextopen
	end

UnknownScript_0xbdeb6:
	farwritetext UnknownText_0x1b5270
	keeptextopen
	end

UnknownScript_0xbdebc:
	farwritetext UnknownText_0x1b55ae
	keeptextopen
	end

UnknownScript_0xbdec2:
	farwritetext UnknownText_0x1b589a
	keeptextopen
	end

UnknownScript_0xbdec8:
	farwritetext UnknownText_0x1b5a3b
	keeptextopen
	end

UnknownScript_0xbdece:
	farwritetext UnknownText_0x1b5c10
	keeptextopen
	end

UnknownScript_0xbded4:
	farwritetext UnknownText_0x1b5f7a
	keeptextopen
	end

UnknownScript_0xbdeda:
	farwritetext UnknownText_0x1b60f5
	keeptextopen
	end

UnknownScript_0xbdee0:
	farwritetext UnknownText_0x1b638c
	keeptextopen
	end

UnknownScript_0xbdee6:
	farwritetext UnknownText_0x1b6454
	keeptextopen
	end

UnknownScript_0xbdeec:
	farwritetext UnknownText_0x1b659d
	keeptextopen
	end

UnknownScript_0xbdef2:
	farwritetext UnknownText_0x1b67e2
	keeptextopen
	end

UnknownScript_0xbdef8:
	farwritetext UnknownText_0x1b69a8
	keeptextopen
	end

UnknownScript_0xbdefe:
	farwritetext UnknownText_0x1b6b39
	keeptextopen
	end

UnknownScript_0xbdf04:
	farwritetext UnknownText_0x1b6c96
	keeptextopen
	end

UnknownScript_0xbdf0a:
	farwritetext UnknownText_0x1b7019
	keeptextopen
	end

UnknownScript_0xbdf10:
	farwritetext UnknownText_0x1b71d5
	keeptextopen
	end

UnknownScript_0xbdf16:
	farwritetext UnknownText_0x1b730b
	keeptextopen
	end

UnknownScript_0xbdf1c:
	farwritetext UnknownText_0x1b73c7
	keeptextopen
	end

UnknownScript_0xbdf22:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbdf74
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbdf7a
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbdf80
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbdf86
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbdf8c
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbdf92
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbdf98
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbdf9e
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbdfa4
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbdfaa
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbdfb0
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbdfb6
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbdfbc
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbdfc2
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbdfc8
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbdfce
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbdfd4
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbdfda
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbdfe0
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbdfe6

UnknownScript_0xbdf74:
	farwritetext UnknownText_0x1b4ded
	keeptextopen
	end

UnknownScript_0xbdf7a:
	farwritetext UnknownText_0x1b509b
	keeptextopen
	end

UnknownScript_0xbdf80:
	farwritetext UnknownText_0x1b52a5
	keeptextopen
	end

UnknownScript_0xbdf86:
	farwritetext UnknownText_0x1b55da
	keeptextopen
	end

UnknownScript_0xbdf8c:
	farwritetext UnknownText_0x1b58c2
	keeptextopen
	end

UnknownScript_0xbdf92:
	farwritetext UnknownText_0x1b5a74
	keeptextopen
	end

UnknownScript_0xbdf98:
	farwritetext UnknownText_0x1b5c63
	keeptextopen
	end

UnknownScript_0xbdf9e:
	farwritetext UnknownText_0x1b5f9e
	keeptextopen
	end

UnknownScript_0xbdfa4:
	farwritetext UnknownText_0x1b611b
	keeptextopen
	end

UnknownScript_0xbdfaa:
	farwritetext UnknownText_0x1b63a8
	keeptextopen
	end

UnknownScript_0xbdfb0:
	farwritetext UnknownText_0x1b647e
	keeptextopen
	end

UnknownScript_0xbdfb6:
	farwritetext UnknownText_0x1b65c7
	keeptextopen
	end

UnknownScript_0xbdfbc:
	farwritetext UnknownText_0x1b680e
	keeptextopen
	end

UnknownScript_0xbdfc2:
	farwritetext UnknownText_0x1b69d2
	keeptextopen
	end

UnknownScript_0xbdfc8:
	farwritetext UnknownText_0x1b6b65
	keeptextopen
	end

UnknownScript_0xbdfce:
	farwritetext UnknownText_0x1b6cc6
	keeptextopen
	end

UnknownScript_0xbdfd4:
	farwritetext UnknownText_0x1b7057
	keeptextopen
	end

UnknownScript_0xbdfda:
	farwritetext UnknownText_0x1b71fc
	keeptextopen
	end

UnknownScript_0xbdfe0:
	farwritetext UnknownText_0x1b7331
	keeptextopen
	end

UnknownScript_0xbdfe6:
	farwritetext UnknownText_0x1b73ef
	keeptextopen
	end

UnknownScript_0xbdfec:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbe03e
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbe044
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbe04a
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbe050
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbe056
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbe05c
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbe062
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbe068
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbe06e
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbe074
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbe07a
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbe080
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbe086
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbe08c
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbe092
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbe098
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbe09e
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbe0a4
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbe0aa
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbe0b0

UnknownScript_0xbe03e:
	farwritetext UnknownText_0x1b4e16
	keeptextopen
	end

UnknownScript_0xbe044:
	farwritetext UnknownText_0x1b50c2
	keeptextopen
	end

UnknownScript_0xbe04a:
	farwritetext UnknownText_0x1b52cc
	keeptextopen
	end

UnknownScript_0xbe050:
	farwritetext UnknownText_0x1b55fc
	keeptextopen
	end

UnknownScript_0xbe056:
	farwritetext UnknownText_0x1b58ea
	keeptextopen
	end

UnknownScript_0xbe05c:
	farwritetext UnknownText_0x1b5a9f
	keeptextopen
	end

UnknownScript_0xbe062:
	farwritetext UnknownText_0x1b5cb6
	keeptextopen
	end

UnknownScript_0xbe068:
	farwritetext UnknownText_0x1b5fc9
	keeptextopen
	end

UnknownScript_0xbe06e:
	farwritetext UnknownText_0x1b6149
	keeptextopen
	end

UnknownScript_0xbe074:
	farwritetext UnknownText_0x1b63c4
	keeptextopen
	end

UnknownScript_0xbe07a:
	farwritetext UnknownText_0x1b64a8
	keeptextopen
	end

UnknownScript_0xbe080:
	farwritetext UnknownText_0x1b65e3
	keeptextopen
	end

UnknownScript_0xbe086:
	farwritetext UnknownText_0x1b6836
	keeptextopen
	end

UnknownScript_0xbe08c:
	farwritetext UnknownText_0x1b69f8
	keeptextopen
	end

UnknownScript_0xbe092:
	farwritetext UnknownText_0x1b6b92
	keeptextopen
	end

UnknownScript_0xbe098:
	farwritetext UnknownText_0x1b6cf6
	keeptextopen
	end

UnknownScript_0xbe09e:
	farwritetext UnknownText_0x1b7092
	keeptextopen
	end

UnknownScript_0xbe0a4:
	farwritetext UnknownText_0x1b722a
	keeptextopen
	end

UnknownScript_0xbe0aa:
	farwritetext UnknownText_0x1b7357
	keeptextopen
	end

UnknownScript_0xbe0b0:
	farwritetext UnknownText_0x1b7417
	keeptextopen
	end

UnknownScript_0xbe0b6:
	checkday
	iftrue UnknownScript_0xbe112
	checknite
	iftrue UnknownScript_0xbe164
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe0e2
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe0e8
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe0ee
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe0f4
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe0fa
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe100
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe106
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe10c

UnknownScript_0xbe0e2:
	farwritetext UnknownText_0x1b4f21
	keeptextopen
	end

UnknownScript_0xbe0e8:
	farwritetext UnknownText_0x1b53f7
	keeptextopen
	end

UnknownScript_0xbe0ee:
	farwritetext UnknownText_0x1b5702
	keeptextopen
	end

UnknownScript_0xbe0f4:
	farwritetext UnknownText_0x1b5d9f
	keeptextopen
	end

UnknownScript_0xbe0fa:
	farwritetext UnknownText_0x1b626a
	keeptextopen
	end

UnknownScript_0xbe100:
	farwritetext UnknownText_0x1b66c8
	keeptextopen
	end

UnknownScript_0xbe106:
	farwritetext UnknownText_0x1b6e7c
	keeptextopen
	end

UnknownScript_0xbe10c:
	farwritetext UnknownText_0x1b751a
	keeptextopen
	end

UnknownScript_0xbe112:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe134
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe13a
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe140
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe146
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe14c
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe152
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe158
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe15e

UnknownScript_0xbe134:
	farwritetext UnknownText_0x1b4f4d
	keeptextopen
	end

UnknownScript_0xbe13a:
	farwritetext UnknownText_0x1b5424
	keeptextopen
	end

UnknownScript_0xbe140:
	farwritetext UnknownText_0x1b572e
	keeptextopen
	end

UnknownScript_0xbe146:
	farwritetext UnknownText_0x1b5dcc
	keeptextopen
	end

UnknownScript_0xbe14c:
	farwritetext UnknownText_0x1b6296
	keeptextopen
	end

UnknownScript_0xbe152:
	farwritetext UnknownText_0x1b66ec
	keeptextopen
	end

UnknownScript_0xbe158:
	farwritetext UnknownText_0x1b6ea6
	keeptextopen
	end

UnknownScript_0xbe15e:
	farwritetext UnknownText_0x1b7548
	keeptextopen
	end

UnknownScript_0xbe164:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe186
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe18c
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe192
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe198
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe19e
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe1a4
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe1aa
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe1b0

UnknownScript_0xbe186:
	farwritetext UnknownText_0x1b4f75
	keeptextopen
	end

UnknownScript_0xbe18c:
	farwritetext UnknownText_0x1b5446
	keeptextopen
	end

UnknownScript_0xbe192:
	farwritetext UnknownText_0x1b575a
	keeptextopen
	end

UnknownScript_0xbe198:
	farwritetext UnknownText_0x1b5df8
	keeptextopen
	end

UnknownScript_0xbe19e:
	farwritetext UnknownText_0x1b62c5
	keeptextopen
	end

UnknownScript_0xbe1a4:
	farwritetext UnknownText_0x1b6713
	keeptextopen
	end

UnknownScript_0xbe1aa:
	farwritetext UnknownText_0x1b6ec9
	keeptextopen
	end

UnknownScript_0xbe1b0:
	farwritetext UnknownText_0x1b756f
	keeptextopen
	end

UnknownScript_0xbe1b6:
	checkday
	iftrue UnknownScript_0xbe28a
	checknite
	iftrue UnknownScript_0xbe354
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbe212
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbe218
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbe21e
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbe224
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbe22a
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbe230
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbe236
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbe23c
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbe242
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbe248
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbe24e
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbe254
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbe25a
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbe260
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbe266
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbe26c
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbe272
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbe278
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbe27e
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbe284

UnknownScript_0xbe212:
	farwritetext UnknownText_0x1b4e3e
	keeptextopen
	end

UnknownScript_0xbe218:
	farwritetext UnknownText_0x1b50e9
	keeptextopen
	end

UnknownScript_0xbe21e:
	farwritetext UnknownText_0x1b5301
	keeptextopen
	end

UnknownScript_0xbe224:
	farwritetext UnknownText_0x1b5628
	keeptextopen
	end

UnknownScript_0xbe22a:
	farwritetext UnknownText_0x1b5912
	keeptextopen
	end

UnknownScript_0xbe230:
	farwritetext UnknownText_0x1b5ad8
	keeptextopen
	end

UnknownScript_0xbe236:
	farwritetext UnknownText_0x1b5d09
	keeptextopen
	end

UnknownScript_0xbe23c:
	farwritetext UnknownText_0x1b5ff6
	keeptextopen
	end

UnknownScript_0xbe242:
	farwritetext UnknownText_0x1b616e
	keeptextopen
	end

UnknownScript_0xbe248:
	farwritetext UnknownText_0x1b63e3
	keeptextopen
	end

UnknownScript_0xbe24e:
	farwritetext UnknownText_0x1b64d2
	keeptextopen
	end

UnknownScript_0xbe254:
	farwritetext UnknownText_0x1b660d
	keeptextopen
	end

UnknownScript_0xbe25a:
	farwritetext UnknownText_0x1b6862
	keeptextopen
	end

UnknownScript_0xbe260:
	farwritetext UnknownText_0x1b6a22
	keeptextopen
	end

UnknownScript_0xbe266:
	farwritetext UnknownText_0x1b6bb9
	keeptextopen
	end

UnknownScript_0xbe26c:
	farwritetext UnknownText_0x1b6d26
	keeptextopen
	end

UnknownScript_0xbe272:
	farwritetext UnknownText_0x1b70e7
	keeptextopen
	end

UnknownScript_0xbe278:
	farwritetext UnknownText_0x1b725c
	keeptextopen
	end

UnknownScript_0xbe27e:
	farwritetext UnknownText_0x1b737f
	keeptextopen
	end

UnknownScript_0xbe284:
	farwritetext UnknownText_0x1b743f
	keeptextopen
	end

UnknownScript_0xbe28a:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbe2dc
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbe2e2
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbe2e8
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbe2ee
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbe2f4
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbe2fa
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbe300
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbe306
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbe30c
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbe312
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbe318
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbe31e
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbe324
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbe32a
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbe330
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbe336
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbe33c
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbe342
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbe348
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbe34e

UnknownScript_0xbe2dc:
	farwritetext UnknownText_0x1b4e72
	keeptextopen
	end

UnknownScript_0xbe2e2:
	farwritetext UnknownText_0x1b511a
	keeptextopen
	end

UnknownScript_0xbe2e8:
	farwritetext UnknownText_0x1b5335
	keeptextopen
	end

UnknownScript_0xbe2ee:
	farwritetext UnknownText_0x1b564c
	keeptextopen
	end

UnknownScript_0xbe2f4:
	farwritetext UnknownText_0x1b5948
	keeptextopen
	end

UnknownScript_0xbe2fa:
	farwritetext UnknownText_0x1b5b0b
	keeptextopen
	end

UnknownScript_0xbe300:
	farwritetext UnknownText_0x1b5d21
	keeptextopen
	end

UnknownScript_0xbe306:
	farwritetext UnknownText_0x1b6017
	keeptextopen
	end

UnknownScript_0xbe30c:
	farwritetext UnknownText_0x1b618f
	keeptextopen
	end

UnknownScript_0xbe312:
	farwritetext UnknownText_0x1b6407
	keeptextopen
	end

UnknownScript_0xbe318:
	farwritetext UnknownText_0x1b6506
	keeptextopen
	end

UnknownScript_0xbe31e:
	farwritetext UnknownText_0x1b6624
	keeptextopen
	end

UnknownScript_0xbe324:
	farwritetext UnknownText_0x1b6890
	keeptextopen
	end

UnknownScript_0xbe32a:
	farwritetext UnknownText_0x1b6a56
	keeptextopen
	end

UnknownScript_0xbe330:
	farwritetext UnknownText_0x1b6bef
	keeptextopen
	end

UnknownScript_0xbe336:
	farwritetext UnknownText_0x1b6d57
	keeptextopen
	end

UnknownScript_0xbe33c:
	farwritetext UnknownText_0x1b7112
	keeptextopen
	end

UnknownScript_0xbe342:
	farwritetext UnknownText_0x1b7283
	keeptextopen
	end

UnknownScript_0xbe348:
	farwritetext UnknownText_0x1b7397
	keeptextopen
	end

UnknownScript_0xbe34e:
	farwritetext UnknownText_0x1b746f
	keeptextopen
	end

UnknownScript_0xbe354:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbe3a6
	if_equal PHONE_SAILOR_HUEY,          UnknownScript_0xbe3ac
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbe3b2
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbe3b8
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbe3be
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbe3c4
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbe3ca
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbe3d0
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbe3d6
	if_equal PHONE_JUGGLER_IRWIN,        UnknownScript_0xbe3dc
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbe3e2
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbe3e8
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbe3ee
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbe3f4
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbe3fa
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbe400
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbe406
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbe40c
	if_equal PHONE_BLACKBELT_KENJI,      UnknownScript_0xbe412
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbe418

UnknownScript_0xbe3a6:
	farwritetext UnknownText_0x1b4e9e
	keeptextopen
	end

UnknownScript_0xbe3ac:
	farwritetext UnknownText_0x1b5154
	keeptextopen
	end

UnknownScript_0xbe3b2:
	farwritetext UnknownText_0x1b535f
	keeptextopen
	end

UnknownScript_0xbe3b8:
	farwritetext UnknownText_0x1b5670
	keeptextopen
	end

UnknownScript_0xbe3be:
	farwritetext UnknownText_0x1b597c
	keeptextopen
	end

UnknownScript_0xbe3c4:
	farwritetext UnknownText_0x1b5b37
	keeptextopen
	end

UnknownScript_0xbe3ca:
	farwritetext UnknownText_0x1b5d39
	keeptextopen
	end

UnknownScript_0xbe3d0:
	farwritetext UnknownText_0x1b6041
	keeptextopen
	end

UnknownScript_0xbe3d6:
	farwritetext UnknownText_0x1b61bd
	keeptextopen
	end

UnknownScript_0xbe3dc:
	farwritetext UnknownText_0x1b642c
	keeptextopen
	end

UnknownScript_0xbe3e2:
	farwritetext UnknownText_0x1b6539
	keeptextopen
	end

UnknownScript_0xbe3e8:
	farwritetext UnknownText_0x1b663b
	keeptextopen
	end

UnknownScript_0xbe3ee:
	farwritetext UnknownText_0x1b68ba
	keeptextopen
	end

UnknownScript_0xbe3f4:
	farwritetext UnknownText_0x1b6a8b
	keeptextopen
	end

UnknownScript_0xbe3fa:
	farwritetext UnknownText_0x1b6c23
	keeptextopen
	end

UnknownScript_0xbe400:
	farwritetext UnknownText_0x1b6d88
	keeptextopen
	end

UnknownScript_0xbe406:
	farwritetext UnknownText_0x1b7132
	keeptextopen
	end

UnknownScript_0xbe40c:
	farwritetext UnknownText_0x1b72a5
	keeptextopen
	end

UnknownScript_0xbe412:
	farwritetext UnknownText_0x1b73af
	keeptextopen
	end

UnknownScript_0xbe418:
	farwritetext UnknownText_0x1b749b
	keeptextopen
	end

UnknownScript_0xbe41e:
	checkday
	iftrue UnknownScript_0xbe47a
	checknite
	iftrue UnknownScript_0xbe4cc
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe44a
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe450
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe456
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe45c
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe462
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe468
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe46e
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe474

UnknownScript_0xbe44a:
	farwritetext UnknownText_0x1b4fa1
	keeptextopen
	end

UnknownScript_0xbe450:
	farwritetext UnknownText_0x1b5472
	keeptextopen
	end

UnknownScript_0xbe456:
	farwritetext UnknownText_0x1b5786
	keeptextopen
	end

UnknownScript_0xbe45c:
	farwritetext UnknownText_0x1b5e25
	keeptextopen
	end

UnknownScript_0xbe462:
	farwritetext UnknownText_0x1b62f1
	keeptextopen
	end

UnknownScript_0xbe468:
	farwritetext UnknownText_0x1b6738
	keeptextopen
	end

UnknownScript_0xbe46e:
	farwritetext UnknownText_0x1b6ef3
	keeptextopen
	end

UnknownScript_0xbe474:
	farwritetext UnknownText_0x1b758f
	keeptextopen
	end

UnknownScript_0xbe47a:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe49c
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe4a2
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe4a8
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe4ae
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe4b4
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe4ba
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe4c0
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe4c6

UnknownScript_0xbe49c:
	farwritetext UnknownText_0x1b4fda
	keeptextopen
	end

UnknownScript_0xbe4a2:
	farwritetext UnknownText_0x1b54a6
	keeptextopen
	end

UnknownScript_0xbe4a8:
	farwritetext UnknownText_0x1b57b7
	keeptextopen
	end

UnknownScript_0xbe4ae:
	farwritetext UnknownText_0x1b5e59
	keeptextopen
	end

UnknownScript_0xbe4b4:
	farwritetext UnknownText_0x1b630e
	keeptextopen
	end

UnknownScript_0xbe4ba:
	farwritetext UnknownText_0x1b6757
	keeptextopen
	end

UnknownScript_0xbe4c0:
	farwritetext UnknownText_0x1b6f1c
	keeptextopen
	end

UnknownScript_0xbe4c6:
	farwritetext UnknownText_0x1b75ac
	keeptextopen
	end

UnknownScript_0xbe4cc:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe4ee
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe4f4
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe4fa
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe500
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe506
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe50c
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe512
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe518

UnknownScript_0xbe4ee:
	farwritetext UnknownText_0x1b5004
	keeptextopen
	end

UnknownScript_0xbe4f4:
	farwritetext UnknownText_0x1b54d4
	keeptextopen
	end

UnknownScript_0xbe4fa:
	farwritetext UnknownText_0x1b57e8
	keeptextopen
	end

UnknownScript_0xbe500:
	farwritetext UnknownText_0x1b5e8e
	keeptextopen
	end

UnknownScript_0xbe506:
	farwritetext UnknownText_0x1b6331
	keeptextopen
	end

UnknownScript_0xbe50c:
	farwritetext UnknownText_0x1b6776
	keeptextopen
	end

UnknownScript_0xbe512:
	farwritetext UnknownText_0x1b6f37
	keeptextopen
	end

UnknownScript_0xbe518:
	farwritetext UnknownText_0x1b75c9
	keeptextopen
	end

UnknownScript_0xbe51e:
	checkcode VAR_CALLERID
	if_equal PHONE_SCHOOLBOY_JACK,       UnknownScript_0xbe564
	if_equal PHONE_COOLTRAINERM_GAVEN,   UnknownScript_0xbe570
	if_equal PHONE_BIRDKEEPER_JOSE,      UnknownScript_0xbe576
	if_equal PHONE_YOUNGSTER_JOEY,       UnknownScript_0xbe57c
	if_equal PHONE_BUG_CATCHER_WADE,     UnknownScript_0xbe582
	if_equal PHONE_FISHER_RALPH,         UnknownScript_0xbe588
	if_equal PHONE_HIKER_ANTHONY,        UnknownScript_0xbe58e
	if_equal PHONE_CAMPER_TODD,          UnknownScript_0xbe594
	if_equal PHONE_BUG_CATCHER_ARNIE,    UnknownScript_0xbe59a
	if_equal PHONE_SCHOOLBOY_ALAN,       UnknownScript_0xbe5a0
	if_equal PHONE_SCHOOLBOY_CHAD,       UnknownScript_0xbe5a6
	if_equal PHONE_POKEFANM_DEREK,       UnknownScript_0xbe5ac
	if_equal PHONE_FISHER_TULLY,         UnknownScript_0xbe5b2
	if_equal PHONE_POKEMANIAC_BRENT,     UnknownScript_0xbe5b8
	if_equal PHONE_BIRDKEEPER_VANCE,     UnknownScript_0xbe5be
	if_equal PHONE_FISHER_WILTON,        UnknownScript_0xbe5c4
	if_equal PHONE_HIKER_PARRY,          UnknownScript_0xbe5ca

UnknownScript_0xbe564:
	farwritetext UnknownText_0x1b4ecd
	keeptextopen
	end

UnknownScript_0xbe56a:
	farwritetext UnknownText_0x1b518b
	keeptextopen
	end

UnknownScript_0xbe570:
	farwritetext UnknownText_0x1b5393
	keeptextopen
	end

UnknownScript_0xbe576:
	farwritetext UnknownText_0x1b5694
	keeptextopen
	end

UnknownScript_0xbe57c:
	farwritetext UnknownText_0x1b59b2
	keeptextopen
	end

UnknownScript_0xbe582:
	farwritetext UnknownText_0x1b5b68
	keeptextopen
	end

UnknownScript_0xbe588:
	farwritetext UnknownText_0x1b5d51
	keeptextopen
	end

UnknownScript_0xbe58e:
	farwritetext UnknownText_0x1b606f
	keeptextopen
	end

UnknownScript_0xbe594:
	farwritetext UnknownText_0x1b61f2
	keeptextopen
	end

UnknownScript_0xbe59a:
	farwritetext UnknownText_0x1b656c
	keeptextopen
	end

UnknownScript_0xbe5a0:
	farwritetext UnknownText_0x1b6652
	keeptextopen
	end

UnknownScript_0xbe5a6:
	farwritetext UnknownText_0x1b68e8
	keeptextopen
	end

UnknownScript_0xbe5ac:
	farwritetext UnknownText_0x1b6ac2
	keeptextopen
	end

UnknownScript_0xbe5b2:
	farwritetext UnknownText_0x1b6c56
	keeptextopen
	end

UnknownScript_0xbe5b8:
	farwritetext UnknownText_0x1b6db9
	keeptextopen
	end

UnknownScript_0xbe5be:
	farwritetext UnknownText_0x1b7161
	keeptextopen
	end

UnknownScript_0xbe5c4:
	farwritetext UnknownText_0x1b72d0
	keeptextopen
	end

UnknownScript_0xbe5ca:
	farwritetext UnknownText_0x1b74c8
	keeptextopen
	end

UnknownScript_0xbe5d0:
	checkcode VAR_CALLERID
	if_equal PHONE_POKEFAN_BEVERLY,       UnknownScript_0xbe5f2
	if_equal PHONE_COOLTRAINERF_BETH,     UnknownScript_0xbe5f8
	if_equal PHONE_COOLTRAINERF_REENA,    UnknownScript_0xbe5fe
	if_equal PHONE_PICNICKER_LIZ,         UnknownScript_0xbe604
	if_equal PHONE_PICNICKER_GINA,        UnknownScript_0xbe60a
	if_equal PHONE_LASS_DANA,             UnknownScript_0xbe610
	if_equal PHONE_PICNICKER_TIFFANY,     UnknownScript_0xbe616
	if_equal PHONE_PICNICKER_ERIN,        UnknownScript_0xbe61c

UnknownScript_0xbe5f2:
	farwritetext UnknownText_0x1b502b
	keeptextopen
	end

UnknownScript_0xbe5f8:
	farwritetext UnknownText_0x1b5510
	keeptextopen
	end

UnknownScript_0xbe5fe:
	farwritetext UnknownText_0x1b5819
	keeptextopen
	end

UnknownScript_0xbe604:
	farwritetext UnknownText_0x1b5ebe
	keeptextopen
	end

UnknownScript_0xbe60a:
	farwritetext UnknownText_0x1b6352
	keeptextopen
	end

UnknownScript_0xbe610:
	farwritetext UnknownText_0x1b6795
	keeptextopen
	end

UnknownScript_0xbe616:
	farwritetext UnknownText_0x1b6f60
	keeptextopen
	end

UnknownScript_0xbe61c:
	farwritetext UnknownText_0x1b75e5
	keeptextopen
	end

UnknownScript_0xbe622:
	special RandomPhoneMon
	farscall UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbe636
	farwritetext UnknownText_0x1b518b
	keeptextopen
	farjump UnknownScript_0xa0484

UnknownScript_0xbe636:
	farjump UnknownScript_0xbe63a

UnknownScript_0xbe63a:
	farwritetext UnknownText_0x1b522b
	keeptextopen
	farjump UnknownScript_0xa0484
; be643


String_be643: db "Grandma@"
String_be64b: db "Grandpa@"
String_be653: db "Mom@"
String_be657: db "Dad@"
String_be65b: db "Sister@"
String_be662: db "Brother@"


TalkToTrainerScript:: ; 0xbe66a
	faceplayer
	trainerstatus $2
	iftrue AlreadyBeatenTrainerScript
	loadtrainerdata
	playrammusic
	jump StartBattleWithMapTrainerScript
; 0xbe675

SeenByTrainerScript:: ; 0xbe675
	loadtrainerdata
	playrammusic
	showemote EMOTE_SHOCK, -2, 30
	callasm Function831e
	applymovement2 MovementBuffer
	writepersonxy -2
	faceperson $0, -2
	jump StartBattleWithMapTrainerScript
; 0xbe68a

StartBattleWithMapTrainerScript: ; 0xbe68a
	loadfont
	trainertext $0
	closetext
	loadmovesprites
	loadtrainerdata
	startbattle
	returnafterbattle
	trainerstatus 1
	loadvar wd04d, -1

AlreadyBeatenTrainerScript:
	scripttalkafter
; 0xbe699
