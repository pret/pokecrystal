Route34_MapScriptHeader:
.MapTriggers:
	db 0

.MapCallbacks:
	db 1

	; callbacks

	dbw 2, UnknownScript_0x78005

UnknownScript_0x78005:
	checkflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	iftrue UnknownScript_0x78014
	clearevent EVENT_DAYCARE_MAN_IN_DAYCARE
	setevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	jump UnknownScript_0x7801d

UnknownScript_0x78014:
	setevent EVENT_DAYCARE_MAN_IN_DAYCARE
	clearevent EVENT_DAYCARE_MAN_ON_ROUTE_34
	jump UnknownScript_0x7801d

UnknownScript_0x7801d:
	checkflag ENGINE_DAYCARE_MAN_HAS_MON
	iffalse UnknownScript_0x78029
	clearevent EVENT_DAYCARE_MON_1
	jump UnknownScript_0x7802f

UnknownScript_0x78029:
	setevent EVENT_DAYCARE_MON_1
	jump UnknownScript_0x7802f

UnknownScript_0x7802f:
	checkflag ENGINE_DAYCARE_LADY_HAS_MON
	iffalse UnknownScript_0x78039
	clearevent EVENT_DAYCARE_MON_2
	return

UnknownScript_0x78039:
	setevent EVENT_DAYCARE_MON_2
	return

GrampsScript_0x7803d:
	faceplayer
	loadfont
	special Special_DayCareManOutside
	closetext
	loadmovesprites
	if_equal $1, UnknownScript_0x7805a
	clearflag ENGINE_DAYCARE_MONS_ARE_COMPATIBLE
	checkcode VAR_FACING
	if_equal $3, UnknownScript_0x7805b
	applymovement $8, MovementData_0x78333
	playsound SFX_ENTER_DOOR
	disappear $8
UnknownScript_0x7805a:
	end

UnknownScript_0x7805b:
	applymovement $8, MovementData_0x78337
	playsound SFX_ENTER_DOOR
	disappear $8
	end

DaycareMon1Script_0x78065:
	loadfont
	special Function17421
	loadmovesprites
	end

DaycareMon2Script_0x7806b:
	loadfont
	special Function17440
	loadmovesprites
	end

TrainerCamperTodd1:
	trainer EVENT_BEAT_CAMPER_TODD, CAMPER, TODD1, CamperTodd1SeenText, CamperTodd1BeatenText, $0000, CamperTodd1Script

CamperTodd1Script:
	writecode VAR_CALLERID, PHONE_CAMPER_TODD
	talkaftercancel
	loadfont
	checkflag ENGINE_TODD
	iftrue UnknownScript_0x780bd
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue UnknownScript_0x78131
	checkcellnum PHONE_CAMPER_TODD
	iftrue UnknownScript_0x78143
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x780a6
	writetext UnknownText_0x784f0
	keeptextopen
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x78137
	jump UnknownScript_0x780a9

UnknownScript_0x780a6:
	scall UnknownScript_0x7813b
UnknownScript_0x780a9:
	askforphonenumber PHONE_CAMPER_TODD
	if_equal $1, UnknownScript_0x7814b
	if_equal $2, UnknownScript_0x78147
	trainertotext CAMPER, TODD1, $0
	scall UnknownScript_0x7813f
	jump UnknownScript_0x78143

UnknownScript_0x780bd:
	scall UnknownScript_0x7814f
	winlosstext CamperTodd1BeatenText, $0000
	copybytetovar wToddFightCount
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
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0
	loadtrainer CAMPER, TODD1
	startbattle
	returnafterbattle
	loadvar wToddFightCount, 1
	clearflag ENGINE_TODD
	end

.LoadFight1
	loadtrainer CAMPER, TODD2
	startbattle
	returnafterbattle
	loadvar wToddFightCount, 2
	clearflag ENGINE_TODD
	end

.LoadFight2
	loadtrainer CAMPER, TODD3
	startbattle
	returnafterbattle
	loadvar wToddFightCount, 3
	clearflag ENGINE_TODD
	end

