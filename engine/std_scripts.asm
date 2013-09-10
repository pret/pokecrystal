StdScripts: ; bc000
	dbw BANK(PokeCenterNurseScript), PokeCenterNurseScript
	dbw BANK(UnknownScript_0xbc162), UnknownScript_0xbc162
	dbw BANK(UnknownScript_0xbc166), UnknownScript_0xbc166
	dbw BANK(UnknownScript_0xbc16a), UnknownScript_0xbc16a
	dbw BANK(UnknownScript_0xbc16e), UnknownScript_0xbc16e
	dbw BANK(UnknownScript_0xbc172), UnknownScript_0xbc172
	dbw BANK(UnknownScript_0xbc176), UnknownScript_0xbc176
	dbw BANK(UnknownScript_0xbc17a), UnknownScript_0xbc17a
	dbw BANK(UnknownScript_0xbc185), UnknownScript_0xbc185
	dbw BANK(UnknownScript_0xbc189), UnknownScript_0xbc189
	dbw BANK(UnknownScript_0xbc191), UnknownScript_0xbc191
	dbw BANK(UnknownScript_0xbc195), UnknownScript_0xbc195
	dbw BANK(UnknownScript_0xbc19d), UnknownScript_0xbc19d
	dbw BANK(UnknownScript_0xbc1a5), UnknownScript_0xbc1a5
	dbw BANK(UnknownScript_0xbc1b8), UnknownScript_0xbc1b8
	dbw BANK(UnknownScript_0xbc1bc), UnknownScript_0xbc1bc
	dbw BANK(UnknownScript_0xbc1c0), UnknownScript_0xbc1c0
	dbw BANK(UnknownScript_0xbc1c4), UnknownScript_0xbc1c4
	dbw BANK(UnknownScript_0xbc23e), UnknownScript_0xbc23e
	dbw BANK(UnknownScript_0xbc242), UnknownScript_0xbc242
	dbw BANK(UnknownScript_0xbc1af), UnknownScript_0xbc1af
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
	checktime $1
	iftrue .morn
; Day
	checktime $2
	iftrue .day
; Nite
	checktime $4
	iftrue .nite
; If somehow it's not a time of day at all, we skip the introduction
	2jump .heal

.morn
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .morn_comcenter
; Good morning! Welcome to ...
	3writetext BANK(UnknownText_0x1b0000), UnknownText_0x1b0000
	keeptextopen
	2jump .heal
.morn_comcenter
; Good morning! This is the ...
	3writetext BANK(UnknownText_0x1b008a), UnknownText_0x1b008a
	keeptextopen
	2jump .heal

.day
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .day_comcenter
; Hello! Welcome to ...
	3writetext BANK(UnknownText_0x1b002b), UnknownText_0x1b002b
	keeptextopen
	2jump .heal
.day_comcenter
; Hello! This is the ...
	3writetext BANK(UnknownText_0x1b00d6), UnknownText_0x1b00d6
	keeptextopen
	2jump .heal

.nite
; Different text if we're in the com center
	checkbit1 $032a
	iftrue .nite_comcenter
; Good evening! You're out late. ...
	3writetext BANK(UnknownText_0x1b004f), UnknownText_0x1b004f
	keeptextopen
	2jump .heal
.nite_comcenter
; Good to see you working so late. ...
	3writetext BANK(UnknownText_0x1b011b), UnknownText_0x1b011b
	keeptextopen
	2jump .heal

.heal
; If we come back, don't welcome us to the com center again
	clearbit1 $032a
; Ask if you want to heal
	3writetext BANK(UnknownText_0x1b017a), UnknownText_0x1b017a
	yesorno
	iffalse .end
; Go ahead and heal
	3writetext BANK(UnknownText_0x1b01bd), UnknownText_0x1b01bd
	pause 20
	special $009d
; Turn to the machine
	spriteface $fe, $2
	pause 10
	special $001b
	playmusic $0000
	writebyte $0
	special $003e
	pause 30
	special $003d
	spriteface $fe, $0
	pause 10
; Has Elm already phoned you about Pokerus?
	checkphonecall
	iftrue .done
; Has Pokerus already been found in the Pokecenter?
	checkbit2 $000d
	iftrue .done
; Check for Pokerus
	special $004e ; SPECIAL_CHECKPOKERUS
	iftrue .pokerus
.done
; Thank you for waiting. ...
	3writetext BANK(UnknownText_0x1b01d7), UnknownText_0x1b01d7
	pause 20
.end
; We hope to see you again.
	3writetext BANK(UnknownText_0x1b020b), UnknownText_0x1b020b
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
	checkbit1 $032a
	iftrue .pokerus_comcenter
; Your Pokemon appear to be infected ...
	3writetext BANK(UnknownText_0x1b0241), UnknownText_0x1b0241
	closetext
	loadmovesprites
	2jump .endpokerus
.pokerus_comcenter
; Your Pokemon appear to be infected ...
	3writetext BANK(UnknownText_0x1b02d6), UnknownText_0x1b02d6
	closetext
	loadmovesprites
.endpokerus
; Don't tell us about Pokerus again
	setbit2 $000d
; Trigger Elm's Pokerus phone call
	specialphonecall $0001
	end
; bc162

UnknownScript_0xbc162: ; 0xbc162
	3jumptext $6c, $435a
; 0xbc166

UnknownScript_0xbc166: ; 0xbc166
	3jumptext $6c, $4378
; 0xbc16a

UnknownScript_0xbc16a: ; 0xbc16a
	3jumptext $6c, $43a3
; 0xbc16e

UnknownScript_0xbc16e: ; 0xbc16e
	3jumptext $6c, $43d9
; 0xbc172

UnknownScript_0xbc172: ; 0xbc172
	3jumptext $6c, $4448
; 0xbc176

UnknownScript_0xbc176: ; 0xbc176
	3jumptext $6c, $4472
; 0xbc17a

UnknownScript_0xbc17a: ; 0xbc17a
	loadfont
	3writetext $6c, $448d
	closetext
	special $0026
	loadmovesprites
	end
; 0xbc185

UnknownScript_0xbc185: ; 0xbc185
	3jumptext $6c, $44a0
; 0xbc189

UnknownScript_0xbc189: ; 0xbc189
	loadfont
	3writetext $6c, $44be
	closetext
	loadmovesprites
	end
; 0xbc191

UnknownScript_0xbc191: ; 0xbc191
	3jumptext $6c, $44c9
; 0xbc195

UnknownScript_0xbc195: ; 0xbc195
	loadfont
	writebyte $0
	special $0028
	loadmovesprites
	end
; 0xbc19d

UnknownScript_0xbc19d: ; 0xbc19d
	loadfont
	writebyte $4
	special $0028
	loadmovesprites
	end
; 0xbc1a5

UnknownScript_0xbc1a5: ; 0xbc1a5
	3jumptext $6c, $4526
; 0xbc1a9

UnknownScript_0xbc1a9: ; 0xbc1a9
	loadfont
	special $001c
	loadmovesprites
	end
; 0xbc1af

UnknownScript_0xbc1af: ; 0xbc1af
	playsound $0008
	pause 15
	playsound $0027
	end
; 0xbc1b8

UnknownScript_0xbc1b8: ; 0xbc1b8
	3jump BANK(UnknownScript_0xcd4b), UnknownScript_0xcd4b
; 0xbc1bc

UnknownScript_0xbc1bc: ; 0xbc1bc
	3jump BANK(UnknownScript_0xcf5d), UnknownScript_0xcf5d
; 0xbc1c0

UnknownScript_0xbc1c0: ; 0xbc1c0
	3jumptext $6c, $457f
; 0xbc1c4

UnknownScript_0xbc1c4: ; 0xbc1c4
	3jumptext $6c, $459c
; 0xbc1c8

UnknownScript_0xbc1c8: ; 0xbc1c8
	checkcode $b
	if_equal $1, UnknownScript_0xbc1e7
	if_equal $2, UnknownScript_0xbc1ec
	if_equal $3, UnknownScript_0xbc1f1
	if_equal $4, UnknownScript_0xbc1f6
	if_equal $5, UnknownScript_0xbc1fb
	if_equal $6, UnknownScript_0xbc200
	stringtotext UnknownRawText_0xbc205, $0
	end
