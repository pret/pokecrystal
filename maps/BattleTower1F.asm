	object_const_def
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScripts:
	def_scene_scripts
	scene_script BattleTower1FCheckStateScene, SCENE_BATTLETOWER1F_CHECKSTATE
	scene_script BattleTower1FNoopScene,       SCENE_BATTLETOWER1F_NOOP

	def_callbacks

BattleTower1FCheckStateScene:
	setval BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $0, .SkipEverything
	ifequal $2, .LeftWithoutSaving
	ifequal $3, .SkipEverything
	ifequal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	sdefer Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	sdefer BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_BATTLETOWER1F_NOOP
	; fallthrough
BattleTower1FNoopScene:
	end

BattleTower1FRulesSign:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse .skip
	writetext Text_BattleTowerRules
	waitbutton
.skip:
	closetext
	end

BattleTower1FReceptionistScript:
	setval BATTLETOWERACTION_GET_CHALLENGE_STATE ; readmem sBattleTowerChallengeState
	special BattleTowerAction
	ifequal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	promptbutton
	setval BATTLETOWERACTION_CHECK_EXPLANATION_READ ; if new save file: bit 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	ifnotequal $0, Script_Menu_ChallengeExplanationCancel
	sjump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel:
	writetext Text_WantToGoIntoABattleRoom
	setval TRUE
	special Menu_ChallengeExplanationCancel
	ifequal 1, Script_ChooseChallenge
	ifequal 2, Script_BattleTowerExplanation
	sjump Script_BattleTowerHopeToServeYouAgain

Script_ChooseChallenge:
	setval BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_SET_EXPLANATION_READ ; set 1, [sBattleTowerSaveFileFlags]
	special BattleTowerAction
	special BattleTowerRoomMenu
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	setval BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	setval BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	sjump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	setval BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_BATTLETOWERBATTLEROOM_ENTER
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_BATTLETOWERELEVATOR_ENTER
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_BATTLETOWERHALLWAY_ENTER
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	setval BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize:
	setval BATTLETOWERACTION_1C
	special BattleTowerAction
	setval BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	ifequal POTION, Script_YourPackIsStuffedFull
	getitemname STRING_BUFFER_4, USE_SCRIPT_VAR
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	setval BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull:
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo:
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation:
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	sjump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

Script_MobileError2: ; unreferenced
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

Script_ChooseChallenge2: ; unreferenced
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setval BATTLETOWERACTION_SET_EXPLANATION_READ
	special BattleTowerAction
	special Function1700ba
	ifequal $a, Script_Menu_ChallengeExplanationCancel
	ifnotequal $0, Script_MobileError
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	turnobject BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	turnobject BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

Script_StartChallenge: ; unreferenced
	setval BATTLETOWERACTION_LEVEL_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_AMonLevelExceeds
	setval BATTLETOWERACTION_UBERS_CHECK
	special BattleTowerAction
	ifnotequal $0, Script_MayNotEnterABattleRoomUnderL70
	special CheckForBattleTowerRules
	ifnotequal FALSE, Script_WaitButton
	setval BATTLETOWERACTION_05
	special BattleTowerAction
	ifequal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	sjump .continue

.zero
	writetext Text_CantBeRegistered
.continue
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_CHECKSTATE
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_BATTLETOWER1F_NOOP
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

Script_ReachedBattleLimit: ; unreferenced
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

Script_AMonLevelExceeds:
	writetext Text_AMonLevelExceeds
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70:
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	sjump Script_Menu_ChallengeExplanationCancel

Script_MobileError:
	special BattleTowerMobileError
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	sjump Script_BattleTowerHopeToServeYouAgain

BattleTower1FYoungsterScript:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	turnobject BATTLETOWER1F_YOUNGSTER, RIGHT
	end

BattleTower1FCooltrainerFScript:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BattleTower1FBugCatcherScript:
	jumptextfaceplayer Text_BattleTowerBugCatcher

BattleTower1FGrannyScript:
	jumptextfaceplayer Text_BattleTowerGranny

MovementData_BattleTower1FWalkToElevator:
	step UP
	step UP
	step UP
	step UP
	step UP
MovementData_BattleTowerHallwayPlayerEntersBattleRoom:
	step UP
	step_end

MovementData_BattleTowerElevatorExitElevator:
	step DOWN
	step_end

MovementData_BattleTowerHallwayWalkTo1020Room:
	step RIGHT
	step RIGHT
MovementData_BattleTowerHallwayWalkTo3040Room:
	step RIGHT
	step RIGHT
	step UP
	step RIGHT
	turn_head LEFT
	step_end

MovementData_BattleTowerHallwayWalkTo90100Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo7080Room:
	step LEFT
	step LEFT
MovementData_BattleTowerHallwayWalkTo5060Room:
	step LEFT
	step LEFT
	step UP
	step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerWalksIn:
	step UP
	step UP
	step UP
	step UP
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksIn:
	slow_step DOWN
	slow_step DOWN
	slow_step DOWN
	turn_head LEFT
	step_end

