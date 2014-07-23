UnusedPhoneScript: ; 0xbcea5
	3writetext UnusedPhoneText
	end

MomPhoneScript: ; 0xbceaa
	checkevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	iftrue .bcec5
	checkevent EVENT_DUDE_TALKED_TO_YOU
	iftrue MomPhoneLectureScript
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue MomPhoneNoGymQuestScript
	checkevent EVENT_GOT_A_POKEMON_FROM_ELM
	iftrue MomPhoneNoPokedexScript
	2jump MomPhoneNoPokemonScript

.bcec5 ; 0xbcec5
	checkevent $0007
	iftrue MomPhoneHangUpScript
	3writetext MomPhoneGreetingText
	keeptextopen
	mapnametotext $0
	checkcode $f
	if_equal $1, UnknownScript_0xbcee7
	if_equal $2, UnknownScript_0xbcf27
	2jump UnknownScript_0xbcf2f

UnknownScript_0xbcedf: ; 0xbcedf
	3writetext UnknownText_0x1b4021
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcee7: ; 0xbcee7
	checkcode $c
	if_equal GROUP_NEW_BARK_TOWN, .newbark
	if_equal GROUP_CHERRYGROVE_CITY, .cherrygrove
	if_equal GROUP_VIOLET_CITY, .violet
	if_equal GROUP_AZALEA_TOWN, .azalea
	if_equal GROUP_GOLDENROD_CITY, .goldenrod
	3writetext MomPhoneGenericAreaText
	keeptextopen
	2jump UnknownScript_0xbcf37

.newbark ; 0xbcf05
	3writetext MomPhoneNewBarkText
	keeptextopen
	2jump UnknownScript_0xbcf37

.cherrygrove ; 0xbcf0d
	3writetext MomPhoneCherrygroveText
	keeptextopen
	2jump UnknownScript_0xbcf37

.violet ; 0xbcf15
	displaylocation SPROUT_TOWER, 1
	2jump UnknownScript_0xbcedf
.azalea ; 0xbcf1b
	displaylocation SLOWPOKE_WELL, 1
	2jump UnknownScript_0xbcedf
.goldenrod ; 0xbcf21
	displaylocation RADIO_TOWER, 1
	2jump UnknownScript_0xbcedf

UnknownScript_0xbcf27: ; 0xbcf27
	3writetext UnknownText_0x1b411c
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	3writetext UnknownText_0x1b4150
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf37: ; 0xbcf37
	checkflag ENGINE_MOM_SAVING_MONEY
	iffalse UnknownScript_0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf55
	2jump UnknownScript_0xbcf63

UnknownScript_0xbcf49: ; 0xbcf49
	checkmoney $1, 0
	if_equal $0, UnknownScript_0xbcf79
	2jump UnknownScript_0xbcf6e

UnknownScript_0xbcf55: ; 0xbcf55
	readmoney $1, $0
	3writetext UnknownText_0x1b41a7
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf63: ; 0xbcf63
	3writetext UnknownText_0x1b41ea
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf6e: ; 0xbcf6e
	3writetext UnknownText_0x1b420d
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf79: ; 0xbcf79
	readmoney $1, $0
	3writetext UnknownText_0x1b4249
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript: ; 0xbcf87
	setflag ENGINE_MOM_SAVING_MONEY
	3writetext UnknownText_0x1b4289
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript: ; 0xbcf92
	clearflag ENGINE_MOM_SAVING_MONEY
	3writetext MomPhoneWontSaveMoneyText
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneHangUpScript: ; 0xbcf9d
	3writetext MomPhoneHangUpText
	end

MomPhoneNoPokemonScript: ; 0xbcfa2
	3writetext MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript: ; 0xbcfa7
	3writetext MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript: ; 0xbcfac
	3writetext MomPhoneNoGymQuestText
	end

MomPhoneLectureScript: ; 0xbcfb1
	setevent EVENT_TALKED_TO_MOM_AFTER_MYSTERY_EGG_QUEST
	setflag ENGINE_DST
	specialphonecall $0000
	3writetext MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

BillPhoneScript1: ; 0xbcfc5
	checktime $2
	iftrue .daygreet
	checktime $4
	iftrue .nitegreet
	3writetext BillPhoneMornGreetingText
	keeptextopen
	2jump .main

.daygreet ; 0xbcfd7
	3writetext BillPhoneDayGreetingText
	keeptextopen
	2jump .main

.nitegreet ; 0xbcfdf
	3writetext BillPhoneNiteGreetingText
	keeptextopen
	2jump .main

.main ; 0xbcfe7
	3writetext BillPhoneGeneriText
	keeptextopen
	checkcode $10
	RAM2MEM $0
	if_equal $0, .full
	if_less_than $6, .nearlyfull
	3writetext BillPhoneNotFullText
	end

.nearlyfull ; 0xbcffd
	3writetext BillPhoneNearlyFullText
	end

.full ; 0xbd002
	3writetext BillPhoneFullText
	end

BillPhoneScript2: ; 0xbd007
	3writetext BillPhoneNewlyFullText
	closetext
	end

ElmPhoneScript1: ; 0xbd00d
	checkcode $14
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
	3writetext ElmPhoneStartText
	end

.sawmrpokemon ; 0xbd048
	3writetext ElmPhoneSawMrPokemonText
	end

.stolen ; 0xbd04d
	3writetext ElmPhonePokemonStolenText
	end

.checkingegg ; 0xbd052
	3writetext ElmPhoneCheckingEggText
	end

.assistant ; 0xbd057
	3writetext ElmPhoneAssistantText
	end

.eggunhatched ; 0xbd05c
	3writetext ElmPhoneEggUnhatchedText
	end

.egghatched ; 0xbd061
	3writetext ElmPhoneEggHatchedText
	setevent EVENT_TOLD_ELM_ABOUT_TOGEPI_OVER_THE_PHONE
	end

.discovery ; 0xbd069
	random $2
	if_equal $0, .nextdiscovery
	3writetext ElmPhoneDiscovery1Text
	end

.nextdiscovery ; 0xbd074
	3writetext ElmPhoneDiscovery2Text
	end

.pokerus ; 0xbd079
	3writetext ElmPhonePokerusText
	specialphonecall $0000
	end

ElmPhoneScript2: ; 0xbd081
	checkcode $14
	if_equal $2, .disaster
	if_equal $3, .assistant
	if_equal $4, .rocket
	if_equal $5, .gift
	if_equal $8, .gift
	3writetext ElmPhonePokerusText
	specialphonecall $0000
	end

.disaster ; 0xbd09f
	3writetext ElmPhoneDisasterText
	specialphonecall $0000
	setevent EVENT_ELM_CALLED_ABOUT_STOLEN_POKEMON
	end

.assistant ; 0xbd0aa
	3writetext ElmPhoneEggAssistantText
	specialphonecall $0000
	clearevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_ELMS_AIDE_IN_LAB
	end

.rocket ; 0xbd0b8
	3writetext ElmPhoneRocketText
	specialphonecall $0000
	end

.gift ; 0xbd0c0
	3writetext ElmPhoneGiftText
	specialphonecall $0000
	end

.unused ; 0xbd0c8
	3writetext ElmPhoneUnusedText
	specialphonecall $0000
	end
; bd0d0


UnknownScript_0xbd0d0:
	trainertotext SCHOOLBOY, 1, $0
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd0f3
	3call UnknownScript_0xbde4e
	checkflag ENGINE_87
	iftrue UnknownScript_0xbd0ef
	checkcode $b
	if_not_equal $1, UnknownScript_0xbd0ef
	checktime $1
	iftrue UnknownScript_0xbd12a

UnknownScript_0xbd0ef:
	3jump UnknownScript_0xa08f8

UnknownScript_0xbd0f3:
	displaylocation $13, $2
	3jump UnknownScript_0xa0a2d

UnknownScript_0xbd0fa:
	trainertotext SCHOOLBOY, 1, $0
	3call UnknownScript_0xbe1b6
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd13b
	checkflag ENGINE_JACK
	iftrue UnknownScript_0xbd11e
	checkflag ENGINE_87
	iftrue UnknownScript_0xbd11e
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd12d

UnknownScript_0xbd11e:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd137
	3jump UnknownScript_0xa0000

UnknownScript_0xbd12a:
	setflag ENGINE_87

UnknownScript_0xbd12d:
	displaylocation $13, $2
	setflag ENGINE_JACK
	3jump UnknownScript_0xa0376

UnknownScript_0xbd137:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd13b:
	3jump UnknownScript_0xa0654

UnknownScript_0xbd13f:
	trainertotext POKEFANF, 1, $0
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd151
	3jump UnknownScript_0xa0900

UnknownScript_0xbd151:
	displaylocation $13, $2
	3jump UnknownScript_0xa0aa5

UnknownScript_0xbd158:
	trainertotext POKEFANF, 1, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_BEVERLY_HAS_NUGGET
	iftrue UnknownScript_0xbd16e
	3call UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbd172

UnknownScript_0xbd16e:
	3jump UnknownScript_0xa0017

UnknownScript_0xbd172:
	setflag ENGINE_BEVERLY_HAS_NUGGET
	displaylocation $13, $2
	3jump UnknownScript_0xa061e

UnknownScript_0xbd17c:
	trainertotext SAILOR, 2, $0
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1a2
	3call UnknownScript_0xbde4e
	checkflag ENGINE_88
	iftrue UnknownScript_0xbd19b
	checkcode $b
	if_not_equal $3, UnknownScript_0xbd19b
	checktime $4
	iftrue UnknownScript_0xbd1cd

UnknownScript_0xbd19b:
	special $005d
	3jump UnknownScript_0xa0908

UnknownScript_0xbd1a2:
	displaylocation $1c, $2
	3jump UnknownScript_0xa0a32

UnknownScript_0xbd1a9:
	trainertotext SAILOR, 2, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_HUEY
	iftrue UnknownScript_0xbd1c9
	checkflag ENGINE_88
	iftrue UnknownScript_0xbd1c9
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd1d0
	if_equal $1, UnknownScript_0xbd1d0

UnknownScript_0xbd1c9:
	3jump UnknownScript_0xbe622

UnknownScript_0xbd1cd:
	setflag ENGINE_88

