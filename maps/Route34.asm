	object_const_def
	const ROUTE34_YOUNGSTER1
	const ROUTE34_YOUNGSTER2
	const ROUTE34_YOUNGSTER3
	const ROUTE34_LASS
	const ROUTE34_OFFICER
	const ROUTE34_POKEFAN_M
	const ROUTE34_GRAMPS
	const ROUTE34_DAY_CARE_MON_1
	const ROUTE34_DAY_CARE_MON_2
	const ROUTE34_COOLTRAINER_F1
	const ROUTE34_COOLTRAINER_F2
	const ROUTE34_COOLTRAINER_F3
	const ROUTE34_POKE_BALL

Route34_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route34EggCheckCallback

Route34EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	sjump .CheckMon1

.CheckMon1:
	checkflag ENGINE_DAY_CARE_MAN_HAS_MON
	iffalse .HideMon1
	clearevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.HideMon1:
	setevent EVENT_DAY_CARE_MON_1
	sjump .CheckMon2

.CheckMon2:
	checkflag ENGINE_DAY_CARE_LADY_HAS_MON
	iffalse .HideMon2
	clearevent EVENT_DAY_CARE_MON_2
	endcallback

.HideMon2:
	setevent EVENT_DAY_CARE_MON_2
	endcallback

DayCareManScript_Outside:
	faceplayer
	opentext
	special DayCareManOutside
	waitbutton
	closetext
	ifequal TRUE, .end_fail
	clearflag ENGINE_DAY_CARE_MAN_HAS_EGG
	readvar VAR_FACING
	ifequal RIGHT, .walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
.end_fail
	end

.walk_around_player
	applymovement ROUTE34_GRAMPS, Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer
	playsound SFX_ENTER_DOOR
	disappear ROUTE34_GRAMPS
	end

DayCareMon1Script:
	opentext
	special DayCareMon1
	closetext
	end

DayCareMon2Script:
	opentext
	special DayCareMon2
	closetext
	end

TrainerCamperTodd1:
	trainer CAMPER, TODD1, EVENT_BEAT_CAMPER_TODD, CamperTodd1SeenText, CamperTodd1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_CAMPER_TODD
	endifjustbattled
	opentext
	checkflag ENGINE_TODD_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_GOLDENROD_DEPT_STORE_SALE_IS_ON
	iftrue .SaleIsOn
	checkcellnum PHONE_CAMPER_TODD
	iftrue .NumberAccepted
	checkevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext CamperTodd1AfterText
	promptbutton
	setevent EVENT_TODD_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_CAMPER_TODD
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, CAMPER, TODD1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext CamperTodd1BeatenText, 0
	readmem wToddFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkflag ENGINE_FLYPOINT_BLACKTHORN
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_CIANWOOD
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer CAMPER, TODD1
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 1
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer CAMPER, TODD2
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 2
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer CAMPER, TODD3
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 3
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer CAMPER, TODD4
	startbattle
	reloadmapafterbattle
	loadmem wToddFightCount, 4
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer CAMPER, TODD5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_TODD_READY_FOR_REMATCH
	end

.SaleIsOn:
	writetext CamperToddSaleText
	waitbutton
	closetext
	end

.AskNumber:
	jumpstd AskNumber1MScript
	end

.AskNumber2:
	jumpstd AskNumber2MScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberMScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedMScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedMScript
	end

.PhoneFull:
	jumpstd PhoneFullMScript
	end

.RematchStd:
	jumpstd RematchMScript
	end

TrainerPicnickerGina1:
	trainer PICNICKER, GINA1, EVENT_BEAT_PICNICKER_GINA, PicnickerGina1SeenText, PicnickerGina1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_GINA
	endifjustbattled
	opentext
	checkflag ENGINE_GINA_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_GINA_HAS_LEAF_STONE
	iftrue .LeafStone
	checkcellnum PHONE_PICNICKER_GINA
	iftrue .NumberAccepted
	checkevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerGina1AfterText
	promptbutton
	setevent EVENT_GINA_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .FinishAsk

.AskAgain:
	scall .AskNumber2
.FinishAsk:
	askforphonenumber PHONE_PICNICKER_GINA
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, GINA1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerGina1BeatenText, 0
	readmem wGinaFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
.Fight4:
	checkevent EVENT_RESTORED_POWER_TO_KANTO
	iftrue .LoadFight4
.Fight3:
	checkevent EVENT_BEAT_ELITE_FOUR
	iftrue .LoadFight3
