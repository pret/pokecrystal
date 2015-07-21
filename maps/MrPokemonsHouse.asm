MrPokemonsHouse_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x196e51, $0000
	dw UnknownScript_0x196e55, $0000

.MapCallbacks:
	db 0

UnknownScript_0x196e51:
	priorityjump UnknownScript_0x196e56
	end

UnknownScript_0x196e55:
	end

UnknownScript_0x196e56:
	showemote EMOTE_SHOCK, $2, 15
	spriteface $2, DOWN
	loadfont
	writetext UnknownText_0x196f66
	closetext
	loadmovesprites
	applymovement $0, MovementData_0x196f5a
	loadfont
	writetext UnknownText_0x196fa8
	keeptextopen
	waitbutton
	giveitem MYSTERY_EGG, $1
	writetext UnknownText_0x196fd2
	playsound SFX_KEY_ITEM
	waitbutton
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY
	writetext UnknownText_0x196feb
	keeptextopen
	spriteface $2, RIGHT
	writetext UnknownText_0x197092
	keeptextopen
	spriteface $2, DOWN
	spriteface $3, LEFT
	writetext UnknownText_0x1970b7
	closetext
	loadmovesprites
	jump UnknownScript_0x196ec9

GentlemanScript_0x196e97:
	faceplayer
	loadfont
	checkitem RED_SCALE
	iftrue UnknownScript_0x196eb0
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue UnknownScript_0x196eaa
	writetext UnknownText_0x197134
	closetext
	loadmovesprites
	end

UnknownScript_0x196eaa:
	writetext UnknownText_0x19714a
	closetext
	loadmovesprites
	end

UnknownScript_0x196eb0:
	writetext UnknownText_0x197476
	yesorno
	iffalse UnknownScript_0x196ec3
	verbosegiveitem EXP_SHARE, 1
	iffalse UnknownScript_0x196ec7
	takeitem RED_SCALE, 1
	jump UnknownScript_0x196eaa

UnknownScript_0x196ec3:
	writetext UnknownText_0x19750d
	closetext
UnknownScript_0x196ec7:
	loadmovesprites
	end

UnknownScript_0x196ec9:
	playmusic MUSIC_PROF_OAK
	applymovement $3, MovementData_0x196f5d
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x197185
	keeptextopen
	waitbutton
	writetext UnknownText_0x1973cc
	playsound SFX_ITEM
	waitbutton
	setflag ENGINE_POKEDEX
	writetext UnknownText_0x1973de
	closetext
	loadmovesprites
	spriteface $0, DOWN
	applymovement $3, MovementData_0x196f61
	playsound SFX_EXIT_BUILDING
	disappear $3
	waitbutton
	special RestartMapMusic
	pause 15
	spriteface $0, UP
	loadfont
	writetext UnknownText_0x1970ed
	closetext
	loadmovesprites
	special Special_FadeBlackQuickly
	special Special_ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special Mobile_HealParty
	special HealParty
	pause 60
	special Special_FadeInQuickly
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x197134
	closetext
	loadmovesprites
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_KRISS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_KRISS_NEIGHBORS_HOUSE_NEIGHBOR
	dotrigger $1
	domaptrigger GROUP_CHERRYGROVE_CITY, MAP_CHERRYGROVE_CITY, $1
	domaptrigger GROUP_ELMS_LAB, MAP_ELMS_LAB, $3
	specialphonecall ELMCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x196f49
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x196f4d
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

UnknownScript_0x196f49:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

UnknownScript_0x196f4d:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MapMrPokemonsHouseSignpost1Script:
	jumptext UnknownText_0x197543

MapMrPokemonsHouseSignpost3Script:
	jumptext UnknownText_0x197584

MapMrPokemonsHouseSignpost4Script:
	jumptext UnknownText_0x1975ac

MovementData_0x196f5a:
	step_right
	step_up
	step_end

MovementData_0x196f5d:
	step_down
	step_left
	step_left
	step_end

MovementData_0x196f61:
	step_down
	step_left
	turn_head_down
	db $3f ; movement
	step_end

UnknownText_0x196f66:
	text "Hello, hello! You"
	line "must be <PLAY_G>."

	para "PROF.ELM said that"
	line "you would visit."
	done

