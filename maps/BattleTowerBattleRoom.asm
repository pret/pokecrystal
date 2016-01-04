const_value set 2
	const BATTLETOWERBATTLEROOM_YOUNGSTER
	const BATTLETOWERBATTLEROOM_RECEPTIONIST

BattleTowerBattleRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .EnterBattleRoom, 0
	dw .DummyTrigger, 0

.MapCallbacks:
	db 0

.EnterBattleRoom: ; 0x9f419
	disappear BATTLETOWERBATTLEROOM_YOUNGSTER
	priorityjump Script_BattleRoom
	dotrigger $1
.DummyTrigger:
	end

Script_BattleRoom: ; 0x9f421
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerWalksIn
; beat all 7 opponents in a row
Script_BattleRoomLoop: ; 0x9f425
	writebyte BATTLETOWERBATTLEROOM_YOUNGSTER
	special Function_LoadOpponentTrainerAndPokemonsWithOTSprite
	appear BATTLETOWERBATTLEROOM_YOUNGSTER
	warpsound
	waitsfx
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksIn
	opentext
	battletowertext 1
	buttonsound
	closetext
	special BattleTowerBattle ; calls predef startbattle
	special FadeOutPalettes
	reloadmap
	if_not_equal $0, Script_FailedBattleTowerChallenge
	copybytetovar wNrOfBeatenBattleTowerTrainers ; wcf64
	if_equal BATTLETOWER_NROFTRAINERS, Script_BeatenAllTrainers
	applymovement BATTLETOWERBATTLEROOM_YOUNGSTER, MovementData_BattleTowerBattleRoomOpponentWalksOut
	warpsound
	disappear BATTLETOWERBATTLEROOM_YOUNGSTER
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksToPlayer
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceReceptionist
	opentext
	writetext Text_YourPkmnWillBeHealedToFullHealth
	waitbutton
	closetext
	playmusic MUSIC_HEAL
	special FadeOutPalettes
	special LoadMapPalettes
	pause 60
	special FadeInPalettes
	special RestartMapMusic
	opentext
	writetext Text_NextUpOpponentNo
	yesorno
	iffalse Script_DontBattleNextOpponent
Script_ContinueAndBattleNextOpponent: ; 0x9f477
	closetext
	applymovement PLAYER, MovementData_BattleTowerBattleRoomPlayerTurnsToFaceNextOpponent
	applymovement BATTLETOWERBATTLEROOM_RECEPTIONIST, MovementData_BattleTowerBattleRoomReceptionistWalksAway
	jump Script_BattleRoomLoop

Script_DontBattleNextOpponent: ; 0x9f483
	writetext Text_SaveAndEndTheSession
	yesorno
	iffalse Script_DontSaveAndEndTheSession
	writebyte BATTLETOWERACTION_SAVELEVELGROUP ; save level group
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVEOPTIONS ; choose reward
	special BattleTowerAction
	writebyte BATTLETOWERACTION_SAVE_AND_QUIT ; quicksave
	special BattleTowerAction
	playsound SFX_SAVE
	waitsfx
	special FadeOutPalettes
	special Reset
Script_DontSaveAndEndTheSession: ; 0x9f4a3
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	closetext
	special FadeOutPalettes
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
	opentext
	jump Script_BattleTowerHopeToServeYouAgain

Script_FailedBattleTowerChallenge:
	pause 60
	special Special_BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	waitbutton
	closetext
	end

Script_BeatenAllTrainers: ; 0x9f4d9
	pause 60
	special Special_BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
Script_BeatenAllTrainers2:
	opentext
	writetext Text_CongratulationsYouveBeatenAllTheTrainers
	jump Script_GivePlayerHisPrize

UnreferencedScript_0x9f4eb:
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	opentext
	writetext Text_TooMuchTimeElapsedNoRegister
	waitbutton
	closetext
	end

UnreferencedScript_0x9f4f7:
	writebyte BATTLETOWERACTION_CHALLENGECANCELED
	special BattleTowerAction
	writebyte BATTLETOWERACTION_06
	special BattleTowerAction
	opentext
	writetext Text_ThanksForVisiting
	writetext Text_WeHopeToServeYouAgain
	waitbutton
	closetext
	end


Text_ReturnedAfterSave_Mobile:
	text "You'll be returned"
	line "after you SAVE."
	done


BattleTowerBattleRoom_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $7, $3, 4, BATTLE_TOWER_HALLWAY
	warp_def $7, $4, 4, BATTLE_TOWER_HALLWAY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_YOUNGSTER, 0, 4, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	person_event SPRITE_RECEPTIONIST, 6, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, ObjectEvent, -1
