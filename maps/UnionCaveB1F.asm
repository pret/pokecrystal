UnionCaveB1F_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerPokemaniacAndrew:
	trainer EVENT_BEAT_POKEMANIAC_ANDREW, POKEMANIAC, ANDREW, PokemaniacAndrewSeenText, PokemaniacAndrewBeatenText, NONE, PokemaniacAndrewScript

PokemaniacAndrewScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a181
	closetext
	loadmovesprites
	end

TrainerPokemaniacCalvin:
	trainer EVENT_BEAT_POKEMANIAC_CALVIN, POKEMANIAC, CALVIN, PokemaniacCalvinSeenText, PokemaniacCalvinBeatenText, NONE, PokemaniacCalvinScript

PokemaniacCalvinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a230
	closetext
	loadmovesprites
	end

TrainerHikerPhillip:
	trainer EVENT_BEAT_HIKER_PHILLIP, HIKER, PHILLIP, HikerPhillipSeenText, HikerPhillipBeatenText, NONE, HikerPhillipScript

HikerPhillipScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x5a073
	closetext
	loadmovesprites
	end

TrainerHikerLeonard:
	trainer EVENT_BEAT_HIKER_LEONARD, HIKER, LEONARD, HikerLeonardSeenText, HikerLeonardBeatenText, NONE, HikerLeonardScript

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
	warp_def $3, $3, 7, RUINS_OF_ALPH_OUTSIDE
	warp_def $b, $3, 8, RUINS_OF_ALPH_OUTSIDE
	warp_def $13, $7, 1, UNION_CAVE_1F
	warp_def $21, $3, 2, UNION_CAVE_1F
	warp_def $1f, $11, 1, UNION_CAVE_B2F

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 7
	person_event SPRITE_POKEFAN_M, 4, 9, SPRITEMOVEDATA_0A, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, 2, 3, TrainerHikerPhillip, -1
	person_event SPRITE_POKEFAN_M, 7, 16, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, 2, 3, TrainerHikerLeonard, -1
	person_event SPRITE_SUPER_NERD, 32, 5, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerPokemaniacAndrew, -1
	person_event SPRITE_SUPER_NERD, 30, 17, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, 2, 3, TrainerPokemaniacCalvin, -1
	person_event SPRITE_POKE_BALL, 16, 2, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x5a016, EVENT_UNION_CAVE_B1F_TM_SWIFT
	person_event SPRITE_BOULDER, 10, 7, SPRITEMOVEDATA_19, 0, 0, -1, -1, 0, 0, 0, UnionCaveB1FBoulder, -1
	person_event SPRITE_POKE_BALL, 23, 17, SPRITEMOVEDATA_01, 0, 0, -1, -1, 0, 1, 0, ItemFragment_0x5a018, EVENT_UNION_CAVE_B1F_X_DEFEND
