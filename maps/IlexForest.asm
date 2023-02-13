	object_const_def
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_YOUNGSTER1
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_YOUNGSTER2
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScripts:
	def_scene_scripts

	def_callbacks
	callback MAPCALLBACK_OBJECTS, IlexForestFarfetchdCallback

IlexForestFarfetchdCallback:
	checkevent EVENT_GOT_HM01_CUT
	iftrue .Static
	readmem wFarfetchdPosition
	ifequal  1, .PositionOne
	ifequal  2, .PositionTwo
	ifequal  3, .PositionThree
	ifequal  4, .PositionFour
	ifequal  5, .PositionFive
	ifequal  6, .PositionSix
	ifequal  7, .PositionSeven
	ifequal  8, .PositionEight
	ifequal  9, .PositionNine
	ifequal 10, .PositionTen
.Static:
	endcallback

.PositionOne:
	moveobject ILEXFOREST_FARFETCHD, 14, 31
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTwo:
	moveobject ILEXFOREST_FARFETCHD, 15, 25
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionThree:
	moveobject ILEXFOREST_FARFETCHD, 20, 24
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFour:
	moveobject ILEXFOREST_FARFETCHD, 29, 22
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionFive:
	moveobject ILEXFOREST_FARFETCHD, 28, 31
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSix:
	moveobject ILEXFOREST_FARFETCHD, 24, 35
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionSeven:
	moveobject ILEXFOREST_FARFETCHD, 22, 31
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionEight:
	moveobject ILEXFOREST_FARFETCHD, 15, 29
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionNine:
	moveobject ILEXFOREST_FARFETCHD, 10, 35
	appear ILEXFOREST_FARFETCHD
	endcallback

.PositionTen:
	moveobject ILEXFOREST_FARFETCHD, 6, 28
	appear ILEXFOREST_FARFETCHD
	endcallback

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iftrue .DoneFarfetchd
	writetext IlexForestApprenticeIntroText
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext IlexForestApprenticeAfterText
	waitbutton
	closetext
	end

IlexForestFarfetchdScript:
	readmem wFarfetchdPosition
	ifequal  1, .Position1
	ifequal  2, .Position2
	ifequal  3, .Position3
	ifequal  4, .Position4
	ifequal  5, .Position5
	ifequal  6, .Position6
	ifequal  7, .Position7
	ifequal  8, .Position8
	ifequal  9, .Position9
	ifequal 10, .Position10

.Position1:
	faceplayer
	opentext
	writetext Text_ItsTheMissingPokemon
	promptbutton
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos1_Pos2
	moveobject ILEXFOREST_FARFETCHD, 15, 25
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 2
	end

.Position2:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position2_Down
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos3
	moveobject ILEXFOREST_FARFETCHD, 20, 24
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 3
	end

.Position2_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos2_Pos8
	moveobject ILEXFOREST_FARFETCHD, 15, 29
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 8
	end

.Position3:
	scall .CryAndCheckFacing
	ifequal LEFT, .Position3_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos4
	moveobject ILEXFOREST_FARFETCHD, 29, 22
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 4
	end

.Position3_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos3_Pos2
	moveobject ILEXFOREST_FARFETCHD, 15, 25
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 2
	end

.Position4:
	scall .CryAndCheckFacing
	ifequal UP, .Position4_Up
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos5
	moveobject ILEXFOREST_FARFETCHD, 28, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 5
	end

.Position4_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos4_Pos3
	moveobject ILEXFOREST_FARFETCHD, 20, 24
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 3
	end

.Position5:
	scall .CryAndCheckFacing
	ifequal UP, .Position5_Up
	ifequal LEFT, .Position5_Left
	ifequal RIGHT, .Position5_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos6
	moveobject ILEXFOREST_FARFETCHD, 24, 35
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 6
	end

.Position5_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetchd_Pos5_Pos7
	moveobject ILEXFOREST_FARFETCHD, 22, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 7
	end

