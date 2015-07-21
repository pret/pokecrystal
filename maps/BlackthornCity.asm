BlackthornCity_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 2

	; callbacks
	dbw 5, .FlyPoint
	dbw 2, .Santos

.FlyPoint
	setflag ENGINE_FLYPOINT_BLACKTHORN
	return

.Santos
	checkcode VAR_WEEKDAY
	if_equal SATURDAY, .SantosAppears
	disappear $9
	return

.SantosAppears
	appear $9
	return

SuperNerdScript_0x1a46e8:
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

UnknownScript_0x1a46fc:
	writetext UnknownText_0x1a47f3
	closetext
	loadmovesprites
	end

UnknownScript_0x1a4702:
	writetext UnknownText_0x1a4865
	closetext
	loadmovesprites
	end

GrampsScript_0x1a4708:
	jumptextfaceplayer UnknownText_0x1a48c3

GrampsScript_0x1a470b:
	jumptextfaceplayer UnknownText_0x1a48fb

BlackBeltScript_0x1a470e:
	faceplayer
	loadfont
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a471c
	writetext UnknownText_0x1a494a
	closetext
	loadmovesprites
	end

UnknownScript_0x1a471c:
	writetext UnknownText_0x1a4983
	closetext
	loadmovesprites
	end

CooltrainerFScript_0x1a4722:
	jumptextfaceplayer UnknownText_0x1a49bd

YoungsterScript_0x1a4725:
	jumptextfaceplayer UnknownText_0x1a49f1

CooltrainerFScript_0x1a4728:
	jumptextfaceplayer UnknownText_0x1a4b1e

SantosScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_SPELL_TAG_FROM_SANTOS
	iftrue SantosSaturdayScript
	checkcode VAR_WEEKDAY
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

UnknownText_0x1a477a:
	text "I am sorry."

	para "CLAIR, our GYM"
	line "LEADER, entered"

	para "the DRAGON'S DEN"
	line "behind the GYM."

	para "I have no idea"
	line "when our LEADER"
	cont "will return."
	done

UnknownText_0x1a47f3:
	text "CLAIR, our GYM"
	line "LEADER, is waiting"
	cont "for you."

	para "However, it would"
	line "be impossible for"

	para "a run-of-the-mill"
	line "trainer to win."
	done

UnknownText_0x1a4865:
	text "You defeated"
	line "CLAIR?"

	para "That's amazing!"

	para "I've never heard"
	line "of her losing to"

	para "anyone other than"
	line "LANCE."
	done

UnknownText_0x1a48c3:
	text "No. Only chosen"
	line "trainers may train"

	para "here."
	line "Please leave."
	done

UnknownText_0x1a48fb:
	text "If CLAIR allows"
	line "it, her grand-"
	cont "father--our MASTER"
	cont "--will also."

	para "You may enter."
	done

UnknownText_0x1a494a:
	text "My radio's busted?"
	line "Lately, I only get"
	cont "this weird signal."
	done

UnknownText_0x1a4983:
	text "Arooo! Voices in"
	line "my head!"

	para "Huh? I'm listening"
	line "to my radio!"
	done

UnknownText_0x1a49bd:
	text "Are you going to"
	line "make your #MON"
	cont "forget some moves?"
	done

UnknownText_0x1a49f1:
	text "Dragon masters all"
	line "come from the city"
	cont "of BLACKTHORN."
	done

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

UnknownText_0x1a4b1e:
	text "Wow, you came"
	line "through the ICE"
	cont "PATH?"

	para "You must be a real"
	line "hotshot trainer!"
	done

BlackthornCitySignText:
	text "BLACKTHORN CITY"

	para "A Quiet Mountain"
	line "Retreat"
	done

BlackthornGymSignText:
	text "BLACKTHORN CITY"
	line "#MON GYM"
	cont "LEADER: CLAIR"

	para "The Blessed User"
	line "of Dragon #MON"
	done

MoveDeletersHouseSignText:
	text "MOVE DELETER'S"
	line "HOUSE"
	done

