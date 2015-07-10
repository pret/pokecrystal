Route38_MapScriptHeader:
	; trigger count
	db 0

	; callback count
	db 0

TrainerBird_keeperToby:
	; bit/flag number
	dw EVENT_BEAT_BIRD_KEEPER_TOBY

	; trainer group && trainer id
	db BIRD_KEEPER, TOBY

	; text when seen
	dw Bird_keeperTobySeenText

	; text when trainer beaten
	dw Bird_keeperTobyBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperTobyScript

Bird_keeperTobyScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a1f86
	closetext
	loadmovesprites
	end

TrainerSailorHarry:
	; bit/flag number
	dw EVENT_BEAT_SAILOR_HARRY

	; trainer group && trainer id
	db SAILOR, HARRY

	; text when seen
	dw SailorHarrySeenText

	; text when trainer beaten
	dw SailorHarryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SailorHarryScript

SailorHarryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a220c
	closetext
	loadmovesprites
	end

TrainerLassDana1:
	; bit/flag number
	dw EVENT_BEAT_LASS_DANA

	; trainer group && trainer id
	db LASS, DANA1

	; text when seen
	dw LassDana1SeenText

	; text when trainer beaten
	dw LassDana1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw LassDana1Script

LassDana1Script:
	writecode VAR_CALLERID, $1a
	talkaftercancel
	loadfont
	checkflag $0074
	iftrue UnknownScript_0x1a1d82
	checkflag $0082
	iftrue UnknownScript_0x1a1df6
	checkcellnum $1a
	iftrue UnknownScript_0x1a1e17
	checkevent $0289
	iftrue UnknownScript_0x1a1d6b
	writetext UnknownText_0x1a20ec
	keeptextopen
	setevent $0289
	scall UnknownScript_0x1a1e0b
	jump UnknownScript_0x1a1d6e

UnknownScript_0x1a1d6b:
	scall UnknownScript_0x1a1e0f
UnknownScript_0x1a1d6e:
	askforphonenumber $1a
	if_equal $1, UnknownScript_0x1a1e1f
	if_equal $2, UnknownScript_0x1a1e1b
	trainertotext LASS, DANA1, $0
	scall UnknownScript_0x1a1e13
	jump UnknownScript_0x1a1e17

UnknownScript_0x1a1d82:
	scall UnknownScript_0x1a1e23
	winlosstext LassDana1BeatenText, $0000
	copybytetovar wda03
	if_equal $4, UnknownScript_0x1a1da1
	if_equal $3, UnknownScript_0x1a1da7
	if_equal $2, UnknownScript_0x1a1dad
	if_equal $1, UnknownScript_0x1a1db3
	if_equal $0, UnknownScript_0x1a1db9
UnknownScript_0x1a1da1:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ded
UnknownScript_0x1a1da7:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a1de0
UnknownScript_0x1a1dad:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1dd3
UnknownScript_0x1a1db3:
	checkflag $0045
	iftrue UnknownScript_0x1a1dc6
UnknownScript_0x1a1db9:
	loadtrainer LASS, DANA1
	startbattle
	returnafterbattle
	loadvar wda03, $1
	clearflag $0074
	end

UnknownScript_0x1a1dc6:
	loadtrainer LASS, DANA2
	startbattle
	returnafterbattle
	loadvar wda03, $2
	clearflag $0074
	end

UnknownScript_0x1a1dd3:
	loadtrainer LASS, DANA3
	startbattle
	returnafterbattle
	loadvar wda03, $3
	clearflag $0074
	end

UnknownScript_0x1a1de0:
	loadtrainer LASS, DANA4
	startbattle
	returnafterbattle
	loadvar wda03, $4
	clearflag $0074
	end

UnknownScript_0x1a1ded:
	loadtrainer LASS, DANA5
	startbattle
	returnafterbattle
	clearflag $0074
	end

UnknownScript_0x1a1df6:
	scall UnknownScript_0x1a1e27
	verbosegiveitem THUNDERSTONE, 1
	iffalse UnknownScript_0x1a1e08
	clearflag $0082
	setevent $0102
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
	; bit/flag number
	dw EVENT_BEAT_SCHOOLBOY_CHAD

	; trainer group && trainer id
	db SCHOOLBOY, CHAD1

	; text when seen
	dw SchoolboyChad1SeenText

	; text when trainer beaten
	dw SchoolboyChad1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw SchoolboyChad1Script

