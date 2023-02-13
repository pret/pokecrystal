	object_const_def
	const ROUTE40_OLIVINE_RIVAL1
	const ROUTE40_OLIVINE_RIVAL2
	const ROUTE40_SWIMMER_GIRL1
	const ROUTE40_SWIMMER_GIRL2
	const ROUTE40_ROCK1
	const ROUTE40_ROCK2
	const ROUTE40_ROCK3
	const ROUTE40_LASS1
	const ROUTE40_MONICA
	const ROUTE40_POKEFAN_M
	const ROUTE40_LASS2
	const ROUTE40_STANDING_YOUNGSTER

Route40_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route40MonicaCallback

Route40MonicaCallback:
	clearevent EVENT_BATTLE_TOWER_OPEN_CIVILIANS
	readvar VAR_WEEKDAY
	ifequal MONDAY, .MonicaAppears
	disappear ROUTE40_MONICA
	endcallback

.MonicaAppears:
	appear ROUTE40_MONICA
	endcallback

TrainerSwimmerfElaine:
	trainer SWIMMERF, ELAINE, EVENT_BEAT_SWIMMERF_ELAINE, SwimmerfElaineSeenText, SwimmerfElaineBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfElaineAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfPaula:
	trainer SWIMMERF, PAULA, EVENT_BEAT_SWIMMERF_PAULA, SwimmerfPaulaSeenText, SwimmerfPaulaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfPaulaAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermSimon:
	trainer SWIMMERM, SIMON, EVENT_BEAT_SWIMMERM_SIMON, SwimmermSimonSeenText, SwimmermSimonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSimonAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermRandall:
	trainer SWIMMERM, RANDALL, EVENT_BEAT_SWIMMERM_RANDALL, SwimmermRandallSeenText, SwimmermRandallBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermRandallAfterBattleText
	waitbutton
	closetext
	end

Route40Lass1Script:
	jumptextfaceplayer Route40Lass1Text

Route40PokefanMScript:
	special Mobile_DummyReturnFalse
	iftrue .mobile
	jumptextfaceplayer Route40PokefanMText

.mobile
	jumptextfaceplayer Route40PokefanMText_Mobile

Route40Lass2Script:
	jumptextfaceplayer Route40Lass2Text

Route40StandingYoungsterScript:
	jumptextfaceplayer Route40StandingYoungsterText

MonicaScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	iftrue .Monday
	readvar VAR_WEEKDAY
	ifnotequal MONDAY, .NotMonday
	checkevent EVENT_MET_MONICA_OF_MONDAY
	iftrue .MetMonica
	writetext MeetMonicaText
	promptbutton
	setevent EVENT_MET_MONICA_OF_MONDAY
.MetMonica:
	writetext MonicaGivesGiftText
	promptbutton
	verbosegiveitem SHARP_BEAK
	iffalse .done
	setevent EVENT_GOT_SHARP_BEAK_FROM_MONICA
	writetext MonicaGaveGiftText
	waitbutton
	closetext
	end

.Monday:
	writetext MonicaMondayText
	waitbutton
.done:
	closetext
	end

.NotMonday:
	writetext MonicaNotMondayText
	waitbutton
	closetext
	end

Route40Sign:
	jumptext Route40SignText

Route40Rock:
	jumpstd SmashRockScript

Route40HiddenHyperPotion:
	hiddenitem HYPER_POTION, EVENT_ROUTE_40_HIDDEN_HYPER_POTION

Route40_StepRightUp6Movement: ; unreferenced
	step RIGHT
	step UP
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp5Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step UP
	step_end

Route40_StepUp4Movement: ; unreferenced
	step UP
	step UP
	step UP
	step UP
	step_end

SwimmermSimonSeenText:
	text "Il faut s'échauf-"
	line "fer avant de se"
	cont "baigner."

	para "Tout le monde sait"
	line "ça!"
	done

SwimmermSimonBeatenText:
	text "Aïe! Une crampe!"
	done

SwimmermSimonAfterBattleText:
	text "IRISIA est assez"
	line "loin d'ici."
	done

