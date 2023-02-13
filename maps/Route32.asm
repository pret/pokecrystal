	object_const_def
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

Route32_MapScripts:
	def_scene_scripts
	scene_script Route32Noop1Scene, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS
	scene_script Route32Noop2Scene, SCENE_ROUTE32_OFFER_SLOWPOKETAIL
	scene_script Route32Noop3Scene, SCENE_ROUTE32_NOOP

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route32FriedaCallback

Route32Noop1Scene:
	end

Route32Noop2Scene:
	end

Route32Noop3Scene:
	end

Route32FriedaCallback:
	readvar VAR_WEEKDAY
	ifequal FRIDAY, .FriedaAppears
	disappear ROUTE32_FRIEDA
	endcallback

.FriedaAppears:
	appear ROUTE32_FRIEDA
	endcallback

Route32CooltrainerMScript:
	faceplayer
Route32CooltrainerMContinueScene:
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

.GoToSproutTower: ; unreferenced
	writetext Route32CooltrainerMText_UnusedSproutTower
	waitbutton
	closetext
	end

.GiveMiracleSeed:
	writetext Route32CooltrainerMText_HaveThisSeed
	promptbutton
	verbosegiveitem MIRACLE_SEED
	iffalse .BagFull
	setevent EVENT_GOT_MIRACLE_SEED_IN_ROUTE_32
	sjump .GotMiracleSeed

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

Route32CooltrainerMStopsYouScene:
	turnobject ROUTE32_COOLTRAINER_M, LEFT
	turnobject PLAYER, RIGHT
	opentext
	writetext Route32CooltrainerMText_WhatsTheHurry
	waitbutton
	closetext
	follow PLAYER, ROUTE32_COOLTRAINER_M
	applymovement PLAYER, Movement_Route32CooltrainerMPushesYouBackToViolet
	stopfollow
	turnobject PLAYER, DOWN
	scall Route32CooltrainerMContinueScene
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset1
	applymovement ROUTE32_COOLTRAINER_M, Movement_Route32CooltrainerMReset2
	end

Route32RoarTMGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM05_ROAR
	iftrue .AlreadyHaveRoar
	writetext Text_RoarIntro
	promptbutton
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
	turnobject ROUTE32_FISHER4, DOWN
	turnobject PLAYER, UP
	sjump _OfferToSellSlowpokeTail

SlowpokeTailSalesmanScript:
	faceplayer
_OfferToSellSlowpokeTail:
	setscene SCENE_ROUTE32_NOOP
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
	trainer CAMPER, ROLAND, EVENT_BEAT_CAMPER_ROLAND, CamperRolandSeenText, CamperRolandBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CamperRolandAfterText
	waitbutton
	closetext
	end

TrainerFisherJustin:
	trainer FISHER, JUSTIN, EVENT_BEAT_FISHER_JUSTIN, FisherJustinSeenText, FisherJustinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherJustinAfterText
	waitbutton
	closetext
	end

TrainerFisherRalph1:
	trainer FISHER, RALPH1, EVENT_BEAT_FISHER_RALPH, FisherRalph1SeenText, FisherRalph1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_FISHER_RALPH
	endifjustbattled
	opentext
	checkflag ENGINE_RALPH_READY_FOR_REMATCH
	iftrue .Rematch
	checkflag ENGINE_QWILFISH_SWARM
	iftrue .Swarm
	checkcellnum PHONE_FISHER_RALPH
	iftrue .NumberAccepted
	checkevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext FisherRalphAfterText
	promptbutton
	setevent EVENT_RALPH_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_FISHER_RALPH
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, FISHER, RALPH1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext FisherRalph1BeatenText, 0
	readmem wRalphFightCount
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
	checkflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	iftrue .LoadFight2
.Fight1:
	checkflag ENGINE_FLYPOINT_ECRUTEAK
	iftrue .LoadFight1
.LoadFight0:
	loadtrainer FISHER, RALPH1
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 1
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer FISHER, RALPH2
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 2
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer FISHER, RALPH3
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 3
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer FISHER, RALPH4
	startbattle
	reloadmapafterbattle
	loadmem wRalphFightCount, 4
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer FISHER, RALPH5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_RALPH_READY_FOR_REMATCH
	end

.Swarm:
	writetext FisherRalphSwarmText
	waitbutton
	closetext
	end

.AskNumber1:
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

TrainerFisherHenry:
	trainer FISHER, HENRY, EVENT_BEAT_FISHER_HENRY, FisherHenrySeenText, FisherHenryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherHenryAfterText
	waitbutton
	closetext
	end

TrainerPicnickerLiz1:
	trainer PICNICKER, LIZ1, EVENT_BEAT_PICNICKER_LIZ, PicnickerLiz1SeenText, PicnickerLiz1BeatenText, 0, .Script

