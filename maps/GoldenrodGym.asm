	object_const_def
	const GOLDENRODGYM_WHITNEY
	const GOLDENRODGYM_LASS1
	const GOLDENRODGYM_LASS2
	const GOLDENRODGYM_BEAUTY1
	const GOLDENRODGYM_BEAUTY2
	const GOLDENRODGYM_GYM_GUIDE

GoldenrodGym_MapScripts:
	def_scene_scripts
	scene_script GoldenrodGymNoop1Scene, SCENE_GOLDENRODGYM_NOOP
	scene_script GoldenrodGymNoop2Scene, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING

	def_callbacks

GoldenrodGymNoop1Scene:
	end

GoldenrodGymNoop2Scene:
	end

GoldenrodGymWhitneyScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .FightDone
	opentext
	writetext WhitneyBeforeText
	waitbutton
	closetext
	winlosstext WhitneyShouldntBeSoSeriousText, 0
	loadtrainer WHITNEY, WHITNEY1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_WHITNEY
	setevent EVENT_MADE_WHITNEY_CRY
	setscene SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING
	setevent EVENT_BEAT_BEAUTY_VICTORIA
	setevent EVENT_BEAT_BEAUTY_SAMANTHA
	setevent EVENT_BEAT_LASS_CARRIE
	setevent EVENT_BEAT_LASS_BRIDGET
.FightDone:
	opentext
	checkevent EVENT_MADE_WHITNEY_CRY
	iffalse .StoppedCrying
	writetext WhitneyYouMeanieText
	waitbutton
	closetext
	end

.StoppedCrying:
	checkevent EVENT_GOT_TM45_ATTRACT
	iftrue .GotAttract
	checkflag ENGINE_PLAINBADGE
	iftrue .GotPlainBadge
	writetext WhitneyWhatDoYouWantText
	promptbutton
	waitsfx
	writetext PlayerReceivedPlainBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_PLAINBADGE
	readvar VAR_BADGES
	scall GoldenrodGymActivateRockets
.GotPlainBadge:
	writetext WhitneyPlainBadgeText
	promptbutton
	verbosegiveitem TM_ATTRACT
	iffalse .NoRoomForAttract
	setevent EVENT_GOT_TM45_ATTRACT
	writetext WhitneyAttractText
	waitbutton
	closetext
	end

.GotAttract:
	writetext WhitneyGoodCryText
	waitbutton
.NoRoomForAttract:
	closetext
	end

GoldenrodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerLassCarrie:
	trainer LASS, CARRIE, EVENT_BEAT_LASS_CARRIE, LassCarrieSeenText, LassCarrieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassCarrieAfterBattleText
	waitbutton
	closetext
	end

WhitneyCriesScript:
	showemote EMOTE_SHOCK, GOLDENRODGYM_LASS2, 15
	applymovement GOLDENRODGYM_LASS2, BridgetWalksUpMovement
	turnobject PLAYER, DOWN
	opentext
	writetext BridgetWhitneyCriesText
	waitbutton
	closetext
	applymovement GOLDENRODGYM_LASS2, BridgetWalksAwayMovement
	setscene SCENE_GOLDENRODGYM_NOOP
	clearevent EVENT_MADE_WHITNEY_CRY
	end

TrainerLassBridget:
	trainer LASS, BRIDGET, EVENT_BEAT_LASS_BRIDGET, LassBridgetSeenText, LassBridgetBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassBridgetAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautyVictoria:
	trainer BEAUTY, VICTORIA, EVENT_BEAT_BEAUTY_VICTORIA, BeautyVictoriaSeenText, BeautyVictoriaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyVictoriaAfterBattleText
	waitbutton
	closetext
	end

TrainerBeautySamantha:
	trainer BEAUTY, SAMANTHA, EVENT_BEAT_BEAUTY_SAMANTHA, BeautySamanthaSeenText, BeautySamanthaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautySamanthaAfterBattleText
	waitbutton
	closetext
	end

GoldenrodGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_WHITNEY
	iftrue .GoldenrodGymGuideWinScript
	opentext
	writetext GoldenrodGymGuideText
	waitbutton
	closetext
	end

.GoldenrodGymGuideWinScript:
	opentext
	writetext GoldenrodGymGuideWinText
	waitbutton
	closetext
	end

GoldenrodGymStatue:
	checkflag ENGINE_PLAINBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, WHITNEY, WHITNEY1
	jumpstd GymStatue2Script

BridgetWalksUpMovement:
	step LEFT
	turn_head UP
	step_end

BridgetWalksAwayMovement:
	step RIGHT
	turn_head LEFT
	step_end

WhitneyBeforeText:
	text "Salut!"
	line "Moi c'est BLANCHE!"

	para "Tout le monde aime"
	line "les #MON, alors"
	cont "moi je fais comme"
	cont "les autres!"

	para "Les #MON sont"
	line "super-super"
	cont "mignons pas vrai?"

	para "Ca te dirait de te"
	line "bastonner un peu?"
	cont "Je préfère te"
	cont "prévenir, je suis"
	cont "très forte!"
	done

