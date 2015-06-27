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
	special Functionc658
	playmusic MUSIC_NONE
	writebyte 0
	special Function12324
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
	checkcode $b
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
	clearevent $06cd
	end

RadioTowerRocketsScript:
	setflag $0013
	setevent $06cf
	setevent $06d1
	clearevent $06ce
	clearevent $0025
	setevent $0756
	specialphonecall $0004
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end

BugContestResultsWarpScript:
	special WhiteBGMap
	scall UnknownScript_0xbc380
	setevent $0747
	clearevent $0748
	setevent $02d2
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, MovementData_0xbcea1

BugContestResultsScript:
	clearflag $0011
	clearevent $02d2
	clearevent $0313
	clearevent $0314
	clearevent $0315
	clearevent $0316
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
	checkevent $0308
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
	setevent $0716
	setevent $0717
	setevent $0718
	setevent $0719
	setevent $071a
	setevent $071b
	setevent $071c
	setevent $071d
	setevent $071e
	setevent $071f
	setevent $0720
	setevent $0721
	setevent $0722
	setevent $0723
	setevent $0724
	setevent $0725
	setevent $0726
	setevent $0727
	setevent $0728
	setevent $0729
	setflag $0051
	special PlayMapMusic
	end
; 0xbc31e

UnknownScript_0xbc31e: ; 0xbc31e
	setevent $0000
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
	setevent $0313
	jump UnknownScript_0xbc2b1
; 0xbc35f

UnknownScript_0xbc35f: ; 0xbc35f
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent $0314
	jump UnknownScript_0xbc2b1
; 0xbc36a

UnknownScript_0xbc36a: ; 0xbc36a
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent $0315
	jump UnknownScript_0xbc2b1
; 0xbc375

UnknownScript_0xbc375: ; 0xbc375
	farwritetext UnknownText_0x1b08cc
	keeptextopen
	setevent $0316
	jump UnknownScript_0xbc2a9
; 0xbc380

UnknownScript_0xbc380: ; 0xbc380
	checkevent $0716
	iftrue .skip1
	clearevent $0720
.skip1
	checkevent $0717
	iftrue .skip2
	clearevent $0721
.skip2
	checkevent $0718
	iftrue .skip3
	clearevent $0722
.skip3
	checkevent $0719
	iftrue .skip4
	clearevent $0723
.skip4
	checkevent $071a
	iftrue .skip5
	clearevent $0724
.skip5
	checkevent $071b
	iftrue .skip6
	clearevent $0725
.skip6
	checkevent $071c
	iftrue .skip7
	clearevent $0726
.skip7
	checkevent $071d
	iftrue .skip8
	clearevent $0727
.skip8
	checkevent $071e
	iftrue .skip9
	clearevent $0728
.skip9
	checkevent $071f
	iftrue .skip10
	clearevent $0729
.skip10
	end

InitializeEventsScript:
	setevent $06cb
	setevent $06ce
	setevent $06cd
	setevent $06d0
	setevent $06f3
	setevent $06e9
	setevent $06f4
	setevent $06d5
	setevent $06de
	setevent $06dd
	setevent $06df
	setevent $06c0
	setevent $06e4
	setevent $0025
	setevent $06be
	setevent $06bf
	setevent $06c1
	setevent $06f9
	setevent $06fd
	setevent $06ff
	setevent $0700
	setevent $0702
	setevent $0703
	setevent $0704
	setevent $070d
	setevent $070e
	setevent $070f
	setevent $0710
	setevent $0715
	setevent $0716
	setevent $0717
	setevent $0718
	setevent $0719
	setevent $071a
	setevent $071b
	setevent $071c
	setevent $071d
	setevent $071e
	setevent $071f
	setevent $0720
	setevent $0721
	setevent $0722
	setevent $0723
	setevent $0724
	setevent $0725
	setevent $0726
	setevent $0727
	setevent $0728
	setevent $0729
	setevent $072c
	setevent $072f
	setevent $072d
	setevent $0735
	setevent $0736
	setevent $073c
	setevent $073d
	setevent $0741
	setevent $0742
	setevent $0743
	setevent $0744
	setevent $02a4
	setevent $02af
	setevent $0749
	setevent $06d3
	setevent $074d
	setevent $0712
	setevent $0713
	setevent $0711
	setevent $06d4
	setevent $0304
	setevent $0307
	setevent $06d8
	setevent $06c3
	setevent $06c2
	setevent $06c6
	setevent $075f
	setevent $0731
	setevent $074a
	setevent $0762
	setevent $0738
	setevent $073a
	setevent $073b
	setevent $0733
	setevent $073f
	setevent $078d
	setevent $0766
	setevent $0768
	setevent $0769
	setevent $076a
	setevent $078e
	setevent $078f
	setevent $0790
	setevent $0791
	setevent $0793
	setevent $07a4
	setevent $07a4
	setevent $07a5
	setevent $06ec
	setevent $06ed
	setevent $06f0
	setevent $07a9
	setevent $07aa
	setevent $06c8
	setevent $07ac
	setevent $07ad
	setevent $07b5
	setevent $07b6
	setevent $07c5
	setevent $07b7
	setevent $07b0
	setevent $07af
	setevent $07ae
	setevent $07cf
	setflag ENGINE_ROCKET_SIGNAL_ON_CH20
	setflag ENGINE_ROCKETS_IN_MAHOGANY
	variablesprite $4, $52
	variablesprite $5, $4
	variablesprite $6, $35
	variablesprite $7, $a
	variablesprite $8, $a
	variablesprite $9, $a
	variablesprite $a, $a
	variablesprite $b, $28
	variablesprite $c, $28
	setevent $00fb
	setevent $076d
	setevent $076c
	setevent $076e
	setevent $076f
	setevent $0773
	setevent $0776
	setevent $0777
	setevent $0779
	setevent $0772
	setevent $077b
	setevent $0036
	return

AskNumber1MScript:
	special RandomPhoneMon
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
	checkcode $17
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
