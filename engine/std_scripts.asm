StdScripts:: ; bc000
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
	dbw BANK(StrengthBoulder), StrengthBoulder
	dbw BANK(SmashRock), SmashRock
	dbw BANK(PokeCenterSignScript), PokeCenterSignScript
	dbw BANK(MartSignScript), MartSignScript
	dbw BANK(UnknownScript_0xbc23e), UnknownScript_0xbc23e
	dbw BANK(UnknownScript_0xbc242), UnknownScript_0xbc242
	dbw BANK(ElevatorButtonScript), ElevatorButtonScript
	dbw BANK(UnknownScript_0xbc1c8), UnknownScript_0xbc1c8
	dbw BANK(UnknownScript_0xbc25c), UnknownScript_0xbc25c
	dbw BANK(UnknownScript_0xbc274), UnknownScript_0xbc274
	dbw BANK(UnknownScript_0xbc3db), UnknownScript_0xbc3db
	dbw BANK(UnknownScript_0xbc574), UnknownScript_0xbc574
	dbw BANK(UnknownScript_0xbc62d), UnknownScript_0xbc62d
	dbw BANK(UnknownScript_0xbc6e6), UnknownScript_0xbc6e6
	dbw BANK(UnknownScript_0xbc6f0), UnknownScript_0xbc6f0
	dbw BANK(UnknownScript_0xbc7ce), UnknownScript_0xbc7ce
	dbw BANK(UnknownScript_0xbc8ac), UnknownScript_0xbc8ac
	dbw BANK(UnknownScript_0xbc98a), UnknownScript_0xbc98a
	dbw BANK(UnknownScript_0xbca47), UnknownScript_0xbca47
	dbw BANK(UnknownScript_0xbca8f), UnknownScript_0xbca8f
	dbw BANK(UnknownScript_0xbcb0a), UnknownScript_0xbcb0a
	dbw BANK(UnknownScript_0xbcb35), UnknownScript_0xbcb35
	dbw BANK(UnknownScript_0xbcb7f), UnknownScript_0xbcb7f
	dbw BANK(UnknownScript_0xbcbc9), UnknownScript_0xbcbc9
	dbw BANK(UnknownScript_0xbcbd3), UnknownScript_0xbcbd3
	dbw BANK(UnknownScript_0xbcc2d), UnknownScript_0xbcc2d
	dbw BANK(UnknownScript_0xbcc87), UnknownScript_0xbcc87
	dbw BANK(UnknownScript_0xbcce1), UnknownScript_0xbcce1
	dbw BANK(UnknownScript_0xbcd30), UnknownScript_0xbcd30
	dbw BANK(UnknownScript_0xbcd5a), UnknownScript_0xbcd5a
	dbw BANK(UnknownScript_0xbcd93), UnknownScript_0xbcd93
	dbw BANK(UnknownScript_0xbcda0), UnknownScript_0xbcda0
	dbw BANK(UnknownScript_0xbcdaa), UnknownScript_0xbcdaa
	dbw BANK(UnknownScript_0xbcdb9), UnknownScript_0xbcdb9
	dbw BANK(UnknownScript_0xbcdc3), UnknownScript_0xbcdc3
	dbw BANK(UnknownScript_0xbc1a9), UnknownScript_0xbc1a9
	dbw BANK(UnknownScript_0xbcdcd), UnknownScript_0xbcdcd
	dbw BANK(UnknownScript_0xbce7f), UnknownScript_0xbce7f
; bc09c

PokeCenterNurseScript: ; bc09c
; Talking to a nurse in a Pokemon Center

	loadfont
; The nurse has different text for:
; Morn
	checkmorn
	iftrue .morn
; Day
	checkday
	iftrue .day
; Nite
	checknite
	iftrue .nite
; If somehow it's not a time of day at all, we skip the introduction
	jump .heal

.morn
; Different text if we're in the com center
	checkevent $032a
	iftrue .morn_comcenter
; Good morning! Welcome to ...
	farwritetext UnknownText_0x1b0000
	keeptextopen
	jump .heal
.morn_comcenter
; Good morning! This is the ...
	farwritetext UnknownText_0x1b008a
	keeptextopen
	jump .heal

.day
; Different text if we're in the com center
	checkevent $032a
	iftrue .day_comcenter
; Hello! Welcome to ...
	farwritetext UnknownText_0x1b002b
	keeptextopen
	jump .heal
.day_comcenter
; Hello! This is the ...
	farwritetext UnknownText_0x1b00d6
	keeptextopen
	jump .heal

.nite
; Different text if we're in the com center
	checkevent $032a
	iftrue .nite_comcenter
; Good evening! You're out late. ...
	farwritetext UnknownText_0x1b004f
	keeptextopen
	jump .heal
.nite_comcenter
; Good to see you working so late. ...
	farwritetext UnknownText_0x1b011b
	keeptextopen
	jump .heal

.heal
; If we come back, don't welcome us to the com center again
	clearevent $032a
; Ask if you want to heal
	farwritetext UnknownText_0x1b017a
	yesorno
	iffalse .end
; Go ahead and heal
	farwritetext UnknownText_0x1b01bd
	pause 20
	special Function1060a2
; Turn to the machine
	spriteface $fe, $2
	pause 10
	special Functionc658
	playmusic MUSIC_NONE
	writebyte $0
	special Function12324
	pause 30
	special RestartMapMusic
	spriteface $fe, $0
	pause 10
; Has Elm already phoned you about Pokerus?
	checkphonecall
	iftrue .done
; Has Pokerus already been found in the Pokecenter?
	checkflag $000d
	iftrue .done
; Check for Pokerus
	special SpecialCheckPokerus ; SPECIAL_CHECKPOKERUS
	iftrue .pokerus
.done
; Thank you for waiting. ...
	farwritetext UnknownText_0x1b01d7
	pause 20
.end
; We hope to see you again.
	farwritetext UnknownText_0x1b020b
; Curtsy
	spriteface $fe, $1
	pause 10
	spriteface $fe, $0
	pause 10
; And we're out
	closetext
	loadmovesprites
	end

.pokerus
; Different text for com center (excludes 'in a Pokemon Center')
; Since flag $32a is cleared when healing,
; this text is never actually seen
	checkevent $032a
	iftrue .pokerus_comcenter
; Your Pokemon appear to be infected ...
	farwritetext UnknownText_0x1b0241
	closetext
	loadmovesprites
	jump .endpokerus
.pokerus_comcenter
; Your Pokemon appear to be infected ...
	farwritetext UnknownText_0x1b02d6
	closetext
	loadmovesprites
.endpokerus
; Don't tell us about Pokerus again
	setflag $000d
