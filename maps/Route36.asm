Route36_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x19400d, $0000
	dw UnknownScript_0x19400e, $0000

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, ArthurCallback

UnknownScript_0x19400d:
	end

UnknownScript_0x19400e:
	end

ArthurCallback:
	checkcode VAR_WEEKDAY
	if_equal THURSDAY, .ArthurAppears
	disappear $8
	return

.ArthurAppears
	appear $8
	return

UnknownScript_0x19401b:
	showemote EMOTE_SHOCK, $0, 15
	pause 15
	playsound SFX_WARP_FROM
	spriteface $0, UP
	applymovement $a, MovementData_0x194262
	disappear $a
	spriteface $0, DOWN
	pause 10
	dotrigger $0
	clearevent EVENT_SAW_SUICUNE_AT_CIANWOOD_CITY
	domaptrigger GROUP_CIANWOOD_CITY, MAP_CIANWOOD_CITY, $1
	end

WeirdTreeScript_0x19403c:
	checkitem SQUIRTBOTTLE
	iftrue UnknownScript_0x19404a
	waitbutton
	playsound SFX_SANDSTORM
	applymovement $4, MovementData_0x194249
	end

UnknownScript_0x19404a:
	loadfont
	writetext UnknownText_0x19426b
	yesorno
	iffalse UnknownScript_0x194079
	loadmovesprites
	; fallthrough

WateredWeirdTreeScript::
	loadfont
	writetext UnknownText_0x194290
	closetext
	loadmovesprites
	waitbutton
	playsound SFX_SANDSTORM
	applymovement $4, MovementData_0x194249
	loadfont
	writetext UnknownText_0x1942aa
	closetext
	loadmovesprites
	loadpokedata SUDOWOODO, 20
	startbattle
	setevent EVENT_FOUGHT_SUDOWOODO
	if_equal $2, UnknownScript_0x19407b
	disappear $4
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	returnafterbattle
	end

UnknownScript_0x194079:
	loadmovesprites
	end

UnknownScript_0x19407b:
	returnafterbattle
	applymovement $4, MovementData_0x19424b
	disappear $4
	variablesprite SPRITE_WEIRD_TREE, SPRITE_TWIN
	special RunCallback_04
	special Function14168
	end

LassScript_0x19408c:
	faceplayer
	loadfont
	checkevent EVENT_TALKED_TO_FLORIA_AT_FLOWER_SHOP
	iftrue UnknownScript_0x1940b3
	setevent EVENT_MET_FLORIA
	writetext UnknownText_0x1942f1
	closetext
	loadmovesprites
	clearevent EVENT_FLORIA_AT_FLOWER_SHOP
	checkcode VAR_FACING
	if_equal $1, UnknownScript_0x1940ac
	applymovement $9, MovementData_0x19424e
	disappear $9
	end

UnknownScript_0x1940ac:
	applymovement $9, MovementData_0x194258
	disappear $9
	end

UnknownScript_0x1940b3:
	writetext UnknownText_0x1943ed
	closetext
	loadmovesprites
	end

FisherScript_0x1940b9:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM08_ROCK_SMASH
	iftrue UnknownScript_0x1940da
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x1940cd
	writetext UnknownText_0x19446f
	closetext
	loadmovesprites
	end

UnknownScript_0x1940cd:
	writetext UnknownText_0x1944d0
	keeptextopen
	verbosegiveitem TM_ROCK_SMASH, 1
	iffalse UnknownScript_0x1940de
	setevent EVENT_GOT_TM08_ROCK_SMASH
UnknownScript_0x1940da:
	writetext UnknownText_0x19452c
	closetext
UnknownScript_0x1940de:
	loadmovesprites
	end

LassScript_0x1940e0:
	faceplayer
	loadfont
	checkevent EVENT_FOUGHT_SUDOWOODO
	iftrue UnknownScript_0x1940ee
	writetext UnknownText_0x194626
	closetext
	loadmovesprites
	end

UnknownScript_0x1940ee:
	writetext UnknownText_0x19469e
	closetext
	loadmovesprites
	end

TrainerSchoolboyAlan1:
	trainer EVENT_BEAT_SCHOOLBOY_ALAN, SCHOOLBOY, ALAN1, SchoolboyAlan1SeenText, SchoolboyAlan1BeatenText, $0000, SchoolboyAlan1Script