SwimmermRandallSeenText:
	text "T'as la flemme ou"
	line "quoi?"

	para "Nage au lieu de"
	line "monter sur ton"
	cont "#MON!"
	done

SwimmermRandallBeatenText:
	text "Zut de flûte."
	done

SwimmermRandallAfterBattleText:
	text "Nager, c'est bon"
	line "pour la santé."
	done

SwimmerfElaineSeenText:
	text "Tu vas à IRISIA?"

	para "On s'bat d'abord?"
	done

SwimmerfElaineBeatenText:
	text "C'est perdu!"
	done

SwimmerfElaineAfterBattleText:
	text "En tout cas, je"
	line "nage mieux que"
	cont "toi. Ouais!"
	done

SwimmerfPaulaSeenText:
	text "J'adore les #-"
	line "MON marins!"
	done

SwimmerfPaulaBeatenText:
	text "Oups!"
	done

SwimmerfPaulaAfterBattleText:
	text "Je me laisse"
	line "porter par les"
	cont "vagues."
	done

Route40Lass1Text:
	text "IRISIA est de"
	line "l'autre côté de la"
	cont "mer."
	done

Route40PokefanMText:
	text "Hmm! Il y a un"
	line "grand immeuble"
	cont "droit devant!"

	para "C'est quoi donc?"
	done

Route40PokefanMText_Mobile:
	text "Hmm! Tu as vu tous"
	line "les dresseurs"
	cont "qui sont entrés?"

	para "C'est quoi donc?"
	done

Route40Lass2Text:
	text "Je suis venue à"
	line "OLIVILLE pour"

	para "voir les beaux"
	line "paysages..."

	para "La mer, c'est bô."
	done

Route40StandingYoungsterText:
	text "As-tu visité la"
	line "TOUR DE COMBAT?"

	para "Plein de"
	line "dresseurs super"

	para "puissants s'y sont"
	line "réunis."

	para "Mais vu que tu as"
	line "des BADGES, tu"

	para "devrais t'en"
	line "tirer."
	done

MeetMonicaText:
	text "LUCIE: Bonjour!"
	line "Je suis LUCIE du"

	para "lundi."
	done

MonicaGivesGiftText:
	text "Puisqu'on est des"
	line "potes, voilà un"
	cont "petit cadeau!"
	done

MonicaGaveGiftText:
	text "LUCIE: C'est un"
	line "objet qui améliore"

	para "les capacités du"
	line "type VOL."

	para "Tu devrais le don-"
	line "ner à un #MON"
	cont "oiseau."
	done

MonicaMondayText:
	text "LUCIE: Mes frères"
	line "et soeurs sont un"
	cont "peu partout."

	para "Trouve-les tous!"
	done

MonicaNotMondayText:
	text "LUCIE: On est pas"
	line "lundi aujourd'hui!"
	cont "Dommage..."
	done

Route40SignText:
	text "ROUTE 40"

	para "IRISIA -"
	line "OLIVILLE"
	done

Route40_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  9,  5, ROUTE_40_BATTLE_TOWER_GATE, 1

	def_coord_events

	def_bg_events
	bg_event 14, 10, BGEVENT_READ, Route40Sign
	bg_event  7,  8, BGEVENT_ITEM, Route40HiddenHyperPotion

	def_object_events
	object_event 14, 18, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSimon, -1
	object_event 18, 30, SPRITE_OLIVINE_RIVAL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 5, TrainerSwimmermRandall, -1
	object_event  3, 19, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 4, TrainerSwimmerfElaine, -1
	object_event 10, 25, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfPaula, -1
	object_event  7, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  6,  9, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event  7,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Rock, -1
	object_event 11, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40Lass1Script, -1
	object_event  8, 10, SPRITE_BEAUTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MonicaScript, EVENT_ROUTE_40_MONICA_OF_MONDAY
	object_event  7,  6, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route40PokefanMScript, -1
	object_event 13,  4, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route40Lass2Script, -1
	object_event 12,  9, SPRITE_STANDING_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route40StandingYoungsterScript, EVENT_BATTLE_TOWER_OPEN_CIVILIANS
