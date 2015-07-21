DanceTheatre_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerKimono_girlNaoko2:
	trainer EVENT_BEAT_KIMONO_GIRL_NAOKO, KIMONO_GIRL, NAOKO2, Kimono_girlNaoko2SeenText, Kimono_girlNaoko2BeatenText, $0000, Kimono_girlNaoko2Script

Kimono_girlNaoko2Script:
	talkaftercancel
	loadfont
	writetext UnknownText_0x99579
	closetext
	loadmovesprites
	end

TrainerKimono_girlSayo:
	trainer EVENT_BEAT_KIMONO_GIRL_SAYO, KIMONO_GIRL, SAYO, Kimono_girlSayoSeenText, Kimono_girlSayoBeatenText, $0000, Kimono_girlSayoScript

Kimono_girlSayoScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x9960b
	closetext
	loadmovesprites
	end

TrainerKimono_girlZuki:
	trainer EVENT_BEAT_KIMONO_GIRL_ZUKI, KIMONO_GIRL, ZUKI, Kimono_girlZukiSeenText, Kimono_girlZukiBeatenText, $0000, Kimono_girlZukiScript

Kimono_girlZukiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x99688
	closetext
	loadmovesprites
	end

TrainerKimono_girlKuni:
	trainer EVENT_BEAT_KIMONO_GIRL_KUNI, KIMONO_GIRL, KUNI, Kimono_girlKuniSeenText, Kimono_girlKuniBeatenText, $0000, Kimono_girlKuniScript

Kimono_girlKuniScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x99714
	closetext
	loadmovesprites
	end

TrainerKimono_girlMiki:
	trainer EVENT_BEAT_KIMONO_GIRL_MIKI, KIMONO_GIRL, MIKI, Kimono_girlMikiSeenText, Kimono_girlMikiBeatenText, $0000, Kimono_girlMikiScript

Kimono_girlMikiScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x997a8
	closetext
	loadmovesprites
	end

GentlemanScript_0x994c6:
	faceplayer
	loadfont
	writetext UnknownText_0x9980a
	keeptextopen
	checkevent EVENT_GOT_HM03_SURF
	iftrue UnknownScript_0x99515
	checkevent EVENT_BEAT_KIMONO_GIRL_NAOKO
	iffalse UnknownScript_0x994f3
	checkevent EVENT_BEAT_KIMONO_GIRL_SAYO
	iffalse UnknownScript_0x994f3
	checkevent EVENT_BEAT_KIMONO_GIRL_ZUKI
	iffalse UnknownScript_0x994f3
	checkevent EVENT_BEAT_KIMONO_GIRL_KUNI
	iffalse UnknownScript_0x994f3
	checkevent EVENT_BEAT_KIMONO_GIRL_MIKI
	iffalse UnknownScript_0x994f3
	jump UnknownScript_0x99505

UnknownScript_0x994f3:
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue UnknownScript_0x994ff
	writetext UnknownText_0x99891
	closetext
	loadmovesprites
	end

UnknownScript_0x994ff:
	writetext UnknownText_0x998d4
	closetext
	loadmovesprites
	end

UnknownScript_0x99505:
	writetext UnknownText_0x9991a
	keeptextopen
	verbosegiveitem HM_SURF, 1
	setevent EVENT_GOT_HM03_SURF
	writetext UnknownText_0x9999b
	closetext
	loadmovesprites
	end

UnknownScript_0x99515:
	writetext UnknownText_0x999d5
	closetext
	loadmovesprites
	end

RhydonScript_0x9951b:
	loadfont
	writetext UnknownText_0x99a0a
	cry RHYDON
	closetext
	loadmovesprites
	end

CooltrainerMScript_0x99525:
	jumptextfaceplayer UnknownText_0x99a24

GrannyScript_0x99528:
	jumptextfaceplayer UnknownText_0x99aaa

MapDanceTheatreSignpost1Script:
	jumptext UnknownText_0x99b79

Kimono_girlNaoko2SeenText:
	text "You have lovely"
	line "#MON. May I see"
	cont "them in battle?"
	done

Kimono_girlNaoko2BeatenText:
	text "Oh, you are very"
	line "strong."
	done

UnknownText_0x99579:
	text "I enjoyed that"
	line "bout. I would like"
	cont "to see you again."
	done

Kimono_girlSayoSeenText:
	text "I always dance"
	line "with my #MON."

	para "Of course, I also"
	line "train them."
	done

