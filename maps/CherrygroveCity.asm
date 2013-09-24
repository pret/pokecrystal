CherrygroveCity_MapScriptHeader: ; 0x19c000
	; trigger count
	db 2

	; triggers
	dw UnknownScript_0x19c00d, $0000
	dw UnknownScript_0x19c00e, $0000

	; callback count
	db 1

	; callbacks

	dbw 5, UnknownScript_0x19c00f
; 0x19c00d

UnknownScript_0x19c00d: ; 0x19c00d
	end
; 0x19c00e

UnknownScript_0x19c00e: ; 0x19c00e
	end
; 0x19c00f

UnknownScript_0x19c00f: ; 0x19c00f
	setbit2 $0042
	return
; 0x19c013

GrampsScript_0x19c013: ; 0x19c013
	faceplayer
	loadfont
	2writetext UnknownText_0x19c1e3
	yesorno
	iffalse UnknownScript_0x19c0a4
	2jump UnknownScript_0x19c01f
; 0x19c01f

UnknownScript_0x19c01f: ; 0x19c01f
	2writetext UnknownText_0x19c26f
	closetext
	loadmovesprites
	playmusic $0011
	follow $2, $0
	applymovement $2, MovementData_0x19c195
	loadfont
	2writetext UnknownText_0x19c285
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x19c19b
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x19c304
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x19c1a3
	spriteface $0, $1
	loadfont
	2writetext UnknownText_0x19c359
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x19c1ac
	spriteface $0, $2
	loadfont
	2writetext UnknownText_0x19c3a7
	closetext
	loadmovesprites
	applymovement $2, MovementData_0x19c1b6
	spriteface $0, $1
	pause 60
	spriteface $2, $2
	spriteface $0, $3
	loadfont
	2writetext UnknownText_0x19c3ec
	keeptextopen
	stringtotext .mapcardname, $1
	2call .UnknownScript_0x19c097
	setbit2 $0001
	2writetext UnknownText_0x19c438
	keeptextopen
	2writetext UnknownText_0x19c451
	closetext
	loadmovesprites
	stopfollow
	special $003d
	spriteface $0, $1
	applymovement $2, MovementData_0x19c1cb
	playsound $001f
	disappear $2
	clearevent EVENT_GUIDE_GENT_VISIBLE_IN_CHERRYGROVE
	waitbutton
	end

.UnknownScript_0x19c097 ; 0x19c097
	jumpstd $002f
	end

.mapcardname ; 0x19c09b
	db "MAP CARD@"
; 0x19c0a4

UnknownScript_0x19c0a4: ; 0x19c0a4
	2writetext UnknownText_0x19c49f
	closetext
	loadmovesprites
	end
; 0x19c0aa

UnknownScript_0x19c0aa: ; 0x19c0aa
	moveperson $3, $27, $7
; 0x19c0ae

UnknownScript_0x19c0ae: ; 0x19c0ae
	spriteface $0, $3
	showemote $0, $0, 15
	special $006a
	pause 15
	appear $3
	applymovement $3, MovementData_0x19c1ce
	spriteface $0, $3
	playmusic $001f
	loadfont
	2writetext UnknownText_0x19c4e2
	closetext
	loadmovesprites
	checkevent EVENT_GOT_TOTODILE_FROM_ELM
	iftrue UnknownScript_0x19c0ee
	checkevent EVENT_GOT_CHIKORITA_FROM_ELM
	iftrue UnknownScript_0x19c104
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_3
	writecode $3, $1
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	2jump UnknownScript_0x19c126
; 0x19c0ee

UnknownScript_0x19c0ee: ; 0x19c0ee
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_1
	writecode $3, $1
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	2jump UnknownScript_0x19c126
; 0x19c104

UnknownScript_0x19c104: ; 0x19c104
	winlosstext UnknownText_0x19c57f, UnknownText_0x19c5e6
	setlasttalked $3
	loadtrainer RIVAL1, RIVAL1_2
	writecode $3, $1
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	2jump UnknownScript_0x19c126
; 0x19c11a

