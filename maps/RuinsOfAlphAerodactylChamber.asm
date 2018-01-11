RuinsOfAlphAerodactylChamber_MapScriptHeader:
.SceneScripts:
	db 2
	scene_script .CheckWall
	scene_script .DummyScene

.MapCallbacks:
	db 1
	dbw MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e
.WallOpen:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
	iffalse .FloorClosed
	return

.FloorClosed:
	changeblock 2, 2, $1
	changeblock 4, 2, $2
	return

.WallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30
	reloadmappart
	earthquake 50
	setscene 1
	closetext
	end

MapRuinsOfAlphAerodactylChamberSignpost2Script:
	refreshscreen $0
	writebyte UNOWNPUZZLE_AERODACTYL
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x58df7
	end

UnknownScript_0x58df7:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_3
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, 1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18
	changeblock 4, 2, $19
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, MovementData_0x58e4d
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

MapRuinsOfAlphAerodactylChamberSignpost1Script:
	jumptext UnknownText_0x58ec2

MapRuinsOfAlphAerodactylChamberSignpost3Script:
	jumptext UnknownText_0x58ee7

MapRuinsOfAlphAerodactylChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58e4f
	writebyte UNOWNWORDS_LIGHT
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsOfAlphAerodactylChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue UnknownScript_0x58e46
	opentext
	writetext UnknownText_0x58e81
	writebyte UNOWNWORDS_LIGHT
	special Special_DisplayUnownWords
	closetext
	end

UnknownScript_0x58e46:
	opentext
	writetext UnknownText_0x58ea2
	waitbutton
	closetext
	end

MovementData_0x58e4d:
	skyfall_top
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

RuinsOfAlphAerodactylChamber_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 3, 9, 4, RUINS_OF_ALPH_OUTSIDE
	warp_def 4, 9, 4, RUINS_OF_ALPH_OUTSIDE
	warp_def 3, 3, 8, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 3, 9, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 0, 1, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 2, 3, BGEVENT_READ, MapRuinsOfAlphAerodactylChamberSignpost1Script
	bg_event 5, 3, BGEVENT_READ, MapRuinsOfAlphAerodactylChamberSignpost1Script
	bg_event 3, 2, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost2Script
	bg_event 4, 2, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost3Script
	bg_event 3, 0, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost4Script
	bg_event 4, 0, BGEVENT_UP, MapRuinsOfAlphAerodactylChamberSignpost5Script

.ObjectEvents:
	db 0