.LoadFight3
	loadtrainer CAMPER, TODD4
	startbattle
	returnafterbattle
	loadvar wToddFightCount, 4
	clearflag ENGINE_TODD
	end

.LoadFight4
	loadtrainer CAMPER, TODD5
	startbattle
	returnafterbattle
	clearflag ENGINE_TODD
	end

UnknownScript_0x78131:
	writetext UnknownText_0x78532
	closetext
	loadmovesprites
	end

UnknownScript_0x78137:
	jumpstd asknumber1m
	end

UnknownScript_0x7813b:
	jumpstd asknumber2m
	end

UnknownScript_0x7813f:
	jumpstd registerednumberm
	end

UnknownScript_0x78143:
	jumpstd numberacceptedm
	end

UnknownScript_0x78147:
	jumpstd numberdeclinedm
	end

UnknownScript_0x7814b:
	jumpstd phonefullm
	end

UnknownScript_0x7814f:
	jumpstd rematchm
	end

TrainerPicnickerGina1:
	trainer EVENT_BEAT_PICNICKER_GINA, PICNICKER, GINA1, PicnickerGina1SeenText, PicnickerGina1BeatenText, $0000, PicnickerGina1Script

PicnickerGina1Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_GINA
	talkaftercancel
	loadfont
	checkflag ENGINE_GINA
	iftrue UnknownScript_0x7819f
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue UnknownScript_0x78213
	checkcellnum PHONE_PICNICKER_GINA
	iftrue UnknownScript_0x78234
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue UnknownScript_0x78188
	writetext UnknownText_0x785b8
	keeptextopen
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall UnknownScript_0x78228
	jump UnknownScript_0x7818b

UnknownScript_0x78188:
	scall UnknownScript_0x7822c
UnknownScript_0x7818b:
	askforphonenumber PHONE_PICNICKER_GINA
	if_equal $1, UnknownScript_0x7823c
	if_equal $2, UnknownScript_0x78238
	trainertotext PICNICKER, GINA1, $0
	scall UnknownScript_0x78230
	jump UnknownScript_0x78234

UnknownScript_0x7819f:
	scall UnknownScript_0x78240
	winlosstext PicnickerGina1BeatenText, $0000
	copybytetovar wGinaFightCount
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
	loadtrainer PICNICKER, GINA1
	startbattle
	returnafterbattle
	loadvar wGinaFightCount, 1
	clearflag ENGINE_GINA
	end

.LoadFight1
	loadtrainer PICNICKER, GINA2
	startbattle
	returnafterbattle
	loadvar wGinaFightCount, 2
	clearflag ENGINE_GINA
	end

.LoadFight2
	loadtrainer PICNICKER, GINA3
	startbattle
	returnafterbattle
	loadvar wGinaFightCount, 3
	clearflag ENGINE_GINA
	end

.LoadFight3
	loadtrainer PICNICKER, GINA4
	startbattle
	returnafterbattle
	loadvar wGinaFightCount, 4
	clearflag ENGINE_GINA
	end

.LoadFight4
	loadtrainer PICNICKER, GINA5
	startbattle
	returnafterbattle
	clearflag ENGINE_GINA
	end

UnknownScript_0x78213:
	scall UnknownScript_0x78244
	verbosegiveitem LEAF_STONE, 1
	iffalse UnknownScript_0x78225
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	jump UnknownScript_0x78234

UnknownScript_0x78225:
	jump UnknownScript_0x78248

UnknownScript_0x78228:
	jumpstd asknumber1f
	end

UnknownScript_0x7822c:
	jumpstd asknumber2f
	end

UnknownScript_0x78230:
	jumpstd registerednumberf
	end

UnknownScript_0x78234:
	jumpstd numberacceptedf
	end

UnknownScript_0x78238:
	jumpstd numberdeclinedf
	end

UnknownScript_0x7823c:
	jumpstd phonefullf
	end

UnknownScript_0x78240:
	jumpstd rematchf
	end

UnknownScript_0x78244:
	jumpstd giftf
	end