SchoolboyAlan1Script:
	writecode VAR_CALLERID, PHONE_SCHOOLBOY_ALAN
	talkaftercancel
	loadfont
	checkflag ENGINE_ALAN
	iftrue UnknownScript_0x194140
	checkflag ENGINE_ALAN_HAS_FIRE_STONE
	iftrue UnknownScript_0x1941b4
	checkcellnum PHONE_SCHOOLBOY_ALAN
	iftrue UnknownScript_0x1941d5
	checkevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x194129
	writetext UnknownText_0x1947aa
	keeptextopen
	setevent EVENT_ALAN_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1941c9
	jump UnknownScript_0x19412c

UnknownScript_0x194129:
	scall UnknownScript_0x1941cd
UnknownScript_0x19412c:
	askforphonenumber PHONE_SCHOOLBOY_ALAN
	if_equal $1, UnknownScript_0x1941dd
	if_equal $2, UnknownScript_0x1941d9
	trainertotext SCHOOLBOY, ALAN1, $0
	scall UnknownScript_0x1941d1
	jump UnknownScript_0x1941d5

UnknownScript_0x194140:
	scall UnknownScript_0x1941e1
	winlosstext SchoolboyAlan1BeatenText, $0000
	copybytetovar wAlanFightCount
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
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1
	checkflag ENGINE_FLYPOINT_OLIVINE
	iftrue .LoadFight1
.LoadFight0
	loadtrainer SCHOOLBOY, ALAN1
	startbattle
	returnafterbattle
	loadvar wAlanFightCount, 1
	clearflag ENGINE_ALAN
	end

.LoadFight1
	loadtrainer SCHOOLBOY, ALAN2
	startbattle
	returnafterbattle
	loadvar wAlanFightCount, 2
	clearflag ENGINE_ALAN
	end

.LoadFight2
	loadtrainer SCHOOLBOY, ALAN3
	startbattle
	returnafterbattle
	loadvar wAlanFightCount, 3
	clearflag ENGINE_ALAN
	end

.LoadFight3
	loadtrainer SCHOOLBOY, ALAN4
	startbattle
	returnafterbattle
	loadvar wAlanFightCount, 4
	clearflag ENGINE_ALAN
	end

.LoadFight4
	loadtrainer SCHOOLBOY, ALAN5
	startbattle
	returnafterbattle
	clearflag ENGINE_ALAN
	end

UnknownScript_0x1941b4:
	scall UnknownScript_0x1941e5
	verbosegiveitem FIRE_STONE, 1
	iffalse UnknownScript_0x1941c6
	clearflag ENGINE_ALAN_HAS_FIRE_STONE
	setevent EVENT_ALAN_GAVE_FIRE_STONE
	jump UnknownScript_0x1941d5

UnknownScript_0x1941c6:
	jump UnknownScript_0x1941e9

UnknownScript_0x1941c9:
	jumpstd asknumber1m
	end

UnknownScript_0x1941cd:
	jumpstd asknumber2m
	end

UnknownScript_0x1941d1:
	jumpstd registerednumberm
	end

UnknownScript_0x1941d5:
	jumpstd numberacceptedm
	end

UnknownScript_0x1941d9:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1941dd:
	jumpstd phonefullm
	end

UnknownScript_0x1941e1:
	jumpstd rematchm
	end

UnknownScript_0x1941e5:
	jumpstd giftm
	end

UnknownScript_0x1941e9:
	jumpstd packfullm
	end

TrainerPsychicMark:
	trainer EVENT_BEAT_PSYCHIC_MARK, PSYCHIC_T, MARK, PsychicMarkSeenText, PsychicMarkBeatenText, $0000, PsychicMarkScript

PsychicMarkScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x19471e
	closetext
	loadmovesprites
	end

ArthurScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	iftrue ArthurThursdayScript
	checkcode VAR_WEEKDAY
	if_not_equal THURSDAY, ArthurNotThursdayScript
	checkevent EVENT_MET_ARTHUR_OF_THURSDAY
	iftrue .MetArthur
	writetext MeetArthurText
	keeptextopen
	setevent EVENT_MET_ARTHUR_OF_THURSDAY
