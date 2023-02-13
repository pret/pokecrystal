	object_const_def
	const ROUTE29_COOLTRAINER_M1
	const ROUTE29_YOUNGSTER
	const ROUTE29_TEACHER1
	const ROUTE29_FRUIT_TREE
	const ROUTE29_FISHER
	const ROUTE29_COOLTRAINER_M2
	const ROUTE29_TUSCANY
	const ROUTE29_POKE_BALL

Route29_MapScripts:
	def_scene_scripts
	scene_script Route29Noop1Scene, SCENE_ROUTE29_NOOP
	scene_script Route29Noop2Scene, SCENE_ROUTE29_CATCH_TUTORIAL

	def_callbacks
	callback MAPCALLBACK_OBJECTS, Route29TuscanyCallback

Route29Noop1Scene:
	end

Route29Noop2Scene:
	end

Route29TuscanyCallback:
	checkflag ENGINE_ZEPHYRBADGE
	iftrue .DoesTuscanyAppear

.TuscanyDisappears:
	disappear ROUTE29_TUSCANY
	endcallback

.DoesTuscanyAppear:
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, .TuscanyDisappears
	appear ROUTE29_TUSCANY
	endcallback

Route29Tutorial1:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial1
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Route29Tutorial2:
	turnobject ROUTE29_COOLTRAINER_M1, UP
	showemote EMOTE_SHOCK, ROUTE29_COOLTRAINER_M1, 15
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2a
	turnobject PLAYER, LEFT
	setevent EVENT_DUDE_TALKED_TO_YOU
	opentext
	writetext CatchingTutorialIntroText
	yesorno
	iffalse Script_RefusedTutorial2
	closetext
	follow ROUTE29_COOLTRAINER_M1, PLAYER
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	stopfollow
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	turnobject ROUTE29_COOLTRAINER_M1, UP
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setscene SCENE_ROUTE29_NOOP
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

Script_RefusedTutorial1:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData1b
	setscene SCENE_ROUTE29_NOOP
	end

Script_RefusedTutorial2:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	applymovement ROUTE29_COOLTRAINER_M1, DudeMovementData2b
	setscene SCENE_ROUTE29_NOOP
	end

CatchingTutorialDudeScript:
	faceplayer
	opentext
	readvar VAR_BOXSPACE
	ifequal 0, .BoxFull
	checkevent EVENT_LEARNED_TO_CATCH_POKEMON
	iftrue .BoxFull
	checkevent EVENT_GAVE_MYSTERY_EGG_TO_ELM
	iffalse .BoxFull
	writetext CatchingTutorialRepeatText
	yesorno
	iffalse .Declined
	closetext
	loadwildmon RATTATA, 5
	catchtutorial BATTLETYPE_TUTORIAL
	opentext
	writetext CatchingTutorialDebriefText
	waitbutton
	closetext
	setevent EVENT_LEARNED_TO_CATCH_POKEMON
	end

.BoxFull:
	writetext CatchingTutorialBoxFullText
	waitbutton
	closetext
	end

.Declined:
	writetext CatchingTutorialDeclinedText
	waitbutton
	closetext
	end

Route29YoungsterScript:
	jumptextfaceplayer Route29YoungsterText

Route29TeacherScript:
	jumptextfaceplayer Route29TeacherText

Route29FisherScript:
	jumptextfaceplayer Route29FisherText

Route29CooltrainerMScript:
	faceplayer
	opentext
	checktime DAY
	iftrue .day_morn
	checktime NITE
	iftrue .nite
.day_morn
	writetext Route29CooltrainerMText_WaitingForNight
	waitbutton
	closetext
	end

.nite
	writetext Route29CooltrainerMText_WaitingForMorning
	waitbutton
	closetext
	end

TuscanyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	iftrue TuscanyTuesdayScript
	readvar VAR_WEEKDAY
	ifnotequal TUESDAY, TuscanyNotTuesdayScript
	checkevent EVENT_MET_TUSCANY_OF_TUESDAY
	iftrue .MetTuscany
	writetext MeetTuscanyText
	promptbutton
	setevent EVENT_MET_TUSCANY_OF_TUESDAY
.MetTuscany:
	writetext TuscanyGivesGiftText
	promptbutton
	verbosegiveitem PINK_BOW
	iffalse TuscanyDoneScript
	setevent EVENT_GOT_PINK_BOW_FROM_TUSCANY
	writetext TuscanyGaveGiftText
	waitbutton
	closetext
	end

TuscanyTuesdayScript:
	writetext TuscanyTuesdayText
	waitbutton
TuscanyDoneScript:
	closetext
	end

TuscanyNotTuesdayScript:
	writetext TuscanyNotTuesdayText
	waitbutton
	closetext
	end

Route29Sign1:
	jumptext Route29Sign1Text

Route29Sign2:
	jumptext Route29Sign2Text

Route29FruitTree:
	fruittree FRUITTREE_ROUTE_29

Route29Potion:
	itemball POTION