; 0xbc1e7

UnknownScript_0xbc1e7: ; 0xbc1e7
	stringtotext UnknownRawText_0xbc20c, $0
	end
; 0xbc1ec

UnknownScript_0xbc1ec: ; 0xbc1ec
	stringtotext UnknownRawText_0xbc213, $0
	end
; 0xbc1f1

UnknownScript_0xbc1f1: ; 0xbc1f1
	stringtotext UnknownRawText_0xbc21b, $0
	end
; 0xbc1f6

UnknownScript_0xbc1f6: ; 0xbc1f6
	stringtotext UnknownRawText_0xbc225, $0
	end
; 0xbc1fb

UnknownScript_0xbc1fb: ; 0xbc1fb
	stringtotext UnknownRawText_0xbc22e, $0
	end
; 0xbc200

UnknownScript_0xbc200: ; 0xbc200
	stringtotext UnknownRawText_0xbc235, $0
	end
; 0xbc205

UnknownRawText_0xbc205: ; bc205
	db "SUNDAY@"
; bc20c

UnknownRawText_0xbc20c: ; bc20c
	db "MONDAY@"
; bc213

UnknownRawText_0xbc213: ; bc213
	db "TUESDAY@"
; bc21b

UnknownRawText_0xbc21b: ; bc21b
	db "WEDNESDAY@"
; bc225

UnknownRawText_0xbc225: ; bc225
	db "THURSDAY@"
; bc22e

UnknownRawText_0xbc22e: ; bc22e
	db "FRIDAY@"
; bc235

UnknownRawText_0xbc235: ; bc235
	db "SATURDAY@"
; bc23e

UnknownScript_0xbc23e: ; 0xbc23e
	clearbit1 $06cd
	end
; 0xbc242

UnknownScript_0xbc242: ; 0xbc242
	setbit2 $0013
	setbit1 $06cf
	setbit1 $06d1
	clearbit1 $06ce
	clearbit1 $0025
	setbit1 $0756
	specialphonecall $0004
	domaptrigger GROUP_MAHOGANY_TOWN, MAP_MAHOGANY_TOWN, $1
	end
; 0xbc25c

UnknownScript_0xbc25c: ; 0xbc25c
	special $0034
	2call UnknownScript_0xbc380
	setbit1 $0747
	clearbit1 $0748
	setbit1 $02d2
	warp GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE, $0, $4
	applymovement $0, MovementData_0xbcea1

UnknownScript_0xbc274: ; bc274
	clearbit2 $0011
	clearbit1 $02d2
	clearbit1 $0313
	clearbit1 $0314
	clearbit1 $0315
	clearbit1 $0316
	loadfont
	3writetext $6c, $45bf
	closetext
	special $0014
	RAM2MEM $0
	if_equal $1, UnknownScript_0xbc31e
	if_equal $2, UnknownScript_0xbc332
	if_equal $3, UnknownScript_0xbc343
	3writetext $6c, $4681
	keeptextopen
	waitbutton
	verbosegiveitem BERRY, 1
	iffalse UnknownScript_0xbc375
	3writetext $6c, $46b7
	keeptextopen
	2jump $42b6
; 0xbc2b1

UnknownScript_0xbc2b1: ; 0xbc2b1
	3writetext $6c, $465b
	keeptextopen
	checkbit1 $0308
	iffalse $42c4
	3writetext $6c, $46d9
	closetext
	special $0017
	special $0015
	if_equal $0, $42d4
	if_equal $2, $42d4
	3writetext $6c, $470d
	closetext
	loadmovesprites
	dotrigger $0
	domaptrigger GROUP_ROUTE_35_NATIONAL_PARK_GATE, MAP_ROUTE_35_NATIONAL_PARK_GATE, $0
	setbit1 $0716
	setbit1 $0717
	setbit1 $0718
	setbit1 $0719
	setbit1 $071a
	setbit1 $071b
	setbit1 $071c
	setbit1 $071d
	setbit1 $071e
	setbit1 $071f
	setbit1 $0720
	setbit1 $0721
	setbit1 $0722
	setbit1 $0723
	setbit1 $0724
	setbit1 $0725
	setbit1 $0726
	setbit1 $0727
	setbit1 $0728
	setbit1 $0729
	setbit2 $0051
	special $003c
	end
; 0xbc31e

UnknownScript_0xbc31e: ; 0xbc31e
	setbit1 $0000
	itemtotext SUN_STONE, $1
	3writetext $6c, $4621
	closetext
	verbosegiveitem SUN_STONE, 1
	iffalse UnknownScript_0xbc354
	2jump UnknownScript_0xbc2b1
; 0xbc332

UnknownScript_0xbc332: ; 0xbc332
	itemtotext EVERSTONE, $1
	3writetext $6c, $4621
	closetext
	verbosegiveitem EVERSTONE, 1
	iffalse UnknownScript_0xbc35f
	2jump UnknownScript_0xbc2b1
; 0xbc343

UnknownScript_0xbc343: ; 0xbc343
	itemtotext GOLD_BERRY, $1
	3writetext $6c, $4621
	closetext
	verbosegiveitem GOLD_BERRY, 1
	iffalse UnknownScript_0xbc36a
	2jump UnknownScript_0xbc2b1
; 0xbc354

UnknownScript_0xbc354: ; 0xbc354
	3writetext $6c, $48cc
	keeptextopen
	setbit1 $0313
	2jump UnknownScript_0xbc2b1
; 0xbc35f

UnknownScript_0xbc35f: ; 0xbc35f
	3writetext $6c, $48cc
	keeptextopen
	setbit1 $0314
	2jump UnknownScript_0xbc2b1
; 0xbc36a

UnknownScript_0xbc36a: ; 0xbc36a
	3writetext $6c, $48cc
	keeptextopen
	setbit1 $0315
	2jump UnknownScript_0xbc2b1
; 0xbc375

UnknownScript_0xbc375: ; 0xbc375
	3writetext $6c, $48cc
	keeptextopen
	setbit1 $0316
	2jump $42a9
; 0xbc380

UnknownScript_0xbc380: ; 0xbc380
	checkbit1 $0716
	iftrue .skip1
	clearbit1 $0720
.skip1
	checkbit1 $0717
	iftrue .skip2
	clearbit1 $0721
.skip2
	checkbit1 $0718
	iftrue .skip3
	clearbit1 $0722
.skip3
	checkbit1 $0719
	iftrue .skip4
	clearbit1 $0723
.skip4
	checkbit1 $071a
	iftrue .skip5
	clearbit1 $0724
.skip5
	checkbit1 $071b
	iftrue .skip6
	clearbit1 $0725
.skip6
	checkbit1 $071c
	iftrue .skip7
	clearbit1 $0726
.skip7
	checkbit1 $071d
	iftrue .skip8
	clearbit1 $0727
.skip8
	checkbit1 $071e
	iftrue .skip9
	clearbit1 $0728
.skip9
	checkbit1 $071f
	iftrue .skip10
	clearbit1 $0729
.skip10
	end
; 0xbc3db

