	object_const_def
	const FUCHSIAGYM_JANINE
	const FUCHSIAGYM_FUCHSIA_GYM_1
	const FUCHSIAGYM_FUCHSIA_GYM_2
	const FUCHSIAGYM_FUCHSIA_GYM_3
	const FUCHSIAGYM_FUCHSIA_GYM_4
	const FUCHSIAGYM_GYM_GUIDE

FuchsiaGym_MapScripts:
	def_scene_scripts

	def_callbacks

FuchsiaGymJanineScript:
	checkflag ENGINE_SOULBADGE
	iftrue .FightDone
	applymovement FUCHSIAGYM_JANINE, Movement_NinjaSpin
	faceplayer
	opentext
	writetext JanineText_DisappointYou
	waitbutton
	closetext
	winlosstext JanineText_ToughOne, 0
	loadtrainer JANINE, JANINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JANINE
	setevent EVENT_BEAT_LASS_ALICE
	setevent EVENT_BEAT_LASS_LINDA
	setevent EVENT_BEAT_PICNICKER_CINDY
	setevent EVENT_BEAT_CAMPER_BARRY
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
	opentext
	writetext Text_ReceivedSoulBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_SOULBADGE
	sjump .AfterBattle
.FightDone:
	faceplayer
	opentext
.AfterBattle:
	checkevent EVENT_GOT_TM06_TOXIC
	iftrue .AfterTM
	writetext JanineText_ToxicSpeech
	promptbutton
	verbosegiveitem TM_TOXIC
	iffalse .AfterTM
	setevent EVENT_GOT_TM06_TOXIC
.AfterTM:
	writetext JanineText_ApplyMyself
	waitbutton
	closetext
	end

LassAliceScript:
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_1, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_LASS
	special LoadUsedSpritesGFX
.AliceUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_ALICE
	iftrue .AliceAfterScript
	writetext LassAliceBeforeText
	waitbutton
	closetext
	winlosstext LassAliceBeatenText, 0
	loadtrainer LASS, ALICE
	startbattle
	iftrue .AliceBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_ALICE
	end

.AliceBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_1, SPRITE_JANINE
	reloadmapafterbattle
	end

.AliceAfterScript:
	writetext LassAliceAfterText
	waitbutton
	closetext
	end

LassLindaScript:
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_2, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_LASS
	special LoadUsedSpritesGFX
.LindaUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_LASS_LINDA
	iftrue .LindaAfterScript
	writetext LassLindaBeforeText
	waitbutton
	closetext
	winlosstext LassLindaBeatenText, 0
	loadtrainer LASS, LINDA
	startbattle
	iftrue .LindaBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_LASS_LINDA
	end

.LindaBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_2, SPRITE_JANINE
	reloadmapafterbattle
	end

.LindaAfterScript:
	writetext LassLindaAfterText
	waitbutton
	closetext
	end

PicnickerCindyScript:
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_3, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_LASS
	special LoadUsedSpritesGFX
.CindyUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_PICNICKER_CINDY
	iftrue .CindyAfterScript
	writetext PicnickerCindyBeforeText
	waitbutton
	closetext
	winlosstext PicnickerCindyBeatenText, 0
	loadtrainer PICNICKER, CINDY
	startbattle
	iftrue .CindyBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_PICNICKER_CINDY
	end

.CindyBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_3, SPRITE_JANINE
	reloadmapafterbattle
	end

.CindyAfterScript:
	writetext PicnickerCindyAfterText
	waitbutton
	closetext
	end

CamperBarryScript:
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryUnmasked
	applymovement FUCHSIAGYM_FUCHSIA_GYM_4, Movement_NinjaSpin
	faceplayer
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_YOUNGSTER
	special LoadUsedSpritesGFX
.BarryUnmasked:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CAMPER_BARRY
	iftrue .BarryAfterScript
	writetext CamperBarryBeforeText
	waitbutton
	closetext
	winlosstext CamperBarryBeatenText, 0
	loadtrainer CAMPER, BARRY
	startbattle
	iftrue .BarryBecomesJanine
	reloadmapafterbattle
	setevent EVENT_BEAT_CAMPER_BARRY
	end

.BarryBecomesJanine:
	variablesprite SPRITE_FUCHSIA_GYM_4, SPRITE_JANINE
	reloadmapafterbattle
	end

.BarryAfterScript:
	writetext CamperBarryAfterText
	waitbutton
	closetext
	end

FuchsiaGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JANINE
	iftrue .FuchsiaGymGuideWinScript
	writetext FuchsiaGymGuideText
	waitbutton
	closetext
	end

.FuchsiaGymGuideWinScript:
	writetext FuchsiaGymGuideWinText
	waitbutton
	closetext
	end

FuchsiaGymStatue:
	checkflag ENGINE_SOULBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JANINE, JANINE1
	jumpstd GymStatue2Script

Movement_NinjaSpin:
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	turn_head LEFT
	turn_head UP
	turn_head RIGHT
	turn_head DOWN
	step_end

JanineText_DisappointYou:
	text "Gnah ha ha ha ha!"

	para "Désolée de te dé-"
	line "cevoir mais..."

	para "En fait..."

	para "C'est moi la"
	line "vraie!"

	para "Je suis JEANNINE"
	line "de l'ARENE de"
	cont "PARMANIE!"
	done

JanineText_ToughOne:
	text "JEANNINE: Tu as du"
	line "talent, toi. Tu as"
	cont "gagné..."

	para "Prends ce BADGE"
	line "AME."
	done

Text_ReceivedSoulBadge:
	text "<PLAYER> reçoit"
	line "le BADGE AME."
	done

JanineText_ToxicSpeech:
	text "JEANNINE: J'ai un"
	line "p'tit cadeau pour"
	cont "toi!"

	para "C'est TOXIK, un"
	line "puissant poison"

	para "qui vide les PV"
	line "de la victime."
	done

JanineText_ApplyMyself:
	text "JEANNINE: Je vais"
	line "encore m'entraîner"
	cont "et m'améliorer."

	para "Je serai plus for-"
	line "te que toi et mon"
	cont "petit papa!"
	done

LassAliceBeforeText:
	text "Gnah ha ha ha!"

	para "Je suis JEANNINE"
	line "de l'ARENE de"
	cont "PARMANIE!"

	para "..."
	line "Même pas vrai!"
	done

LassAliceBeatenText:
	text "Tu m'as crue,"
	line "hein?"
	done

LassAliceAfterText:
	text "Comment vas-tu"
	line "reconnaître la"
	cont "vraie CHAMPIONNE?"
	done

LassLindaBeforeText:
	text "Tu m'as crue!"
	line "Hahaha! Débile!"
	done

LassLindaBeatenText:
	text "Pfff..."
	line "Même pas mal."
	done

LassLindaAfterText:
	text "Il est pas bien"
	line "mon déguisement?"
	done

PicnickerCindyBeforeText:
	text "Je suis JEANNINE!"

	para "..."
	line "Tu me crois, non?"

	para "COMBAT!"
	done

PicnickerCindyBeatenText:
	text "Zut!"
	line "Presque!"
	done

PicnickerCindyAfterText:
	text "Alors?"
	line "Tu fatigues?"
	done

CamperBarryBeforeText:
	text "Wahahaha!"

	para "J'suis JEANNINE!"
	line "J'te jure!"
	done

CamperBarryBeatenText:
	text "C'est trop bien de"
	line "se déguiser!"
	done

CamperBarryAfterText:
	text "Alors je suis mimi"
	line "en fille?"
	done

FuchsiaGymGuideText:
	text "Hé! Graine de"
	line "star!"

	para "Regarde autour de"
	line "toi: tous les"

	para "dresseurs ressem-"
	line "blent à JEANNINE."

	para "Mais... Qui est la"
	line "vraie? Mystère!"
	done

FuchsiaGymGuideWinText:
	text "C'était un beau"
	line "combat, dresseur"
	cont "de JOHTO!"
	done

FuchsiaGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, FUCHSIA_CITY, 3
	warp_event  5, 17, FUCHSIA_CITY, 3

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, FuchsiaGymStatue
	bg_event  6, 15, BGEVENT_READ, FuchsiaGymStatue

	def_object_events
	object_event  1, 10, SPRITE_JANINE, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymJanineScript, -1
	object_event  5,  7, SPRITE_FUCHSIA_GYM_1, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassAliceScript, -1
	object_event  5, 11, SPRITE_FUCHSIA_GYM_2, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LassLindaScript, -1
	object_event  9,  4, SPRITE_FUCHSIA_GYM_3, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, PicnickerCindyScript, -1
	object_event  4,  2, SPRITE_FUCHSIA_GYM_4, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, CamperBarryScript, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, FuchsiaGymGuideScript, -1
