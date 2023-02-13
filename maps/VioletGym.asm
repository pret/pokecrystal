	object_const_def
	const VIOLETGYM_FALKNER
	const VIOLETGYM_YOUNGSTER1
	const VIOLETGYM_YOUNGSTER2
	const VIOLETGYM_GYM_GUIDE

VioletGym_MapScripts:
	def_scene_scripts

	def_callbacks

VioletGymFalknerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .FightDone
	writetext FalknerIntroText
	waitbutton
	closetext
	winlosstext FalknerWinLossText, 0
	loadtrainer FALKNER, FALKNER1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_FALKNER
	opentext
	writetext ReceivedZephyrBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_ZEPHYRBADGE
	readvar VAR_BADGES
	scall VioletGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM31_MUD_SLAP
	iftrue .SpeechAfterTM
	setevent EVENT_BEAT_BIRD_KEEPER_ROD
	setevent EVENT_BEAT_BIRD_KEEPER_ABE
	setmapscene ELMS_LAB, SCENE_ELMSLAB_NOOP
	specialphonecall SPECIALCALL_ASSISTANT
	writetext FalknerZephyrBadgeText
	promptbutton
	verbosegiveitem TM_MUD_SLAP
	iffalse .NoRoomForMudSlap
	setevent EVENT_GOT_TM31_MUD_SLAP
	writetext FalknerTMMudSlapText
	waitbutton
	closetext
	end

.SpeechAfterTM:
	writetext FalknerFightDoneText
	waitbutton
.NoRoomForMudSlap:
	closetext
	end

VioletGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBirdKeeperRod:
	trainer BIRD_KEEPER, ROD, EVENT_BEAT_BIRD_KEEPER_ROD, BirdKeeperRodSeenText, BirdKeeperRodBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperRodAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperAbe:
	trainer BIRD_KEEPER, ABE, EVENT_BEAT_BIRD_KEEPER_ABE, BirdKeeperAbeSeenText, BirdKeeperAbeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperAbeAfterBattleText
	waitbutton
	closetext
	end

VioletGymGuideScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FALKNER
	iftrue .VioletGymGuideWinScript
	writetext VioletGymGuideText
	waitbutton
	closetext
	end

.VioletGymGuideWinScript:
	writetext VioletGymGuideWinText
	waitbutton
	closetext
	end

VioletGymStatue:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, FALKNER, FALKNER1
	jumpstd GymStatue2Script

FalknerIntroText:
	text "Je suis ALBERT, le"
	line "CHAMPION d'ARENE"
	cont "de MAUVILLE!"

	para "On dit qu'avec une"
	line "bonne décharge"

	para "électrique, les"
	line "#MON volants"
	cont "grillent..."

	para "Je n'autorise per-"
	line "sonne à insulter"
	cont "les #MON!"

	para "Tu vas subir les"
	line "terribles attaques"

	para "de mes #MON"
	line "volants!"
	done

FalknerWinLossText:
	text "...Zut de flûte!"
	line "Les #MON adorés"
	cont "de mon papa..."

	para "Très bien."
	line "Prends ceci."

	para "C'est le BADGE"
	line "ZEPHYR officiel de"
	cont "la LIGUE #MON."
	done

ReceivedZephyrBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE ZEPHYR."
	done

FalknerZephyrBadgeText:
	text "Le BADGE ZEPHYR"
	line "augmente l'ATTAQUE"
	cont "des #MON."

	para "Il permet aussi"
	line "aux #MON"

	para "d'utiliser FLASH"
	line "en dehors des"
	cont "combats."

	para "Prends ça aussi."
	done

FalknerTMMudSlapText:
	text "En utilisant une"
	line "CT, les #MON"

	para "apprennent une"
	line "nouvelle capacité."

	para "Réfléchis bien"
	line "avant d'agir, une"
	cont "CT ne s'utilise"
	cont "qu'une fois."

	para "La CT31 contient"
	line "COUD'BOUE."

	para "Elle réduit la"
	line "précision de l'en-"

	para "nemi et lui infli-"
	line "ge des dégâts."

	para "En d'autres termes"
	line "c'est à la fois"
	cont "offensif et"
	cont "défensif."
	done

FalknerFightDoneText:
	text "Il y a des ARENES"
	line "#MON dans"
	cont "les alentours."

	para "Tu devrais tester"
	line "ton habileté dans"
	cont "ces ARENES."

	para "Je vais m'entraî-"
	line "ner plus dur pour"

	para "devenir le plus"
	line "grand!"
	done

BirdKeeperRodSeenText:
	text "Le mot clé est..."
	line "Le cran!"

	para "Ceux d'ici s'en-"
	line "traînent nuit et"

	para "jour pour devenir"
	line "maître des"
	cont "#MON volants."

	para "Allez!"
	done

BirdKeeperRodBeatenText:
	text "Yaaah!"
	done

BirdKeeperRodAfterBattleText:
	text "L'habileté"
	line "d'ALBERT est"
	cont "bien réelle!"

	para "Si tu as les"
	line "chevilles qui"
	cont "enflent, change"
	cont "de baskets!"
	done

BirdKeeperAbeSeenText:
	text "Montre-moi si tu"
	line "as les épaules"
	cont "pour battre"
	cont "ALBERT!"
	done

BirdKeeperAbeBeatenText:
	text "Saperlipopette!"
	line "C'est impossible!"
	done

BirdKeeperAbeAfterBattleText:
	text "C'est pathétique"
	line "de perdre contre"
	cont "toi..."
	done

VioletGymGuideText:
	text "Hé toi! Je ne"
	line "suis pas un"
	cont "dresseur mais"
	cont "je peux te donner"
	cont "quelques conseils!"

	para "Crois-moi!"
	line "Tes rêves de"

	para "star peuvent"
	line "se réaliser."

	para "T'y crois?"
	line "Alors écoute bien."

	para "Les plantes sont"
	line "faibles contre les"

	para "volants. Garde ça"
	line "en mémoire."
	done

VioletGymGuideWinText:
	text "Beau combat! Ne"
	line "lâche pas prise et"

	para "tu deviendras sans"
	line "problème une"
	cont "star!"
	done

VioletGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 15, VIOLET_CITY, 2
	warp_event  5, 15, VIOLET_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 13, BGEVENT_READ, VioletGymStatue
	bg_event  6, 13, BGEVENT_READ, VioletGymStatue

	def_object_events
	object_event  5,  1, SPRITE_FALKNER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, VioletGymFalknerScript, -1
	object_event  7,  6, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperRod, -1
	object_event  2, 10, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 2, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperAbe, -1
	object_event  7, 13, SPRITE_GYM_GUIDE, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VioletGymGuideScript, -1