UnknownScript_0xbd1d0:
	displaylocation $1c, $2
	setflag ENGINE_HUEY
	3jump UnknownScript_0xa0376

UnknownScript_0xbd1da:
	trainertotext COOLTRAINERM, 10, $0
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd1fd
	3call UnknownScript_0xbde4e
	checkflag ENGINE_89
	iftrue UnknownScript_0xbd1f9
	checkcode $b
	if_not_equal $4, UnknownScript_0xbd1f9
	checktime $1
	iftrue UnknownScript_0xbd22c

UnknownScript_0xbd1f9:
	3jump UnknownScript_0xa0910

UnknownScript_0xbd1fd:
	displaylocation $5b, $2
	3jump UnknownScript_0xa0a37

UnknownScript_0xbd204:
	trainertotext COOLTRAINERM, 10, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_GAVEN
	iftrue UnknownScript_0xbd220
	checkflag ENGINE_89
	iftrue UnknownScript_0xbd220
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd22f

UnknownScript_0xbd220:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd239
	3jump UnknownScript_0xa0000

UnknownScript_0xbd22c:
	setflag ENGINE_89

UnknownScript_0xbd22f:
	displaylocation $5b, $2
	setflag ENGINE_GAVEN
	3jump UnknownScript_0xa0376

UnknownScript_0xbd239:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd23d:
	trainertotext COOLTRAINERF, 9, $0
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd260
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_8A
	iftrue UnknownScript_0xbd25c
	checkcode $b
	if_not_equal $5, UnknownScript_0xbd25c
	checktime $2
	iftrue UnknownScript_0xbd287

UnknownScript_0xbd25c:
	3jump UnknownScript_0xa0918

UnknownScript_0xbd260:
	displaylocation $5b, $2
	3jump UnknownScript_0xa0a3c

UnknownScript_0xbd267:
	trainertotext COOLTRAINERF, 9, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_BETH
	iftrue UnknownScript_0xbd283
	checkflag ENGINE_8A
	iftrue UnknownScript_0xbd283
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd28a

UnknownScript_0xbd283:
	3jump UnknownScript_0xa0017

UnknownScript_0xbd287:
	setflag ENGINE_8A

UnknownScript_0xbd28a:
	displaylocation $5b, $2
	setflag ENGINE_BETH
	3jump UnknownScript_0xa037e

UnknownScript_0xbd294:
	trainertotext BIRD_KEEPER, 14, $0
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2bd
	3call UnknownScript_0xbde4e
	checkflag ENGINE_8B
	iftrue UnknownScript_0xbd2b9
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2c4
	checkcode $b
	if_not_equal $6, UnknownScript_0xbd2b9
	checktime $4
	iftrue UnknownScript_0xbd301

UnknownScript_0xbd2b9:
	3jump UnknownScript_0xa0920

UnknownScript_0xbd2bd:
	displaylocation $5c, $2
	3jump UnknownScript_0xa0a41

UnknownScript_0xbd2c4:
	displaylocation $5c, $2
	3jump UnknownScript_0xa0a41

UnknownScript_0xbd2cb:
	trainertotext BIRD_KEEPER, 14, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_8B
	iftrue UnknownScript_0xbd2f5
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0xbd2f5
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd304
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd312

UnknownScript_0xbd2f5:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd30e
	3jump UnknownScript_0xa0000

UnknownScript_0xbd301:
	setflag ENGINE_8B

UnknownScript_0xbd304:
	displaylocation $5c, $2
	setflag ENGINE_JOSE
	3jump UnknownScript_0xa0376

UnknownScript_0xbd30e:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd312:
	setflag ENGINE_JOSE_HAS_STAR_PIECE
	displaylocation $5c, $2
	3jump UnknownScript_0xa05e6

UnknownScript_0xbd31c:
	trainertotext COOLTRAINERF, 10, $0
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd33f
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_8C
	iftrue UnknownScript_0xbd33b
	checkcode $b
	if_not_equal $0, UnknownScript_0xbd33b
	checktime $1
	iftrue UnknownScript_0xbd366

UnknownScript_0xbd33b:
	3jump UnknownScript_0xa0928

UnknownScript_0xbd33f:
	displaylocation $5c, $2
	3jump UnknownScript_0xa0a46

UnknownScript_0xbd346:
	trainertotext COOLTRAINERF, 10, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_REENA
	iftrue UnknownScript_0xbd362
	checkflag ENGINE_8C
	iftrue UnknownScript_0xbd362
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd369

UnknownScript_0xbd362:
	3jump UnknownScript_0xa0017

UnknownScript_0xbd366:
	setflag ENGINE_8C

UnknownScript_0xbd369:
	displaylocation $5c, $2
	setflag ENGINE_REENA
	3jump UnknownScript_0xa037e

UnknownScript_0xbd373:
	trainertotext YOUNGSTER, 1, $0
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd399
	3call UnknownScript_0xbde4e
	checkflag ENGINE_8D
	iftrue UnknownScript_0xbd392
	checkcode $b
	if_not_equal $1, UnknownScript_0xbd392
	checktime $2
	iftrue UnknownScript_0xbd3c4

UnknownScript_0xbd392:
	special $005d
	3jump UnknownScript_0xa0930

UnknownScript_0xbd399:
	displaylocation $4, $2
	3jump UnknownScript_0xa0a4b

UnknownScript_0xbd3a0:
	trainertotext YOUNGSTER, 1, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_JOEY
	iftrue UnknownScript_0xbd3c0
	checkflag ENGINE_8D
	iftrue UnknownScript_0xbd3c0
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd3c7
	if_equal $1, UnknownScript_0xbd3c7

UnknownScript_0xbd3c0:
	3jump UnknownScript_0xa0000

UnknownScript_0xbd3c4:
	setflag ENGINE_8D

UnknownScript_0xbd3c7:
	displaylocation $4, $2
	setflag ENGINE_JOEY
	3jump UnknownScript_0xa0376

UnknownScript_0xbd3d1:
	trainertotext BUG_CATCHER, 4, $0
	checkflag ENGINE_WADE
	iftrue UnknownScript_0xbd41a
	3call UnknownScript_0xbde4e
	checkflag ENGINE_8E
	iftrue UnknownScript_0xbd3f6
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0xbd421
	checkcode $b
	if_not_equal $2, UnknownScript_0xbd3f6
	checktime $4
	iftrue UnknownScript_0xbd484

UnknownScript_0xbd3f6:
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd412
	checkflag ENGINE_51
	iftrue UnknownScript_0xbd412
	checkcode $b
	if_equal $2, UnknownScript_0xbd416
	if_equal $4, UnknownScript_0xbd416
	if_equal $6, UnknownScript_0xbd416

UnknownScript_0xbd412:
	3jump UnknownScript_0xa0938

UnknownScript_0xbd416:
	3jump UnknownScript_0xa05a4

UnknownScript_0xbd41a:
	displaylocation $5, $2
	3jump UnknownScript_0xa0a50

UnknownScript_0xbd421:
	displaylocation $5, $2
	3jump UnknownScript_0xa0ab5

UnknownScript_0xbd428:
	trainertotext BUG_CATCHER, 4, $0
	3call UnknownScript_0xbe1b6
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd44c
	checkflag ENGINE_51
	iftrue UnknownScript_0xbd44c
	checkcode $b
	if_equal $2, UnknownScript_0xbd480
	if_equal $4, UnknownScript_0xbd480
	if_equal $6, UnknownScript_0xbd480

UnknownScript_0xbd44c:
	checkflag ENGINE_WADE
	iftrue UnknownScript_0xbd474
	checkflag ENGINE_8E
	iftrue UnknownScript_0xbd474
	checkflag ENGINE_WADE_HAS_ITEM
	iftrue UnknownScript_0xbd474
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd495
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd474
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd487

UnknownScript_0xbd474:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd491
	3jump UnknownScript_0xa0000

UnknownScript_0xbd480:
	3jump UnknownScript_0xa05a4

UnknownScript_0xbd484:
	setflag ENGINE_8E

UnknownScript_0xbd487:
	displaylocation $5, $2
	setflag ENGINE_WADE
	3jump UnknownScript_0xa0376

UnknownScript_0xbd491:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd495:
	setflag ENGINE_WADE_HAS_ITEM
	displaylocation $5, $2
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
	2jump UnknownScript_0xbd4ce

UnknownScript_0xbd4bf:
	setevent EVENT_WADE_HAS_PSNCUREBERRY
	2jump UnknownScript_0xbd4ce

UnknownScript_0xbd4c5:
	setevent EVENT_WADE_HAS_PRZCUREBERRY
	2jump UnknownScript_0xbd4ce

UnknownScript_0xbd4cb:
	setevent EVENT_WADE_HAS_BITTER_BERRY

UnknownScript_0xbd4ce:
	3jump UnknownScript_0xa05e6

UnknownScript_0xbd4d2:
	trainertotext FISHER, 2, $0
	checkflag ENGINE_RALPH
	iftrue UnknownScript_0xbd4fb
	3call UnknownScript_0xbde4e
	checkflag ENGINE_8F
	iftrue UnknownScript_0xbd4f1
	checkcode $b
	if_not_equal $3, UnknownScript_0xbd4f1
	checktime $1
	iftrue UnknownScript_0xbd537

UnknownScript_0xbd4f1:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue UnknownScript_0xbd502
	3jump UnknownScript_0xa0940

UnknownScript_0xbd4fb:
	displaylocation $8, $2
	3jump UnknownScript_0xa0a55

UnknownScript_0xbd502:
	displaylocation $8, $2
	3jump UnknownScript_0xa0af5

UnknownScript_0xbd509:
	trainertotext FISHER, 2, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd52b
	checkflag ENGINE_RALPH
	iftrue UnknownScript_0xbd52b
	checkflag ENGINE_8F
	iftrue UnknownScript_0xbd52b
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd53a

UnknownScript_0xbd52b:
	3call UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd544
	3jump UnknownScript_0xa0000

UnknownScript_0xbd537:
	setflag ENGINE_8F

UnknownScript_0xbd53a:
	displaylocation $8, $2
	setflag ENGINE_RALPH
	3jump UnknownScript_0xa0376

UnknownScript_0xbd544:
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue UnknownScript_0xbd55c
	setflag ENGINE_SPECIAL_WILDDATA
	pokenamemem QWILFISH, $1
	displaylocation $8, $2
	writebyte $1
	special $0048
	3jump UnknownScript_0xa05d6

