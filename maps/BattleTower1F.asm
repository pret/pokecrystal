	object_const_def ; object_event constants
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY
	const BATTLETOWER1F_TEACHER
	const BATTLETOWER1F_CLERK
	const BATTLETOWER_POKE_BALL



BATTLETOWER_MILD_COINS EQU 20
BATTLETOWER_MEGA_COINS EQU 70
BATTLETOWER_MYTHIC_COINS EQU 100



BattleTower1F_MapScripts:
	db 2 ; scene scripts
	scene_script .Scene0 ; SCENE_DEFAULT
	scene_script .Scene1 ; SCENE_FINISHED

	db 0 ; callbacks

.Scene0:
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
	prioritysjump Script_ResumeBattleTowerChallenge
	end

.LeftWithoutSaving
	prioritysjump BattleTower_LeftWithoutSaving
	setval BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	setval BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	setscene SCENE_FINISHED
.Scene1:
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
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
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
	setmapscene BATTLE_TOWER_BATTLE_ROOM, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_ELEVATOR, SCENE_DEFAULT
	setmapscene BATTLE_TOWER_HALLWAY, SCENE_DEFAULT
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

UnreferencedScript_0x9e4b6:
	special BattleTowerMobileError
	closetext
	end

Script_WaitButton:
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
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

UnreferencedScript_0x9e4ea:
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
	sjump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_DEFAULT
	special TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	setscene SCENE_FINISHED
	setval BATTLETOWERACTION_06
	special BattleTowerAction
	setval BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	sjump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
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

BattleTower1FTeacherScript:
	givecoins 500
	jumptextfaceplayer Text_BattleTowerTeacher






Clerk_NoCoinCaseScript:
	writetext ClerkNoCoinCaseText
	waitbutton
	closetext
	end

Clerk_CancelPurchaseScript:
	writetext ClerkQuitText
	waitbutton
	closetext
	end

Clerk_NotEnoughCoinsScript:
	writetext ClerkNeedMoreCoinsText
	waitbutton
	closetext
	end
	
Clerk_NoRoomForPrizeScript:
	writetext ClerkNoMoreRoomText
	waitbutton
	closetext
	end	
	
Clerk_ConfirmPurchaseScript:
	writetext ClerkConfirmPrizeText
	yesorno
	end
	


BattleTower1FClerkScript:
	checksameday	
	iftrue .norand
	;randomizeshop
	random 251
	addval 1
	writemem wRandMon
.norand	
	faceplayer
	opentext
	writetext ClerkIntroText
	waitbutton
	checkitem COIN_CASE
	iffalse Clerk_NoCoinCaseScript
.loop
	;writetext ClerkWhichPrizeText
	;waitbutton
	writetext ClerkClearText
	special DisplayCoinCaseBalance
	loadmenu .MenuHeader
	verticalmenu
	closewindow
	ifequal 1, .Mild1
	ifequal 2, .Mild2
	ifequal 3, .Mild3
	ifequal 4, .Mild4
	ifequal 5, .Mega
	ifequal 6, .Mythic
	sjump Clerk_CancelPurchaseScript

.Mild1:
	checkcoins BATTLETOWER_MILD_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	readmem wRandMon
	
	refreshscreen
	pokepic USE_SCRIPT_VAR
	cry USE_SCRIPT_VAR
	waitbutton
	closepokepic
	opentext
	
	getmonname STRING_BUFFER_3, USE_SCRIPT_VAR
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	readmem wRandMon
	;setval USE_SCRIPT_VAR
	special GameCornerPrizeMonCheckDex
	readmem wRandMon
	givepoke USE_SCRIPT_VAR, 40 
	takecoins BATTLETOWER_MILD_COINS
	sjump .loop

.Mild2:
	checkcoins BATTLETOWER_MILD_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, SKARMORY
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	setval SKARMORY
	special GameCornerPrizeMonCheckDex
	givepoke SKARMORY, 50, MINT_BERRY
	takecoins BATTLETOWER_MILD_COINS
	sjump .loop

.Mild3:
	checkcoins BATTLETOWER_MILD_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, BLISSEY
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	setval BLISSEY
	special GameCornerPrizeMonCheckDex
	givepoke BLISSEY, 50, LEFTOVERS
	takecoins BATTLETOWER_MILD_COINS
	sjump .loop
	
.Mild4:
	checkcoins BATTLETOWER_MILD_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, TYRANITAR
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	setval TYRANITAR
	special GameCornerPrizeMonCheckDex
	givepoke TYRANITAR, 50, MIRACLEBERRY
	takecoins BATTLETOWER_MILD_COINS
	sjump .loop	
	
.Mega:
	checkcoins BATTLETOWER_MEGA_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, CHINCHOU
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	setval CHINCHOU
	special GameCornerPrizeMonCheckDex
	givepoke CHINCHOU, 69
	takecoins BATTLETOWER_MEGA_COINS
	sjump .loop		

