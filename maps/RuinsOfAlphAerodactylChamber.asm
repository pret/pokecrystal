RuinsOfAlphAerodactylChamber_MapScripts:
	db 2 ; scene scripts
	scene_script .CheckWall ; SCENE_DEFAULT
	scene_script .DummyScene ; SCENE_FINISHED

	db 1 ; callbacks
	callback MAPCALLBACK_TILES, .HiddenDoors

.CheckWall:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	prioritysjump .WallOpenScript
	end

.DummyScene:
	end

.HiddenDoors:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_AERODACTYL_PUZZLE
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

RuinsOfAlphAerodactylChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_AERODACTYL
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_AERODACTYL_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_S_TO_W
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphAerodactylChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphAerodactylChamberAncientReplica:
	jumptext RuinsOfAlphAerodactylChamberAncientReplicaText

RuinsOfAlphAerodactylChamberDescriptionSign:
	jumptext RuinsOfAlphAerodactylChamberDescriptionText

RuinsOfAlphAerodactylChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphAerodactylChamberWallPatternLeftText
	setval UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphAerodactylChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_AERODACTYL_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphAerodactylChamberWallPatternRightText
	setval UNOWNWORDS_LIGHT
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphAerodactylChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphAerodactylChamberSkyfallTopMovement:
	skyfall_top
	step_end

RuinsOfAlphAerodactylChamberWallPatternLeftText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphAerodactylChamberUnownText:
; unused
	text "It's UNOWN text!"
	done

RuinsOfAlphAerodactylChamberWallPatternRightText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphAerodactylChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphAerodactylChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphAerodactylChamberDescriptionText:
	text "This flying #-"
	line "MON attacked its"

	para "prey with saw-like"
	line "fangs."
	done

RuinsOfAlphAerodactylChamber_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 4
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 8
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 9
	warp_event  4,  0, RUINS_OF_ALPH_AERODACTYL_ITEM_ROOM, 1

	db 0 ; coord events

	db 6 ; bg events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphAerodactylChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphAerodactylChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphAerodactylChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphAerodactylChamberWallPatternRight

	db 0 ; object events