UnknownScript_0x78248:
	jumpstd packfullf
	end

OfficerScript_0x7824c:
	faceplayer
	loadfont
	checknite
	iffalse UnknownScript_0x78276
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue UnknownScript_0x78270
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext UnknownText_0x785e4
	closetext
	loadmovesprites
	winlosstext UnknownText_0x78609, $0000
	loadtrainer OFFICER, KEITH
	startbattle
	returnafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	loadmovesprites
	end

UnknownScript_0x78270:
	writetext UnknownText_0x78624
	closetext
	loadmovesprites
	end

UnknownScript_0x78276:
	writetext UnknownText_0x7866a
	closetext
	loadmovesprites
	end

TrainerYoungsterSamuel:
	trainer EVENT_BEAT_YOUNGSTER_SAMUEL, YOUNGSTER, SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, $0000, YoungsterSamuelScript

YoungsterSamuelScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x783d8
	closetext
	loadmovesprites
	end

TrainerYoungsterIan:
	trainer EVENT_BEAT_YOUNGSTER_IAN, YOUNGSTER, IAN, YoungsterIanSeenText, YoungsterIanBeatenText, $0000, YoungsterIanScript

YoungsterIanScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x78469
	closetext
	loadmovesprites
	end

TrainerPokefanmBrandon:
	trainer EVENT_BEAT_POKEFANM_BRANDON, POKEFANM, BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, $0000, PokefanmBrandonScript

PokefanmBrandonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x786fc
	closetext
	loadmovesprites
	end

TrainerCooltrainerfIrene:
	trainer EVENT_BEAT_COOLTRAINERF_IRENE, COOLTRAINERF, IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, $0000, CooltrainerfIreneScript

CooltrainerfIreneScript:
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x782d2
	writetext UnknownText_0x7877f
	closetext
	loadmovesprites
	end

UnknownScript_0x782d2:
	writetext UnknownText_0x787ad
	closetext
	loadmovesprites
	end

TrainerCooltrainerfJenn:
	trainer EVENT_BEAT_COOLTRAINERF_JENN, COOLTRAINERF, JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, $0000, CooltrainerfJennScript

CooltrainerfJennScript:
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x782f2
	writetext UnknownText_0x78836
	closetext
	loadmovesprites
	end

UnknownScript_0x782f2:
	writetext UnknownText_0x78866
	closetext
	loadmovesprites
	end

TrainerCooltrainerfKate:
	trainer EVENT_BEAT_COOLTRAINERF_KATE, COOLTRAINERF, KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, $0000, CooltrainerfKateScript

CooltrainerfKateScript:
	talkaftercancel
	loadfont
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue UnknownScript_0x78319
	writetext UnknownText_0x788e2
	keeptextopen
	verbosegiveitem SOFT_SAND, 1
	iffalse UnknownScript_0x7831d
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
UnknownScript_0x78319:
	writetext UnknownText_0x7892b
	closetext
UnknownScript_0x7831d:
	loadmovesprites
	end

UnknownScript_0x7831f:
	jumptext UnknownText_0x7898a

MapRoute34Signpost0Script:
	jumptext UnknownText_0x789a8

MapRoute34Signpost1Script:
	jumptext UnknownText_0x789ed

MapRoute34Signpost2Script:
	jumptext UnknownText_0x78a52

ItemFragment_0x7832b:
	db NUGGET, 1

MapRoute34SignpostItem3:
	dwb EVENT_ROUTE_34_HIDDEN_RARE_CANDY, RARE_CANDY
	

MapRoute34SignpostItem4:
	dwb EVENT_ROUTE_34_HIDDEN_SUPER_POTION, SUPER_POTION
	

MovementData_0x78333:
	slow_step_left
	slow_step_left
	slow_step_up
	step_end

MovementData_0x78337:
	slow_step_down
	slow_step_left
	slow_step_left
	slow_step_up
	slow_step_up
	step_end

YoungsterSamuelSeenText:
	text "This is where I do"
	line "my training!"
	done

YoungsterSamuelBeatenText:
	text "Beaten by a"
	line "passing stranger!"
	done