; Trigger Elm's Pokerus phone call
	specialphonecall $0001
	end
; bc162

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

UnknownScript_0xbc1a9: ; 0xbc1a9
	loadfont
	special Function1559a
	loadmovesprites
	end
; 0xbc1af

ElevatorButtonScript:
	playsound SFX_READ_TEXT_2
	pause 15
	playsound SFX_ELEVATOR_END
	end

StrengthBoulder:
	farjump AskStrengthScript

SmashRock:
	farjump AskRockSmashScript

PokeCenterSignScript:
	farjumptext PokeCenterSignText

MartSignScript
	farjumptext MartSignText

UnknownScript_0xbc1c8: ; 0xbc1c8
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

UnknownScript_0xbc23e: ; 0xbc23e
	clearevent $06cd
	end
; 0xbc242

UnknownScript_0xbc242: ; 0xbc242
	setflag $0013
	setevent $06cf
	setevent $06d1
	clearevent $06ce
	clearevent $0025
	setevent $0756
	specialphonecall $0004
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end
; 0xbc25c

UnknownScript_0xbc25c: ; 0xbc25c
	special WhiteBGMap
	scall UnknownScript_0xbc380
	setevent $0747
	clearevent $0748
	setevent $02d2
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, MovementData_0xbcea1

UnknownScript_0xbc274: ; bc274
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
; 0xbc3db

UnknownScript_0xbc3db: ; 0xbc3db
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
	setflag $000e
	setflag $0017
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
; 0xbc574

UnknownScript_0xbc574: ; 0xbc574
	special RandomPhoneMon
	checkcode $17
	if_equal $5, UnknownScript_0xbc5c9
	if_equal $7, UnknownScript_0xbc5ce
	if_equal $b, UnknownScript_0xbc5d3
	if_equal $d, UnknownScript_0xbc5d8
	if_equal $f, UnknownScript_0xbc5dd
	if_equal $10, UnknownScript_0xbc5e2
	if_equal $11, UnknownScript_0xbc5e7
	if_equal $13, UnknownScript_0xbc5ec
	if_equal $14, UnknownScript_0xbc5f1
	if_equal $16, UnknownScript_0xbc5f6
	if_equal $17, UnknownScript_0xbc5fb
	if_equal $18, UnknownScript_0xbc600
	if_equal $1b, UnknownScript_0xbc605
	if_equal $1c, UnknownScript_0xbc60a
	if_equal $1d, UnknownScript_0xbc60f
	if_equal $1e, UnknownScript_0xbc614
	if_equal $20, UnknownScript_0xbc619
	if_equal $21, UnknownScript_0xbc61e
	if_equal $22, UnknownScript_0xbc623
	if_equal $23, UnknownScript_0xbc628

UnknownScript_0xbc5c9: ; bc5c9
	farwritetext UnknownText_0x1b09fe
	end
; 0xbc5ce

UnknownScript_0xbc5ce: ; 0xbc5ce
	farwritetext UnknownText_0x1b0d9f
	end
; 0xbc5d3

UnknownScript_0xbc5d3: ; 0xbc5d3
	farwritetext UnknownText_0x1b102e
	end
; 0xbc5d8

UnknownScript_0xbc5d8: ; 0xbc5d8
	farwritetext UnknownText_0x1b142d
	end
; 0xbc5dd

UnknownScript_0xbc5dd: ; 0xbc5dd
	farwritetext UnknownText_0x1b1800
	end
; 0xbc5e2

UnknownScript_0xbc5e2: ; 0xbc5e2
	farwritetext UnknownText_0x1b1a71
	end
; 0xbc5e7

UnknownScript_0xbc5e7: ; 0xbc5e7
	farwritetext UnknownText_0x1b1cd5
	end
; 0xbc5ec

UnknownScript_0xbc5ec: ; 0xbc5ec
	farwritetext UnknownText_0xa4000
	end
; 0xbc5f1

UnknownScript_0xbc5f1: ; 0xbc5f1
	farwritetext UnknownText_0xa41c0
	end
; 0xbc5f6

UnknownScript_0xbc5f6: ; 0xbc5f6
	farwritetext UnknownText_0xa4642
	end
; 0xbc5fb

UnknownScript_0xbc5fb: ; 0xbc5fb
	farwritetext UnknownText_0xa4829
	end
; 0xbc600

UnknownScript_0xbc600: ; 0xbc600
	farwritetext UnknownText_0xa4a31
	end
; 0xbc605

UnknownScript_0xbc605: ; 0xbc605
	farwritetext UnknownText_0xa4ed4
	end
; 0xbc60a

UnknownScript_0xbc60a: ; 0xbc60a
	farwritetext UnknownText_0xa50d5
	end
; 0xbc60f

UnknownScript_0xbc60f: ; 0xbc60f
	farwritetext UnknownText_0xa52e2
	end
; 0xbc614

UnknownScript_0xbc614: ; 0xbc614
	farwritetext UnknownText_0xa5545
	end
; 0xbc619

UnknownScript_0xbc619: ; 0xbc619
	farwritetext UnknownText_0xa5937
	end
; 0xbc61e

UnknownScript_0xbc61e: ; 0xbc61e
	farwritetext UnknownText_0xa5bc4
	end
; 0xbc623

UnknownScript_0xbc623: ; 0xbc623
	farwritetext UnknownText_0xa5dc6
	end
; 0xbc628

UnknownScript_0xbc628: ; 0xbc628
	farwritetext UnknownText_0xa600c
	end
; 0xbc62d

UnknownScript_0xbc62d: ; 0xbc62d
	special RandomPhoneMon
	checkcode $17
	if_equal $5, UnknownScript_0xbc682
	if_equal $7, UnknownScript_0xbc687
	if_equal $b, UnknownScript_0xbc68c
	if_equal $d, UnknownScript_0xbc691
	if_equal $f, UnknownScript_0xbc696
	if_equal $10, UnknownScript_0xbc69b
	if_equal $11, UnknownScript_0xbc6a0
	if_equal $13, UnknownScript_0xbc6a5
	if_equal $14, UnknownScript_0xbc6aa
	if_equal $16, UnknownScript_0xbc6af
	if_equal $17, UnknownScript_0xbc6b4
	if_equal $18, UnknownScript_0xbc6b9
	if_equal $1b, UnknownScript_0xbc6be
	if_equal $1c, UnknownScript_0xbc6c3
	if_equal $1d, UnknownScript_0xbc6c8
	if_equal $1e, UnknownScript_0xbc6cd
	if_equal $20, UnknownScript_0xbc6d2
	if_equal $21, UnknownScript_0xbc6d7
	if_equal $22, UnknownScript_0xbc6dc
	if_equal $23, UnknownScript_0xbc6e1