.Script:
	loadvar VAR_CALLERID, PHONE_PICNICKER_LIZ
	endifjustbattled
	opentext
	checkflag ENGINE_LIZ_READY_FOR_REMATCH
	iftrue .Rematch
	checkcellnum PHONE_PICNICKER_LIZ
	iftrue .NumberAccepted
	checkevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	iftrue .AskAgain
	writetext PicnickerLiz1AfterText
	promptbutton
	setevent EVENT_LIZ_ASKED_FOR_PHONE_NUMBER
	scall .AskNumber1
	sjump .AskForNumber

.AskAgain:
	scall .AskNumber2
.AskForNumber:
	askforphonenumber PHONE_PICNICKER_LIZ
	ifequal PHONE_CONTACTS_FULL, .PhoneFull
	ifequal PHONE_CONTACT_REFUSED, .NumberDeclined
	gettrainername STRING_BUFFER_3, PICNICKER, LIZ1
	scall .RegisteredNumber
	sjump .NumberAccepted

.Rematch:
	scall .RematchStd
	winlosstext PicnickerLiz1BeatenText, 0
	readmem wLizFightCount
	ifequal 4, .Fight4
	ifequal 3, .Fight3
	ifequal 2, .Fight2
	ifequal 1, .Fight1
	ifequal 0, .LoadFight0
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
	loadmem wLizFightCount, 1
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight1:
	loadtrainer PICNICKER, LIZ2
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 2
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight2:
	loadtrainer PICNICKER, LIZ3
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 3
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight3:
	loadtrainer PICNICKER, LIZ4
	startbattle
	reloadmapafterbattle
	loadmem wLizFightCount, 4
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

.LoadFight4:
	loadtrainer PICNICKER, LIZ5
	startbattle
	reloadmapafterbattle
	clearflag ENGINE_LIZ_READY_FOR_REMATCH
	end

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

TrainerYoungsterAlbert:
	trainer YOUNGSTER, ALBERT, EVENT_BEAT_YOUNGSTER_ALBERT, YoungsterAlbertSeenText, YoungsterAlbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterAlbertAfterText
	waitbutton
	closetext
	end

TrainerYoungsterGordon:
	trainer YOUNGSTER, GORDON, EVENT_BEAT_YOUNGSTER_GORDON, YoungsterGordonSeenText, YoungsterGordonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterGordonAfterText
	waitbutton
	closetext
	end

TrainerBirdKeeperPeter:
	trainer BIRD_KEEPER, PETER, EVENT_BEAT_BIRD_KEEPER_PETER, BirdKeeperPeterSeenText, BirdKeeperPeterBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperPeterAfterText
	waitbutton
	closetext
	end

FriedaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_POISON_BARB_FROM_FRIEDA
	iftrue .Friday
	readvar VAR_WEEKDAY
	ifnotequal FRIDAY, .NotFriday
	checkevent EVENT_MET_FRIEDA_OF_FRIDAY
	iftrue .MetFrieda
	writetext MeetFriedaText
	promptbutton
	setevent EVENT_MET_FRIEDA_OF_FRIDAY
.MetFrieda:
	writetext FriedaGivesGiftText
	promptbutton
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

Route32PokecenterSign:
	jumpstd PokecenterSignScript

Route32HiddenGreatBall:
	hiddenitem GREAT_BALL, EVENT_ROUTE_32_HIDDEN_GREAT_BALL

Route32HiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ROUTE_32_HIDDEN_SUPER_POTION

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
	text "Hop! Hop!"
	line "Ca urge ou quoi?"
	done

Route32CooltrainerMText_AideIsWaiting:
	text "<PLAYER>, c'est ça?"
	line "Un type avec des"

	para "lunettes te cher-"
	line "chait."

	para "Il t'attend au"
	line "CENTRE #MON."
	done

Route32CooltrainerMText_UnusedSproutTower:
	text "As-tu visité la"
	line "TOUR CHETIFLOR?"

	para "Si tu vas à"
	line "MAUVILLE, tu dois"

	para "aller t'y entraî-"
	line "ner."

	para "C'est le devoir de"
	line "tout dresseur!"
	done

Route32CooltrainerMText_VioletGym:
	text "As-tu visité"
	line "l'ARENE #MON?"

	para "Tu peux y mettre"
	line "tes compétences à"
	cont "l'épreuve."

	para "Tous les dresseurs"
	line "doivent y aller!"
	done

Route32CooltrainerMText_HaveThisSeed:
	text "Tu as de bons"
	line "#MON, tu sais."

	para "Ils ont dû s'en-"
	line "traîner autour de"
	cont "MAUVILLE."

	para "Les combats dans"
	line "l'ARENE t'ont"

	para "donné de l'expé-"
	line "rience, non?"

	para "En souvenir de"
	line "MAUVILLE, accepte"
	cont "ceci."

	para "Cela améliore les"
	line "capacités du type"
	cont "PLANTE."
	done

