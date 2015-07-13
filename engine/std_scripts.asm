StdScripts::
	dbw BANK(PokeCenterNurseScript), PokeCenterNurseScript
	dbw BANK(DifficultBookshelfScript), DifficultBookshelfScript
	dbw BANK(PictureBookshelfScript), PictureBookshelfScript
	dbw BANK(MagazineBookshelfScript), MagazineBookshelfScript
	dbw BANK(TeamRocketOathScript), TeamRocketOathScript
	dbw BANK(IncenseBurnerScript), IncenseBurnerScript
	dbw BANK(MerchandiseShelfScript), MerchandiseShelfScript
	dbw BANK(TownMapScript), TownMapScript
	dbw BANK(WindowScript), WindowScript
	dbw BANK(TVScript), TVScript
	dbw BANK(HomepageScript), HomepageScript
	dbw BANK(Radio1Script), Radio1Script
	dbw BANK(Radio2Script), Radio2Script
	dbw BANK(TrashCanScript), TrashCanScript
	dbw BANK(StrengthBoulderScript), StrengthBoulderScript
	dbw BANK(SmashRockScript), SmashRockScript
	dbw BANK(PokeCenterSignScript), PokeCenterSignScript
	dbw BANK(MartSignScript), MartSignScript
	dbw BANK(GoldenrodRocketsScript), GoldenrodRocketsScript
	dbw BANK(RadioTowerRocketsScript), RadioTowerRocketsScript
	dbw BANK(ElevatorButtonScript), ElevatorButtonScript
	dbw BANK(DayToTextScript), DayToTextScript
	dbw BANK(BugContestResultsWarpScript), BugContestResultsWarpScript
	dbw BANK(BugContestResultsScript), BugContestResultsScript
	dbw BANK(InitializeEventsScript), InitializeEventsScript
	dbw BANK(AskNumber1MScript), AskNumber1MScript
	dbw BANK(AskNumber2MScript), AskNumber2MScript
	dbw BANK(RegisteredNumberMScript), RegisteredNumberMScript
	dbw BANK(NumberAcceptedMScript), NumberAcceptedMScript
	dbw BANK(NumberDeclinedMScript), NumberDeclinedMScript
	dbw BANK(PhoneFullMScript), PhoneFullMScript
	dbw BANK(RematchMScript), RematchMScript
	dbw BANK(GiftMScript), GiftMScript
	dbw BANK(PackFullMScript), PackFullMScript
	dbw BANK(RematchGiftMScript), RematchGiftMScript
	dbw BANK(AskNumber1FScript), AskNumber1FScript
	dbw BANK(AskNumber2FScript), AskNumber2FScript
	dbw BANK(RegisteredNumberFScript), RegisteredNumberFScript
	dbw BANK(NumberAcceptedFScript), NumberAcceptedFScript
	dbw BANK(NumberDeclinedFScript), NumberDeclinedFScript
	dbw BANK(PhoneFullFScript), PhoneFullFScript
	dbw BANK(RematchFScript), RematchFScript
	dbw BANK(GiftFScript), GiftFScript
	dbw BANK(PackFullFScript), PackFullFScript
	dbw BANK(RematchGiftFScript), RematchGiftFScript
	dbw BANK(GymStatue1Script), GymStatue1Script
	dbw BANK(GymStatue2Script), GymStatue2Script
	dbw BANK(UnknownScript_0xbcdb9), UnknownScript_0xbcdb9
	dbw BANK(UnknownScript_0xbcdc3), UnknownScript_0xbcdc3
	dbw BANK(PCScript), PCScript
	dbw BANK(UnknownScript_0xbcdcd), UnknownScript_0xbcdcd
	dbw BANK(HappinessCheckScript), HappinessCheckScript

PokeCenterNurseScript:
; EVENT_WELCOMED_TO_POKECOM_CENTER is never set

	loadfont
	checkmorn
	iftrue .morn
	checkday
	iftrue .day
	checknite
	iftrue .nite
	jump .ok

.morn
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .morn_comcenter
	farwritetext UnknownText_0x1b0000
	keeptextopen
	jump .ok
.morn_comcenter
	farwritetext UnknownText_0x1b008a
	keeptextopen
	jump .ok

.day
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .day_comcenter
	farwritetext UnknownText_0x1b002b
	keeptextopen
	jump .ok
.day_comcenter
	farwritetext UnknownText_0x1b00d6
	keeptextopen
	jump .ok

