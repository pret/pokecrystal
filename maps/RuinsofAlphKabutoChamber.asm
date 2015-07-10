RuinsofAlphKabutoChamber_MapScriptHeader:
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x5872b, $0000
	dw UnknownScript_0x58736, $0000

	; callback count
	db 1

	; callbacks

	dbw 1, UnknownScript_0x58737

UnknownScript_0x5872b:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x58732
	end

UnknownScript_0x58732:
	priorityjump UnknownScript_0x58751

UnknownScript_0x58735:
	end

UnknownScript_0x58736:
	end

UnknownScript_0x58737:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x58741
	changeblock $4, $0, $2e
UnknownScript_0x58741:
	checkevent $02a1
	iffalse UnknownScript_0x58748
	return

UnknownScript_0x58748:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

UnknownScript_0x58751:
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

ReceptionistScript_0x58769:
	jumptextfaceplayer UnknownText_0x58800

MapRuinsofAlphKabutoChamberSignpost2Script:
	refreshscreen $0
	writebyte $0
	special Functionc360
	loadmovesprites
	iftrue UnknownScript_0x58778
	end

UnknownScript_0x58778:
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

ScientistScript_0x587a8:
	faceplayer
	loadfont
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x587cf
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587c9
	checkevent $02a1
	iffalse UnknownScript_0x587c0
	writetext UnknownText_0x589b8
	keeptextopen
UnknownScript_0x587c0:
	writetext UnknownText_0x588f5
	closetext
	loadmovesprites
	spriteface $3, UP
	end

UnknownScript_0x587c9:
	writetext UnknownText_0x5897c
	closetext
	loadmovesprites
	end

UnknownScript_0x587cf:
	writetext UnknownText_0x594cb
	closetext
	loadmovesprites
	end

MapRuinsofAlphKabutoChamberSignpost1Script:
	jumptext UnknownText_0x58b1a

MapRuinsofAlphKabutoChamberSignpost3Script:
	jumptext UnknownText_0x58b3f

MapRuinsofAlphKabutoChamberSignpost4Script:
	loadfont
	writetext UnknownText_0x58aa7
	writebyte $0
	special Function8ae68
	loadmovesprites
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587f7
	loadfont
	writetext UnknownText_0x58ad9
	writebyte $0
	special Function8ae68
	loadmovesprites
	end

UnknownScript_0x587f7:
	loadfont
	writetext UnknownText_0x58afa
	closetext
	loadmovesprites
	end

MovementData_0x587fe:
	db $59 ; movement
	step_end

UnknownText_0x58800:
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

UnknownText_0x588f5:
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done

UnknownText_0x5897c:
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done

UnknownText_0x589b8:
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	done

; possibly unused
UnknownText_0x58a03:
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

UnknownText_0x58aa7:
	text "Patterns appeared"
	line "on the walls…"
	done

; possibly unused
UnknownText_0x58ac8:
	text "It's UNOWN text!"
	done

UnknownText_0x58ad9:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58afa:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58b1a:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnknownText_0x58b3f:
	text "A #MON that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done

RuinsofAlphKabutoChamber_MapEventHeader:
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