UnknownScript_0xbc682: ; bc682
	farwritetext UnknownText_0x1b0a82
	end
; 0xbc687

UnknownScript_0xbc687: ; 0xbc687
	farwritetext UnknownText_0x1b0e2c
	end
; 0xbc68c

UnknownScript_0xbc68c: ; 0xbc68c
	farwritetext UnknownText_0x1b10d3
	end
; 0xbc691

UnknownScript_0xbc691: ; 0xbc691
	farwritetext UnknownText_0x1b14e4
	end
; 0xbc696

UnknownScript_0xbc696: ; 0xbc696
	farwritetext UnknownText_0x1b187b
	end
; 0xbc69b

UnknownScript_0xbc69b: ; 0xbc69b
	farwritetext UnknownText_0x1b1b1d
	end
; 0xbc6a0

UnknownScript_0xbc6a0: ; 0xbc6a0
	farwritetext UnknownText_0x1b1d85
	end
; 0xbc6a5

UnknownScript_0xbc6a5: ; 0xbc6a5
	farwritetext UnknownText_0xa40a9
	end
; 0xbc6aa

UnknownScript_0xbc6aa: ; 0xbc6aa
	farwritetext UnknownText_0xa426a
	end
; 0xbc6af

UnknownScript_0xbc6af: ; 0xbc6af
	farwritetext UnknownText_0xa470b
	end
; 0xbc6b4

UnknownScript_0xbc6b4: ; 0xbc6b4
	farwritetext UnknownText_0xa48fc
	end
; 0xbc6b9

UnknownScript_0xbc6b9: ; 0xbc6b9
	farwritetext UnknownText_0xa4b03
	end
; 0xbc6be

UnknownScript_0xbc6be: ; 0xbc6be
	farwritetext UnknownText_0xa4fc8
	end
; 0xbc6c3

UnknownScript_0xbc6c3: ; 0xbc6c3
	farwritetext UnknownText_0xa5175
	end
; 0xbc6c8

UnknownScript_0xbc6c8: ; 0xbc6c8
	farwritetext UnknownText_0xa5383
	end
; 0xbc6cd

UnknownScript_0xbc6cd: ; 0xbc6cd
	farwritetext UnknownText_0xa5621
	end
; 0xbc6d2

UnknownScript_0xbc6d2: ; 0xbc6d2
	farwritetext UnknownText_0xa59bc
	end
; 0xbc6d7

UnknownScript_0xbc6d7: ; 0xbc6d7
	farwritetext UnknownText_0xa5c4b
	end
; 0xbc6dc

UnknownScript_0xbc6dc: ; 0xbc6dc
	farwritetext UnknownText_0xa5e63
	end
; 0xbc6e1

UnknownScript_0xbc6e1: ; 0xbc6e1
	farwritetext UnknownText_0xa6076
	end
; 0xbc6e6

UnknownScript_0xbc6e6: ; 0xbc6e6
	farwritetext UnknownText_0x1b09c4
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end
; 0xbc6f0

UnknownScript_0xbc6f0: ; 0xbc6f0
	checkcode $17
	if_equal $5, UnknownScript_0xbc742
	if_equal $7, UnknownScript_0xbc749
	if_equal $b, UnknownScript_0xbc750
	if_equal $d, UnknownScript_0xbc757
	if_equal $f, UnknownScript_0xbc75e
	if_equal $10, UnknownScript_0xbc765
	if_equal $11, UnknownScript_0xbc76c
	if_equal $13, UnknownScript_0xbc773
	if_equal $14, UnknownScript_0xbc77a
	if_equal $16, UnknownScript_0xbc781
	if_equal $17, UnknownScript_0xbc788
	if_equal $18, UnknownScript_0xbc78f
	if_equal $1b, UnknownScript_0xbc796
	if_equal $1c, UnknownScript_0xbc79d
	if_equal $1d, UnknownScript_0xbc7a4
	if_equal $1e, UnknownScript_0xbc7ab
	if_equal $20, UnknownScript_0xbc7b2
	if_equal $21, UnknownScript_0xbc7b9
	if_equal $22, UnknownScript_0xbc7c0
	if_equal $23, UnknownScript_0xbc7c7

UnknownScript_0xbc742:
	farwritetext UnknownText_0x1b0adb
	closetext
	loadmovesprites
	end
; 0xbc749

UnknownScript_0xbc749: ; 0xbc749
	farwritetext UnknownText_0x1b0e89
	closetext
	loadmovesprites
	end
; 0xbc750

UnknownScript_0xbc750: ; 0xbc750
	farwritetext UnknownText_0x1b1136
	closetext
	loadmovesprites
	end
; 0xbc757

UnknownScript_0xbc757: ; 0xbc757
	farwritetext UnknownText_0x1b1553
	closetext
	loadmovesprites
	end
; 0xbc75e

UnknownScript_0xbc75e: ; 0xbc75e
	farwritetext UnknownText_0x1b18d7
	closetext
	loadmovesprites
	end
; 0xbc765

UnknownScript_0xbc765: ; 0xbc765
	farwritetext UnknownText_0x1b1b8e
	closetext
	loadmovesprites
	end
; 0xbc76c

UnknownScript_0xbc76c: ; 0xbc76c
	farwritetext UnknownText_0x1b1db9
	closetext
	loadmovesprites
	end
; 0xbc773

UnknownScript_0xbc773: ; 0xbc773
	farwritetext UnknownText_0xa40f8
	closetext
	loadmovesprites
	end
; 0xbc77a

UnknownScript_0xbc77a: ; 0xbc77a
	farwritetext UnknownText_0xa42ab
	closetext
	loadmovesprites
	end
; 0xbc781

UnknownScript_0xbc781: ; 0xbc781
	farwritetext UnknownText_0xa4730
	closetext
	loadmovesprites
	end
; 0xbc788

UnknownScript_0xbc788: ; 0xbc788
	farwritetext UnknownText_0xa494d
	closetext
	loadmovesprites
	end
; 0xbc78f

UnknownScript_0xbc78f: ; 0xbc78f
	farwritetext UnknownText_0xa4b47
	closetext
	loadmovesprites
	end
; 0xbc796

UnknownScript_0xbc796: ; 0xbc796
	farwritetext UnknownText_0xa502e
	closetext
	loadmovesprites
	end
; 0xbc79d

UnknownScript_0xbc79d: ; 0xbc79d
	farwritetext UnknownText_0xa51ac
	closetext
	loadmovesprites
	end
; 0xbc7a4

UnknownScript_0xbc7a4: ; 0xbc7a4
	farwritetext UnknownText_0xa53de
	closetext
	loadmovesprites
	end
; 0xbc7ab

