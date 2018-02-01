RuinsOfAlphOmanyteChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	special OmanyteChamber
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	priorityjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_OMANYTE_PUZZLE
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
	setscene SCENE_FINISHED
	closetext
	end

MapRuinsOfAlphOmanyteChamberSignpost2Script:
	refreshscreen
	writebyte UNOWNPUZZLE_OMANYTE
	special UnownPuzzle
	closetext
	iftrue UnknownScript_0x58c36
	end

UnknownScript_0x58c36:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_OMANYTE_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_L_TO_R
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, MovementData_0x58c8c
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

MapRuinsOfAlphOmanyteChamberSignpost1Script:
	jumptext UnknownText_0x58d01

MapRuinsOfAlphOmanyteChamberSignpost3Script:
	jumptext UnknownText_0x58d26

MapRuinsOfAlphOmanyteChamberSignpost4Script:
	opentext
	writetext UnknownText_0x58c8e
	writebyte UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

MapRuinsOfAlphOmanyteChamberSignpost5Script:
	checkevent EVENT_WALL_OPENED_IN_OMANYTE_CHAMBER
	iftrue UnknownScript_0x58c85
	opentext
	writetext UnknownText_0x58cc0
	writebyte UNOWNWORDS_WATER
	special DisplayUnownWords
	closetext
	end

UnknownScript_0x58c85:
	opentext
	writetext UnknownText_0x58ce1
	waitbutton
	closetext
	end

MovementData_0x58c8c:
	skyfall_top
	step_end

UnknownText_0x58c8e:
	text "Patterns appeared"
	line "on the walls…"
	done

; unused
UnusedText_0x58caf:
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

RuinsOfAlphOmanyteChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 3, 9, 3, RUINS_OF_ALPH_OUTSIDE
	warp_event 4, 9, 3, RUINS_OF_ALPH_OUTSIDE
	warp_event 3, 3, 6, RUINS_OF_ALPH_INNER_CHAMBER
	warp_event 4, 3, 7, RUINS_OF_ALPH_INNER_CHAMBER
	warp_event 4, 0, 1, RUINS_OF_ALPH_OMANYTE_ITEM_ROOM

	db 0 ; coord events

	db 6 ; bg events
	bg_event 2, 3, BGEVENT_READ, MapRuinsOfAlphOmanyteChamberSignpost1Script
	bg_event 5, 3, BGEVENT_READ, MapRuinsOfAlphOmanyteChamberSignpost1Script
	bg_event 3, 2, BGEVENT_UP, MapRuinsOfAlphOmanyteChamberSignpost2Script
	bg_event 4, 2, BGEVENT_UP, MapRuinsOfAlphOmanyteChamberSignpost3Script
	bg_event 3, 0, BGEVENT_UP, MapRuinsOfAlphOmanyteChamberSignpost4Script
	bg_event 4, 0, BGEVENT_UP, MapRuinsOfAlphOmanyteChamberSignpost5Script

	db 0 ; object events
