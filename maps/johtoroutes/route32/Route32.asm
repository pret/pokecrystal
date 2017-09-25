const_value set 2
	const ROUTE32_FISHER1
	const ROUTE32_FISHER2
	const ROUTE32_FISHER3
	const ROUTE32_YOUNGSTER1
	const ROUTE32_YOUNGSTER2
	const ROUTE32_YOUNGSTER3
	const ROUTE32_LASS1
	const ROUTE32_COOLTRAINER_M
	const ROUTE32_YOUNGSTER4
	const ROUTE32_FISHER4
	const ROUTE32_POKE_BALL1
	const ROUTE32_FISHER5
	const ROUTE32_FRIEDA
	const ROUTE32_POKE_BALL2

Route32_MapScriptHeader:
.MapTriggers:
	db 3

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1
	maptrigger .Trigger2

.MapCallbacks:
	db 1

	; callbacks

	dbw MAPCALLBACK_OBJECTS, .Frieda

.Trigger0:
	end

.Trigger1:
	end

.Trigger2:
	end

.Frieda:
	checkcode VAR_WEEKDAY
	if_equal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	return

.FriedaAppears:
	appear ROUTE32_FRIEDA
	return

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMTrigger:
	opentext
	checkevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	iftrue .GotMiracleSeed
	checkflag ENGINE_ZEPHYRBADGE
	iffalse .DontHaveZephyrBadge
	checkevent EVENT_GOT_TOGEPI_EGG_FROM_ELMS_AIDE
	iftrue .GiveMiracleSeed
	writetext Route32CooltrainerMText_AideIsWaiting
	waitbutton
	closetext
	end

.Unused:
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	buttonsound
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	jump .GotMiracleSeed

.DontHaveZephyrBadge:
	writetext Route32CooltrainerMText_VioletGym
	waitbutton
	closetext
	end

.GotMiracleSeed:
	writetext Route32CooltrainerMText_ExperiencesShouldBeUseful
	waitbutton
.BagFull:
	closetext
	end

Route32CooltrainerMStopsYou:
	spriteface ROUTE32_COOLTRAINER_M, LEFT
	spriteface PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	spriteface PLAYER, DOWN
	scall Route32CooltrainerMTrigger
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	buttonsound
	verbosegiveitem TM_ROAR
	iffalse .Finish
	setevent EVENT_GOT_TM05_ROAR
.AlreadyHaveRoar:
	writetext Text_RoarOutro
	waitbutton
.Finish:
	closetext
	end

Route32WannaBuyASlowpokeTailScript:
	spriteface ROUTE32_FISHER4, DOWN
	spriteface PLAYER, UP
	jump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	dotrigger $2
	opentext
	writetext Text_MillionDollarSlowpokeTail
	yesorno
	iffalse .refused
	writetext Text_ThoughtKidsWereLoaded
	waitbutton
	closetext
	end

.refused
	writetext Text_RefusedToBuySlowpokeTail
	waitbutton
	closetext
	end

TrainerCamperRoland:
	trainer EVENT_BEAT_CAMPER_ROLAND, CAMPER, ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer EVENT_BEAT_FISHER_JUSTIN, FISHER, JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer EVENT_BEAT_FISHER_RALPH, FISHER, RALPH1, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_FISHER_RALPH
	end_if_just_battled
	opentext
	checkflag ENGINE_RALPH
	iftrue .Rematch
	checkflag ENGINE_SPECIAL_WILDDATA
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	buttonsound
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext FISHER, RALPH1, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	copybytetovar wRalphFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadvar wRalphFightCount, 1
	clearflag ENGINE_RALPH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadvar wRalphFightCount, 2
	clearflag ENGINE_RALPH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadvar wRalphFightCount, 3
	clearflag ENGINE_RALPH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadvar wRalphFightCount, 4
	clearflag ENGINE_RALPH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
	jumpstd asknumber1m
	end

.AskNumber2:
	jumpstd asknumber2m
	end

.RegisteredNumber:
	jumpstd registerednumberm
	end

.NumberAccepted:
	jumpstd numberacceptedm
	end

.NumberDeclined:
	jumpstd numberdeclinedm
	end

.PhoneFull:
	jumpstd phonefullm
	end

.RematchStd:
	jumpstd rematchm
	end