UnknownScript_0x19c11a: ; 0x19c11a
	playmusic $0020
	loadfont
	2writetext UnknownText_0x19c608
	closetext
	loadmovesprites
	2jump UnknownScript_0x19c12f
; 0x19c126

UnknownScript_0x19c126: ; 0x19c126
	playmusic $0020
	loadfont
	2writetext UnknownText_0x19c59e
	closetext
	loadmovesprites
UnknownScript_0x19c12f: ; 0x19c12f
	playsound $0041
	applymovement $0, MovementData_0x19c1d4
	spriteface $0, $2
	applymovement $3, MovementData_0x19c1da
	disappear $3
	dotrigger $0
	special $001b
	playmapmusic
	end
; 0x19c146

TeacherScript_0x19c146: ; 0x19c146
	faceplayer
	loadfont
	checkbit2 $0001
	iftrue UnknownScript_0x19c154
	2writetext UnknownText_0x19c650
	closetext
	loadmovesprites
	end
; 0x19c154

UnknownScript_0x19c154: ; 0x19c154
	2writetext UnknownText_0x19c6a8
	closetext
	loadmovesprites
	end
; 0x19c15a

YoungsterScript_0x19c15a: ; 0x19c15a
	faceplayer
	loadfont
	checkbit2 $000b
	iftrue UnknownScript_0x19c168
	2writetext UnknownText_0x19c6d6
	closetext
	loadmovesprites
	end
; 0x19c168

UnknownScript_0x19c168: ; 0x19c168
	2writetext UnknownText_0x19c701
	closetext
	loadmovesprites
	end
; 0x19c16e

FisherScript_0x19c16e: ; 0x19c16e
	faceplayer
	loadfont
	checkevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
	iftrue UnknownScript_0x19c183
	2writetext UnknownText_0x19c766
	keeptextopen
	verbosegiveitem MYSTIC_WATER, 1
	iffalse UnknownScript_0x19c187
	setevent EVENT_GOT_MYSTIC_WATER_IN_CHERRYGROVE
UnknownScript_0x19c183: ; 0x19c183
	2writetext UnknownText_0x19c7c1
	closetext
UnknownScript_0x19c187: ; 0x19c187
	loadmovesprites
	end
; 0x19c189

MapCherrygroveCitySignpost0Script: ; 0x19c189
	jumptext UnknownText_0x19c7e0
; 0x19c18c

MapCherrygroveCitySignpost1Script: ; 0x19c18c
	jumptext UnknownText_0x19c815
; 0x19c18f

MapCherrygroveCitySignpost3Script: ; 0x19c18f
	jumpstd $0010
; 0x19c192

MapCherrygroveCitySignpost2Script: ; 0x19c192
	jumpstd $0011
; 0x19c195

MovementData_0x19c195: ; 0x19c195
	step_left
	step_left
	step_up
	step_left
	turn_head_up
	step_end
; 0x19c19b

MovementData_0x19c19b: ; 0x19c19b
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x19c1a3

MovementData_0x19c1a3: ; 0x19c1a3
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	turn_head_up
	step_end
; 0x19c1ac

MovementData_0x19c1ac: ; 0x19c1ac
	step_left
	step_left
	step_left
	step_down
	step_left
	step_left
	step_left
	step_down
	turn_head_left
	step_end
; 0x19c1b6

MovementData_0x19c1b6: ; 0x19c1b6
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_right
	step_down
	step_down
	step_right
	step_right
	step_right
	step_right
	step_right
	turn_head_up
	step_end
; 0x19c1cb

MovementData_0x19c1cb: ; 0x19c1cb
	step_up
	step_up
	step_end
; 0x19c1ce

MovementData_0x19c1ce: ; 0x19c1ce
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end
; 0x19c1d4

MovementData_0x19c1d4: ; 0x19c1d4
	big_step_down
	turn_head_up
	step_end
; 0x19c1d7

MovementData_0x19c1d7: ; 0x19c1d7
	step_left
	turn_head_down
	step_end
; 0x19c1da

MovementData_0x19c1da: ; 0x19c1da
	big_step_left
	big_step_left
	big_step_left
	big_step_left
	big_step_up
	big_step_up
	big_step_left
	big_step_left
	step_end
