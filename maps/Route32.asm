Route32_MapScriptHeader:
	; trigger count
	db 3

	; triggers
	dw UnknownScript_0x190460, $0000
	dw UnknownScript_0x190461, $0000
	dw UnknownScript_0x190462, $0000

	; callback count
	db 1

	; callbacks

	dbw 2, FriedaCallback

UnknownScript_0x190460:
	end

UnknownScript_0x190461:
	end

UnknownScript_0x190462:
	end

FriedaCallback:
	checkcode VAR_WEEKDAY
	if_equal FRIDAY, .FriedaAppears
	disappear $e
	return

.FriedaAppears
	appear $e
	return

CooltrainerMScript_0x19046f:
	faceplayer
UnknownScript_0x190470:
	loadfont
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue UnknownScript_0x1904a5
	checkflag $001b
	iffalse UnknownScript_0x19049f
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue UnknownScript_0x19048f
	writetext UnknownText_0x1907ab
	closetext
	loadmovesprites
	end

UnknownScript_0x190489:
	writetext UnknownText_0x190820
	closetext
	loadmovesprites
	end

UnknownScript_0x19048f:
	writetext UnknownText_0x190925
	keeptextopen
	verbosegiveitem MIRACLE_SEED, 1
	iffalse UnknownScript_0x1904a9
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	jump UnknownScript_0x1904a5

UnknownScript_0x19049f:
	writetext UnknownText_0x1908b0
	closetext
	loadmovesprites
	end

UnknownScript_0x1904a5:
	writetext UnknownText_0x190a15
	closetext
UnknownScript_0x1904a9:
	loadmovesprites
	end

UnknownScript_0x1904ab:
	spriteface $9, LEFT
	spriteface $0, RIGHT
	loadfont
	writetext UnknownText_0x190790
	closetext
	loadmovesprites
	follow $0, $9
	applymovement $0, MovementData_0x190789
	stopfollow
	spriteface $0, DOWN
	scall UnknownScript_0x190470
	applymovement $9, MovementData_0x19078c
	applymovement $9, MovementData_0x19078e
	end

FisherScript_0x1904ce:
	faceplayer
	loadfont
	checkevent EVENT_GOT_TM05_ROAR
	iftrue UnknownScript_0x1904e3
	writetext UnknownText_0x191133
	keeptextopen
	verbosegiveitem TM_ROAR, 1
	iffalse UnknownScript_0x1904e7
	setevent EVENT_GOT_TM05_ROAR
UnknownScript_0x1904e3:
	writetext UnknownText_0x19118c
	closetext
UnknownScript_0x1904e7:
	loadmovesprites
	end

UnknownScript_0x1904e9:
	spriteface $b, DOWN
	spriteface $0, UP
	jump UnknownScript_0x1904f3

FisherScript_0x1904f2:
	faceplayer
UnknownScript_0x1904f3:
	dotrigger $2
	loadfont
	writetext UnknownText_0x190a59
	yesorno
	iffalse UnknownScript_0x190503
	writetext UnknownText_0x190acf
	closetext
	loadmovesprites
	end

UnknownScript_0x190503:
	writetext UnknownText_0x190afc
	closetext
	loadmovesprites
	end

TrainerCamperRoland:
	; bit/flag number
	dw $41a

	; trainer group && trainer id
	db CAMPER, ROLAND

	; text when seen
	dw CamperRolandSeenText

	; text when trainer beaten
	dw CamperRolandBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw CamperRolandScript

CamperRolandScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x190faa
	closetext
	loadmovesprites
	end

TrainerFisherJustin:
	; bit/flag number
	dw $44e

	; trainer group && trainer id
	db FISHER, JUSTIN

	; text when seen
	dw FisherJustinSeenText

	; text when trainer beaten
	dw FisherJustinBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherJustinScript

FisherJustinScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x190b4e
	closetext
	loadmovesprites
	end

TrainerFisherRalph1:
	; bit/flag number
	dw $44f

	; trainer group && trainer id
	db FISHER, RALPH1

	; text when seen
	dw FisherRalph1SeenText

	; text when trainer beaten
	dw FisherRalph1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherRalph1Script