.nite
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .nite_comcenter
	farwritetext UnknownText_0x1b004f
	keeptextopen
	jump .ok
.nite_comcenter
	farwritetext UnknownText_0x1b011b
	keeptextopen
	jump .ok

.ok
	; only do this once
	clearevent EVENT_WELCOMED_TO_POKECOM_CENTER

	farwritetext UnknownText_0x1b017a
	yesorno
	iffalse .done

	farwritetext UnknownText_0x1b01bd
	pause 20
	special Function1060a2
	spriteface $fe, LEFT
	pause 10
	special HealParty
	playmusic MUSIC_NONE
	writebyte 0
	special HealMachineAnim
	pause 30
	special RestartMapMusic
	spriteface $fe, DOWN
	pause 10

	checkphonecall ; elm already called about pokerus
	iftrue .no
	checkflag ENGINE_POKERUS ; nurse already talked about pokerus
	iftrue .no
	special SpecialCheckPokerus
	iftrue .pokerus
.no

	farwritetext UnknownText_0x1b01d7
	pause 20

.done
	farwritetext UnknownText_0x1b020b

	spriteface $fe, UP
	pause 10
	spriteface $fe, DOWN
	pause 10

	closetext
	loadmovesprites
	end

.pokerus
	; already cleared earlier in the script
	checkevent EVENT_WELCOMED_TO_POKECOM_CENTER
	iftrue .pokerus_comcenter

	farwritetext UnknownText_0x1b0241
	closetext
	loadmovesprites
	jump .pokerus_done

.pokerus_comcenter
	farwritetext UnknownText_0x1b02d6
	closetext
	loadmovesprites

.pokerus_done
	setflag ENGINE_POKERUS
	specialphonecall 1 ; elm calls about pokerus
	end

DifficultBookshelfScript:
	farjumptext DifficultBookshelfText

PictureBookshelfScript:
	farjumptext PictureBookshelfText

MagazineBookshelfScript:
	farjumptext MagazineBookshelfText

TeamRocketOathScript:
	farjumptext TeamRocketOathText

IncenseBurnerScript:
	farjumptext IncenseBurnerText

MerchandiseShelfScript:
	farjumptext MerchandiseShelfText

TownMapScript:
	loadfont
	farwritetext TownMapText
	closetext
	special Functionc2c0
	loadmovesprites
	end

WindowScript:
	farjumptext WindowText

TVScript:
	loadfont
	farwritetext TVText
	closetext
	loadmovesprites
	end

HomepageScript:
	farjumptext HomepageText

Radio1Script:
	loadfont
	writebyte $0
	special Functionc355
	loadmovesprites
	end

Radio2Script:
; Lucky Channel
	loadfont
	writebyte $4
	special Functionc355
	loadmovesprites
	end

TrashCanScript: ; 0xbc1a5
	farjumptext TrashCanText

PCScript:
	loadfont
	special Function1559a
	loadmovesprites
	end

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulderScript:
	farjump AskStrengthScript

SmashRockScript:
	farjump AskRockSmashScript

PokeCenterSignScript:
	farjumptext PokeCenterSignText

MartSignScript
	farjumptext MartSignText

DayToTextScript:
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .Monday
	if_equal TUESDAY, .Tuesday
	if_equal WEDNESDAY, .Wednesday
	if_equal THURSDAY, .Thursday
	if_equal FRIDAY, .Friday
	if_equal SATURDAY, .Saturday
	stringtotext .SundayText, 0
	end
.Monday
	stringtotext .MondayText, 0
	end
.Tuesday
	stringtotext .TuesdayText, 0
	end
.Wednesday
	stringtotext .WednesdayText, 0
	end
.Thursday
	stringtotext .ThursdayText, 0
	end
.Friday
	stringtotext .FridayText, 0
	end
.Saturday
	stringtotext .SaturdayText, 0
	end
.SundayText
	db "SUNDAY@"
.MondayText
	db "MONDAY@"
.TuesdayText
	db "TUESDAY@"
.WednesdayText
	db "WEDNESDAY@"
.ThursdayText
	db "THURSDAY@"
.FridayText
	db "FRIDAY@"
.SaturdayText
	db "SATURDAY@"

GoldenrodRocketsScript:
	clearevent EVENT_6CD
	end

