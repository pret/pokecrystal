BlackthornCity_MapScriptHeader: ; 0x1a46d0
	; trigger count
	db 0

	; callback count
	db 2

	; callbacks

	dbw 5, UnknownScript_0x1a46d8

	dbw 2, SantosCallback

UnknownScript_0x1a46d8: ; 0x1a46d8
	setflag $004b
	return
; 0x1a46dc

SantosCallback:
	checkcode $b
	if_equal SATURDAY, .SantosAppears
	disappear $9
	return

.SantosAppears
	appear $9
	return

SuperNerdScript_0x1a46e8: ; 0x1a46e8
	faceplayer
	loadfont
	checkevent EVENT_BEAT_CLAIR
	iftrue UnknownScript_0x1a4702
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a46fc
	writetext UnknownText_0x1a477a
	closetext
	loadmovesprites
	end
; 0x1a46fc

UnknownScript_0x1a46fc: ; 0x1a46fc
	writetext UnknownText_0x1a47f3
	closetext
	loadmovesprites
	end
; 0x1a4702

UnknownScript_0x1a4702: ; 0x1a4702
	writetext UnknownText_0x1a4865
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
	writetext UnknownText_0x1a494a
	closetext
	loadmovesprites
	end
; 0x1a471c

UnknownScript_0x1a471c: ; 0x1a471c
	writetext UnknownText_0x1a4983
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

SantosScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue SantosSaturdayScript
	checkcode $b
	if_not_equal SATURDAY, SantosNotSaturdayScript
	checkevent EVENT_MET_SANTOS_OF_SATURDAY
	iftrue .MetSantos
	writetext MeetSantosText
	keeptextopen
	setevent EVENT_MET_SANTOS_OF_SATURDAY
.MetSantos
	writetext SantosGivesGiftText
	keeptextopen
	verbosegiveitem SPELL_TAG, 1
	iffalse SantosDoneScript
	setevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	writetext SantosGaveGiftText
	closetext
	loadmovesprites
	end

SantosSaturdayScript:
	writetext SantosSaturdayText
	closetext
SantosDoneScript:
	loadmovesprites
	end

SantosNotSaturdayScript:
	writetext SantosNotSaturdayText
	closetext
	loadmovesprites
	end

BlackthornCitySign:
	jumptext BlackthornCitySignText

BlackthornGymSign:
	jumptext BlackthornGymSignText

MoveDeletersHouseSign:
	jumptext MoveDeletersHouseSignText

DragonDensSign:
	jumptext DragonDensSignText

BlackthornCityTrainerTips:
	jumptext BlackthornCityTrainerTipsText

BlackthornCityPokeCenterSign:
	jumpstd pokecentersign

BlackthornCityMartSign:
	jumpstd martsign

UnknownText_0x1a477a: ; 0x1a477a
	text "I am sorry."

	para "CLAIR, our GYM"
	line "LEADER, entered"

	para "the DRAGON'S DEN"
	line "behind the GYM."

	para "I have no idea"
	line "when our LEADER"
	cont "will return."
	done
; 0x1a47f3

UnknownText_0x1a47f3: ; 0x1a47f3
	text "CLAIR, our GYM"
	line "LEADER, is waiting"
	cont "for you."

	para "However, it would"
	line "be impossible for"

	para "a run-of-the-mill"
	line "trainer to win."
	done
; 0x1a4865

UnknownText_0x1a4865: ; 0x1a4865
	text "You defeated"
	line "CLAIR?"

	para "That's amazing!"

	para "I've never heard"
	line "of her losing to"

	para "anyone other than"
	line "LANCE."
	done
; 0x1a48c3

UnknownText_0x1a48c3: ; 0x1a48c3
	text "No. Only chosen"
	line "trainers may train"

	para "here."
	line "Please leave."
	done
; 0x1a48fb

UnknownText_0x1a48fb: ; 0x1a48fb
	text "If CLAIR allows"
	line "it, her grand-"
	cont "father--our MASTER"
	cont "--will also."

	para "You may enter."
	done
