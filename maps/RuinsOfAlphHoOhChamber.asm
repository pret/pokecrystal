RuinsOfAlphHoOhChamber_MapScriptHeader:
.MapTriggers:
	db 2
	maptrigger .CheckWall
	maptrigger .DummyTrigger

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	special SpecialHoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyTrigger:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	changeblock $4, $0, $2e
.WallOpen:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock $2, $2, $1
	changeblock $4, $2, $2
	return

.WallOpenScript:
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

MapRuinsOfAlphHoOhChamberSignpost2Script:
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

MapRuinsOfAlphHoOhChamberSignpost1Script:
	jumptext UnknownText_0x58685

MapRuinsOfAlphHoOhChamberSignpost3Script:
	jumptext UnknownText_0x586aa

MapRuinsOfAlphHoOhChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58612
	writebyte $3
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsOfAlphHoOhChamberSignpost5Script:
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

RuinsOfAlphHoOhChamber_MapEventHeader:
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
	signpost 3, 2, SIGNPOST_READ, MapRuinsOfAlphHoOhChamberSignpost1Script
	signpost 3, 5, SIGNPOST_READ, MapRuinsOfAlphHoOhChamberSignpost1Script
	signpost 2, 3, SIGNPOST_UP, MapRuinsOfAlphHoOhChamberSignpost2Script
	signpost 2, 4, SIGNPOST_UP, MapRuinsOfAlphHoOhChamberSignpost3Script
	signpost 0, 3, SIGNPOST_UP, MapRuinsOfAlphHoOhChamberSignpost4Script
	signpost 0, 4, SIGNPOST_UP, MapRuinsOfAlphHoOhChamberSignpost5Script

.PersonEvents:
	db 0