.Fight2:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_MAHOGANY
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer PICNICKER, GINA1
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 1
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, GINA2
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 2
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, GINA3
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 3
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, GINA4
	startbattle
	reloadmapafterbattle
	loadmem wGinaFightCount, 4
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, GINA5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_GINA_READY_FOR_REMATCH
	end

.LeafStone:
	scall .Gift
	verbosegiveitem LEAF_STONE
	iffalse .BagFull
	clearflag ENGINE_GINA_HAS_LEAF_STONE
	setevent EVENT_GINA_GAVE_LEAF_STONE
	sjump .NumberAccepted

.BagFull:
	sjump .PackFull

.AskNumber1:
	jumpstd AskNumber1FScript
	end

.AskNumber2:
	jumpstd AskNumber2FScript
	end

.RegisteredNumber:
	jumpstd RegisteredNumberFScript
	end

.NumberAccepted:
	jumpstd NumberAcceptedFScript
	end

.NumberDeclined:
	jumpstd NumberDeclinedFScript
	end

.PhoneFull:
	jumpstd PhoneFullFScript
	end

.RematchStd:
	jumpstd RematchFScript
	end

.Gift:
	jumpstd GiftFScript
	end

.PackFull:
	jumpstd PackFullFScript
	end

OfficerKeithScript:
	faceplayer
	opentext
	checktime NITE
	iffalse .NoFight
	checkevent EVENT_BEAT_OFFICER_KEITH
	iftrue .AfterScript
	playmusic MUSIC_OFFICER_ENCOUNTER
	writetext OfficerKeithSeenText
	waitbutton
	closetext
	winlosstext OfficerKeithWinText, 0
	loadtrainer OFFICER, KEITH
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_OFFICER_KEITH
	closetext
	end

.AfterScript:
	writetext OfficerKeithAfterText
	waitbutton
	closetext
	end

.NoFight:
	writetext OfficerKeithDaytimeText
	waitbutton
	closetext
	end

TrainerYoungsterSamuel:
	trainer YOUNGSTER, SAMUEL, EVENT_BEAT_YOUNGSTER_SAMUEL, YoungsterSamuelSeenText, YoungsterSamuelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterSamuelAfterText
	waitbutton
	closetext
	end

TrainerYoungsterIan:
	trainer YOUNGSTER, IAN, EVENT_BEAT_YOUNGSTER_IAN, YoungsterIanSeenText, YoungsterIanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterIanAfterText
	waitbutton
	closetext
	end

TrainerPokefanmBrandon:
	trainer POKEFANM, BRANDON, EVENT_BEAT_POKEFANM_BRANDON, PokefanmBrandonSeenText, PokefanmBrandonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmBrandonAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfIrene:
	trainer COOLTRAINERF, IRENE, EVENT_BEAT_COOLTRAINERF_IRENE, CooltrainerfIreneSeenText, CooltrainerfIreneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfIreneAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfIreneAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfJenn:
	trainer COOLTRAINERF, JENN, EVENT_BEAT_COOLTRAINERF_JENN, CooltrainerfJennSeenText, CooltrainerfJennBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfJennAfterText1
	waitbutton
	closetext
	end

.GotSoftSand:
	writetext CooltrainerfJennAfterText2
	waitbutton
	closetext
	end

TrainerCooltrainerfKate:
	trainer COOLTRAINERF, KATE, EVENT_BEAT_COOLTRAINERF_KATE, CooltrainerfKateSeenText, CooltrainerfKateBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	checkevent EVENT_GOT_SOFT_SAND_FROM_KATE
	iftrue .GotSoftSand
	writetext CooltrainerfKateOfferSoftSandText
	promptbutton
	verbosegiveitem SOFT_SAND
	iffalse .BagFull
	setevent EVENT_GOT_SOFT_SAND_FROM_KATE
.GotSoftSand:
	writetext CooltrainerfKateAfterText
	waitbutton
.BagFull:
	closetext
	end

Route34IlexForestSign: ; unreferenced
	jumptext Route34IlexForestSignText

Route34Sign:
	jumptext Route34SignText

Route34TrainerTips:
	jumptext Route34TrainerTipsText

DayCareSign:
	jumptext DayCareSignText

Route34Nugget:
	itemball NUGGET

Route34HiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_ROUTE_34_HIDDEN_RARE_CANDY

Route34HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_34_HIDDEN_SUPER_POTION

Route34MovementData_DayCareManWalksBackInside:
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	step_end

Route34MovementData_DayCareManWalksBackInside_WalkAroundPlayer:
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	slow_step UP
	slow_step UP
	step_end

