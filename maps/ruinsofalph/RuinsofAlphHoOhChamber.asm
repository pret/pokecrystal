RuinsofAlphHoOhChamber_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x5856d, 0
	dw UnknownScript_0x5857b, 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_TILES, UnknownScript_0x5857c

UnknownScript_0x5856d:
	special SpecialHoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue UnknownScript_0x58577
	end

UnknownScript_0x58577:
	priorityjump UnknownScript_0x58596
	end

UnknownScript_0x5857b:
	end

UnknownScript_0x5857c:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue UnknownScript_0x58586
	changeblock $4, $0, $2e
UnknownScript_0x58586:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse UnknownScript_0x5858d
	return

UnknownScript_0x5858d:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

UnknownScript_0x58596:
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

MapRuinsofAlphHoOhChamberSignpost2Script:
	refreshscreen $0
	writebyte $3
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x585ba
	end

UnknownScript_0x585ba:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_4
	domaptrigger RUINS_OF_ALPH_INNER_CHAMBER, $1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock $2, $2, $18
	changeblock $4, $2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, MovementData_0x58610
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

MapRuinsofAlphHoOhChamberSignpost1Script:
	jumptext UnknownText_0x58685

MapRuinsofAlphHoOhChamberSignpost3Script:
	jumptext UnknownText_0x586aa

MapRuinsofAlphHoOhChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58612
	writebyte $3
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsofAlphHoOhChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue UnknownScript_0x58609
	opentext
	writetext UnknownText_0x58644
	writebyte $3
	special Special_DisplayUnownWords
	closetext
	end

UnknownScript_0x58609:
	opentext
	writetext UnknownText_0x58665
	waitbutton
	closetext
	end

MovementData_0x58610:
	db $59 ; movement
	step_end

UnknownText_0x58612:
	text "Patterns appeared"
	line "on the walls…"
	done

; possibly unused
UnknownText_0x58633:
	text "It's UNOWN text!"
	done

UnknownText_0x58644:
	text "Patterns appeared"
	line "on the walls…"
	done

UnknownText_0x58665:
	text "There's a big hole"
	line "in the wall!"
	done

UnknownText_0x58685:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

UnknownText_0x586aa:
	text "A #MON that"
	line "flew gracefully on"

	para "rainbow-colored"
	line "wings."
	done

RuinsofAlphHoOhChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $9, $3, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def $9, $4, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def $3, $3, 2, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $3, $4, 3, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def $0, $4, 1, RUINS_OF_ALPH_HO_OH_ITEM_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 3, 2, SIGNPOST_READ, MapRuinsofAlphHoOhChamberSignpost1Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsofAlphHoOhChamberSignpost1Script
	signpost 2, 3, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsofAlphHoOhChamberSignpost5Script

.PersonEvents:
	db 0
