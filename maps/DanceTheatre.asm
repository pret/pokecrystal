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
	2writetext UnknownText_0x99579
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
	2writetext UnknownText_0x9960b
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
	2writetext UnknownText_0x99688
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
	2writetext UnknownText_0x99714
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
	2writetext UnknownText_0x997a8
	closetext
	loadmovesprites
	end
; 0x994c6

GentlemanScript_0x994c6: ; 0x994c6
	faceplayer
	loadfont
	2writetext UnknownText_0x9980a
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
	2jump UnknownScript_0x99505
; 0x994f3

UnknownScript_0x994f3: ; 0x994f3
	checkbit2 $0063
	iftrue UnknownScript_0x994ff
	2writetext UnknownText_0x99891
	closetext
	loadmovesprites
	end
; 0x994ff

UnknownScript_0x994ff: ; 0x994ff
	2writetext UnknownText_0x998d4
	closetext
	loadmovesprites
	end
; 0x99505

UnknownScript_0x99505: ; 0x99505
	2writetext UnknownText_0x9991a
	keeptextopen
	verbosegiveitem HM_03, 1
	setevent EVENT_GOT_HM03_SURF
	2writetext UnknownText_0x9999b
	closetext
	loadmovesprites
	end
; 0x99515

UnknownScript_0x99515: ; 0x99515
	2writetext UnknownText_0x999d5
	closetext
	loadmovesprites
	end
; 0x9951b

RhydonScript_0x9951b: ; 0x9951b
	loadfont
	2writetext UnknownText_0x99a0a
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
	db $0, "You have lovely", $4f
	db "#MON. May I see", $55
	db "them in battle?", $57
; 0x9955f

Kimono_girlNaoko2BeatenText: ; 0x9955f
	db $0, "Oh, you are very", $4f
	db "strong.", $57
; 0x99579

UnknownText_0x99579: ; 0x99579
	db $0, "I enjoyed that", $4f
	db "bout. I would like", $55
	db "to see you again.", $57
; 0x995ae

Kimono_girlSayoSeenText: ; 0x995ae
	db $0, "I always dance", $4f
	db "with my #MON.", $51
	db "Of course, I also", $4f
	db "train them.", $57
; 0x995ea

Kimono_girlSayoBeatenText: ; 0x995ea
	db $0, "Oh, so close!", $4f
	db "I almost had you.", $57
; 0x9960b

UnknownText_0x9960b: ; 0x9960b
	db $0, "Rhythm is impor-", $4f
	db "tant for both", $51
	db "dancing and #-", $4f
	db "MON.", $57
; 0x9963f

Kimono_girlZukiSeenText: ; 0x9963f
	db $0, "Isn't my barrette", $4f
	db "pretty?", $51
	db "Oh. A #MON", $4f
	db "battle?", $57
; 0x9966c

Kimono_girlZukiBeatenText: ; 0x9966c
	db $0, "I don't have any", $4f
	db "#MON left…", $57
; 0x99688

UnknownText_0x99688: ; 0x99688
	db $0, "I put a different", $4f
	db "flower in my bar-", $55
	db "rette every month.", $57
; 0x996c0

Kimono_girlKuniSeenText: ; 0x996c0
	db $0, "Oh, you're a cute", $4f
	db "trainer. Would you", $55
	db "like to battle?", $57
; 0x996f5

Kimono_girlKuniBeatenText: ; 0x996f5
	db $0, "You're stronger", $4f
	db "than you look.", $57
; 0x99714

UnknownText_0x99714: ; 0x99714
	db $0, "I trained a lot,", $4f
	db "so I thought I was", $51
	db "a capable trainer.", $4f
	db "I guess I'm not.", $57
; 0x9975c

Kimono_girlMikiSeenText: ; 0x9975c
	db $0, "Do you like my", $4f
	db "dancing? I'm good", $55
	db "at #MON too.", $57
; 0x9978a

Kimono_girlMikiBeatenText: ; 0x9978a
	db $0, "Ooh, you're good", $4f
	db "at #MON too.", $57
; 0x997a8

UnknownText_0x997a8: ; 0x997a8
	db $0, "I can keep dancing", $4f
	db "because there are", $51
	db "people who enjoy", $4f
	db "what I do.", $51
	db "My #MON keep my", $4f
	db "spirits up too.", $57
; 0x9980a

UnknownText_0x9980a: ; 0x9980a
	db $0, "Not only are the", $4f
	db "KIMONO GIRLS great", $51
	db "dancers, they're", $4f
	db "also skilled at", $55
	db "#MON.", $51
	db "I always challenge", $4f
	db "them, but I've", $51
	db "never even left a", $4f
	db "scratch…", $57
; 0x99891

UnknownText_0x99891: ; 0x99891
	db $0, "Lad! If you can", $4f
	db "defeat all the", $51
	db "KIMONO GIRLS, I'll", $4f
	db "give you a gift.", $57
; 0x998d4

UnknownText_0x998d4: ; 0x998d4
	db $0, "Lassie, if you can", $4f
	db "defeat all the", $51
	db "KIMONO GIRLS, I'll", $4f
	db "give you a gift.", $57
; 0x9991a

UnknownText_0x9991a: ; 0x9991a
	db $0, "The way you bat-", $4f
	db "tled, it was like", $55
	db "watching a dance.", $51
	db "It was a rare", $4f
	db "treat to see!", $51
	db "I want you to have", $4f
	db "this. Don't worry", $55
	db "--take it!", $57
; 0x9999b

UnknownText_0x9999b: ; 0x9999b
	db $0, "That's SURF.", $51
	db "It's a move that", $4f
	db "lets #MON swim", $55
	db "across water.", $57
; 0x999d5

UnknownText_0x999d5: ; 0x999d5
	db $0, "I wish my #MON", $4f
	db "were as elegant as", $55
	db "the KIMONO GIRLS…", $57
; 0x99a0a

UnknownText_0x99a0a: ; 0x99a0a
	db $0, "RHYDON: Gugooh", $4f
	db "gugogooh!", $57
; 0x99a24

UnknownText_0x99a24: ; 0x99a24
	db $0, "That man's always", $4f
	db "with his RHYDON.", $51
	db "Says he wants a", $4f
	db "#MON that can", $55
	db "SURF and dance.", $51
	db "Is he trying to", $4f
	db "make a synchro-", $55
	db "nized swimming", $55
	db "#MON?", $57
; 0x99aaa

UnknownText_0x99aaa: ; 0x99aaa
	db $0, "The KIMONO GIRLS", $4f
	db "are so beautiful…", $51
	db "But they have to", $4f
	db "go through rigor-", $55
	db "ous training.", $51
	db "And they have to", $4f
	db "learn to follow", $51
	db "customs before ap-", $4f
	db "pearing in public.", $51
	db "But if you love", $4f
	db "something, any-", $55
	db "thing is possible.", $57
; 0x99b79

UnknownText_0x99b79: ; 0x99b79
	db $0, "It's a fancy panel", $4f
	db "that's decorated", $55
	db "with flowers.", $57
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

