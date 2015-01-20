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
	playsound SFX_STRENGTH
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
	setflag $002b
	setevent $074e
	domaptrigger GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote $0, $0, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement $0, MovementData_0x587fe
	playsound SFX_KINESIS
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
	writetext UnknownText_0x589b8
	keeptextopen
UnknownScript_0x587c0: ; 0x587c0
	writetext UnknownText_0x588f5
	closetext
	loadmovesprites
	spriteface $3, $1
	end
; 0x587c9

UnknownScript_0x587c9: ; 0x587c9
	writetext UnknownText_0x5897c
	closetext
	loadmovesprites
	end
; 0x587cf

UnknownScript_0x587cf: ; 0x587cf
	writetext UnknownText_0x594cb
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
	writetext UnknownText_0x58aa7
	writebyte $0
	special $0087
	loadmovesprites
	end
; 0x587e6

MapRuinsofAlphKabutoChamberSignpost5Script: ; 0x587e6
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587f7
	loadfont
	writetext UnknownText_0x58ad9
	writebyte $0
	special $0087
	loadmovesprites
	end
; 0x587f7

UnknownScript_0x587f7: ; 0x587f7
	loadfont
	writetext UnknownText_0x58afa
	closetext
	loadmovesprites
	end
; 0x587fe

MovementData_0x587fe: ; 0x587fe
	db $59 ; movement
	step_end
; 0x58800

UnknownText_0x58800: ; 0x58800
	text "Welcome to this"
	line "chamber."

	para "There are sliding"
	line "panels that depict"

	para "a #MON drawn by"
	line "the ancients."

	para "Slide the panels"
	line "around to form the"
	cont "picture."

	para "To the right is a"
	line "description of the"
	cont "#MON."

	para "Scientists in the"
	line "back are examining"

	para "some newly found"
	line "patterns."
	done
; 0x588f5

UnknownText_0x588f5: ; 0x588f5
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done
; 0x5897c

UnknownText_0x5897c: ; 0x5897c
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done
; 0x589b8

UnknownText_0x589b8: ; 0x589b8
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	done
; 0x58a03

; possibly unused
UnknownText_0x58a03: ; 0x58a03
	text "The patterns on"
	line "the wall appear to"
	cont "be words!"

	para "And those sliding"
	line "stone panels seem"

	para "to be signals of"
	line "some kind."

	para "I think they make"
	line "#MON appear,"

	para "but it's not clear"
	line "yet…"
	done
; 0x58aa7

UnknownText_0x58aa7: ; 0x58aa7
	text "Patterns appeared"
	line "on the walls…"
	done
; 0x58ac8

; possibly unused
UnknownText_0x58ac8: ; 0x58ac8
	text "It's UNOWN text!"
	done
; 0x58ad9

UnknownText_0x58ad9: ; 0x58ad9
	text "Patterns appeared"
	line "on the walls…"
	done
; 0x58afa

UnknownText_0x58afa: ; 0x58afa
	text "There's a big hole"
	line "in the wall!"
	done
; 0x58b1a

UnknownText_0x58b1a: ; 0x58b1a
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done
; 0x58b3f

UnknownText_0x58b3f: ; 0x58b3f
	text "A #MON that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done
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