DragonDensSignText:
	text "DRAGON'S DEN"
	line "AHEAD"
	done

BlackthornCityTrainerTipsText:
	text "TRAINER TIPS"

	para "A #MON holding"
	line "a MIRACLEBERRY"

	para "will cure itself"
	line "of any status"
	cont "problem."
	done

BlackthornCity_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 8
	warp_def $b, $12, 1, GROUP_BLACKTHORN_GYM_1F, MAP_BLACKTHORN_GYM_1F
	warp_def $15, $d, 1, GROUP_BLACKTHORN_DRAGON_SPEECH_HOUSE, MAP_BLACKTHORN_DRAGON_SPEECH_HOUSE
	warp_def $17, $1d, 1, GROUP_BLACKTHORN_DODRIO_TRADE_HOUSE, MAP_BLACKTHORN_DODRIO_TRADE_HOUSE
	warp_def $1d, $f, 2, GROUP_BLACKTHORN_MART, MAP_BLACKTHORN_MART
	warp_def $1d, $15, 1, GROUP_BLACKTHORN_POKECENTER_1F, MAP_BLACKTHORN_POKECENTER_1F
	warp_def $1f, $9, 1, GROUP_MOVE_DELETERS_HOUSE, MAP_MOVE_DELETERS_HOUSE
	warp_def $9, $24, 2, GROUP_ICE_PATH_1F, MAP_ICE_PATH_1F
	warp_def $1, $14, 1, GROUP_DRAGONS_DEN_1F, MAP_DRAGONS_DEN_1F

.XYTriggers:
	db 0

.Signposts:
	db 7
	signpost 24, 34, SIGNPOST_READ, BlackthornCitySign
	signpost 13, 17, SIGNPOST_READ, BlackthornGymSign
	signpost 31, 7, SIGNPOST_READ, MoveDeletersHouseSign
	signpost 3, 21, SIGNPOST_READ, DragonDensSign
	signpost 25, 5, SIGNPOST_READ, BlackthornCityTrainerTips
	signpost 29, 16, SIGNPOST_READ, BlackthornCityMartSign
	signpost 29, 22, SIGNPOST_READ, BlackthornCityPokeCenterSign

.PersonEvents:
	db 9
	person_event SPRITE_SUPER_NERD, 16, 22, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x1a46e8, EVENT_BLACKTHORN_CITY_SUPER_NERD_BLOCKS_GYM
	person_event SPRITE_SUPER_NERD, 16, 23, OW_UP | $2, $0, -1, -1, (PAL_OW_RED << 4) | $80, 0, SuperNerdScript_0x1a46e8, EVENT_BLACKTHORN_CITY_SUPER_NERD_DOES_NOT_BLOCK_GYM
	person_event SPRITE_GRAMPS, 6, 24, OW_UP | $2, $0, -1, -1, $0, 0, GrampsScript_0x1a4708, EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	person_event SPRITE_GRAMPS, 6, 25, OW_LEFT | $0, $0, -1, -1, $0, 0, GrampsScript_0x1a470b, EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	person_event SPRITE_BLACK_BELT, 35, 28, OW_UP | $1, $1, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, BlackBeltScript_0x1a470e, -1
	person_event SPRITE_COOLTRAINER_F, 29, 13, OW_UP | $1, $2, -1, -1, (PAL_OW_RED << 4) | $80, 0, CooltrainerFScript_0x1a4722, -1
	person_event SPRITE_YOUNGSTER, 19, 17, OW_UP | $1, $1, -1, -1, $0, 0, YoungsterScript_0x1a4725, -1
	person_event SPRITE_YOUNGSTER, 24, 26, OW_UP | $2, $0, -1, -1, $0, 0, SantosScript, EVENT_BLACKTHORN_CITY_SANTOS_OF_SATURDAY
	person_event SPRITE_COOLTRAINER_F, 23, 39, OW_UP | $3, $0, -1, -1, (PAL_OW_GREEN << 4) | $80, 0, CooltrainerFScript_0x1a4728, -1