FisherRalph1Script:
	writecode VAR_CALLERID, $11
	talkaftercancel
	loadfont
	checkflag $006d
	iftrue UnknownScript_0x19057d
	checkflag $0052
	iftrue UnknownScript_0x1905f1
	checkcellnum $11
	iftrue UnknownScript_0x190603
	checkevent $0277
	iftrue UnknownScript_0x190566
	writetext UnknownText_0x190bf8
	keeptextopen
	setevent $0277
	scall UnknownScript_0x1905f7
	jump UnknownScript_0x190569

UnknownScript_0x190566:
	scall UnknownScript_0x1905fb
UnknownScript_0x190569:
	askforphonenumber $11
	if_equal $1, UnknownScript_0x19060b
	if_equal $2, UnknownScript_0x190607
	trainertotext FISHER, RALPH1, $0
	scall UnknownScript_0x1905ff
	jump UnknownScript_0x190603

UnknownScript_0x19057d:
	scall UnknownScript_0x19060f
	winlosstext FisherRalph1BeatenText, $0000
	copybytetovar wd9fb
	if_equal $4, UnknownScript_0x19059c
	if_equal $3, UnknownScript_0x1905a2
	if_equal $2, UnknownScript_0x1905a8
	if_equal $1, UnknownScript_0x1905ae
	if_equal $0, UnknownScript_0x1905b4
UnknownScript_0x19059c:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue UnknownScript_0x1905e8
UnknownScript_0x1905a2:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1905db
UnknownScript_0x1905a8:
	checkflag $004a
	iftrue UnknownScript_0x1905ce
UnknownScript_0x1905ae:
	checkflag $0048
	iftrue UnknownScript_0x1905c1
UnknownScript_0x1905b4:
	loadtrainer FISHER, RALPH1
	startbattle
	returnafterbattle
	loadvar wd9fb, $1
	clearflag $006d
	end

UnknownScript_0x1905c1:
	loadtrainer FISHER, RALPH2
	startbattle
	returnafterbattle
	loadvar wd9fb, $2
	clearflag $006d
	end

UnknownScript_0x1905ce:
	loadtrainer FISHER, RALPH3
	startbattle
	returnafterbattle
	loadvar wd9fb, $3
	clearflag $006d
	end

UnknownScript_0x1905db:
	loadtrainer FISHER, RALPH4
	startbattle
	returnafterbattle
	loadvar wd9fb, $4
	clearflag $006d
	end

UnknownScript_0x1905e8:
	loadtrainer FISHER, RALPH5
	startbattle
	returnafterbattle
	clearflag $006d
	end

UnknownScript_0x1905f1:
	writetext UnknownText_0x190c37
	closetext
	loadmovesprites
	end

UnknownScript_0x1905f7:
	jumpstd asknumber1m
	end

UnknownScript_0x1905fb:
	jumpstd asknumber2m
	end

UnknownScript_0x1905ff:
	jumpstd registerednumberm
	end

UnknownScript_0x190603:
	jumpstd numberacceptedm
	end

UnknownScript_0x190607:
	jumpstd numberdeclinedm
	end

UnknownScript_0x19060b:
	jumpstd phonefullm
	end

UnknownScript_0x19060f:
	jumpstd rematchm
	end

TrainerFisherHenry:
	; bit/flag number
	dw $452

	; trainer group && trainer id
	db FISHER, HENRY

	; text when seen
	dw FisherHenrySeenText

	; text when trainer beaten
	dw FisherHenryBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw FisherHenryScript

FisherHenryScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x190df2
	closetext
	loadmovesprites
	end

TrainerPicnickerLiz1:
	; bit/flag number
	dw $47e

	; trainer group && trainer id
	db PICNICKER, LIZ1

	; text when seen
	dw PicnickerLiz1SeenText

	; text when trainer beaten
	dw PicnickerLiz1BeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw PicnickerLiz1Script