.Position5_Up:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Up
	moveobject ILEXFOREST_FARFETCHD, 29, 22
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 4
	end

.Position5_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos5_Pos4_Right
	moveobject ILEXFOREST_FARFETCHD, 29, 22
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 4
	end

.Position6:
	scall .CryAndCheckFacing
	ifequal RIGHT, .Position6_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos7
	moveobject ILEXFOREST_FARFETCHD, 22, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 7
	end

.Position6_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos6_Pos5
	moveobject ILEXFOREST_FARFETCHD, 28, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 5
	end

.Position7:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position7_Down
	ifequal LEFT, .Position7_Left
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos8
	moveobject ILEXFOREST_FARFETCHD, 15, 29
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 8
	end

.Position7_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos6
	moveobject ILEXFOREST_FARFETCHD, 24, 35
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 6
	end

.Position7_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos7_Pos5
	moveobject ILEXFOREST_FARFETCHD, 28, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 5
	end

.Position8:
	scall .CryAndCheckFacing
	ifequal UP, .Position8_Up
	ifequal LEFT, .Position8_Left
	ifequal RIGHT, .Position8_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos9
	moveobject ILEXFOREST_FARFETCHD, 10, 35
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 9
	end

.Position8_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos7
	moveobject ILEXFOREST_FARFETCHD, 22, 31
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 7
	end

.Position8_Up:
.Position8_Left:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos8_Pos2
	moveobject ILEXFOREST_FARFETCHD, 15, 25
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 2
	end

.Position9:
	scall .CryAndCheckFacing
	ifequal DOWN, .Position9_Down
	ifequal RIGHT, .Position9_Right
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos10
	moveobject ILEXFOREST_FARFETCHD, 6, 28
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 10
	appear ILEXFOREST_BLACK_BELT
	setevent EVENT_CHARCOAL_KILN_BOSS
	setevent EVENT_HERDED_FARFETCHD
	end

.Position9_Right:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Right
	moveobject ILEXFOREST_FARFETCHD, 15, 29
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 8
	end

.Position9_Down:
	applymovement ILEXFOREST_FARFETCHD, MovementData_Farfetched_Pos9_Pos8_Down
	moveobject ILEXFOREST_FARFETCHD, 15, 29
	disappear ILEXFOREST_FARFETCHD
	appear ILEXFOREST_FARFETCHD
	loadmem wFarfetchdPosition, 8
	end

.Position10:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	end

.CryAndCheckFacing:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	cry FARFETCH_D
	waitbutton
	closetext
	readvar VAR_FACING
	end

IlexForestCharcoalMasterScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_HM01_CUT
	iftrue .AlreadyGotCut
	writetext Text_CharcoalMasterIntro
	promptbutton
	verbosegiveitem HM_CUT
	setevent EVENT_GOT_HM01_CUT
	writetext Text_CharcoalMasterOutro
	waitbutton
	closetext
	setevent EVENT_ILEX_FOREST_FARFETCHD
	setevent EVENT_ILEX_FOREST_APPRENTICE
	setevent EVENT_ILEX_FOREST_CHARCOAL_MASTER
	clearevent EVENT_CHARCOAL_KILN_FARFETCH_D
	clearevent EVENT_CHARCOAL_KILN_APPRENTICE
	clearevent EVENT_CHARCOAL_KILN_BOSS
	end

.AlreadyGotCut:
	writetext Text_CharcoalMasterTalkAfter
	waitbutton
	closetext
	end

IlexForestHeadbuttGuyScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM02_HEADBUTT
	iftrue .AlreadyGotHeadbutt
	writetext Text_HeadbuttIntro
	promptbutton
	verbosegiveitem TM_HEADBUTT
	iffalse .BagFull
	setevent EVENT_GOT_TM02_HEADBUTT