DudeMovementData1a:
	step UP
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData2a:
	step UP
	step UP
	step UP
	step RIGHT
	step RIGHT
	step_end

DudeMovementData1b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

DudeMovementData2b:
	step LEFT
	step LEFT
	step DOWN
	step DOWN
	step DOWN
	step_end

CatchingTutorialBoxFullText:
	text "Les #MON se"
	line "cachent dans"

	para "l'herbe. Ils sur-"
	line "gissent d'un coup."
	cont "Pouf!"
	done

CatchingTutorialIntroText:
	text "J'te connais toi."
	line "Combien de #MON"
	cont "as-tu attrapés?"

	para "Veux-tu que je te"
	line "montre comment at-"
	cont "traper des"
	cont "#MON?"
	done

CatchingTutorialDebriefText:
	text "Voilà comment il"
	line "faut faire."

	para "Si tu affaiblis"
	line "d'abord le #-"
	cont "MON, il sera plus"
	cont "facile à attraper."
	done

CatchingTutorialDeclinedText:
	text "Oh. Bon."

	para "En tout cas, tu"
	line "dois beaucoup mar-"

	para "cher pour attraper"
	line "des #MON."
	done

CatchingTutorialRepeatText:
	text "Hein? Tu veux que"
	line "je te montre com-"
	cont "ment attraper des"
	cont "#MON?"
	done

Route29YoungsterText:
	text "Salut. Comment"
	line "vont tes #MON?"

	para "S'ils sont fati-"
	line "gués ou incapables"

	para "de combattre,"
	line "évite l'herbe!"
	done

Route29TeacherText:
	text "Tu vois ce mur?"
	line "Sauter de là doit"
	cont "faire peur."

	para "Mais tu peux aller"
	line "à BOURG GEON sans"

	para "marcher dans les"
	line "hautes herbes."
	done

Route29FisherText:
	text "J'ai voulu faire"
	line "une pause alors"

	para "j'ai sauvegardé ma"
	line "partie."
	done

Route29CooltrainerMText_WaitingForDay: ; unreferenced
	text "J'attends les"
	line "#MON qui n'ap-"

	para "paraissent que la"
	line "journée."
	done

Route29CooltrainerMText_WaitingForNight:
	text "J'attends les"
	line "#MON qui n'ap-"

	para "paraissent que la"
	line "nuit."
	done

Route29CooltrainerMText_WaitingForMorning:
	text "J'attends les"
	line "#MON qui n'ap-"

	para "paraissent que le"
	line "matin."
	done

MeetTuscanyText:
	text "MARIE: Il me sem-"
	line "ble que c'est la"

	para "première fois que"
	line "l'on se rencontre."

	para "Permets-moi de me"
	line "présenter. Je suis"
	cont "MARIE du mardi."
	done

TuscanyGivesGiftText:
	text "En cadeau..."
	line "Permets-moi"

	para "de t'offrir..."
	line "Un RUBAN ROSE."
	done

TuscanyGaveGiftText:
	text "MARIE: C'est"
	line "ravissant, tu ne"
	cont "trouves pas?"

	para "Il améliore les"
	line "capacités de type"
	cont "NORMAL."

	para "Je suis sûre qu'il"
	line "te sera utile."
	done

TuscanyTuesdayText:
	text "MARIE: As-tu"
	line "rencontré LUCIE,"
	cont "ma grande soeur?"

	para "Ou mon petit frère"
	line "HOMER?"

	para "Je suis la deuxiè-"
	line "me des sept en-"
	cont "fants."
	done

TuscanyNotTuesdayText:
	text "MARIE: Aujourd'hui"
	line "n'est pas mardi."
	cont "C'est dommage..."
	done

Route29Sign1Text:
	text "ROUTE 29"

	para "VILLE GRIOTTE -"
	line "BOURG GEON"
	done

Route29Sign2Text:
	text "ROUTE 29"

	para "VILLE GRIOTTE -"
	line "BOURG GEON"
	done

Route29_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 27,  1, ROUTE_29_ROUTE_46_GATE, 3

	def_coord_events
	coord_event 53,  8, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial1
	coord_event 53,  9, SCENE_ROUTE29_CATCH_TUTORIAL, Route29Tutorial2

	def_bg_events
	bg_event 51,  7, BGEVENT_READ, Route29Sign1
	bg_event  3,  5, BGEVENT_READ, Route29Sign2

	def_object_events
	object_event 50, 12, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CatchingTutorialDudeScript, -1
	object_event 27, 16, SPRITE_YOUNGSTER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29YoungsterScript, -1
	object_event 15, 11, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route29TeacherScript, -1
	object_event 12,  2, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route29FruitTree, -1
	object_event 25,  3, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route29FisherScript, -1
	object_event 13,  4, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, Route29CooltrainerMScript, -1
	object_event 29, 12, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TuscanyScript, EVENT_ROUTE_29_TUSCANY_OF_TUESDAY
	object_event 48,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route29Potion, EVENT_ROUTE_29_POTION