YoungsterSamuelSeenText:
	text "This is where I do"
	line "my training!"
	done

YoungsterSamuelBeatenText:
	text "Beaten by a"
	line "passing stranger!"
	done

YoungsterSamuelMobileText: ; unreferenced
	text "Have you been to"
	line "GOLDENROD CITY?"

	para "Weren't you amazed"
	line "by how they've"

	para "changed the"
	line "#MON CENTER?"
	done

YoungsterSamuelAfterText:
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

YoungsterIanAfterText:
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

CamperTodd1AfterText:
	text "Maybe I should"
	line "take one to a DAY-"

	para "CARE. Or maybe use"
	line "some items…"
	done

CamperToddSaleText:
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

PicnickerGina1AfterText:
	text "You're too strong"
	line "to be a practice"
	cont "partner."
	done

OfficerKeithSeenText:
	text "Who goes there?"
	line "What are you up"
	cont "to?"
	done

OfficerKeithWinText:
	text "You're a tough"
	line "little kid."
	done

OfficerKeithAfterText:
	text "Yep, I see nothing"
	line "wrong today. You"

	para "be good and stay"
	line "out of trouble."
	done

OfficerKeithDaytimeText:
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

PokefanmBrandonAfterText:
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

CooltrainerfIreneAfterText1:
	text "IRENE: My sister"
	line "KATE will get you"
	cont "for this!"
	done

CooltrainerfIreneAfterText2:
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

CooltrainerfJennAfterText1:
	text "JENN: Don't get"
	line "cocky! My sister"
	cont "KATE is tough!"
	done

CooltrainerfJennAfterText2:
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

CooltrainerfKateOfferSoftSandText:
	text "KATE: You're too"
	line "strong. I didn't"
	cont "stand a chance."

	para "Here. You deserve"
	line "this."
	done

CooltrainerfKateAfterText:
	text "KATE: I'm sorry we"
	line "jumped you."

	para "We never expected"
	line "anyone to find us"

	para "here. You sure"
	line "startled us."
	done

Route34IlexForestSignText:
	text "ILEX FOREST"
	line "THROUGH THE GATE"
	done

Route34SignText:
	text "ROUTE 34"

	para "GOLDENROD CITY -"
	line "AZALEA TOWN"

	para "ILEX FOREST"
	line "SOMEWHERE BETWEEN"
	done

Route34TrainerTipsText:
	text "TRAINER TIPS"

	para "BERRY trees grow"
	line "new BERRIES"
	cont "every day."

	para "Make a note of"
	line "which trees bear"
	cont "which BERRIES."
	done

DayCareSignText:
	text "DAY-CARE"

	para "LET US RAISE YOUR"
	line "#MON FOR YOU!"
	done

Route34_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 13, 37, ROUTE_34_ILEX_FOREST_GATE, 1
	warp_event 14, 37, ROUTE_34_ILEX_FOREST_GATE, 2
	warp_event 11, 14, DAY_CARE, 1
	warp_event 11, 15, DAY_CARE, 2
	warp_event 13, 15, DAY_CARE, 3

	def_coord_events

	def_bg_events
	bg_event 12,  6, BGEVENT_READ, Route34Sign
	bg_event 13, 33, BGEVENT_READ, Route34TrainerTips
	bg_event 10, 13, BGEVENT_READ, DayCareSign
	bg_event  8, 32, BGEVENT_ITEM, Route34HiddenRareCandy
	bg_event 17, 19, BGEVENT_ITEM, Route34HiddenSuperPotion

	def_object_events
	object_event 13,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerCamperTodd1, -1
	object_event 15, 32, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterSamuel, -1
	object_event 11, 20, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterIan, -1
	object_event 10, 26, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerPicnickerGina1, -1
	object_event  9, 11, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, OfficerKeithScript, -1
	object_event 18, 28, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmBrandon, -1
	object_event 15, 16, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Outside, EVENT_DAY_CARE_MAN_ON_ROUTE_34
	object_event 14, 18, SPRITE_DAY_CARE_MON_1, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon1Script, EVENT_DAY_CARE_MON_1
	object_event 17, 19, SPRITE_DAY_CARE_MON_2, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMon2Script, EVENT_DAY_CARE_MON_2
	object_event 11, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerCooltrainerfIrene, -1
	object_event  3, 48, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfJenn, -1
	object_event  6, 51, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfKate, -1
	object_event  7, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route34Nugget, EVENT_ROUTE_34_NUGGET