MovementData_BattleTowerBattleRoomOpponentWalksOut:
	turn_head UP
	slow_step UP
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer:
	slow_step RIGHT
	slow_step RIGHT
	slow_step UP
	slow_step UP
	step_end

MovementData_BattleTowerBattleRoomReceptionistWalksAway:
	slow_step DOWN
	slow_step DOWN
	slow_step LEFT
	slow_step LEFT
	turn_head RIGHT
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist:
	turn_head DOWN
	step_end

MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent:
	turn_head RIGHT
	step_end

Text_BattleTowerWelcomesYou:
	text "Bienvenue à la"
	line "TOUR DE COMBAT!"

	para "Je peux vous faire"
	line "accéder à une"
	cont "SALLE DE COMBAT."
	done

Text_WantToGoIntoABattleRoom:
	text "Voulez-vous aller"
	line "dans une SALLE"
	cont "DE COMBAT?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Par ici..."
	done

Text_BattleTowerIntroduction_1: ; unreferenced
	text "La TOUR DE COMBAT"
	line "est dédiée aux"
	cont "combats de"
	cont "#MON."

	para "Les dresseurs du"
	line "monde entier y"

	para "viennent pour"
	line "s'affronter dans"

	para "des SALLES DE"
	line "COMBAT."

	para "Il existe une mul-"
	line "titude de SALLES"
	cont "DE COMBAT."

	para "Chaque SALLE con-"
	line "tient 7 dresseurs."

	para "Si vous venez à"
	line "bout des 7 dres-"

	para "seurs d'une SALLE"
	line "en faisant un re-"

	para "cord, vous pouvez"
	line "devenir le CHAM-"
	cont "PION de la SALLE."

	para "Tous les CHAMPIONS"
	line "seront inscrits"

	para "sur les TABLES de"
	line "l'HONNEUR pour"
	cont "l'éternité."

	para "Vous pouvez péné-"
	line "trer dans 5 SALLES"

	para "DE COMBAT par"
	line "jour."

	para "Toutefois, vous ne"
	line "pouvez combattre"

	para "que dans une seule"
	line "SALLE par jour."

	para "Pour arrêter une"
	line "session vous"

	para "devez SAUVER,"
	line "sinon vous ne"

	para "pourrez pas con-"
	line "tinuer le défi"
	cont "d'une salle."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "La TOUR DE COMBAT"
	line "a été construite"
	cont "pour les matches"
	cont "de #MON."

	para "Divers dresseurs"
	line "viennent s'y af-"

	para "fronter dans les"
	line "SALLES DE COMBAT"
	cont "spéciales."

	para "Il existe beaucoup"
	line "de SALLES diffé-"
	cont "rentes."

	para "Chaque SALLE ren-"
	line "ferme 7 dresseurs."

	para "Il faut tous les"
	line "battre pour gagner"
	cont "un prix."

	para "Pour arrêter une"
	line "session, il faut"

	para "SAUVER. Dans le"
	line "cas contraire, on"

	para "ne peut pas re-"
	line "prendre le défi"
	cont "d'une SALLE."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Vous avez reçu une"
	line "liste des CHAM-"
	cont "PIONS sur les TA-"
	cont "BLES de l'HONNEUR."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Confirmez sur ce"
	line "moniteur."
	done

Text_ThankYou: ; unreferenced
	text "Merci!"
	prompt

Text_ThanksForVisiting:
	text "Merci et à"
	line "bientôt!"
	done

Text_BeatenAllTheTrainers_Mobile: ; unreferenced
	text "Félicitations!"

	para "Vous avez battu"
	line "tous les dres-"
	cont "seurs!"

	para "Votre prouesse"
	line "sera notée,"

	para "<PLAYER>. Vous"
	line "avez une chance"

	para "d'être CHAMPION"
	line "de SALLE."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Félicitations! "
	line "Tous les dresseurs"

	para "ont été vaincus! "
	line "Et hop! Cadeau!"
	prompt

Text_AskRegisterRecord_Mobile: ; unreferenced
	text "Voulez-vous enre-"
	line "gistrer votre pro-"

	para "gression avec le"
	line "CENTRE?"
	done

Text_PlayerGotFive:
	text "<PLAYER> gagne 5"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Oups! Le SAC est"
	line "plein."

	para "Il faut faire de"
	line "la place!"
	done

Text_YourRegistrationIsComplete: ; unreferenced
	text "Inscription"
	line "effectuée."

	para "A bientôt!"
	done

Text_WeHopeToServeYouAgain:
	text "A bientôt,"
	line "j'espère."
	done

Text_PleaseStepThisWay:
	text "Par ici."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Voulez-vous tout"
	line "savoir sur la TOUR"
	cont "DE COMBAT?"
	done

