Route27_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x1a0871, $0000
	dw UnknownScript_0x1a0872, $0000

.MapCallbacks:
	db 0

UnknownScript_0x1a0871:
	end

UnknownScript_0x1a0872:
	end

UnknownScript_0x1a0873:
	spriteface $a, LEFT
	showemote EMOTE_SHOCK, $a, 15
	applymovement $a, MovementData_0x1a0a66
	jump UnknownScript_0x1a088c

UnknownScript_0x1a0881:
	spriteface $a, LEFT
	showemote EMOTE_SHOCK, $a, 15
	applymovement $a, MovementData_0x1a0a69
UnknownScript_0x1a088c:
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x1a0a6b
	keeptextopen
	writetext UnknownText_0x1a0a71
	closetext
	loadmovesprites
	dotrigger $1
	end

FisherScript_0x1a089c:
	jumptextfaceplayer UnknownText_0x1a0a71

TrainerPsychicGilbert:
	trainer EVENT_BEAT_PSYCHIC_GILBERT, PSYCHIC_T, GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, $0000, PsychicGilbertScript

PsychicGilbertScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a0dd2
	closetext
	loadmovesprites
	end

TrainerBird_keeperJose2:
	trainer EVENT_BEAT_BIRD_KEEPER_JOSE2, BIRD_KEEPER, JOSE2, Bird_keeperJose2SeenText, Bird_keeperJose2BeatenText, $0000, Bird_keeperJose2Script

Bird_keeperJose2Script:
	writecode VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	talkaftercancel
	loadfont
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0x1a08ff
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0x1a0945
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue UnknownScript_0x1a0963
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a08e8
	writetext UnknownText_0x1a0e42
	keeptextopen
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a0957
	jump UnknownScript_0x1a08eb

UnknownScript_0x1a08e8:
	scall UnknownScript_0x1a095b
UnknownScript_0x1a08eb:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	if_equal $1, UnknownScript_0x1a096b
	if_equal $2, UnknownScript_0x1a0967
	trainertotext BIRD_KEEPER, JOSE2, $0
	scall UnknownScript_0x1a095f
	jump UnknownScript_0x1a0963

UnknownScript_0x1a08ff:
	scall UnknownScript_0x1a096f
	winlosstext Bird_keeperJose2BeatenText, $0000
	copybytetovar wJoseFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	returnafterbattle
	loadvar wJoseFightCount, 1
	clearflag ENGINE_JOSE
	end

.LoadFight1
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	returnafterbattle
	loadvar wJoseFightCount, 2
	clearflag ENGINE_JOSE
	end

.LoadFight2
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	returnafterbattle
	clearflag ENGINE_JOSE
	end

UnknownScript_0x1a0945:
	scall UnknownScript_0x1a0973
	verbosegiveitem STAR_PIECE, 1
	iffalse UnknownScript_0x1a0954
	clearflag ENGINE_JOSE_HAS_STAR_PIECE
	jump UnknownScript_0x1a0963

UnknownScript_0x1a0954:
	jump UnknownScript_0x1a0977

UnknownScript_0x1a0957:
	jumpstd asknumber1m
	end

UnknownScript_0x1a095b:
	jumpstd asknumber2m
	end

UnknownScript_0x1a095f:
	jumpstd registerednumberm
	end

UnknownScript_0x1a0963:
	jumpstd numberacceptedm
	end

UnknownScript_0x1a0967:
	jumpstd numberdeclinedm
	end

UnknownScript_0x1a096b:
	jumpstd phonefullm
	end

UnknownScript_0x1a096f:
	jumpstd rematchm
	end

UnknownScript_0x1a0973:
	jumpstd giftm
	end

UnknownScript_0x1a0977:
	jumpstd packfullm
	end

TrainerCooltrainermBlake:
	trainer EVENT_BEAT_COOLTRAINERM_BLAKE, COOLTRAINERM, BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, $0000, CooltrainermBlakeScript

CooltrainermBlakeScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a0b0b
	closetext
	loadmovesprites
	end

TrainerCooltrainermBrian:
	trainer EVENT_BEAT_COOLTRAINERM_BRIAN, COOLTRAINERM, BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, $0000, CooltrainermBrianScript

CooltrainermBrianScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a0bac
	closetext
	loadmovesprites
	end

TrainerCooltrainerfReena:
	trainer EVENT_BEAT_COOLTRAINERF_REENA, COOLTRAINERF, REENA1, CooltrainerfReena1SeenText, CooltrainerfReena1BeatenText, $0000, CooltrainerfReena1Script

CooltrainerfReena1Script:
	writecode VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	talkaftercancel
	loadfont
	checkflag ENGINE_REENA
	iftrue UnknownScript_0x1a09e9
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue UnknownScript_0x1a0a3b
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a09d2
	writetext UnknownText_0x1a0c35
	keeptextopen
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a0a2f
	jump UnknownScript_0x1a09d5

UnknownScript_0x1a09d2:
	scall UnknownScript_0x1a0a33
UnknownScript_0x1a09d5:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	if_equal $1, UnknownScript_0x1a0a43
	if_equal $2, UnknownScript_0x1a0a3f
	trainertotext COOLTRAINERF, REENA1, $0
	scall UnknownScript_0x1a0a37
	jump UnknownScript_0x1a0a3b

