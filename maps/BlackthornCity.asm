BlackthornCity_MapScriptHeader: ; 0x1a46d0
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x1a46d8

	dbw 2, UnknownScript_0x1a46dc
; 0x1a46d8

UnknownScript_0x1a46d8: ; 0x1a46d8
	setbit2 $004b
	return
; 0x1a46dc

UnknownScript_0x1a46dc: ; 0x1a46dc
	checkcode $b
	if_equal SATURDAY, UnknownScript_0x1a46e5
	disappear $9
	return
; 0x1a46e5

UnknownScript_0x1a46e5: ; 0x1a46e5
	appear $9
	return
; 0x1a46e8

SuperNerdScript_0x1a46e8: ; 0x1a46e8
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CLAIR
	iftrue UnknownScript_0x1a4702
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a46fc
	2writetext UnknownText_0x1a477a
	closetext
	loadmovesprites
	end
; 0x1a46fc

UnknownScript_0x1a46fc: ; 0x1a46fc
	2writetext UnknownText_0x1a47f3
	closetext
	loadmovesprites
	end
; 0x1a4702

UnknownScript_0x1a4702: ; 0x1a4702
	2writetext UnknownText_0x1a4865
	closetext
	loadmovesprites
	end
; 0x1a4708

GrampsScript_0x1a4708: ; 0x1a4708
	jumptextfaceplayer UnknownText_0x1a48c3
; 0x1a470b

GrampsScript_0x1a470b: ; 0x1a470b
	jumptextfaceplayer UnknownText_0x1a48fb
; 0x1a470e

BlackBeltScript_0x1a470e: ; 0x1a470e
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a471c
	2writetext UnknownText_0x1a494a
	closetext
	loadmovesprites
	end
; 0x1a471c

UnknownScript_0x1a471c: ; 0x1a471c
	2writetext UnknownText_0x1a4983
	closetext
	loadmovesprites
	end
; 0x1a4722

CooltrainerFScript_0x1a4722: ; 0x1a4722
	jumptextfaceplayer UnknownText_0x1a49bd
; 0x1a4725

YoungsterScript_0x1a4725: ; 0x1a4725
	jumptextfaceplayer UnknownText_0x1a49f1
; 0x1a4728

CooltrainerFScript_0x1a4728: ; 0x1a4728
	jumptextfaceplayer UnknownText_0x1a4b1e
; 0x1a472b

YoungsterScript_0x1a472b: ; 0x1a472b
	faceplayer
	loadfont
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue UnknownScript_0x1a4759
	checkcode $b
	if_not_equal SATURDAY, UnknownScript_0x1a475f
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue UnknownScript_0x1a4746
	2writetext UnknownText_0x1a4a27
	keeptextopen
	setevent EVENT_MET_SANTOS_OF_SATURDAY
UnknownScript_0x1a4746: ; 0x1a4746
	2writetext UnknownText_0x1a4a57
	keeptextopen
	verbosegiveitem SPELL_TAG, 1
	iffalse UnknownScript_0x1a475d
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	2writetext UnknownText_0x1a4a6b
	closetext
	loadmovesprites
	end
; 0x1a4759

UnknownScript_0x1a4759: ; 0x1a4759
	2writetext UnknownText_0x1a4ab6
	closetext
UnknownScript_0x1a475d: ; 0x1a475d
	loadmovesprites
	end
; 0x1a475f

UnknownScript_0x1a475f: ; 0x1a475f
	2writetext UnknownText_0x1a4b00
	closetext
	loadmovesprites
	end
; 0x1a4765

MapBlackthornCitySignpost0Script: ; 0x1a4765
	jumptext UnknownText_0x1a4b67
; 0x1a4768

MapBlackthornCitySignpost1Script: ; 0x1a4768
	jumptext UnknownText_0x1a4b91
; 0x1a476b

MapBlackthornCitySignpost2Script: ; 0x1a476b
	jumptext UnknownText_0x1a4bd9
; 0x1a476e

MapBlackthornCitySignpost3Script: ; 0x1a476e
	jumptext UnknownText_0x1a4bef