.AlreadyGotHeadbutt:
	writetext Text_HeadbuttOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerBugCatcherWayne:
	trainer BUG_CATCHER, WAYNE, EVENT_BEAT_BUG_CATCHER_WAYNE, BugCatcherWayneSeenText, BugCatcherWayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherWayneAfterBattleText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ANTIDOTE

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	hiddenitem ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem SUPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder: ; unreferenced
	jumpstd StrengthBoulderScript

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	sjump .DontDoCelebiEvent

.ForestIsRestless:
	checkitem GS_BALL
	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special FadeOutMusic
	applymovement PLAYER, IlexForestPlayerStepsDownMovement
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	clearflag ENGINE_FOREST_IS_RESTLESS
	special CelebiShrineEvent
	loadwildmon CELEBI, 30
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckCaughtCelebi
	iffalse .DidntCatchCelebi
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, IlexForestKurtStepsUpMovement
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, IlexForestKurtStepsDownMovement
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_Farfetchd_Pos1_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetchd_Pos2_Pos3:
	big_step UP
	big_step UP
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos2_Pos8:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos3_Pos4:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetchd_Pos3_Pos2:
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos4_Pos5:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetchd_Pos4_Pos3:
	big_step LEFT
	jump_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos6:
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetchd_Pos5_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos5_Pos4_Up:
	big_step UP
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	step_end

MovementData_Farfetched_Pos5_Pos4_Right:
	big_step RIGHT
	turn_head UP
	step_sleep 1
	turn_head DOWN
	step_sleep 1
	turn_head UP
	step_sleep 1
	big_step DOWN
	big_step DOWN
	fix_facing
	jump_step UP
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos7:
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step RIGHT
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos6_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos7_Pos8:
	big_step UP
	big_step UP
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	big_step LEFT
	step_end

MovementData_Farfetched_Pos7_Pos6:
	big_step DOWN
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos7_Pos5:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos9:
	big_step DOWN
	big_step LEFT
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	big_step DOWN
	step_end

MovementData_Farfetched_Pos8_Pos7:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	step_end

MovementData_Farfetched_Pos8_Pos2:
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos10:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step LEFT
	big_step LEFT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Right:
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

MovementData_Farfetched_Pos9_Pos8_Down:
	big_step LEFT
	big_step LEFT
	fix_facing
	jump_step RIGHT
	step_sleep 8
	step_sleep 8
	remove_fixed_facing
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step RIGHT
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	big_step UP
	step_end

IlexForestKurtStepsUpMovement:
	step UP
	step UP
	step UP
	step UP
	step_end

IlexForestKurtStepsDownMovement:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

IlexForestPlayerStepsDownMovement:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

IlexForestApprenticeIntroText:
	text "Houlà... Mon chef"
	line "va être super"
	cont "furax!"

	para "Le CANARTICHO qui"
	line "COUPE des arbres"

	para "pour faire du"
	line "charbon est parti."

	para "Je peux pas le"
	line "chercher dans le"
	cont "BOIS AUX CHENES."

	para "Parce que..."
	line "J'ai peur..."
	done

IlexForestApprenticeAfterText:
	text "Woah! Merci"
	line "beaucoup!"

	para "Le #MON de mon"
	line "chef n'obéit pas"
	cont "parce que je n'ai"
	cont "pas le bon BADGE."
	done

Text_ItsTheMissingPokemon:
	text "C'est le #MON"
	line "perdu!"
	done

Text_Kwaaaa:
	text "CANARTICHO: Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "Ah! CANARTICHO!"

	para "Tu nous l'as"
	line "retrouvé?"

	para "Sans lui, on ne"
	line "peut pas COUPER"

	para "les arbres pour"
	line "faire du charbon."

	para "Merci!"

	para "Bon. Comment te"
	line "remercier..."

	para "Je sais!"
	line "Prends ceci."
	done