Kimono_girlSayoBeatenText:
	text "Oh, so close!"
	line "I almost had you."
	done

UnknownText_0x9960b:
	text "Rhythm is impor-"
	line "tant for both"

	para "dancing and #-"
	line "MON."
	done

Kimono_girlZukiSeenText:
	text "Isn't my barrette"
	line "pretty?"

	para "Oh. A #MON"
	line "battle?"
	done

Kimono_girlZukiBeatenText:
	text "I don't have any"
	line "#MON left…"
	done

UnknownText_0x99688:
	text "I put a different"
	line "flower in my bar-"
	cont "rette every month."
	done

Kimono_girlKuniSeenText:
	text "Oh, you're a cute"
	line "trainer. Would you"
	cont "like to battle?"
	done

Kimono_girlKuniBeatenText:
	text "You're stronger"
	line "than you look."
	done

UnknownText_0x99714:
	text "I trained a lot,"
	line "so I thought I was"

	para "a capable trainer."
	line "I guess I'm not."
	done

Kimono_girlMikiSeenText:
	text "Do you like my"
	line "dancing? I'm good"
	cont "at #MON too."
	done

Kimono_girlMikiBeatenText:
	text "Ooh, you're good"
	line "at #MON too."
	done

UnknownText_0x997a8:
	text "I can keep dancing"
	line "because there are"

	para "people who enjoy"
	line "what I do."

	para "My #MON keep my"
	line "spirits up too."
	done

UnknownText_0x9980a:
	text "Not only are the"
	line "KIMONO GIRLS great"

	para "dancers, they're"
	line "also skilled at"
	cont "#MON."

	para "I always challenge"
	line "them, but I've"

	para "never even left a"
	line "scratch…"
	done

UnknownText_0x99891:
	text "Lad! If you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done

UnknownText_0x998d4:
	text "Lassie, if you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done

UnknownText_0x9991a:
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "I want you to have"
	line "this. Don't worry"
	cont "--take it!"
	done

UnknownText_0x9999b:
	text "That's SURF."

	para "It's a move that"
	line "lets #MON swim"
	cont "across water."
	done

UnknownText_0x999d5:
	text "I wish my #MON"
	line "were as elegant as"
	cont "the KIMONO GIRLS…"
	done

UnknownText_0x99a0a:
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done

UnknownText_0x99a24:
	text "That man's always"
	line "with his RHYDON."

	para "Says he wants a"
	line "#MON that can"
	cont "SURF and dance."

	para "Is he trying to"
	line "make a synchro-"
	cont "nized swimming"
	cont "#MON?"
	done

UnknownText_0x99aaa:
	text "The KIMONO GIRLS"
	line "are so beautiful…"

	para "But they have to"
	line "go through rigor-"
	cont "ous training."

	para "And they have to"
	line "learn to follow"

	para "customs before ap-"
	line "pearing in public."

	para "But if you love"
	line "something, any-"
	cont "thing is possible."
	done

UnknownText_0x99b79:
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done

DanceTheatre_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $d, $5, 8, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $d, $6, 8, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 6, 5, SIGNPOST_UP, MapDanceTheatreSignpost1Script
	signpost 6, 6, SIGNPOST_UP, MapDanceTheatreSignpost1Script

.PersonEvents:
	db 9
	person_event SPRITE_KIMONO_GIRL, 6, 4, OW_RIGHT | $12, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 0, TrainerKimono_girlNaoko2, -1
	person_event SPRITE_KIMONO_GIRL, 5, 6, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 0, TrainerKimono_girlSayo, -1
	person_event SPRITE_KIMONO_GIRL, 6, 10, OW_DOWN | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 0, TrainerKimono_girlZuki, -1
	person_event SPRITE_KIMONO_GIRL, 5, 13, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 0, TrainerKimono_girlKuni, -1
	person_event SPRITE_KIMONO_GIRL, 6, 15, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 0, TrainerKimono_girlMiki, -1
	person_event SPRITE_GENTLEMAN, 14, 11, OW_UP | $3, $0, -1, -1, $0, 0, GentlemanScript_0x994c6, -1
	person_event SPRITE_RHYDON, 12, 10, OW_UP | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, RhydonScript_0x9951b, -1
	person_event SPRITE_COOLTRAINER_M, 14, 14, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerMScript_0x99525, -1
	person_event SPRITE_GRANNY, 10, 7, OW_UP | $3, $0, -1, -1, $0, 0, GrannyScript_0x99528, -1