UnknownScript_0x1a09e9:
	scall UnknownScript_0x1a0a47
	winlosstext CooltrainerfReena1BeatenText, $0000
	copybytetovar wReenaFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	returnafterbattle
	loadvar wReenaFightCount, 1
	clearflag ENGINE_REENA
	end

.LoadFight1
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	returnafterbattle
	loadvar wReenaFightCount, 2
	clearflag ENGINE_REENA
	end

.LoadFight2
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	returnafterbattle
	clearflag ENGINE_REENA
	end

UnknownScript_0x1a0a2f:
	jumpstd asknumber1f
	end

UnknownScript_0x1a0a33:
	jumpstd asknumber2f
	end

UnknownScript_0x1a0a37:
	jumpstd registerednumberf
	end

UnknownScript_0x1a0a3b:
	jumpstd numberacceptedf
	end

UnknownScript_0x1a0a3f:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1a0a43:
	jumpstd phonefullf
	end

UnknownScript_0x1a0a47:
	jumpstd rematchf
	end

TrainerCooltrainerfMegan:
	trainer EVENT_BEAT_COOLTRAINERF_MEGAN, COOLTRAINERF, MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, $0000, CooltrainerfMeganScript

CooltrainerfMeganScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1a0cce
	closetext
	loadmovesprites
	end

MapRoute27Signpost0Script:
	jumptext UnknownText_0x1a0e7f

ItemFragment_0x1a0a62:
	db TM_SOLARBEAM, 1

ItemFragment_0x1a0a64:
	db RARE_CANDY, 1

MovementData_0x1a0a66:
	step_left
	step_left
	step_end

MovementData_0x1a0a69:
	step_left
	step_end

UnknownText_0x1a0a6b:
	text "Hey!"
	done

UnknownText_0x1a0a71:
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "KANTO."

	para "Check your #-"
	line "GEAR MAP and see."
	done

CooltrainermBlakeSeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainermBlakeBeatenText:
	text "Yow!"
	done

UnknownText_0x1a0b0b:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

CooltrainermBrianSeenText:
	text "Hm? You're good,"
	line "aren't you?"
	done

CooltrainermBrianBeatenText:
	text "Just as I thought!"
	done

UnknownText_0x1a0bac:
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done

CooltrainerfReena1SeenText:
	text "You shouldn't"
	line "underestimate the"

	para "wild #MON in"
	line "these parts."
	done

CooltrainerfReena1BeatenText:
	text "Oh! You're much"
	line "too strong!"
	done

UnknownText_0x1a0c35:
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done

CooltrainerfMeganSeenText:
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done

CooltrainerfMeganBeatenText:
	text "Oh! You're really"
	line "strong!"
	done

UnknownText_0x1a0cce:
	text "I'm checking out"
	line "pre- and post-"
	cont "evolution #MON."

	para "Evolution really"
	line "does make #MON"
	cont "stronger."

	para "But evolved forms"
	line "also learn moves"
	cont "later on."
	done

PsychicGilbertSeenText:
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #MON"
	cont "LEAGUE challenge!"
	done

PsychicGilbertBeatenText:
	text "You're too much!"
	done

UnknownText_0x1a0dd2:
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done

Bird_keeperJose2SeenText:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

Bird_keeperJose2BeatenText:
	text "Tweet!"
	done

UnknownText_0x1a0e42:
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
	done

UnknownText_0x1a0e7f:
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "KANTO AND JOHTO"
	done

Route27_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $7, $21, 1, GROUP_ROUTE_27_SANDSTORM_HOUSE, MAP_ROUTE_27_SANDSTORM_HOUSE
	warp_def $5, $1a, 1, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS
	warp_def $5, $24, 2, GROUP_TOHJO_FALLS, MAP_TOHJO_FALLS

.XYTriggers:
	db 2
	xy_trigger 0, $a, $12, $0, UnknownScript_0x1a0873, $0, $0
	xy_trigger 0, $a, $13, $0, UnknownScript_0x1a0881, $0, $0

.Signposts:
	db 1
	signpost 7, 25, SIGNPOST_READ, MapRoute27Signpost0Script

.PersonEvents:
	db 9
	person_event SPRITE_COOLTRAINER_M, 11, 52, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainermBlake, -1
	person_event SPRITE_COOLTRAINER_M, 10, 62, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerCooltrainermBrian, -1
	person_event SPRITE_COOLTRAINER_F, 14, 76, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 4, TrainerCooltrainerfReena, -1
	person_event SPRITE_COOLTRAINER_F, 10, 41, OW_RIGHT | $13, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerCooltrainerfMegan, -1
	person_event SPRITE_YOUNGSTER, 11, 69, OW_LEFT | $0, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerPsychicGilbert, -1
	person_event SPRITE_YOUNGSTER, 17, 62, OW_LEFT | $1, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerBird_keeperJose2, -1
	person_event SPRITE_POKE_BALL, 16, 64, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a0a62, EVENT_ROUTE_27_TM_SOLARBEAM
	person_event SPRITE_POKE_BALL, 16, 57, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x1a0a64, EVENT_ROUTE_27_RARE_CANDY
	person_event SPRITE_FISHER, 14, 25, OW_DOWN | $3, $0, -1, -1, $0, 3, FisherScript_0x1a089c, -1