Text_CharcoalMasterOutro:
	text "C'est la CS COUPE."
	line "Apprends-la à un"

	para "#MON pour cou-"
	line "per les buissons."

	para "Il te faut le"
	line "BADGE de l'ARENE"

	para "d'ECORCIA pour"
	line "l'utiliser."
	done

Text_CharcoalMasterTalkAfter:
	text "Veux-tu devenir"
	line "pro du charbon"
	cont "comme moi?"

	para "Tu verras, c'est"
	line "cool!"
	done

Text_HeadbuttIntro:
	text "Ce que je fais?"

	para "Je secoue les"
	line "arbres avec le"
	cont "COUP D'BOULE."

	para "C'est marrant."
	line "Tiens, essaie!"
	done

Text_HeadbuttOutro:
	text "Cogne les arbres"
	line "avec un COUP"
	cont "D'BOULE et des"
	cont "#MON endormis"
	cont "tomberont parfois."
	done

Text_IlexForestLass:
	text "Est-il arrivé"
	line "quelque chose au"
	cont "gardien de la"
	cont "forêt?"
	done

IlexForestSignpostText:
	text "Le BOIS AUX CHENES"
	line "est si dense que"

	para "les feuilles ca-"
	line "chent le ciel."

	para "Faites attention"
	line "aux objets laissés"
	cont "sur le sol."
	done

Text_IlexForestShrine:
	text "AUTEL du"
	line "BOIS AUX CHENES..."

	para "En l'honneur du"
	line "protecteur de la"
	cont "forêt..."
	done

Text_ShrineCelebiEvent:
	text "AUTEL du"
	line "BOIS AUX CHENES..."

	para "C'est en l'honneur"
	line "du gardien de la"
	cont "forêt..."

	para "Oh? C'est quoi ça?"

	para "Il y a un trou."
	line "On dirait que la"

	para "GS BALL peut y"
	line "entrer."

	para "Déposer la"
	line "GS BALL?"
	done

Text_InsertGSBall:
	text "<PLAYER> dépose"
	line "la GS BALL."
	done

Text_KurtCaughtCelebi:
	text "Alors ça!"

	para "<PLAYER>, c'était"
	line "génial. Merci!"

	para "Les légendes sur"
	line "cet AUTEL étaient"
	cont "donc vraies."

	para "Tout ceci est"
	line "fantastique."

	para "Je vais faire de"
	line "meilleures BALLS!"

	para "Au revoir!"
	done

BugCatcherWayneSeenText:
	text "Ah! Tu m'as fait"
	line "peur!"

	para "Tu as fait fuir"
	line "un #MON!"
	done

BugCatcherWayneBeatenText:
	text "Je n'avais encore"
	line "jamais vu ce"
	cont "#MON..."
	done

BugCatcherWayneAfterBattleText:
	text "Un #MON que je"
	line "n'avais jamais vu"

	para "est tombé d'un"
	line "arbre après avoir"
	cont "utilisé COUP"
	cont "D'BOULE."

	para "Je devrais faire"
	line "ça plus souvent."
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  1,  5, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  3, 42, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  3, 43, ILEX_FOREST_AZALEA_GATE, 2

	def_coord_events

	def_bg_events
	bg_event  3, 17, BGEVENT_READ, IlexForestSignpost
	bg_event 11,  7, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 22, 14, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event  1, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event  8, 22, BGEVENT_UP, IlexForestShrineScript

	def_object_events
	object_event 14, 31, SPRITE_BIRD, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	object_event  7, 28, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalApprenticeScript, EVENT_ILEX_FOREST_APPRENTICE
	object_event  5, 28, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestCharcoalMasterScript, EVENT_ILEX_FOREST_CHARCOAL_MASTER
	object_event 15, 14, SPRITE_ROCKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestHeadbuttGuyScript, -1
	object_event 20, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	object_event  8, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  3, 24, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestLassScript, EVENT_ILEX_FOREST_LASS
	object_event 12,  1, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerBugCatcherWayne, -1
	object_event  9, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	object_event 17,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	object_event 27,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