UnknownText_0x7837d:
	text "Have you been to"
	line "GOLDENROD CITY?"

	para "Weren't you amazed"
	line "by how they've"

	para "changed the"
	line "#MON CENTER?"
	done

UnknownText_0x783d8:
	text "I'm going to train"
	line "even harder."

	para "After all, I'm"
	line "trying to become"
	cont "a GYM LEADER."
	done

YoungsterIanSeenText:
	text "I'm the best in my"
	line "class at #MON."
	done

YoungsterIanBeatenText:
	text "No! There are bet-"
	line "ter trainers…"
	done

UnknownText_0x78469:
	text "I'm trying hard so"
	line "I can be the star"
	cont "in my class."
	done

CamperTodd1SeenText:
	text "I'm confident in"
	line "my ability to"
	cont "raise #MON."

	para "Want to see?"
	done

CamperTodd1BeatenText:
	text "Did I screw up my"
	line "training?"
	done

UnknownText_0x784f0:
	text "Maybe I should"
	line "take one to a DAY-"

	para "CARE. Or maybe use"
	line "some items…"
	done

UnknownText_0x78532:
	text "Shopping under the"
	line "sky!"

	para "It feels so nice"
	line "up on a rooftop."
	done

PicnickerGina1SeenText:
	text "Are you a trainer?"

	para "Let's have a"
	line "practice battle."
	done

PicnickerGina1BeatenText:
	text "Oh, no! I just"
	line "can't win…"
	done

UnknownText_0x785b8:
	text "You're too strong"
	line "to be a practice"
	cont "partner."
	done

UnknownText_0x785e4:
	text "Who goes there?"
	line "What are you up"
	cont "to?"
	done

UnknownText_0x78609:
	text "You're a tough"
	line "little kid."
	done

UnknownText_0x78624:
	text "Yep, I see nothing"
	line "wrong today. You"

	para "be good and stay"
	line "out of trouble."
	done

UnknownText_0x7866a:
	text "I'm on patrol for"
	line "suspicious indi-"
	cont "viduals."
	done

PokefanmBrandonSeenText:
	text "I just got my"
	line "#MON back from"
	cont "DAY-CARE."

	para "Let's see how much"
	line "stronger it got!"
	done

PokefanmBrandonBeatenText:
	text "Why does it end"
	line "this way?"
	done

UnknownText_0x786fc:
	text "My #MON knew"
	line "moves I didn't"
	cont "know it had."

	para "That confounded me"
	line "to no end!"
	done

CooltrainerfIreneSeenText:
	text "IRENE: Kyaaah!"
	line "Someone found us!"
	done

CooltrainerfIreneBeatenText:
	text "IRENE: Ohhh!"
	line "Too strong!"
	done

UnknownText_0x7877f:
	text "IRENE: My sister"
	line "KATE will get you"
	cont "for this!"
	done

UnknownText_0x787ad:
	text "IRENE: Isn't this"
	line "beach great?"

	para "It's our secret"
	line "little getaway!"
	done

CooltrainerfJennSeenText:
	text "JENN: You can't"
	line "beat IRENE and go"
	cont "unpunished!"
	done

CooltrainerfJennBeatenText:
	text "JENN: So sorry,"
	line "IRENE! Sis!"
	done

UnknownText_0x78836:
	text "JENN: Don't get"
	line "cocky! My sister"
	cont "KATE is tough!"
	done

UnknownText_0x78866:
	text "JENN: Sunlight"
	line "makes your body"
	cont "stronger."
	done

CooltrainerfKateSeenText:
	text "KATE: You sure"
	line "were mean to my"
	cont "little sisters!"
	done

CooltrainerfKateBeatenText:
	text "KATE: No! I can't"
	line "believe I lost."
	done

UnknownText_0x788e2:
	text "KATE: You're too"
	line "strong. I didn't"
	cont "stand a chance."

	para "Here. You deserve"
	line "this."
	done

UnknownText_0x7892b:
	text "KATE: I'm sorry we"
	line "jumped you."

	para "We never expected"
	line "anyone to find us"

	para "here. You sure"
	line "startled us."
	done