UnknownScript_0xbc7ab: ; 0xbc7ab
	farwritetext UnknownText_0xa5666
	closetext
	loadmovesprites
	end
; 0xbc7b2

UnknownScript_0xbc7b2: ; 0xbc7b2
	farwritetext UnknownText_0xa5a28
	closetext
	loadmovesprites
	end
; 0xbc7b9

UnknownScript_0xbc7b9: ; 0xbc7b9
	farwritetext UnknownText_0xa5c8e
	closetext
	loadmovesprites
	end
; 0xbc7c0

UnknownScript_0xbc7c0: ; 0xbc7c0
	farwritetext UnknownText_0xa5ea8
	closetext
	loadmovesprites
	end
; 0xbc7c7

UnknownScript_0xbc7c7: ; 0xbc7c7
	farwritetext UnknownText_0xa60b5
	closetext
	loadmovesprites
	end
; 0xbc7ce

UnknownScript_0xbc7ce: ; 0xbc7ce
	checkcode $17
	if_equal $5, UnknownScript_0xbc820
	if_equal $7, UnknownScript_0xbc827
	if_equal $b, UnknownScript_0xbc82e
	if_equal $d, UnknownScript_0xbc835
	if_equal $f, UnknownScript_0xbc83c
	if_equal $10, UnknownScript_0xbc843
	if_equal $11, UnknownScript_0xbc84a
	if_equal $13, UnknownScript_0xbc851
	if_equal $14, UnknownScript_0xbc858
	if_equal $16, UnknownScript_0xbc85f
	if_equal $17, UnknownScript_0xbc866
	if_equal $18, UnknownScript_0xbc86d
	if_equal $1b, UnknownScript_0xbc874
	if_equal $1c, UnknownScript_0xbc87b
	if_equal $1d, UnknownScript_0xbc882
	if_equal $1e, UnknownScript_0xbc889
	if_equal $20, UnknownScript_0xbc890
	if_equal $21, UnknownScript_0xbc897
	if_equal $22, UnknownScript_0xbc89e
	if_equal $23, UnknownScript_0xbc8a5

UnknownScript_0xbc820:
	farwritetext UnknownText_0x1b0afd
	closetext
	loadmovesprites
	end
; 0xbc827

UnknownScript_0xbc827: ; 0xbc827
	farwritetext UnknownText_0x1b0ea2
	closetext
	loadmovesprites
	end
; 0xbc82e

UnknownScript_0xbc82e: ; 0xbc82e
	farwritetext UnknownText_0x1b117b
	closetext
	loadmovesprites
	end
; 0xbc835

UnknownScript_0xbc835: ; 0xbc835
	farwritetext UnknownText_0x1b1584
	closetext
	loadmovesprites
	end
; 0xbc83c

UnknownScript_0xbc83c: ; 0xbc83c
	farwritetext UnknownText_0x1b1908
	closetext
	loadmovesprites
	end
; 0xbc843

UnknownScript_0xbc843: ; 0xbc843
	farwritetext UnknownText_0x1b1bd2
	closetext
	loadmovesprites
	end
; 0xbc84a

UnknownScript_0xbc84a: ; 0xbc84a
	farwritetext UnknownText_0x1b1df4
	closetext
	loadmovesprites
	end
; 0xbc851

UnknownScript_0xbc851: ; 0xbc851
	farwritetext UnknownText_0xa4126
	closetext
	loadmovesprites
	end
; 0xbc858

UnknownScript_0xbc858: ; 0xbc858
	farwritetext UnknownText_0xa42f2
	closetext
	loadmovesprites
	end
; 0xbc85f

UnknownScript_0xbc85f: ; 0xbc85f
	farwritetext UnknownText_0xa4794
	closetext
	loadmovesprites
	end
; 0xbc866

UnknownScript_0xbc866: ; 0xbc866
	farwritetext UnknownText_0xa498a
	closetext
	loadmovesprites
	end
; 0xbc86d

UnknownScript_0xbc86d: ; 0xbc86d
	farwritetext UnknownText_0xa4b87
	closetext
	loadmovesprites
	end
; 0xbc874

UnknownScript_0xbc874: ; 0xbc874
	farwritetext UnknownText_0xa505f
	closetext
	loadmovesprites
	end
; 0xbc87b

UnknownScript_0xbc87b: ; 0xbc87b
	farwritetext UnknownText_0xa51ee
	closetext
	loadmovesprites
	end
; 0xbc882

UnknownScript_0xbc882: ; 0xbc882
	farwritetext UnknownText_0xa5412
	closetext
	loadmovesprites
	end
; 0xbc889

UnknownScript_0xbc889: ; 0xbc889
	farwritetext UnknownText_0xa56b6
	closetext
	loadmovesprites
	end
; 0xbc890

UnknownScript_0xbc890: ; 0xbc890
	farwritetext UnknownText_0xa5a5a
	closetext
	loadmovesprites
	end
; 0xbc897

UnknownScript_0xbc897: ; 0xbc897
	farwritetext UnknownText_0xa5cc5
	closetext
	loadmovesprites
	end
; 0xbc89e

UnknownScript_0xbc89e: ; 0xbc89e
	farwritetext UnknownText_0xa5ed6
	closetext
	loadmovesprites
	end
; 0xbc8a5

UnknownScript_0xbc8a5: ; 0xbc8a5
	farwritetext UnknownText_0xa60e2
	closetext
	loadmovesprites
	end
; 0xbc8ac

UnknownScript_0xbc8ac: ; 0xbc8ac
	checkcode $17
	if_equal $5, UnknownScript_0xbc8fe
	if_equal $7, UnknownScript_0xbc905
	if_equal $b, UnknownScript_0xbc90c
	if_equal $d, UnknownScript_0xbc913
	if_equal $f, UnknownScript_0xbc91a
	if_equal $10, UnknownScript_0xbc921
	if_equal $11, UnknownScript_0xbc928
	if_equal $13, UnknownScript_0xbc92f
	if_equal $14, UnknownScript_0xbc936
	if_equal $16, UnknownScript_0xbc93d
	if_equal $17, UnknownScript_0xbc944
	if_equal $18, UnknownScript_0xbc94b
	if_equal $1b, UnknownScript_0xbc952
	if_equal $1c, UnknownScript_0xbc959
	if_equal $1d, UnknownScript_0xbc960
	if_equal $1e, UnknownScript_0xbc967
	if_equal $20, UnknownScript_0xbc96e
	if_equal $21, UnknownScript_0xbc975
	if_equal $22, UnknownScript_0xbc97c
	if_equal $23, UnknownScript_0xbc983

UnknownScript_0xbc8fe:
	farwritetext UnknownText_0x1b0b42
	closetext
	loadmovesprites
	end
