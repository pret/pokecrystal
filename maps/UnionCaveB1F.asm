UnionCaveB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacAndrew:
	trainer EVENT_BEAT_POKEMANIAC_ANDREW, POKEMANIAC, ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, $0000, PokemaniacAndrewScript

PokemaniacAndrewScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a181
	closetext
	loadmovesprites
	end

TrainerPokemaniacCalvin:
	trainer EVENT_BEAT_POKEMANIAC_CALVIN, POKEMANIAC, CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, $0000, PokemaniacCalvinScript

PokemaniacCalvinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a230
	closetext
	loadmovesprites
	end

TrainerHikerPhillip:
	trainer EVENT_BEAT_HIKER_PHILLIP, HIKER, PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, $0000, HikerPhillipScript

HikerPhillipScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a073
	closetext
	loadmovesprites
	end

TrainerHikerLeonard:
	trainer EVENT_BEAT_HIKER_LEONARD, HIKER, LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, $0000, HikerLeonardScript

HikerLeonardScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a0fb
	closetext
	loadmovesprites
	end

ItemFragment_0x5a016:
	db TM_SWIFT, 1

ItemFragment_0x5a018:
	db X_DEFEND, 1

UnionCaveB1FBoulder:
	jumpstd strengthboulder

HikerPhillipSeenText:
	text "It's been a while"
	line "since I last saw"
	cont "another person."

	para "Don't be shy."
	line "Let's battle!"
	done

HikerPhillipBeatenText:
	text "Uurggh…"
	done

UnknownText_0x5a073:
	text "I've been lost for"
	line "a long time…"

	para "I don't mind it"
	line "here, but I am"
	cont "soooo hungry!"
	done

HikerLeonardSeenText:
	text "What do you know!"
	line "A visitor!"
	done

HikerLeonardBeatenText:
	text "Wahahah! You're a"
	line "feisty one!"
	done

UnknownText_0x5a0fb:
	text "I live down here."

	para "You can, too, if"
	line "you'd like."

	para "There's plenty of"
	line "room, you see."
	done

PokemaniacAndrewSeenText:
	text "Who's there?"

	para "Leave me and my"
	line "#MON alone!"
	done

PokemaniacAndrewBeatenText:
	text "Go…"
	line "Go away!"
	done

UnknownText_0x5a181:
	text "Just me and my"
	line "#MON. I'm de-"
	cont "lirious with joy."
	done

PokemaniacCalvinSeenText:
	text "I came all the way"
	line "here to conduct my"
	cont "#MON research."

	para "Let me demonstrate"
	line "my findings in a"
	cont "real battle!"
	done

PokemaniacCalvinBeatenText:
	text "You demonstrated"
	line "on me!"
	done

UnknownText_0x5a230:
	text "I should compile"
	line "and announce my"
	cont "study findings."

	para "I might even be-"
	line "come famous like"
	cont "PROF.ELM."
	done

UnionCaveB1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $3, $3, 7, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $b, $3, 8, GROUP_RUINS_OF_ALPH_OUTSIDE, MAP_RUINS_OF_ALPH_OUTSIDE
	warp_def $13, $7, 1, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
	warp_def $21, $3, 2, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F
	warp_def $1f, $11, 1, GROUP_UNION_CAVE_B2F, MAP_UNION_CAVE_B2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 7
	person_event SPRITE_POKEFAN_M, 8, 13, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerHikerPhillip, -1
	person_event SPRITE_POKEFAN_M, 11, 20, OW_UP | $2, $0, -1, -1, (PAL_OW_BROWN << 4) | $82, 3, TrainerHikerLeonard, -1
	person_event SPRITE_SUPER_NERD, 36, 9, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPokemaniacAndrew, -1
	person_event SPRITE_SUPER_NERD, 34, 21, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPokemaniacCalvin, -1
	person_event SPRITE_POKE_BALL, 20, 6, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5a016, EVENT_UNION_CAVE_B1F_TM_SWIFT
	person_event SPRITE_BOULDER, 14, 11, OW_LEFT | $11, $0, -1, -1, $0, 0, UnionCaveB1FBoulder, -1
	person_event SPRITE_POKE_BALL, 27, 21, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x5a018, EVENT_UNION_CAVE_B1F_X_DEFEND
