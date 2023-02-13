	object_const_def
	const LAKEOFRAGE_LANCE
	const LAKEOFRAGE_GRAMPS
	const LAKEOFRAGE_SUPER_NERD1
	const LAKEOFRAGE_COOLTRAINER_F1
	const LAKEOFRAGE_FISHER1
	const LAKEOFRAGE_FISHER2
	const LAKEOFRAGE_COOLTRAINER_M
	const LAKEOFRAGE_COOLTRAINER_F2
	const LAKEOFRAGE_GYARADOS
	const LAKEOFRAGE_WESLEY
	const LAKEOFRAGE_POKE_BALL1
	const LAKEOFRAGE_POKE_BALL2

LakeOfRage_MapScripts:
	def_scene_scripts
	scene_script LakeOfRageNoop1Scene ; unusable
	scene_script LakeOfRageNoop2Scene ; unusable

	def_callbacks
	callback MAPCALLBACK_NEWMAP, LakeOfRageFlypointCallback
	callback MAPCALLBACK_OBJECTS, LakeOfRageWesleyCallback

LakeOfRageNoop1Scene:
	end

LakeOfRageNoop2Scene:
	end

LakeOfRageFlypointCallback:
	setflag ENGINE_FLYPOINT_LAKE_OF_RAGE
	endcallback

LakeOfRageWesleyCallback:
	readvar VAR_WEEKDAY
	ifequal WEDNESDAY, .WesleyAppears
	disappear LAKEOFRAGE_WESLEY
	endcallback

.WesleyAppears:
	appear LAKEOFRAGE_WESLEY
	endcallback

LakeOfRageLanceScript:
	checkevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	iftrue .AskAgainForHelp
	opentext
	writetext LakeOfRageLanceForcedToEvolveText
	promptbutton
	faceplayer
	writetext LakeOfRageLanceIntroText
	yesorno
	iffalse .RefusedToHelp
.AgreedToHelp:
	writetext LakeOfRageLanceRadioSignalText
	waitbutton
	closetext
	playsound SFX_WARP_TO
	applymovement LAKEOFRAGE_LANCE, LakeOfRageLanceTeleportIntoSkyMovement
	disappear LAKEOFRAGE_LANCE
	clearevent EVENT_MAHOGANY_MART_LANCE_AND_DRAGONITE
	setevent EVENT_DECIDED_TO_HELP_LANCE
	setmapscene MAHOGANY_MART_1F, SCENE_MAHOGANYMART1F_LANCE_UNCOVERS_STAIRS
	end

.RefusedToHelp:
	writetext LakeOfRageLanceRefusedText
	waitbutton
	closetext
	setevent EVENT_REFUSED_TO_HELP_LANCE_AT_LAKE_OF_RAGE
	end

.AskAgainForHelp:
	faceplayer
	opentext
	writetext LakeOfRageLanceAskHelpText
	yesorno
	iffalse .RefusedToHelp
	sjump .AgreedToHelp

RedGyarados:
	opentext
	writetext LakeOfRageGyaradosCryText
	pause 15
	cry GYARADOS
	closetext
	loadwildmon GYARADOS, 30
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear LAKEOFRAGE_GYARADOS
.NotBeaten:
	reloadmapafterbattle
	opentext
	giveitem RED_SCALE
	waitsfx
	writetext LakeOfRageGotRedScaleText
	playsound SFX_ITEM
	waitsfx
	itemnotify
	closetext
	setscene 0 ; Lake of Rage does not have a scene variable
	appear LAKEOFRAGE_LANCE
	end

LakeOfRageGrampsScript:
	faceplayer
	opentext
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .ClearedRocketHideout
	writetext LakeOfRageGrampsText
	waitbutton
	closetext
	end

.ClearedRocketHideout:
	writetext LakeOfRageGrampsText_ClearedRocketHideout
	waitbutton
	closetext
	end

LakeOfRageSuperNerdScript:
	jumptextfaceplayer LakeOfRageSuperNerdText

LakeOfRageCooltrainerFScript:
	jumptextfaceplayer LakeOfRageCooltrainerFText

LakeOfRageSign:
	jumptext LakeOfRageSignText

MagikarpHouseSignScript:
	opentext
	writetext FishingGurusHouseSignText
	checkevent EVENT_CLEARED_ROCKET_HIDEOUT
	iftrue .MagikarpLengthRecord
	waitbutton
	closetext
	end

.MagikarpLengthRecord:
	promptbutton
	special MagikarpHouseSign
	closetext
	end