RadioTowerRocketsScript:
	setflag ENGINE_ROCKETS_IN_RADIO_TOWER
	setevent EVENT_6CF
	setevent EVENT_6D1
	clearevent EVENT_6CE
	clearevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_756
	specialphonecall $0004
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end

BugContestResultsWarpScript:
	special WhiteBGMap
	scall UnknownScript_0xbc380
	setevent EVENT_747
	clearevent EVENT_748
	setevent EVENT_2D2
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, MovementData_0xbcea1

BugContestResultsScript:
	clearflag ENGINE_BUG_CONTEST_TIMER
	clearevent EVENT_2D2
	clearevent EVENT_313
	clearevent EVENT_314
	clearevent EVENT_315
	clearevent EVENT_316
	loadfont
	farwritetext UnknownText_0x1b05bf
	closetext
	special Functionc34a
	RAM2MEM $0
	if_equal $1, UnknownScript_0xbc31e
	if_equal $2, UnknownScript_0xbc332
	if_equal $3, UnknownScript_0xbc343
	farwritetext UnknownText_0x1b0681
	keeptextopen
	waitbutton
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0xbc375

UnknownScript_0xbc2a9:
	farwritetext UnknownText_0x1b06b7
	keeptextopen
	jump UnknownScript_0xbc2b6
; 0xbc2b1

UnknownScript_0xbc2b1: ; 0xbc2b1
	farwritetext UnknownText_0x1b065b
	keeptextopen

UnknownScript_0xbc2b6:
	checkevent EVENT_308
	iffalse UnknownScript_0xbc2c4
	farwritetext UnknownText_0x1b06d9
	closetext
	special Function13a31
UnknownScript_0xbc2c4:
	special Function4d9e5
	if_equal $0, UnknownScript_0xbc2d4
	if_equal $2, UnknownScript_0xbc2d4
	farwritetext UnknownText_0x1b070d
	closetext
UnknownScript_0xbc2d4:
	loadmovesprites
	dotrigger $0
	domaptrigger GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE, $0
	setevent EVENT_716
	setevent EVENT_717
	setevent EVENT_718
	setevent EVENT_719
	setevent EVENT_71A
	setevent EVENT_71B
	setevent EVENT_71C
	setevent EVENT_71D
	setevent EVENT_71E
	setevent EVENT_71F
	setevent EVENT_720
	setevent EVENT_721
	setevent EVENT_722
	setevent EVENT_723
	setevent EVENT_724
	setevent EVENT_725
	setevent EVENT_726
	setevent EVENT_727
	setevent EVENT_728
	setevent EVENT_729
	setflag ENGINE_51
	special PlayMapMusic
	end
; 0xbc31e

UnknownScript_0xbc31e: ; 0xbc31e
	setevent EVENT_000
	itemtotext SUN_STONE, $1
	farwritetext UnknownText_0x1b0621
	closetext
	verbosegiveitem SUN_STONE, 1
	iffalse UnknownScript_0xbc354
	jump UnknownScript_0xbc2b1
; 0xbc332

UnknownScript_0xbc332: ; 0xbc332
	itemtotext EVERSTONE, $1
	farwritetext UnknownText_0x1b0621
	closetext
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0xbc35f
	jump UnknownScript_0xbc2b1
; 0xbc343

UnknownScript_0xbc343: ; 0xbc343
	itemtotext GOLD_BERRY, $1
	farwritetext UnknownText_0x1b0621
	closetext
	verbosegiveitem GOLD_BERRY, 1
	iffalse UnknownScript_0xbc36a
	jump UnknownScript_0xbc2b1
; 0xbc354

UnknownScript_0xbc354: ; 0xbc354
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_313
	jump UnknownScript_0xbc2b1
; 0xbc35f

UnknownScript_0xbc35f: ; 0xbc35f
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_314
	jump UnknownScript_0xbc2b1
; 0xbc36a

UnknownScript_0xbc36a: ; 0xbc36a
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_315
	jump UnknownScript_0xbc2b1
; 0xbc375

UnknownScript_0xbc375: ; 0xbc375
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent EVENT_316
	jump UnknownScript_0xbc2a9
; 0xbc380

UnknownScript_0xbc380: ; 0xbc380
	checkevent EVENT_716
	iftrue .skip1
	clearevent EVENT_720
.skip1
	checkevent EVENT_717
	iftrue .skip2
	clearevent EVENT_721
.skip2
	checkevent EVENT_718
	iftrue .skip3
	clearevent EVENT_722
