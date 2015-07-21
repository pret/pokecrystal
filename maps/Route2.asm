Route2_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBug_catcherRob:
	trainer EVENT_BEAT_BUG_CATCHER_ROB, BUG_CATCHER, ROB, Bug_catcherRobSeenText, Bug_catcherRobBeatenText, $0000, Bug_catcherRobScript

Bug_catcherRobScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac34d
	closetext
	loadmovesprites
	end

TrainerBug_catcherEd:
	trainer EVENT_BEAT_BUG_CATCHER_ED, BUG_CATCHER, ED, Bug_catcherEdSeenText, Bug_catcherEdBeatenText, $0000, Bug_catcherEdScript

Bug_catcherEdScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac3cf
	closetext
	loadmovesprites
	end

TrainerBug_catcherDoug:
	trainer EVENT_BEAT_BUG_CATCHER_DOUG, BUG_CATCHER, DOUG, Bug_catcherDougSeenText, Bug_catcherDougBeatenText, $0000, Bug_catcherDougScript

Bug_catcherDougScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1ac423
	closetext
	loadmovesprites
	end

MapRoute2Signpost0Script:
	jumptext UnknownText_0x1ac47a

MapRoute2Signpost1Script:
	jumptext UnknownText_0x1ac49f

ItemFragment_0x1ac2fe:
	db DIRE_HIT, 1

ItemFragment_0x1ac300:
	db MAX_POTION, 1

ItemFragment_0x1ac302:
	db CARBOS, 1

ItemFragment_0x1ac304:
	db ELIXER, 1

FruitTreeScript_0x1ac306:
	fruittree $19

MapRoute2SignpostItem2:
	dwb EVENT_ROUTE_2_HIDDEN_MAX_ETHER, MAX_ETHER

MapRoute2SignpostItem3:
	dwb EVENT_ROUTE_2_HIDDEN_FULL_HEAL, FULL_HEAL

MapRoute2SignpostItem4:
	dwb EVENT_ROUTE_2_HIDDEN_FULL_RESTORE, FULL_RESTORE

MapRoute2SignpostItem5:
	dwb EVENT_ROUTE_2_HIDDEN_REVIVE, REVIVE

Bug_catcherRobSeenText:
	text "My bug #MON are"
	line "tough. Prepare to"
	cont "lose!"
	done

Bug_catcherRobBeatenText:
	text "I was whipped…"
	done

UnknownText_0x1ac34d:
	text "I'm going to look"
	line "for stronger bug"
	cont "#MON."
	done

Bug_catcherEdSeenText:
	text "If you walk in"
	line "tall grass wearing"

	para "shorts, do you get"
	line "nicks and cuts?"
	done

Bug_catcherEdBeatenText:
	text "Ouch, ouch, ouch!"
	done

UnknownText_0x1ac3cf:
	text "They'll really"
	line "sting when you"
	cont "take a bath."
	done

Bug_catcherDougSeenText:
	text "Why don't girls"
	line "like bug #MON?"
	done

Bug_catcherDougBeatenText:
	text "No good!"
	done

UnknownText_0x1ac423:
	text "Bug #MON squish"
	line "like plush toys"

	para "when you squeeze"
	line "their bellies."

	para "I love how they"
	line "feel!"
	done

UnknownText_0x1ac47a:
	text "ROUTE 2"

	para "VIRIDIAN CITY -"
	line "PEWTER CITY"
	done

UnknownText_0x1ac49f:
	text "DIGLETT'S CAVE"
	done

Route2_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $f, $f, 1, GROUP_ROUTE_2_NUGGET_SPEECH_HOUSE, MAP_ROUTE_2_NUGGET_SPEECH_HOUSE
	warp_def $1f, $f, 3, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $1b, $10, 1, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $1b, $11, 2, GROUP_ROUTE_2_GATE, MAP_ROUTE_2_GATE
	warp_def $7, $c, 3, GROUP_DIGLETTS_CAVE, MAP_DIGLETTS_CAVE

.XYTriggers:
	db 0

.Signposts:
	db 6
	signpost 51, 7, SIGNPOST_READ, MapRoute2Signpost0Script
	signpost 9, 11, SIGNPOST_READ, MapRoute2Signpost1Script
	signpost 23, 7, SIGNPOST_ITEM, MapRoute2SignpostItem2
	signpost 14, 4, SIGNPOST_ITEM, MapRoute2SignpostItem3
	signpost 27, 4, SIGNPOST_ITEM, MapRoute2SignpostItem4
	signpost 30, 11, SIGNPOST_ITEM, MapRoute2SignpostItem5

.PersonEvents:
	db 8
	person_event SPRITE_BUG_CATCHER, 49, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 5, TrainerBug_catcherRob, -1
	person_event SPRITE_BUG_CATCHER, 8, 10, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBug_catcherEd, -1
	person_event SPRITE_BUG_CATCHER, 44, 4, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerBug_catcherDoug, -1
	person_event SPRITE_POKE_BALL, 33, 4, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1ac2fe, EVENT_ROUTE_2_DIRE_HIT
	person_event SPRITE_POKE_BALL, 27, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1ac300, EVENT_ROUTE_2_MAX_POTION
	person_event SPRITE_POKE_BALL, 6, 23, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1ac302, EVENT_ROUTE_2_CARBOS
	person_event SPRITE_POKE_BALL, 54, 18, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1ac304, EVENT_ROUTE_2_ELIXER
	person_event SPRITE_FRUIT_TREE, 18, 14, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1ac306, -1
