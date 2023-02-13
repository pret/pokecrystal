	object_const_def
	const DRAGONSHRINE_ELDER1
	const DRAGONSHRINE_ELDER2
	const DRAGONSHRINE_ELDER3
	const DRAGONSHRINE_CLAIR

DragonShrine_MapScripts:
	def_scene_scripts
	scene_script DragonShrineTakeTestScene, SCENE_DRAGONSHRINE_TAKE_TEST
	scene_script DragonShrineNoopScene,     SCENE_DRAGONSHRINE_NOOP

	def_callbacks

DragonShrineTakeTestScene:
	sdefer DragonShrineTakeTestScript
	end

DragonShrineNoopScene:
	end

DragonShrineTakeTestScript:
	applymovement PLAYER, DragonShrinePlayerWalkInMovement
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderStepDownMovement
	opentext
	writetext DragonShrineElderGreetingText
	promptbutton
.Question1:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	writetext DragonShrineQuestion1Text
	promptbutton
	loadmenu DragonShrineQuestion1_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
	end

.Question2:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	writetext DragonShrineQuestion2Text
	promptbutton
	loadmenu DragonShrineQuestion2_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.Question3:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	writetext DragonShrineQuestion3Text
	promptbutton
	loadmenu DragonShrineQuestion3_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .RightAnswer
.Question4:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	writetext DragonShrineQuestion4Text
	promptbutton
	loadmenu DragonShrineQuestion4_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .RightAnswer
	ifequal 2, .WrongAnswer
	ifequal 3, .RightAnswer
.Question5:
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	writetext DragonShrineQuestion5Text
	promptbutton
	loadmenu DragonShrineQuestion5_MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .WrongAnswer
	ifequal 2, .RightAnswer
	ifequal 3, .WrongAnswer
.RightAnswer:
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .PassedTheTest
	writetext DragonShrineRightAnswerText
	promptbutton
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question2
.WrongAnswer:
	closetext
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineWrongAnswerText1
	waitbutton
	closetext
	turnobject DRAGONSHRINE_ELDER1, DOWN
	opentext
	writetext DragonShrineWrongAnswerText2
	waitbutton
	closetext
	setevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_6
	iftrue .Question5
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_5
	iftrue .Question4
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_4
	iftrue .Question3
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_3
	iftrue .Question2
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_2
	iftrue .Question1
.PassedTheTest:
	writetext DragonShrinePassedTestText
	waitbutton
	closetext
	playsound SFX_ENTER_DOOR
	showemote EMOTE_SHOCK, PLAYER, 15
	playmusic MUSIC_CLAIR
	appear DRAGONSHRINE_CLAIR
	waitsfx
	turnobject PLAYER, DOWN
	pause 30
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkInMovement
	turnobject DRAGONSHRINE_CLAIR, RIGHT
	turnobject PLAYER, LEFT
	turnobject DRAGONSHRINE_ELDER1, LEFT
	opentext
	writetext DragonShrineClairYouPassedText
	waitbutton
	closetext
	special FadeOutMusic
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairBigStepLeftMovement
	opentext
	writetext DragonShrineClairThatCantBeText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairSlowStepLeftMovement
	opentext
	writetext DragonShrineClairYoureLyingText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkToClairMovement
	turnobject DRAGONSHRINE_CLAIR, UP
	opentext
	writetext DragonShrineMustIInformLanceText
	waitbutton
	closetext
	showemote EMOTE_SHOCK, DRAGONSHRINE_CLAIR, 15
	opentext
	writetext DragonShrineIUnderstandText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairTwoSlowStepsRightMovement
	opentext
	writetext DragonShrineHereRisingBadgeText
	waitbutton
	setflag ENGINE_RISINGBADGE
	playsound SFX_GET_BADGE
	waitsfx
	special RestartMapMusic
	specialphonecall SPECIALCALL_MASTERBALL
	setscene SCENE_DRAGONSHRINE_NOOP
	setmapscene DRAGONS_DEN_B1F, SCENE_DRAGONSDENB1F_CLAIR_GIVES_TM
	writetext DragonShrinePlayerReceivedRisingBadgeText
	promptbutton
	writetext DragonShrineRisingBadgeExplanationText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway1Movement
	turnobject DRAGONSHRINE_CLAIR, UP
	applymovement DRAGONSHRINE_ELDER1, DragonShrineElderWalkAway2Movement
	turnobject PLAYER, UP
	opentext
	writetext DragonShrineElderScoldsClairText
	waitbutton
	closetext
	opentext
	writetext DragonShrineSpeechlessText
	waitbutton
	closetext
	applymovement DRAGONSHRINE_CLAIR, DragonShrineClairWalkOutMovement
	playsound SFX_ENTER_DOOR
	disappear DRAGONSHRINE_CLAIR
	waitsfx
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	end

