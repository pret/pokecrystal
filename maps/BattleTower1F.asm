const_value set 2
	const BATTLETOWER1F_RECEPTIONIST
	const BATTLETOWER1F_YOUNGSTER
	const BATTLETOWER1F_COOLTRAINER_F
	const BATTLETOWER1F_BUG_CATCHER
	const BATTLETOWER1F_GRANNY

BattleTower1F_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	maptrigger .Trigger0
	maptrigger .Trigger1

.MapCallbacks:
	db 0

.Trigger0:
	writebyte BATTLETOWERACTION_CHECKSAVEFILEISYOURS
	special BattleTowerAction
	iffalse .SkipEverything
	writebyte BATTLETOWERACTION_02 ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	if_equal $0, .SkipEverything
	if_equal $2, .priorityjump1
	if_equal $3, .SkipEverything
	if_equal $4, .SkipEverything
	opentext
	writetext Text_WeveBeenWaitingForYou
	waitbutton
	closetext
	priorityjump Script_ResumeBattleTowerChallenge
	end

.priorityjump1
	priorityjump BattleTower_LeftWithoutSaving
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
.SkipEverything:
	dotrigger $1
.Trigger1:
	end

MapBattleTower1FSignpost0Script:
	opentext
	writetext Text_ReadBattleTowerRules
	yesorno
	iffalse UnknownScript_0x9e3e0
	writetext Text_BattleTowerRules
	waitbutton
UnknownScript_0x9e3e0:
	closetext
	end

ReceptionistScript_0x9e3e2:
	writebyte BATTLETOWERACTION_02 ; copybytetovar sBattleTowerChallengeState
	special BattleTowerAction
	if_equal $3, Script_BeatenAllTrainers2 ; maps/BattleTowerBattleRoom.asm
	opentext
	writetext Text_BattleTowerWelcomesYou
	buttonsound
	writebyte BATTLETOWERACTION_00 ; if new save file: bit 1, [s1_be4f]
	special BattleTowerAction
	if_not_equal $0, Script_Menu_ChallengeExplanationCancel
	jump Script_BattleTowerIntroductionYesNo

Script_Menu_ChallengeExplanationCancel: ; 0x9e3fc
	writetext Text_WantToGoIntoABattleRoom
	writebyte $1
	special Special_Menu_ChallengeExplanationCancel
	if_equal $1, Script_ChoseChallenge
	if_equal $2, Script_BattleTowerExplanation
	jump Script_BattleTowerHopeToServeYouAgain

Script_ChoseChallenge: ; 0x9e40f
	writebyte BATTLETOWERACTION_RESETDATA ; ResetBattleTowerTrainerSRAM
	special BattleTowerAction
	special SpecialCheckForBattleTowerRules
	if_not_equal $0, Script_WaitButton
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	dotrigger $0
	special Special_TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	dotrigger $1
	writebyte BATTLETOWERACTION_01 ; set 1, [s1_be4f]
	special BattleTowerAction
	special Function1700b0
	if_equal $a, Script_Menu_ChallengeExplanationCancel
	if_not_equal $0, UnknownScript_0x9e550
	writebyte BATTLETOWERACTION_11
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	closetext
	writebyte BATTLETOWERACTION_CHOOSEREWARD
	special BattleTowerAction
	jump Script_WalkToBattleTowerElevator

Script_ResumeBattleTowerChallenge:
	closetext
	writebyte BATTLETOWERACTION_LOADLEVELGROUP ; load choice of level group
	special BattleTowerAction
Script_WalkToBattleTowerElevator:
	musicfadeout MUSIC_NONE, 8
	domaptrigger BATTLE_TOWER_BATTLE_ROOM, $0
	domaptrigger BATTLE_TOWER_ELEVATOR, $0
	domaptrigger BATTLE_TOWER_HALLWAY, $0
	follow BATTLETOWER1F_RECEPTIONIST, PLAYER
	applymovement BATTLETOWER1F_RECEPTIONIST, MovementData_BattleTower1FWalkToElevator
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	warpsound
	disappear BATTLETOWER1F_RECEPTIONIST
	stopfollow
	applymovement PLAYER, MovementData_BattleTowerHallwayPlayerEntersBattleRoom
	warpcheck
	end

Script_GivePlayerHisPrize: ; 0x9e47a
	writebyte BATTLETOWERACTION_1C
	special BattleTowerAction
	writebyte BATTLETOWERACTION_GIVEREWARD
	special BattleTowerAction
	if_equal POTION, Script_YourPackIsStuffedFull
	itemtotext $0, $1
	giveitem ITEM_FROM_MEM, 5
	writetext Text_PlayerGotFive
	writebyte BATTLETOWERACTION_1D
	special BattleTowerAction
	closetext
	end

Script_YourPackIsStuffedFull: ; 0x9e498
	writetext Text_YourPackIsStuffedFull
	waitbutton
	closetext
	end

Script_BattleTowerIntroductionYesNo: ; 0x9e49e
	writetext Text_WouldYouLikeToHearAboutTheBattleTower
	yesorno
	iffalse Script_BattleTowerSkipExplanation