UnknownScript_0xbc3db: ; 0xbc3db
	setbit1 $06cb
	setbit1 $06ce
	setbit1 $06cd
	setbit1 $06d0
	setbit1 $06f3
	setbit1 $06e9
	setbit1 $06f4
	setbit1 $06d5
	setbit1 $06de
	setbit1 $06dd
	setbit1 $06df
	setbit1 $06c0
	setbit1 $06e4
	setbit1 $0025
	setbit1 $06be
	setbit1 $06bf
	setbit1 $06c1
	setbit1 $06f9
	setbit1 $06fd
	setbit1 $06ff
	setbit1 $0700
	setbit1 $0702
	setbit1 $0703
	setbit1 $0704
	setbit1 $070d
	setbit1 $070e
	setbit1 $070f
	setbit1 $0710
	setbit1 $0715
	setbit1 $0716
	setbit1 $0717
	setbit1 $0718
	setbit1 $0719
	setbit1 $071a
	setbit1 $071b
	setbit1 $071c
	setbit1 $071d
	setbit1 $071e
	setbit1 $071f
	setbit1 $0720
	setbit1 $0721
	setbit1 $0722
	setbit1 $0723
	setbit1 $0724
	setbit1 $0725
	setbit1 $0726
	setbit1 $0727
	setbit1 $0728
	setbit1 $0729
	setbit1 $072c
	setbit1 $072f
	setbit1 $072d
	setbit1 $0735
	setbit1 $0736
	setbit1 $073c
	setbit1 $073d
	setbit1 $0741
	setbit1 $0742
	setbit1 $0743
	setbit1 $0744
	setbit1 $02a4
	setbit1 $02af
	setbit1 $0749
	setbit1 $06d3
	setbit1 $074d
	setbit1 $0712
	setbit1 $0713
	setbit1 $0711
	setbit1 $06d4
	setbit1 $0304
	setbit1 $0307
	setbit1 $06d8
	setbit1 $06c3
	setbit1 $06c2
	setbit1 $06c6
	setbit1 $075f
	setbit1 $0731
	setbit1 $074a
	setbit1 $0762
	setbit1 $0738
	setbit1 $073a
	setbit1 $073b
	setbit1 $0733
	setbit1 $073f
	setbit1 $078d
	setbit1 $0766
	setbit1 $0768
	setbit1 $0769
	setbit1 $076a
	setbit1 $078e
	setbit1 $078f
	setbit1 $0790
	setbit1 $0791
	setbit1 $0793
	setbit1 $07a4
	setbit1 $07a4
	setbit1 $07a5
	setbit1 $06ec
	setbit1 $06ed
	setbit1 $06f0
	setbit1 $07a9
	setbit1 $07aa
	setbit1 $06c8
	setbit1 $07ac
	setbit1 $07ad
	setbit1 $07b5
	setbit1 $07b6
	setbit1 $07c5
	setbit1 $07b7
	setbit1 $07b0
	setbit1 $07af
	setbit1 $07ae
	setbit1 $07cf
	setbit2 $000e
	setbit2 $0017
	variablesprite $4, $52
	variablesprite $5, $4
	variablesprite $6, $35
	variablesprite $7, $a
	variablesprite $8, $a
	variablesprite $9, $a
	variablesprite $a, $a
	variablesprite $b, $28
	variablesprite $c, $28
	setbit1 $00fb
	setbit1 $076d
	setbit1 $076c
	setbit1 $076e
	setbit1 $076f
	setbit1 $0773
	setbit1 $0776
	setbit1 $0777
	setbit1 $0779
	setbit1 $0772
	setbit1 $077b
	setbit1 $0036
	return
; 0xbc574

UnknownScript_0xbc574: ; 0xbc574
	special $005d
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
	3writetext $6c, $49fe
	end
; 0xbc5ce

UnknownScript_0xbc5ce: ; 0xbc5ce
	3writetext $6c, $4d9f
	end
; 0xbc5d3

UnknownScript_0xbc5d3: ; 0xbc5d3
	3writetext $6c, $502e
	end
; 0xbc5d8

UnknownScript_0xbc5d8: ; 0xbc5d8
	3writetext $6c, $542d
	end
; 0xbc5dd

UnknownScript_0xbc5dd: ; 0xbc5dd
	3writetext $6c, $5800
	end
; 0xbc5e2

UnknownScript_0xbc5e2: ; 0xbc5e2
	3writetext $6c, $5a71
	end
; 0xbc5e7

UnknownScript_0xbc5e7: ; 0xbc5e7
	3writetext $6c, $5cd5
	end
; 0xbc5ec

UnknownScript_0xbc5ec: ; 0xbc5ec
	3writetext $29, $4000
	end
; 0xbc5f1

UnknownScript_0xbc5f1: ; 0xbc5f1
	3writetext $29, $41c0
	end
; 0xbc5f6

UnknownScript_0xbc5f6: ; 0xbc5f6
	3writetext $29, $4642
	end
; 0xbc5fb

UnknownScript_0xbc5fb: ; 0xbc5fb
	3writetext $29, $4829
	end
; 0xbc600

UnknownScript_0xbc600: ; 0xbc600
	3writetext $29, $4a31
	end
; 0xbc605

UnknownScript_0xbc605: ; 0xbc605
	3writetext $29, $4ed4
	end
; 0xbc60a

UnknownScript_0xbc60a: ; 0xbc60a
	3writetext $29, $50d5
	end
; 0xbc60f

UnknownScript_0xbc60f: ; 0xbc60f
	3writetext $29, $52e2
	end
; 0xbc614

UnknownScript_0xbc614: ; 0xbc614
	3writetext $29, $5545
	end
; 0xbc619

UnknownScript_0xbc619: ; 0xbc619
	3writetext $29, $5937
	end
; 0xbc61e

UnknownScript_0xbc61e: ; 0xbc61e
	3writetext $29, $5bc4
	end
; 0xbc623

UnknownScript_0xbc623: ; 0xbc623
	3writetext $29, $5dc6
	end
; 0xbc628

UnknownScript_0xbc628: ; 0xbc628
	3writetext $29, $600c
	end
; 0xbc62d

UnknownScript_0xbc62d: ; 0xbc62d
	special $005d
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
	3writetext $6c, $4a82
	end
; 0xbc687

UnknownScript_0xbc687: ; 0xbc687
	3writetext $6c, $4e2c
	end
; 0xbc68c

UnknownScript_0xbc68c: ; 0xbc68c
	3writetext $6c, $50d3
	end
; 0xbc691

UnknownScript_0xbc691: ; 0xbc691
	3writetext $6c, $54e4
	end
; 0xbc696

UnknownScript_0xbc696: ; 0xbc696
	3writetext $6c, $587b
	end
; 0xbc69b

UnknownScript_0xbc69b: ; 0xbc69b
	3writetext $6c, $5b1d
	end
; 0xbc6a0

UnknownScript_0xbc6a0: ; 0xbc6a0
	3writetext $6c, $5d85
	end
; 0xbc6a5

UnknownScript_0xbc6a5: ; 0xbc6a5
	3writetext $29, $40a9
	end
; 0xbc6aa

UnknownScript_0xbc6aa: ; 0xbc6aa
	3writetext $29, $426a
	end
; 0xbc6af

UnknownScript_0xbc6af: ; 0xbc6af
	3writetext $29, $470b
	end
; 0xbc6b4

UnknownScript_0xbc6b4: ; 0xbc6b4
	3writetext $29, $48fc
	end
; 0xbc6b9

UnknownScript_0xbc6b9: ; 0xbc6b9
	3writetext $29, $4b03
	end
; 0xbc6be

UnknownScript_0xbc6be: ; 0xbc6be
	3writetext $29, $4fc8
	end
; 0xbc6c3

UnknownScript_0xbc6c3: ; 0xbc6c3
	3writetext $29, $5175
	end
; 0xbc6c8

UnknownScript_0xbc6c8: ; 0xbc6c8
	3writetext $29, $5383
	end
; 0xbc6cd

UnknownScript_0xbc6cd: ; 0xbc6cd
	3writetext $29, $5621
	end
; 0xbc6d2

UnknownScript_0xbc6d2: ; 0xbc6d2
	3writetext $29, $59bc
	end
; 0xbc6d7

UnknownScript_0xbc6d7: ; 0xbc6d7
	3writetext $29, $5c4b
	end
; 0xbc6dc

UnknownScript_0xbc6dc: ; 0xbc6dc
	3writetext $29, $5e63
	end
; 0xbc6e1

UnknownScript_0xbc6e1: ; 0xbc6e1
	3writetext $29, $6076
	end
; 0xbc6e6

UnknownScript_0xbc6e6: ; 0xbc6e6
	3writetext $6c, $49c4
	playsound $0093
	waitbutton
	keeptextopen
	end