DragonShrineElder1Script:
	faceplayer
	opentext
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	iftrue .DontGiveDratiniYet
	checkevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	iftrue .ReceivedDratini
	checkevent EVENT_GOT_DRATINI
	iffalse .GiveDratini
	checkevent EVENT_BEAT_RIVAL_IN_MT_MOON
	iftrue .BeatRivalInMtMoon
	writetext DragonShrineClairsGrandfatherText
	waitbutton
	closetext
	end

.GiveDratini:
	writetext DragonShrineTakeThisDratiniText
	waitbutton
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	writetext DragonShrinePlayerReceivedDratiniText
	playsound SFX_CAUGHT_MON
	waitsfx
	givepoke DRATINI, 15
	checkevent EVENT_ANSWERED_DRAGON_MASTER_QUIZ_WRONG
	special GiveDratini
	setevent EVENT_GOT_DRATINI
	setevent EVENT_TEMPORARY_UNTIL_MAP_RELOAD_7
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

.PartyFull:
	writetext DragonShrinePartyFullText
	waitbutton
	closetext
	end

.BeatRivalInMtMoon:
	writetext DragonShrineRivalIsInTrainingText
	waitbutton
	closetext
	end

.DontGiveDratiniYet:
	writetext DragonShrineComeAgainText
	waitbutton
	closetext
	end

.ReceivedDratini:
	writetext DragonShrineSymbolicDragonText
	waitbutton
	closetext
	end

DragonShrineElder2Script:
	faceplayer
	opentext
	writetext DragonShrineElder2Text
	waitbutton
	closetext
	end

DragonShrineElder3Script:
	faceplayer
	opentext
	writetext DragonShrineElder3Text
	waitbutton
	closetext
	end

DragonShrineQuestion1_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 10, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Copain@"
	db "Esclave@"
	db "Ami@"

DragonShrineQuestion2_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 5, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Stratégie@"
	db "Entraînement@"
	db "Triche@"

DragonShrineQuestion3_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 4, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Dres. faible@"
	db "Dres. fort@"
	db "N'importe qui@"

DragonShrineQuestion4_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Amour@"
	db "Violence@"
	db "Savoir@"

DragonShrineQuestion5_MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 9, 4, SCREEN_WIDTH - 1, TEXTBOX_Y - 1
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR | STATICMENU_DISABLE_B ; flags
	db 3 ; items
	db "Puissant@"
	db "Les deux@"
	db "Faible@"

DragonShrinePlayerWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step RIGHT
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineElderStepDownMovement:
	slow_step DOWN
	step_end

DragonShrineElderWalkToClairMovement:
	slow_step LEFT
	slow_step LEFT
	slow_step LEFT
	turn_head DOWN
	step_end

DragonShrineElderWalkAway1Movement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineElderWalkAway2Movement:
	slow_step RIGHT
	turn_head DOWN
	step_end

DragonShrineClairWalkInMovement:
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

DragonShrineClairBigStepLeftMovement:
	fix_facing
	big_step LEFT
	step_end

DragonShrineClairSlowStepLeftMovement:
	slow_step LEFT
	remove_fixed_facing
	step_end

DragonShrineClairTwoSlowStepsRightMovement:
	slow_step RIGHT
	slow_step RIGHT
	step_end

DragonShrineClairWalkOutMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DragonShrineElderGreetingText:
	text "Hmm..."
	line "Bienvenue."

	para "Ne parle pas."

	para "SANDRA t'a dit de"
	line "venir, non?"

	para "Coriace la petite,"
	line "non?"

	para "Je dois te mettre"
	line "à l'épreuve."

	para "Tu ne dois répon-"
	line "dre qu'à quelques"
	cont "questions."

	para "On commence?"
	done

DragonShrineQuestion1Text:
	text "Que représente un"
	line "#MON à tes"
	cont "yeux?"
	done

DragonShrineQuestion2Text:
	text "Qu'est-ce qui aide"
	line "à gagner les"
	cont "combats?"
	done

DragonShrineQuestion3Text:
	text "Quel type de"
	line "dresseur veux-tu"
	cont "affronter?"
	done

DragonShrineQuestion4Text:
	text "Quelle est la cho-"
	line "se la plus impor-"
	cont "tante en entraî-"
	cont "nant les #MON?"
	done

DragonShrineQuestion5Text:
	text "#MON puissant."
	line "#MON faible."

	para "Lequel est le plus"
	line "important?"
	done