; 0xbc905

UnknownScript_0xbc905: ; 0xbc905
	farwritetext UnknownText_0x1b0ebc
	closetext
	loadmovesprites
	end
; 0xbc90c

UnknownScript_0xbc90c: ; 0xbc90c
	farwritetext UnknownText_0x1b11c4
	closetext
	loadmovesprites
	end
; 0xbc913

UnknownScript_0xbc913: ; 0xbc913
	farwritetext UnknownText_0x1b15b6
	closetext
	loadmovesprites
	end
; 0xbc91a

UnknownScript_0xbc91a: ; 0xbc91a
	farwritetext UnknownText_0x1b1936
	closetext
	loadmovesprites
	end
; 0xbc921

UnknownScript_0xbc921: ; 0xbc921
	farwritetext UnknownText_0x1b1c06
	closetext
	loadmovesprites
	end
; 0xbc928

UnknownScript_0xbc928: ; 0xbc928
	farwritetext UnknownText_0x1b1e50
	closetext
	loadmovesprites
	end
; 0xbc92f

UnknownScript_0xbc92f: ; 0xbc92f
	farwritetext UnknownText_0xa4158
	closetext
	loadmovesprites
	end
; 0xbc936

UnknownScript_0xbc936: ; 0xbc936
	farwritetext UnknownText_0xa434a
	closetext
	loadmovesprites
	end
; 0xbc93d

UnknownScript_0xbc93d: ; 0xbc93d
	farwritetext UnknownText_0xa47eb
	closetext
	loadmovesprites
	end
; 0xbc944

UnknownScript_0xbc944: ; 0xbc944
	farwritetext UnknownText_0xa49bd
	closetext
	loadmovesprites
	end
; 0xbc94b

UnknownScript_0xbc94b: ; 0xbc94b
	farwritetext UnknownText_0xa4bcd
	closetext
	loadmovesprites
	end
; 0xbc952

UnknownScript_0xbc952: ; 0xbc952
	farwritetext UnknownText_0xa508c
	closetext
	loadmovesprites
	end
; 0xbc959

UnknownScript_0xbc959: ; 0xbc959
	farwritetext UnknownText_0xa5216
	closetext
	loadmovesprites
	end
; 0xbc960

UnknownScript_0xbc960: ; 0xbc960
	farwritetext UnknownText_0xa5446
	closetext
	loadmovesprites
	end
; 0xbc967

UnknownScript_0xbc967: ; 0xbc967
	farwritetext UnknownText_0xa56e2
	closetext
	loadmovesprites
	end
; 0xbc96e

UnknownScript_0xbc96e: ; 0xbc96e
	farwritetext UnknownText_0xa5aa6
	closetext
	loadmovesprites
	end
; 0xbc975

UnknownScript_0xbc975: ; 0xbc975
	farwritetext UnknownText_0xa5cfa
	closetext
	loadmovesprites
	end
; 0xbc97c

UnknownScript_0xbc97c: ; 0xbc97c
	farwritetext UnknownText_0xa5f06
	closetext
	loadmovesprites
	end
; 0xbc983

UnknownScript_0xbc983: ; 0xbc983
	farwritetext UnknownText_0xa6144
	closetext
	loadmovesprites
	end
; 0xbc98a

UnknownScript_0xbc98a: ; 0xbc98a
	checkcode $17
	if_equal $5, UnknownScript_0xbc9d0
	if_equal $7, UnknownScript_0xbc9d7
	if_equal $b, UnknownScript_0xbc9de
	if_equal $d, UnknownScript_0xbc9e5
	if_equal $f, UnknownScript_0xbc9ec
	if_equal $10, UnknownScript_0xbc9f3
	if_equal $11, UnknownScript_0xbc9fa
	if_equal $13, UnknownScript_0xbca01
	if_equal $14, UnknownScript_0xbca08
	if_equal $17, UnknownScript_0xbca0f
	if_equal $18, UnknownScript_0xbca16
	if_equal $1b, UnknownScript_0xbca1d
	if_equal $1d, UnknownScript_0xbca24
	if_equal $1e, UnknownScript_0xbca2b
	if_equal $20, UnknownScript_0xbca32
	if_equal $21, UnknownScript_0xbca39
	if_equal $23, UnknownScript_0xbca40

UnknownScript_0xbc9d0:
	farwritetext UnknownText_0x1b0b75
	closetext
	loadmovesprites
	end
; 0xbc9d7

UnknownScript_0xbc9d7: ; 0xbc9d7
	farwritetext UnknownText_0x1b0edc
	closetext
	loadmovesprites
	end
; 0xbc9de

UnknownScript_0xbc9de: ; 0xbc9de
	farwritetext UnknownText_0x1b11fe
	closetext
	loadmovesprites
	end
; 0xbc9e5

UnknownScript_0xbc9e5: ; 0xbc9e5
	farwritetext UnknownText_0x1b15d5
	closetext
	loadmovesprites
	end
; 0xbc9ec

UnknownScript_0xbc9ec: ; 0xbc9ec
	farwritetext UnknownText_0x1b1954
	closetext
	loadmovesprites
	end
; 0xbc9f3

UnknownScript_0xbc9f3: ; 0xbc9f3
	farwritetext UnknownText_0x1b1c32
	closetext
	loadmovesprites
	end
; 0xbc9fa

UnknownScript_0xbc9fa: ; 0xbc9fa
	farwritetext UnknownText_0x1b1e98
	closetext
	loadmovesprites
	end
; 0xbca01

UnknownScript_0xbca01: ; 0xbca01
	farwritetext UnknownText_0xa418d
	closetext
	loadmovesprites
	end
; 0xbca08

UnknownScript_0xbca08: ; 0xbca08
	farwritetext UnknownText_0xa4382
	closetext
	loadmovesprites
	end
; 0xbca0f

UnknownScript_0xbca0f: ; 0xbca0f
	farwritetext UnknownText_0xa49fc
	closetext
	loadmovesprites
	end
; 0xbca16

UnknownScript_0xbca16: ; 0xbca16
	farwritetext UnknownText_0xa4bec
	closetext
	loadmovesprites
	end
; 0xbca1d

UnknownScript_0xbca1d: ; 0xbca1d
	farwritetext UnknownText_0xa50b1
	closetext
	loadmovesprites
	end
; 0xbca24

UnknownScript_0xbca24: ; 0xbca24
	farwritetext UnknownText_0xa548c
	closetext
	loadmovesprites
	end
; 0xbca2b

UnknownScript_0xbca2b: ; 0xbca2b
	farwritetext UnknownText_0xa571e
	closetext
	loadmovesprites
	end
; 0xbca32