.skip3
	checkevent EVENT_719
	iftrue .skip4
	clearevent EVENT_723
.skip4
	checkevent EVENT_71A
	iftrue .skip5
	clearevent EVENT_724
.skip5
	checkevent EVENT_71B
	iftrue .skip6
	clearevent EVENT_725
.skip6
	checkevent EVENT_71C
	iftrue .skip7
	clearevent EVENT_726
.skip7
	checkevent EVENT_71D
	iftrue .skip8
	clearevent EVENT_727
.skip8
	checkevent EVENT_71E
	iftrue .skip9
	clearevent EVENT_728
.skip9
	checkevent EVENT_71F
	iftrue .skip10
	clearevent EVENT_729
.skip10
	end

InitializeEventsScript:
	setevent EVENT_6CB
	setevent EVENT_6CE
	setevent EVENT_6CD
	setevent EVENT_6D0
	setevent EVENT_6F3
	setevent EVENT_6E9
	setevent EVENT_6F4
	setevent EVENT_6D5
	setevent EVENT_6DE
	setevent EVENT_6DD
	setevent EVENT_6DF
	setevent EVENT_6C0
	setevent EVENT_6E4
	setevent EVENT_USED_THE_CARD_KEY_IN_THE_RADIO_TOWER
	setevent EVENT_6BE
	setevent EVENT_6BF
	setevent EVENT_6C1
	setevent EVENT_6F9
	setevent EVENT_6FD
	setevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	setevent EVENT_ELMS_AIDE_IN_VIOLET_POKEMON_CENTER
	setevent EVENT_702
	setevent EVENT_703
	setevent EVENT_704
	setevent EVENT_BOULDER_IN_ICE_PATH_1
	setevent EVENT_BOULDER_IN_ICE_PATH_2
	setevent EVENT_BOULDER_IN_ICE_PATH_3
	setevent EVENT_BOULDER_IN_ICE_PATH_4
	setevent EVENT_715
	setevent EVENT_716
	setevent EVENT_717
	setevent EVENT_718
	setevent EVENT_719
	setevent EVENT_71A
	setevent EVENT_71B
	setevent EVENT_71C
	setevent EVENT_71D
	setevent EVENT_71E
	setevent EVENT_71F
	setevent EVENT_720
	setevent EVENT_721
	setevent EVENT_722
	setevent EVENT_723
	setevent EVENT_724
	setevent EVENT_725
	setevent EVENT_726
	setevent EVENT_727
	setevent EVENT_728
	setevent EVENT_729
	setevent EVENT_72C
	setevent EVENT_72F
	setevent EVENT_72D
	setevent EVENT_735
	setevent EVENT_736
	setevent EVENT_73C
	setevent EVENT_73D
	setevent EVENT_741
	setevent EVENT_742
	setevent EVENT_743
	setevent EVENT_744
	setevent EVENT_2A4
	setevent EVENT_2AF
	setevent EVENT_749
	setevent EVENT_6D3
	setevent EVENT_74D
	setevent EVENT_MET_BILL
	setevent EVENT_713
	setevent EVENT_711
	setevent EVENT_6D4
	setevent EVENT_WAREHOUSE_LAYOUT_1
	setevent EVENT_WAREHOUSE_BLOCKED_OFF
	setevent EVENT_6D8
	setevent EVENT_6C3
	setevent EVENT_6C2
	setevent EVENT_6C6
	setevent EVENT_75F
	setevent EVENT_731
	setevent EVENT_74A
	setevent EVENT_RED_IN_MT_SILVER
	setevent EVENT_738
	setevent EVENT_73A
	setevent EVENT_73B
	setevent EVENT_733
	setevent EVENT_73F
	setevent EVENT_78D
	setevent EVENT_766
	setevent EVENT_768
	setevent EVENT_FLORIA_AT_SUDOWOODO
	setevent EVENT_76A
	setevent EVENT_78E
	setevent EVENT_78F
	setevent EVENT_790
	setevent EVENT_791
	setevent EVENT_793
	setevent EVENT_7A4
	setevent EVENT_7A4
	setevent EVENT_7A5
	setevent EVENT_6EC
	setevent EVENT_6ED
	setevent EVENT_6F0
	setevent EVENT_7A9
	setevent EVENT_EUSINE_IN_BURNED_TOWER
	setevent EVENT_6C8
	setevent EVENT_7AC
	setevent EVENT_7AD
	setevent EVENT_7B5
	setevent EVENT_7B6
	setevent EVENT_7C5
	setevent EVENT_SET_WHEN_FOUGHT_HO_OH
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_36
	setevent EVENT_SAW_SUICUNE_ON_ROUTE_42
	setevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	setevent EVENT_7CF
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite SPRITE_WEIRD_TREE, SPRITE_SUDOWOODO
	variablesprite SPRITE_OLIVINE_RIVAL, SPRITE_SILVER
	variablesprite SPRITE_AZALEA_ROCKET, SPRITE_ROCKET
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	variablesprite SPRITE_COPYCAT, SPRITE_LASS
	variablesprite SPRITE_JANINE_IMPERSONATOR, SPRITE_LASS
	setevent EVENT_FOUND_MACHINE_PART_IN_CERULEAN_GYM
	setevent EVENT_76D
	setevent EVENT_76C
	setevent EVENT_76E
	setevent EVENT_TRAINERS_IN_CERULEAN_GYM
	setevent EVENT_773
	setevent EVENT_776
	setevent EVENT_777
	setevent EVENT_779
	setevent EVENT_772
	setevent EVENT_77B
	setevent EVENT_036
	return