; 0x1a4771

MapBlackthornCitySignpost4Script: ; 0x1a4771
	jumptext UnknownText_0x1a4c03
; 0x1a4774

MapBlackthornCitySignpost6Script: ; 0x1a4774
	jumpstd $0010
; 0x1a4777

MapBlackthornCitySignpost5Script: ; 0x1a4777
	jumpstd $0011
; 0x1a477a

UnknownText_0x1a477a: ; 0x1a477a
	db $0, "I am sorry.", $51
	db "CLAIR, our GYM", $4f
	db "LEADER, entered", $51
	db "the DRAGON'S DEN", $4f
	db "behind the GYM.", $51
	db "I have no idea", $4f
	db "when our LEADER", $55
	db "will return.", $57
; 0x1a47f3

UnknownText_0x1a47f3: ; 0x1a47f3
	db $0, "CLAIR, our GYM", $4f
	db "LEADER, is waiting", $55
	db "for you.", $51
	db "However, it would", $4f
	db "be impossible for", $51
	db "a run-of-the-mill", $4f
	db "trainer to win.", $57
; 0x1a4865

UnknownText_0x1a4865: ; 0x1a4865
	db $0, "You defeated", $4f
	db "CLAIR?", $51
	db "That's amazing!", $51
	db "I've never heard", $4f
	db "of her losing to", $51
	db "anyone other than", $4f
	db "LANCE.", $57
; 0x1a48c3

UnknownText_0x1a48c3: ; 0x1a48c3
	db $0, "No. Only chosen", $4f
	db "trainers may train", $51
	db "here.", $4f
	db "Please leave.", $57
; 0x1a48fb

UnknownText_0x1a48fb: ; 0x1a48fb
	db $0, "If CLAIR allows", $4f
	db "it, her grand-", $55
	db "father--our MASTER", $55
	db "--will also.", $51
	db "You may enter.", $57
; 0x1a494a

UnknownText_0x1a494a: ; 0x1a494a
	db $0, "My radio's busted?", $4f
	db "Lately, I only get", $55
	db "this weird signal.", $57
; 0x1a4983

UnknownText_0x1a4983: ; 0x1a4983
	db $0, "Arooo! Voices in", $4f
	db "my head!", $51
	db "Huh? I'm listening", $4f
	db "to my radio!", $57
; 0x1a49bd

UnknownText_0x1a49bd: ; 0x1a49bd
	db $0, "Are you going to", $4f
	db "make your #MON", $55
	db "forget some moves?", $57
; 0x1a49f1

UnknownText_0x1a49f1: ; 0x1a49f1
	db $0, "Dragon masters all", $4f
	db "come from the city", $55
	db "of BLACKTHORN.", $57
; 0x1a4a27

UnknownText_0x1a4a27: ; 0x1a4a27
	db $0, "SANTOS: …", $51
	db "It's Saturday…", $51
	db "I'm SANTOS of", $4f
	db "Saturday…", $57
; 0x1a4a57

UnknownText_0x1a4a57: ; 0x1a4a57
	db $0, "You can have this…", $57
; 0x1a4a6b

UnknownText_0x1a4a6b: ; 0x1a4a6b
	db $0, "SANTOS: …", $51
	db "SPELL TAG…", $51
	db "Ghost-type moves", $4f
	db "get stronger…", $51
	db "It will frighten", $4f
	db "you…", $57
; 0x1a4ab6

UnknownText_0x1a4ab6: ; 0x1a4ab6
	db $0, "SANTOS: …", $51
	db "See you again on", $4f
	db "another Saturday…", $51
	db "I won't have any", $4f
	db "more gifts…", $57
; 0x1a4b00

UnknownText_0x1a4b00: ; 0x1a4b00
	db $0, "SANTOS: Today's", $4f
	db "not Saturday…", $57
; 0x1a4b1e

UnknownText_0x1a4b1e: ; 0x1a4b1e
	db $0, "Wow, you came", $4f
	db "through the ICE", $55
	db "PATH?", $51
	db "You must be a real", $4f
	db "hotshot trainer!", $57