UnknownScript_0xbca32: ; 0xbca32
	farwritetext UnknownText_0xa5ada
	closetext
	loadmovesprites
	end
; 0xbca39

UnknownScript_0xbca39: ; 0xbca39
	farwritetext UnknownText_0xa5d1d
	closetext
	loadmovesprites
	end
; 0xbca40

UnknownScript_0xbca40: ; 0xbca40
	farwritetext UnknownText_0xa6175
	closetext
	loadmovesprites
	end
; 0xbca47

UnknownScript_0xbca47: ; 0xbca47
	checkcode $17
	if_equal $d, UnknownScript_0xbca65
	if_equal $10, UnknownScript_0xbca6b
	if_equal $18, UnknownScript_0xbca71
	if_equal $1c, UnknownScript_0xbca77
	if_equal $1d, UnknownScript_0xbca7d
	if_equal $21, UnknownScript_0xbca83
	if_equal $22, UnknownScript_0xbca89

UnknownScript_0xbca65:
	farwritetext UnknownText_0x1b1607
	keeptextopen
	end
; 0xbca6b

UnknownScript_0xbca6b: ; 0xbca6b
	farwritetext UnknownText_0x1b1c57
	keeptextopen
	end
; 0xbca71

UnknownScript_0xbca71: ; 0xbca71
	farwritetext UnknownText_0xa4c24
	keeptextopen
	end
; 0xbca77

UnknownScript_0xbca77: ; 0xbca77
	farwritetext UnknownText_0xa523a
	keeptextopen
	end
; 0xbca7d

UnknownScript_0xbca7d: ; 0xbca7d
	farwritetext UnknownText_0xa54e3
	keeptextopen
	end
; 0xbca83

UnknownScript_0xbca83: ; 0xbca83
	farwritetext UnknownText_0xa5d4d
	keeptextopen
	end
; 0xbca89

UnknownScript_0xbca89: ; 0xbca89
	farwritetext UnknownText_0xa5f37
	keeptextopen
	end
; 0xbca8f

UnknownScript_0xbca8f: ; 0xbca8f
	checkcode $17
	if_equal $7, UnknownScript_0xbcabd
	if_equal $d, UnknownScript_0xbcac4
	if_equal $f, UnknownScript_0xbcacb
	if_equal $10, UnknownScript_0xbcad2
	if_equal $18, UnknownScript_0xbcad9
	if_equal $1c, UnknownScript_0xbcae0
	if_equal $1d, UnknownScript_0xbcae7
	if_equal $20, UnknownScript_0xbcaee
	if_equal $21, UnknownScript_0xbcaf5
	if_equal $22, UnknownScript_0xbcafc
	if_equal $23, UnknownScript_0xbcb03

UnknownScript_0xbcabd:
	farwritetext UnknownText_0x1b0eff
	closetext
	loadmovesprites
	end
; 0xbcac4

UnknownScript_0xbcac4: ; 0xbcac4
	farwritetext UnknownText_0x1b164d
	closetext
	loadmovesprites
	end
; 0xbcacb

UnknownScript_0xbcacb: ; 0xbcacb
	farwritetext UnknownText_0x1b1978
	closetext
	loadmovesprites
	end
; 0xbcad2

UnknownScript_0xbcad2: ; 0xbcad2
	farwritetext UnknownText_0x1b1c91
	closetext
	loadmovesprites
	end
; 0xbcad9

UnknownScript_0xbcad9: ; 0xbcad9
	farwritetext UnknownText_0xa4c47
	closetext
	loadmovesprites
	end
; 0xbcae0

UnknownScript_0xbcae0: ; 0xbcae0
	farwritetext UnknownText_0xa52a0
	closetext
	loadmovesprites
	end
; 0xbcae7

UnknownScript_0xbcae7: ; 0xbcae7
	farwritetext UnknownText_0xa5513
	closetext
	loadmovesprites
	end
; 0xbcaee

UnknownScript_0xbcaee: ; 0xbcaee
	farwritetext UnknownText_0xa5aff
	closetext
	loadmovesprites
	end
; 0xbcaf5

UnknownScript_0xbcaf5: ; 0xbcaf5
	farwritetext UnknownText_0xa5d9a
	closetext
	loadmovesprites
	end
; 0xbcafc

UnknownScript_0xbcafc: ; 0xbcafc
	farwritetext UnknownText_0xa5faa
	closetext
	loadmovesprites
	end
; 0xbcb03

UnknownScript_0xbcb03: ; 0xbcb03
	farwritetext UnknownText_0xa61c9
	closetext
	loadmovesprites
	end
; 0xbcb0a

UnknownScript_0xbcb0a: ; 0xbcb0a
	loadfont
	checkcode $17
	if_equal $7, UnknownScript_0xbcb1d
	if_equal $f, UnknownScript_0xbcb23
	if_equal $20, UnknownScript_0xbcb29
	if_equal $23, UnknownScript_0xbcb2f

UnknownScript_0xbcb1d:
	farwritetext UnknownText_0x1b0f2f
	keeptextopen
	end
; 0xbcb23

UnknownScript_0xbcb23: ; 0xbcb23
	farwritetext UnknownText_0x1b19be
	keeptextopen
	end
; 0xbcb29

UnknownScript_0xbcb29: ; 0xbcb29
	farwritetext UnknownText_0xa5b3f
	keeptextopen
	end
; 0xbcb2f

UnknownScript_0xbcb2f: ; 0xbcb2f
	farwritetext UnknownText_0xa6200
	keeptextopen
	end
; 0xbcb35

UnknownScript_0xbcb35: ; 0xbcb35
	checkcode $17
	if_equal $6, UnknownScript_0xbcb57
	if_equal $c, UnknownScript_0xbcb5c
	if_equal $e, UnknownScript_0xbcb61
	if_equal $12, UnknownScript_0xbcb66
	if_equal $15, UnknownScript_0xbcb6b
	if_equal $1a, UnknownScript_0xbcb70
	if_equal $1f, UnknownScript_0xbcb75
	if_equal $24, UnknownScript_0xbcb7a

UnknownScript_0xbcb57:
	farwritetext UnknownText_0x1b0bb6
	end
; 0xbcb5c

UnknownScript_0xbcb5c: ; 0xbcb5c
	farwritetext UnknownText_0x1b1239
	end
; 0xbcb61

UnknownScript_0xbcb61: ; 0xbcb61
	farwritetext UnknownText_0x1b1690
	end
; 0xbcb66

UnknownScript_0xbcb66: ; 0xbcb66
	farwritetext UnknownText_0x1b1ebe
	end
; 0xbcb6b

UnknownScript_0xbcb6b: ; 0xbcb6b
	farwritetext UnknownText_0xa4405
	end
