RuinsofAlphKabutoChamber_MapScriptHeader: ; 0x5871e
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x5872b, $0000
	dw UnknownScript_0x58736, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x58737
; 0x5872b

UnknownScript_0x5872b: ; 0x5872b
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x58732
	end
; 0x58732

UnknownScript_0x58732: ; 0x58732
	priorityjump UnknownScript_0x58751
; 0x58735

UnknownScript_0x58735: ; 0x58735
	end
; 0x58736

UnknownScript_0x58736: ; 0x58736
	end
; 0x58737

UnknownScript_0x58737: ; 0x58737
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x58741
	changeblock $4, $0, $2e
UnknownScript_0x58741: ; 0x58741
	checkevent $02a1
	iffalse UnknownScript_0x58748
	return
; 0x58748

UnknownScript_0x58748: ; 0x58748
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return
; 0x58751

UnknownScript_0x58751: ; 0x58751
	pause 30
	earthquake 30
	showemote $0, $0, 20
	pause 30
	playsound $001b
	changeblock $4, $0, $30
	reloadmappart
	earthquake 50
	dotrigger $1
	loadmovesprites
	end
; 0x58769

ReceptionistScript_0x58769: ; 0x58769
	jumptextfaceplayer UnknownText_0x58800
; 0x5876c

MapRuinsofAlphKabutoChamberSignpost2Script: ; 0x5876c
	refreshscreen $0
	writebyte $0
	special $0029
	loadmovesprites
	iftrue UnknownScript_0x58778
	end
; 0x58778

UnknownScript_0x58778: ; 0x58778
	setevent $0705
	setevent $02a1
	setbit2 $002b
	setevent $074e
	domaptrigger GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote $0, $0, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound $001b
	earthquake 80
	applymovement $0, MovementData_0x587fe
	playsound $002f
	waitbutton
	pause 20
	warpcheck
	end
; 0x587a8

ScientistScript_0x587a8: ; 0x587a8
	faceplayer
	loadfont
	checkcode $e
	if_equal 26, UnknownScript_0x587cf
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587c9
	checkevent $02a1
	iffalse UnknownScript_0x587c0
	2writetext UnknownText_0x589b8
	keeptextopen
UnknownScript_0x587c0: ; 0x587c0
	2writetext UnknownText_0x588f5
	closetext
	loadmovesprites
	spriteface $3, $1
	end
; 0x587c9

UnknownScript_0x587c9: ; 0x587c9
	2writetext UnknownText_0x5897c
	closetext
	loadmovesprites
	end
; 0x587cf

UnknownScript_0x587cf: ; 0x587cf
	2writetext UnknownText_0x594cb
	closetext
	loadmovesprites
	end
; 0x587d5

MapRuinsofAlphKabutoChamberSignpost1Script: ; 0x587d5
	jumptext UnknownText_0x58b1a
; 0x587d8

MapRuinsofAlphKabutoChamberSignpost3Script: ; 0x587d8
	jumptext UnknownText_0x58b3f
; 0x587db

MapRuinsofAlphKabutoChamberSignpost4Script: ; 0x587db
	loadfont
	2writetext UnknownText_0x58aa7
	writebyte $0
	special $0087
	loadmovesprites
	end
; 0x587e6

MapRuinsofAlphKabutoChamberSignpost5Script: ; 0x587e6
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587f7
	loadfont
	2writetext UnknownText_0x58ad9
	writebyte $0
	special $0087
	loadmovesprites
	end
; 0x587f7

UnknownScript_0x587f7: ; 0x587f7
	loadfont
	2writetext UnknownText_0x58afa
	closetext
	loadmovesprites
	end
; 0x587fe

MovementData_0x587fe: ; 0x587fe
	db $59 ; movement
	step_end
; 0x58800

