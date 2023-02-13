	object_const_def
	const CIANWOODGYM_CHUCK
	const CIANWOODGYM_BLACK_BELT1
	const CIANWOODGYM_BLACK_BELT2
	const CIANWOODGYM_BLACK_BELT3
	const CIANWOODGYM_BLACK_BELT4
	const CIANWOODGYM_BOULDER1
	const CIANWOODGYM_BOULDER2
	const CIANWOODGYM_BOULDER3
	const CIANWOODGYM_BOULDER4

CianwoodGym_MapScripts:
	def_scene_scripts

	def_callbacks

CianwoodGymChuckScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_CHUCK
	iftrue .FightDone
	writetext ChuckIntroText1
	waitbutton
	closetext
	turnobject CIANWOODGYM_CHUCK, RIGHT
	opentext
	writetext ChuckIntroText2
	waitbutton
	closetext
	applymovement CIANWOODGYM_BOULDER1, CianwoodGymMovement_ChuckChucksBoulder
	playsound SFX_STRENGTH
	earthquake 80
	disappear CIANWOODGYM_BOULDER1
	pause 30
	faceplayer
	opentext
	writetext ChuckIntroText3
	waitbutton
	closetext
	winlosstext ChuckLossText, 0
	loadtrainer CHUCK, CHUCK1
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_CHUCK
	opentext
	writetext GetStormBadgeText
	playsound SFX_GET_BADGE
	waitsfx
	setflag ENGINE_STORMBADGE
	readvar VAR_BADGES
	scall CianwoodGymActivateRockets
.FightDone:
	checkevent EVENT_GOT_TM01_DYNAMICPUNCH
	iftrue .AlreadyGotTM
	setevent EVENT_BEAT_BLACKBELT_YOSHI
	setevent EVENT_BEAT_BLACKBELT_LAO
	setevent EVENT_BEAT_BLACKBELT_NOB
	setevent EVENT_BEAT_BLACKBELT_LUNG
	writetext ChuckExplainBadgeText
	promptbutton
	verbosegiveitem TM_DYNAMICPUNCH
	iffalse .BagFull
	setevent EVENT_GOT_TM01_DYNAMICPUNCH
	writetext ChuckExplainTMText
	waitbutton
	closetext
	end

.AlreadyGotTM:
	writetext ChuckAfterText
	waitbutton
.BagFull:
	closetext
	end

CianwoodGymActivateRockets:
	ifequal 7, .RadioTowerRockets
	ifequal 6, .GoldenrodRockets
	end

.GoldenrodRockets:
	jumpstd GoldenrodRocketsScript

.RadioTowerRockets:
	jumpstd RadioTowerRocketsScript

TrainerBlackbeltYoshi:
	trainer BLACKBELT_T, YOSHI, EVENT_BEAT_BLACKBELT_YOSHI, BlackbeltYoshiSeenText, BlackbeltYoshiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltYoshiAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLao:
	trainer BLACKBELT_T, LAO, EVENT_BEAT_BLACKBELT_LAO, BlackbeltLaoSeenText, BlackbeltLaoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLaoAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltNob:
	trainer BLACKBELT_T, NOB, EVENT_BEAT_BLACKBELT_NOB, BlackbeltNobSeenText, BlackbeltNobBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltNobAfterText
	waitbutton
	closetext
	end

TrainerBlackbeltLung:
	trainer BLACKBELT_T, LUNG, EVENT_BEAT_BLACKBELT_LUNG, BlackbeltLungSeenText, BlackbeltLungBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BlackbeltLungAfterText
	waitbutton
	closetext
	end

CianwoodGymBoulder:
	jumpstd StrengthBoulderScript

CianwoodGymStatue:
	checkflag ENGINE_STORMBADGE
	iftrue .Beaten
	jumpstd GymStatue1Script
.Beaten:
	gettrainername STRING_BUFFER_4, CHUCK, CHUCK1
	jumpstd GymStatue2Script

CianwoodGymMovement_ChuckChucksBoulder:
	set_sliding
	big_step LEFT
	big_step UP
	fast_jump_step RIGHT
	remove_sliding
	step_end

ChuckIntroText1:
	text "WAHAHAH!"

	para "Te voilà toi!"
	line "Laisse-moi te dire"
	cont "que je suis une"
	cont "bête!"

	para "Mes #MON"
	line "explosent la roche"
	cont "et fracassent les"
	cont "os!"

	para "Regarde ça!"
	done

