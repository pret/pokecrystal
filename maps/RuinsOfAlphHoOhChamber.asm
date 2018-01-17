RuinsOfAlphHoOhChamber_MapScripts:
.SceneScripts:
	db 2
	scene_script .CheckWall
	scene_script .DummyScene

.MapCallbacks:
	db 1
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	special Special_HoOhChamber
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_HO_OH_PUZZLE
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

MapRuinsOfAlphHoOhChamberSignpost2Script:
	refreshscreen
	writebyte UNOWNPUZZLE_HO_OH
	special Special_UnownPuzzle
	closetext
	iftrue UnknownScript_0x585ba
	end

UnknownScript_0x585ba:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_HO_OH_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_4
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, 1
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
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
	writebyte UNOWNWORDS_HO_OH
	special Special_DisplayUnownWords
	closetext
	end

MapRuinsOfAlphHoOhChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_HO_OH_CHAMBER
	iftrue UnknownScript_0x58609
	opentext
	writetext UnknownText_0x58644
	writebyte UNOWNWORDS_HO_OH
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
	skyfall_top
	step_end

UnknownText_0x58612:
	text "Patterns appeared"
	line "on the walls…"
	done

; unused
UnusedText_0x58633:
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

RuinsOfAlphHoOhChamber_MapEvents:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def 3, 9, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def 4, 9, 1, RUINS_OF_ALPH_OUTSIDE
	warp_def 3, 3, 2, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 3, 3, RUINS_OF_ALPH_INNER_CHAMBER
	warp_def 4, 0, 1, RUINS_OF_ALPH_HO_OH_ITEM_ROOM

.CoordEvents:
	db 0

.BGEvents:
	db 6
	bg_event 2, 3, BGEVENT_READ, MapRuinsOfAlphHoOhChamberSignpost1Script
	bg_event 5, 3, BGEVENT_READ, MapRuinsOfAlphHoOhChamberSignpost1Script
	bg_event 3, 2, BGEVENT_UP, MapRuinsOfAlphHoOhChamberSignpost2Script
	bg_event 4, 2, BGEVENT_UP, MapRuinsOfAlphHoOhChamberSignpost3Script
	bg_event 3, 0, BGEVENT_UP, MapRuinsOfAlphHoOhChamberSignpost4Script
	bg_event 4, 0, BGEVENT_UP, MapRuinsOfAlphHoOhChamberSignpost5Script

.ObjectEvents:
	db 0
