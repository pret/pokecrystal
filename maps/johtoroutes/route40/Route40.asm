const_value set 2
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, MonicaCallback

MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
	checkcode VAR_WEEKDAY
	if_equal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	return

.MonicaAppears:
	appear ROUTE40_MONICA
	return

TrainerSwimmerfElaine:
	trainer EVENT_BEAT_SWIMMERF_ELAINE, SWIMMERF, ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, SwimmerfElaineScript

SwimmerfElaineScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a637b
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer EVENT_BEAT_SWIMMERF_PAULA, SWIMMERF, PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, SwimmerfPaulaScript

SwimmerfPaulaScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a63f5
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer EVENT_BEAT_SWIMMERM_SIMON, SWIMMERM, SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, SwimmermSimonScript

SwimmermSimonScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a6282
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer EVENT_BEAT_SWIMMERM_RANDALL, SWIMMERM, RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, SwimmermRandallScript

SwimmermRandallScript:
	end_if_just_battled
	opentext
	writetext UnknownText_0x1a62fa
	waitbutton
	closetext
	end

LassScript_0x1a61c4:
	jumptextfaceplayer UnknownText_0x1a6429

PokefanMScript_0x1a61c7:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer UnknownText_0x1a646a

.mobile
	jumptextfaceplayer UnknownText_0x1a649b

LassScript_0x1a61d3:
	jumptextfaceplayer UnknownText_0x1a64e6

StandingYoungsterScript_0x1a61d6:
	jumptextfaceplayer UnknownText_0x1a6564

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue MonicaMondayScript
	checkcode VAR_WEEKDAY
	if_not_equal MONDAY, MonicaNotMondayScript
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	buttonsound
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	buttonsound
	verbosegiveitem SHARP_BEAK
	iffalse MonicaDoneScript
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

MonicaMondayScript:
	writetext MonicaMondayText
	waitbutton
MonicaDoneScript:
	closetext
	end

MonicaNotMondayScript:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd smashrock

Route40HiddenHyperPotion:
	dwb EVENT_ROUTE_40_HIDDEN_HYPER_POTION, HYPER_POTION

MovementData_0x1a621c:
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a6224:
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x1a622a:
	step UP
	step UP
	step UP
	step UP
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

Route40SignText:
	text "ROUTE 40"

	para "CIANWOOD CITY -"
	line "OLIVINE CITY"
	done

Route40_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 1
	warp_def $5, $9, 1, ROUTE_40_BATTLE_TOWER_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 10, 14, SIGNPOST_READ, Route40Sign
	signpost 8, 7, SIGNPOST_ITEM, Route40HiddenHyperPotion

.PersonEvents:
	db 12
	person_event SPRITE_OLIVINE_RIVAL, 15, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	person_event SPRITE_OLIVINE_RIVAL, 30, 18, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	person_event SPRITE_SWIMMER_GIRL, 19, 3, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	person_event SPRITE_SWIMMER_GIRL, 25, 10, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	person_event SPRITE_ROCK, 11, 7, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route40Rock, -1
	person_event SPRITE_ROCK, 9, 6, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route40Rock, -1
	person_event SPRITE_ROCK, 8, 7, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route40Rock, -1
	person_event SPRITE_LASS, 13, 11, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, LassScript_0x1a61c4, -1
	person_event SPRITE_BUENA, 10, 8, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	person_event SPRITE_POKEFAN_M, 6, 7, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, PokefanMScript_0x1a61c7, -1
	person_event SPRITE_LASS, 4, 13, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_SCRIPT, 0, LassScript_0x1a61d3, -1
	person_event SPRITE_STANDING_YOUNGSTER, 9, 16, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, StandingYoungsterScript_0x1a61d6, EVENT_BATTLE_TOWER_OUTSIDE_SAILOR
