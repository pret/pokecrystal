BattleTowerBattleRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw Script_EnterBattleRoom, 0
	dw UnknownScript_0x9f420, 0

.MapCallbacks:
	db 0

Script_EnterBattleRoom: ; 0x9f419
	disappear $2
	priorityjump Script_BattleRoom
	dotrigger $1
UnknownScript_0x9f420:
	end

Script_BattleRoom: ; 0x9f421
	applymovement PLAYER, MovementData_0x9e58c
; beat all 7 opponents in a row
Script_BattleRoomLoop: ; 0x9f425
	writebyte $2
	special Function_LoadOpponentTrainerAndPokemonsWithOTSprite
	appear $2
	warpsound
	waitbutton
	applymovement $2, MovementData_0x9e592
	loadfont
	battletowertext 1
	keeptextopen
	loadmovesprites
	special BattleTowerBattle ; calls predef startbattle
	special RotatePalettesRightPalettes
	reloadmap
	if_not_equal $0, Script_FailedBattleTowerChallenge
	copybytetovar wNrOfBeatenBattleTowerTrainers ; wcf64
	if_equal BATTLETOWER_NROFTRAINERS, Script_BeatenAllTrainers
	applymovement $2, MovementData_0x9e597
	warpsound
	disappear $2
	applymovement $3, MovementData_0x9e59c
	applymovement PLAYER, MovementData_0x9e5a7
	loadfont
	writetext Text_YourPkmnWillBeHealedToFullHealth
	closetext
	loadmovesprites
	playmusic MUSIC_HEAL
	special RotatePalettesRightPalettes
	special LoadMapPalettes
	pause 60
	special RotatePalettesLeftPalettes
	special RestartMapMusic
	loadfont
	writetext Text_NextUpOpponentNo
	yesorno
	iffalse Script_DontBattleNextOpponent
Script_ContinueAndBattleNextOpponent: ; 0x9f477
	loadmovesprites
	applymovement PLAYER, MovementData_0x9e5a9
	applymovement $3, MovementData_0x9e5a1
	jump Script_BattleRoomLoop

Script_DontBattleNextOpponent: ; 0x9f483
	writetext Text_SaveAndEndTheSession
	yesorno
	iffalse Script_DontSaveAndEndTheSession
	writebyte BATTLE_TOWER_ACTION_07
	special BattleTowerAction
	writebyte BATTLE_TOWER_ACTION_1F
	special BattleTowerAction
	writebyte BATTLE_TOWER_ACTION_03
	special BattleTowerAction
	playsound SFX_SAVE
	waitbutton
	special RotatePalettesRightPalettes
	special Reset
Script_DontSaveAndEndTheSession: ; 0x9f4a3
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	writebyte BATTLE_TOWER_ACTION_04
	special BattleTowerAction
	writebyte BATTLE_TOWER_ACTION_06
	special BattleTowerAction
	loadmovesprites
	special RotatePalettesRightPalettes
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
	loadfont
	jump UnknownScript_0x9e4b0

Script_FailedBattleTowerChallenge:
	pause 60
	special Special_BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
	writebyte BATTLE_TOWER_ACTION_04
	special BattleTowerAction
	loadfont
	writetext Text_ThanksForVisiting
	closetext
	loadmovesprites
	end

Script_BeatenAllTrainers: ; 0x9f4d9
	pause 60
	special Special_BattleTowerFade
	warpfacing UP, BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4:
	loadfont
	writetext Text_CongratulationsYouveBeatenAllTheTrainers
	jump Script_GivePlayerHisPrize

UnknownScript_0x9f4eb:
	writebyte BATTLE_TOWER_ACTION_04
	special BattleTowerAction
	loadfont
	writetext Text_TooMuchTimeElapsedNoRegister
	closetext
	loadmovesprites
	end

UnknownScript_0x9f4f7:
	writebyte BATTLE_TOWER_ACTION_04
	special BattleTowerAction
	writebyte BATTLE_TOWER_ACTION_06
	special BattleTowerAction
	loadfont
	writetext Text_ThanksForVisiting
	writetext Text_WeHopeToServeYouAgain
	closetext
	loadmovesprites
	end


UnknownText_0x9f50b:
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
