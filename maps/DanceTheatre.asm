DanceTheatre_MapScriptHeader: ; 0x99460
	; trigger count
	db 0

	; callback count
	db 0
; 0x99462

TrainerKimono_girlNaoko2: ; 0x99462
	; bit/flag number
	dw $4df

	; trainer group && trainer id
	db KIMONO_GIRL, NAOKO2

	; text when seen
	dw Kimono_girlNaoko2SeenText

	; text when trainer beaten
	dw Kimono_girlNaoko2BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Kimono_girlNaoko2Script
; 0x9946e

Kimono_girlNaoko2Script: ; 0x9946e
	talkaftercancel
	loadfont
	writetext UnknownText_0x99579
	closetext
	loadmovesprites
	end
; 0x99476

TrainerKimono_girlSayo: ; 0x99476
	; bit/flag number
	dw $4e0

	; trainer group && trainer id
	db KIMONO_GIRL, SAYO

	; text when seen
	dw Kimono_girlSayoSeenText

	; text when trainer beaten
	dw Kimono_girlSayoBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Kimono_girlSayoScript
; 0x99482

Kimono_girlSayoScript: ; 0x99482
	talkaftercancel
	loadfont
	writetext UnknownText_0x9960b
	closetext
	loadmovesprites
	end
; 0x9948a

TrainerKimono_girlZuki: ; 0x9948a
	; bit/flag number
	dw $4e1

	; trainer group && trainer id
	db KIMONO_GIRL, ZUKI

	; text when seen
	dw Kimono_girlZukiSeenText

	; text when trainer beaten
	dw Kimono_girlZukiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Kimono_girlZukiScript
; 0x99496

Kimono_girlZukiScript: ; 0x99496
	talkaftercancel
	loadfont
	writetext UnknownText_0x99688
	closetext
	loadmovesprites
	end
; 0x9949e

TrainerKimono_girlKuni: ; 0x9949e
	; bit/flag number
	dw $4e2

	; trainer group && trainer id
	db KIMONO_GIRL, KUNI

	; text when seen
	dw Kimono_girlKuniSeenText

	; text when trainer beaten
	dw Kimono_girlKuniBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Kimono_girlKuniScript
; 0x994aa

Kimono_girlKuniScript: ; 0x994aa
	talkaftercancel
	loadfont
	writetext UnknownText_0x99714
	closetext
	loadmovesprites
	end
; 0x994b2

TrainerKimono_girlMiki: ; 0x994b2
	; bit/flag number
	dw $4e3

	; trainer group && trainer id
	db KIMONO_GIRL, MIKI

	; text when seen
	dw Kimono_girlMikiSeenText

	; text when trainer beaten
	dw Kimono_girlMikiBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Kimono_girlMikiScript
; 0x994be

Kimono_girlMikiScript: ; 0x994be
	talkaftercancel
	loadfont
	writetext UnknownText_0x997a8
	closetext
	loadmovesprites
	end
; 0x994c6

GentlemanScript_0x994c6: ; 0x994c6
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
; 0x994f3

UnknownScript_0x994f3: ; 0x994f3
	checkflag $0063
	iftrue UnknownScript_0x994ff
	writetext UnknownText_0x99891
	closetext
	loadmovesprites
	end
; 0x994ff

UnknownScript_0x994ff: ; 0x994ff
	writetext UnknownText_0x998d4
	closetext
	loadmovesprites
	end
; 0x99505

UnknownScript_0x99505: ; 0x99505
	writetext UnknownText_0x9991a
	keeptextopen
	verbosegiveitem HM_03, 1
	setevent EVENT_GOT_HM03_SURF
	writetext UnknownText_0x9999b
	closetext
	loadmovesprites
	end
; 0x99515

UnknownScript_0x99515: ; 0x99515
	writetext UnknownText_0x999d5
	closetext
	loadmovesprites
	end
; 0x9951b

RhydonScript_0x9951b: ; 0x9951b
	loadfont
	writetext UnknownText_0x99a0a
	cry RHYDON
	closetext
	loadmovesprites
	end
; 0x99525

CooltrainerMScript_0x99525: ; 0x99525
	jumptextfaceplayer UnknownText_0x99a24
; 0x99528

GrannyScript_0x99528: ; 0x99528
	jumptextfaceplayer UnknownText_0x99aaa
; 0x9952b

MapDanceTheatreSignpost1Script: ; 0x9952b
	jumptext UnknownText_0x99b79
; 0x9952e

Kimono_girlNaoko2SeenText: ; 0x9952e
	text "You have lovely"
	line "#MON. May I see"
	cont "them in battle?"
	done
; 0x9955f

Kimono_girlNaoko2BeatenText: ; 0x9955f
	text "Oh, you are very"
	line "strong."
	done
; 0x99579

UnknownText_0x99579: ; 0x99579
	text "I enjoyed that"
	line "bout. I would like"
	cont "to see you again."
	done
; 0x995ae

Kimono_girlSayoSeenText: ; 0x995ae
	text "I always dance"
	line "with my #MON."

	para "Of course, I also"
	line "train them."
	done
; 0x995ea

Kimono_girlSayoBeatenText: ; 0x995ea
	text "Oh, so close!"
	line "I almost had you."
	done