Route32CooltrainerMText_ExperiencesShouldBeUseful:
	text "Ta visite à"
	line "MAUVILLE te sera"

	para "bénéfique."
	done

Text_MillionDollarSlowpokeTail:
	text "Hé toi! Ca te"
	line "dit une bonne"
	cont "QUEUERAMOLOS?"

	para "J'te fais un prix:"
	line "1000000¥!"

	para "C'est pour toi!"
	done

Text_ThoughtKidsWereLoaded:
	text "Pff! T'as pas une"
	line "thune! Dégage!"
	done

Text_RefusedToBuySlowpokeTail:
	text "T'en veux pas?"
	line "Dégage!"
	done

FisherJustinSeenText:
	text "Hééé!"

	para "Tu m'as fait per-"
	line "dre mon poisson!"
	done

FisherJustinBeatenText:
	text "Splash!"
	done

FisherJustinAfterText:
	text "L'essence de la"
	line "pêche et de #-"

	para "MON, c'est le"
	line "calme."
	done

FisherRalph1SeenText:
	text "La pêche et les"
	line "#MON, c'est"
	cont "de la balle."

	para "J'suis pas du"
	line "genre à perdre!"
	done

FisherRalph1BeatenText:
	text "Pfff!"
	line "J't'aime pas."
	done

FisherRalphAfterText:
	text "Ma passion c'est"
	line "la pêche et les"

	para "#MON sont mes"
	line "amis!"
	done

FisherRalphSwarmText:
	text "Un, deux et trois!"
	line "Une bonne prise!"

	para "Yahahahahahahah!"
	line "J'en ai marre!"
	cont "A ton tour!"
	done

Route32UnusedFisher1SeenText: ; unreferenced
	text "J'attrape toujours"
	line "le même #MON."

	para "Bon allez..."
	line "Un petit combat"
	cont "pour me changer"
	cont "les idées."
	done

Route32UnusedFisher1BeatenText: ; unreferenced
	text "Tout cloche pour"
	line "moi..."
	done

Route32UnusedFisher1AfterText: ; unreferenced
	text "Pourquoi le type"
	line "à côté de moi"
	cont "attrape toujours"
	cont "de bons #MON?"
	done

Route32UnusedFisher2SeenText: ; unreferenced
	text "J'suis en veine..."
	line "Alors on va"
	cont "s'battre."
	done

Route32UnusedFisher2BeatenText: ; unreferenced
	text "Ah bon."
	line "Pas d'pot."
	done

Route32UnusedFisher2AfterText: ; unreferenced
	text "Il te faut une"
	line "bonne CANNE pour"

	para "attraper de bons"
	line "#MON."
	done

FisherHenrySeenText:
	text "Mes #MON?"
	line "Frais du matin"
	cont "pêchés!"
	done

FisherHenryBeatenText:
	text "SPLASH?"
	done

FisherHenryAfterText:
	text "Les #MON bien"
	line "entraînés sont"

	para "plus forts que les"
	line "jeunes."
	done

YoungsterAlbertSeenText:
	text "On s'connaît?"
	line "Tu veux crâner?"

	para "On va voir ça!"
	done

YoungsterAlbertBeatenText:
	text "Oulààà!"
	done

YoungsterAlbertAfterText:
	text "Je serai le plus"
	line "fort avec mes"
	cont "#MON favoris."

	para "Je n'utilise pas"
	line "les gros #MON"
	cont "super balèzes que"
	cont "tout le monde"
	cont "choisit."
	done

YoungsterGordonSeenText:
	text "J'ai trouvé des"
	line "#MON dans les"
	cont "hautes herbes!"

	para "Ils sont cool!"
	line "Et forts! Regarde!"
	done

YoungsterGordonBeatenText:
	text "Et ben ça alors."
	done

YoungsterGordonAfterText:
	text "Y'a plein de trucs"
	line "dans l'herbe."
	done

CamperRolandSeenText:
	text "Dis donc..."
	line "Tu m'cherches?"
	done

CamperRolandBeatenText:
	text "Ouaiiis!"
	line "Perduuu!"
	done

CamperRolandAfterText:
	text "Evite les regards"
	line "si tu ne veux pas"
	cont "te battre."
	done

PicnickerLiz1SeenText:
	text "Ah-ha. Ouais."
	line "Vers midi."

	para "Quoi? Combat?"
	line "J'suis au tél!"

	para "Bon d'accord."
	line "Mais rapide."
	done

PicnickerLiz1BeatenText:
	text "Oh! Il faut que"
	line "je me calme!"
	done