AskNumber1MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $16, .Irwin
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Jack
	farwritetext JackAskNumber1Text
	end
.Huey
	farwritetext HueyAskNumber1Text
	end
.Gaven
	farwritetext GavenAskNumber1Text
	end
.Jose
	farwritetext JoseAskNumber1Text
	end
.Joey
	farwritetext JoeyAskNumber1Text
	end
.Wade
	farwritetext WadeAskNumber1Text
	end
.Ralph
	farwritetext RalphAskNumber1Text
	end
.Anthony
	farwritetext AnthonyAskNumber1Text
	end
.Todd
	farwritetext ToddAskNumber1Text
	end
.Irwin
	farwritetext IrwinAskNumber1Text
	end
.Arnie
	farwritetext ArnieAskNumber1Text
	end
.Alan
	farwritetext AlanAskNumber1Text
	end
.Chad
	farwritetext ChadAskNumber1Text
	end
.Derek
	farwritetext DerekAskNumber1Text
	end
.Tully
	farwritetext TullyAskNumber1Text
	end
.Brent
	farwritetext BrentAskNumber1Text
	end
.Vance
	farwritetext VanceAskNumber1Text
	end
.Wilton
	farwritetext WiltonAskNumber1Text
	end
.Kenji
	farwritetext KenjiAskNumber1Text
	end
.Parry
	farwritetext ParryAskNumber1Text
	end

AskNumber2MScript:
	special RandomPhoneMon
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $16, .Irwin
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Jack
	farwritetext JackAskNumber2Text
	end
.Huey
	farwritetext HueyAskNumber2Text
	end
.Gaven
	farwritetext GavenAskNumber2Text
	end
.Jose
	farwritetext JoseAskNumber2Text
	end
.Joey
	farwritetext JoeyAskNumber2Text
	end
.Wade
	farwritetext WadeAskNumber2Text
	end
.Ralph
	farwritetext RalphAskNumber2Text
	end
.Anthony
	farwritetext AnthonyAskNumber2Text
	end
.Todd
	farwritetext ToddAskNumber2Text
	end
.Irwin
	farwritetext IrwinAskNumber2Text
	end
.Arnie
	farwritetext ArnieAskNumber2Text
	end
.Alan
	farwritetext AlanAskNumber2Text
	end
.Chad
	farwritetext ChadAskNumber2Text
	end
.Derek
	farwritetext DerekAskNumber2Text
	end
.Tully
	farwritetext TullyAskNumber2Text
	end
.Brent
	farwritetext BrentAskNumber2Text
	end
.Vance
	farwritetext VanceAskNumber2Text
	end
.Wilton
	farwritetext WiltonAskNumber2Text
	end
.Kenji
	farwritetext KenjiAskNumber2Text
	end
.Parry
	farwritetext ParryAskNumber2Text
	end

RegisteredNumberMScript:
	farwritetext RegisteredNumber1Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end

NumberAcceptedMScript:
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $16, .Irwin
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Jack
	farwritetext JackNumberAcceptedText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenNumberAcceptedText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseNumberAcceptedText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeNumberAcceptedText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphNumberAcceptedText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddNumberAcceptedText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinNumberAcceptedText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieNumberAcceptedText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanNumberAcceptedText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadNumberAcceptedText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekNumberAcceptedText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentNumberAcceptedText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceNumberAcceptedText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonNumberAcceptedText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiNumberAcceptedText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryNumberAcceptedText
	closetext
	loadmovesprites
	end

