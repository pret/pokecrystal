	object_const_def
	const SAFFRONGYM_SABRINA
	const SAFFRONGYM_GRANNY1
	const SAFFRONGYM_YOUNGSTER1
	const SAFFRONGYM_GRANNY2
	const SAFFRONGYM_YOUNGSTER2
	const SAFFRONGYM_GYM_GUIDE

SaffronGym_MapScripts:
	def_scene_scripts

	def_callbacks

SaffronGymSabrinaScript:
	faceplayer
	opentext
	checkflag ENGINE_MARSHBADGE
	iftrue .FightDone
	writetext SabrinaIntroText
	waitbutton
	closetext
	winlosstext SabrinaWinLossText, 0
	loadtrainer SABRINA, SABRINA1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_SABRINA
	setevent EVENT_BEAT_MEDIUM_REBECCA
	setevent EVENT_BEAT_MEDIUM_DORIS
	setevent EVENT_BEAT_PSYCHIC_FRANKLIN
	setevent EVENT_BEAT_PSYCHIC_JARED
	opentext
	writetext ReceivedMarshBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MARSHBADGE
	writetext SabrinaMarshBadgeText
	waitbutton
	closetext
	end

.FightDone:
	writetext SabrinaFightDoneText
	waitbutton
	closetext
	end

TrainerMediumRebecca:
	trainer MEDIUM, REBECCA, EVENT_BEAT_MEDIUM_REBECCA, MediumRebeccaSeenText, MediumRebeccaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumRebeccaAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicFranklin:
	trainer PSYCHIC_T, FRANKLIN, EVENT_BEAT_PSYCHIC_FRANKLIN, PsychicFranklinSeenText, PsychicFranklinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicFranklinAfterBattleText
	waitbutton
	closetext
	end

TrainerMediumDoris:
	trainer MEDIUM, DORIS, EVENT_BEAT_MEDIUM_DORIS, MediumDorisSeenText, MediumDorisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext MediumDorisAfterBattleText
	waitbutton
	closetext
	end

TrainerPsychicJared:
	trainer PSYCHIC_T, JARED, EVENT_BEAT_PSYCHIC_JARED, PsychicJaredSeenText, PsychicJaredBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicJaredAfterBattleText
	waitbutton
	closetext
	end

SaffronGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SABRINA
	iftrue .SaffronGymGuideWinScript
	writetext SaffronGymGuideText
	waitbutton
	closetext
	end

.SaffronGymGuideWinScript:
	writetext SaffronGymGuideWinText
	waitbutton
	closetext
	end

SaffronGymStatue:
	checkflag ENGINE_MARSHBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, SABRINA, SABRINA1
	jumpstd GymStatue2Script

SabrinaIntroText:
	text "MORGANE: Je savais"
	line "que tu viendrais."

	para "J'ai eu une vision"
	line "il y a trois ans."

	para "T'en veux après"
	line "mon BADGE, non?"

	para "Je n'aime pas com-"
	line "battre mais en"

	para "tant que CHAMPION-"
	line "NE, je me dois de"

	para "confier mon BADGE"
	line "à celui ou celle"
	cont "qui le mérite."

	para "Comme tu insistes,"
	line "prépare-toi à mes"
	cont "pouvoirs psy!"
	done

SabrinaWinLossText:
	text "MORGANE: Ta force"
	line "est grande..."

	para "Je ne l'avais pas"
	line "prévu. Zut."

	para "Prédire le futur"
	line "c'est pas si"

	para "facile! Ne te"
	line "moque pas trop..."

	para "Bon. Tu as bien"
	line "mérité le BADGE"
	cont "MARAIS."
	done

ReceivedMarshBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE MARAIS."
	done

SabrinaMarshBadgeText:
	text "MORGANE: Le BADGE"
	line "MARAIS renforce"

	para "les pouvoirs"
	line "occultes..."

	para "Et ça..."
	line "C'est pas de la"
	cont "gnognotte."

	para "Tu deviendras un"
	line "MAITRE! Je le"
	cont "sens!"
	done

SabrinaFightDoneText:
	text "MORGANE: Ton amour"
	line "pour tes #MON a"

	para "brouillé mes pou-"
	line "voirs psy..."

	para "L'amour..."
	line "Quelle force!"
	done

MediumRebeccaSeenText:
	text "Que la force soit"
	line "avec moi!"
	done

