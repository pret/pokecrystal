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
	setflag $0042
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
	playmusic MUSIC_SHOW_ME_AROUND
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
	setflag $0001
	2writetext UnknownText_0x19c438
	keeptextopen
	2writetext UnknownText_0x19c451
	closetext
	loadmovesprites
	stopfollow
	special $003d
	spriteface $0, $1
	applymovement $2, MovementData_0x19c1cb
	playsound SFX_ENTER_DOOR
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
	playmusic MUSIC_RIVAL_ENCOUNTER
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
	writecode $3, BATTLETYPE_CANLOSE
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
	writecode $3, BATTLETYPE_CANLOSE
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
	writecode $3, BATTLETYPE_CANLOSE
	startbattle
	reloadmapmusic
	reloadmap
	iftrue UnknownScript_0x19c11a
	2jump UnknownScript_0x19c126
; 0x19c11a

UnknownScript_0x19c11a: ; 0x19c11a
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	2writetext UnknownText_0x19c608
	closetext
	loadmovesprites
	2jump UnknownScript_0x19c12f
; 0x19c126

UnknownScript_0x19c126: ; 0x19c126
	playmusic MUSIC_RIVAL_AFTER
	loadfont
	2writetext UnknownText_0x19c59e
	closetext
	loadmovesprites
UnknownScript_0x19c12f: ; 0x19c12f
	playsound SFX_TACKLE
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
	checkflag $0001
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
	checkflag $000b
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
	text "You're a rookie"
	line "trainer, aren't"
	cont "you? I can tell!"

	para "That's OK! Every-"
	line "one is a rookie"
	cont "at some point!"

	para "If you'd like, I"
	line "can teach you a"
	cont "few things."
	done
; 0x19c26f

UnknownText_0x19c26f: ; 0x19c26f
	text "OK, then!"
	line "Follow me!"
	done
; 0x19c285

UnknownText_0x19c285: ; 0x19c285
	text "This is a #MON"
	line "CENTER. They heal"

	para "your #MON in no"
	line "time at all."

	para "You'll be relying"
	line "on them a lot, so"

	para "you better learn"
	line "about them."
	done
; 0x19c304

UnknownText_0x19c304: ; 0x19c304
	text "This is a #MON"
	line "MART."

	para "They sell BALLS"
	line "for catching wild"

	para "#MON and other"
	line "useful items."
	done
; 0x19c359

UnknownText_0x19c359: ; 0x19c359
	text "ROUTE 30 is out"
	line "this way."

	para "Trainers will be"
	line "battling their"

	para "prized #MON"
	line "there."
	done
; 0x19c3a7

UnknownText_0x19c3a7: ; 0x19c3a7
	text "This is the sea,"
	line "as you can see."

	para "Some #MON are"
	line "found only in"
	cont "water."
	done
; 0x19c3ec

UnknownText_0x19c3ec: ; 0x19c3ec
	text "Here…"

	para "It's my house!"
	line "Thanks for your"
	cont "company."

	para "Let me give you a"
	line "small gift."
	done
; 0x19c438

UnknownText_0x19c438: ; 0x19c438
	text $52, "'s #GEAR"
	line "now has a MAP!"
	done
; 0x19c451

UnknownText_0x19c451: ; 0x19c451
	text "#GEAR becomes"
	line "more useful as you"
	cont "add CARDS."

	para "I wish you luck on"
	line "your journey!"
	done
; 0x19c49f

UnknownText_0x19c49f: ; 0x19c49f
	text "Oh… It's something"
	line "I enjoy doing…"

	para "Fine. Come see me"
	line "when you like."
	done
; 0x19c4e2

UnknownText_0x19c4e2: ; 0x19c4e2
	text $56, " ", $56, " ", $56

	para "You got a #MON"
	line "at the LAB."

	para "What a waste."
	line "A wimp like you."

	para $56, " ", $56, " ", $56

	para "Don't you get what"
	line "I'm saying?"

	para "Well, I too, have"
	line "a good #MON."

	para "I'll show you"
	line "what I mean!"
	done
; 0x19c57f

UnknownText_0x19c57f: ; 0x19c57f
	text "Humph. Are you"
	line "happy you won?"
	done
; 0x19c59e

UnknownText_0x19c59e: ; 0x19c59e
	text $56, " ", $56, " ", $56

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done
; 0x19c5e6

UnknownText_0x19c5e6: ; 0x19c5e6
	text "Humph. That was a"
	line "waste of time."
	done
; 0x19c608

UnknownText_0x19c608: ; 0x19c608
	text $56, " ", $56, " ", $56

	para "My name's ???."

	para "I'm going to be"
	line "the world's great-"
	cont "est #MON"
	cont "trainer."
	done
; 0x19c650

UnknownText_0x19c650: ; 0x19c650
	text "Did you talk to"
	line "the old man by the"
	cont "#MON CENTER?"

	para "He'll put a MAP of"
	line "JOHTO on your"
	cont "#GEAR."
	done
; 0x19c6a8

UnknownText_0x19c6a8: ; 0x19c6a8
	text "When you're with"
	line "#MON, going"
	cont "anywhere is fun."
	done
; 0x19c6d6

UnknownText_0x19c6d6: ; 0x19c6d6
	text "MR.#MON's house"
	line "is still farther"
	cont "up ahead."
	done
; 0x19c701

UnknownText_0x19c701: ; 0x19c701
	text "I battled the"
	line "trainers on the"
	cont "road."

	para "My #MON lost."
	line "They're a mess! I"

	para "must take them to"
	line "a #MON CENTER."
	done
; 0x19c766

UnknownText_0x19c766: ; 0x19c766
	text "A #MON I caught"
	line "had an item."

	para "I think it's"
	line "MYSTIC WATER."

	para "I don't need it,"
	line "so do you want it?"
	done
; 0x19c7c1

UnknownText_0x19c7c1: ; 0x19c7c1
	text "Back to fishing"
	line "for me, then."
	done
; 0x19c7e0

UnknownText_0x19c7e0: ; 0x19c7e0
	text "CHERRYGROVE CITY"

	para "The City of Cute,"
	line "Fragrant Flowers"
	done
; 0x19c815

UnknownText_0x19c815: ; 0x19c815
	text "GUIDE GENT'S HOUSE"
	done
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