TrainerFisherAndre:
	trainer FISHER, ANDRE, EVENT_BEAT_FISHER_ANDRE, FisherAndreSeenText, FisherAndreBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherAndreAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherRaymond:
	trainer FISHER, RAYMOND, EVENT_BEAT_FISHER_RAYMOND, FisherRaymondSeenText, FisherRaymondBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherRaymondAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAaron:
	trainer COOLTRAINERM, AARON, EVENT_BEAT_COOLTRAINERM_AARON, CooltrainermAaronSeenText, CooltrainermAaronBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAaronAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLois:
	trainer COOLTRAINERF, LOIS, EVENT_BEAT_COOLTRAINERF_LOIS, CooltrainerfLoisSeenText, CooltrainerfLoisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLoisAfterBattleText
	waitbutton
	closetext
	end

WesleyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	iftrue WesleyWednesdayScript
	readvar VAR_WEEKDAY
	ifnotequal WEDNESDAY, WesleyNotWednesdayScript
	checkevent EVENT_MET_WESLEY_OF_WEDNESDAY
	iftrue .MetWesley
	writetext MeetWesleyText
	promptbutton
	setevent EVENT_MET_WESLEY_OF_WEDNESDAY
.MetWesley:
	writetext WesleyGivesGiftText
	promptbutton
	verbosegiveitem BLACKBELT_I
	iffalse WesleyDoneScript
	setevent EVENT_GOT_BLACKBELT_FROM_WESLEY
	writetext WesleyGaveGiftText
	waitbutton
	closetext
	end

WesleyWednesdayScript:
	writetext WesleyWednesdayText
	waitbutton
WesleyDoneScript:
	closetext
	end

WesleyNotWednesdayScript:
	writetext WesleyNotWednesdayText
	waitbutton
	closetext
	end

LakeOfRageElixer:
	itemball ELIXER

LakeOfRageTMDetect:
	itemball TM_DETECT

LakeOfRageHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_LAKE_OF_RAGE_HIDDEN_FULL_RESTORE

LakeOfRageHiddenRareCandy:
	hiddenitem RARE_CANDY, EVENT_LAKE_OF_RAGE_HIDDEN_RARE_CANDY

LakeOfRageHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_LAKE_OF_RAGE_HIDDEN_MAX_POTION

LakeOfRageLanceTeleportIntoSkyMovement:
	teleport_from
	step_end

LakeOfRageLanceForcedToEvolveText:
	text "Ce LAC est rempli"
	line "de LEVIATOR et"
	cont "rien d'autre..."

	para "Les MAGICARPE ont"
	line "été forcés"
	cont "d'évoluer..."
	done

LakeOfRageLanceIntroText:
	text "Es-tu ici à cause"
	line "de la rumeur?"

	para "Tu es <PLAYER>?"
	line "Moi c'est PETER,"
	cont "un dresseur comme"
	cont "toi."

	para "J'ai entendu"
	line "certaines informa-"
	cont "tions et je suis"
	cont "venu faire mon"
	cont "enquête..."

	para "Je t'ai vu com-"
	line "battre, <PLAY_G>."

	para "On peut dire que"
	line "tu as du talent."

	para "Ca te dirait de"
	line "me donner un coup"
	cont "de main?"
	done

LakeOfRageLanceRadioSignalText:
	text "PETER: Excellent!"

	para "On dirait que"
	line "quelque chose"
	cont "force les"
	cont "MAGICARPE du LAC"
	cont "à évoluer."

	para "Un mystérieux"
	line "signal radio vient"
	cont "d'ACAJOU."

	para "Je t'y attendrai,"
	line "<PLAY_G>."
	done

LakeOfRageLanceRefusedText:
	text "Oh... Bon, si tu"
	line "changes d'avis,"
	cont "tu pourras"
	cont "m'aider."
	done

LakeOfRageLanceAskHelpText:
	text "PETER: Hum? Vas-tu"
	line "m'aider?"
	done

LakeOfRageGyaradosCryText:
	text "LEVIATOR: Tttooor!"
	done

LakeOfRageGotRedScaleText:
	text "<PLAYER> obtient"
	line "une ECAILLEROUGE."
	done

LakeOfRageGrampsText:
	text "Les LEVIATOR sont"
	line "en colère!"

	para "Mauvais présage!"
	done

LakeOfRageGrampsText_ClearedRocketHideout:
	text "Hahah! Les"
	line "MAGICARPE mordent!"
	done

LakeOfRageSuperNerdText:
	text "On dit que ce LAC"
	line "a été fait par"
	cont "le déchaînement de"
	cont "LEVIATOR."

	para "Je me demande"
	line "s'il y a un lien"

	para "avec leur colère?"
	done

LakeOfRageCooltrainerFText:
	text "J'ai la berlue ou"
	line "quoi? J'ai vu un"
	cont "LEVIATOR rouge"
	cont "dans le LAC..."

	para "Je croyais qu'il"
	line "n'y avait que des"
	cont "LEVIATOR bleus?"
	done

FisherAndreSeenText:
	text "Laisse-moi donc"
	line "combattre avec le"
	cont "#MON que je"
	cont "viens d'attraper!"
	done