; 0x9960b

UnknownText_0x9960b: ; 0x9960b
	text "Rhythm is impor-"
	line "tant for both"

	para "dancing and #-"
	line "MON."
	done
; 0x9963f

Kimono_girlZukiSeenText: ; 0x9963f
	text "Isn't my barrette"
	line "pretty?"

	para "Oh. A #MON"
	line "battle?"
	done
; 0x9966c

Kimono_girlZukiBeatenText: ; 0x9966c
	text "I don't have any"
	line "#MON left…"
	done
; 0x99688

UnknownText_0x99688: ; 0x99688
	text "I put a different"
	line "flower in my bar-"
	cont "rette every month."
	done
; 0x996c0

Kimono_girlKuniSeenText: ; 0x996c0
	text "Oh, you're a cute"
	line "trainer. Would you"
	cont "like to battle?"
	done
; 0x996f5

Kimono_girlKuniBeatenText: ; 0x996f5
	text "You're stronger"
	line "than you look."
	done
; 0x99714

UnknownText_0x99714: ; 0x99714
	text "I trained a lot,"
	line "so I thought I was"

	para "a capable trainer."
	line "I guess I'm not."
	done
; 0x9975c

Kimono_girlMikiSeenText: ; 0x9975c
	text "Do you like my"
	line "dancing? I'm good"
	cont "at #MON too."
	done
; 0x9978a

Kimono_girlMikiBeatenText: ; 0x9978a
	text "Ooh, you're good"
	line "at #MON too."
	done
; 0x997a8

UnknownText_0x997a8: ; 0x997a8
	text "I can keep dancing"
	line "because there are"

	para "people who enjoy"
	line "what I do."

	para "My #MON keep my"
	line "spirits up too."
	done
; 0x9980a

UnknownText_0x9980a: ; 0x9980a
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
; 0x99891

UnknownText_0x99891: ; 0x99891
	text "Lad! If you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done
; 0x998d4

UnknownText_0x998d4: ; 0x998d4
	text "Lassie, if you can"
	line "defeat all the"

	para "KIMONO GIRLS, I'll"
	line "give you a gift."
	done
; 0x9991a

UnknownText_0x9991a: ; 0x9991a
	text "The way you bat-"
	line "tled, it was like"
	cont "watching a dance."

	para "It was a rare"
	line "treat to see!"

	para "I want you to have"
	line "this. Don't worry"
	cont "--take it!"
	done
; 0x9999b

UnknownText_0x9999b: ; 0x9999b
	text "That's SURF."

	para "It's a move that"
	line "lets #MON swim"
	cont "across water."
	done
; 0x999d5

UnknownText_0x999d5: ; 0x999d5
	text "I wish my #MON"
	line "were as elegant as"
	cont "the KIMONO GIRLS…"
	done
; 0x99a0a

UnknownText_0x99a0a: ; 0x99a0a
	text "RHYDON: Gugooh"
	line "gugogooh!"
	done
; 0x99a24

UnknownText_0x99a24: ; 0x99a24
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
; 0x99aaa

UnknownText_0x99aaa: ; 0x99aaa
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
; 0x99b79

UnknownText_0x99b79: ; 0x99b79
	text "It's a fancy panel"
	line "that's decorated"
	cont "with flowers."
	done
; 0x99baa

DanceTheatre_MapEventHeader: ; 0x99baa
	; filler
	db 0, 0

	; warps
	db 2
	warp_def $d, $5, 8, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY
	warp_def $d, $6, 8, GROUP_ECRUTEAK_CITY, MAP_ECRUTEAK_CITY

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 6, 5, $1, MapDanceTheatreSignpost1Script
	signpost 6, 6, $1, MapDanceTheatreSignpost1Script

	; people-events
	db 9
	person_event SPRITE_KIMONO_GIRL, 6, 4, $1e, $0, 255, 255, $a2, 0, TrainerKimono_girlNaoko2, $ffff
	person_event SPRITE_KIMONO_GIRL, 5, 6, $a, $0, 255, 255, $92, 0, TrainerKimono_girlSayo, $ffff
	person_event SPRITE_KIMONO_GIRL, 6, 10, $3, $0, 255, 255, $82, 0, TrainerKimono_girlZuki, $ffff
	person_event SPRITE_KIMONO_GIRL, 5, 13, $a, $0, 255, 255, $92, 0, TrainerKimono_girlKuni, $ffff
	person_event SPRITE_KIMONO_GIRL, 6, 15, $1f, $0, 255, 255, $a2, 0, TrainerKimono_girlMiki, $ffff
	person_event SPRITE_GENTLEMAN, 14, 11, $7, $0, 255, 255, $0, 0, GentlemanScript_0x994c6, $ffff
	person_event SPRITE_RHYDON, 12, 10, $16, $0, 255, 255, $90, 0, RhydonScript_0x9951b, $ffff
	person_event SPRITE_COOLTRAINER_M, 14, 14, $8, $0, 255, 255, $80, 0, CooltrainerMScript_0x99525, $ffff
	person_event SPRITE_GRANNY, 10, 7, $7, $0, 255, 255, $0, 0, GrannyScript_0x99528, $ffff
; 0x99c39
