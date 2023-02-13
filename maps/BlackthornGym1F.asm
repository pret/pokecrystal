	object_const_def
	const BLACKTHORNGYM1F_CLAIR
	const BLACKTHORNGYM1F_COOLTRAINER_M1
	const BLACKTHORNGYM1F_COOLTRAINER_M2
	const BLACKTHORNGYM1F_COOLTRAINER_F
	const BLACKTHORNGYM1F_GYM_GUIDE

BlackthornGym1F_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_TILES, BlackthornGym1FBouldersCallback

BlackthornGym1FBouldersCallback:
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_1
	iffalse .skip1
	changeblock 8, 2, $3b ; fallen boulder 2
.skip1
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_2
	iffalse .skip2
	changeblock 2, 4, $3a ; fallen boulder 1
.skip2
	checkevent EVENT_BOULDER_IN_BLACKTHORN_GYM_3
	iffalse .skip3
	changeblock 8, 6, $3b ; fallen boulder 2
.skip3
	endcallback

BlackthornGymClairScript:
	faceplayer
	opentext
	checkflag ENGINE_RISINGBADGE
	iftrue .AlreadyGotBadge
	checkevent EVENT_BEAT_CLAIR
	iftrue .FightDone
	writetext ClairIntroText
	waitbutton
	closetext
	winlosstext ClairWinText, 0
	loadtrainer CLAIR, CLAIR1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CLAIR
	opentext
	writetext ClairText_GoToDragonsDen
	waitbutton
	closetext
	setevent EVENT_BEAT_COOLTRAINERM_PAUL
	setevent EVENT_BEAT_COOLTRAINERM_CODY
	setevent EVENT_BEAT_COOLTRAINERM_MIKE
	setevent EVENT_BEAT_COOLTRAINERF_FRAN
	setevent EVENT_BEAT_COOLTRAINERF_LOLA
	clearevent EVENT_MAHOGANY_MART_OWNERS
	setevent EVENT_BLACKTHORN_CITY_GRAMPS_BLOCKS_DRAGONS_DEN
	clearevent EVENT_BLACKTHORN_CITY_GRAMPS_NOT_BLOCKING_DRAGONS_DEN
	end

.FightDone:
	writetext ClairText_TooMuchToExpect
	waitbutton
	closetext
	end

.AlreadyGotBadge:
	checkevent EVENT_GOT_TM24_DRAGONBREATH
	iftrue .GotTM24
	writetext BlackthornGymClairText_YouKeptMeWaiting
	promptbutton
	giveitem TM_DRAGONBREATH
	iffalse .BagFull
	getitemname STRING_BUFFER_3, TM_DRAGONBREATH
	writetext BlackthornGymText_ReceivedTM24
	playsound SFX_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_TM24_DRAGONBREATH
	writetext BlackthornGymClairText_DescribeTM24
	promptbutton
	sjump .GotTM24

.BagFull:
	writetext BlackthornGymClairText_BagFull
	waitbutton
	closetext
	end

.GotTM24:
	writetext BlackthornGymClairText_League
	waitbutton
	closetext
	end

TrainerCooltrainermPaul:
	trainer COOLTRAINERM, PAUL, EVENT_BEAT_COOLTRAINERM_PAUL, CooltrainermPaulSeenText, CooltrainermPaulBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermPaulAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermMike:
	trainer COOLTRAINERM, MIKE, EVENT_BEAT_COOLTRAINERM_MIKE, CooltrainermMikeSeenText, CooltrainermMikeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermMikeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfLola:
	trainer COOLTRAINERF, LOLA, EVENT_BEAT_COOLTRAINERF_LOLA, CooltrainerfLolaSeenText, CooltrainerfLolaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfLolaAfterBattleText
	waitbutton
	closetext
	end

BlackthornGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CLAIR
	iftrue .BlackthornGymGuideWinScript
	writetext BlackthornGymGuideText
	waitbutton
	closetext
	end

.BlackthornGymGuideWinScript:
	writetext BlackthornGymGuideWinText
	waitbutton
	closetext
	end

BlackthornGymStatue:
	checkflag ENGINE_RISINGBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CLAIR, CLAIR1
	jumpstd GymStatue2Script

ClairIntroText:
	text "Je suis SANDRA."

	para "Je suis la reine"
	line "des dragons."

	para "Je peux même tenir"
	line "tête au CONSEIL"
	cont "des 4 de la LIGUE."

	para "Tu veux toujours"
	line "te battre?"

	para "...Bon."
	line "C'est parti!"

	para "Je vais pas y"
	line "aller mollo!"
	done

ClairWinText:
	text "Perdu?"

	para "J'y crois pas!!"
	line "Il y a sûrement"
	cont "une erreur..."
	done