ChuckIntroText2:
	text "CHUCK: Blurrp!"
	line "............."

	para "Aaaarrgh!"
	done

ChuckIntroText3:
	text "Alors t'as peur ou"
	line "faut crier plus"
	cont "fort?"

	para "De quoi?"
	line "Ca n'a rien à voir"

	para "avec les #MON?"
	line "Je sais!"

	para "Allez, en position"
	line "pour la bataille!"
	done

ChuckLossText:
	text "Hein? Koi? Méheeuu"
	line "j'ai pas gagné là?"

	para "A propos, je peux"
	line "te dire un truc?"
	cont "Je pense que tu"
	cont "mérites le bon"
	cont "vieux BADGE CHOC!"
	done

GetStormBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE CHOC."
	done

ChuckExplainBadgeText:
	text "Avec le BADGE CHOC"
	line "tous les #MON"

	para "jusqu'au niveau 70"
	line "et même les échan-"
	cont "gés t'obéiront."

	para "Il permet aussi à"
	line "tes #MON"

	para "d'utiliser VOL"
	line "hors des combats."

	para "Tiens, attrape ça!"
	done

ChuckExplainTMText:
	text "C'est DYNAMOPOING."

	para "Ca ne touche pas"
	line "toujours mais"

	para "lorsque le coup"
	line "est porté, il"
	cont "entraîne la confu-"
	cont "sion!"
	done

ChuckAfterText:
	text "WAHAHAH! J'ai aimé"
	line "me battre contre"
	cont "toi!"

	para "Mais une défaite"
	line "signifie le plus"
	cont "souvent qu'on a"
	cont "perdu!"

	para "Donc dorénavant je"
	line "vais m'entraîner"
	cont "24 heures sur 24!"
	done

BlackbeltYoshiSeenText:
	text "Mes #MON et moi"
	line "sommes liés par"
	cont "une grande amitié."

	para "Notre liaison ne"
	line "mourra jamais!"
	done

BlackbeltYoshiBeatenText:
	text "C'est pas vrai!"
	done

BlackbeltYoshiAfterText:
	text "Toi aussi tu"
	line "sembles avoir lié"
	cont "une très forte"
	cont "complicité avec"
	cont "tes #MON!"
	done

BlackbeltLaoSeenText:
	text "Nous autres, les"
	line "vaillants artistes"
	cont "martiaux n'avons"
	cont "peur de rien!"
	cont "Enfin je crois..."
	done

BlackbeltLaoBeatenText:
	text "C'est choquant!"
	done

BlackbeltLaoAfterText:
	text "Les #MON de"
	line "combat sont un"
	cont "peu effrayés par"
	cont "les #MON"
	cont "psy..."
	done

BlackbeltNobSeenText:
	text "Je ne parle pas la"
	line "bouche pleine"
	cont "sinon ça fait"
	cont "heu-gneu-gneu-heu."
	cont "Alors je me sers"
	cont "de mes poings!"
	done

BlackbeltNobBeatenText:
	text "..."
	done

BlackbeltNobAfterText:
	text "Hein? J'ai perdu!"
	line "J'sais pas quoi"
	cont "dire!"
	done

BlackbeltLungSeenText:
	text "Mes poings de ouf"
	line "vont terrasser tes"
	cont "#MON!"
	done

BlackbeltLungBeatenText:
	text "Bon, je suis nul!"
	done

BlackbeltLungAfterText:
	text "Mes #MON ont"
	line "perdu, ma fierté"
	cont "en a pris un coup!"
	done

CianwoodGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 17, CIANWOOD_CITY, 2
	warp_event  5, 17, CIANWOOD_CITY, 2

	def_coord_events

	def_bg_events
	bg_event  3, 15, BGEVENT_READ, CianwoodGymStatue
	bg_event  6, 15, BGEVENT_READ, CianwoodGymStatue

	def_object_events
	object_event  4,  1, SPRITE_CHUCK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CianwoodGymChuckScript, -1
	object_event  2, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltYoshi, -1
	object_event  7, 12, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 3, TrainerBlackbeltLao, -1
	object_event  3,  9, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBlackbeltNob, -1
	object_event  5,  5, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBlackbeltLung, -1
	object_event  5,  1, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  3,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  4,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
	object_event  5,  7, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CianwoodGymBoulder, -1