; 0x19c1e3

UnknownText_0x19c1e3: ; 0x19c1e3
	db $0, "You're a rookie", $4f
	db "trainer, aren't", $55
	db "you? I can tell!", $51
	db "That's OK! Every-", $4f
	db "one is a rookie", $55
	db "at some point!", $51
	db "If you'd like, I", $4f
	db "can teach you a", $55
	db "few things.", $57
; 0x19c26f

UnknownText_0x19c26f: ; 0x19c26f
	db $0, "OK, then!", $4f
	db "Follow me!", $57
; 0x19c285

UnknownText_0x19c285: ; 0x19c285
	db $0, "This is a #MON", $4f
	db "CENTER. They heal", $51
	db "your #MON in no", $4f
	db "time at all.", $51
	db "You'll be relying", $4f
	db "on them a lot, so", $51
	db "you better learn", $4f
	db "about them.", $57
; 0x19c304

UnknownText_0x19c304: ; 0x19c304
	db $0, "This is a #MON", $4f
	db "MART.", $51
	db "They sell BALLS", $4f
	db "for catching wild", $51
	db "#MON and other", $4f
	db "useful items.", $57
; 0x19c359

UnknownText_0x19c359: ; 0x19c359
	db $0, "ROUTE 30 is out", $4f
	db "this way.", $51
	db "Trainers will be", $4f
	db "battling their", $51
	db "prized #MON", $4f
	db "there.", $57
; 0x19c3a7

UnknownText_0x19c3a7: ; 0x19c3a7
	db $0, "This is the sea,", $4f
	db "as you can see.", $51
	db "Some #MON are", $4f
	db "found only in", $55
	db "water.", $57
; 0x19c3ec

UnknownText_0x19c3ec: ; 0x19c3ec
	db $0, "Here…", $51
	db "It's my house!", $4f
	db "Thanks for your", $55
	db "company.", $51
	db "Let me give you a", $4f
	db "small gift.", $57
; 0x19c438

UnknownText_0x19c438: ; 0x19c438
	db $0, $52, "'s #GEAR", $4f
	db "now has a MAP!", $57
; 0x19c451

UnknownText_0x19c451: ; 0x19c451
	db $0, "#GEAR becomes", $4f
	db "more useful as you", $55
	db "add CARDS.", $51
	db "I wish you luck on", $4f
	db "your journey!", $57
; 0x19c49f

UnknownText_0x19c49f: ; 0x19c49f
	db $0, "Oh… It's something", $4f
	db "I enjoy doing…", $51
	db "Fine. Come see me", $4f
	db "when you like.", $57
; 0x19c4e2

UnknownText_0x19c4e2: ; 0x19c4e2
	db $0, $56, " ", $56, " ", $56, $51
	db "You got a #MON", $4f
	db "at the LAB.", $51
	db "What a waste.", $4f
	db "A wimp like you.", $51
	db $56, " ", $56, " ", $56, $51
	db "Don't you get what", $4f
	db "I'm saying?", $51
	db "Well, I too, have", $4f
	db "a good #MON.", $51
	db "I'll show you", $4f
	db "what I mean!", $57
; 0x19c57f

UnknownText_0x19c57f: ; 0x19c57f
	db $0, "Humph. Are you", $4f
	db "happy you won?", $57
; 0x19c59e

UnknownText_0x19c59e: ; 0x19c59e
	db $0, $56, " ", $56, " ", $56, $51
	db "My name's ???.", $51
	db "I'm going to be", $4f
	db "the world's great-", $55
	db "est #MON", $55
	db "trainer.", $57
; 0x19c5e6

UnknownText_0x19c5e6: ; 0x19c5e6
	db $0, "Humph. That was a", $4f
	db "waste of time.", $57
; 0x19c608

UnknownText_0x19c608: ; 0x19c608
	db $0, $56, " ", $56, " ", $56, $51
	db "My name's ???.", $51
	db "I'm going to be", $4f
	db "the world's great-", $55
	db "est #MON", $55
	db "trainer.", $57
; 0x19c650