UnknownScript_0xbd55c:
	3jump UnknownScript_0xa0000

UnknownScript_0xbd560:
	trainertotext PICNICKER, 1, $0
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd586
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_90
	iftrue UnknownScript_0xbd57f
	checkcode $b
	if_not_equal $4, UnknownScript_0xbd57f
	checktime $2
	iftrue UnknownScript_0xbd5c3

UnknownScript_0xbd57f:
	special $005d
	3jump UnknownScript_0xa0948

UnknownScript_0xbd586:
	displaylocation $8, $2
	3jump UnknownScript_0xa0a5a

UnknownScript_0xbd58d:
	trainertotext PICNICKER, 1, $0
	3call UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbd5d0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_LIZ
	iftrue UnknownScript_0xbd5a9
	checkflag ENGINE_90
	iftrue UnknownScript_0xbd5a9

UnknownScript_0xbd5a9:
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd5d4
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd5bf
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd5c6

UnknownScript_0xbd5bf:
	3jump UnknownScript_0xa0017

UnknownScript_0xbd5c3:
	setflag ENGINE_90

UnknownScript_0xbd5c6:
	displaylocation $8, $2
	setflag ENGINE_LIZ
	3jump UnknownScript_0xa037e

UnknownScript_0xbd5d0:
	3jump UnknownScript_0xa047a

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
	trainerclassname $1b, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd600:
	trainerclassname $1d, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd606:
	trainerclassname $1f, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd60c:
	trainerclassname $22, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd612:
	trainerclassname $27, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd618:
	trainerclassname $3c, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd61e:
	trainerclassname $21, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd624:
	trainerclassname $39, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd62a:
	trainerclassname $3b, $1
	2jump UnknownScript_0xbd630

UnknownScript_0xbd630:
	3jump UnknownScript_0xa06da

UnknownScript_0xbd634:
	trainertotext HIKER, 5, $0
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd65d
	3call UnknownScript_0xbde4e
	checkflag ENGINE_91
	iftrue UnknownScript_0xbd653
	checkcode $b
	if_not_equal $5, UnknownScript_0xbd653
	checktime $4
	iftrue UnknownScript_0xbd699

UnknownScript_0xbd653:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0xbd664
	3jump UnknownScript_0xa0950

UnknownScript_0xbd65d:
	displaylocation $b, $2
	3jump UnknownScript_0xa0a5f

UnknownScript_0xbd664:
	displaylocation $b, $2
	3jump UnknownScript_0xa0afa

UnknownScript_0xbd66b:
	trainertotext HIKER, 5, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd68d
	checkflag ENGINE_ANTHONY
	iftrue UnknownScript_0xbd68d
	checkflag ENGINE_91
	iftrue UnknownScript_0xbd68d
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd69c

UnknownScript_0xbd68d:
	3call UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd6a6
	3jump UnknownScript_0xa0000

UnknownScript_0xbd699:
	setflag ENGINE_91

UnknownScript_0xbd69c:
	displaylocation $b, $2
	setflag ENGINE_ANTHONY
	3jump UnknownScript_0xa0376

UnknownScript_0xbd6a6:
	checkflag ENGINE_DUNSPARCE_SWARM
	iftrue UnknownScript_0xbd6bd
	setflag ENGINE_DUNSPARCE_SWARM
	pokenamemem DUNSPARCE, $1
	loadwilddata $0, GROUP_DARK_CAVE_VIOLET_ENTRANCE, MAP_DARK_CAVE_VIOLET_ENTRANCE
	displaylocation $2c, $2
	3jump UnknownScript_0xa05de

UnknownScript_0xbd6bd:
	3jump UnknownScript_0xa0000

UnknownScript_0xbd6c1:
	trainertotext CAMPER, 2, $0
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd6ea
	3call UnknownScript_0xbde4e
	checkflag ENGINE_92
	iftrue UnknownScript_0xbd6e0
	checkcode $b
	if_not_equal $6, UnknownScript_0xbd6e0
	checktime $1
	iftrue UnknownScript_0xbd72b

UnknownScript_0xbd6e0:
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue UnknownScript_0xbd6f1
	3jump UnknownScript_0xa0958

UnknownScript_0xbd6ea:
	displaylocation $f, $2
	3jump UnknownScript_0xa0a64

UnknownScript_0xbd6f1:
	3jump UnknownScript_0xa0b04

UnknownScript_0xbd6f5:
	trainertotext CAMPER, 2, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_TODD
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_92
	iftrue UnknownScript_0xbd717
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd71f
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd72e

UnknownScript_0xbd717:
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd73c

UnknownScript_0xbd71f:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd738
	3jump UnknownScript_0xa0000

UnknownScript_0xbd72b:
	setflag ENGINE_92

UnknownScript_0xbd72e:
	displaylocation $f, $2
	setflag ENGINE_TODD
	3jump UnknownScript_0xa0376

UnknownScript_0xbd738:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd73c:
	setflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	3jump UnknownScript_0xa0644

UnknownScript_0xbd743:
	trainertotext PICNICKER, 2, $0
	checkflag ENGINE_GINA
	iftrue UnknownScript_0xbd776
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_93
	iftrue UnknownScript_0xbd768
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0xbd77d
	checkcode $b
	if_not_equal $0, UnknownScript_0xbd768
	checktime $2
	iftrue UnknownScript_0xbd7cc

UnknownScript_0xbd768:
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xbd772
	3jump UnknownScript_0xa0960

UnknownScript_0xbd772:
	3jump UnknownScript_0xa05c6

UnknownScript_0xbd776:
	displaylocation $f, $2
	3jump UnknownScript_0xa0a69

UnknownScript_0xbd77d:
	displaylocation $f, $2
	3jump UnknownScript_0xa0abd

UnknownScript_0xbd784:
	trainertotext PICNICKER, 2, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xbd7d9
	checkflag ENGINE_GINA
	iftrue UnknownScript_0xbd7c8
	checkflag ENGINE_93
	iftrue UnknownScript_0xbd7c8
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0xbd7c8
	checkevent $0100
	iftrue UnknownScript_0xbd7b2
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd7dd

UnknownScript_0xbd7b2:
	3call UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd7dd
	checkflag ENGINE_FLYPOINT_GOLDENROD
	iffalse UnknownScript_0xbd7c8
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd7cf

UnknownScript_0xbd7c8:
	3jump UnknownScript_0xa0017

UnknownScript_0xbd7cc:
	setflag ENGINE_93

UnknownScript_0xbd7cf:
	displaylocation $f, $2
	setflag ENGINE_GINA
	3jump UnknownScript_0xa037e

UnknownScript_0xbd7d9:
	3jump UnknownScript_0xa05c6

UnknownScript_0xbd7dd:
	setflag ENGINE_GINA_HAS_LEAF_STONE
	displaylocation $f, $2
	3jump UnknownScript_0xa061e

UnknownScript_0xbd7e7:
	trainertotext JUGGLER, 1, $0
	3call UnknownScript_0xbde4e
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xbd7f9
	3jump UnknownScript_0xa09c8

UnknownScript_0xbd7f9:
	3jump UnknownScript_0xa05be

UnknownScript_0xbd7fd:
	trainertotext JUGGLER, 1, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_BIKE_SHOP_CALL_ENABLED
	iftrue UnknownScript_0xbd80f
	3jump UnknownScript_0xa0848

UnknownScript_0xbd80f:
	3jump UnknownScript_0xa05be

UnknownScript_0xbd813:
	trainertotext BUG_CATCHER, 8, $0
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd83c
	3call UnknownScript_0xbde4e
	checkflag ENGINE_94
	iftrue UnknownScript_0xbd832
	checkcode $b
	if_not_equal $2, UnknownScript_0xbd832
	checktime $1
	iftrue UnknownScript_0xbd87a

UnknownScript_0xbd832:
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0xbd843
	3jump UnknownScript_0xa0968

UnknownScript_0xbd83c:
	displaylocation $12, $2
	3jump UnknownScript_0xa0a6e

UnknownScript_0xbd843:
	displaylocation $12, $2
	3jump UnknownScript_0xa0aff

UnknownScript_0xbd84a:
	trainertotext BUG_CATCHER, 8, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_ARNIE
	iftrue UnknownScript_0xbd866
	checkflag ENGINE_94
	iftrue UnknownScript_0xbd866
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd87d

UnknownScript_0xbd866:
	3call UnknownScript_0xbde48
	if_equal $0, UnknownScript_0xbd887
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd89e
	3jump UnknownScript_0xa0000

UnknownScript_0xbd87a:
	setflag ENGINE_94

UnknownScript_0xbd87d:
	displaylocation $12, $2
	setflag ENGINE_ARNIE
	3jump UnknownScript_0xa0376

UnknownScript_0xbd887:
	checkflag ENGINE_YANMA_SWARM
	iftrue UnknownScript_0xbd8a2
	setflag ENGINE_YANMA_SWARM
	pokenamemem YANMA, $1
	loadwilddata $1, GROUP_ROUTE_35, MAP_ROUTE_35
	displaylocation $12, $2
	3jump UnknownScript_0xa05ce

UnknownScript_0xbd89e:
	3jump UnknownScript_0xa0584

UnknownScript_0xbd8a2:
	3jump UnknownScript_0xa0000

UnknownScript_0xbd8a6:
	trainertotext SCHOOLBOY, 3, $0
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0xbd8cf
	3call UnknownScript_0xbde4e
	checkflag ENGINE_95
	iftrue UnknownScript_0xbd8cb
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0xbd8d6
	checkcode $b
	if_not_equal $3, UnknownScript_0xbd8cb
	checktime $2
	iftrue UnknownScript_0xbd919

UnknownScript_0xbd8cb:
	3jump UnknownScript_0xa0970

UnknownScript_0xbd8cf:
	displaylocation $14, $2
	3jump UnknownScript_0xa0a73

UnknownScript_0xbd8d6:
	displaylocation $14, $2
	3jump UnknownScript_0xa0ac5

UnknownScript_0xbd8dd:
	trainertotext SCHOOLBOY, 3, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_ALAN
	iftrue $5915
	checkflag ENGINE_95
	iftrue $5915
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue $5915
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd91c
	checkevent $0101
	iftrue UnknownScript_0xbd90d
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd90d:
	3call UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd926

