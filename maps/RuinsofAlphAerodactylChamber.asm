RuinsofAlphAerodactylChamber_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x58dad, $0000
	dw UnknownScript_0x58db8, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 1, UnknownScript_0x58db9

UnknownScript_0x58dad:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue UnknownScript_0x58db4
	end

UnknownScript_0x58db4:
	priorityjump UnknownScript_0x58dd3
	end

UnknownScript_0x58db8:
	end

UnknownScript_0x58db9:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue UnknownScript_0x58dc3
	changeblock $4, $0, $2e
UnknownScript_0x58dc3:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse UnknownScript_0x58dca
	return

UnknownScript_0x58dca:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

UnknownScript_0x58dd3:
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

MapRuinsofAlphAerodactylChamberSignpost2Script:
	refreshscreen $0
	writebyte $2
	special Special_UnownPuzzle
	loadmovesprites
	iftrue UnknownScript_0x58df7
	end

UnknownScript_0x58df7:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_3
	domaptrigger GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, $0, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement $0, MovementData_0x58e4d
	playsound SFX_KINESIS
	waitbutton
	pause 20
	warpcheck
	end

MapRuinsofAlphAerodactylChamberSignpost1Script:
	jumptext UnknownText_0x58ec2

MapRuinsofAlphAerodactylChamberSignpost3Script:
	jumptext UnknownText_0x58ee7

MapRuinsofAlphAerodactylChamberSignpost4Script:
	loadfont
	writetext UnknownText_0x58e4f
	writebyte $1
	special Special_DisplayUnownWords
	loadmovesprites
	end

MapRuinsofAlphAerodactylChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue UnknownScript_0x58e46
	loadfont
	writetext UnknownText_0x58e81
	writebyte $1
	special Special_DisplayUnownWords
	loadmovesprites
	end

UnknownScript_0x58e46:
	loadfont
	writetext UnknownText_0x58ea2
	closetext
	loadmovesprites
	end

MovementData_0x58e4d:
	db $59 ; movement
	step_end

UnknownText_0x58e4f:
	text "Patterns appeared"
	line "on the walls…"
	done

; possibly unused.. again?
UnknownText_0x58e70:
	text "It's UNOWN text!"
	done

UnknownText_0x58e81:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58ea2:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58ec2:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnknownText_0x58ee7:
	text "This flying #-"
	line "MON attacked its"

	para "prey with saw-like"
	line "fangs."
	done

RuinsofAlphAerodactylChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $3, 4, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 4, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 8, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 9, GROUP_RUINS_OF_ALPH_INNER_CHAMBER, MAP_RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, GROUP_RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, MAP_RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 3, 2, SIGNPOST_READ, MapRuinsofAlphAerodactylChamberSignpost1Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsofAlphAerodactylChamberSignpost1Script
	signpost 2, 3, SIGNPOST_UP, MapRuinsofAlphAerodactylChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsofAlphAerodactylChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsofAlphAerodactylChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsofAlphAerodactylChamberSignpost5Script

.PersonEvents:
	db 0