PicnickerLiz1Script:
	writecode VAR_CALLERID, $12
	talkaftercancel
	loadfont
	checkflag $006e
	iftrue UnknownScript_0x19066d
	checkcellnum $12
	iftrue UnknownScript_0x1906ed
	checkevent $0279
	iftrue UnknownScript_0x190656
	writetext UnknownText_0x191060
	keeptextopen
	setevent $0279
	scall UnknownScript_0x1906e1
	jump UnknownScript_0x190659

UnknownScript_0x190656:
	scall UnknownScript_0x1906e5
UnknownScript_0x190659:
	askforphonenumber $12
	if_equal $1, UnknownScript_0x1906f5
	if_equal $2, UnknownScript_0x1906f1
	trainertotext PICNICKER, LIZ1, $0
	scall UnknownScript_0x1906e9
	jump UnknownScript_0x1906ed

UnknownScript_0x19066d:
	scall UnknownScript_0x1906f9
	winlosstext PicnickerLiz1BeatenText, $0000
	copybytetovar wd9fc
	if_equal $4, UnknownScript_0x19068c
	if_equal $3, UnknownScript_0x190692
	if_equal $2, UnknownScript_0x190698
	if_equal $1, UnknownScript_0x19069e
	if_equal $0, UnknownScript_0x1906a4
UnknownScript_0x19068c:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue UnknownScript_0x1906d8
UnknownScript_0x190692:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue UnknownScript_0x1906cb
UnknownScript_0x190698:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue UnknownScript_0x1906be
UnknownScript_0x19069e:
	checkflag $0048
	iftrue UnknownScript_0x1906b1
UnknownScript_0x1906a4:
	loadtrainer PICNICKER, LIZ1
	startbattle
	returnafterbattle
	loadvar wd9fc, $1
	clearflag $006e
	end

UnknownScript_0x1906b1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	returnafterbattle
	loadvar wd9fc, $2
	clearflag $006e
	end

UnknownScript_0x1906be:
	loadtrainer PICNICKER, LIZ3
	startbattle
	returnafterbattle
	loadvar wd9fc, $3
	clearflag $006e
	end

UnknownScript_0x1906cb:
	loadtrainer PICNICKER, LIZ4
	startbattle
	returnafterbattle
	loadvar wd9fc, $4
	clearflag $006e
	end

UnknownScript_0x1906d8:
	loadtrainer PICNICKER, LIZ5
	startbattle
	returnafterbattle
	clearflag $006e
	end

UnknownScript_0x1906e1:
	jumpstd asknumber1f
	end

UnknownScript_0x1906e5:
	jumpstd asknumber2f
	end

UnknownScript_0x1906e9:
	jumpstd registerednumberf
	end

UnknownScript_0x1906ed:
	jumpstd numberacceptedf
	end

UnknownScript_0x1906f1:
	jumpstd numberdeclinedf
	end

UnknownScript_0x1906f5:
	jumpstd phonefullf
	end

UnknownScript_0x1906f9:
	jumpstd rematchf
	end

TrainerYoungsterAlbert:
	; bit/flag number
	dw $5ab

	; trainer group && trainer id
	db YOUNGSTER, ALBERT

	; text when seen
	dw YoungsterAlbertSeenText

	; text when trainer beaten
	dw YoungsterAlbertBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterAlbertScript

YoungsterAlbertScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x190e82
	closetext
	loadmovesprites
	end

TrainerYoungsterGordon:
	; bit/flag number
	dw $5ac

	; trainer group && trainer id
	db YOUNGSTER, GORDON

	; text when seen
	dw YoungsterGordonSeenText

	; text when trainer beaten
	dw YoungsterGordonBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw YoungsterGordonScript

YoungsterGordonScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x190f49
	closetext
	loadmovesprites
	end

TrainerBird_keeperPeter:
	; bit/flag number
	dw $407

	; trainer group && trainer id
	db BIRD_KEEPER, PETER

	; text when seen
	dw Bird_keeperPeterSeenText

	; text when trainer beaten
	dw Bird_keeperPeterBeatenText

	; script when lost
	dw $0000

	; script when talk again
	dw Bird_keeperPeterScript

Bird_keeperPeterScript:
	talkaftercancel
	loadfont
	writetext UnknownText_0x1910d4
	closetext
	loadmovesprites
	end