MediumRebeccaBeatenText:
	text "Bah alors?"
	done

MediumRebeccaAfterBattleText:
	text "Quelle est la"
	line "source de ta"
	cont "force?"
	done

PsychicFranklinSeenText:
	text "Je vais prendre"
	line "ton âme!"
	done

PsychicFranklinBeatenText:
	text "Pourquoi tant de"
	line "haine?"
	done

PsychicFranklinAfterBattleText:
	text "Ton âme est très"
	line "puissante. Et ça"
	cont "c'est bien."
	done

MediumDorisSeenText:
	text "Gnihihihihi!"
	line "Forces occultes!"

	para "Ténèbres..."
	line "Pâté de foie!"
	done

MediumDorisBeatenText:
	text "J'aime le paranor-"
	line "mal, oui, mais la"
	cont "charcuterie aussi!"
	done

MediumDorisAfterBattleText:
	text "Le psychisme,"
	line "c'est dur à dire."
	done

PsychicJaredSeenText:
	text "Le DOJO d'à côté"
	line "était jadis l'ARE-"
	cont "NE de cette ville."
	done

PsychicJaredBeatenText:
	text "Tout perdu..."
	done

PsychicJaredAfterBattleText:
	text "Le ROI du KARATE,"
	line "le maître du DOJO"

	para "a été battu par"
	line "MORGANE."
	done

SaffronGymGuideText:
	text "Hé! Graine de"
	line "star!"

	para "Un bon dresseur"
	line "comme toi sait"

	para "comment battre des"
	line "#MON du type"
	cont "PSY, non?"

	para "Tu vas faire un"
	line "beau combat!"

	para "Bonne chance!"
	done

SaffronGymGuideWinText:
	text "Quelle belle"
	line "rencontre!"
	done

SaffronGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  8, 17, SAFFRON_CITY, 2
	warp_event  9, 17, SAFFRON_CITY, 2
	warp_event 11, 15, SAFFRON_GYM, 18
	warp_event 19, 15, SAFFRON_GYM, 19
	warp_event 19, 11, SAFFRON_GYM, 20
	warp_event  1, 11, SAFFRON_GYM, 21
	warp_event  5,  3, SAFFRON_GYM, 22
	warp_event 11,  5, SAFFRON_GYM, 23
	warp_event  1, 15, SAFFRON_GYM, 24
	warp_event 19,  3, SAFFRON_GYM, 25
	warp_event 15, 17, SAFFRON_GYM, 26
	warp_event  5, 17, SAFFRON_GYM, 27
	warp_event  5,  9, SAFFRON_GYM, 28
	warp_event  9,  3, SAFFRON_GYM, 29
	warp_event 15,  9, SAFFRON_GYM, 30
	warp_event 15,  5, SAFFRON_GYM, 31
	warp_event  1,  5, SAFFRON_GYM, 32
	warp_event 19, 17, SAFFRON_GYM, 3
	warp_event 19,  9, SAFFRON_GYM, 4
	warp_event  1,  9, SAFFRON_GYM, 5
	warp_event  5,  5, SAFFRON_GYM, 6
	warp_event 11,  3, SAFFRON_GYM, 7
	warp_event  1, 17, SAFFRON_GYM, 8
	warp_event 19,  5, SAFFRON_GYM, 9
	warp_event 15, 15, SAFFRON_GYM, 10
	warp_event  5, 15, SAFFRON_GYM, 11
	warp_event  5, 11, SAFFRON_GYM, 12
	warp_event  9,  5, SAFFRON_GYM, 13
	warp_event 15, 11, SAFFRON_GYM, 14
	warp_event 15,  3, SAFFRON_GYM, 15
	warp_event  1,  3, SAFFRON_GYM, 16
	warp_event 11,  9, SAFFRON_GYM, 17

	def_coord_events

	def_bg_events
	bg_event  8, 15, BGEVENT_READ, SaffronGymStatue

	def_object_events
	object_event  9,  8, SPRITE_SABRINA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, SaffronGymSabrinaScript, -1
	object_event 17, 16, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerMediumRebecca, -1
	object_event  3, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicFranklin, -1
	object_event  3,  4, SPRITE_GRANNY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerMediumDoris, -1
	object_event 17,  4, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerPsychicJared, -1
	object_event  9, 14, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, SaffronGymGuideScript, -1