TrainerFisherHenry:
	trainer EVENT_BEAT_FISHER_HENRY, FISHER, HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer EVENT_BEAT_PICNICKER_LIZ, PICNICKER, LIZ1, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	writecode VAR_CALLERID, PHONE_PICNICKER_LIZ
	end_if_just_battled
	opentext
	checkflag ENGINE_LIZ
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	buttonsound
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	jump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	if_equal $1, .PhoneFull
	if_equal $2, .NumberDeclined
	trainertotext PICNICKER, LIZ1, $0
	scall .RegisteredNumber
	jump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	copybytetovar wLizFightCount
	if_equal 4, .Fight4
	if_equal 3, .Fight3
	if_equal 2, .Fight2
	if_equal 1, .Fight1
	if_equal 0, .LoadFight0
.Fight4:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, LIZ1
	startbattle
	reloadmapafterbattle
	loadvar wLizFightCount, 1
	clearflag ENGINE_LIZ
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadvar wLizFightCount, 2
	clearflag ENGINE_LIZ
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadvar wLizFightCount, 3
	clearflag ENGINE_LIZ
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadvar wLizFightCount, 4
	clearflag ENGINE_LIZ
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ
	end

.AskNumber1:
	jumpstd asknumber1f
	end

.AskNumber2:
	jumpstd asknumber2f
	end

.RegisteredNumber:
	jumpstd registerednumberf
	end

.NumberAccepted:
	jumpstd numberacceptedf
	end

.NumberDeclined:
	jumpstd numberdeclinedf
	end

.PhoneFull:
	jumpstd phonefullf
	end

.RematchStd:
	jumpstd rematchf
	end

TrainerYoungsterAlbert:
	trainer EVENT_BEAT_YOUNGSTER_ALBERT, YOUNGSTER, ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer EVENT_BEAT_YOUNGSTER_GORDON, YOUNGSTER, GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBird_keeperPeter:
	trainer EVENT_BEAT_BIRD_KEEPER_PETER, BIRD_KEEPER, PETER, Bird_keeperPeterSeenText, Bird_keeperPeterBeatenText, 0, .Script

.Script:
	end_if_just_battled
	opentext
	writetext Bird_keeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	checkcode VAR_WEEKDAY
	if_not_equal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	buttonsound
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	buttonsound
	verbosegiveitem POISON_BARB
	iffalse .Done
	setevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	writetext FriedaGaveGiftText
	waitbutton
	closetext
	end

.Friday:
	writetext FriedaFridayText
	waitbutton
.Done:
	closetext
	end

.NotFriday:
	writetext FriedaNotFridayText
	waitbutton
	closetext
	end

Route32GreatBall:
	itemball GREAT_BALL

Route32Repel:
	itemball REPEL

Route32Sign:
	jumptext Route32SignText

Route32RuinsSign:
	jumptext Route32RuinsSignText

Route32UnionCaveSign:
	jumptext Route32UnionCaveSignText

Route32PokeCenterSign:
	jumpstd pokecentersign

Route32HiddenGreatBall:
	dwb EVENT_ROUTE_32_HIDDEN_GREAT_BALL, GREAT_BALL


Route32HiddenSuperPotion:
	dwb EVENT_ROUTE_32_HIDDEN_SUPER_POTION, SUPER_POTION


Movement_Route32CooltrainerMPushesYouBackToViolet:
	step UP
	step UP
	step_end

Movement_Route32CooltrainerMReset1:
	step DOWN
	step_end

Movement_Route32CooltrainerMReset2:
	step RIGHT
	step_end

Route32CooltrainerMText_WhatsTheHurry:
	text "Wait up!"
	line "What's the hurry?"
	done

Route32CooltrainerMText_AideIsWaiting:
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
Route32CooltrainerMText_UnusedSproutTower:
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

Route32CooltrainerMText_VioletGym:
	text "Have you gone to"
	line "the #MON GYM?"

	para "You can test your"
	line "#MON and your-"
	cont "self there."

	para "It's a rite of"
	line "passage for all"
	cont "trainers!"
	done

Route32CooltrainerMText_HaveThisSeed:
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

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Your experiences"
	line "in VIOLET CITY"

	para "should be useful"
	line "for your journey."
	done

Text_MillionDollarSlowpokeTail:
	text "How would you like"
	line "to have this"

	para "tasty, nutritious"
	line "SLOWPOKETAIL?"

	para "For you right now,"
	line "just ¥1,000,000!"

	para "You'll want this!"
	done

