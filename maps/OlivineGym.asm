	object_const_def
	const OLIVINEGYM_JASMINE
	const OLIVINEGYM_GYM_GUIDE

OlivineGym_MapScripts:
	def_scene_scripts

	def_callbacks

OlivineGymJasmineScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_JASMINE
	iftrue .FightDone
	writetext Jasmine_SteelTypeIntro
	waitbutton
	closetext
	winlosstext Jasmine_BetterTrainer, 0
	loadtrainer JASMINE, JASMINE1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_JASMINE
	opentext
	writetext Text_ReceivedMineralBadge
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_MINERALBADGE
	readvar VAR_BADGES
	scall OlivineGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM23_IRON_TAIL
	iftrue .GotIronTail
	writetext Jasmine_BadgeSpeech
	promptbutton
	verbosegiveitem TM_IRON_TAIL
	iffalse .NoRoomForIronTail
	setevent EVENT_GOT_TM23_IRON_TAIL
	writetext Jasmine_IronTailSpeech
	waitbutton
	closetext
	end

.GotIronTail:
	writetext Jasmine_GoodLuck
	waitbutton
.NoRoomForIronTail:
	closetext
	end

OlivineGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

OlivineGymGuideScript:
	faceplayer
	checkevent EVENT_BEAT_JASMINE
	iftrue .OlivineGymGuideWinScript
	checkevent EVENT_JASMINE_RETURNED_TO_GYM
	iffalse .OlivineGymGuidePreScript
	opentext
	writetext OlivineGymGuideText
	waitbutton
	closetext
	end

.OlivineGymGuideWinScript:
	opentext
	writetext OlivineGymGuideWinText
	waitbutton
	closetext
	end

.OlivineGymGuidePreScript:
	opentext
	writetext OlivineGymGuidePreText
	waitbutton
	closetext
	end

OlivineGymStatue:
	checkflag ENGINE_MINERALBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, JASMINE, JASMINE1
	jumpstd GymStatue2Script

Jasmine_SteelTypeIntro:
	text "...Merci pour ton"
	line "aide au PHARE..."

	para "Mais c'est un peu"
	line "différent."

	para "Permets-moi de me"
	line "présenter."

	para "Je suis JASMINE la"
	line "CHAMPIONNE d'ARENE"
	cont "et j'utilise les"
	cont "#MON de type"
	cont "ACIER."

	para "...Ca te dit"
	line "quelque chose le"
	cont "type ACIER?"

	para "C'est un tout"
	line "nouveau type de"
	cont "#MON."

	para "Hum...? Je peux"
	line "commencer?"
	done

Jasmine_BetterTrainer:
	text "...Bon bah t'es"
	line "meilleur dresseur"

	para "que moi, en"
	line "compétence et en"
	cont "gentillesse."

	para "En accord avec les"
	line "règles de la"

	para "LIGUE, je te"
	line "confie ce BADGE."
	done

Text_ReceivedMineralBadge:
	text "<PLAYER> reçoit"
	line "le BADGEMINERAL."
	done

Jasmine_BadgeSpeech:
	text "Le BADGEMINERAL"
	line "augmente la"
	cont "DEFENSE de tes"
	cont "#MON."

	para "Prends donc ceci"
	line "aussi..."
	done

Text_ReceivedTM09: ; unreferenced
	text "<PLAYER> reçoit"
	line "la CT09."
	done

Jasmine_IronTailSpeech:
	text "Tu peux utiliser"
	line "cette CT pour"
	cont "apprendre QUEUE DE"
	cont "FER à un #MON."
	done

Jasmine_GoodLuck:
	text "Hum... Je ne sais"
	line "comment dire..."
	cont "Mais bonne chance!"
	done

OlivineGymGuideText:
	text "JASMINE utilise le"
	line "tout nouveau type"
	cont "ACIER."

	para "Je ne sais pas"
	line "grand chose là-"
	cont "dessus."
	done

OlivineGymGuideWinText:
	text "C'est très étrange"

	para "le type ACIER,"
	line "hein?"

	para "C'est la rencon-"
	line "tre d'un nouveau"
	cont "genre!"
	done

OlivineGymGuidePreText:
	text "JASMINE, la"
	line "CHAMPIONNE d'ARENE"
	cont "est au PHARE."

	para "Elle s'occupe du"
	line "#MON malade."

	para "Un dresseur"
	line "puissant doit"
	cont "avoir un coeur"
	cont "charitable et être"
	cont "bienveillant."
	done

OlivineGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, OLIVINE_CITY, 2
	warp_event  5, 15, OLIVINE_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, OlivineGymStatue
	bg_event  6, 13, BGEVENT_READ, OlivineGymStatue

	def_object_events
	object_event  5,  3, SPRITE_JASMINE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymJasmineScript, EVENT_OLIVINE_GYM_JASMINE
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, OlivineGymGuideScript, -1