DragonShrinePassedTestText:
	text "Hmm... Je vois..."

	para "Tu as de vrais"
	line "sentiments pour"
	cont "les #MON."

	para "C'est bien ça."

	para "C'est très impor-"
	line "tant!"

	para "<PLAYER>, ne"
	line "change jamais."

	para "Cela t'aidera"
	line "pour la LIGUE"
	cont "#MON."
	done

DragonShrineMustIInformLanceText:
	text "SANDRA!"

	para "C'est un bon"
	line "élément..."

	para "Admets ta défaite"
	line "et donne ton"
	cont "BADGE LEVER!"

	para "...Ou dois-je en"
	line "informer PETER?"
	done

DragonShrineElderScoldsClairText:
	text "SANDRA..."

	para "Penche-toi sur"
	line "tes lacunes..."

	para "Prends exemple sur"
	line "<PLAYER>."
	done

DragonShrineComeAgainText:
	text "N'hésite pas à"
	line "revenir en ce"
	cont "saint lieu."
	done

DragonShrineTakeThisDratiniText:
	text "Hmm..."
	line "Bienvenue."

	para "Tu tombes au bon"
	line "moment."

	para "J'ai quelque chose"
	line "pour toi."

	para "Ce MINIDRACO est"
	line "la preuve de ta"
	cont "valeur..."
	done

DragonShrinePlayerReceivedDratiniText:
	text "<PLAYER> reçoit"
	line "MINIDRACO!"
	done

DragonShrinePartyFullText:
	text "Hmm? Ton équipe"
	line "est pleine."
	done

DragonShrineSymbolicDragonText:
	text "Les #MON dra-"
	line "gons représentent"
	cont "notre clan."

	para "Tu es digne d'en"
	line "posséder un."
	done

DragonShrineClairsGrandfatherText:
	text "SANDRA a appris"
	line "quelque chose en"
	cont "te connaissant."

	para "Etant son grand-"
	line "père, je te"
	cont "remercie."
	done

DragonShrineRivalIsInTrainingText:
	text "Un garçon de ton"
	line "âge s'entraîne"
	cont "ici."

	para "Il est comme l'é-"
	line "tait SANDRA plus"

	para "jeune. Je suis"
	line "très inquiet..."
	done

DragonShrineWrongAnswerText1:
	text "Hein? J'ai pas"
	line "tout compris..."
	done

DragonShrineWrongAnswerText2:
	text "Qu'as-tu dit?"
	done

DragonShrineRightAnswerText:
	text "Oh, je vois..."
	done

DragonShrineElder2Text:
	text "Cela fait long-"
	line "temps que notre"

	para "MAITRE n'a pas"
	line "cautionné un"
	cont "dresseur."

	para "Pas une seule fois"
	line "depuis PETER."
	done

DragonShrineElder3Text:
	text "Tu connais"
	line "Maître PETER?"

	para "Il ressemble à"
	line "notre MAITRE étant"
	cont "jeune."

	para "C'est dans leur"
	line "sang."
	done

DragonShrineClairYouPassedText:
	text "Comment c'était?"

	para "Je ne vois pas"
	line "pourquoi je deman-"
	cont "de..."

	para "Tu as échoué,"
	line "n'est-ce pas?"

	para "<……><……><……><……><……><……>"

	para "...Quoi? Réussi?"
	done

DragonShrineClairThatCantBeText:
	text "Y'a maldonne!"
	done

DragonShrineClairYoureLyingText:
	text "Tu mens!"

	para "Même moi j'ai pas"
	line "réussi!"
	done

DragonShrineIUnderstandText:
	text "Je... Je vois."
	done

DragonShrineHereRisingBadgeText:
	text "Tiens, voilà le"
	line "BADGE LEVER..."

	para "Allez! Prends-le!"
	done

DragonShrinePlayerReceivedRisingBadgeText:
	text "<PLAYER> reçoit"
	line "le BADGE LEVER."
	done

DragonShrineRisingBadgeExplanationText:
	text "Le BADGE LEVER"
	line "permet à tes"

	para "#MON de lancer"
	line "une capacité pour"
	cont "escalader les"
	cont "cascades."

	para "De plus, tous les"
	line "#MON t'obéiront"

	para "au doigt et à"
	line "l'oeil."
	done

DragonShrineSpeechlessText:
	text "<……><……><……><……><……><……>"
	done

DragonShrine_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  9, DRAGONS_DEN_B1F, 2
	warp_event  5,  9, DRAGONS_DEN_B1F, 2

	def_coord_events

	def_bg_events

	def_object_events
	object_event  5,  1, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder1Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  2,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder2Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  7,  4, SPRITE_ELDER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DragonShrineElder3Script, EVENT_TEMPORARY_UNTIL_MAP_RELOAD_1
	object_event  4,  8, SPRITE_CLAIR, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DRAGON_SHRINE_CLAIR