Text_ThoughtKidsWereLoaded:
	text "Tch! I thought"
	line "kids these days"
	cont "were loaded…"
	done

Text_RefusedToBuySlowpokeTail:
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

FisherJustinAfterText:
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

FisherRalphAfterText:
	text "Fishing is a life-"
	line "long passion."

	para "#MON are life-"
	line "long friends!"
	done

FisherRalphSwarmText:
	text "One, two, three…"
	line "Muahahaha, what a"

	para "great haul!"
	line "I'm done! Go ahead"

	para "and catch as many"
	line "as you can, kid!"
	done

; --- start a segment of possibly unused texts

Route32UnusedFisher1SeenText:
	text "I keep catching"
	line "the same #MON…"

	para "Maybe a battle"
	line "will turn things"
	cont "around for me."
	done

Route32UnusedFisher1BeatenText:
	text "Nothing ever goes"
	line "right for me now…"
	done

Route32UnusedFisher1AfterText:
	text "How come the guy"
	line "next to me catches"
	cont "good #MON?"
	done

Route32UnusedFisher2SeenText:
	text "Heh, I'm on a roll"
	line "today. How about a"
	cont "battle, kid?"
	done

Route32UnusedFisher2BeatenText:
	text "Oof. I wasn't"
	line "lucky that time."
	done

Route32UnusedFisher2AfterText:
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

FisherHenryAfterText:
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

YoungsterAlbertAfterText:
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

YoungsterGordonAfterText:
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

CamperRolandAfterText:
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

PicnickerLiz1AfterText:
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

Bird_keeperPeterAfterText:
	text "I should train"
	line "again at the GYM"
	cont "in VIOLET CITY."
	done

; possibly unused
Route32UnusedText:
	text "The fishermen"
	line "yelled at me for"
	cont "bugging them…"
	done

Text_RoarIntro:
	text "WROOOOAR!"
	line "PEOPLE RUN WHEN I"

	para "ROAR! BUT YOU"
	line "CAME LOOKING!"

	para "THAT PLEASES ME!"
	line "NOW TAKE THIS!"
	done

Text_RoarOutro:
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

.Warps:
	db 4
	warp_def $49, $b, 1, ROUTE_32_POKECENTER_1F
	warp_def $2, $4, 3, ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $3, $4, 4, ROUTE_32_RUINS_OF_ALPH_GATE
	warp_def $4f, $6, 4, UNION_CAVE_1F

.XYTriggers:
	db 2
	xy_trigger 0, $8, $12, $0, Route32CooltrainerMStopsYou, $0, $0
	xy_trigger 1, $47, $7, $0, Route32WannaBuyASlowpokeTailScript, $0, $0

.Signposts:
	db 6
	signpost  5, 13, SIGNPOST_READ, Route32Sign
	signpost  1,  9, SIGNPOST_READ, Route32RuinsSign
	signpost 84, 10, SIGNPOST_READ, Route32UnionCaveSign
	signpost 73, 12, SIGNPOST_READ, Route32PokeCenterSign
	signpost 67, 12, SIGNPOST_ITEM, Route32HiddenGreatBall
	signpost 40, 11, SIGNPOST_ITEM, Route32HiddenSuperPotion

.PersonEvents:
	db 14
	person_event SPRITE_FISHER, 49, 8, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherJustin, -1
	person_event SPRITE_FISHER, 56, 12, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	person_event SPRITE_FISHER, 48, 6, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerFisherHenry, -1
	person_event SPRITE_YOUNGSTER, 22, 12, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	person_event SPRITE_YOUNGSTER, 63, 4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	person_event SPRITE_YOUNGSTER, 45, 3, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 3, TrainerCamperRoland, -1
	person_event SPRITE_LASS, 30, 10, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, (1 << 3) | PAL_OW_GREEN, PERSONTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	person_event SPRITE_COOLTRAINER_M, 8, 19, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	person_event SPRITE_YOUNGSTER, 82, 11, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_TRAINER, 3, TrainerBird_keeperPeter, -1
	person_event SPRITE_FISHER, 70, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	person_event SPRITE_POKE_BALL, 53, 6, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	person_event SPRITE_FISHER, 13, 15, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	person_event SPRITE_LASS, 67, 12, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	person_event SPRITE_POKE_BALL, 30, 3, SPRITEMOVEDATA_ITEM_TREE, 0, 0, -1, -1, 0, PERSONTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