; 0xbcb70

UnknownScript_0xbcb70: ; 0xbcb70
	farwritetext UnknownText_0xa4c8c
	end
; 0xbcb75

UnknownScript_0xbcb75: ; 0xbcb75
	farwritetext UnknownText_0xa574a
	end
; 0xbcb7a

UnknownScript_0xbcb7a: ; 0xbcb7a
	farwritetext UnknownText_0xa6295
	end
; 0xbcb7f

UnknownScript_0xbcb7f: ; 0xbcb7f
	checkcode $17
	if_equal $6, UnknownScript_0xbcba1
	if_equal $c, UnknownScript_0xbcba6
	if_equal $e, UnknownScript_0xbcbab
	if_equal $12, UnknownScript_0xbcbb0
	if_equal $15, UnknownScript_0xbcbb5
	if_equal $1a, UnknownScript_0xbcbba
	if_equal $1f, UnknownScript_0xbcbbf
	if_equal $24, UnknownScript_0xbcbc4

UnknownScript_0xbcba1:
	farwritetext UnknownText_0x1b0c37
	end
; 0xbcba6

UnknownScript_0xbcba6: ; 0xbcba6
	farwritetext UnknownText_0x1b1314
	end
; 0xbcbab

UnknownScript_0xbcbab: ; 0xbcbab
	farwritetext UnknownText_0x1b1710
	end
; 0xbcbb0

UnknownScript_0xbcbb0: ; 0xbcbb0
	farwritetext UnknownText_0x1b1f4e
	end
; 0xbcbb5

UnknownScript_0xbcbb5: ; 0xbcbb5
	farwritetext UnknownText_0xa44db
	end
; 0xbcbba

UnknownScript_0xbcbba: ; 0xbcbba
	farwritetext UnknownText_0xa4d36
	end
; 0xbcbbf

UnknownScript_0xbcbbf: ; 0xbcbbf
	farwritetext UnknownText_0xa57e3
	end
; 0xbcbc4

UnknownScript_0xbcbc4: ; 0xbcbc4
	farwritetext UnknownText_0xa6316
	end
; 0xbcbc9

UnknownScript_0xbcbc9: ; 0xbcbc9
	farwritetext UnknownText_0x1b09e1
	playsound SFX_REGISTER_PHONE_NUMBER
	waitbutton
	keeptextopen
	end
; 0xbcbd3

UnknownScript_0xbcbd3: ; 0xbcbd3
	checkcode $17
	if_equal $6, UnknownScript_0xbcbf5
	if_equal $c, UnknownScript_0xbcbfc
	if_equal $e, UnknownScript_0xbcc03
	if_equal $12, UnknownScript_0xbcc0a
	if_equal $15, UnknownScript_0xbcc11
	if_equal $1a, UnknownScript_0xbcc18
	if_equal $1f, UnknownScript_0xbcc1f
	if_equal $24, UnknownScript_0xbcc26

UnknownScript_0xbcbf5:
	farwritetext UnknownText_0x1b0c9b
	closetext
	loadmovesprites
	end
; 0xbcbfc

UnknownScript_0xbcbfc: ; 0xbcbfc
	farwritetext UnknownText_0x1b1392
	closetext
	loadmovesprites
	end
; 0xbcc03

UnknownScript_0xbcc03: ; 0xbcc03
	farwritetext UnknownText_0x1b1755
	closetext
	loadmovesprites
	end
; 0xbcc0a

UnknownScript_0xbcc0a: ; 0xbcc0a
	farwritetext UnknownText_0x1b1faa
	closetext
	loadmovesprites
	end
; 0xbcc11

UnknownScript_0xbcc11: ; 0xbcc11
	farwritetext UnknownText_0xa451d
	closetext
	loadmovesprites
	end
; 0xbcc18

UnknownScript_0xbcc18: ; 0xbcc18
	farwritetext UnknownText_0xa4d72
	closetext
	loadmovesprites
	end
; 0xbcc1f

UnknownScript_0xbcc1f: ; 0xbcc1f
	farwritetext UnknownText_0xa5820
	closetext
	loadmovesprites
	end
; 0xbcc26

UnknownScript_0xbcc26: ; 0xbcc26
	farwritetext UnknownText_0xa6359
	closetext
	loadmovesprites
	end
; 0xbcc2d

UnknownScript_0xbcc2d: ; 0xbcc2d
	checkcode $17
	if_equal $6, UnknownScript_0xbcc4f
	if_equal $c, UnknownScript_0xbcc56
	if_equal $e, UnknownScript_0xbcc5d
	if_equal $12, UnknownScript_0xbcc64
	if_equal $15, UnknownScript_0xbcc6b
	if_equal $1a, UnknownScript_0xbcc72
	if_equal $1f, UnknownScript_0xbcc79
	if_equal $24, UnknownScript_0xbcc80

UnknownScript_0xbcc4f:
	farwritetext UnknownText_0x1b0ce0
	closetext
	loadmovesprites
	end
; 0xbcc56

UnknownScript_0xbcc56: ; 0xbcc56
	farwritetext UnknownText_0x1b13af
	closetext
	loadmovesprites
	end
; 0xbcc5d

UnknownScript_0xbcc5d: ; 0xbcc5d
	farwritetext UnknownText_0x1b178a
	closetext
	loadmovesprites
	end
; 0xbcc64

UnknownScript_0xbcc64: ; 0xbcc64
	farwritetext UnknownText_0x1b1fdd
	closetext
	loadmovesprites
	end
; 0xbcc6b

UnknownScript_0xbcc6b: ; 0xbcc6b
	farwritetext UnknownText_0xa4542
	closetext
	loadmovesprites
	end
; 0xbcc72

UnknownScript_0xbcc72: ; 0xbcc72
	farwritetext UnknownText_0xa4dcd
	closetext
	loadmovesprites
	end
; 0xbcc79

UnknownScript_0xbcc79: ; 0xbcc79
	farwritetext UnknownText_0xa5842
	closetext
	loadmovesprites
	end
; 0xbcc80

UnknownScript_0xbcc80: ; 0xbcc80
	farwritetext UnknownText_0xa638c
	closetext
	loadmovesprites
	end
; 0xbcc87

UnknownScript_0xbcc87: ; 0xbcc87
	checkcode $17
	if_equal $6, UnknownScript_0xbcca9
	if_equal $c, UnknownScript_0xbccb0
	if_equal $e, UnknownScript_0xbccb7
	if_equal $12, UnknownScript_0xbccbe
	if_equal $15, UnknownScript_0xbccc5
	if_equal $1a, UnknownScript_0xbcccc
	if_equal $1f, UnknownScript_0xbccd3
	if_equal $24, UnknownScript_0xbccda

