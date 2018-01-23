const_value set 2
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
.SceneScripts:
	db 2
	scene_script .CheckWall
	scene_script .DummyScene

.MapCallbacks:
	db 1
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene 1
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

MapRuinsOfAlphKabutoChamberSignpost2Script:
	refreshscreen
	writebyte UNOWNPUZZLE_KABUTO
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x58778
	end

UnknownScript_0x58778:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_1
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, 1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
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
	if_equal NUM_UNOWN, UnknownScript_0x587cf
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

MapRuinsOfAlphKabutoChamberSignpost1Script:
	jumptext UnknownText_0x58b1a

MapRuinsOfAlphKabutoChamberSignpost3Script:
	jumptext UnknownText_0x58b3f

MapRuinsOfAlphKabutoChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58aa7
	writebyte UNOWNWORDS_ESCAPE
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsOfAlphKabutoChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue UnknownScript_0x587f7
	opentext
	writetext UnknownText_0x58ad9
	writebyte UNOWNWORDS_ESCAPE
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
	skyfall_top
	step_end

RuinsOfAlphKabutoChamberReceptionistText:
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

; unused
UnusedText_0x58a03:
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

; unused
UnusedText_0x58ac8:
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

RuinsOfAlphKabutoChamber_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 3, 9, 2, RUINS_OF_ALPH_OUTSIDE
	warp_def 4, 9, 2, RUINS_OF_ALPH_OUTSIDE
	warp_def 3, 3, 4, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 3, 5, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 0, 1, RUINS_OF_ALPH_KABUTO_ITEM_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 2, 3, BGEVENT_READ, MapRuinsOfAlphKabutoChamberSignpost1Script
	bg_event 5, 3, BGEVENT_READ, MapRuinsOfAlphKabutoChamberSignpost1Script
	bg_event 3, 2, BGEVENT_UP, MapRuinsOfAlphKabutoChamberSignpost2Script
	bg_event 4, 2, BGEVENT_UP, MapRuinsOfAlphKabutoChamberSignpost3Script
	bg_event 3, 0, BGEVENT_UP, MapRuinsOfAlphKabutoChamberSignpost4Script
	bg_event 4, 0, BGEVENT_UP, MapRuinsOfAlphKabutoChamberSignpost5Script

.ObjectEvents:
	db 2
	object_event 5, 5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event 3, 1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ScientistScript_0x587a8, -1
