Route40_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, MonicaCallback

MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .MonicaAppears
	disappear $a
	return

.MonicaAppears
	appear $a
	return

TrainerSwimmerfElaine:
	trainer EVENT_BEAT_SWIMMERF_ELAINE, SWIMMERF, ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, $0000, SwimmerfElaineScript

SwimmerfElaineScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a637b
	closetext
	loadmovesprites
	end

TrainerSwimmerfPaula:
	trainer EVENT_BEAT_SWIMMERF_PAULA, SWIMMERF, PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, $0000, SwimmerfPaulaScript

SwimmerfPaulaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a63f5
	closetext
	loadmovesprites
	end

TrainerSwimmermSimon:
	trainer EVENT_BEAT_SWIMMERM_SIMON, SWIMMERM, SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, $0000, SwimmermSimonScript

SwimmermSimonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a6282
	closetext
	loadmovesprites
	end

TrainerSwimmermRandall:
	trainer EVENT_BEAT_SWIMMERM_RANDALL, SWIMMERM, RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, $0000, SwimmermRandallScript

SwimmermRandallScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a62fa
	closetext
	loadmovesprites
	end

LassScript_0x1a61c4:
	jumptextfaceplayer UnknownText_0x1a6429

PokefanMScript_0x1a61c7:
	special Function10630f
	iftrue UnknownScript_0x1a61d0
	jumptextfaceplayer UnknownText_0x1a646a

UnknownScript_0x1a61d0:
	jumptextfaceplayer UnknownText_0x1a649b

LassScript_0x1a61d3:
	jumptextfaceplayer UnknownText_0x1a64e6

StandingYoungsterScript_0x1a61d6:
	jumptextfaceplayer UnknownText_0x1a6564

MonicaScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue MonicaMondayScript
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, MonicaNotMondayScript
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	keeptextopen
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica
	writetext MonicaGivesGiftText
	keeptextopen
	verbosegiveitem SHARP_BEAK, 1
	iffalse MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	closetext
	loadmovesprites
	end

MonicaMondayScript:
	writetext MonicaMondayText
	closetext
MonicaDoneScript:
	loadmovesprites
	end

MonicaNotMondayScript:
	writetext MonicaNotMondayText
	closetext
	loadmovesprites
	end

MapRoute40Signpost0Script:
	jumptext UnknownText_0x1a6767

Route40Rock:
	jumpstd smashrock

MapRoute40SignpostItem1:
	dwb EVENT_ROUTE_40_HIDDEN_HYPER_POTION, HYPER_POTION

MovementData_0x1a621c:
	step_right
	step_up
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x1a6224:
	step_up
	step_up
	step_up
	step_up
	step_up
	step_end

MovementData_0x1a622a:
	step_up
	step_up
	step_up
	step_up
	step_end

SwimmermSimonSeenText:
	text "You have to warm"
	line "up before going"
	cont "into the water."

	para "That's basic."
	done

SwimmermSimonBeatenText:
	text "OK! Uncle! I give!"
	done

UnknownText_0x1a6282:
	text "CIANWOOD CITY is"
	line "a good distance"
	cont "away from here."
	done

SwimmermRandallSeenText:
	text "Hey, you're young"
	line "and fit!"

	para "Don't ride your"
	line "#MON! Swim!"
	done

SwimmermRandallBeatenText:
	text "Uh-oh. I lost…"
	done

UnknownText_0x1a62fa:
	text "Swimming exercises"
	line "your entire body."
	cont "It's healthy."
	done

SwimmerfElaineSeenText:
	text "Are you going to"
	line "CIANWOOD?"

	para "How about a quick"
	line "battle first?"
	done

SwimmerfElaineBeatenText:
	text "I lost that one!"
	done

UnknownText_0x1a637b:
	text "I'd say I'm a bet-"
	line "ter swimmer than"
	cont "you. Yeah!"
	done

SwimmerfPaulaSeenText:
	text "No inner tube for"
	line "me."

	para "I'm hanging on to"
	line "a sea #MON!"
	done