.Mythic:
	checkcoins BATTLETOWER_MYTHIC_COINS
	ifequal HAVE_LESS, Clerk_NotEnoughCoinsScript
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, Clerk_NoRoomForPrizeScript
	getmonname STRING_BUFFER_3, LUGIA
	scall Clerk_ConfirmPurchaseScript
	iffalse .loop ;Clerk_CancelPurchaseScript
	waitsfx
	playsound SFX_TRANSACTION
	writetext ClerkHereYouGoText
	waitbutton
	setval LUGIA
	special GameCornerPrizeMonCheckDex
	givepoke LUGIA, 15
	takecoins BATTLETOWER_MYTHIC_COINS
	sjump .loop		

.MenuHeader:
	db MENU_BACKUP_TILES ; flags
	menu_coords 0, 2, 19, 17
	dw .MenuData
	db 1 ; default option

.MenuData:
	db STATICMENU_CURSOR ; flags
	db 7 ; items
	db "MILD         20@"
	db "MILD         20@"
	db "MILD         20@"
	db "MILD         20@"
	db "MEGA         70@"
	db "MYTHIC      100@"
	db "CANCEL@"





BattleTowerCoinCase:
	itemball COIN_CASE







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
	text "BATTLE TOWER"
	line "welcomes you!"

	para "I could show you"
	line "to a BATTLE ROOM."
	done

Text_WantToGoIntoABattleRoom:
	text "Want to go into a"
	line "BATTLE ROOM?"
	done

Text_RightThisWayToYourBattleRoom:
	text "Right this way to"
	line "your BATTLE ROOM."
	done

Text_BattleTowerIntroduction_1:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "If you defeat the"
	line "seven in a ROOM,"

	para "and you have a"
	line "good record, you"

	para "could become the"
	line "ROOM's LEADER."

	para "All LEADERS will"
	line "be recorded in the"

	para "HONOR ROLL for"
	line "posterity."

	para "You may challenge"
	line "in up to five"

	para "BATTLE ROOMS each"
	line "day."

	para "However, you may"
	line "battle only once a"

	para "day in any given"
	line "ROOM."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_BattleTowerIntroduction_2:
	text "BATTLE TOWER is a"
	line "facility made for"
	cont "#MON battles."

	para "Countless #MON"
	line "trainers gather"

	para "from all over to"
	line "hold battles in"

	para "specially designed"
	line "BATTLE ROOMS."

	para "There are many"
	line "BATTLE ROOMS in"
	cont "the BATTLE TOWER."

	para "Each ROOM holds"
	line "seven trainers."

	para "Beat them all, and"
	line "win a prize."

	para "To interrupt a"
	line "session, you must"

	para "SAVE. If not, you"
	line "won't be able to"

	para "resume your ROOM"
	line "challenge."

	para ""
	done

Text_ReceivedAListOfLeadersOnTheHonorRoll:
	text "Received a list of"
	line "LEADERS on the"
	cont "HONOR ROLL."

	para ""
	done

Text_PleaseConfirmOnThisMonitor:
	text "Please confirm on"
	line "this monitor."
	done

Text_ThankYou:
	text "Thank you!"

	para ""
	done

Text_ThanksForVisiting:
	text "Thanks for"
	line "visiting!"
	done

Text_BeatenAllTheTrainers_Mobile:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "Your feat may be"
	line "worth registering,"

	para "<PLAYER>. With your"
	line "results, you may"

	para "be chosen as a"
	line "ROOM LEADER."

	para ""
	done

Text_CongratulationsYouveBeatenAllTheTrainers:
	text "Congratulations!"

	para "You've beaten all"
	line "the trainers!"

	para "For that, you get"
	line "this great prize!"

	para ""
	done

Text_AskRegisterRecord_Mobile:
	text "Would you like to"
	line "register your"

	para "record with the"
	line "CENTER?"
	done

Text_PlayerGotFive:
	text "<PLAYER> got five"
	line "@"
	text_ram wStringBuffer4
	text "!@"
	sound_item
	text_promptbutton
	text_end

Text_YourPackIsStuffedFull:
	text "Oops, your PACK is"
	line "stuffed full."

	para "Please make room"
	line "and come back."
	done

Text_YourRegistrationIsComplete:
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done

Text_WeHopeToServeYouAgain:
	text "We hope to serve"
	line "you again."
	done

Text_PleaseStepThisWay:
	text "Please step this"
	line "way."
	done

Text_WouldYouLikeToHearAboutTheBattleTower:
	text "Would you like to"
	line "hear about the"
	cont "BATTLE TOWER?"
	done

Text_CantBeRegistered:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered. OK?"
	done

Text_CantBeRegistered_PreviousRecordDeleted:
	text "Your record from"
	line "the previous"

	para "BATTLE ROOM can't"
	line "be registered."

	para "Also, the existing"
	line "record will be"
	cont "deleted. OK?"
	done