NumberDeclinedMScript:
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $16, .Irwin
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Jack
	farwritetext JackNumberDeclinedText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenNumberDeclinedText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseNumberDeclinedText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeNumberDeclinedText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphNumberDeclinedText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddNumberDeclinedText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinNumberDeclinedText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieNumberDeclinedText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanNumberDeclinedText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadNumberDeclinedText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekNumberDeclinedText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentNumberDeclinedText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceNumberDeclinedText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonNumberDeclinedText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiNumberDeclinedText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryNumberDeclinedText
	closetext
	loadmovesprites
	end

PhoneFullMScript:
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $16, .Irwin
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Jack
	farwritetext JackPhoneFullText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyPhoneFullText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenPhoneFullText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JosePhoneFullText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyPhoneFullText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadePhoneFullText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphPhoneFullText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyPhoneFullText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddPhoneFullText
	closetext
	loadmovesprites
	end
.Irwin
	farwritetext IrwinPhoneFullText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArniePhoneFullText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanPhoneFullText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadPhoneFullText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekPhoneFullText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyPhoneFullText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentPhoneFullText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VancePhoneFullText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonPhoneFullText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiPhoneFullText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryPhoneFullText
	closetext
	loadmovesprites
	end

RematchMScript:
	checkcode VAR_CALLERID
	if_equal $5, .Jack
	if_equal $7, .Huey
	if_equal $b, .Gaven
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $11, .Ralph
	if_equal $13, .Anthony
	if_equal $14, .Todd
	if_equal $17, .Arnie
	if_equal $18, .Alan
	if_equal $1b, .Chad
	if_equal $1d, .Tully
	if_equal $1e, .Brent
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $23, .Parry

.Jack
	farwritetext JackRematchText
	closetext
	loadmovesprites
	end
.Huey
	farwritetext HueyRematchText
	closetext
	loadmovesprites
	end
.Gaven
	farwritetext GavenRematchText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JoseRematchText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyRematchText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadeRematchText
	closetext
	loadmovesprites
	end
.Ralph
	farwritetext RalphRematchText
	closetext
	loadmovesprites
	end
.Anthony
	farwritetext AnthonyRematchText
	closetext
	loadmovesprites
	end
.Todd
	farwritetext ToddRematchText
	closetext
	loadmovesprites
	end
.Arnie
	farwritetext ArnieRematchText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanRematchText
	closetext
	loadmovesprites
	end
.Chad
	farwritetext ChadRematchText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyRematchText
	closetext
	loadmovesprites
	end
.Brent
	farwritetext BrentRematchText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VanceRematchText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonRematchText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryRematchText
	closetext
	loadmovesprites
	end

GiftMScript:
	checkcode VAR_CALLERID
	if_equal $d, .Jose
	if_equal $10, .Wade
	if_equal $18, .Alan
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $21, .Wilton
	if_equal $22, .Kenji

.Jose
	farwritetext JoseGiftText
	keeptextopen
	end
.Wade
	farwritetext WadeGiftText
	keeptextopen
	end
.Alan
	farwritetext AlanGiftText
	keeptextopen
	end
.Derek
	farwritetext DerekGiftText
	keeptextopen
	end
.Tully
	farwritetext TullyGiftText
	keeptextopen
	end
.Wilton
	farwritetext WiltonGiftText
	keeptextopen
	end
.Kenji
	farwritetext KenjiGiftText
	keeptextopen
	end

PackFullMScript:
	checkcode VAR_CALLERID
	if_equal $7, .Huey
	if_equal $d, .Jose
	if_equal $f, .Joey
	if_equal $10, .Wade
	if_equal $18, .Alan
	if_equal $1c, .Derek
	if_equal $1d, .Tully
	if_equal $20, .Vance
	if_equal $21, .Wilton
	if_equal $22, .Kenji
	if_equal $23, .Parry

.Huey
	farwritetext HueyPackFullText
	closetext
	loadmovesprites
	end
.Jose
	farwritetext JosePackFullText
	closetext
	loadmovesprites
	end
.Joey
	farwritetext JoeyPackFullText
	closetext
	loadmovesprites
	end