UnknownScript_0xbd915:
	3jump UnknownScript_0xa0000

UnknownScript_0xbd919:
	setflag ENGINE_95

UnknownScript_0xbd91c:
	displaylocation $14, $2
	setflag ENGINE_ALAN
	3jump UnknownScript_0xa0376

UnknownScript_0xbd926:
	setflag ENGINE_ALAN_HAS_FIRE_STONE
	displaylocation $14, $2
	3jump UnknownScript_0xa05e6

UnknownScript_0xbd930:
	trainertotext LASS, 10, $0
	checkflag ENGINE_DANA
	iftrue UnknownScript_0xbd959
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_96
	iftrue UnknownScript_0xbd955
	checkflag ENGINE_LIZ_HAS_THUNDERSTONE
	iftrue UnknownScript_0xbd960
	checkcode $b
	if_not_equal $4, UnknownScript_0xbd955
	checktime $4
	iftrue UnknownScript_0xbd9ab

UnknownScript_0xbd955:
	3jump UnknownScript_0xa0978

UnknownScript_0xbd959:
	displaylocation $19, $2
	3jump UnknownScript_0xa0a78

UnknownScript_0xbd960:
	displaylocation $19, $2
	3jump UnknownScript_0xa0acd

UnknownScript_0xbd967:
	trainertotext LASS, 10, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_DANA
	iftrue $599f
	checkflag ENGINE_96
	iftrue $599f
	checkflag ENGINE_LIZ_HAS_THUNDERSTONE
	iftrue $599f
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd9ae
	checkevent $0102
	iftrue UnknownScript_0xbd997
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd997:
	3call UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbd9bc

UnknownScript_0xbd99f:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbd9b8
	3jump UnknownScript_0xa0017

UnknownScript_0xbd9ab:
	setflag ENGINE_96

UnknownScript_0xbd9ae:
	displaylocation $19, $2
	setflag ENGINE_DANA
	3jump UnknownScript_0xa037e

UnknownScript_0xbd9b8:
	3jump UnknownScript_0xa0592

UnknownScript_0xbd9bc:
	setflag ENGINE_LIZ_HAS_THUNDERSTONE
	displaylocation $19, $2
	3jump UnknownScript_0xa061e

UnknownScript_0xbd9c6:
	trainertotext SCHOOLBOY, 10, $0
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbd9e9
	3call UnknownScript_0xbde4e
	checkflag ENGINE_97
	iftrue UnknownScript_0xbd9e5
	checkcode $b
	if_not_equal $5, UnknownScript_0xbd9e5
	checktime $1
	iftrue UnknownScript_0xbda20

UnknownScript_0xbd9e5:
	3jump UnknownScript_0xa0980

UnknownScript_0xbd9e9:
	displaylocation $19, $2
	3jump UnknownScript_0xa0a7d

UnknownScript_0xbd9f0:
	trainertotext SCHOOLBOY, 10, $0
	3call UnknownScript_0xbe1b6
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda31
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0xbda14
	checkflag ENGINE_97
	iftrue UnknownScript_0xbda14
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda23

UnknownScript_0xbda14:
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbda2d
	3jump UnknownScript_0xa0000

UnknownScript_0xbda20:
	setflag ENGINE_97

UnknownScript_0xbda23:
	displaylocation $19, $2
	setflag ENGINE_CHAD
	3jump UnknownScript_0xa0376

UnknownScript_0xbda2d:
	3jump UnknownScript_0xa0584

UnknownScript_0xbda31:
	3jump UnknownScript_0xa0754

UnknownScript_0xbda35:
	trainertotext POKEFANM, 2, $0
	3call UnknownScript_0xbde4e
	checkflag ENGINE_DEREK_HAS_NUGGET
	iftrue UnknownScript_0xbda67
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda5f
	checkflag ENGINE_51
	iftrue UnknownScript_0xbda5f
	checkcode $b
	if_equal $2, UnknownScript_0xbda63
	if_equal $4, UnknownScript_0xbda63
	if_equal $6, UnknownScript_0xbda63

UnknownScript_0xbda5f:
	3jump UnknownScript_0xa0988

UnknownScript_0xbda63:
	3jump UnknownScript_0xa05a4

UnknownScript_0xbda67:
	displaylocation $1a, $2
	3jump UnknownScript_0xa0ad5

UnknownScript_0xbda6e:
	trainertotext POKEFANM, 2, $0
	3call UnknownScript_0xbe1b6
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbda92
	checkflag ENGINE_51
	iftrue UnknownScript_0xbda92
	checkcode $b
	if_equal $2, UnknownScript_0xbda9e
	if_equal $4, UnknownScript_0xbda9e
	if_equal $6, UnknownScript_0xbda9e

UnknownScript_0xbda92:
	3call UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbdaa2
	3jump UnknownScript_0xa0000

UnknownScript_0xbda9e:
	3jump UnknownScript_0xa05a4

UnknownScript_0xbdaa2:
	setflag ENGINE_DEREK_HAS_NUGGET
	displaylocation $1a, $2
	3jump UnknownScript_0xa05e6

UnknownScript_0xbdaac:
	trainertotext FISHER, 7, $0
	checkflag ENGINE_TULLY
	iftrue UnknownScript_0xbdad5
	3call UnknownScript_0xbde4e
	checkflag ENGINE_98
	iftrue UnknownScript_0xbdad1
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue UnknownScript_0xbdadc
	checkcode $b
	if_not_equal $0, UnknownScript_0xbdad1
	checktime $4
	iftrue UnknownScript_0xbdb1f

UnknownScript_0xbdad1:
	3jump UnknownScript_0xa0990

UnknownScript_0xbdad5:
	displaylocation $22, $2
	3jump UnknownScript_0xa0a82

UnknownScript_0xbdadc:
	displaylocation $22, $2
	3jump UnknownScript_0xa0add

UnknownScript_0xbdae3:
	trainertotext FISHER, 7, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_TULLY
	iftrue $5b1b
	checkflag ENGINE_98
	iftrue $5b1b
	checkflag ENGINE_TULLY_HAS_WATER_STONE
	iftrue $5b1b
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdb22
	checkevent $0103
	iftrue UnknownScript_0xbdb13
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb13:
	3call UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbdb2c

UnknownScript_0xbdb1b:
	3jump UnknownScript_0xa0000

UnknownScript_0xbdb1f:
	setflag ENGINE_98

UnknownScript_0xbdb22:
	displaylocation $22, $2
	setflag ENGINE_TULLY
	3jump UnknownScript_0xa0376

UnknownScript_0xbdb2c:
	setflag ENGINE_TULLY_HAS_WATER_STONE
	displaylocation $22, $2
	3jump UnknownScript_0xa05e6

UnknownScript_0xbdb36:
	trainertotext POKEMANIAC, 6, $0
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb59
	3call UnknownScript_0xbde4e
	checkflag ENGINE_99
	iftrue UnknownScript_0xbdb55
	checkcode $b
	if_not_equal $1, UnknownScript_0xbdb55
	checktime $1
	iftrue UnknownScript_0xbdb88

UnknownScript_0xbdb55:
	3jump UnknownScript_0xa0998

UnknownScript_0xbdb59:
	displaylocation $25, $2
	3jump UnknownScript_0xa0a87

UnknownScript_0xbdb60:
	trainertotext POKEMANIAC, 6, $0
	3call UnknownScript_0xbe1b6
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb95
	checkflag ENGINE_BRENT
	iftrue UnknownScript_0xbdb84
	checkflag ENGINE_99
	iftrue UnknownScript_0xbdb84
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdb8b

UnknownScript_0xbdb84:
	3jump UnknownScript_0xa0000

UnknownScript_0xbdb88:
	setflag ENGINE_99

UnknownScript_0xbdb8b:
	displaylocation $25, $2
	setflag ENGINE_BRENT
	3jump UnknownScript_0xa0376

UnknownScript_0xbdb95:
	3jump UnknownScript_0xa07ce

UnknownScript_0xbdb99:
	trainertotext PICNICKER, 20, $0
	checkflag ENGINE_TIFFANY
	iftrue UnknownScript_0xbdbc2
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_9A
	iftrue UnknownScript_0xbdbbe
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue UnknownScript_0xbdbc9
	checkcode $b
	if_not_equal $2, UnknownScript_0xbdbbe
	checktime $2
	iftrue UnknownScript_0xbdc14

UnknownScript_0xbdbbe:
	3jump UnknownScript_0xa09a0

UnknownScript_0xbdbc2:
	displaylocation $25, $2
	3jump UnknownScript_0xa0a8c

UnknownScript_0xbdbc9:
	displaylocation $25, $2
	3jump UnknownScript_0xa0ae5

UnknownScript_0xbdbd0:
	trainertotext PICNICKER, 20, $0
	3call UnknownScript_0xbde45
	if_equal $0, UnknownScript_0xbdc21
	3call UnknownScript_0xbe41e
	checkflag ENGINE_TIFFANY
	iftrue $5c10
	checkflag ENGINE_9A
	iftrue $5c10
	checkflag ENGINE_TIFFANY_HAS_PINK_BOW
	iftrue $5c10
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdc17
	checkevent $0104
	iftrue UnknownScript_0xbdc08
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc08:
	3call UnknownScript_0xbde4b
	if_equal $0, UnknownScript_0xbdc69

UnknownScript_0xbdc10:
	3jump UnknownScript_0xa0017

UnknownScript_0xbdc14:
	setflag ENGINE_9A

UnknownScript_0xbdc17:
	displaylocation $25, $2
	setflag ENGINE_TIFFANY
	3jump UnknownScript_0xa037e

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
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc42:
	stringtotext String_be64b, $1
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc49:
	stringtotext String_be653, $1
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc50:
	stringtotext String_be657, $1
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc57:
	stringtotext String_be65b, $1
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc5e:
	stringtotext String_be662, $1
	2jump UnknownScript_0xbdc65

UnknownScript_0xbdc65:
	3jump UnknownScript_0xa047f

UnknownScript_0xbdc69:
	setflag ENGINE_TIFFANY_HAS_PINK_BOW
	displaylocation $25, $2
	3jump UnknownScript_0xa061e