UnknownText_0x196fa8:
	text "This is what I"
	line "want PROF.ELM to"
	cont "examine."
	done

UnknownText_0x196fd2:
	text "<PLAYER> received"
	line "MYSTERY EGG."
	done

UnknownText_0x196feb:
	text "I know a couple"
	line "who run a #MON"
	cont "DAY-CARE service."

	para "They gave me that"
	line "EGG."

	para "I was intrigued,"
	line "so I sent mail to"
	cont "PROF.ELM."

	para "For #MON evolu-"
	line "tion, PROF.ELM is"
	cont "the authority."
	done

UnknownText_0x197092:
	text "Even PROF.OAK here"
	line "recognizes that."
	done

UnknownText_0x1970b7:
	text "If my assumption"
	line "is correct, PROF."
	cont "ELM will know it."
	done

UnknownText_0x1970ed:
	text "You are returning"
	line "to PROF.ELM?"

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

UnknownText_0x197134:
	text "I'm depending on"
	line "you!"
	done

UnknownText_0x19714a:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

UnknownText_0x197185:
	text "OAK: Aha! So"
	line "you're <PLAY_G>!"

	para "I'm OAK! A #MON"
	line "researcher."

	para "I was just visit-"
	line "ing my old friend"
	cont "MR.#MON."

	para "I heard you were"
	line "running an errand"

	para "for PROF.ELM, so I"
	line "waited here."

	para "Oh! What's this?"
	line "A rare #MON!"

	para "Let's see…"

	para "Hm, I see!"

	para "I understand why"
	line "PROF.ELM gave you"

	para "a #MON for this"
	line "errand."

	para "To researchers"
	line "like PROF.ELM and"

	para "I, #MON are our"
	line "friends."

	para "He saw that you"
	line "would treat your"

	para "#MON with love"
	line "and care."

	para "…Ah!"

	para "You seem to be"
	line "dependable."

	para "How would you like"
	line "to help me out?"

	para "See? This is the"
	line "latest version of"
	cont "#DEX."

	para "It automatically"
	line "records data on"

	para "#MON you've"
	line "seen or caught."

	para "It's a hi-tech"
	line "encyclopedia!"
	done

UnknownText_0x1973cc:
	text "<PLAYER> received"
	line "#DEX!"
	done

UnknownText_0x1973de:
	text "Go meet many kinds"
	line "of #MON and"

	para "complete that"
	line "#DEX!"

	para "But I've stayed"
	line "too long."

	para "I have to get to"
	line "GOLDENROD for my"
	cont "usual radio show."

	para "<PLAY_G>, I'm"
	line "counting on you!"
	done

UnknownText_0x197476:
	text "Hm? That SCALE!"
	line "What's that?"
	cont "A red GYARADOS?"

	para "That's rare! "
	line "I, I want it…"

	para "<PLAY_G>, would you"
	line "care to trade it?"

	para "I can offer this"
	line "EXP.SHARE I got"
	cont "from PROF.OAK."
	done

UnknownText_0x19750d:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

UnknownText_0x197543:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

UnknownText_0x197584:
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done

UnknownText_0x1975ac:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country…"
	done

MrPokemonsHouse_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $2, 2, GROUP_ROUTE_30, MAP_ROUTE_30
	warp_def $7, $3, 2, GROUP_ROUTE_30, MAP_ROUTE_30

.XYTriggers:
	db 0

.Signposts:
	db 5
	signpost 1, 0, SIGNPOST_READ, MapMrPokemonsHouseSignpost1Script
	signpost 1, 1, SIGNPOST_READ, MapMrPokemonsHouseSignpost1Script
	signpost 1, 6, SIGNPOST_READ, MapMrPokemonsHouseSignpost3Script
	signpost 1, 7, SIGNPOST_READ, MapMrPokemonsHouseSignpost3Script
	signpost 4, 6, SIGNPOST_READ, MapMrPokemonsHouseSignpost4Script

.PersonEvents:
	db 2
	person_event SPRITE_GENTLEMAN, 9, 7, OW_LEFT | $1, $0, -1, -1, $0, 0, GentlemanScript_0x196e97, -1
	person_event SPRITE_OAK, 9, 10, OW_UP | $3, $0, -1, -1, $0, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
