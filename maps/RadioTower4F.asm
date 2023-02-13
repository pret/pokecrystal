	object_const_def
	const RADIOTOWER4F_FISHER
	const RADIOTOWER4F_TEACHER
	const RADIOTOWER4F_GROWLITHE
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ROCKET2
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_SCIENTIST

RadioTower4F_MapScripts:
	def_scene_scripts

	def_callbacks

RadioTower4FFisherScript:
	jumptextfaceplayer RadioTower4FFisherText

RadioTower4FDJMaryScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MARY
	iftrue .GotPinkBow
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .ClearedRockets
	writetext RadioTower4FDJMaryText
	waitbutton
	closetext
	end

.ClearedRockets:
	writetext RadioTower4FDJMaryText_ClearedRockets
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse .NoRoom
	writetext RadioTower4FDJMaryText_GivePinkBow
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MARY
	end

.GotPinkBow:
	writetext RadioTower4FDJMaryText_After
	waitbutton
.NoRoom:
	closetext
	end

RadioTowerMeowth:
	opentext
	writetext RadioTowerMeowthText
	cry MEOWTH
	waitbutton
	closetext
	end

TrainerGruntM10:
	trainer GRUNTM, GRUNTM_10, EVENT_BEAT_ROCKET_GRUNTM_10, GruntM10SeenText, GruntM10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM10AfterBattleText
	waitbutton
	closetext
	end

TrainerExecutivem2:
	trainer EXECUTIVEM, EXECUTIVEM_2, EVENT_BEAT_ROCKET_EXECUTIVEM_2, Executivem2SeenText, Executivem2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext Executivem2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF4:
	trainer GRUNTF, GRUNTF_4, EVENT_BEAT_ROCKET_GRUNTF_4, GruntF4SeenText, GruntF4BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF4AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistRich:
	trainer SCIENTIST, RICH, EVENT_BEAT_SCIENTIST_RICH, ScientistRichSeenText, ScientistRichBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistRichAfterBattleText
	waitbutton
	closetext
	end

RadioTower4FProductionSign:
	jumptext RadioTower4FProductionSignText

RadioTower4FStudio2Sign:
	jumptext RadioTower4FStudio2SignText

RadioTower4FFisherText:
	text "J'écoutais la ra-"
	line "dio tout en visi-"
	cont "tant les RUINES."

	para "J'y ai entendu une"
	line "émission étrange."
	done

RadioTower4FDJMaryText:
	text "LULA: Pourquoi?"
	line "Pourquoi tant de"
	cont "haine?"

	para "MIAOUSS, à l'aide!"
	done

RadioTower4FDJMaryText_ClearedRockets:
	text "LULA: Oh! Tu es"
	line "formidable!"

	para "Veux-tu de ceci"
	line "en remerciement?"
	done

RadioTower4FDJMaryText_GivePinkBow:
	text "LULA: C'est pour"
	line "les #MON qui"

	para "connaissent des"
	line "techniques du type"
	cont "NORMAL."
	done

RadioTower4FDJMaryText_After:
	text "LULA: Ecoute mon"
	line "émission avec le"

	para "PROF.CHEN: la"
	line "CHRONIQUE #MON."
	done

RadioTowerMeowthText:
	text "MIAOUSS: Miaou..."
	done

GruntM10SeenText:
	text "Tu comptes sauver"
	line "le DIRECTEUR?"

	para "Je crois que ça va"
	line "pas être possible."
	cont "J'vais t'écraser!"
	done

GruntM10BeatenText:
	text "Incroyable!"
	done

GruntM10AfterBattleText:
	text "Je..."
	line "J'le crois pas!"
	done

Executivem2SeenText:
	text "Stop! On m'appelle"
	line "la forteresse de"
	cont "la TEAM ROCKET!"

	para "Pas un pas de"
	line "plus, poussin!"
	done

Executivem2BeatenText:
	text "Tout cassé ma"
	line "forteresse!"
	done

Executivem2AfterBattleText:
	text "Tu as mérité mon"
	line "respect, alors"
	cont "voici un conseil."

	para "Laisse tomber ta"
	line "quête pendant qu'"
	cont "il en est temps."
	done

GruntF4SeenText:
	text "Quoi? Est-ce que"
	line "les #MON sont"
	cont "mignons?"

	para "Les miens seront"
	line "mignons après"

	para "t'avoir fichu une"
	line "raclée, ouais!"
	done

GruntF4BeatenText:
	text "Oh, non! Ils sont"
	line "nuls!"
	done

GruntF4AfterBattleText:
	text "Je m'aime!"
	line "Je m'aime!"

	para "Les #MON"
	line "ça sert à rien!"
	done

ScientistRichSeenText:
	text "Parfait."

	para "Cette TOUR RADIO"
	line "sera parfaite pour"
	cont "nos plans."
	done

ScientistRichBeatenText:
	text "Hmmm..."

	para "Tout plan comprend"
	line "certains accrocs."
	done

ScientistRichAfterBattleText:
	text "Penses-tu vraiment"
	line "pouvoir stopper"
	cont "la TEAM ROCKET?"
	done

RadioTower4FProductionSignText:
	text "3EME PRODUCTION"
	done

RadioTower4FStudio2SignText:
	text "3EME STUDIO 2"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  0,  0, RADIO_TOWER_5F, 1
	warp_event  9,  0, RADIO_TOWER_3F, 2
	warp_event 12,  0, RADIO_TOWER_5F, 2
	warp_event 17,  0, RADIO_TOWER_3F, 3

	def_coord_events

	def_bg_events
	bg_event  7,  0, BGEVENT_READ, RadioTower4FProductionSign
	bg_event 15,  0, BGEVENT_READ, RadioTower4FStudio2Sign

	def_object_events
	object_event  6,  4, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FFisherScript, EVENT_RADIO_TOWER_CIVILIANS_AFTER
	object_event 14,  6, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, RadioTower4FDJMaryScript, -1
	object_event 12,  7, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTowerMeowth, -1
	object_event  5,  6, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 3, TrainerGruntM10, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 14,  1, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerExecutivem2, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event 12,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerGruntF4, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
	object_event  4,  2, SPRITE_SCIENTIST, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerScientistRich, EVENT_RADIO_TOWER_ROCKET_TAKEOVER