UnknownScript_0xbdc73:
	trainertotext BIRD_KEEPER, 7, $0
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdc96
	3call UnknownScript_0xbde4e
	checkflag ENGINE_9B
	iftrue UnknownScript_0xbdc92
	checkcode $b
	if_not_equal $3, UnknownScript_0xbdc92
	checktime $4
	iftrue UnknownScript_0xbdcc1

UnknownScript_0xbdc92:
	3jump UnknownScript_0xa09a8

UnknownScript_0xbdc96:
	displaylocation $27, $2
	3jump UnknownScript_0xa0a91

UnknownScript_0xbdc9d:
	trainertotext BIRD_KEEPER, 7, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_VANCE
	iftrue UnknownScript_0xbdcbd
	checkflag ENGINE_9B
	iftrue UnknownScript_0xbdcbd
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbdcc4
	if_equal $1, UnknownScript_0xbdcc4

UnknownScript_0xbdcbd:
	3jump UnknownScript_0xa0000

UnknownScript_0xbdcc1:
	setflag ENGINE_9B

UnknownScript_0xbdcc4:
	displaylocation $27, $2
	setflag ENGINE_VANCE
	3jump UnknownScript_0xa0376

UnknownScript_0xbdcce:
	trainertotext FISHER, 10, $0
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdcf7
	3call UnknownScript_0xbde4e
	checkflag ENGINE_9C
	iftrue UnknownScript_0xbdcf3
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0xbdcfe
	checkcode $b
	if_not_equal $4, UnknownScript_0xbdcf3
	checktime $1
	iftrue UnknownScript_0xbdd33

UnknownScript_0xbdcf3:
	3jump UnknownScript_0xa09b0

UnknownScript_0xbdcf7:
	displaylocation $27, $2
	3jump UnknownScript_0xa0a96

UnknownScript_0xbdcfe:
	displaylocation $27, $2
	3jump UnknownScript_0xa0aed

UnknownScript_0xbdd05:
	trainertotext FISHER, 10, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_WILTON
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_9C
	iftrue UnknownScript_0xbdd2f
	checkflag ENGINE_WILTON_HAS_ITEM
	iftrue UnknownScript_0xbdd2f
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdd36
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbdd40

UnknownScript_0xbdd2f:
	3jump UnknownScript_0xa0000

UnknownScript_0xbdd33:
	setflag ENGINE_9C

UnknownScript_0xbdd36:
	displaylocation $27, $2
	setflag ENGINE_WILTON
	3jump UnknownScript_0xa0376

UnknownScript_0xbdd40:
	setflag ENGINE_WILTON_HAS_ITEM
	displaylocation $27, $2
	clearevent EVENT_WILTON_HAS_ULTRA_BALL
	clearevent EVENT_WILTON_HAS_GREAT_BALL
	clearevent EVENT_WILTON_HAS_POKE_BALL
	random $5
	if_equal $0, UnknownScript_0xbdd5e
	random $3
	if_equal $0, UnknownScript_0xbdd64
	2jump UnknownScript_0xbdd6a

UnknownScript_0xbdd5e:
	setevent EVENT_WILTON_HAS_ULTRA_BALL
	2jump UnknownScript_0xbdd6d

UnknownScript_0xbdd64:
	setevent EVENT_WILTON_HAS_GREAT_BALL
	2jump UnknownScript_0xbdd6d

UnknownScript_0xbdd6a:
	setevent EVENT_WILTON_HAS_POKE_BALL

UnknownScript_0xbdd6d:
	3jump UnknownScript_0xa05e6

UnknownScript_0xbdd71:
	trainertotext BLACKBELT_T, 8, $0
	3call UnknownScript_0xbde4e
	3jump UnknownScript_0xa09ee

UnknownScript_0xbdd7d:
	trainertotext BLACKBELT_T, 8, $0
	3call UnknownScript_0xbe1b6
	3jump UnknownScript_0xa064c

UnknownScript_0xbdd89:
	trainertotext HIKER, 9, $0
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddac
	3call UnknownScript_0xbde4e
	checkflag ENGINE_9D
	iftrue UnknownScript_0xbdda8
	checkcode $b
	if_not_equal $5, UnknownScript_0xbdda8
	checktime $2
	iftrue UnknownScript_0xbddd7

UnknownScript_0xbdda8:
	3jump UnknownScript_0xa09b8

UnknownScript_0xbddac:
	displaylocation $2b, $2
	3jump UnknownScript_0xa0a9b

UnknownScript_0xbddb3:
	trainertotext HIKER, 9, $0
	3call UnknownScript_0xbe1b6
	checkflag ENGINE_PARRY
	iftrue UnknownScript_0xbddd3
	checkflag ENGINE_9D
	iftrue UnknownScript_0xbddd3
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbddda
	if_equal $1, UnknownScript_0xbddda

UnknownScript_0xbddd3:
	3jump UnknownScript_0xa0000

UnknownScript_0xbddd7:
	setflag ENGINE_9D

UnknownScript_0xbddda:
	displaylocation $2b, $2
	setflag ENGINE_PARRY
	3jump UnknownScript_0xa0376

UnknownScript_0xbdde4:
	trainertotext PICNICKER, 10, $0
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde07
	3call UnknownScript_0xbe0b6
	checkflag ENGINE_9E
	iftrue UnknownScript_0xbde03
	checkcode $b
	if_not_equal $6, UnknownScript_0xbde03
	checktime $4
	iftrue UnknownScript_0xbde32

UnknownScript_0xbde03:
	3jump UnknownScript_0xa09c0

UnknownScript_0xbde07:
	displaylocation $2d, $2
	3jump UnknownScript_0xa0aa0

UnknownScript_0xbde0e:
	trainertotext PICNICKER, 10, $0
	3call UnknownScript_0xbe41e
	checkflag ENGINE_ERIN
	iftrue UnknownScript_0xbde2e
	checkflag ENGINE_9E
	iftrue UnknownScript_0xbde2e
	3call UnknownScript_0xbde42
	if_equal $0, UnknownScript_0xbde35
	if_equal $1, UnknownScript_0xbde35

UnknownScript_0xbde2e:
	3jump UnknownScript_0xa0017

UnknownScript_0xbde32:
	setflag ENGINE_9E

UnknownScript_0xbde35:
	displaylocation $2d, $2
	setflag ENGINE_ERIN
	3jump UnknownScript_0xa037e

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
	checktime $2
	iftrue UnknownScript_0xbdf22
	checktime $4
	iftrue UnknownScript_0xbdfec
	checkcode $17
	if_equal $5, UnknownScript_0xbdeaa
	if_equal $7, UnknownScript_0xbdeb0
	if_equal $b, UnknownScript_0xbdeb6
	if_equal $d, UnknownScript_0xbdebc
	if_equal $f, UnknownScript_0xbdec2
	if_equal $10, UnknownScript_0xbdec8
	if_equal $11, UnknownScript_0xbdece
	if_equal $13, UnknownScript_0xbded4
	if_equal $14, UnknownScript_0xbdeda
	if_equal $16, UnknownScript_0xbdee0
	if_equal $17, UnknownScript_0xbdee6
	if_equal $18, UnknownScript_0xbdeec
	if_equal $1b, UnknownScript_0xbdef2
	if_equal $1c, UnknownScript_0xbdef8
	if_equal $1d, UnknownScript_0xbdefe
	if_equal $1e, UnknownScript_0xbdf04
	if_equal $20, UnknownScript_0xbdf0a
	if_equal $21, UnknownScript_0xbdf10
	if_equal $22, UnknownScript_0xbdf16
	if_equal $23, UnknownScript_0xbdf1c

UnknownScript_0xbdeaa:
	3writetext UnknownText_0x1b4dc5
	keeptextopen
	end

UnknownScript_0xbdeb0:
	3writetext UnknownText_0x1b5073
	keeptextopen
	end

UnknownScript_0xbdeb6:
	3writetext UnknownText_0x1b5270
	keeptextopen
	end

UnknownScript_0xbdebc:
	3writetext UnknownText_0x1b55ae
	keeptextopen
	end

UnknownScript_0xbdec2:
	3writetext UnknownText_0x1b589a
	keeptextopen
	end

UnknownScript_0xbdec8:
	3writetext UnknownText_0x1b5a3b
	keeptextopen
	end

UnknownScript_0xbdece:
	3writetext UnknownText_0x1b5c10
	keeptextopen
	end

UnknownScript_0xbded4:
	3writetext UnknownText_0x1b5f7a
	keeptextopen
	end

UnknownScript_0xbdeda:
	3writetext UnknownText_0x1b60f5
	keeptextopen
	end

UnknownScript_0xbdee0:
	3writetext UnknownText_0x1b638c
	keeptextopen
	end

UnknownScript_0xbdee6:
	3writetext UnknownText_0x1b6454
	keeptextopen
	end

UnknownScript_0xbdeec:
	3writetext UnknownText_0x1b659d
	keeptextopen
	end

UnknownScript_0xbdef2:
	3writetext UnknownText_0x1b67e2
	keeptextopen
	end

UnknownScript_0xbdef8:
	3writetext UnknownText_0x1b69a8
	keeptextopen
	end

UnknownScript_0xbdefe:
	3writetext UnknownText_0x1b6b39
	keeptextopen
	end

UnknownScript_0xbdf04:
	3writetext UnknownText_0x1b6c96
	keeptextopen
	end

UnknownScript_0xbdf0a:
	3writetext UnknownText_0x1b7019
	keeptextopen
	end

UnknownScript_0xbdf10:
	3writetext UnknownText_0x1b71d5
	keeptextopen
	end

UnknownScript_0xbdf16:
	3writetext UnknownText_0x1b730b
	keeptextopen
	end

UnknownScript_0xbdf1c:
	3writetext UnknownText_0x1b73c7
	keeptextopen
	end