.MetArthur
	writetext ArthurGivesGiftText
	keeptextopen
	verbosegiveitem HARD_STONE, 1
	iffalse ArthurDoneScript
	setevent EVENT_GOT_HARD_STONE_FROM_ARTHUR
	writetext ArthurGaveGiftText
	closetext
	loadmovesprites
	end

ArthurThursdayScript:
	writetext ArthurThursdayText
	closetext
ArthurDoneScript:
	loadmovesprites
	end

ArthurNotThursdayScript:
	writetext ArthurNotThursdayText
	closetext
	loadmovesprites
	end

MapRoute36Signpost2Script:
	jumptext UnknownText_0x194924

MapRoute36Signpost1Script:
	jumptext UnknownText_0x19492e

MapRoute36Signpost3Script:
	jumptext UnknownText_0x19494c

MapRoute36Signpost0Script:
	jumptext UnknownText_0x1949ee

FruitTreeScript_0x194247:
	fruittree $d

MovementData_0x194249:
	db $56 ; movement
	step_end

MovementData_0x19424b:
	fast_jump_step_up
	fast_jump_step_up
	step_end

MovementData_0x19424e:
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x194258:
	step_left
	step_down
	step_down
	step_down
	step_left
	step_left
	step_left
	step_left
	step_left
	step_end

MovementData_0x194262:
	db $39 ; movement
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_down
	fast_jump_step_right
	fast_jump_step_right
	fast_jump_step_right
	db $38 ; movement
	step_end

UnknownText_0x19426b:
	text "It's a weird tree."
	line "Use SQUIRTBOTTLE?"
	done

UnknownText_0x194290:
	text "<PLAYER> used the"
	line "SQUIRTBOTTLE."
	done

UnknownText_0x1942aa:
	text "The weird tree"
	line "doesn't like the"
	cont "SQUIRTBOTTLE!"

	para "The weird tree"
	line "attacked!"
	done

UnknownText_0x1942f1:
	text "I'm the FLOWER"
	line "SHOP's FLORIA!"

	para "Listen, listen!"

	para "When I sprinkled"
	line "water on that"

	para "wiggly tree, it"
	line "jumped right up!"

	para "It just has to be"
	line "a #MON."

	para "I bet it would be"
	line "shocked out of its"

	para "disguise if you"
	line "soaked it!"

	para "I know! I'll tell"
	line "my sis and borrow"
	cont "her water bottle!"
	done

UnknownText_0x1943ed:
	text "When I told my sis"
	line "about the jiggly"

	para "tree, she said"
	line "it's dangerous."

	para "If I beat WHITNEY,"
	line "I wonder if she'll"

	para "lend me her water"
	line "bottle…"
	done

UnknownText_0x19446f:
	text "Wa-hey!"

	para "I was going to"
	line "snap that tree"

	para "with my straight-"
	line "arm punch."

	para "But I couldn't!"
	line "I'm a failure!"
	done

UnknownText_0x1944d0:
	text "Did you clear that"
	line "wretched tree?"

	para "I'm impressed!"
	line "I want you to"
	cont "have this."
	done

UnknownText_0x19451a:
	text "<PLAYER> received"
	line "TM08."
	done

UnknownText_0x19452c:
	text "That happens to be"
	line "ROCK SMASH."

	para "You can shatter"
	line "rocks with just a"

	para "single well-aimed"
	line "smack."

	para "If any rocks are"
	line "in your way, just"
	cont "smash 'em up!"
	done

UnknownText_0x1945b8:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "I wanted to go see"
	line "the huge #MON"

	para "CENTER they just"
	line "opened…"
	done

UnknownText_0x194626:
	text "An odd tree is"
	line "blocking the way"
	cont "to GOLDENROD CITY."

	para "It's preventing"
	line "me from shopping."

	para "Something should"
	line "be done about it."
	done

UnknownText_0x19469e:
	text "That odd tree dis-"
	line "appeared without a"
	cont "trace."

	para "Oh! That tree was"
	line "really a #MON?"
	done

PsychicMarkSeenText:
	text "I'm going to read"
	line "your thoughts!"
	done

PsychicMarkBeatenText:
	text "I misread you!"
	done

UnknownText_0x19471e:
	text "I'd be strong if"
	line "only I could tell"

	para "what my opponent"
	line "was thinking."
	done

SchoolboyAlan1SeenText:
	text "Thanks to my stud-"
	line "ies, I'm ready for"
	cont "any #MON!"
	done

