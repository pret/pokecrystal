Route38_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 0

TrainerBird_keeperToby:
	trainer EVENT_BEAT_BIRD_KEEPER_TOBY, BIRD_KEEPER, TOBY, Bird_keeperTobySeenText, Bird_keeperTobyBeatenText, $0000, Bird_keeperTobyScript

Bird_keeperTobyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1f86
	closetext
	loadmovesprites
	end

TrainerSailorHarry:
	trainer EVENT_BEAT_SAILOR_HARRY, SAILOR, HARRY, SailorHarrySeenText, SailorHarryBeatenText, $0000, SailorHarryScript

SailorHarryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a220c
	closetext
	loadmovesprites
	end

TrainerLassDana1:
	trainer EVENT_BEAT_LASS_DANA, LASS, DANA1, LassDana1SeenText, LassDana1BeatenText, $0000, LassDana1Script

LassDana1Script:
	writecode VAR_CALLERID, PHONE_LASS_DANA
	talkaftercancel
	loadfont
	checkflag ENGINE_DANA
	iftrue UnknownScript_0x1a1d82
	checkflag ENGINE_DANA_HAS_THUNDERSTONE
	iftrue UnknownScript_0x1a1df6
	checkcellnum PHONE_LASS_DANA
	iftrue UnknownScript_0x1a1e17
	checkevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a1d6b
	writetext UnknownText_0x1a20ec
	keeptextopen
	setevent EVENT_DANA_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a1e0b
	jump UnknownScript_0x1a1d6e

UnknownScript_0x1a1d6b:
	scall UnknownScript_0x1a1e0f
UnknownScript_0x1a1d6e:
	askforphonenumber PHONE_LASS_DANA
	if_equal $1, UnknownScript_0x1a1e1f
	if_equal $2, UnknownScript_0x1a1e1b
	trainertotext LASS, DANA1, $0
	scall UnknownScript_0x1a1e13
	jump UnknownScript_0x1a1e17

UnknownScript_0x1a1d82:
	scall UnknownScript_0x1a1e23
	winlosstext LassDana1BeatenText, $0000
	copybytetovar wDanaFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0
	loadtrainer LASS, DANA1
	startbattle
	returnafterbattle
	loadvar wDanaFightCount, 1
	clearflag ENGINE_DANA
	end

.LoadFight1
	loadtrainer LASS, DANA2
	startbattle
	returnafterbattle
	loadvar wDanaFightCount, 2
	clearflag ENGINE_DANA
	end

.LoadFight2
	loadtrainer LASS, DANA3
	startbattle
	returnafterbattle
	loadvar wDanaFightCount, 3
	clearflag ENGINE_DANA
	end

.LoadFight3
	loadtrainer LASS, DANA4
	startbattle
	returnafterbattle
	loadvar wDanaFightCount, 4
	clearflag ENGINE_DANA
	end

.LoadFight4
	loadtrainer LASS, DANA5
	startbattle
	returnafterbattle
	clearflag ENGINE_DANA
	end

UnknownScript_0x1a1df6:
	scall UnknownScript_0x1a1e27
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1a1e08
	clearflag ENGINE_DANA_HAS_THUNDERSTONE
	setevent EVENT_DANA_GAVE_THUNDERSTONE
	jump UnknownScript_0x1a1e17

UnknownScript_0x1a1e08:
	jump UnknownScript_0x1a1e2b

UnknownScript_0x1a1e0b:
	jumpstd asknumber1f
	end

UnknownScript_0x1a1e0f:
	jumpstd asknumber2f
	end

UnknownScript_0x1a1e13:
	jumpstd registerednumberf
	end

UnknownScript_0x1a1e17:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a1e1b:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a1e1f:
	jumpstd phonefullf
	end

UnknownScript_0x1a1e23:
	jumpstd rematchf
	end

UnknownScript_0x1a1e27:
	jumpstd giftf
	end

UnknownScript_0x1a1e2b:
	jumpstd packfullf
	end

TrainerSchoolboyChad1:
	trainer EVENT_BEAT_SCHOOLBOY_CHAD, SCHOOLBOY, CHAD1, SchoolboyChad1SeenText, SchoolboyChad1BeatenText, $0000, SchoolboyChad1Script

SchoolboyChad1Script:
	writecode VAR_CALLERID, PHONE_SCHOOLBOY_CHAD
	talkaftercancel
	loadfont
	checkflag ENGINE_CHAD
	iftrue UnknownScript_0x1a1e75
	checkcellnum PHONE_SCHOOLBOY_CHAD
	iftrue UnknownScript_0x1a1ef5
	checkevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a1e5e
	writetext UnknownText_0x1a200e
	keeptextopen
	setevent EVENT_CHAD_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a1ee9
	jump UnknownScript_0x1a1e61

UnknownScript_0x1a1e5e:
	scall UnknownScript_0x1a1eed
UnknownScript_0x1a1e61:
	askforphonenumber PHONE_SCHOOLBOY_CHAD
	if_equal $1, UnknownScript_0x1a1efd
	if_equal $2, UnknownScript_0x1a1ef9
	trainertotext SCHOOLBOY, CHAD1, $0
	scall UnknownScript_0x1a1ef1
	jump UnknownScript_0x1a1ef5

UnknownScript_0x1a1e75:
	scall UnknownScript_0x1a1f01
	winlosstext SchoolboyChad1BeatenText, $0000
	copybytetovar wChadFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	returnafterbattle
	loadvar wChadFightCount, 1
	clearflag ENGINE_CHAD
	end

.LoadFight1
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	returnafterbattle
	loadvar wChadFightCount, 2
	clearflag ENGINE_CHAD
	end

