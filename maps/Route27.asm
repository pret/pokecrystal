const_value set 2
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_M2
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_YOUNGSTER1
	const ROUTE27_YOUNGSTER2
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2
	const ROUTE27_FISHER

Route27_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0
	scene_script .DummyScene1

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

UnknownScript_0x1a0873:
	spriteface ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a66
	jump UnknownScript_0x1a088c

UnknownScript_0x1a0881:
	spriteface ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a69
UnknownScript_0x1a088c:
	spriteface PLAYER, RIGHT
	opentext
	writetext UnknownText_0x1a0a6b
	buttonsound
	writetext Route27FisherText
	waitbutton
	closetext
	setscene 1
	end

Route27FisherScript:
	jumptextfaceplayer Route27FisherText

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_BIRDKEEPER_JOSE
	end_if_just_battled
	opentext
	checkflag ENGINE_JOSE
	iftrue UnknownScript_0x1a08ff
	checkflag ENGINE_JOSE_HAS_STAR_PIECE
	iftrue UnknownScript_0x1a0945
	checkcellnum PHONE_BIRDKEEPER_JOSE
	iftrue UnknownScript_0x1a0963
	checkevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a08e8
	writetext UnknownText_0x1a0e42
	buttonsound
	setevent EVENT_JOSE_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a0957
	jump UnknownScript_0x1a08eb

UnknownScript_0x1a08e8:
	scall UnknownScript_0x1a095b
UnknownScript_0x1a08eb:
	askforphonenumber PHONE_BIRDKEEPER_JOSE
	if_equal PHONE_CONTACTS_FULL, UnknownScript_0x1a096b
	if_equal PHONE_CONTACT_REFUSED, UnknownScript_0x1a0967
	trainertotext BIRD_KEEPER, JOSE2, MEM_BUFFER_0
	scall UnknownScript_0x1a095f
	jump UnknownScript_0x1a0963

UnknownScript_0x1a08ff:
	scall UnknownScript_0x1a096f
	winlosstext BirdKeeperJose2BeatenText, 0
	copybytetovar wJoseFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer BIRD_KEEPER, JOSE2
	startbattle
	reloadmapafterbattle
	loadvar wJoseFightCount, 1
	clearflag ENGINE_JOSE
	end

.LoadFight1:
	loadtrainer BIRD_KEEPER, JOSE1
	startbattle
	reloadmapafterbattle
	loadvar wJoseFightCount, 2
	clearflag ENGINE_JOSE
	end

.LoadFight2:
	loadtrainer BIRD_KEEPER, JOSE3
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_JOSE
	end

UnknownScript_0x1a0945:
	scall UnknownScript_0x1a0973
	verbosegiveitem STAR_PIECE
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
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainermBrianAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReena1SeenText, CooltrainerfReena1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_COOLTRAINERF_REENA
	end_if_just_battled
	opentext
	checkflag ENGINE_REENA
	iftrue UnknownScript_0x1a09e9
	checkcellnum PHONE_COOLTRAINERF_REENA
	iftrue UnknownScript_0x1a0a3b
	checkevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x1a09d2
	writetext UnknownText_0x1a0c35
	buttonsound
	setevent EVENT_REENA_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x1a0a2f
	jump UnknownScript_0x1a09d5

UnknownScript_0x1a09d2:
	scall UnknownScript_0x1a0a33
UnknownScript_0x1a09d5:
	askforphonenumber PHONE_COOLTRAINERF_REENA
	if_equal PHONE_CONTACTS_FULL, UnknownScript_0x1a0a43
	if_equal PHONE_CONTACT_REFUSED, UnknownScript_0x1a0a3f
	trainertotext COOLTRAINERF, REENA1, MEM_BUFFER_0
	scall UnknownScript_0x1a0a37
	jump UnknownScript_0x1a0a3b

UnknownScript_0x1a09e9:
	scall UnknownScript_0x1a0a47
	winlosstext CooltrainerfReena1BeatenText, 0
	copybytetovar wReenaFightCount
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight2:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight2
.Fight1:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer COOLTRAINERF, REENA1
	startbattle
	reloadmapafterbattle
	loadvar wReenaFightCount, 1
	clearflag ENGINE_REENA
	end

.LoadFight1:
	loadtrainer COOLTRAINERF, REENA2
	startbattle
	reloadmapafterbattle
	loadvar wReenaFightCount, 2
	clearflag ENGINE_REENA
	end

.LoadFight2:
	loadtrainer COOLTRAINERF, REENA3
	startbattle
	reloadmapafterbattle
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
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign:
	jumptext TohjoFallsSignText

Route27TMSolarbeam:
	itemball TM_SOLARBEAM

Route27RareCandy:
	itemball RARE_CANDY

MovementData_0x1a0a66:
	step LEFT
	step LEFT
	step_end

MovementData_0x1a0a69:
	step LEFT
	step_end

UnknownText_0x1a0a6b:
	text "Hey!"
	done

Route27FisherText:
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

CooltrainermBlakeAfterBattleText:
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

CooltrainermBrianAfterBattleText:
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

CooltrainerfMeganAfterBattleText:
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

PsychicGilbertAfterBattleText:
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done

BirdKeeperJose2SeenText:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

BirdKeeperJose2BeatenText:
	text "Tweet!"
	done

UnknownText_0x1a0e42:
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
	done

TohjoFallsSignText:
	text "TOHJO FALLS"

	para "THE LINK BETWEEN"
	line "KANTO AND JOHTO"
	done

Route27_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33, 7, 1, ROUTE_27_SANDSTORM_HOUSE
	warp_event 26, 5, 1, TOHJO_FALLS
	warp_event 36, 5, 2, TOHJO_FALLS

	db 2 ; coord events
	coord_event 18, 10, 0, UnknownScript_0x1a0873
	coord_event 19, 10, 0, UnknownScript_0x1a0881

	db 1 ; bg events
	bg_event 25, 7, BGEVENT_READ, TohjoFallsSign

	db 9 ; object events
	object_event 48, 7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 58, 6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 72, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37, 6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	object_event 65, 7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 58, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 3, Route27FisherScript, -1