Script_BattleTowerExplanation: ; 0x9e4a5
	writetext Text_BattleTowerIntroduction_2
Script_BattleTowerSkipExplanation:
	writebyte BATTLETOWERACTION_01
	special BattleTowerAction
	jump Script_Menu_ChallengeExplanationCancel

Script_BattleTowerHopeToServeYouAgain:
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4b6:
	special Function17f53d
	closetext
	end

Script_WaitButton: ; 0x9e4bb
	waitbutton
	closetext
	end

UnreferencedScript_0x9e4be:
	writetext Text_SaveBeforeEnteringBattleRoom
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	special Special_TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	writebyte BATTLETOWERACTION_01
	special BattleTowerAction
	special Function1700ba
	if_equal $a, Script_Menu_ChallengeExplanationCancel
	if_not_equal $0, UnknownScript_0x9e550
	writetext Text_ReceivedAListOfLeadersOnTheHonorRoll
	spriteface BATTLETOWER1F_RECEPTIONIST, LEFT
	writetext Text_PleaseConfirmOnThisMonitor
	waitbutton
	spriteface BATTLETOWER1F_RECEPTIONIST, DOWN
	closetext
	end

UnreferencedScript_0x9e4ea:
	writebyte BATTLETOWERACTION_18
	special BattleTowerAction
	if_not_equal $0, Script_APkmnLevelExceeds
	writebyte BATTLETOWERACTION_19
	special BattleTowerAction
	if_not_equal $0, Script_MayNotEnterABattleRoomUnderL70
	special SpecialCheckForBattleTowerRules
	if_not_equal $0, Script_WaitButton
	writebyte BATTLETOWERACTION_05
	special BattleTowerAction
	if_equal $0, .zero
	writetext Text_CantBeRegistered_PreviousRecordDeleted
	jump continue

.zero
	writetext Text_CantBeRegistered
continue:
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	writetext Text_SaveBeforeReentry
	yesorno
	iffalse Script_Menu_ChallengeExplanationCancel
	dotrigger $0
	special Special_TryQuickSave
	iffalse Script_Menu_ChallengeExplanationCancel
	dotrigger $1
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	writebyte BATTLETOWERACTION_12
	special BattleTowerAction
	writetext Text_RightThisWayToYourBattleRoom
	waitbutton
	jump Script_ResumeBattleTowerChallenge

UnreferencedScript_0x9e53b:
	writetext Text_FiveDayBattleLimit_Mobile
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

Script_APkmnLevelExceeds: ; 0x9e542
	writetext Text_APkmnLevelExceeds
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

Script_MayNotEnterABattleRoomUnderL70: ; 0x9e549
	writetext Text_MayNotEnterABattleRoomUnderL70
	waitbutton
	jump Script_Menu_ChallengeExplanationCancel

UnknownScript_0x9e550:
	special Function17f53d
	closetext
	end

BattleTower_LeftWithoutSaving:
	opentext
	writetext Text_BattleTower_LeftWithoutSaving
	waitbutton
	jump Script_BattleTowerHopeToServeYouAgain

YoungsterScript_0x9e55d:
	faceplayer
	opentext
	writetext Text_BattleTowerYoungster
	waitbutton
	closetext
	spriteface BATTLETOWER1F_YOUNGSTER, RIGHT
	end

CooltrainerFScript_0x9e568:
	jumptextfaceplayer Text_BattleTowerCooltrainerF

BugCatcherScript_0x9e56b:
	jumptextfaceplayer Text_BattleTowerBugCatcher

GrannyScript_0x9e56e:
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

Text_BattleTowerWelcomesYou: ; 0x9e5ab
	text "BATTLE TOWER"
	line "welcomes you!"

	para "I could show you"
	line "to a BATTLE ROOM."
	done

Text_WantToGoIntoABattleRoom: ; 0x9e5ea
	text "Want to go into a"
	line "BATTLE ROOM?"
	done

Text_RightThisWayToYourBattleRoom: ; 0x9e60a
	text "Right this way to"
	line "your BATTLE ROOM."
	done

Text_BattleTowerIntroduction_1: ; 0x9e62f
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

Text_BattleTowerIntroduction_2: ; 0x9e886
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

Text_ReceivedAListOfLeadersOnTheHonorRoll: ; 0x9e9eb
	text "Received a list of"
	line "LEADERS on the"
	cont "HONOR ROLL."

	para ""
	done

Text_PleaseConfirmOnThisMonitor: ; 0x9ea1b
	text "Please confirm on"
	line "this monitor."
	done

Text_ThankYou: ; 0x9ea3c
	text "Thank you!"

	para ""
	done

Text_ThanksForVisiting: ; 0x9ea49
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

Text_CongratulationsYouveBeatenAllTheTrainers: ; 0x9eaef
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

Text_PlayerGotFive: ; 0x9eb7e
	text "<PLAYER> got five"
	line "@"
	text_from_ram StringBuffer4
	text "!@"
	sound_item
	text_waitbutton
	db "@"

