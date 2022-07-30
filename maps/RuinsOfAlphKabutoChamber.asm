	object_const_def
	const RUINSOFALPHKABUTOCHAMBER_RECEPTIONIST
	const RUINSOFALPHKABUTOCHAMBER_SCIENTIST

RuinsOfAlphKabutoChamber_MapScripts:
	def_scene_scripts
	scene_script RuinsOfAlphKabutoChamberCheckWallScene, SCENE_RUINSOFALPHKABUTOCHAMBER_CHECK_WALL
	scene_script RuinsOfAlphKabutoChamberNoopScene,      SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP

	def_callbacks
	callback MAPCALLBACK_TILES, RuinsOfAlphKabutoChamberHiddenDoorsCallback

RuinsOfAlphKabutoChamberCheckWallScene:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .OpenWall
	end

.OpenWall:
	sdefer RuinsOfAlphKabutoChamberWallOpenScript
	end

RuinsOfAlphKabutoChamberNoopScene:
	end

RuinsOfAlphKabutoChamberHiddenDoorsCallback:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	changeblock 4, 0, $2e ; closed wall
.WallOpen:
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .FloorClosed
	endcallback

.FloorClosed:
	changeblock 2, 2, $01 ; left floor
	changeblock 4, 2, $02 ; right floor
	endcallback

RuinsOfAlphKabutoChamberWallOpenScript:
	pause 30
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 20
	pause 30
	playsound SFX_STRENGTH
	changeblock 4, 0, $30 ; open wall
	reloadmappart
	earthquake 50
	setscene SCENE_RUINSOFALPHKABUTOCHAMBER_NOOP
	closetext
	end

RuinsOfAlphKabutoChamberReceptionistScript:
	jumptextfaceplayer RuinsOfAlphKabutoChamberReceptionistText

RuinsOfAlphKabutoChamberPuzzle:
	refreshscreen
	setval UNOWNPUZZLE_KABUTO
	special UnownPuzzle
	closetext
	iftrue .PuzzleComplete
	end

.PuzzleComplete:
	setevent EVENT_RUINS_OF_ALPH_INNER_CHAMBER_TOURISTS
	setevent EVENT_SOLVED_KABUTO_PUZZLE
	setflag ENGINE_UNLOCKED_UNOWNS_A_TO_K
	setevent EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	setmapscene RUINS_OF_ALPH_INNER_CHAMBER, SCENE_RUINSOFALPHINNERCHAMBER_STRANGE_PRESENCE
	earthquake 30
	showemote EMOTE_SHOCK, PLAYER, 15
	changeblock 2, 2, $18 ; left hole
	changeblock 4, 2, $19 ; right hole
	reloadmappart
	playsound SFX_STRENGTH
	earthquake 80
	applymovement PLAYER, RuinsOfAlphKabutoChamberSkyfallTopMovement
	playsound SFX_KINESIS
	waitsfx
	pause 20
	warpcheck
	end

RuinsOfAlphKabutoChamberScientistScript:
	faceplayer
	opentext
	readvar VAR_UNOWNCOUNT
	ifequal NUM_UNOWN, .AllUnownCaught
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	checkevent EVENT_SOLVED_KABUTO_PUZZLE
	iffalse .PuzzleIncomplete
	writetext RuinsOfAlphKabutoChamberScientistTremorText
	promptbutton
.PuzzleIncomplete:
	writetext RuinsOfAlphKabutoChamberScientistCrypticText
	waitbutton
	closetext
	turnobject RUINSOFALPHKABUTOCHAMBER_SCIENTIST, UP
	end

.WallOpen:
	writetext RuinsOfAlphKabutoChamberScientistHoleText
	waitbutton
	closetext
	end

.AllUnownCaught:
	writetext RuinsOfAlphResearchCenterScientist1Text_GotAllUnown
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberAncientReplica:
	jumptext RuinsOfAlphKabutoChamberAncientReplicaText

RuinsOfAlphKabutoChamberDescriptionSign:
	jumptext RuinsOfAlphKabutoChamberDescriptionText

RuinsOfAlphKabutoChamberWallPatternLeft:
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternLeftText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

RuinsOfAlphKabutoChamberWallPatternRight:
	checkevent EVENT_WALL_OPENED_IN_KABUTO_CHAMBER
	iftrue .WallOpen
	opentext
	writetext RuinsOfAlphKabutoChamberWallPatternRightText
	setval UNOWNWORDS_ESCAPE
	special DisplayUnownWords
	closetext
	end

.WallOpen:
	opentext
	writetext RuinsOfAlphKabutoChamberWallHoleText
	waitbutton
	closetext
	end

RuinsOfAlphKabutoChamberSkyfallTopMovement:
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

RuinsOfAlphKabutoChamberScientistCrypticText:
	text "Recently, strange,"
	line "cryptic patterns"
	cont "have appeared."

	para "It's odd. They"
	line "weren't here a"
	cont "little while ago…"

	para "You should take a"
	line "look at the walls."
	done

RuinsOfAlphKabutoChamberScientistHoleText:
	text "Ah! Here's another"
	line "huge hole!"

	para "It's big enough to"
	line "go through!"
	done

RuinsOfAlphKabutoChamberScientistTremorText:
	text "That tremor was"
	line "pretty scary!"

	para "But I'm more"
	line "concerned about"
	cont "this wall here…"
	done

RuinsOfAlphKabutoChamberUnusedText: ; unreferenced
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

RuinsOfAlphKabutoChamberWallPatternLeftText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphKabutoChamberUnownText: ; unreferenced
	text "It's UNOWN text!"
	done

RuinsOfAlphKabutoChamberWallPatternRightText:
	text "Patterns appeared"
	line "on the walls…"
	done

RuinsOfAlphKabutoChamberWallHoleText:
	text "There's a big hole"
	line "in the wall!"
	done

RuinsOfAlphKabutoChamberAncientReplicaText:
	text "It's a replica of"
	line "an ancient #-"
	cont "MON."
	done

RuinsOfAlphKabutoChamberDescriptionText:
	text "A #MON that hid"
	line "on the sea floor."

	para "Eyes on its back"
	line "scanned the area."
	done

RuinsOfAlphKabutoChamber_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  3,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  4,  9, RUINS_OF_ALPH_OUTSIDE, 2
	warp_event  3,  3, RUINS_OF_ALPH_INNER_CHAMBER, 4
	warp_event  4,  3, RUINS_OF_ALPH_INNER_CHAMBER, 5
	warp_event  4,  0, RUINS_OF_ALPH_KABUTO_ITEM_ROOM, 1

	def_coord_events

	def_bg_events
	bg_event  2,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  5,  3, BGEVENT_READ, RuinsOfAlphKabutoChamberAncientReplica
	bg_event  3,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberPuzzle
	bg_event  4,  2, BGEVENT_UP, RuinsOfAlphKabutoChamberDescriptionSign
	bg_event  3,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternLeft
	bg_event  4,  0, BGEVENT_UP, RuinsOfAlphKabutoChamberWallPatternRight

	def_object_events
	object_event  5,  5, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberReceptionistScript, EVENT_RUINS_OF_ALPH_KABUTO_CHAMBER_RECEPTIONIST
	object_event  3,  1, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RuinsOfAlphKabutoChamberScientistScript, -1