UnknownScript_0xbdf22:
	checkcode $17
	if_equal $5, UnknownScript_0xbdf74
	if_equal $7, UnknownScript_0xbdf7a
	if_equal $b, UnknownScript_0xbdf80
	if_equal $d, UnknownScript_0xbdf86
	if_equal $f, UnknownScript_0xbdf8c
	if_equal $10, UnknownScript_0xbdf92
	if_equal $11, UnknownScript_0xbdf98
	if_equal $13, UnknownScript_0xbdf9e
	if_equal $14, UnknownScript_0xbdfa4
	if_equal $16, UnknownScript_0xbdfaa
	if_equal $17, UnknownScript_0xbdfb0
	if_equal $18, UnknownScript_0xbdfb6
	if_equal $1b, UnknownScript_0xbdfbc
	if_equal $1c, UnknownScript_0xbdfc2
	if_equal $1d, UnknownScript_0xbdfc8
	if_equal $1e, UnknownScript_0xbdfce
	if_equal $20, UnknownScript_0xbdfd4
	if_equal $21, UnknownScript_0xbdfda
	if_equal $22, UnknownScript_0xbdfe0
	if_equal $23, UnknownScript_0xbdfe6

UnknownScript_0xbdf74:
	3writetext UnknownText_0x1b4ded
	keeptextopen
	end

UnknownScript_0xbdf7a:
	3writetext UnknownText_0x1b509b
	keeptextopen
	end

UnknownScript_0xbdf80:
	3writetext UnknownText_0x1b52a5
	keeptextopen
	end

UnknownScript_0xbdf86:
	3writetext UnknownText_0x1b55da
	keeptextopen
	end

UnknownScript_0xbdf8c:
	3writetext UnknownText_0x1b58c2
	keeptextopen
	end

UnknownScript_0xbdf92:
	3writetext UnknownText_0x1b5a74
	keeptextopen
	end

UnknownScript_0xbdf98:
	3writetext UnknownText_0x1b5c63
	keeptextopen
	end

UnknownScript_0xbdf9e:
	3writetext UnknownText_0x1b5f9e
	keeptextopen
	end

UnknownScript_0xbdfa4:
	3writetext UnknownText_0x1b611b
	keeptextopen
	end

UnknownScript_0xbdfaa:
	3writetext UnknownText_0x1b63a8
	keeptextopen
	end

UnknownScript_0xbdfb0:
	3writetext UnknownText_0x1b647e
	keeptextopen
	end

UnknownScript_0xbdfb6:
	3writetext UnknownText_0x1b65c7
	keeptextopen
	end

UnknownScript_0xbdfbc:
	3writetext UnknownText_0x1b680e
	keeptextopen
	end

UnknownScript_0xbdfc2:
	3writetext UnknownText_0x1b69d2
	keeptextopen
	end

UnknownScript_0xbdfc8:
	3writetext UnknownText_0x1b6b65
	keeptextopen
	end

UnknownScript_0xbdfce:
	3writetext UnknownText_0x1b6cc6
	keeptextopen
	end

UnknownScript_0xbdfd4:
	3writetext UnknownText_0x1b7057
	keeptextopen
	end

UnknownScript_0xbdfda:
	3writetext UnknownText_0x1b71fc
	keeptextopen
	end

UnknownScript_0xbdfe0:
	3writetext UnknownText_0x1b7331
	keeptextopen
	end

UnknownScript_0xbdfe6:
	3writetext UnknownText_0x1b73ef
	keeptextopen
	end

UnknownScript_0xbdfec:
	checkcode $17
	if_equal $5, UnknownScript_0xbe03e
	if_equal $7, UnknownScript_0xbe044
	if_equal $b, UnknownScript_0xbe04a
	if_equal $d, UnknownScript_0xbe050
	if_equal $f, UnknownScript_0xbe056
	if_equal $10, UnknownScript_0xbe05c
	if_equal $11, UnknownScript_0xbe062
	if_equal $13, UnknownScript_0xbe068
	if_equal $14, UnknownScript_0xbe06e
	if_equal $16, UnknownScript_0xbe074
	if_equal $17, UnknownScript_0xbe07a
	if_equal $18, UnknownScript_0xbe080
	if_equal $1b, UnknownScript_0xbe086
	if_equal $1c, UnknownScript_0xbe08c
	if_equal $1d, UnknownScript_0xbe092
	if_equal $1e, UnknownScript_0xbe098
	if_equal $20, UnknownScript_0xbe09e
	if_equal $21, UnknownScript_0xbe0a4
	if_equal $22, UnknownScript_0xbe0aa
	if_equal $23, UnknownScript_0xbe0b0

UnknownScript_0xbe03e:
	3writetext UnknownText_0x1b4e16
	keeptextopen
	end

UnknownScript_0xbe044:
	3writetext UnknownText_0x1b50c2
	keeptextopen
	end

UnknownScript_0xbe04a:
	3writetext UnknownText_0x1b52cc
	keeptextopen
	end

UnknownScript_0xbe050:
	3writetext UnknownText_0x1b55fc
	keeptextopen
	end

UnknownScript_0xbe056:
	3writetext UnknownText_0x1b58ea
	keeptextopen
	end

UnknownScript_0xbe05c:
	3writetext UnknownText_0x1b5a9f
	keeptextopen
	end

UnknownScript_0xbe062:
	3writetext UnknownText_0x1b5cb6
	keeptextopen
	end

UnknownScript_0xbe068:
	3writetext UnknownText_0x1b5fc9
	keeptextopen
	end

UnknownScript_0xbe06e:
	3writetext UnknownText_0x1b6149
	keeptextopen
	end

UnknownScript_0xbe074:
	3writetext UnknownText_0x1b63c4
	keeptextopen
	end

UnknownScript_0xbe07a:
	3writetext UnknownText_0x1b64a8
	keeptextopen
	end

UnknownScript_0xbe080:
	3writetext UnknownText_0x1b65e3
	keeptextopen
	end

UnknownScript_0xbe086:
	3writetext UnknownText_0x1b6836
	keeptextopen
	end

UnknownScript_0xbe08c:
	3writetext UnknownText_0x1b69f8
	keeptextopen
	end

UnknownScript_0xbe092:
	3writetext UnknownText_0x1b6b92
	keeptextopen
	end

UnknownScript_0xbe098:
	3writetext UnknownText_0x1b6cf6
	keeptextopen
	end

UnknownScript_0xbe09e:
	3writetext UnknownText_0x1b7092
	keeptextopen
	end

UnknownScript_0xbe0a4:
	3writetext UnknownText_0x1b722a
	keeptextopen
	end

UnknownScript_0xbe0aa:
	3writetext UnknownText_0x1b7357
	keeptextopen
	end

UnknownScript_0xbe0b0:
	3writetext UnknownText_0x1b7417
	keeptextopen
	end

UnknownScript_0xbe0b6:
	checktime $2
	iftrue UnknownScript_0xbe112
	checktime $4
	iftrue UnknownScript_0xbe164
	checkcode $17
	if_equal $6, UnknownScript_0xbe0e2
	if_equal $c, UnknownScript_0xbe0e8
	if_equal $e, UnknownScript_0xbe0ee
	if_equal $12, UnknownScript_0xbe0f4
	if_equal $15, UnknownScript_0xbe0fa
	if_equal $1a, UnknownScript_0xbe100
	if_equal $1f, UnknownScript_0xbe106
	if_equal $24, UnknownScript_0xbe10c

UnknownScript_0xbe0e2:
	3writetext UnknownText_0x1b4f21
	keeptextopen
	end

UnknownScript_0xbe0e8:
	3writetext UnknownText_0x1b53f7
	keeptextopen
	end

UnknownScript_0xbe0ee:
	3writetext UnknownText_0x1b5702
	keeptextopen
	end

UnknownScript_0xbe0f4:
	3writetext UnknownText_0x1b5d9f
	keeptextopen
	end

UnknownScript_0xbe0fa:
	3writetext UnknownText_0x1b626a
	keeptextopen
	end

UnknownScript_0xbe100:
	3writetext UnknownText_0x1b66c8
	keeptextopen
	end

UnknownScript_0xbe106:
	3writetext UnknownText_0x1b6e7c
	keeptextopen
	end

UnknownScript_0xbe10c:
	3writetext UnknownText_0x1b751a
	keeptextopen
	end

UnknownScript_0xbe112:
	checkcode $17
	if_equal $6, UnknownScript_0xbe134
	if_equal $c, UnknownScript_0xbe13a
	if_equal $e, UnknownScript_0xbe140
	if_equal $12, UnknownScript_0xbe146
	if_equal $15, UnknownScript_0xbe14c
	if_equal $1a, UnknownScript_0xbe152
	if_equal $1f, UnknownScript_0xbe158
	if_equal $24, UnknownScript_0xbe15e

UnknownScript_0xbe134:
	3writetext UnknownText_0x1b4f4d
	keeptextopen
	end

UnknownScript_0xbe13a:
	3writetext UnknownText_0x1b5424
	keeptextopen
	end

UnknownScript_0xbe140:
	3writetext UnknownText_0x1b572e
	keeptextopen
	end

UnknownScript_0xbe146:
	3writetext UnknownText_0x1b5dcc
	keeptextopen
	end

UnknownScript_0xbe14c:
	3writetext UnknownText_0x1b6296
	keeptextopen
	end

UnknownScript_0xbe152:
	3writetext UnknownText_0x1b66ec
	keeptextopen
	end

UnknownScript_0xbe158:
	3writetext UnknownText_0x1b6ea6
	keeptextopen
	end

UnknownScript_0xbe15e:
	3writetext UnknownText_0x1b7548
	keeptextopen
	end

UnknownScript_0xbe164:
	checkcode $17
	if_equal $6, UnknownScript_0xbe186
	if_equal $c, UnknownScript_0xbe18c
	if_equal $e, UnknownScript_0xbe192
	if_equal $12, UnknownScript_0xbe198
	if_equal $15, UnknownScript_0xbe19e
	if_equal $1a, UnknownScript_0xbe1a4
	if_equal $1f, UnknownScript_0xbe1aa
	if_equal $24, UnknownScript_0xbe1b0

UnknownScript_0xbe186:
	3writetext UnknownText_0x1b4f75
	keeptextopen
	end

UnknownScript_0xbe18c:
	3writetext UnknownText_0x1b5446
	keeptextopen
	end

UnknownScript_0xbe192:
	3writetext UnknownText_0x1b575a
	keeptextopen
	end

UnknownScript_0xbe198:
	3writetext UnknownText_0x1b5df8
	keeptextopen
	end

UnknownScript_0xbe19e:
	3writetext UnknownText_0x1b62c5
	keeptextopen
	end

UnknownScript_0xbe1a4:
	3writetext UnknownText_0x1b6713
	keeptextopen
	end

UnknownScript_0xbe1aa:
	3writetext UnknownText_0x1b6ec9
	keeptextopen
	end