FriedaScript:
	faceplayer
	loadfont
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue FriedaFridayScript
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, FriedaNotFridayScript
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	keeptextopen
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda
	writetext FriedaGivesGiftText
	keeptextopen
	verbosegiveitem POISON_BARB, 1
	iffalse FriedaDoneScript
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	closetext
	loadmovesprites
	end

FriedaFridayScript:
	writetext FriedaFridayText
	closetext
FriedaDoneScript:
	loadmovesprites
	end

FriedaNotFridayScript:
	writetext FriedaNotFridayText
	closetext
	loadmovesprites
	end

ItemFragment_0x190773:
	db GREAT_BALL, 1

ItemFragment_0x190775:
	db REPEL, 1

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokeCenterSign:
	jumpstd pokecentersign

MapRoute32SignpostItem4:
	dw $00a5
	db GREAT_BALL
	

MapRoute32SignpostItem5:
	dw $00a6
	db SUPER_POTION
	

MovementData_0x190789:
	step_up
	step_up
	step_end

MovementData_0x19078c:
	step_down
	step_end

MovementData_0x19078e:
	step_right
	step_end

UnknownText_0x190790:
	text "Wait up!"
	line "What's the hurry?"
	done

UnknownText_0x1907ab:
	text "<PLAYER>, right?"
	line "Some guy wearing"

	para "glasses was look-"
	line "ing for you."

	para "See for yourself."
	line "He's waiting for"

	para "you at the #MON"
	line "CENTER."
	done

; might not be referenced anywhere
UnknownText_0x190820:
	text "Have you gone to"
	line "SPROUT TOWER?"

	para "If you ever visit"
	line "VIOLET CITY, "

	para "they'll expect you"
	line "to train there."

	para "That's basic for"
	line "trainers. Go to"
	cont "SPROUT TOWER!"
	done

UnknownText_0x1908b0:
	text "Have you gone to"
	line "the #MON GYM?"

	para "You can test your"
	line "#MON and your-"
	cont "self there."

	para "It's a rite of"
	line "passage for all"
	cont "trainers!"
	done

UnknownText_0x190925:
	text "You have some good"
	line "#MON there."

	para "It must be from"
	line "the training you"

	para "gave them around"
	line "VIOLET CITY."

	para "The training at"
	line "the GYM must have"

	para "been especially"
	line "helpful."

	para "As a souvenir of"
	line "VIOLET CITY, take"
	cont "this."

	para "It increases the"
	line "power of grass-"
	cont "type moves."
	done

UnknownText_0x190a15:
	text "Your experiences"
	line "in VIOLET CITY"

	para "should be useful"
	line "for your journey."
	done

UnknownText_0x190a59:
	text "How would you like"
	line "to have this"

	para "tasty, nutritious"
	line "SLOWPOKETAIL?"

	para "For you right now,"
	line "just ¥1,000,000!"

	para "You'll want this!"
	done

UnknownText_0x190acf:
	text "Tch! I thought"
	line "kids these days"
	cont "were loaded…"
	done

UnknownText_0x190afc:
	text "You don't want it?"
	line "Then scram. Shoo!"
	done

FisherJustinSeenText:
	text "Whoa!"

	para "You made me lose"
	line "that fish!"
	done

FisherJustinBeatenText:
	text "Sploosh!"
	done

UnknownText_0x190b4e:
	text "Calm, collected…"
	line "The essence of"

	para "fishing and #-"
	line "MON is the same."
	done

FisherRalph1SeenText:
	text "I'm really good at"
	line "both fishing and"
	cont "#MON."

	para "I'm not about to"
	line "lose to any kid!"
	done

FisherRalph1BeatenText:
	text "Tch! I tried to"
	line "rush things…"
	done

UnknownText_0x190bf8:
	text "Fishing is a life-"
	line "long passion."

	para "#MON are life-"
	line "long friends!"
	done

UnknownText_0x190c37:
	text "One, two, three…"
	line "Muahahaha, what a"

	para "great haul!"
	line "I'm done! Go ahead"

	para "and catch as many"
	line "as you can, kid!"
	done