; 0xbc6f0

UnknownScript_0xbc6f0: ; 0xbc6f0
	checkcode $17
	if_equal $5, $4742
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
	3writetext $6c, $4adb
	closetext
	loadmovesprites
	end
; 0xbc749

UnknownScript_0xbc749: ; 0xbc749
	3writetext $6c, $4e89
	closetext
	loadmovesprites
	end
; 0xbc750

UnknownScript_0xbc750: ; 0xbc750
	3writetext $6c, $5136
	closetext
	loadmovesprites
	end
; 0xbc757

UnknownScript_0xbc757: ; 0xbc757
	3writetext $6c, $5553
	closetext
	loadmovesprites
	end
; 0xbc75e

UnknownScript_0xbc75e: ; 0xbc75e
	3writetext $6c, $58d7
	closetext
	loadmovesprites
	end
; 0xbc765

UnknownScript_0xbc765: ; 0xbc765
	3writetext $6c, $5b8e
	closetext
	loadmovesprites
	end
; 0xbc76c

UnknownScript_0xbc76c: ; 0xbc76c
	3writetext $6c, $5db9
	closetext
	loadmovesprites
	end
; 0xbc773

UnknownScript_0xbc773: ; 0xbc773
	3writetext $29, $40f8
	closetext
	loadmovesprites
	end
; 0xbc77a

UnknownScript_0xbc77a: ; 0xbc77a
	3writetext $29, $42ab
	closetext
	loadmovesprites
	end
; 0xbc781

UnknownScript_0xbc781: ; 0xbc781
	3writetext $29, $4730
	closetext
	loadmovesprites
	end
; 0xbc788

UnknownScript_0xbc788: ; 0xbc788
	3writetext $29, $494d
	closetext
	loadmovesprites
	end
; 0xbc78f

UnknownScript_0xbc78f: ; 0xbc78f
	3writetext $29, $4b47
	closetext
	loadmovesprites
	end
; 0xbc796

UnknownScript_0xbc796: ; 0xbc796
	3writetext $29, $502e
	closetext
	loadmovesprites
	end
; 0xbc79d

UnknownScript_0xbc79d: ; 0xbc79d
	3writetext $29, $51ac
	closetext
	loadmovesprites
	end
; 0xbc7a4

UnknownScript_0xbc7a4: ; 0xbc7a4
	3writetext $29, $53de
	closetext
	loadmovesprites
	end
; 0xbc7ab

UnknownScript_0xbc7ab: ; 0xbc7ab
	3writetext $29, $5666
	closetext
	loadmovesprites
	end
; 0xbc7b2

UnknownScript_0xbc7b2: ; 0xbc7b2
	3writetext $29, $5a28
	closetext
	loadmovesprites
	end
; 0xbc7b9

UnknownScript_0xbc7b9: ; 0xbc7b9
	3writetext $29, $5c8e
	closetext
	loadmovesprites
	end
; 0xbc7c0

UnknownScript_0xbc7c0: ; 0xbc7c0
	3writetext $29, $5ea8
	closetext
	loadmovesprites
	end
; 0xbc7c7

UnknownScript_0xbc7c7: ; 0xbc7c7
	3writetext $29, $60b5
	closetext
	loadmovesprites
	end
; 0xbc7ce

UnknownScript_0xbc7ce: ; 0xbc7ce
	checkcode $17
	if_equal $5, $4820
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
	3writetext $6c, $4afd
	closetext
	loadmovesprites
	end
; 0xbc827

UnknownScript_0xbc827: ; 0xbc827
	3writetext $6c, $4ea2
	closetext
	loadmovesprites
	end
; 0xbc82e

UnknownScript_0xbc82e: ; 0xbc82e
	3writetext $6c, $517b
	closetext
	loadmovesprites
	end
; 0xbc835

UnknownScript_0xbc835: ; 0xbc835
	3writetext $6c, $5584
	closetext
	loadmovesprites
	end
; 0xbc83c

UnknownScript_0xbc83c: ; 0xbc83c
	3writetext $6c, $5908
	closetext
	loadmovesprites
	end
; 0xbc843

UnknownScript_0xbc843: ; 0xbc843
	3writetext $6c, $5bd2
	closetext
	loadmovesprites
	end
; 0xbc84a

UnknownScript_0xbc84a: ; 0xbc84a
	3writetext $6c, $5df4
	closetext
	loadmovesprites
	end
; 0xbc851

UnknownScript_0xbc851: ; 0xbc851
	3writetext $29, $4126
	closetext
	loadmovesprites
	end
; 0xbc858

UnknownScript_0xbc858: ; 0xbc858
	3writetext $29, $42f2
	closetext
	loadmovesprites
	end
; 0xbc85f

UnknownScript_0xbc85f: ; 0xbc85f
	3writetext $29, $4794
	closetext
	loadmovesprites
	end
; 0xbc866

UnknownScript_0xbc866: ; 0xbc866
	3writetext $29, $498a
	closetext
	loadmovesprites
	end
; 0xbc86d

UnknownScript_0xbc86d: ; 0xbc86d
	3writetext $29, $4b87
	closetext
	loadmovesprites
	end
; 0xbc874

UnknownScript_0xbc874: ; 0xbc874
	3writetext $29, $505f
	closetext
	loadmovesprites
	end
; 0xbc87b

UnknownScript_0xbc87b: ; 0xbc87b
	3writetext $29, $51ee
	closetext
	loadmovesprites
	end
; 0xbc882

UnknownScript_0xbc882: ; 0xbc882
	3writetext $29, $5412
	closetext
	loadmovesprites
	end
; 0xbc889

UnknownScript_0xbc889: ; 0xbc889
	3writetext $29, $56b6
	closetext
	loadmovesprites
	end
; 0xbc890

UnknownScript_0xbc890: ; 0xbc890
	3writetext $29, $5a5a
	closetext
	loadmovesprites
	end
; 0xbc897

UnknownScript_0xbc897: ; 0xbc897
	3writetext $29, $5cc5
	closetext
	loadmovesprites
	end
; 0xbc89e

UnknownScript_0xbc89e: ; 0xbc89e
	3writetext $29, $5ed6
	closetext
	loadmovesprites
	end
; 0xbc8a5

UnknownScript_0xbc8a5: ; 0xbc8a5
	3writetext $29, $60e2
	closetext
	loadmovesprites
	end
; 0xbc8ac

UnknownScript_0xbc8ac: ; 0xbc8ac
	checkcode $17
	if_equal $5, $48fe
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
	3writetext $6c, $4b42
	closetext
	loadmovesprites
	end
; 0xbc905

UnknownScript_0xbc905: ; 0xbc905
	3writetext $6c, $4ebc
	closetext
	loadmovesprites
	end
; 0xbc90c

UnknownScript_0xbc90c: ; 0xbc90c
	3writetext $6c, $51c4
	closetext
	loadmovesprites
	end
; 0xbc913

UnknownScript_0xbc913: ; 0xbc913
	3writetext $6c, $55b6
	closetext
	loadmovesprites
	end
; 0xbc91a

UnknownScript_0xbc91a: ; 0xbc91a
	3writetext $6c, $5936
	closetext
	loadmovesprites
	end
; 0xbc921

UnknownScript_0xbc921: ; 0xbc921
	3writetext $6c, $5c06
	closetext
	loadmovesprites
	end
; 0xbc928

UnknownScript_0xbc928: ; 0xbc928
	3writetext $6c, $5e50
	closetext
	loadmovesprites
	end
; 0xbc92f

UnknownScript_0xbc92f: ; 0xbc92f
	3writetext $29, $4158
	closetext
	loadmovesprites
	end
; 0xbc936

UnknownScript_0xbc936: ; 0xbc936
	3writetext $29, $434a
	closetext
	loadmovesprites
	end
; 0xbc93d

UnknownScript_0xbc93d: ; 0xbc93d
	3writetext $29, $47eb
	closetext
	loadmovesprites
	end
; 0xbc944

UnknownScript_0xbc944: ; 0xbc944
	3writetext $29, $49bd
	closetext
	loadmovesprites
	end