.Wade
	farwritetext WadePackFullText
	closetext
	loadmovesprites
	end
.Alan
	farwritetext AlanPackFullText
	closetext
	loadmovesprites
	end
.Derek
	farwritetext DerekPackFullText
	closetext
	loadmovesprites
	end
.Tully
	farwritetext TullyPackFullText
	closetext
	loadmovesprites
	end
.Vance
	farwritetext VancePackFullText
	closetext
	loadmovesprites
	end
.Wilton
	farwritetext WiltonPackFullText
	closetext
	loadmovesprites
	end
.Kenji
	farwritetext KenjiPackFullText
	closetext
	loadmovesprites
	end
.Parry
	farwritetext ParryPackFullText
	closetext
	loadmovesprites
	end

RematchGiftMScript:
	loadfont
	checkcode VAR_CALLERID
	if_equal $7, .Huey
	if_equal $f, .Joey
	if_equal $20, .Vance
	if_equal $23, .Parry

.Huey
	farwritetext HueyRematchGiftText
	keeptextopen
	end
.Joey
	farwritetext JoeyRematchGiftText
	keeptextopen
	end
.Vance
	farwritetext VanceRematchGiftText
	keeptextopen
	end
.Parry
	farwritetext ParryRematchGiftText
	keeptextopen
	end

AskNumber1FScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyAskNumber1Text
	end
.Beth
	farwritetext BethAskNumber1Text
	end
.Reena
	farwritetext ReenaAskNumber1Text
	end
.Liz
	farwritetext LizAskNumber1Text
	end
.Gina
	farwritetext GinaAskNumber1Text
	end
.Dana
	farwritetext DanaAskNumber1Text
	end
.Tiffany
	farwritetext TiffanyAskNumber1Text
	end
.Erin
	farwritetext ErinAskNumber1Text
	end

AskNumber2FScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyAskNumber2Text
	end
.Beth
	farwritetext BethAskNumber2Text
	end
.Reena
	farwritetext ReenaAskNumber2Text
	end
.Liz
	farwritetext LizAskNumber2Text
	end
.Gina
	farwritetext GinaAskNumber2Text
	end
.Dana
	farwritetext DanaAskNumber2Text
	end
.Tiffany
	farwritetext TiffanyAskNumber2Text
	end
.Erin
	farwritetext ErinAskNumber2Text
	end

RegisteredNumberFScript:
	farwritetext RegisteredNumber2Text
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end

NumberAcceptedFScript: ; 0xbcbd3
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethNumberAcceptedText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizNumberAcceptedText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaNumberAcceptedText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyNumberAcceptedText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinNumberAcceptedText
	closetext
	loadmovesprites
	end

NumberDeclinedFScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethNumberDeclinedText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizNumberDeclinedText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaNumberDeclinedText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyNumberDeclinedText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinNumberDeclinedText
	closetext
	loadmovesprites
	end

PhoneFullFScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyPhoneFullText
	closetext
	loadmovesprites
	end
.Beth
	farwritetext BethPhoneFullText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaPhoneFullText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizPhoneFullText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaPhoneFullText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaPhoneFullText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyPhoneFullText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinPhoneFullText
	closetext
	loadmovesprites
	end

RematchFScript:
	checkcode VAR_CALLERID
	if_equal $c, .Beth
	if_equal $e, .Reena
	if_equal $12, .Liz
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beth
	farwritetext BethRematchText
	closetext
	loadmovesprites
	end
.Reena
	farwritetext ReenaRematchText
	closetext
	loadmovesprites
	end
.Liz
	farwritetext LizRematchText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaRematchText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaRematchText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyRematchText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinRematchText
	closetext
	loadmovesprites
	end

GiftFScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany

.Beverly
	farwritetext BeverlyGiftText
	keeptextopen
	end
.Gina
	farwritetext GinaGiftText
	keeptextopen
	end
.Dana
	farwritetext DanaGiftText
	keeptextopen
	end
.Tiffany
	farwritetext TiffanyGiftText
	keeptextopen
	end

PackFullFScript:
	checkcode VAR_CALLERID
	if_equal $6, .Beverly
	if_equal $15, .Gina
	if_equal $1a, .Dana
	if_equal $1f, .Tiffany
	if_equal $24, .Erin

.Beverly
	farwritetext BeverlyPackFullText
	closetext
	loadmovesprites
	end
.Gina
	farwritetext GinaPackFullText
	closetext
	loadmovesprites
	end