UnknownText_0x7898a:
	text "ILEX FOREST"
	line "THROUGH THE GATE"
	done

UnknownText_0x789a8:
	text "ROUTE 34"

	para "GOLDENROD CITY -"
	line "AZALEA TOWN"

	para "ILEX FOREST"
	line "SOMEWHERE BETWEEN"
	done

UnknownText_0x789ed:
	text "TRAINER TIPS"

	para "BERRY trees grow"
	line "new BERRIES"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which BERRIES."
	done

UnknownText_0x78a52:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done

Route34_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 5
	warp_def $25, $d, 1, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $25, $e, 2, GROUP_ROUTE_34_ILEX_FOREST_GATE, MAP_ROUTE_34_ILEX_FOREST_GATE
	warp_def $e, $b, 1, GROUP_DAYCARE, MAP_DAYCARE
	warp_def $f, $b, 2, GROUP_DAYCARE, MAP_DAYCARE
	warp_def $f, $d, 3, GROUP_DAYCARE, MAP_DAYCARE

.XYTriggers:
	db 0

.Signposts:
	db 5
	signpost 6, 12, SIGNPOST_READ, MapRoute34Signpost0Script
	signpost 33, 13, SIGNPOST_READ, MapRoute34Signpost1Script
	signpost 13, 10, SIGNPOST_READ, MapRoute34Signpost2Script
	signpost 32, 8, SIGNPOST_ITEM, MapRoute34SignpostItem3
	signpost 19, 17, SIGNPOST_ITEM, MapRoute34SignpostItem4

.PersonEvents:
	db 13
	person_event SPRITE_YOUNGSTER, 11, 17, OW_LEFT | $0, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 5, TrainerCamperTodd1, -1
	person_event SPRITE_YOUNGSTER, 36, 19, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerYoungsterSamuel, -1
	person_event SPRITE_YOUNGSTER, 24, 15, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $82, 3, TrainerYoungsterIan, -1
	person_event SPRITE_LASS, 30, 14, OW_LEFT | $1, $0, -1, -1, (PAL_OW_GREEN << 4) | $82, 3, TrainerPicnickerGina1, -1
	person_event SPRITE_OFFICER, 15, 13, OW_UP | $2, $0, -1, -1, (PAL_OW_BLUE << 4) | $80, 0, OfficerScript_0x7824c, -1
	person_event SPRITE_POKEFAN_M, 32, 22, OW_RIGHT | $12, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerPokefanmBrandon, -1
	person_event SPRITE_GRAMPS, 20, 19, OW_UP | $2, $0, -1, -1, $0, 0, GrampsScript_0x7803d, EVENT_DAYCARE_MAN_ON_ROUTE_34
	person_event SPRITE_DAYCARE_MON_1, 22, 18, OW_UP | $12, $22, -1, -1, $0, 0, DaycareMon1Script_0x78065, EVENT_DAYCARE_MON_1
	person_event SPRITE_DAYCARE_MON_2, 23, 21, OW_UP | $12, $22, -1, -1, $0, 0, DaycareMon2Script_0x7806b, EVENT_DAYCARE_MON_2
	person_event SPRITE_COOLTRAINER_F, 52, 15, OW_LEFT | $0, $0, -1, -1, (PAL_OW_RED << 4) | $82, 5, TrainerCooltrainerfIrene, -1
	person_event SPRITE_COOLTRAINER_F, 52, 7, OW_LEFT | $1, $0, -1, -1, (PAL_OW_RED << 4) | $82, 3, TrainerCooltrainerfJenn, -1
	person_event SPRITE_COOLTRAINER_F, 55, 10, OW_UP | $3, $0, -1, -1, (PAL_OW_RED << 4) | $82, 2, TrainerCooltrainerfKate, -1
	person_event SPRITE_POKE_BALL, 34, 11, OW_DOWN | $1, $0, -1, -1, $1, 0, ItemFragment_0x7832b, EVENT_ROUTE_34_NUGGET
