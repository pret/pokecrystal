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


INCBIN "baserom.gbc",$bd0d0,$be66a - $bd0d0


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