.LoadFight2
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	returnafterbattle
	loadvar wChadFightCount, 3
	clearflag ENGINE_CHAD
	end

.LoadFight3
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	returnafterbattle
	loadvar wChadFightCount, 4
	clearflag ENGINE_CHAD
	end

.LoadFight4
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	returnafterbattle
	clearflag ENGINE_CHAD
	end

UnknownScript_0x1a1ee9:
	jumpstd asknumber1m
	end

UnknownScript_0x1a1eed:
	jumpstd asknumber2m
	end

UnknownScript_0x1a1ef1:
	jumpstd registerednumberm
	end

UnknownScript_0x1a1ef5:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a1ef9:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a1efd:
	jumpstd phonefullm
	end

UnknownScript_0x1a1f01:
	jumpstd rematchm
	end

TrainerBeautyValerie:
	trainer EVENT_BEAT_BEAUTY_VALERIE, BEAUTY, VALERIE, BeautyValerieSeenText, BeautyValerieBeatenText, $0000, BeautyValerieScript

BeautyValerieScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2185
	closetext
	loadmovesprites
	end

TrainerBeautyOlivia:
	trainer EVENT_BEAT_BEAUTY_OLIVIA, BEAUTY, OLIVIA, BeautyOliviaSeenText, BeautyOliviaBeatenText, $0000, BeautyOliviaScript

BeautyOliviaScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a229a
	closetext
	loadmovesprites
	end

MapRoute38Signpost0Script:
	jumptext UnknownText_0x1a22fd

MapRoute38Signpost1Script:
	jumptext UnknownText_0x1a2324

FruitTreeScript_0x1a1f33:
	fruittree $3

Bird_keeperTobySeenText:
	text "Fly high into the"
	line "sky, my beloved"
	cont "bird #MON!"
	done

Bird_keeperTobyBeatenText:
	text "I feel like just"
	line "flying away now."
	done

UnknownText_0x1a1f86:
	text "I plan to train in"
	line "CIANWOOD CITY to"

	para "teach my #MON"
	line "how to FLY."
	done

SchoolboyChad1SeenText:
	text "Let me try some-"
	line "thing I learned"
	cont "today."
	done

SchoolboyChad1BeatenText:
	text "I didn't study"
	line "enough, I guess."
	done

UnknownText_0x1a200e:
	text "I have to take so"
	line "many tests, I"

	para "don't have much"
	line "time for #MON."

	para "So when I do get"
	line "to play, I really"
	cont "concentrate."
	done

LassDana1SeenText:
	text "You seem to be"
	line "good at #MON."

	para "If you are, how"
	line "about giving me"
	cont "some advice?"
	done

LassDana1BeatenText:
	text "I see. So you can"
	line "battle that way."
	done

UnknownText_0x1a20ec:
	text "I know something"
	line "good!"

	para "MOOMOO FARM's milk"
	line "is famous for its"
	cont "flavor."
	done

BeautyValerieSeenText:
	text "Hi! Aren't you a"
	line "cute trainer!"

	para "May I see your"
	line "#MON?"
	done

BeautyValerieBeatenText:
	text "I'm glad I got to"
	line "see your #MON!"
	done

UnknownText_0x1a2185:
	text "When I see #-"
	line "MON, it seems to"
	cont "soothe my nerves."
	done

SailorHarrySeenText:
	text "I've been over-"
	line "seas, so I know"

	para "about all sorts of"
	line "#MON!"
	done

SailorHarryBeatenText:
	text "Your skill is"
	line "world class!"
	done

UnknownText_0x1a220c:
	text "All kinds of peo-"
	line "ple around the"

	para "world live happily"
	line "with #MON."
	done

BeautyOliviaSeenText:
	text "Don't you think my"
	line "#MON and I are"
	cont "beautiful?"
	done

BeautyOliviaBeatenText:
	text "We drink MOOMOO"
	line "MILK every day."
	done

UnknownText_0x1a229a:
	text "MOOMOO MILK is"
	line "good for beauty"

	para "and health, but"
	line "inconveniently,"

	para "they only sell a"
	line "bottle at a time."
	done

UnknownText_0x1a22fd:
	text "ROUTE 38"

	para "OLIVINE CITY -"
	line "ECRUTEAK CITY"
	done

UnknownText_0x1a2324:
	text "TRAINER TIPS"

	para "If a #MON is"
	line "trying to evolve,"
	cont "you can stop it."

	para "Press the B But-"
	line "ton during evolu-"
	cont "tion."

	para "That startles the"
	line "#MON and stops"
	cont "its evolution."
	done

Route38_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $8, $23, 1, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE
	warp_def $9, $23, 2, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE

.XYTriggers:
	db 0

.Signposts:
	db 2
	signpost 7, 33, SIGNPOST_READ, MapRoute38Signpost0Script
	signpost 13, 5, SIGNPOST_READ, MapRoute38Signpost1Script

.PersonEvents:
	db 7
	person_event SPRITE_STANDING_YOUNGSTER, 5, 8, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerSchoolboyChad1, -1
	person_event SPRITE_LASS, 7, 19, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerLassDana1, -1
	person_event SPRITE_STANDING_YOUNGSTER, 19, 16, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerBird_keeperToby, -1
	person_event SPRITE_BUENA, 13, 23, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerBeautyValerie, -1
	person_event SPRITE_SAILOR, 9, 28, OW_RIGHT | $12, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 2, TrainerSailorHarry, -1
	person_event SPRITE_FRUIT_TREE, 14, 16, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x1a1f33, -1
	person_event SPRITE_BUENA, 12, 9, OW_LEFT | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 1, TrainerBeautyOlivia, -1