PicnickerLiz1AfterText:
	text "J'avais une copine"
	line "au téléphone."
	done

BirdKeeperPeterSeenText:
	text "Ce BADGE! Il vient"
	line "de MAUVILLE!"

	para "T'as battu ALBERT?"
	done

BirdKeeperPeterBeatenText:
	text "OK."
	line "Pas mal."
	done

BirdKeeperPeterAfterText:
	text "Je vais encore"
	line "m'entraîner dans"
	cont "l'ARENE de"
	cont "MAUVILLE."
	done

Route32UnusedText: ; unreferenced
	text "Les pêcheurs m'ont"
	line "crié dessus parce"
	cont "que je les déran-"
	cont "geais..."
	done

Text_RoarIntro:
	text "GRAAAAA!"
	line "LES GENS N'AIMENT"

	para "PAS QUAND JE CRIE!"
	line "POURQUOI???"

	para "TOI TU AIMES?"
	line "SUPEEEER!"
	cont "VOILA POUR TOI!!!"
	done

Text_RoarOutro:
	text "GRAAAAAH!"
	line "C'EST HURLEMENT!"

	para "CA FAIT PEUR AUX"
	line "#MON!"
	done

MeetFriedaText:
	text "VANESSA: Ouaiis!"
	line "On est vendredi!"

	para "Je suis VANESSA du"
	line "vendredi!"

	para "Bonjour toi!"
	done

FriedaGivesGiftText:
	text "Voilà un PIC VENIN"
	line "pour toi!"
	done

FriedaGaveGiftText:
	text "VANESSA: Donne-le"
	line "à un #MON qui a"
	cont "des capacités du"
	cont "type POISON."

	para "Oh!"

	para "C'est terrible!"

	para "Tu verras à quel"
	line "point ça peut les"
	cont "améliorer!"
	done

FriedaFridayText:
	text "VANESSA: Ouais!"
	line "Quel jour tu"
	cont "aimes, toi?"

	para "Moi j'aime le ven-"
	line "dredi, et oui!"

	para "Pas toi? Hein?"
	line "Pas toi?"
	done

FriedaNotFridayText:
	text "VANESSA: On est"
	line "vendredi, aujour-"
	cont "d'hui?"

	para "Moi j'aime que le"
	line "vendredi!"
	done

Route32SignText:
	text "ROUTE 32"

	para "MAUVILLE -"
	line "ECORCIA"
	done

Route32RuinsSignText:
	text "RUINES D'ALPHA"
	line "ENTREE EST"
	done

Route32UnionCaveSignText:
	text "CAVES JUMELLES"
	line "Tout droit"
	done

Route32_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 11, 73, ROUTE_32_POKECENTER_1F, 1
	warp_event  4,  2, ROUTE_32_RUINS_OF_ALPH_GATE, 3
	warp_event  4,  3, ROUTE_32_RUINS_OF_ALPH_GATE, 4
	warp_event  6, 79, UNION_CAVE_1F, 4

	def_coord_events
	coord_event 18,  8, SCENE_ROUTE32_COOLTRAINER_M_BLOCKS, Route32CooltrainerMStopsYouScene
	coord_event  7, 71, SCENE_ROUTE32_OFFER_SLOWPOKETAIL, Route32WannaBuyASlowpokeTailScript

	def_bg_events
	bg_event 13,  5, BGEVENT_READ, Route32Sign
	bg_event  9,  1, BGEVENT_READ, Route32RuinsSign
	bg_event 10, 84, BGEVENT_READ, Route32UnionCaveSign
	bg_event 12, 73, BGEVENT_READ, Route32PokecenterSign
	bg_event 12, 67, BGEVENT_ITEM, Route32HiddenGreatBall
	bg_event 11, 40, BGEVENT_ITEM, Route32HiddenSuperPotion

	def_object_events
	object_event  8, 49, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherJustin, -1
	object_event 12, 56, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerFisherRalph1, -1
	object_event  6, 48, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherHenry, -1
	object_event 12, 22, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterAlbert, -1
	object_event  4, 63, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterGordon, -1
	object_event  3, 45, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerCamperRoland, -1
	object_event 10, 30, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerPicnickerLiz1, -1
	object_event 19,  8, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32CooltrainerMScript, -1
	object_event 11, 82, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperPeter, -1
	object_event  7, 70, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, SlowpokeTailSalesmanScript, EVENT_SLOWPOKE_WELL_ROCKETS
	object_event  6, 53, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32GreatBall, EVENT_ROUTE_32_GREAT_BALL
	object_event 15, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route32RoarTMGuyScript, -1
	object_event 12, 67, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, FriedaScript, EVENT_ROUTE_32_FRIEDA_OF_FRIDAY
	object_event  3, 30, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route32Repel, EVENT_ROUTE_32_REPEL