; 0x1a494a

UnknownText_0x1a494a: ; 0x1a494a
	text "My radio's busted?"
	line "Lately, I only get"
	cont "this weird signal."
	done
; 0x1a4983

UnknownText_0x1a4983: ; 0x1a4983
	text "Arooo! Voices in"
	line "my head!"

	para "Huh? I'm listening"
	line "to my radio!"
	done
; 0x1a49bd

UnknownText_0x1a49bd: ; 0x1a49bd
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	done
; 0x1a49f1

UnknownText_0x1a49f1: ; 0x1a49f1
	text "Dragon masters all"
	line "come from the city"
	cont "of BLACKTHORN."
	done
; 0x1a4a27

MeetSantosText:
	text "SANTOS: …"

	para "It's Saturday…"

	para "I'm SANTOS of"
	line "Saturday…"
	done

SantosGivesGiftText:
	text "You can have this…"
	done

SantosGaveGiftText:
	text "SANTOS: …"

	para "SPELL TAG…"

	para "Ghost-type moves"
	line "get stronger…"

	para "It will frighten"
	line "you…"
	done

SantosSaturdayText:
	text "SANTOS: …"

	para "See you again on"
	line "another Saturday…"

	para "I won't have any"
	line "more gifts…"
	done

SantosNotSaturdayText:
	text "SANTOS: Today's"
	line "not Saturday…"
	done

UnknownText_0x1a4b1e: ; 0x1a4b1e
	text "Wow, you came"
	line "through the ICE"
	cont "PATH?"

	para "You must be a real"
	line "hotshot trainer!"
	done
; 0x1a4b67

BlackthornCitySignText:
	text "BLACKTHORN CITY"

	para "A Quiet Mountain"
	line "Retreat"
	done

BlackthornGymSignText: ; 0x1a4b91
	text "BLACKTHORN CITY"
	line "#MON GYM"
	cont "LEADER: CLAIR"

	para "The Blessed User"
	line "of Dragon #MON"
	done
; 0x1a4bd9

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DRAGON'S DEN"
	line "AHEAD"
	done

BlackthornCityTrainerTipsText: ; 0x1a4c03
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done
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
	signpost 24, 34, $0, BlackthornCitySign
	signpost 13, 17, $0, BlackthornGymSign
	signpost 31, 7, $0, MoveDeletersHouseSign
	signpost 3, 21, $0, DragonDensSign
	signpost 25, 5, $0, BlackthornCityTrainerTips
	signpost 29, 16, $0, BlackthornCityMartSign
	signpost 29, 22, $0, BlackthornCityPokeCenterSign

	; people-events
	db 9
	person_event SPRITE_SUPER_NERD, 16, 22, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x1a46e8, $06e3
	person_event SPRITE_SUPER_NERD, 16, 23, $6, $0, 255, 255, $80, 0, SuperNerdScript_0x1a46e8, $06e4
	person_event SPRITE_GRAMPS, 6, 24, $6, $0, 255, 255, $0, 0, GrampsScript_0x1a4708, $074c
	person_event SPRITE_GRAMPS, 6, 25, $8, $0, 255, 255, $0, 0, GrampsScript_0x1a470b, $074d
	person_event SPRITE_BLACK_BELT, 35, 28, $5, $1, 255, 255, $90, 0, BlackBeltScript_0x1a470e, $ffff
	person_event SPRITE_COOLTRAINER_F, 29, 13, $5, $2, 255, 255, $80, 0, CooltrainerFScript_0x1a4722, $ffff
	person_event SPRITE_YOUNGSTER, 19, 17, $5, $1, 255, 255, $0, 0, YoungsterScript_0x1a4725, $ffff
	person_event SPRITE_YOUNGSTER, 24, 26, $6, $0, 255, 255, $0, 0, SantosScript, $075d
	person_event SPRITE_COOLTRAINER_F, 23, 39, $7, $0, 255, 255, $a0, 0, CooltrainerFScript_0x1a4728, $ffff