FisherAndreBeatenText:
	text "J'suis peut-être"
	line "un bon pêcheur"

	para "mais j'suis un"
	line "mauvais dresseur."
	done

FisherAndreAfterBattleText:
	text "J'suis un bon"
	line "pêcheur, moi."
	cont "Et j'attrape des"
	cont "#MON!"
	done

FisherRaymondSeenText:
	text "Qu'importe ce que"
	line "je fais, j'attrape"

	para "toujours le même"
	line "#MON..."
	done

FisherRaymondBeatenText:
	text "Ma ligne est toute"
	line "emmêlée..."
	done

FisherRaymondAfterBattleText:
	text "Pourquoi je ne"
	line "peux pas attraper"
	cont "de bons #MON?"
	done

CooltrainermAaronSeenText:
	text "Si un dresseur"
	line "éclabousse un"

	para "autre dresseur, ça"
	line "fini en duel."

	para "C'est la loi."
	done

CooltrainermAaronBeatenText:
	text "Whaa..."
	line "Bon combat!"
	done

CooltrainermAaronAfterBattleText:
	text "Les #MON et"
	line "leur dresseur"

	para "deviennent forts"
	line "en combattant"
	cont "régulièrement."
	done

CooltrainerfLoisSeenText:
	text "Qu'est-il arrivé"
	line "au LEVIATOR rouge?"

	para "Il est parti?"

	para "Oh, zut! Je suis"
	line "venue pour rien?"

	para "Bon..."
	line "COMBAT!"
	done

CooltrainerfLoisBeatenText:
	text "Pas mal!"
	done

CooltrainerfLoisAfterBattleText:
	text "Au fait..."
	line "J'ai vu un"
	cont "PAPILUSION rose."
	done

MeetWesleyText:
	text "HOMER: Alors,"
	line "comment va?"

	para "Moi c'est HOMER"
	line "du mercredi. Et"

	para "aujourd'hui..."
	line "C'est mercredi!"
	done

WesleyGivesGiftText:
	text "Enchanté de faire"
	line "ta connaissance."
	cont "V'là un souvenir."
	done

WesleyGaveGiftText:
	text "HOMER: La CEINT."
	line "NOIRE renforce le"
	cont "pouvoir des capa-"
	cont "cités de COMBAT."
	done

WesleyWednesdayText:
	text "HOMER: Avant de"
	line "m'avoir trouvé,"

	para "t'as dû rencontrer"
	line "mes frères et"
	cont "soeurs."

	para "Ou alors t'es en"
	line "veine?"
	done

WesleyNotWednesdayText:
	text "HOMER: On n'est"
	line "pas mercredi!!!"
	cont "Dommage!"
	done

LakeOfRageSignText:
	text "LAC COLERE,"
	line "aussi connu sous"
	cont "le nom de LAC"
	cont "LEVIATOR."
	done

FishingGurusHouseSignText:
	text "MAISON DU MAITRE"
	line "PECHEUR"
	done

LakeOfRage_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  3, LAKE_OF_RAGE_HIDDEN_POWER_HOUSE, 1
	warp_event 27, 31, LAKE_OF_RAGE_MAGIKARP_HOUSE, 1

	def_coord_events

	def_bg_events
	bg_event 21, 27, BGEVENT_READ, LakeOfRageSign
	bg_event 25, 31, BGEVENT_READ, MagikarpHouseSignScript
	bg_event 11, 28, BGEVENT_ITEM, LakeOfRageHiddenFullRestore
	bg_event  4,  4, BGEVENT_ITEM, LakeOfRageHiddenRareCandy
	bg_event 35,  5, BGEVENT_ITEM, LakeOfRageHiddenMaxPotion

	def_object_events
	object_event 21, 28, SPRITE_LANCE, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageLanceScript, EVENT_LAKE_OF_RAGE_LANCE
	object_event 20, 26, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageGrampsScript, -1
	object_event 36, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageSuperNerdScript, -1
	object_event 25, 29, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LakeOfRageCooltrainerFScript, -1
	object_event 30, 23, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherAndre, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 24, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerFisherRaymond, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event  4, 15, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAaron, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 36,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 0, TrainerCooltrainerfLois, EVENT_LAKE_OF_RAGE_CIVILIANS
	object_event 18, 22, SPRITE_GYARADOS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RedGyarados, EVENT_LAKE_OF_RAGE_RED_GYARADOS
	object_event  4,  4, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, WesleyScript, EVENT_LAKE_OF_RAGE_WESLEY_OF_WEDNESDAY
	object_event  7, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageElixer, EVENT_LAKE_OF_RAGE_ELIXER
	object_event 35,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, LakeOfRageTMDetect, EVENT_LAKE_OF_RAGE_TM_DETECT