UnknownScript_0xbe1b0:
	3writetext UnknownText_0x1b756f
	keeptextopen
	end

UnknownScript_0xbe1b6:
	checktime $2
	iftrue UnknownScript_0xbe28a
	checktime $4
	iftrue UnknownScript_0xbe354
	checkcode $17
	if_equal $5, UnknownScript_0xbe212
	if_equal $7, UnknownScript_0xbe218
	if_equal $b, UnknownScript_0xbe21e
	if_equal $d, UnknownScript_0xbe224
	if_equal $f, UnknownScript_0xbe22a
	if_equal $10, UnknownScript_0xbe230
	if_equal $11, UnknownScript_0xbe236
	if_equal $13, UnknownScript_0xbe23c
	if_equal $14, UnknownScript_0xbe242
	if_equal $16, UnknownScript_0xbe248
	if_equal $17, UnknownScript_0xbe24e
	if_equal $18, UnknownScript_0xbe254
	if_equal $1b, UnknownScript_0xbe25a
	if_equal $1c, UnknownScript_0xbe260
	if_equal $1d, UnknownScript_0xbe266
	if_equal $1e, UnknownScript_0xbe26c
	if_equal $20, UnknownScript_0xbe272
	if_equal $21, UnknownScript_0xbe278
	if_equal $22, UnknownScript_0xbe27e
	if_equal $23, UnknownScript_0xbe284

UnknownScript_0xbe212:
	3writetext UnknownText_0x1b4e3e
	keeptextopen
	end

UnknownScript_0xbe218:
	3writetext UnknownText_0x1b50e9
	keeptextopen
	end

UnknownScript_0xbe21e:
	3writetext UnknownText_0x1b5301
	keeptextopen
	end

UnknownScript_0xbe224:
	3writetext UnknownText_0x1b5628
	keeptextopen
	end

UnknownScript_0xbe22a:
	3writetext UnknownText_0x1b5912
	keeptextopen
	end

UnknownScript_0xbe230:
	3writetext UnknownText_0x1b5ad8
	keeptextopen
	end

UnknownScript_0xbe236:
	3writetext UnknownText_0x1b5d09
	keeptextopen
	end

UnknownScript_0xbe23c:
	3writetext UnknownText_0x1b5ff6
	keeptextopen
	end

UnknownScript_0xbe242:
	3writetext UnknownText_0x1b616e
	keeptextopen
	end

UnknownScript_0xbe248:
	3writetext UnknownText_0x1b63e3
	keeptextopen
	end

UnknownScript_0xbe24e:
	3writetext UnknownText_0x1b64d2
	keeptextopen
	end

UnknownScript_0xbe254:
	3writetext UnknownText_0x1b660d
	keeptextopen
	end

UnknownScript_0xbe25a:
	3writetext UnknownText_0x1b6862
	keeptextopen
	end

UnknownScript_0xbe260:
	3writetext UnknownText_0x1b6a22
	keeptextopen
	end

UnknownScript_0xbe266:
	3writetext UnknownText_0x1b6bb9
	keeptextopen
	end

UnknownScript_0xbe26c:
	3writetext UnknownText_0x1b6d26
	keeptextopen
	end

UnknownScript_0xbe272:
	3writetext UnknownText_0x1b70e7
	keeptextopen
	end

UnknownScript_0xbe278:
	3writetext UnknownText_0x1b725c
	keeptextopen
	end

UnknownScript_0xbe27e:
	3writetext UnknownText_0x1b737f
	keeptextopen
	end

UnknownScript_0xbe284:
	3writetext UnknownText_0x1b743f
	keeptextopen
	end

UnknownScript_0xbe28a:
	checkcode $17
	if_equal $5, UnknownScript_0xbe2dc
	if_equal $7, UnknownScript_0xbe2e2
	if_equal $b, UnknownScript_0xbe2e8
	if_equal $d, UnknownScript_0xbe2ee
	if_equal $f, UnknownScript_0xbe2f4
	if_equal $10, UnknownScript_0xbe2fa
	if_equal $11, UnknownScript_0xbe300
	if_equal $13, UnknownScript_0xbe306
	if_equal $14, UnknownScript_0xbe30c
	if_equal $16, UnknownScript_0xbe312
	if_equal $17, UnknownScript_0xbe318
	if_equal $18, UnknownScript_0xbe31e
	if_equal $1b, UnknownScript_0xbe324
	if_equal $1c, UnknownScript_0xbe32a
	if_equal $1d, UnknownScript_0xbe330
	if_equal $1e, UnknownScript_0xbe336
	if_equal $20, UnknownScript_0xbe33c
	if_equal $21, UnknownScript_0xbe342
	if_equal $22, UnknownScript_0xbe348
	if_equal $23, UnknownScript_0xbe34e

UnknownScript_0xbe2dc:
	3writetext UnknownText_0x1b4e72
	keeptextopen
	end

UnknownScript_0xbe2e2:
	3writetext UnknownText_0x1b511a
	keeptextopen
	end

UnknownScript_0xbe2e8:
	3writetext UnknownText_0x1b5335
	keeptextopen
	end

UnknownScript_0xbe2ee:
	3writetext UnknownText_0x1b564c
	keeptextopen
	end

UnknownScript_0xbe2f4:
	3writetext UnknownText_0x1b5948
	keeptextopen
	end

UnknownScript_0xbe2fa:
	3writetext UnknownText_0x1b5b0b
	keeptextopen
	end

UnknownScript_0xbe300:
	3writetext UnknownText_0x1b5d21
	keeptextopen
	end

UnknownScript_0xbe306:
	3writetext UnknownText_0x1b6017
	keeptextopen
	end

UnknownScript_0xbe30c:
	3writetext UnknownText_0x1b618f
	keeptextopen
	end

UnknownScript_0xbe312:
	3writetext UnknownText_0x1b6407
	keeptextopen
	end

UnknownScript_0xbe318:
	3writetext UnknownText_0x1b6506
	keeptextopen
	end

UnknownScript_0xbe31e:
	3writetext UnknownText_0x1b6624
	keeptextopen
	end

UnknownScript_0xbe324:
	3writetext UnknownText_0x1b6890
	keeptextopen
	end

UnknownScript_0xbe32a:
	3writetext UnknownText_0x1b6a56
	keeptextopen
	end

UnknownScript_0xbe330:
	3writetext UnknownText_0x1b6bef
	keeptextopen
	end

UnknownScript_0xbe336:
	3writetext UnknownText_0x1b6d57
	keeptextopen
	end

UnknownScript_0xbe33c:
	3writetext UnknownText_0x1b7112
	keeptextopen
	end

UnknownScript_0xbe342:
	3writetext UnknownText_0x1b7283
	keeptextopen
	end

UnknownScript_0xbe348:
	3writetext UnknownText_0x1b7397
	keeptextopen
	end

UnknownScript_0xbe34e:
	3writetext UnknownText_0x1b746f
	keeptextopen
	end

UnknownScript_0xbe354:
	checkcode $17
	if_equal $5, UnknownScript_0xbe3a6
	if_equal $7, UnknownScript_0xbe3ac
	if_equal $b, UnknownScript_0xbe3b2
	if_equal $d, UnknownScript_0xbe3b8
	if_equal $f, UnknownScript_0xbe3be
	if_equal $10, UnknownScript_0xbe3c4
	if_equal $11, UnknownScript_0xbe3ca
	if_equal $13, UnknownScript_0xbe3d0
	if_equal $14, UnknownScript_0xbe3d6
	if_equal $16, UnknownScript_0xbe3dc
	if_equal $17, UnknownScript_0xbe3e2
	if_equal $18, UnknownScript_0xbe3e8
	if_equal $1b, UnknownScript_0xbe3ee
	if_equal $1c, UnknownScript_0xbe3f4
	if_equal $1d, UnknownScript_0xbe3fa
	if_equal $1e, UnknownScript_0xbe400
	if_equal $20, UnknownScript_0xbe406
	if_equal $21, UnknownScript_0xbe40c
	if_equal $22, UnknownScript_0xbe412
	if_equal $23, UnknownScript_0xbe418

UnknownScript_0xbe3a6:
	3writetext UnknownText_0x1b4e9e
	keeptextopen
	end

UnknownScript_0xbe3ac:
	3writetext UnknownText_0x1b5154
	keeptextopen
	end

UnknownScript_0xbe3b2:
	3writetext UnknownText_0x1b535f
	keeptextopen
	end

UnknownScript_0xbe3b8:
	3writetext UnknownText_0x1b5670
	keeptextopen
	end

UnknownScript_0xbe3be:
	3writetext UnknownText_0x1b597c
	keeptextopen
	end

UnknownScript_0xbe3c4:
	3writetext UnknownText_0x1b5b37
	keeptextopen
	end

UnknownScript_0xbe3ca:
	3writetext UnknownText_0x1b5d39
	keeptextopen
	end

UnknownScript_0xbe3d0:
	3writetext UnknownText_0x1b6041
	keeptextopen
	end

UnknownScript_0xbe3d6:
	3writetext UnknownText_0x1b61bd
	keeptextopen
	end

UnknownScript_0xbe3dc:
	3writetext UnknownText_0x1b642c
	keeptextopen
	end

UnknownScript_0xbe3e2:
	3writetext UnknownText_0x1b6539
	keeptextopen
	end

UnknownScript_0xbe3e8:
	3writetext UnknownText_0x1b663b
	keeptextopen
	end

UnknownScript_0xbe3ee:
	3writetext UnknownText_0x1b68ba
	keeptextopen
	end

UnknownScript_0xbe3f4:
	3writetext UnknownText_0x1b6a8b
	keeptextopen
	end

UnknownScript_0xbe3fa:
	3writetext UnknownText_0x1b6c23
	keeptextopen
	end

UnknownScript_0xbe400:
	3writetext UnknownText_0x1b6d88
	keeptextopen
	end

UnknownScript_0xbe406:
	3writetext UnknownText_0x1b7132
	keeptextopen
	end

UnknownScript_0xbe40c:
	3writetext UnknownText_0x1b72a5
	keeptextopen
	end

UnknownScript_0xbe412:
	3writetext UnknownText_0x1b73af
	keeptextopen
	end

UnknownScript_0xbe418:
	3writetext UnknownText_0x1b749b
	keeptextopen
	end

