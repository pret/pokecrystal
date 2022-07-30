	object_const_def
	const MRPOKEMONSHOUSE_GENTLEMAN
	const MRPOKEMONSHOUSE_OAK

MrPokemonsHouse_MapScripts:
	def_scene_scripts
	scene_script MrPokemonsHouseMeetMrPokemonScene, SCENE_MRPOKEMONSHOUSE_MEET_MR_POKEMON
	scene_script MrPokemonsHouseNoopScene,          SCENE_MRPOKEMONSHOUSE_NOOP

	def_callbacks

MrPokemonsHouseMeetMrPokemonScene:
	sdefer MrPokemonsHouseMrPokemonEventScript
	end

MrPokemonsHouseNoopScene:
	end

MrPokemonsHouseMrPokemonEventScript:
	showemote EMOTE_SHOCK, MRPOKEMONSHOUSE_GENTLEMAN, 15
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	opentext
	writetext MrPokemonIntroText1
	waitbutton
	closetext
	applymovement PLAYER, MrPokemonsHouse_PlayerWalksToMrPokemon
	opentext
	writetext MrPokemonIntroText2
	promptbutton
	waitsfx
	giveitem MYSTERY_EGG
	writetext MrPokemonsHouse_GotEggText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_MYSTERY_EGG_FROM_MR_POKEMON
	blackoutmod CHERRYGROVE_CITY
	writetext MrPokemonIntroText3
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, RIGHT
	writetext MrPokemonIntroText4
	promptbutton
	turnobject MRPOKEMONSHOUSE_GENTLEMAN, DOWN
	turnobject MRPOKEMONSHOUSE_OAK, LEFT
	writetext MrPokemonIntroText5
	waitbutton
	closetext
	sjump MrPokemonsHouse_OakScript

MrPokemonsHouse_MrPokemonScript:
	faceplayer
	opentext
	checkitem RED_SCALE
	iftrue .RedScale
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iftrue .AlwaysNewDiscoveries
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	end

.AlwaysNewDiscoveries:
	writetext MrPokemonText_AlwaysNewDiscoveries
	waitbutton
	closetext
	end

.RedScale:
	writetext MrPokemonText_GimmeTheScale
	yesorno
	iffalse .refused
	verbosegiveitem EXP_SHARE
	iffalse .full
	takeitem RED_SCALE
	sjump .AlwaysNewDiscoveries

.refused
	writetext MrPokemonText_Disappointed
	waitbutton
.full
	closetext
	end

MrPokemonsHouse_OakScript:
	playmusic MUSIC_PROF_OAK
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakWalksToPlayer
	turnobject PLAYER, RIGHT
	opentext
	writetext MrPokemonsHouse_OakText1
	promptbutton
	waitsfx
	writetext MrPokemonsHouse_GetDexText
	playsound SFX_ITEM
	waitsfx
	setflag ENGINE_POKEDEX
	writetext MrPokemonsHouse_OakText2
	waitbutton
	closetext
	turnobject PLAYER, DOWN
	applymovement MRPOKEMONSHOUSE_OAK, MrPokemonsHouse_OakExits
	playsound SFX_EXIT_BUILDING
	disappear MRPOKEMONSHOUSE_OAK
	waitsfx
	special RestartMapMusic
	pause 15
	turnobject PLAYER, UP
	opentext
	writetext MrPokemonsHouse_MrPokemonHealText
	waitbutton
	closetext
	special FadeBlackQuickly
	special ReloadSpritesNoPalettes
	playmusic MUSIC_HEAL
	special StubbedTrainerRankings_Healings
	special HealParty
	pause 60
	special FadeInQuickly
	special RestartMapMusic
	opentext
	writetext MrPokemonText_ImDependingOnYou
	waitbutton
	closetext
	setevent EVENT_RIVAL_NEW_BARK_TOWN
	setevent EVENT_PLAYERS_HOUSE_1F_NEIGHBOR
	clearevent EVENT_PLAYERS_NEIGHBORS_HOUSE_NEIGHBOR
	setscene SCENE_MRPOKEMONSHOUSE_NOOP
	setmapscene CHERRYGROVE_CITY, SCENE_CHERRYGROVECITY_MEET_RIVAL
	setmapscene ELMS_LAB, SCENE_ELMSLAB_MEET_OFFICER
	specialphonecall SPECIALCALL_ROBBED
	clearevent EVENT_COP_IN_ELMS_LAB
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue .RivalTakesChikorita
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue .RivalTakesCyndaquil
	setevent EVENT_TOTODILE_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesChikorita:
	setevent EVENT_CHIKORITA_POKEBALL_IN_ELMS_LAB
	end