; 0xbc94b

UnknownScript_0xbc94b: ; 0xbc94b
	3writetext $29, $4bcd
	closetext
	loadmovesprites
	end
; 0xbc952

UnknownScript_0xbc952: ; 0xbc952
	3writetext $29, $508c
	closetext
	loadmovesprites
	end
; 0xbc959

UnknownScript_0xbc959: ; 0xbc959
	3writetext $29, $5216
	closetext
	loadmovesprites
	end
; 0xbc960

UnknownScript_0xbc960: ; 0xbc960
	3writetext $29, $5446
	closetext
	loadmovesprites
	end
; 0xbc967

UnknownScript_0xbc967: ; 0xbc967
	3writetext $29, $56e2
	closetext
	loadmovesprites
	end
; 0xbc96e

UnknownScript_0xbc96e: ; 0xbc96e
	3writetext $29, $5aa6
	closetext
	loadmovesprites
	end
; 0xbc975

UnknownScript_0xbc975: ; 0xbc975
	3writetext $29, $5cfa
	closetext
	loadmovesprites
	end
; 0xbc97c

UnknownScript_0xbc97c: ; 0xbc97c
	3writetext $29, $5f06
	closetext
	loadmovesprites
	end
; 0xbc983

UnknownScript_0xbc983: ; 0xbc983
	3writetext $29, $6144
	closetext
	loadmovesprites
	end
; 0xbc98a

UnknownScript_0xbc98a: ; 0xbc98a
	checkcode $17
	if_equal $5, $49d0
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
	3writetext $6c, $4b75
	closetext
	loadmovesprites
	end
; 0xbc9d7

UnknownScript_0xbc9d7: ; 0xbc9d7
	3writetext $6c, $4edc
	closetext
	loadmovesprites
	end
; 0xbc9de

UnknownScript_0xbc9de: ; 0xbc9de
	3writetext $6c, $51fe
	closetext
	loadmovesprites
	end
; 0xbc9e5

UnknownScript_0xbc9e5: ; 0xbc9e5
	3writetext $6c, $55d5
	closetext
	loadmovesprites
	end
; 0xbc9ec

UnknownScript_0xbc9ec: ; 0xbc9ec
	3writetext $6c, $5954
	closetext
	loadmovesprites
	end
; 0xbc9f3

UnknownScript_0xbc9f3: ; 0xbc9f3
	3writetext $6c, $5c32
	closetext
	loadmovesprites
	end
; 0xbc9fa

UnknownScript_0xbc9fa: ; 0xbc9fa
	3writetext $6c, $5e98
	closetext
	loadmovesprites
	end
; 0xbca01

UnknownScript_0xbca01: ; 0xbca01
	3writetext $29, $418d
	closetext
	loadmovesprites
	end
; 0xbca08

UnknownScript_0xbca08: ; 0xbca08
	3writetext $29, $4382
	closetext
	loadmovesprites
	end
; 0xbca0f

UnknownScript_0xbca0f: ; 0xbca0f
	3writetext $29, $49fc
	closetext
	loadmovesprites
	end
; 0xbca16

UnknownScript_0xbca16: ; 0xbca16
	3writetext $29, $4bec
	closetext
	loadmovesprites
	end
; 0xbca1d

UnknownScript_0xbca1d: ; 0xbca1d
	3writetext $29, $50b1
	closetext
	loadmovesprites
	end
; 0xbca24

UnknownScript_0xbca24: ; 0xbca24
	3writetext $29, $548c
	closetext
	loadmovesprites
	end
; 0xbca2b

UnknownScript_0xbca2b: ; 0xbca2b
	3writetext $29, $571e
	closetext
	loadmovesprites
	end
; 0xbca32

UnknownScript_0xbca32: ; 0xbca32
	3writetext $29, $5ada
	closetext
	loadmovesprites
	end
; 0xbca39

UnknownScript_0xbca39: ; 0xbca39
	3writetext $29, $5d1d
	closetext
	loadmovesprites
	end
; 0xbca40

UnknownScript_0xbca40: ; 0xbca40
	3writetext $29, $6175
	closetext
	loadmovesprites
	end
; 0xbca47

UnknownScript_0xbca47: ; 0xbca47
	checkcode $17
	if_equal $d, $4a65
	if_equal $10, UnknownScript_0xbca6b
	if_equal $18, UnknownScript_0xbca71
	if_equal $1c, UnknownScript_0xbca77
	if_equal $1d, UnknownScript_0xbca7d
	if_equal $21, UnknownScript_0xbca83
	if_equal $22, UnknownScript_0xbca89
	3writetext $6c, $5607
	keeptextopen
	end
; 0xbca6b

UnknownScript_0xbca6b: ; 0xbca6b
	3writetext $6c, $5c57
	keeptextopen
	end
; 0xbca71

UnknownScript_0xbca71: ; 0xbca71
	3writetext $29, $4c24
	keeptextopen
	end
; 0xbca77

UnknownScript_0xbca77: ; 0xbca77
	3writetext $29, $523a
	keeptextopen
	end
; 0xbca7d

UnknownScript_0xbca7d: ; 0xbca7d
	3writetext $29, $54e3
	keeptextopen
	end
; 0xbca83

UnknownScript_0xbca83: ; 0xbca83
	3writetext $29, $5d4d
	keeptextopen
	end
; 0xbca89

UnknownScript_0xbca89: ; 0xbca89
	3writetext $29, $5f37
	keeptextopen
	end
; 0xbca8f

UnknownScript_0xbca8f: ; 0xbca8f
	checkcode $17
	if_equal $7, $4abd
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
	3writetext $6c, $4eff
	closetext
	loadmovesprites
	end
; 0xbcac4

UnknownScript_0xbcac4: ; 0xbcac4
	3writetext $6c, $564d
	closetext
	loadmovesprites
	end
; 0xbcacb

UnknownScript_0xbcacb: ; 0xbcacb
	3writetext $6c, $5978
	closetext
	loadmovesprites
	end
; 0xbcad2

UnknownScript_0xbcad2: ; 0xbcad2
	3writetext $6c, $5c91
	closetext
	loadmovesprites
	end
; 0xbcad9

UnknownScript_0xbcad9: ; 0xbcad9
	3writetext $29, $4c47
	closetext
	loadmovesprites
	end
; 0xbcae0

UnknownScript_0xbcae0: ; 0xbcae0
	3writetext $29, $52a0
	closetext
	loadmovesprites
	end
; 0xbcae7

UnknownScript_0xbcae7: ; 0xbcae7
	3writetext $29, $5513
	closetext
	loadmovesprites
	end
; 0xbcaee

UnknownScript_0xbcaee: ; 0xbcaee
	3writetext $29, $5aff
	closetext
	loadmovesprites
	end
; 0xbcaf5

UnknownScript_0xbcaf5: ; 0xbcaf5
	3writetext $29, $5d9a
	closetext
	loadmovesprites
	end
; 0xbcafc

UnknownScript_0xbcafc: ; 0xbcafc
	3writetext $29, $5faa
	closetext
	loadmovesprites
	end
; 0xbcb03

UnknownScript_0xbcb03: ; 0xbcb03
	3writetext $29, $61c9
	closetext
	loadmovesprites
	end
; 0xbcb0a

UnknownScript_0xbcb0a: ; 0xbcb0a
	loadfont
	checkcode $17
	if_equal $7, $4b1d
	if_equal $f, UnknownScript_0xbcb23
	if_equal $20, UnknownScript_0xbcb29
	if_equal $23, UnknownScript_0xbcb2f
	3writetext $6c, $4f2f
	keeptextopen
	end
; 0xbcb23

UnknownScript_0xbcb23: ; 0xbcb23
	3writetext $6c, $59be
	keeptextopen
	end
; 0xbcb29

UnknownScript_0xbcb29: ; 0xbcb29
	3writetext $29, $5b3f
	keeptextopen
	end
; 0xbcb2f

UnknownScript_0xbcb2f: ; 0xbcb2f
	3writetext $29, $6200
	keeptextopen
	end