Text_CantBeRegistered:
	text "Votre progression"
	line "dans la dernière"

	para "SALLE DE COMBAT ne"
	line "peut pas être en-"
	cont "registrée. OK?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Votre progression"
	line "dans la dernière"

	para "SALLE DE COMBAT ne"
	line "peut pas être en-"
	cont "registrée."

	para "De plus, la pro-"
	line "gression existante"
	cont "sera effacée. OK?"
	done

Text_CheckTheLeaderHonorRoll: ; unreferenced
	text "Voir les TABLES de"
	line "l'HONNEUR?"
	done

Text_ReadBattleTowerRules:
	text "Les règles de la"
	line "TOUR DE COMBAT"

	para "Lire?"
	done

Text_BattleTowerRules:
	text "3 #MON peuvent"
	line "participer."

	para "Les 3 doivent être"
	line "différents."

	para "Les objets tenus"
	line "doivent être aussi"
	cont "différents."

	para "Certains #MON"
	line "peuvent avoir des"

	para "restrictions de"
	line "niveau."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Excusez-moi!"
	line "Vous n'avez pas"
	cont "SAUVE avant de"
	cont "quitter la SALLE"
	cont "DE COMBAT."

	para "Votre défi ne sera"
	line "donc pas pris en"
	cont "compte."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Nous allons soi-"
	line "gner vos #MON."
	done

Text_NextUpOpponentNo:
	text "Prochain adversai-"
	line "re, le no.@"
	text_ram wStringBuffer3
	text ". OK?"
	done

Text_SaveBeforeConnecting_Mobile: ; unreferenced
	text "Votre session sera"
	line "SAUVEE avant la"

	para "connexion avec le"
	line "CENTRE."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Avant d'entrer"
	line "dans une SALLE de"

	para "COMBAT, la partie"
	line "sera SAUVEE."
	done

Text_SaveAndEndTheSession:
	text "SAUVER et arrêter"
	line "la session?"
	done

Text_SaveBeforeReentry:
	text "Votre progression"
	line "sera SAUVEE avant"

	para "de retourner dans"
	line "la dernière SALLE."
	done

Text_CancelYourBattleRoomChallenge:
	text "Annuler le défi"
	line "des SALLES DE"
	cont "COMBAT?"
	done

Text_RegisterRecordOnFile_Mobile: ; unreferenced
	text "Nous avons votre"
	line "dernier record."

	para "Voulez-vous l'ins-"
	line "crire au CENTRE?"
	done

Text_WeveBeenWaitingForYou:
	text "Nous vous atten-"
	line "dions. Par ici"

	para "pour une SALLE DE"
	line "COMBAT."
	done

Text_FiveDayBattleLimit_Mobile:
	text "Vous ne pouvez"
	line "accéder qu'à 5"
	cont "SALLES DE COMBAT"
	cont "par jour."

	para "Revenez demain."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Il est impossible"
	line "d'enregistrer"

	para "votre progression"
	line "au CENTRE: trop de"

	para "temps s'est écoulé"
	line "depuis le début de"
	cont "votre défi."
	done

Text_RegisterRecordTimedOut_Mobile: ; unreferenced
; duplicate of Text_TooMuchTimeElapsedNoRegister
	text "Il est impossible"
	line "d'enregistrer"

	para "votre progression"
	line "au CENTRE: trop de"

	para "temps s'est écoulé"
	line "depuis le début de"
	cont "votre défi."
	done

Text_AMonLevelExceeds:
	text "Un de vos #MON"
	line "ou plus a un ni-"
	cont "veau au-dessus de"
	cont "@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " ne"
	line "peut pas entrer"
	cont "dans une SALLE DE"
	cont "COMBAT avant le"
	cont "N70."

	para "Cette SALLE est"
	line "pour les N@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Détruit par le"
	line "premier adversai-"
	cont "re... Je suis nul!"
	done

Text_BattleTowerCooltrainerF:
	text "Il y a plein de"
	line "SALLES DE COMBAT!"
	cont "Mais je vais"
	cont "gagner!"
	done

Text_BattleTowerGranny:
	text "C'est difficile de"
	line "se passer d'objets"

	para "pendant les"
	line "combats..."

	para "Faire tenir un ob-"
	line "jet à son #MON"
	cont "ça aide..."
	done

Text_BattleTowerBugCatcher:
	text "J'essaie de voir"
	line "jusqu'où on peut"

	para "aller en n'utili-"
	line "sant que des"
	cont "#MON insecte."

	para "Du moment qu'il"
	line "n'y a pas de"
	cont "#MON de feu..."
	done

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  7,  9, BATTLE_TOWER_OUTSIDE, 3
	warp_event  8,  9, BATTLE_TOWER_OUTSIDE, 4
	warp_event  7,  0, BATTLE_TOWER_ELEVATOR, 1

	def_coord_events

	def_bg_events
	bg_event  6,  6, BGEVENT_READ, BattleTower1FRulesSign

	def_object_events
	object_event  7,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 14,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  4,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  1,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 14,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
