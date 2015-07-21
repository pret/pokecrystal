RuinsofAlphOmanyteChamber_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x58be9, $0000
	dw UnknownScript_0x58bf7, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x58bf8

UnknownScript_0x58be9:
	special SpecialOmanyteChamber
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58bf3
	end

UnknownScript_0x58bf3:
	priorityjump UnknownScript_0x58c12
	end

UnknownScript_0x58bf7:
	end

UnknownScript_0x58bf8:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58c02
	changeblock $4, $0, $2e
UnknownScript_0x58c02:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
	iffalse UnknownScript_0x58c09
	return

UnknownScript_0x58c09:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

UnknownScript_0x58c12:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, $0, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock $4, $0, $30
	reloadmappart
	earthquake 50
	dotrigger $1
	loadmovesprites
	end

MapRuinsofAlphOmanyteChamberSignpost2Script:
	refreshscreen $0
	writebyte $1
	special Special_UnownPuzzle
	loadmovesprites
	iftrue UnknownScript_0x58c36
	end

UnknownScript_0x58c36:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_OMANYTE_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_2
	domaptrigger GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, $0, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement $0, MovementData_0x58c8c
	playsound SFX_KINESIS
	waitbutton
	pause 20
	warpcheck
	end

MapRuinsofAlphOmanyteChamberSignpost1Script:
	jumptext UnknownText_0x58d01

MapRuinsofAlphOmanyteChamberSignpost3Script:
	jumptext UnknownText_0x58d26

MapRuinsofAlphOmanyteChamberSignpost4Script:
	loadfont
	writetext UnknownText_0x58c8e
	writebyte $2
	special Special_DisplayUnownWords
	loadmovesprites
	end

MapRuinsofAlphOmanyteChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58c85
	loadfont
	writetext UnknownText_0x58cc0
	writebyte $2
	special Special_DisplayUnownWords
	loadmovesprites
	end

UnknownScript_0x58c85:
	loadfont
	writetext UnknownText_0x58ce1
	closetext
	loadmovesprites
	end

MovementData_0x58c8c:
	db $59 ; movement
	step_end

UnknownText_0x58c8e:
	text "Patterns appeared"
	line "on the walls…"
	done

; possibly unused.. this again?
UnknownText_0x58caf:
	text "It's UNOWN text!"
	done

UnknownText_0x58cc0:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58ce1:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58d01:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnknownText_0x58d26:
	text "This #MON"
	line "drifted in the"

	para "sea by twisting"
	line "its ten tentacles."
	done

RuinsofAlphOmanyteChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $3, 3, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 3, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 6, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 7, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, GROUP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM, MAP_RUINS_OF_ALPH_OMANYTE_ITEM_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 3, 2, SIGNPOST_READ, MapRuinsofAlphOmanyteChamberSignpost1Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsofAlphOmanyteChamberSignpost1Script
	signpost 2, 3, SIGNPOST_UP, MapRuinsofAlphOmanyteChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsofAlphOmanyteChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsofAlphOmanyteChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsofAlphOmanyteChamberSignpost5Script

.PersonEvents:
	db 0