UnknownScript_0xbcca9:
	farwritetext UnknownText_0x1b0d0b
	closetext
	loadmovesprites
	end
; 0xbccb0

UnknownScript_0xbccb0: ; 0xbccb0
	farwritetext UnknownText_0x1b13e4
	closetext
	loadmovesprites
	end
; 0xbccb7

UnknownScript_0xbccb7: ; 0xbccb7
	farwritetext UnknownText_0x1b17ba
	closetext
	loadmovesprites
	end
; 0xbccbe

UnknownScript_0xbccbe: ; 0xbccbe
	farwritetext UnknownText_0x1b1ffa
	closetext
	loadmovesprites
	end
; 0xbccc5

UnknownScript_0xbccc5: ; 0xbccc5
	farwritetext UnknownText_0xa4573
	closetext
	loadmovesprites
	end
; 0xbcccc

UnknownScript_0xbcccc: ; 0xbcccc
	farwritetext UnknownText_0xa4e01
	closetext
	loadmovesprites
	end
; 0xbccd3

UnknownScript_0xbccd3: ; 0xbccd3
	farwritetext UnknownText_0xa5881
	closetext
	loadmovesprites
	end
; 0xbccda

UnknownScript_0xbccda: ; 0xbccda
	farwritetext UnknownText_0xa63cc
	closetext
	loadmovesprites
	end
; 0xbcce1

UnknownScript_0xbcce1: ; 0xbcce1
	checkcode $17
	if_equal $c, UnknownScript_0xbccff
	if_equal $e, UnknownScript_0xbcd06
	if_equal $12, UnknownScript_0xbcd0d
	if_equal $15, UnknownScript_0xbcd14
	if_equal $1a, UnknownScript_0xbcd1b
	if_equal $1f, UnknownScript_0xbcd22
	if_equal $24, UnknownScript_0xbcd29

UnknownScript_0xbccff:
	farwritetext UnknownText_0x1b1409
	closetext
	loadmovesprites
	end
; 0xbcd06

UnknownScript_0xbcd06: ; 0xbcd06
	farwritetext UnknownText_0x1b17de
	closetext
	loadmovesprites
	end
; 0xbcd0d

UnknownScript_0xbcd0d: ; 0xbcd0d
	farwritetext UnknownText_0x1b201f
	closetext
	loadmovesprites
	end
; 0xbcd14

UnknownScript_0xbcd14: ; 0xbcd14
	farwritetext UnknownText_0xa4595
	closetext
	loadmovesprites
	end
; 0xbcd1b

UnknownScript_0xbcd1b: ; 0xbcd1b
	farwritetext UnknownText_0xa4e21
	closetext
	loadmovesprites
	end
; 0xbcd22

UnknownScript_0xbcd22: ; 0xbcd22
	farwritetext UnknownText_0xa58a3
	closetext
	loadmovesprites
	end
; 0xbcd29

UnknownScript_0xbcd29: ; 0xbcd29
	farwritetext UnknownText_0xa63f1
	closetext
	loadmovesprites
	end
; 0xbcd30

UnknownScript_0xbcd30: ; 0xbcd30
	checkcode $17
	if_equal $6, UnknownScript_0xbcd42
	if_equal $15, UnknownScript_0xbcd48
	if_equal $1a, UnknownScript_0xbcd4e
	if_equal $1f, UnknownScript_0xbcd54

UnknownScript_0xbcd42:
	farwritetext UnknownText_0x1b0d2c
	keeptextopen
	end
; 0xbcd48

UnknownScript_0xbcd48: ; 0xbcd48
	farwritetext UnknownText_0xa45c9
	keeptextopen
	end
; 0xbcd4e

UnknownScript_0xbcd4e: ; 0xbcd4e
	farwritetext UnknownText_0xa4e4c
	keeptextopen
	end
; 0xbcd54

UnknownScript_0xbcd54: ; 0xbcd54
	farwritetext UnknownText_0xa58d5
	keeptextopen
	end
; 0xbcd5a

UnknownScript_0xbcd5a: ; 0xbcd5a
	checkcode $17
	if_equal $6, UnknownScript_0xbcd70
	if_equal $15, UnknownScript_0xbcd77
	if_equal $1a, UnknownScript_0xbcd7e
	if_equal $1f, UnknownScript_0xbcd85
	if_equal $24, UnknownScript_0xbcd8c

UnknownScript_0xbcd70:
	farwritetext UnknownText_0x1b0d69
	closetext
	loadmovesprites
	end
; 0xbcd77

UnknownScript_0xbcd77: ; 0xbcd77
	farwritetext UnknownText_0xa4603
	closetext
	loadmovesprites
	end
; 0xbcd7e

UnknownScript_0xbcd7e: ; 0xbcd7e
	farwritetext UnknownText_0xa4e8f
	closetext
	loadmovesprites
	end
; 0xbcd85

UnknownScript_0xbcd85: ; 0xbcd85
	farwritetext UnknownText_0xa5914
	closetext
	loadmovesprites
	end
; 0xbcd8c

UnknownScript_0xbcd8c: ; 0xbcd8c
	farwritetext UnknownText_0xa6411
	closetext
	loadmovesprites
	end
; 0xbcd93

UnknownScript_0xbcd93: ; 0xbcd93
	checkcode $17
	if_equal $24, .ok
.ok
	loadfont
	farwritetext UnknownText_0xa6454
	keeptextopen
	end
; 0xbcda0

UnknownScript_0xbcda0: ; 0xbcda0
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	closetext
	loadmovesprites
	end
; 0xbcdaa

UnknownScript_0xbcdaa: ; 0xbcdaa
	mapnametotext $0
	loadfont
	farwritetext UnknownText_0x1b074e
	keeptextopen
	farwritetext UnknownText_0x1b075c
	closetext
	loadmovesprites
	end
; 0xbcdb9

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


UnknownScript_0xbce7f: ; 0xbce7f
	faceplayer
	loadfont
	special Function718d
	if_less_than 50, UnknownScript_0xbce9a
	if_less_than 150, UnknownScript_0xbce93
	farwritetext UnknownText_0x1b092a
	closetext
	loadmovesprites
	end
; 0xbce93

UnknownScript_0xbce93: ; 0xbce93
	farwritetext UnknownText_0x1b0954
	closetext
	loadmovesprites
	end
; 0xbce9a

UnknownScript_0xbce9a: ; 0xbce9a
	farwritetext UnknownText_0x1b0989
	closetext
	loadmovesprites
	end
; 0xbcea1

MovementData_0xbcea1: ; bcea1
	step_right
	step_down
	turn_head_up
	step_end
; bcea5