WhitneyShouldntBeSoSeriousText:
	text "Sniff-sniff..."

	para "...Waaaaaaah!"
	line "T'es un peu nul!"

	para "Tu ne devrais pas"
	line "te prendre au"
	cont "sérieux! Tu es"
	cont "très jeune après"
	cont "tout!"
	done

WhitneyYouMeanieText:
	text "Waouaouah!"

	para "Waaaaah!"

	para "Sniff et re-sniff"
	line "...T'es pas cool!"
	done

WhitneyWhatDoYouWantText:
	text "...sniff..."

	para "Quoi? Qu'est-ce"
	line "que tu veux?"
	cont "Un BADGE?"

	para "Oh, d'accord."
	line "J'avais oublié."
	cont "Prends le BADGE"
	cont "PLAINE."
	done

PlayerReceivedPlainBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE PLAINE."
	done

WhitneyPlainBadgeText:
	text "Le BADGE PLAINE"
	line "permet à tes"

	para "#MON d'utiliser"
	line "FORCE hors des"
	cont "combats."

	para "Il accroît aussi"
	line "la VITESSE de tes"
	cont "#MON."

	para "Oh, prends aussi"
	line "ceci!"
	done

WhitneyAttractText:
	text "C'est ATTRACTION!"
	line "Cela développe le"

	para "charme et le pou-"
	line "voir d'attraction"
	cont "des #MON."

	para "N'est-ce pas en"
	line "parfaite harmonie"
	cont "avec mon gentil"
	cont "caractère?"
	done

WhitneyGoodCryText:
	text "Ah, ça fait du"
	line "bien de pleurer!"

	para "Reviens-me voir"
	line "quand tu veux!"
	cont "Tchao!"
	done

LassCarrieSeenText:
	text "Y sont mignons"
	line "mes #MON!"

	para "Y sont terribles"
	line "itou!"
	done

LassCarrieBeatenText:
	text "Zut... Je croyais"
	line "que tu étais"
	cont "faible..."
	done

LassCarrieAfterBattleText:
	text "Et moi, j'suis"
	line "mimi?"
	done

LassBridgetSeenText:
	text "Je préfère les"
	line "#MON mignons"
	cont "plutôt que les"
	cont "#MON forts."

	para "Mais j'en ai un"
	line "multifonction, il"
	cont "est mignon et fort"
	cont "à la fois!"
	done

LassBridgetBeatenText:
	text "Oh, non, non, non!"
	done

LassBridgetAfterBattleText:
	text "J'essaie de battre"
	line "BLANCHE mais..."
	cont "C'est déprimant."

	para "Je suis relax! Si"
	line "je perds, je"

	para "travaillerai dur"
	line "pour la prochaine"
	cont "fois!"
	done

BridgetWhitneyCriesText:
	text "Oh, non. Tu as"
	line "fait pleurer"
	cont "BLANCHE."

	para "C'est bon, elle va"
	line "bientôt se calmer."

	para "Elle pleure à"
	line "chaque fois"
	cont "qu'elle perd."
	done

BeautyVictoriaSeenText:
	text "Oh, tu es un sacré"
	line "numéro, toi!"

	para "Mimi en plus!"
	line "Je t'aime bien"
	cont "mais tu ne passe-"
	cont "ras pas comme ça!"
	done

BeautyVictoriaBeatenText:
	text "Voyons voir..."
	line "Oups, c'est fini?"
	done

BeautyVictoriaAfterBattleText:
	text "Whaou, tu dois"
	line "être cool pour me"
	cont "battre comme ça!"
	cont "Continue!"
	done

BeautySamanthaSeenText:
	text "Fais de ton mieux"
	line "ou je t'aurai!"
	done

BeautySamanthaBeatenText:
	text "Noon! Oh, MIAOUSS,"
	line "je suis désolée!"
	done

BeautySamanthaAfterBattleText:
	text "J'ai appris à"
	line "MIAOUSS des"
	cont "attaques pour"
	cont "parer chaque type."
	done

GoldenrodGymGuideText:
	text "Hé! Graine de"
	line "star!"

	para "Cette ARENE est"
	line "composée de"
	cont "dresseurs de #-"
	cont "MON de type"
	cont "NORMAL."

	para "Je te conseille"
	line "d'utiliser des"
	cont "#MON de type"
	cont "COMBAT."
	done

GoldenrodGymGuideWinText:
	text "T'as gagné? Super!"
	line "J'étais occupé à"
	cont "mater ces jolies"
	cont "filles."
	done

GoldenrodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  2, 17, GOLDENROD_CITY, 1
	warp_event  3, 17, GOLDENROD_CITY, 1

	def_coord_events
	coord_event  8,  5, SCENE_GOLDENRODGYM_WHITNEY_STOPS_CRYING, WhitneyCriesScript

	def_bg_events
	bg_event  1, 15, BGEVENT_READ, GoldenrodGymStatue
	bg_event  4, 15, BGEVENT_READ, GoldenrodGymStatue

	def_object_events
	object_event  8,  3, SPRITE_WHITNEY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymWhitneyScript, -1
	object_event  9, 13, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassCarrie, -1
	object_event  9,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerLassBridget, -1
	object_event  0,  2, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyVictoria, -1
	object_event 19,  5, SPRITE_BEAUTY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautySamantha, -1
	object_event  5, 15, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, GoldenrodGymGuideScript, -1