UnknownText_0x19c650: ; 0x19c650
	db $0, "Did you talk to", $4f
	db "the old man by the", $55
	db "#MON CENTER?", $51
	db "He'll put a MAP of", $4f
	db "JOHTO on your", $55
	db "#GEAR.", $57
; 0x19c6a8

UnknownText_0x19c6a8: ; 0x19c6a8
	db $0, "When you're with", $4f
	db "#MON, going", $55
	db "anywhere is fun.", $57
; 0x19c6d6

UnknownText_0x19c6d6: ; 0x19c6d6
	db $0, "MR.#MON's house", $4f
	db "is still farther", $55
	db "up ahead.", $57
; 0x19c701

UnknownText_0x19c701: ; 0x19c701
	db $0, "I battled the", $4f
	db "trainers on the", $55
	db "road.", $51
	db "My #MON lost.", $4f
	db "They're a mess! I", $51
	db "must take them to", $4f
	db "a #MON CENTER.", $57
; 0x19c766

UnknownText_0x19c766: ; 0x19c766
	db $0, "A #MON I caught", $4f
	db "had an item.", $51
	db "I think it's", $4f
	db "MYSTIC WATER.", $51
	db "I don't need it,", $4f
	db "so do you want it?", $57
; 0x19c7c1

UnknownText_0x19c7c1: ; 0x19c7c1
	db $0, "Back to fishing", $4f
	db "for me, then.", $57
; 0x19c7e0

UnknownText_0x19c7e0: ; 0x19c7e0
	db $0, "CHERRYGROVE CITY", $51
	db "The City of Cute,", $4f
	db "Fragrant Flowers", $57
; 0x19c815

UnknownText_0x19c815: ; 0x19c815
	db $0, "GUIDE GENT'S HOUSE", $57
; 0x19c829

CherrygroveCity_MapEventHeader: ; 0x19c829
	; filler
	db 0, 0

	; warps
	db 5
	warp_def $3, $17, 2, GROUP_CHERRYGROVE_MART, MAP_CHERRYGROVE_MART
	warp_def $3, $1d, 1, GROUP_CHERRYGROVE_POKECENTER_1F, MAP_CHERRYGROVE_POKECENTER_1F
	warp_def $7, $11, 1, GROUP_CHERRYGROVE_GYM_SPEECH_HOUSE, MAP_CHERRYGROVE_GYM_SPEECH_HOUSE
	warp_def $9, $19, 1, GROUP_GUIDE_GENTS_HOUSE, MAP_GUIDE_GENTS_HOUSE
	warp_def $b, $1f, 1, GROUP_CHERRYGROVE_EVOLUTION_SPEECH_HOUSE, MAP_CHERRYGROVE_EVOLUTION_SPEECH_HOUSE

	; xy triggers
	db 2
	xy_trigger 1, $6, $21, $0, UnknownScript_0x19c0ae, $0, $0
	xy_trigger 1, $7, $21, $0, UnknownScript_0x19c0aa, $0, $0

	; signposts
	db 4
	signpost 8, 30, $0, MapCherrygroveCitySignpost0Script
	signpost 9, 23, $0, MapCherrygroveCitySignpost1Script
	signpost 3, 24, $0, MapCherrygroveCitySignpost2Script
	signpost 3, 30, $0, MapCherrygroveCitySignpost3Script

	; people-events
	db 5
	person_event SPRITE_GRAMPS, 10, 36, $6, $0, 255, 255, $0, 0, GrampsScript_0x19c013, $06fe
	person_event SPRITE_SILVER, 10, 43, $3, $0, 255, 255, $0, 0, ObjectEvent, $06be
	person_event SPRITE_TEACHER, 16, 31, $5, $1, 255, 255, $90, 0, TeacherScript_0x19c146, $ffff
	person_event SPRITE_YOUNGSTER, 11, 27, $5, $1, 255, 255, $80, 0, YoungsterScript_0x19c15a, $ffff
	person_event SPRITE_FISHER, 16, 11, $9, $0, 255, 255, $a0, 0, FisherScript_0x19c16e, $ffff
; 0x19c8ad