UnknownScript_0xbe41e:
	checktime $2
	iftrue UnknownScript_0xbe47a
	checktime $4
	iftrue UnknownScript_0xbe4cc
	checkcode $17
	if_equal $6, UnknownScript_0xbe44a
	if_equal $c, UnknownScript_0xbe450
	if_equal $e, UnknownScript_0xbe456
	if_equal $12, UnknownScript_0xbe45c
	if_equal $15, UnknownScript_0xbe462
	if_equal $1a, UnknownScript_0xbe468
	if_equal $1f, UnknownScript_0xbe46e
	if_equal $24, UnknownScript_0xbe474

UnknownScript_0xbe44a:
	3writetext UnknownText_0x1b4fa1
	keeptextopen
	end

UnknownScript_0xbe450:
	3writetext UnknownText_0x1b5472
	keeptextopen
	end

UnknownScript_0xbe456:
	3writetext UnknownText_0x1b5786
	keeptextopen
	end

UnknownScript_0xbe45c:
	3writetext UnknownText_0x1b5e25
	keeptextopen
	end

UnknownScript_0xbe462:
	3writetext UnknownText_0x1b62f1
	keeptextopen
	end

UnknownScript_0xbe468:
	3writetext UnknownText_0x1b6738
	keeptextopen
	end

UnknownScript_0xbe46e:
	3writetext UnknownText_0x1b6ef3
	keeptextopen
	end

UnknownScript_0xbe474:
	3writetext UnknownText_0x1b758f
	keeptextopen
	end

UnknownScript_0xbe47a:
	checkcode $17
	if_equal $6, UnknownScript_0xbe49c
	if_equal $c, UnknownScript_0xbe4a2
	if_equal $e, UnknownScript_0xbe4a8
	if_equal $12, UnknownScript_0xbe4ae
	if_equal $15, UnknownScript_0xbe4b4
	if_equal $1a, UnknownScript_0xbe4ba
	if_equal $1f, UnknownScript_0xbe4c0
	if_equal $24, UnknownScript_0xbe4c6

UnknownScript_0xbe49c:
	3writetext UnknownText_0x1b4fda
	keeptextopen
	end

UnknownScript_0xbe4a2:
	3writetext UnknownText_0x1b54a6
	keeptextopen
	end

UnknownScript_0xbe4a8:
	3writetext UnknownText_0x1b57b7
	keeptextopen
	end

UnknownScript_0xbe4ae:
	3writetext UnknownText_0x1b5e59
	keeptextopen
	end

UnknownScript_0xbe4b4:
	3writetext UnknownText_0x1b630e
	keeptextopen
	end

UnknownScript_0xbe4ba:
	3writetext UnknownText_0x1b6757
	keeptextopen
	end

UnknownScript_0xbe4c0:
	3writetext UnknownText_0x1b6f1c
	keeptextopen
	end

UnknownScript_0xbe4c6:
	3writetext UnknownText_0x1b75ac
	keeptextopen
	end

UnknownScript_0xbe4cc:
	checkcode $17
	if_equal $6, UnknownScript_0xbe4ee
	if_equal $c, UnknownScript_0xbe4f4
	if_equal $e, UnknownScript_0xbe4fa
	if_equal $12, UnknownScript_0xbe500
	if_equal $15, UnknownScript_0xbe506
	if_equal $1a, UnknownScript_0xbe50c
	if_equal $1f, UnknownScript_0xbe512
	if_equal $24, UnknownScript_0xbe518

UnknownScript_0xbe4ee:
	3writetext UnknownText_0x1b5004
	keeptextopen
	end

UnknownScript_0xbe4f4:
	3writetext UnknownText_0x1b54d4
	keeptextopen
	end

UnknownScript_0xbe4fa:
	3writetext UnknownText_0x1b57e8
	keeptextopen
	end

UnknownScript_0xbe500:
	3writetext UnknownText_0x1b5e8e
	keeptextopen
	end

UnknownScript_0xbe506:
	3writetext UnknownText_0x1b6331
	keeptextopen
	end

UnknownScript_0xbe50c:
	3writetext UnknownText_0x1b6776
	keeptextopen
	end

UnknownScript_0xbe512:
	3writetext UnknownText_0x1b6f37
	keeptextopen
	end

UnknownScript_0xbe518:
	3writetext UnknownText_0x1b75c9
	keeptextopen
	end

UnknownScript_0xbe51e:
	checkcode $17
	if_equal $5, UnknownScript_0xbe564
	if_equal $b, UnknownScript_0xbe570
	if_equal $d, UnknownScript_0xbe576
	if_equal $f, UnknownScript_0xbe57c
	if_equal $10, UnknownScript_0xbe582
	if_equal $11, UnknownScript_0xbe588
	if_equal $13, UnknownScript_0xbe58e
	if_equal $14, UnknownScript_0xbe594
	if_equal $17, UnknownScript_0xbe59a
	if_equal $18, UnknownScript_0xbe5a0
	if_equal $1b, UnknownScript_0xbe5a6
	if_equal $1c, UnknownScript_0xbe5ac
	if_equal $1d, UnknownScript_0xbe5b2
	if_equal $1e, UnknownScript_0xbe5b8
	if_equal $20, UnknownScript_0xbe5be
	if_equal $21, UnknownScript_0xbe5c4
	if_equal $23, UnknownScript_0xbe5ca

UnknownScript_0xbe564:
	3writetext UnknownText_0x1b4ecd
	keeptextopen
	end

UnknownScript_0xbe56a:
	3writetext UnknownText_0x1b518b
	keeptextopen
	end

UnknownScript_0xbe570:
	3writetext UnknownText_0x1b5393
	keeptextopen
	end

UnknownScript_0xbe576:
	3writetext UnknownText_0x1b5694
	keeptextopen
	end

UnknownScript_0xbe57c:
	3writetext UnknownText_0x1b59b2
	keeptextopen
	end

UnknownScript_0xbe582:
	3writetext UnknownText_0x1b5b68
	keeptextopen
	end

UnknownScript_0xbe588:
	3writetext UnknownText_0x1b5d51
	keeptextopen
	end

UnknownScript_0xbe58e:
	3writetext UnknownText_0x1b606f
	keeptextopen
	end

UnknownScript_0xbe594:
	3writetext UnknownText_0x1b61f2
	keeptextopen
	end

UnknownScript_0xbe59a:
	3writetext UnknownText_0x1b656c
	keeptextopen
	end

UnknownScript_0xbe5a0:
	3writetext UnknownText_0x1b6652
	keeptextopen
	end

UnknownScript_0xbe5a6:
	3writetext UnknownText_0x1b68e8
	keeptextopen
	end

UnknownScript_0xbe5ac:
	3writetext UnknownText_0x1b6ac2
	keeptextopen
	end

UnknownScript_0xbe5b2:
	3writetext UnknownText_0x1b6c56
	keeptextopen
	end

UnknownScript_0xbe5b8:
	3writetext UnknownText_0x1b6db9
	keeptextopen
	end

UnknownScript_0xbe5be:
	3writetext UnknownText_0x1b7161
	keeptextopen
	end

UnknownScript_0xbe5c4:
	3writetext UnknownText_0x1b72d0
	keeptextopen
	end

UnknownScript_0xbe5ca:
	3writetext UnknownText_0x1b74c8
	keeptextopen
	end

UnknownScript_0xbe5d0:
	checkcode $17
	if_equal $6, UnknownScript_0xbe5f2
	if_equal $c, UnknownScript_0xbe5f8
	if_equal $e, UnknownScript_0xbe5fe
	if_equal $12, UnknownScript_0xbe604
	if_equal $15, UnknownScript_0xbe60a
	if_equal $1a, UnknownScript_0xbe610
	if_equal $1f, UnknownScript_0xbe616
	if_equal $24, UnknownScript_0xbe61c

UnknownScript_0xbe5f2:
	3writetext UnknownText_0x1b502b
	keeptextopen
	end

UnknownScript_0xbe5f8:
	3writetext UnknownText_0x1b5510
	keeptextopen
	end

UnknownScript_0xbe5fe:
	3writetext UnknownText_0x1b5819
	keeptextopen
	end

UnknownScript_0xbe604:
	3writetext UnknownText_0x1b5ebe
	keeptextopen
	end

UnknownScript_0xbe60a:
	3writetext UnknownText_0x1b6352
	keeptextopen
	end

UnknownScript_0xbe610:
	3writetext UnknownText_0x1b6795
	keeptextopen
	end

UnknownScript_0xbe616:
	3writetext UnknownText_0x1b6f60
	keeptextopen
	end

UnknownScript_0xbe61c:
	3writetext UnknownText_0x1b75e5
	keeptextopen
	end

UnknownScript_0xbe622:
	special $005d
	3call UnknownScript_0xbde3f
	if_equal $0, UnknownScript_0xbe636
	3writetext UnknownText_0x1b518b
	keeptextopen
	3jump UnknownScript_0xa0484

UnknownScript_0xbe636:
	3jump UnknownScript_0xbe63a

UnknownScript_0xbe63a:
	3writetext UnknownText_0x1b522b
	keeptextopen
	3jump UnknownScript_0xa0484
; be643


String_be643: db "Grandma@"
String_be64b: db "Grandpa@"
String_be653: db "Mom@"
String_be657: db "Dad@"
String_be65b: db "Sister@"
String_be662: db "Brother@"


UnknownScript_0xbe66a:: ; 0xbe66a
	faceplayer
	trainerstatus $2
	iftrue UnknownScript_0xbe698
	loadtrainerdata
	playrammusic
	2jump UnknownScript_0xbe68a
; 0xbe675

UnknownScript_0xbe675:: ; 0xbe675
	loadtrainerdata
	playrammusic
	showemote $0, $fe, 30
	3callasm Function831e
	applymovement2 $d007
	writepersonxy $fe
	faceperson $0, $fe
	2jump UnknownScript_0xbe68a
; 0xbe68a

UnknownScript_0xbe68a: ; 0xbe68a
	loadfont
	trainertext $0
	closetext
	loadmovesprites
	loadtrainerdata
	startbattle
	returnafterbattle
	trainerstatus $1
	loadvar $d04d, $ff

UnknownScript_0xbe698:
	scripttalkafter
; 0xbe699