SchoolboyAlan1BeatenText:
	text "Oops! Computation"
	line "error?"
	done

UnknownText_0x1947aa:
	text "Darn. I study five"
	line "hours a day too."

	para "There's more to"
	line "learning than just"
	cont "reading books."
	done

MeetArthurText:
	text "ARTHUR: Who are"
	line "you?"

	para "I'm ARTHUR of"
	line "Thursday."
	done

ArthurGivesGiftText:
	text "Here. You can have"
	line "this."
	done

ArthurGaveGiftText:
	text "ARTHUR: A #MON"
	line "that uses rock-"

	para "type moves should"
	line "hold on to that."

	para "It pumps up rock-"
	line "type attacks."
	done

ArthurThursdayText:
	text "ARTHUR: I'm ARTHUR"
	line "of Thursday. I'm"

	para "the second son out"
	line "of seven children."
	done

ArthurNotThursdayText:
	text "ARTHUR: Today's"
	line "not Thursday. How"
	cont "disappointing."
	done

UnknownText_0x194924:
	text "ROUTE 36"
	done

UnknownText_0x19492e:
	text "RUINS OF ALPH"
	line "NORTH ENTRANCE"
	done

UnknownText_0x19494c:
	text "TRAINER TIPS"

	para "#MON stats"
	line "vary--even within"
	cont "the same species."

	para "Their stats may be"
	line "similar at first."

	para "However, differ-"
	line "ences will become"

	para "pronounced as the"
	line "#MON grow."
	done

UnknownText_0x1949ee:
	text "TRAINER TIPS"

	para "Use DIG to return"
	line "to the entrance of"
	cont "any place."

	para "It is convenient"
	line "for exploring"

	para "caves and other"
	line "landmarks."
	done

Route36_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 4
	warp_def $8, $12, 3, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $9, $12, 4, GROUP_ROUTE_36_NATIONAL_PARK_GATE, MAP_ROUTE_36_NATIONAL_PARK_GATE
	warp_def $d, $2f, 1, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE
	warp_def $d, $30, 2, GROUP_ROUTE_36_RUINS_OF_ALPH_GATE, MAP_ROUTE_36_RUINS_OF_ALPH_GATE

.XYTriggers:
	db 2
	xy_trigger 1, $7, $14, $0, UnknownScript_0x19401b, $0, $0
	xy_trigger 1, $7, $16, $0, UnknownScript_0x19401b, $0, $0

.Signposts:
	db 4
	signpost 1, 29, SIGNPOST_READ, MapRoute36Signpost0Script
	signpost 11, 45, SIGNPOST_READ, MapRoute36Signpost1Script
	signpost 7, 55, SIGNPOST_READ, MapRoute36Signpost2Script
	signpost 7, 21, SIGNPOST_READ, MapRoute36Signpost3Script

.PersonEvents:
	db 9
	person_event SPRITE_YOUNGSTER, 17, 24, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPsychicMark, -1
	person_event SPRITE_YOUNGSTER, 18, 35, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 5, TrainerSchoolboyAlan1, -1
	person_event SPRITE_WEIRD_TREE, 13, 39, OW_UP | $13, $0, -1, -1, $0, 0, WeirdTreeScript_0x19403c, EVENT_ROUTE_36_SUDOWOODO
	person_event SPRITE_LASS, 12, 55, OW_UP | $1, $2, -1, -1, $0, 0, LassScript_0x1940e0, -1
	person_event SPRITE_FISHER, 13, 48, OW_LEFT | $0, $0, -1, -1, $0, 0, FisherScript_0x1940b9, -1
	person_event SPRITE_FRUIT_TREE, 8, 25, OW_DOWN | $1, $0, -1, -1, $0, 0, FruitTreeScript_0x194247, -1
	person_event SPRITE_YOUNGSTER, 10, 50, OW_DOWN | $2, $11, -1, -1, $0, 0, ArthurScript, EVENT_ROUTE_36_ARTHUR_OF_THURSDAY
	person_event SPRITE_LASS, 16, 37, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, LassScript_0x19408c, EVENT_FLORIA_AT_SUDOWOODO
	person_event SPRITE_SUICUNE, 10, 25, OW_DOWN | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, ObjectEvent, EVENT_SAW_SUICUNE_ON_ROUTE_36