Text_YourPackIsStuffedFull: ; 0x9eb94
	text "Oops, your PACK is"
	line "stuffed full."

	para "Please make room"
	line "and come back."
	done

Text_YourRegistrationIsComplete: ; 0x9ebd6
	text "Your registration"
	line "is complete."

	para "Please come again!"
	done

Text_WeHopeToServeYouAgain: ; 0x9ec09
	text "We hope to serve"
	line "you again."
	done

Text_PleaseStepThisWay: ; 0x9ec26
	text "Please step this"
	line "way."
	done

Text_WouldYouLikeToHearAboutTheBattleTower: ; 0x9ec3d
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

Text_CheckTheLeaderHonorRoll: ; 0x9ed1e
	text "Check the LEADER"
	line "HONOR ROLL?"
	done

Text_ReadBattleTowerRules: ; 0x9ed3c
	text "BATTLE TOWER rules"
	line "are written here."

	para "Read the rules?"
	done

Text_BattleTowerRules: ; 0x9ed72
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

Text_YourPkmnWillBeHealedToFullHealth: ; 0x9ee92
	text "Your #MON will"
	line "be healed to full"
	cont "health."
	done

Text_NextUpOpponentNo: ; 0x9eebc
	text "Next up, opponent"
	line "no.@"
	text_from_ram StringBuffer3
	text ". Ready?"
	done

Text_SaveBeforeConnecting_Mobile:
	text "Your session will"
	line "be SAVED before"

	para "connecting with"
	line "the CENTER."
	done

Text_SaveBeforeEnteringBattleRoom: ; 0x9ef1f
	text "Before entering"
	line "the BATTLE ROOM,"

	para "your progress will"
	line "be saved."
	done

Text_SaveAndEndTheSession: ; 0x9ef5e
	text "SAVE and end the"
	line "session?"
	done

Text_SaveBeforeReentry:
	text "Your record will"
	line "be SAVED before"

	para "you go back into"
	line "the previous ROOM."
	done

Text_CancelYourBattleRoomChallenge: ; 0x9efbf
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

Text_TooMuchTimeElapsedNoRegister: ; 0x9f0c1
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

Text_APkmnLevelExceeds: ; 0x9f1e5
	text "One or more of"
	line "your #MON's"
	cont "levels exceeds @"
	deciram ScriptVar, 1, 3
	text "."
	done

Text_MayNotEnterABattleRoomUnderL70: ; 0x9f217
	text_from_ram wcd49
	text " may not"
	line "enter a BATTLE"
	cont "ROOM under L70."

	para "This BATTLE ROOM"
	line "is for L@"
	deciram ScriptVar, 1, 3
	text "."
	done

Text_BattleTowerYoungster: ; 0x9f264
	text "Destroyed by the"
	line "first opponent in"

	para "no time at all…"
	line "I'm no good…"
	done

Text_BattleTowerCooltrainerF: ; 0x9f2a4
	text "There are lots of"
	line "BATTLE ROOMS, but"

	para "I'm going to win"
	line "them all!"
	done

Text_BattleTowerGranny: ; 0x9f2e3
	text "It's a grueling"
	line "task, not being"

	para "able to use items"
	line "in battle."

	para "Making your"
	line "#MON hold items"

	para "is the key to"
	line "winning battles."
	done

Text_BattleTowerBugCatcher: ; 0x9f35b
	text "I'm trying to see"
	line "how far I can go"

	para "using just bug"
	line "#MON."

	para "Don't let there be"
	line "any fire #MON…"
	done

BattleTower1F_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 3
	warp_def $9, $7, 3, BATTLE_TOWER_OUTSIDE
	warp_def $9, $8, 4, BATTLE_TOWER_OUTSIDE
	warp_def $0, $7, 1, BATTLE_TOWER_ELEVATOR

.XYTriggers:
	db 0

.Signposts:
	db 1
	signpost 6, 6, SIGNPOST_READ, MapBattleTower1FSignpost0Script

.PersonEvents:
	db 5
	person_event SPRITE_RECEPTIONIST, 6, 7, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ReceptionistScript_0x9e3e2, -1
	person_event SPRITE_YOUNGSTER, 9, 14, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, (1 << 3) | PAL_OW_BROWN, PERSONTYPE_SCRIPT, 0, YoungsterScript_0x9e55d, -1
	person_event SPRITE_COOLTRAINER_F, 9, 4, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 0, 1, -1, -1, (1 << 3) | PAL_OW_RED, PERSONTYPE_SCRIPT, 0, CooltrainerFScript_0x9e568, -1
	person_event SPRITE_BUG_CATCHER, 3, 1, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, (1 << 3) | PAL_OW_BLUE, PERSONTYPE_SCRIPT, 0, BugCatcherScript_0x9e56b, -1
	person_event SPRITE_GRANNY, 3, 14, SPRITEMOVEDATA_WALK_UP_DOWN, 1, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, GrannyScript_0x9e56e, -1