; 0xbcb35

UnknownScript_0xbcb35: ; 0xbcb35
	checkcode $17
	if_equal $6, $4b57
	if_equal $c, UnknownScript_0xbcb5c
	if_equal $e, UnknownScript_0xbcb61
	if_equal $12, UnknownScript_0xbcb66
	if_equal $15, UnknownScript_0xbcb6b
	if_equal $1a, UnknownScript_0xbcb70
	if_equal $1f, UnknownScript_0xbcb75
	if_equal $24, UnknownScript_0xbcb7a
	3writetext $6c, $4bb6
	end
; 0xbcb5c

UnknownScript_0xbcb5c: ; 0xbcb5c
	3writetext $6c, $5239
	end
; 0xbcb61

UnknownScript_0xbcb61: ; 0xbcb61
	3writetext $6c, $5690
	end
; 0xbcb66

UnknownScript_0xbcb66: ; 0xbcb66
	3writetext $6c, $5ebe
	end
; 0xbcb6b

UnknownScript_0xbcb6b: ; 0xbcb6b
	3writetext $29, $4405
	end
; 0xbcb70

UnknownScript_0xbcb70: ; 0xbcb70
	3writetext $29, $4c8c
	end
; 0xbcb75

UnknownScript_0xbcb75: ; 0xbcb75
	3writetext $29, $574a
	end
; 0xbcb7a

UnknownScript_0xbcb7a: ; 0xbcb7a
	3writetext $29, $6295
	end
; 0xbcb7f

UnknownScript_0xbcb7f: ; 0xbcb7f
	checkcode $17
	if_equal $6, $4ba1
	if_equal $c, UnknownScript_0xbcba6
	if_equal $e, UnknownScript_0xbcbab
	if_equal $12, UnknownScript_0xbcbb0
	if_equal $15, UnknownScript_0xbcbb5
	if_equal $1a, UnknownScript_0xbcbba
	if_equal $1f, UnknownScript_0xbcbbf
	if_equal $24, UnknownScript_0xbcbc4
	3writetext $6c, $4c37
	end
; 0xbcba6

UnknownScript_0xbcba6: ; 0xbcba6
	3writetext $6c, $5314
	end
; 0xbcbab

UnknownScript_0xbcbab: ; 0xbcbab
	3writetext $6c, $5710
	end
; 0xbcbb0

UnknownScript_0xbcbb0: ; 0xbcbb0
	3writetext $6c, $5f4e
	end
; 0xbcbb5

UnknownScript_0xbcbb5: ; 0xbcbb5
	3writetext $29, $44db
	end
; 0xbcbba

UnknownScript_0xbcbba: ; 0xbcbba
	3writetext $29, $4d36
	end
; 0xbcbbf

UnknownScript_0xbcbbf: ; 0xbcbbf
	3writetext $29, $57e3
	end
; 0xbcbc4

UnknownScript_0xbcbc4: ; 0xbcbc4
	3writetext $29, $6316
	end
; 0xbcbc9

UnknownScript_0xbcbc9: ; 0xbcbc9
	3writetext $6c, $49e1
	playsound $0093
	waitbutton
	keeptextopen
	end
; 0xbcbd3

UnknownScript_0xbcbd3: ; 0xbcbd3
	checkcode $17
	if_equal $6, $4bf5
	if_equal $c, UnknownScript_0xbcbfc
	if_equal $e, UnknownScript_0xbcc03
	if_equal $12, UnknownScript_0xbcc0a
	if_equal $15, UnknownScript_0xbcc11
	if_equal $1a, UnknownScript_0xbcc18
	if_equal $1f, UnknownScript_0xbcc1f
	if_equal $24, UnknownScript_0xbcc26
	3writetext $6c, $4c9b
	closetext
	loadmovesprites
	end
; 0xbcbfc

UnknownScript_0xbcbfc: ; 0xbcbfc
	3writetext $6c, $5392
	closetext
	loadmovesprites
	end
; 0xbcc03

UnknownScript_0xbcc03: ; 0xbcc03
	3writetext $6c, $5755
	closetext
	loadmovesprites
	end
; 0xbcc0a

UnknownScript_0xbcc0a: ; 0xbcc0a
	3writetext $6c, $5faa
	closetext
	loadmovesprites
	end
; 0xbcc11

UnknownScript_0xbcc11: ; 0xbcc11
	3writetext $29, $451d
	closetext
	loadmovesprites
	end
; 0xbcc18

UnknownScript_0xbcc18: ; 0xbcc18
	3writetext $29, $4d72
	closetext
	loadmovesprites
	end
; 0xbcc1f

UnknownScript_0xbcc1f: ; 0xbcc1f
	3writetext $29, $5820
	closetext
	loadmovesprites
	end
; 0xbcc26

UnknownScript_0xbcc26: ; 0xbcc26
	3writetext $29, $6359
	closetext
	loadmovesprites
	end
; 0xbcc2d

UnknownScript_0xbcc2d: ; 0xbcc2d
	checkcode $17
	if_equal $6, $4c4f
	if_equal $c, UnknownScript_0xbcc56
	if_equal $e, UnknownScript_0xbcc5d
	if_equal $12, UnknownScript_0xbcc64
	if_equal $15, UnknownScript_0xbcc6b
	if_equal $1a, UnknownScript_0xbcc72
	if_equal $1f, UnknownScript_0xbcc79
	if_equal $24, UnknownScript_0xbcc80
	3writetext $6c, $4ce0
	closetext
	loadmovesprites
	end
; 0xbcc56

UnknownScript_0xbcc56: ; 0xbcc56
	3writetext $6c, $53af
	closetext
	loadmovesprites
	end
; 0xbcc5d

UnknownScript_0xbcc5d: ; 0xbcc5d
	3writetext $6c, $578a
	closetext
	loadmovesprites
	end
; 0xbcc64

UnknownScript_0xbcc64: ; 0xbcc64
	3writetext $6c, $5fdd
	closetext
	loadmovesprites
	end
; 0xbcc6b

UnknownScript_0xbcc6b: ; 0xbcc6b
	3writetext $29, $4542
	closetext
	loadmovesprites
	end
; 0xbcc72

UnknownScript_0xbcc72: ; 0xbcc72
	3writetext $29, $4dcd
	closetext
	loadmovesprites
	end
; 0xbcc79

UnknownScript_0xbcc79: ; 0xbcc79
	3writetext $29, $5842
	closetext
	loadmovesprites
	end
; 0xbcc80

UnknownScript_0xbcc80: ; 0xbcc80
	3writetext $29, $638c
	closetext
	loadmovesprites
	end
; 0xbcc87

UnknownScript_0xbcc87: ; 0xbcc87
	checkcode $17
	if_equal $6, $4ca9
	if_equal $c, UnknownScript_0xbccb0
	if_equal $e, UnknownScript_0xbccb7
	if_equal $12, UnknownScript_0xbccbe
	if_equal $15, UnknownScript_0xbccc5
	if_equal $1a, UnknownScript_0xbcccc
	if_equal $1f, UnknownScript_0xbccd3
	if_equal $24, UnknownScript_0xbccda
	3writetext $6c, $4d0b
	closetext
	loadmovesprites
	end
; 0xbccb0

UnknownScript_0xbccb0: ; 0xbccb0
	3writetext $6c, $53e4
	closetext
	loadmovesprites
	end
; 0xbccb7

UnknownScript_0xbccb7: ; 0xbccb7
	3writetext $6c, $57ba
	closetext
	loadmovesprites
	end
; 0xbccbe

UnknownScript_0xbccbe: ; 0xbccbe
	3writetext $6c, $5ffa
	closetext
	loadmovesprites
	end
; 0xbccc5

UnknownScript_0xbccc5: ; 0xbccc5
	3writetext $29, $4573
	closetext
	loadmovesprites
	end
; 0xbcccc

UnknownScript_0xbcccc: ; 0xbcccc
	3writetext $29, $4e01
	closetext
	loadmovesprites
	end
; 0xbccd3