UnknownText_0x58800: ; 0x58800
	db $0, "Welcome to this", $4f
	db "chamber.", $51
	db "There are sliding", $4f
	db "panels that depict", $51
	db "a #MON drawn by", $4f
	db "the ancients.", $51
	db "Slide the panels", $4f
	db "around to form the", $55
	db "picture.", $51
	db "To the right is a", $4f
	db "description of the", $55
	db "#MON.", $51
	db "Scientists in the", $4f
	db "back are examining", $51
	db "some newly found", $4f
	db "patterns.", $57
; 0x588f5

UnknownText_0x588f5: ; 0x588f5
	db $0, "Recently, strange,", $4f
	db "cryptic patterns", $55
	db "have appeared.", $51
	db "It's odd. They", $4f
	db "weren't here a", $55
	db "little while ago…", $51
	db "You should take a", $4f
	db "look at the walls.", $57
; 0x5897c

UnknownText_0x5897c: ; 0x5897c
	db $0, "Ah! Here's another", $4f
	db "huge hole!", $51
	db "It's big enough to", $4f
	db "go through!", $57
; 0x589b8

UnknownText_0x589b8: ; 0x589b8
	db $0, "That tremor was", $4f
	db "pretty scary!", $51
	db "But I'm more", $4f
	db "concerned about", $55
	db "this wall here…", $57
; 0x58a03

; possibly unused
UnknownText_0x58a03: ; 0x58a03
	db $0, "The patterns on", $4f
	db "the wall appear to", $55
	db "be words!", $51
	db "And those sliding", $4f
	db "stone panels seem", $51
	db "to be signals of", $4f
	db "some kind.", $51
	db "I think they make", $4f
	db "#MON appear,", $51
	db "but it's not clear", $4f
	db "yet…", $57
; 0x58aa7

UnknownText_0x58aa7: ; 0x58aa7
	db $0, "Patterns appeared", $4f
	db "on the walls…", $57
; 0x58ac8

; possibly unused
UnknownText_0x58ac8: ; 0x58ac8
	db $0, "It's UNOWN text!", $57
; 0x58ad9

UnknownText_0x58ad9: ; 0x58ad9
	db $0, "Patterns appeared", $4f
	db "on the walls…", $57
; 0x58afa

UnknownText_0x58afa: ; 0x58afa
	db $0, "There's a big hole", $4f
	db "in the wall!", $57
; 0x58b1a

UnknownText_0x58b1a: ; 0x58b1a
	db $0, "It's a replica of", $4f
	db "an ancient #-", $55
	db "MON.", $57
; 0x58b3f

UnknownText_0x58b3f: ; 0x58b3f
	db $0, "A #MON that hid", $4f
	db "on the sea floor.", $51
	db "Eyes on its back", $4f
	db "scanned the area.", $57
; 0x58b85

RuinsofAlphKabutoChamber_MapEventHeader: ; 0x58b85
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $9, $3, 2, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 2, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 4, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 5, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, GROUP_RUINS_OF_ALPH_KABUTO_ITEM_ROOM, MAP_RUINS_OF_ALPH_KABUTO_ITEM_ROOM

	; xy triggers
	db 0

	; signposts
	db 6
	signpost 3, 2, $0, MapRuinsofAlphKabutoChamberSignpost1Script
	signpost 3, 5, $0, MapRuinsofAlphKabutoChamberSignpost1Script
	signpost 2, 3, $1, MapRuinsofAlphKabutoChamberSignpost2Script
	signpost 2, 4, $1, MapRuinsofAlphKabutoChamberSignpost3Script
	signpost 0, 3, $1, MapRuinsofAlphKabutoChamberSignpost4Script
	signpost 0, 4, $1, MapRuinsofAlphKabutoChamberSignpost5Script

	; people-events
	db 2
	person_event SPRITE_RECEPTIONIST, 9, 9, $6, $0, 255, 255, $0, 0, ReceptionistScript_0x58769, $074e
	person_event SPRITE_SCIENTIST, 5, 7, $7, $0, 255, 255, $90, 0, ScientistScript_0x587a8, $ffff
; 0x58bdc