; 0x1a4b67

UnknownText_0x1a4b67: ; 0x1a4b67
	db $0, "BLACKTHORN CITY", $51
	db "A Quiet Mountain", $4f
	db "Retreat", $57
; 0x1a4b91

UnknownText_0x1a4b91: ; 0x1a4b91
	db $0, "BLACKTHORN CITY", $4f
	db "#MON GYM", $55
	db "LEADER: CLAIR", $51
	db "The Blessed User", $4f
	db "of Dragon #MON", $57
; 0x1a4bd9

UnknownText_0x1a4bd9: ; 0x1a4bd9
	db $0, "MOVE DELETER'S", $4f
	db "HOUSE", $57
; 0x1a4bef

UnknownText_0x1a4bef: ; 0x1a4bef
	db $0, "DRAGON'S DEN", $4f
	db "AHEAD", $57
; 0x1a4c03

UnknownText_0x1a4c03: ; 0x1a4c03
	db $0, "TRAINER TIPS", $51
	db "A #MON holding", $4f
	db "a MIRACLEBERRY", $51
	db "will cure itself", $4f
	db "of any status", $55
	db "problem.", $57
; 0x1a4c57

BlackthornCity_MapEventHeader: ; 0x1a4c57
	; filler
	db 0, 0

	; warps
	db 8
	warp_def $b, $12, 1, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $15, $d, 1, GROUP_BLACKTHORN_DRAGON_SPEECH_HOUSE, MAP_BLACKTHORN_DRAGON_SPEECH_HOUSE
	warp_def $17, $1d, 1, GROUP_BLACKTHORN_DODRIO_TRADE_HOUSE, MAP_BLACKTHORN_DODRIO_TRADE_HOUSE
	warp_def $1d, $f, 2, GROUP_BLACKTHORN_MART, MAP_BLACKTHORN_MART
	warp_def $1d, $15, 1, GROUP_BLACKTHORN_POKECENTER_1F, MAP_BLACKTHORN_POKECENTER_1F
	warp_def $1f, $9, 1, GROUP_MOVE_DELETERS_HOUSE, MAP_MOVE_DELETERS_HOUSE
	warp_def $9, $24, 2, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $1, $14, 1, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F

	; xy triggers
	db 0

	; signposts
	db 7
	signpost 24, 34, $0, MapBlackthornCitySignpost0Script
	signpost 13, 17, $0, MapBlackthornCitySignpost1Script
	signpost 31, 7, $0, MapBlackthornCitySignpost2Script
	signpost 3, 21, $0, MapBlackthornCitySignpost3Script
	signpost 25, 5, $0, MapBlackthornCitySignpost4Script
	signpost 29, 16, $0, MapBlackthornCitySignpost5Script
	signpost 29, 22, $0, MapBlackthornCitySignpost6Script

	; people-events
	db 9
	person_event SPRITE_SUPER_NERD, 16, 22, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x1a46e8, $06e3
	person_event SPRITE_SUPER_NERD, 16, 23, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x1a46e8, $06e4
	person_event SPRITE_GRAMPS, 6, 24, $6, $0, 255, 255, $0, 0, GrampsScript_0x1a4708, $074c
	person_event SPRITE_GRAMPS, 6, 25, $8, $0, 255, 255, $0, 0, GrampsScript_0x1a470b, $074d
	person_event SPRITE_BLACK_BELT, 35, 28, $5, $1, 255, 255, $90, 0, BlackBeltScript_0x1a470e, $ffff
	person_event SPRITE_COOLTRAINER_F, 29, 13, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x1a4722, $ffff
	person_event SPRITE_YOUNGSTER, 19, 17, $5, $1, 255, 255, $0, 0, YoungsterScript_0x1a4725, $ffff
	person_event SPRITE_YOUNGSTER, 24, 26, $6, $0, 255, 255, $0, 0, YoungsterScript_0x1a472b, $075d
	person_event SPRITE_COOLTRAINER_F, 23, 39, $7, $0, 255, 255, $a0, 0, CooltrainerFScript_0x1a4728, $ffff
; 0x1a4d1d