ClairText_GoToDragonsDen:
	text "Ce n'est pas"
	line "possible."

	para "J'ai peut-être"
	line "perdu mais tu n'as"

	para "pas les épaules"
	line "pour la LIGUE"
	cont "#MON."

	para "Tu devrais relever"
	line "le défi des utili-"
	cont "sateurs de"
	cont "dragons."

	para "Derrière cette"
	line "ARENE se trouve"
	cont "l'ANTRE du DRAGON."

	para "Il y a un petit"
	line "temple au centre."
	cont "Vas-y."

	para "Si tu arrives à"
	line "prouver ta valeur,"

	para "tu seras digne de"
	line "porter le BADGE!"
	done

ClairText_TooMuchToExpect:
	text "Et alors?"

	para "On a peur"
	line "maintenant?"
	done

BlackthornGymClairText_YouKeptMeWaiting:
	text "Tu en as mis du"
	line "temps!"

	para "Tiens! Prends ça!"
	done

BlackthornGymText_ReceivedTM24:
	text "<PLAYER> reçoit"
	line "la CT24."
	done

BlackthornGymClairText_DescribeTM24:
	text "Elle contient"
	line "DRACOSOUFFLE."

	para "Non, cela n'a rien"
	line "à voir avec mon"
	cont "haleine..."

	para "Si tu n'en veux"
	line "pas, c'est pas"
	cont "la peine."
	done

BlackthornGymClairText_BagFull:
	text "Bah alors? Tu n'as"
	line "pas de place?"
	done

BlackthornGymClairText_League:
	text "Et ben alors?"

	para "Tu ne vas pas à"
	line "la LIGUE #MON?"

	para "Tu sais où c'est,"
	line "n'est-ce pas?"

	para "Va d'abord au"
	line "BOURG GEON."

	para "SURFE ensuite vers"
	line "l'est. Le chemin"
	cont "sera rude."

	para "Ne perds pas à la"
	line "LIGUE #MON!"

	para "Si tu perds, de"
	line "quoi j'aurai"
	cont "l'air, moi?"

	para "Fais de ton mieux."
	done

CooltrainermPaulSeenText:
	text "C'est ton premier"
	line "combat face à des"
	cont "dragons?"

	para "Je vais te montrer"
	line "leur résistance"
	cont "suprême!"
	done

CooltrainermPaulBeatenText:
	text "Mes #MON"
	line "dragon ont perdu?"
	done

CooltrainermPaulAfterBattleText:
	text "PETER voulait te"
	line "revoir?"
	cont "Mensonge!"
	done

CooltrainermMikeSeenText:
	text "Mes chances de"
	line "perdre? Même pas"
	cont "une pour mille!"
	done

CooltrainermMikeBeatenText:
	text "Je ne suis plus"
	line "très bon en"
	cont "maths."
	done

CooltrainermMikeAfterBattleText:
	text "Je connais mes"
	line "défauts..."

	para "On recommence?"
	line "Non? Bon et bien"
	cont "merci pour la"
	cont "leçon..."
	done

CooltrainerfLolaSeenText:
	text "Les dragons sont"
	line "des #MON"

	para "sacrés. Ils sont"
	line "plein de vie."

	para "Si tu ne fais pas"
	line "attention, tu ne"

	para "pourras pas en"
	line "venir à bout."
	done

CooltrainerfLolaBeatenText:
	text "Bien joué!"
	done

CooltrainerfLolaAfterBattleText:
	text "Les dragons sont"
	line "faibles face aux"
	cont "attaques de type"
	cont "DRAGON."
	done

BlackthornGymGuideText:
	text "Hé! Graine de"
	line "star!"

	para "C'est une longue"
	line "journée, mais on"

	para "arrivera bien-"
	line "tôt au bout!"
	cont "Compte sur moi!"

	para "SANDRA utilise les"
	line "#MON mythiques"
	cont "et sacrés de type"
	cont "DRAGON."

	para "C'est assez dur"
	line "de les battre."

	para "Mais tu sais, ils"
	line "sont censés être"

	para "faibles contre"
	line "les attaques de"
	cont "type GLACE."
	done

BlackthornGymGuideWinText:
	text "Bien joué!"
	line "Beau combat!"

	para "Il ne reste plus"
	line "que le challenge"
	cont "de la LIGUE"
	cont "#MON."

	para "Tu es sur le"
	line "point de devenir"
	cont "MAITRE #MON!"
	done

BlackthornGym1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, BLACKTHORN_CITY, 1
	warp_event  5, 17, BLACKTHORN_CITY, 1
	warp_event  1,  7, BLACKTHORN_GYM_2F, 1
	warp_event  7,  9, BLACKTHORN_GYM_2F, 2
	warp_event  2,  6, BLACKTHORN_GYM_2F, 3
	warp_event  7,  7, BLACKTHORN_GYM_2F, 4
	warp_event  7,  6, BLACKTHORN_GYM_2F, 5

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, BlackthornGymStatue
	bg_event  6, 15, BGEVENT_READ, BlackthornGymStatue

	def_object_events
	object_event  5,  3, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BlackthornGymClairScript, -1
	object_event  6,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermMike, -1
	object_event  1, 14, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermPaul, -1
	object_event  9,  2, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainerfLola, -1
	object_event  7, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BlackthornGymGuideScript, -1