UnknownScript_0xbccd3: ; 0xbccd3
	3writetext $29, $5881
	closetext
	loadmovesprites
	end
; 0xbccda

UnknownScript_0xbccda: ; 0xbccda
	3writetext $29, $63cc
	closetext
	loadmovesprites
	end
; 0xbcce1

UnknownScript_0xbcce1: ; 0xbcce1
	checkcode $17
	if_equal $c, $4cff
	if_equal $e, UnknownScript_0xbcd06
	if_equal $12, UnknownScript_0xbcd0d
	if_equal $15, UnknownScript_0xbcd14
	if_equal $1a, UnknownScript_0xbcd1b
	if_equal $1f, UnknownScript_0xbcd22
	if_equal $24, UnknownScript_0xbcd29
	3writetext $6c, $5409
	closetext
	loadmovesprites
	end
; 0xbcd06

UnknownScript_0xbcd06: ; 0xbcd06
	3writetext $6c, $57de
	closetext
	loadmovesprites
	end
; 0xbcd0d

UnknownScript_0xbcd0d: ; 0xbcd0d
	3writetext $6c, $601f
	closetext
	loadmovesprites
	end
; 0xbcd14

UnknownScript_0xbcd14: ; 0xbcd14
	3writetext $29, $4595
	closetext
	loadmovesprites
	end
; 0xbcd1b

UnknownScript_0xbcd1b: ; 0xbcd1b
	3writetext $29, $4e21
	closetext
	loadmovesprites
	end
; 0xbcd22

UnknownScript_0xbcd22: ; 0xbcd22
	3writetext $29, $58a3
	closetext
	loadmovesprites
	end
; 0xbcd29

UnknownScript_0xbcd29: ; 0xbcd29
	3writetext $29, $63f1
	closetext
	loadmovesprites
	end
; 0xbcd30

UnknownScript_0xbcd30: ; 0xbcd30
	checkcode $17
	if_equal $6, $4d42
	if_equal $15, UnknownScript_0xbcd48
	if_equal $1a, UnknownScript_0xbcd4e
	if_equal $1f, UnknownScript_0xbcd54
	3writetext $6c, $4d2c
	keeptextopen
	end
; 0xbcd48

UnknownScript_0xbcd48: ; 0xbcd48
	3writetext $29, $45c9
	keeptextopen
	end
; 0xbcd4e

UnknownScript_0xbcd4e: ; 0xbcd4e
	3writetext $29, $4e4c
	keeptextopen
	end
; 0xbcd54

UnknownScript_0xbcd54: ; 0xbcd54
	3writetext $29, $58d5
	keeptextopen
	end
; 0xbcd5a

UnknownScript_0xbcd5a: ; 0xbcd5a
	checkcode $17
	if_equal $6, $4d70
	if_equal $15, UnknownScript_0xbcd77
	if_equal $1a, UnknownScript_0xbcd7e
	if_equal $1f, UnknownScript_0xbcd85
	if_equal $24, UnknownScript_0xbcd8c
	3writetext $6c, $4d69
	closetext
	loadmovesprites
	end
; 0xbcd77

UnknownScript_0xbcd77: ; 0xbcd77
	3writetext $29, $4603
	closetext
	loadmovesprites
	end
; 0xbcd7e

UnknownScript_0xbcd7e: ; 0xbcd7e
	3writetext $29, $4e8f
	closetext
	loadmovesprites
	end
; 0xbcd85

UnknownScript_0xbcd85: ; 0xbcd85
	3writetext $29, $5914
	closetext
	loadmovesprites
	end
; 0xbcd8c

UnknownScript_0xbcd8c: ; 0xbcd8c
	3writetext $29, $6411
	closetext
	loadmovesprites
	end
; 0xbcd93

UnknownScript_0xbcd93: ; 0xbcd93
	checkcode $17
	if_equal $24, $4d99
	loadfont
	3writetext $29, $6454
	keeptextopen
	end
; 0xbcda0

UnknownScript_0xbcda0: ; 0xbcda0
	mapnametotext $0
	loadfont
	3writetext $6c, $474e
	closetext
	loadmovesprites
	end
; 0xbcdaa

UnknownScript_0xbcdaa: ; 0xbcdaa
	mapnametotext $0
	loadfont
	3writetext $6c, $474e
	keeptextopen
	3writetext $6c, $475c
	closetext
	loadmovesprites
	end
; 0xbcdb9

UnknownScript_0xbcdb9: ; 0xbcdb9
	waitbutton
	3writetext $6c, $4648
	playsound $0001
	waitbutton
	end
; 0xbcdc3

UnknownScript_0xbcdc3: ; 0xbcdc3
	waitbutton
	3writetext $6c, $4648
	playsound $0096
	waitbutton
	end
; 0xbcdcd

UnknownScript_0xbcdcd: ; 0xbcdcd
	faceplayer
	loadfont
	3writetext $6c, $477f
	keeptextopen
	checkitem COIN_CASE
	iftrue UnknownScript_0xbcde0
	3writetext $6c, $479c
	closetext
	loadmovesprites
	end
; 0xbcde0

UnknownScript_0xbcde0: ; 0xbcde0
	3writetext $6c, $47e3
	special $0050
	loadmenudata MenuDataHeader_0xbce54
	interpretmenu2
	writebackup
	if_equal $1, UnknownScript_0xbcdf7
	if_equal $2, UnknownScript_0xbce1b
	2jump UnknownScript_0xbce4d
; 0xbcdf7

UnknownScript_0xbcdf7: ; 0xbcdf7
	checkcoins 9949
	if_equal $0, UnknownScript_0xbce46
	checkmoney $0, 1000
	if_equal $2, UnknownScript_0xbce3f
	givecoins 50
	takemoney $0, 1000
	waitbutton
	playsound $0022
	3writetext $6c, $4830
	closetext
	2jump $4de4
; 0xbce1b

UnknownScript_0xbce1b: ; 0xbce1b
	checkcoins 9499
	if_equal $0, UnknownScript_0xbce46
	checkmoney $0, 10000
	if_equal $2, UnknownScript_0xbce3f
	givecoins 500
	takemoney $0, 10000
	waitbutton
	playsound $0022
	3writetext $6c, $484f
	closetext
	2jump $4de4
; 0xbce3f

UnknownScript_0xbce3f: ; 0xbce3f
	3writetext $6c, $486f
	closetext
	loadmovesprites
	end
; 0xbce46

UnknownScript_0xbce46: ; 0xbce46
	3writetext $6c, $488c
	closetext
	loadmovesprites
	end
; 0xbce4d

UnknownScript_0xbce4d: ; 0xbce4d
	3writetext $6c, $48ad
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
	special $0059
	if_greater_than $32, UnknownScript_0xbce9a
	if_greater_than $96, UnknownScript_0xbce93
	3writetext $6c, $492a
	closetext
	loadmovesprites
	end
; 0xbce93

UnknownScript_0xbce93: ; 0xbce93
	3writetext $6c, $4954
	closetext
	loadmovesprites
	end
; 0xbce9a

UnknownScript_0xbce9a: ; 0xbce9a
	3writetext $6c, $4989
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

UnusedPhoneScript: ; 0xbcea5
	3writetext BANK(UnusedPhoneText), UnusedPhoneText
	end

MomPhoneScript: ; 0xbceaa
	checkbit1 $0040
	iftrue .bcec5
	checkbit1 $0041 ; if dude talked to you, then you left home without talking to mom
	iftrue MomPhoneLectureScript
	checkbit1 $001f
	iftrue MomPhoneNoGymQuestScript
	checkbit1 $001a
	iftrue MomPhoneNoPokedexScript
	2jump MomPhoneNoPokemonScript

.bcec5 ; 0xbcec5
	checkbit1 $0007
	iftrue MomPhoneHangUpScript
	3writetext BANK(MomPhoneGreetingText), MomPhoneGreetingText
	keeptextopen
	mapnametotext $0
	checkcode $f
	if_equal $1, UnknownScript_0xbcee7
	if_equal $2, $4f27
	2jump UnknownScript_0xbcf2f