; --- start a segment of possibly unused texts

UnknownText_0x190c9c:
	text "I keep catching"
	line "the same #MON…"

	para "Maybe a battle"
	line "will turn things"
	cont "around for me."
	done

UnknownText_0x190ceb:
	text "Nothing ever goes"
	line "right for me now…"
	done

UnknownText_0x190d10:
	text "How come the guy"
	line "next to me catches"
	cont "good #MON?"
	done

UnknownText_0x190d40:
	text "Heh, I'm on a roll"
	line "today. How about a"
	cont "battle, kid?"
	done

UnknownText_0x190d73:
	text "Oof. I wasn't"
	line "lucky that time."
	done

UnknownText_0x190d92:
	text "You have to have a"
	line "good ROD if you"

	para "want to catch good"
	line "#MON."
	done

; --- end a segment of possibly unused texts

FisherHenrySeenText:
	text "My #MON?"
	line "Freshly caught!"
	done

FisherHenryBeatenText:
	text "SPLASH?"
	done

UnknownText_0x190df2:
	text "Freshly caught"
	line "#MON are no"

	para "match for properly"
	line "raised ones."
	done

YoungsterAlbertSeenText:
	text "I haven't seen you"
	line "around before."

	para "So you think you"
	line "are pretty tough?"
	done

YoungsterAlbertBeatenText:
	text "You're strong!"
	done

UnknownText_0x190e82:
	text "I'm going to try"
	line "to be the best"
	cont "with my favorites."

	para "I'm not using the"
	line "same tough #MON"
	cont "as everyone else."
	done

YoungsterGordonSeenText:
	text "I found some good"
	line "#MON in the"
	cont "grass!"

	para "I think they'll do"
	line "it for me!"
	done

YoungsterGordonBeatenText:
	text "Darn. I thought I"
	line "could win."
	done

UnknownText_0x190f49:
	text "The grass is full"
	line "of clingy things."
	done

CamperRolandSeenText:
	text "That glance…"
	line "It's intriguing."
	done

CamperRolandBeatenText:
	text "Hmmm. This is"
	line "disappointing."
	done

UnknownText_0x190faa:
	text "If you don't want"
	line "to battle, just"
	cont "avoid eye contact."
	done

PicnickerLiz1SeenText:
	text "Uh-huh. Yeah, and"
	line "you know…"

	para "Pardon? Battle?"
	line "I'm on the phone."

	para "Oh, all right. But"
	line "make it fast."
	done

PicnickerLiz1BeatenText:
	text "Oh! I've got to"
	line "relieve my anger!"
	done

UnknownText_0x191060:
	text "I was having a"
	line "nice chat too."
	done

Bird_keeperPeterSeenText:
	text "That BADGE! It's"
	line "from VIOLET CITY!"

	para "You beat FALKNER?"
	done

Bird_keeperPeterBeatenText:
	text "I know what my"
	line "weaknesses are."
	done

UnknownText_0x1910d4:
	text "I should train"
	line "again at the GYM"
	cont "in VIOLET CITY."
	done

; possibly unused
UnknownText_0x191105:
	text "The fishermen"
	line "yelled at me for"
	cont "bugging them…"
	done

UnknownText_0x191133:
	text "WROOOOAR!"
	line "PEOPLE RUN WHEN I"

	para "ROAR! BUT YOU"
	line "CAME LOOKING!"

	para "THAT PLEASES ME!"
	line "NOW TAKE THIS!"
	done

UnknownText_0x19118c:
	text "WROOOAR!"
	line "IT'S ROAR!"

	para "EVEN #MON RUN"
	line "FROM A GOOD ROAR!"
	done

MeetFriedaText:
	text "FRIEDA: Yahoo!"
	line "It's Friday!"

	para "I'm FRIEDA of"
	line "Friday!"

	para "Nice to meet you!"
	done

FriedaGivesGiftText:
	text "Here's a POISON"
	line "BARB for you!"
	done