SwimmerfPaulaBeatenText:
	text "Ooh, I'm feeling"
	line "dizzy!"
	done

UnknownText_0x1a63f5:
	text "While I float like"
	line "this, the waves"
	cont "carry me along."
	done

UnknownText_0x1a6429:
	text "Although you can't"
	line "see it from here,"

	para "CIANWOOD is across"
	line "the sea."
	done

UnknownText_0x1a646a:
	text "Hm! There's a big"
	line "building up ahead!"

	para "What is it?"
	done

UnknownText_0x1a649b:
	text "Hm! Look at all"
	line "those serious-"
	cont "looking trainers"
	cont "streaming in."

	para "What? What?"
	done

UnknownText_0x1a64e6:
	text "I came to OLIVINE"
	line "by ship to see the"

	para "sights and soak up"
	line "the atmosphere."

	para "Being a port, it"
	line "feels so different"
	cont "from a big city."
	done

UnknownText_0x1a6564:
	text "Have you gone to"
	line "the BATTLE TOWER?"

	para "I think a lot of"
	line "tough trainers"

	para "have gathered"
	line "there already."

	para "But since you have"
	line "so many BADGES,"

	para "you shouldn't do"
	line "badly at all."
	done

MeetMonicaText:
	text "MONICA: Glad to"
	line "meet you. I'm"

	para "MONICA of Monday."
	done

MonicaGivesGiftText:
	text "As a token of our"
	line "friendship, I have"
	cont "a gift for you!"
	done

MonicaGaveGiftText:
	text "MONICA: It's an"
	line "item that raises"

	para "the power of fly-"
	line "ing-type moves."

	para "You should equip a"
	line "bird #MON with"
	cont "that item."
	done

MonicaMondayText:
	text "MONICA: My broth-"
	line "ers and sisters"

	para "are all over the"
	line "place."

	para "See if you could"
	line "find them all!"
	done

MonicaNotMondayText:
	text "MONICA: I don't"
	line "think today is"
	cont "Monday. How sad…"
	done

UnknownText_0x1a6767:
	text "ROUTE 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done

Route40_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $9, 1, GROUP_ROUTE_40_BATTLE_TOWER_GATE, MAP_ROUTE_40_BATTLE_TOWER_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 10, 14, SIGNPOST_READ, MapRoute40Signpost0Script
	signpost 8, 7, SIGNPOST_ITEM, MapRoute40SignpostItem1

.PersonEvents:
	db 12
	person_event SPRITE_OLIVINE_RIVAL, 19, 18, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerSwimmermSimon, -1
	person_event SPRITE_OLIVINE_RIVAL, 34, 22, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerSwimmermRandall, -1
	person_event SPRITE_SWIMMER_GIRL, 23, 7, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 4, TrainerSwimmerfElaine, -1
	person_event SPRITE_SWIMMER_GIRL, 29, 14, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerSwimmerfPaula, -1
	person_event SPRITE_ROCK, 15, 11, OW_LEFT | $10, $0, -1, -1, $0, 0, Route40Rock, -1
	person_event SPRITE_ROCK, 13, 10, OW_LEFT | $10, $0, -1, -1, $0, 0, Route40Rock, -1
	person_event SPRITE_ROCK, 12, 11, OW_LEFT | $10, $0, -1, -1, $0, 0, Route40Rock, -1
	person_event SPRITE_LASS, 17, 15, OW_UP | $2, $0, -1, -1, $0, 0, LassScript_0x1a61c4, -1
	person_event SPRITE_BUENA, 14, 12, OW_DOWN | $3, $0, -1, -1, $0, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	person_event SPRITE_POKEFAN_M, 10, 11, OW_LEFT | $1, $0, -1, -1, $0, 0, PokefanMScript_0x1a61c7, -1
	person_event SPRITE_LASS, 8, 17, OW_DOWN | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, LassScript_0x1a61d3, -1
	person_event SPRITE_STANDING_YOUNGSTER, 13, 20, OW_DOWN | $3, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, StandingYoungsterScript_0x1a61d6, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