UnknownScript_0xbcedf: ; 0xbcedf
	3writetext $6d, $4021
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcee7: ; 0xbcee7
	checkcode $c
	if_equal GROUP_NEW_BARK_TOWN, .newbark
	if_equal GROUP_CHERRYGROVE_CITY, .cherrygrove
	if_equal GROUP_VIOLET_CITY, .violet
	if_equal GROUP_AZALEA_TOWN, .azalea
	if_equal GROUP_GOLDENROD_CITY, .goldenrod
	3writetext BANK(MomPhoneGenericAreaText), MomPhoneGenericAreaText
	keeptextopen
	2jump UnknownScript_0xbcf37

.newbark ; 0xbcf05
	3writetext BANK(MomPhoneNewBarkText), MomPhoneNewBarkText
	keeptextopen
	2jump UnknownScript_0xbcf37

.cherrygrove ; 0xbcf0d
	3writetext BANK(MomPhoneCherrygroveText), MomPhoneCherrygroveText
	keeptextopen
	2jump UnknownScript_0xbcf37

.violet ; 0xbcf15
	displaylocation $7 ; sprout tower
	3call $3, UnknownScript_0xbcedf
.azalea ; 0xbcf1b
	displaylocation $d ; slowpoke well
	3call $3, UnknownScript_0xbcedf
.goldenrod ; 0xbcf21
	displaylocation $11 ; radio tower
	3call $3, UnknownScript_0xbcedf
	3writetext $6d, $411c
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf2f: ; 0xbcf2f
	3writetext $6d, $4150
	keeptextopen
	2jump UnknownScript_0xbcf37

UnknownScript_0xbcf37: ; 0xbcf37
	checkbit2 $0008
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
	3writetext $6d, $41a7
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf63: ; 0xbcf63
	3writetext $6d, $41ea
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf6e: ; 0xbcf6e
	3writetext $6d, $420d
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

UnknownScript_0xbcf79: ; 0xbcf79
	readmoney $1, $0
	3writetext $6d, $4249
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

MomPhoneSaveMoneyScript: ; 0xbcf87
	setbit2 $0008
	3writetext $6d, $4289
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneWontSaveMoneyScript: ; 0xbcf92
	clearbit2 $0008
	3writetext BANK(MomPhoneWontSaveMoneyText), MomPhoneWontSaveMoneyText
	keeptextopen
	2jump MomPhoneHangUpScript

MomPhoneHangUpScript: ; 0xbcf9d
	3writetext BANK(MomPhoneHangUpText), MomPhoneHangUpText
	end

MomPhoneNoPokemonScript: ; 0xbcfa2
	3writetext BANK(MomPhoneNoPokemonText), MomPhoneNoPokemonText
	end

MomPhoneNoPokedexScript: ; 0xbcfa7
	3writetext BANK(MomPhoneNoPokedexText), MomPhoneNoPokedexText
	end

MomPhoneNoGymQuestScript: ; 0xbcfac
	3writetext BANK(MomPhoneNoGymQuestText), MomPhoneNoGymQuestText
	end

MomPhoneLectureScript: ; 0xbcfb1
	setbit1 $0040
	setbit2 $0009
	specialphonecall $0000
	3writetext BANK(MomPhoneLectureText), MomPhoneLectureText
	yesorno
	iftrue MomPhoneSaveMoneyScript
	2jump MomPhoneWontSaveMoneyScript

BillPhoneScript1: ; 0xbcfc5
	checktime $2
	iftrue .daygreet
	checktime $4
	iftrue .nitegreet
	3writetext BANK(BillPhoneMornGreetingText), BillPhoneMornGreetingText
	keeptextopen
	2jump .main

.daygreet ; 0xbcfd7
	3writetext BANK(BillPhoneDayGreetingText), BillPhoneDayGreetingText
	keeptextopen
	2jump .main

.nitegreet ; 0xbcfdf
	3writetext BANK(BillPhoneNiteGreetingText), BillPhoneNiteGreetingText
	keeptextopen
	2jump .main

.main ; 0xbcfe7
	3writetext BANK(BillPhoneGeneriText), BillPhoneGeneriText
	keeptextopen
	checkcode $10
	RAM2MEM $0
	if_equal $0, .full
	if_greater_than $6, .nearlyfull
	3writetext BANK(BillPhoneNotFullText), BillPhoneNotFullText
	end

.nearlyfull ; 0xbcffd
	3writetext BANK(BillPhoneNearlyFullText), BillPhoneNearlyFullText
	end

.full ; 0xbd002
	3writetext BANK(BillPhoneFullText), BillPhoneFullText
	end

BillPhoneScript2: ; 0xbd007
	3writetext BANK(BillPhoneNewlyFullText), BillPhoneNewlyFullText
	closetext
	end

ElmPhoneScript1: ; 0xbd00d
	checkcode $14
	if_equal $1, .pokerus
	checkbit1 $0055
	iftrue .discovery
	checkbit1 $002d
	iffalse .next
	checkbit1 $0054
	iftrue .egghatched
.next
	checkbit1 $002d
	iftrue .eggunhatched
	checkbit1 $0701
	iftrue .assistant
	checkbit1 $001f
	iftrue .checkingegg
	checkbit1 $0043
	iftrue .stolen
	checkbit1 $001e
	iftrue .sawmrpokemon
	3writetext BANK(ElmPhoneStartText), ElmPhoneStartText
	end

.sawmrpokemon ; 0xbd048
	3writetext BANK(ElmPhoneSawMrPokemonText), ElmPhoneSawMrPokemonText
	end

.stolen ; 0xbd04d
	3writetext BANK(ElmPhonePokemonStolenText), ElmPhonePokemonStolenText
	end

.checkingegg ; 0xbd052
	3writetext BANK(ElmPhoneCheckingEggText), ElmPhoneCheckingEggText
	end

.assistant ; 0xbd057
	3writetext BANK(ElmPhoneAssistantText), ElmPhoneAssistantText
	end

.eggunhatched ; 0xbd05c
	3writetext BANK(ElmPhoneEggUnhatchedText), ElmPhoneEggUnhatchedText
	end

.egghatched ; 0xbd061
	3writetext BANK(ElmPhoneEggHatchedText), ElmPhoneEggHatchedText
	setbit1 $0077
	end

.discovery ; 0xbd069
	random $2
	if_equal $0, .nextdiscovery
	3writetext BANK(ElmPhoneDiscovery1Text), ElmPhoneDiscovery1Text
	end

.nextdiscovery ; 0xbd074
	3writetext BANK(ElmPhoneDiscovery2Text), ElmPhoneDiscovery2Text
	end

.pokerus ; 0xbd079
	3writetext BANK(ElmPhonePokerusText), ElmPhonePokerusText
	specialphonecall $0000
	end

ElmPhoneScript2: ; 0xbd081
	checkcode $14
	if_equal $2, .disaster
	if_equal $3, .assistant
	if_equal $4, .rocket
	if_equal $5, .gift
	if_equal $8, .gift
	3writetext BANK(ElmPhonePokerusText), ElmPhonePokerusText
	specialphonecall $0000
	end

.disaster ; 0xbd09f
	3writetext BANK(ElmPhoneDisasterText), ElmPhoneDisasterText
	specialphonecall $0000
	setbit1 $0043
	end

.assistant ; 0xbd0aa
	3writetext BANK(ElmPhoneEggAssistantText), ElmPhoneEggAssistantText
	specialphonecall $0000
	clearbit1 $0700
	setbit1 $0701
	end

.rocket ; 0xbd0b8
	3writetext BANK(ElmPhoneRocketText), ElmPhoneRocketText
	specialphonecall $0000
	end

.gift ; 0xbd0c0
	3writetext BANK(ElmPhoneGiftText), ElmPhoneGiftText
	specialphonecall $0000
	end

.unused ; 0xbd0c8
	3writetext BANK(ElmPhoneUnusedText), ElmPhoneUnusedText
	specialphonecall $0000
	end
; bd0d0