SchoolboyChad1Script:
	writecode VAR_CALLERID, $1b
	talkaftercancel
	loadfont
	checkflag $0075
	iftrue UnknownScript_0x1a1e75
	checkcellnum $1b
	iftrue UnknownScript_0x1a1ef5
	checkevent $028b
	iftrue UnknownScript_0x1a1e5e
	writetext UnknownText_0x1a200e
	keeptextopen
	setevent $028b
	scall UnknownScript_0x1a1ee9
	jump UnknownScript_0x1a1e61

UnknownScript_0x1a1e5e:
	scall UnknownScript_0x1a1eed
UnknownScript_0x1a1e61:
	askforphonenumber $1b
	if_equal $1, UnknownScript_0x1a1efd
	if_equal $2, UnknownScript_0x1a1ef9
	trainertotext SCHOOLBOY, CHAD1, $0
	scall UnknownScript_0x1a1ef1
	jump UnknownScript_0x1a1ef5

UnknownScript_0x1a1e75:
	scall UnknownScript_0x1a1f01
	winlosstext SchoolboyChad1BeatenText, $0000
	copybytetovar wda04
	if_equal $4, UnknownScript_0x1a1e94
	if_equal $3, UnknownScript_0x1a1e9a
	if_equal $2, UnknownScript_0x1a1ea0
	if_equal $1, UnknownScript_0x1a1ea6
	if_equal $0, UnknownScript_0x1a1eac
UnknownScript_0x1a1e94:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1a1ee0
UnknownScript_0x1a1e9a:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1a1ed3
UnknownScript_0x1a1ea0:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1a1ec6
UnknownScript_0x1a1ea6:
	checkflag $0049
	iftrue UnknownScript_0x1a1eb9
UnknownScript_0x1a1eac:
	loadtrainer SCHOOLBOY, CHAD1
	startbattle
	returnafterbattle
	loadvar wda04, $1
	clearflag $0075
	end

UnknownScript_0x1a1eb9:
	loadtrainer SCHOOLBOY, CHAD2
	startbattle
	returnafterbattle
	loadvar wda04, $2
	clearflag $0075
	end

UnknownScript_0x1a1ec6:
	loadtrainer SCHOOLBOY, CHAD3
	startbattle
	returnafterbattle
	loadvar wda04, $3
	clearflag $0075
	end

UnknownScript_0x1a1ed3:
	loadtrainer SCHOOLBOY, CHAD4
	startbattle
	returnafterbattle
	loadvar wda04, $4
	clearflag $0075
	end

UnknownScript_0x1a1ee0:
	loadtrainer SCHOOLBOY, CHAD5
	startbattle
	returnafterbattle
	clearflag $0075
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
	; bit/flag number
	dw EVENT_BEAT_BEAUTY_VALERIE

	; trainer group && trainer id
	db BEAUTY, VALERIE

	; text when seen
	dw BeautyValerieSeenText

	; text when trainer beaten
	dw BeautyValerieBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyValerieScript

BeautyValerieScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a2185
	closetext
	loadmovesprites
	end

TrainerBeautyOlivia:
	; bit/flag number
	dw EVENT_BEAT_BEAUTY_OLIVIA

	; trainer group && trainer id
	db BEAUTY, OLIVIA

	; text when seen
	dw BeautyOliviaSeenText

	; text when trainer beaten
	dw BeautyOliviaBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw BeautyOliviaScript

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

	; warps
	db 2
	warp_def $8, $23, 1, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE
	warp_def $9, $23, 2, GROUP_ROUTE_38_ECRUTEAK_GATE, MAP_ROUTE_38_ECRUTEAK_GATE

	; xy triggers
	db 0

	; signposts
	db 2
	signpost 7, 33, $0, MapRoute38Signpost0Script
	signpost 13, 5, $0, MapRoute38Signpost1Script

	; people-events
	db 7
	person_event SPRITE_STANDING_YOUNGSTER, 5, 8, $9, $0, 255, 255, $92, 1, TrainerSchoolboyChad1, $ffff
	person_event SPRITE_LASS, 7, 19, $a, $0, 255, 255, $92, 2, TrainerLassDana1, $ffff
	person_event SPRITE_STANDING_YOUNGSTER, 19, 16, $a, $0, 255, 255, $92, 1, TrainerBird_keeperToby, $ffff
	person_event SPRITE_BUENA, 13, 23, $6, $0, 255, 255, $92, 1, TrainerBeautyValerie, $ffff
	person_event SPRITE_SAILOR, 9, 28, $1e, $0, 255, 255, $92, 2, TrainerSailorHarry, $ffff
	person_event SPRITE_FRUIT_TREE, 14, 16, $1, $0, 255, 255, $0, 0, FruitTreeScript_0x1a1f33, $ffff
	person_event SPRITE_BUENA, 12, 9, $a, $0, 255, 255, $92, 1, TrainerBeautyOlivia, $ffff