FriedaGaveGiftText:
	text "FRIEDA: Give it to"
	line "a #MON that has"
	cont "poison-type moves."

	para "Oh!"

	para "It's wicked!"

	para "You'll be shocked"
	line "how good it makes"
	cont "poison moves!"
	done

FriedaFridayText:
	text "FRIEDA: Hiya! What"
	line "day do you like?"

	para "I love Friday. No"
	line "doubt about it!"

	para "Don't you think"
	line "it's great too?"
	done

FriedaNotFridayText:
	text "FRIEDA: Isn't it"
	line "Friday today?"

	para "It's so boring"
	line "when it's not!"
	done

Route32SignText:
	text "ROUTE 32"

	para "VIOLET CITY -"
	line "AZALEA TOWN"
	done

Route32RuinsSignText:
	text "RUINS OF ALPH"
	line "EAST ENTRANCE"
	done

Route32UnionCaveSignText:
	text "UNION CAVE"
	line "AHEAD"
	done

Route32_MapEventHeader:
	; filler
	db 0, 0

	; warps
	db 4
	warp_def $49, $b, 1, GROUP_ROUTE_32_POKECENTER_1F, MAP_ROUTE_32_POKECENTER_1F
	warp_def $2, $4, 3, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $3, $4, 4, GROUP_ROUTE_32_RUINS_OF_ALPH_GATE, MAP_ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $4f, $6, 4, GROUP_UNION_CAVE_1F, MAP_UNION_CAVE_1F

	; xy triggers
	db 2
	xy_trigger 0, $8, $12, $0, UnknownScript_0x1904ab, $0, $0
	xy_trigger 1, $47, $7, $0, UnknownScript_0x1904e9, $0, $0

	; signposts
	db 6
	signpost 5, 13, $0, Route32Sign
	signpost 1, 9, $0, Route32RuinsSign
	signpost 84, 10, $0, Route32UnionCaveSign
	signpost 73, 12, $0, Route32PokeCenterSign
	signpost 67, 12, $7, MapRoute32SignpostItem4
	signpost 40, 11, $7, MapRoute32SignpostItem5

	; people-events
	db 14
	person_event SPRITE_FISHER, 53, 12, $6, $0, 255, 255, $a2, 1, TrainerFisherJustin, $ffff
	person_event SPRITE_FISHER, 60, 16, $7, $0, 255, 255, $a2, 3, TrainerFisherRalph1, $ffff
	person_event SPRITE_FISHER, 52, 10, $8, $0, 255, 255, $a2, 1, TrainerFisherHenry, $ffff
	person_event SPRITE_YOUNGSTER, 26, 16, $9, $0, 255, 255, $92, 3, TrainerYoungsterAlbert, $ffff
	person_event SPRITE_YOUNGSTER, 67, 8, $a, $0, 255, 255, $92, 3, TrainerYoungsterGordon, $ffff
	person_event SPRITE_YOUNGSTER, 49, 7, $7, $0, 255, 255, $a2, 3, TrainerCamperRoland, $ffff
	person_event SPRITE_LASS, 34, 14, $8, $0, 255, 255, $a2, 1, TrainerPicnickerLiz1, $ffff
	person_event SPRITE_COOLTRAINER_M, 12, 23, $8, $0, 255, 255, $0, 0, CooltrainerMScript_0x19046f, $ffff
	person_event SPRITE_YOUNGSTER, 86, 15, $7, $0, 255, 255, $92, 3, TrainerBird_keeperPeter, $ffff
	person_event SPRITE_FISHER, 74, 11, $6, $0, 255, 255, $0, 0, FisherScript_0x1904f2, $06fc
	person_event SPRITE_POKE_BALL, 57, 10, $1, $0, 255, 255, $1, 0, ItemFragment_0x190773, $06b0
	person_event SPRITE_FISHER, 17, 19, $9, $0, 255, 255, $0, 0, FisherScript_0x1904ce, $ffff
	person_event SPRITE_LASS, 71, 16, $8, $0, 255, 255, $0, 0, FriedaScript, $0758
	person_event SPRITE_POKE_BALL, 34, 7, $1, $0, 255, 255, $1, 0, ItemFragment_0x190775, $06b1
