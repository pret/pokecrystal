const_value set 2
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsofAlphKabutoChamber_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x5872b, 0
	dw UnknownScript_0x58736, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x58737

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
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse UnknownScript_0x58748
	return

UnknownScript_0x58748:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

UnknownScript_0x58751:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock $4, $0, $30
	reloadmappart
	earthquake 50
	dotrigger $1
	closetext
	end

ReceptionistScript_0x58769:
	jumptextfaceplayer UnknownText_0x58800

MapRuinsofAlphKabutoChamberSignpost2Script:
	refreshscreen $0
	writebyte $0
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x58778
	end

UnknownScript_0x58778:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_1
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	domaptrigger RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, MovementData_0x587fe
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

ScientistScript_0x587a8:
	faceplayer
	opentext
	checkcode VAR_UNOWNCOUNT
	if_equal 26, UnknownScript_0x587cf
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587c9
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse UnknownScript_0x587c0
	writetext UnknownText_0x589b8
	buttonsound
UnknownScript_0x587c0:
	writetext UnknownText_0x588f5
	waitbutton
	closetext
	spriteface RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

UnknownScript_0x587c9:
	writetext UnknownText_0x5897c
	waitbutton
	closetext
	end

UnknownScript_0x587cf:
	writetext UnknownText_0x594cb
	waitbutton
	closetext
	end

MapRuinsofAlphKabutoChamberSignpost1Script:
	jumptext UnknownText_0x58b1a

MapRuinsofAlphKabutoChamberSignpost3Script:
	jumptext UnknownText_0x58b3f

MapRuinsofAlphKabutoChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58aa7
	writebyte $0
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsofAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587f7
	opentext
	writetext UnknownText_0x58ad9
	writebyte $0
	special Special_DisplayUnownWords
	closetext
	end

UnknownScript_0x587f7:
	opentext
	writetext UnknownText_0x58afa
	waitbutton
	closetext
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

.Warps:
	db 5
	warp_def $9, $3, 2, RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 2, RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 4, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 5, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, RUINS_OF_ALPH_KABUTO_ITEM_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 3, 2, SIGNPOST_READ, MapRuinsofAlphKabutoChamberSignpost1Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsofAlphKabutoChamberSignpost1Script
	signpost 2, 3, SIGNPOST_UP, MapRuinsofAlphKabutoChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsofAlphKabutoChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsofAlphKabutoChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsofAlphKabutoChamberSignpost5Script

.PersonEvents:
	db 2
	person_event SPRITE_RECEPTIONIST, 5, 5, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x58769, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	person_event SPRITE_SCIENTIST, 1, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, ScientistScript_0x587a8, -1