.Dana
	farwritetext DanaPackFullText
	closetext
	loadmovesprites
	end
.Tiffany
	farwritetext TiffanyPackFullText
	closetext
	loadmovesprites
	end
.Erin
	farwritetext ErinPackFullText
	closetext
	loadmovesprites
	end

RematchGiftFScript:
	checkcode VAR_CALLERID
	if_equal $24, .Erin

.Erin
	loadfont
	farwritetext ErinRematchGiftText
	keeptextopen
	end

GymStatue1Script:
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	closetext
	loadmovesprites
	end

GymStatue2Script:
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	keeptextopen
	farwritetext UnknownText_0x1b075c
	closetext
	loadmovesprites
	end

UnknownScript_0xbcdb9: ; 0xbcdb9
	waitbutton
	farwritetext UnknownText_0x1b0648
	playsound SFX_ITEM
	waitbutton
	end
; 0xbcdc3

UnknownScript_0xbcdc3: ; 0xbcdc3
	waitbutton
	farwritetext UnknownText_0x1b0648
	playsound SFX_GET_EGG_FROM_DAYCARE_LADY
	waitbutton
	end
; 0xbcdcd

UnknownScript_0xbcdcd: ; 0xbcdcd
	faceplayer
	loadfont
	farwritetext UnknownText_0x1b077f
	keeptextopen
	checkitem COIN_CASE
	iftrue UnknownScript_0xbcde0
	farwritetext UnknownText_0x1b079c
	closetext
	loadmovesprites
	end
; 0xbcde0

UnknownScript_0xbcde0: ; 0xbcde0
	farwritetext UnknownText_0x1b07e3

UnknownScript_0xbcde4: ; 0xbcde4
	special Function24b4e
	loadmenudata MenuDataHeader_0xbce54
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0xbcdf7
	if_equal $2, UnknownScript_0xbce1b
	jump UnknownScript_0xbce4d
; 0xbcdf7

UnknownScript_0xbcdf7: ; 0xbcdf7
	checkcoins 9949
	if_equal $0, UnknownScript_0xbce46
	checkmoney $0, 1000
	if_equal $2, UnknownScript_0xbce3f
	givecoins 50
	takemoney $0, 1000
	waitbutton
	playsound SFX_TRANSACTION
	farwritetext UnknownText_0x1b0830
	closetext
	jump UnknownScript_0xbcde4
; 0xbce1b

UnknownScript_0xbce1b: ; 0xbce1b
	checkcoins 9499
	if_equal $0, UnknownScript_0xbce46
	checkmoney $0, 10000
	if_equal $2, UnknownScript_0xbce3f
	givecoins 500
	takemoney $0, 10000
	waitbutton
	playsound SFX_TRANSACTION
	farwritetext UnknownText_0x1b084f
	closetext
	jump UnknownScript_0xbcde4
; 0xbce3f

UnknownScript_0xbce3f: ; 0xbce3f
	farwritetext UnknownText_0x1b086f
	closetext
	loadmovesprites
	end
; 0xbce46

UnknownScript_0xbce46: ; 0xbce46
	farwritetext UnknownText_0x1b088c
	closetext
	loadmovesprites
	end
; 0xbce4d

UnknownScript_0xbce4d: ; 0xbce4d
	farwritetext UnknownText_0x1b08ad
	closetext
	loadmovesprites
	end
; 0xbce54


MenuDataHeader_0xbce54: ; 0xbce54
	db $40 ; flags
	db 04, 00 ; start coords
	db 11, 15 ; end coords
	dw MenuData2_0xbce5c
	db 1 ; default option
; 0xbce5c

MenuData2_0xbce5c: ; 0xbce5c
	db $80 ; flags
	db 3 ; items
	db " 50 :  ¥1000@"
	db "500 : ¥10000@"
	db "CANCEL@"
; 0xbce7f


HappinessCheckScript:
	faceplayer
	loadfont
	special Function718d
	if_less_than 50, .Unhappy
	if_less_than 150, .KindaHappy
	farwritetext HappinessText3
	closetext
	loadmovesprites
	end

.KindaHappy
	farwritetext HappinessText2
	closetext
	loadmovesprites
	end

.Unhappy
	farwritetext HappinessText1
	closetext
	loadmovesprites
	end

MovementData_0xbcea1: ; bcea1
	step_right
	step_down
	turn_head_up
	step_end
; bcea5