.RivalTakesCyndaquil:
	setevent EVENT_CYNDAQUIL_POKEBALL_IN_ELMS_LAB
	end

MrPokemonsHouse_ForeignMagazines:
	jumptext MrPokemonsHouse_ForeignMagazinesText

MrPokemonsHouse_BrokenComputer:
	jumptext MrPokemonsHouse_BrokenComputerText

MrPokemonsHouse_StrangeCoins:
	jumptext MrPokemonsHouse_StrangeCoinsText

MrPokemonsHouse_PlayerWalksToMrPokemon:
	step RIGHT
	step UP
	step_end

MrPokemonsHouse_OakWalksToPlayer:
	step DOWN
	step LEFT
	step LEFT
	step_end

MrPokemonsHouse_OakExits:
	step DOWN
	step LEFT
	turn_head DOWN
	step_sleep 2
	step_end

MrPokemonIntroText1:
	text "Hello, hello! You"
	line "must be <PLAY_G>."

	para "PROF.ELM said that"
	line "you would visit."
	done

MrPokemonIntroText2:
	text "This is what I"
	line "want PROF.ELM to"
	cont "examine."
	done

MrPokemonsHouse_GotEggText:
	text "<PLAYER> received"
	line "MYSTERY EGG."
	done

MrPokemonIntroText3:
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

MrPokemonIntroText4:
	text "Even PROF.OAK here"
	line "recognizes that."
	done

MrPokemonIntroText5:
	text "If my assumption"
	line "is correct, PROF."
	cont "ELM will know it."
	done

MrPokemonsHouse_MrPokemonHealText:
	text "You are returning"
	line "to PROF.ELM?"

	para "Here. Your #MON"
	line "should have some"
	cont "rest."
	done

MrPokemonText_ImDependingOnYou:
	text "I'm depending on"
	line "you!"
	done

MrPokemonText_AlwaysNewDiscoveries:
	text "Life is delight-"
	line "ful! Always, new"

	para "discoveries to be"
	line "made!"
	done

MrPokemonsHouse_OakText1:
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

MrPokemonsHouse_GetDexText:
	text "<PLAYER> received"
	line "#DEX!"
	done

MrPokemonsHouse_OakText2:
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

MrPokemonText_GimmeTheScale:
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

MrPokemonText_Disappointed:
	text "That's disappoint-"
	line "ing. That happens"
	cont "to be very rare."
	done

MrPokemonsHouse_ForeignMagazinesText:
	text "It's packed with"
	line "foreign magazines."

	para "Can't even read"
	line "their titles…"
	done

MrPokemonsHouse_BrokenComputerText:
	text "It's a big com-"
	line "puter. Hmm. It's"
	cont "broken."
	done

MrPokemonsHouse_StrangeCoinsText:
	text "A whole pile of"
	line "strange coins!"

	para "Maybe they're from"
	line "another country…"
	done

MrPokemonsHouse_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2,  7, ROUTE_30, 2
	warp_event  3,  7, ROUTE_30, 2

	def_coord_events

	def_bg_events
	bg_event  0,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  1,  1, BGEVENT_READ, MrPokemonsHouse_ForeignMagazines
	bg_event  6,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  7,  1, BGEVENT_READ, MrPokemonsHouse_BrokenComputer
	bg_event  6,  4, BGEVENT_READ, MrPokemonsHouse_StrangeCoins

	def_object_events
	object_event  3,  5, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MrPokemonsHouse_MrPokemonScript, -1
	object_event  6,  5, SPRITE_OAK, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_MR_POKEMONS_HOUSE_OAK