Text_CheckTheLeaderHonorRoll:
	text "Check the LEADER"
	line "HONOR ROLL?"
	done

Text_ReadBattleTowerRules:
	text "BATTLE TOWER rules"
	line "are written here."

	para "Read the rules?"
	done

Text_BattleTowerRules:
	text "Three #MON may"
	line "enter battles."

	para "All three must be"
	line "different."

	para "The items they"
	line "hold must also be"
	cont "different."

	para "Certain #MON"
	line "may also have"

	para "level restrictions"
	line "placed on them."
	done

Text_BattleTower_LeftWithoutSaving:
	text "Excuse me!"
	line "You didn't SAVE"

	para "before exiting"
	line "the BATTLE ROOM."

	para "I'm awfully sorry,"
	line "but your challenge"

	para "will be declared"
	line "invalid."
	done

Text_YourMonWillBeHealedToFullHealth:
	text "Your #MON will"
	line "be healed to full"
	cont "health."
	done

Text_NextUpOpponentNo:
	text "Next up, opponent"
	line "no.@"
	text_ram wStringBuffer3
	text ". Ready?"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done

Text_SaveBeforeEnteringBattleRoom:
	text "Before entering"
	line "the BATTLE ROOM,"

	para "your progress will"
	line "be saved."
	done

Text_SaveAndEndTheSession:
	text "SAVE and end the"
	line "session?"
	done

Text_SaveBeforeReentry:
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done

Text_CancelYourBattleRoomChallenge:
	text "Cancel your BATTLE"
	line "ROOM challenge?"
	done

Text_RegisterRecordOnFile_Mobile:
	text "We have your"
	line "previous record on"

	para "file. Would you"
	line "like to register"
	cont "it at the CENTER?"
	done

Text_WeveBeenWaitingForYou:
	text "We've been waiting"
	line "for you. This way"

	para "to a BATTLE ROOM,"
	line "please."
	done

Text_FiveDayBattleLimit_Mobile:
	text "You may enter only"
	line "five BATTLE ROOMS"
	cont "each day."

	para "Please come back"
	line "tomorrow."
	done

Text_TooMuchTimeElapsedNoRegister:
	text "Sorry, but it's"
	line "not possible to"

	para "register your"
	line "current record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

; a dupe?
Text_RegisterRecordTimedOut_Mobile:
	text "Sorry, but it's"
	line "not possible to"

	para "register your most"
	line "recent record at"

	para "the CENTER because"
	line "too much time has"

	para "elapsed since the"
	line "start of your"
	cont "challenge."
	done

Text_AMonLevelExceeds:
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70:
	text_ram wcd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	text_decimal wScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster:
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done

Text_BattleTowerCooltrainerF:
	text "There are lots of"
	line "BATTLE ROOMS, but"

	para "I'm going to win"
	line "them all!"
	done

Text_BattleTowerGranny:
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#MON hold items"

	para "is the key to"
	line "winning battles."
	done

Text_BattleTowerTeacher:
	text "Hello! Welcome to"
	line "the battle tower!"
	done

Text_BattleTowerBugCatcher:
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#MON."

	para "Don't let there be"
	line "any fire #MON…"
	done



ClerkIntroText:
	text "Hi! Welcome to the"
	line "#MON shop!"
	done

ClerkNoCoinCaseText:
	text "Get a coin case!"
	done

ClerkWhichPrizeText:
	text "Please select a"
	line "#MON."
	done

ClerkClearText:
	text ""
	done

ClerkQuitText:
	text "Have fun!"
	done

ClerkNeedMoreCoinsText:
	text "Not enough coin,"
	line "trainer."
	done

ClerkNoMoreRoomText:
	text "It seems that your"
	line "party is full."
	done

ClerkConfirmPrizeText:
	text_ram wStringBuffer3
	text "."
	line "Is that right?"
	done
	
ClerkHereYouGoText:
	text "Here you go!"
	done	
	
	

BattleTower1F_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  11,  11, BATTLE_TOWER_OUTSIDE, 3
	warp_event  12,  11, BATTLE_TOWER_OUTSIDE, 4
	warp_event  11,  0, BATTLE_TOWER_ELEVATOR, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  10,  6, BGEVENT_READ, BattleTower1FRulesSign

	db 8 ; object events
	object_event  11,  6, SPRITE_RECEPTIONIST, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FReceptionistScript, -1
	object_event 18,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BattleTower1FYoungsterScript, -1
	object_event  8,  9, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FCooltrainerFScript, -1
	object_event  5,  3, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BattleTower1FBugCatcherScript, -1
	object_event 18,  3, SPRITE_GRANNY, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BattleTower1FGrannyScript, -1
	object_event 21, 10, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, PAL_NPC_RED, BattleTower1FTeacherScript, -1
	object_event 2, 10, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BattleTower1FClerkScript, -1
	object_event  4, 11, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, BattleTowerCoinCase, EVENT_GOLDENROD_UNDERGROUND_COIN_CASE
