BattleTowerBattleRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw Script_EnterBattleRoom, $0000
	dw UnknownScript_0x9f420, $0000

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
	storetext 1
	keeptextopen
	loadmovesprites
	special Function170215 ; calls predef startbattle
	special FadeBlackBGMap
	reloadmap
	if_not_equal $0, UnknownScript_0x9f4c2
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
	special FadeBlackBGMap
	special LoadMapPalettes
	pause 60
	special FadeInBGMap
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
	writebyte $7
	special Function170687
	writebyte $1f
	special Function170687
	writebyte $3
	special Function170687
	playsound SFX_SAVE
	waitbutton
	special FadeBlackBGMap
	special Reset
Script_DontSaveAndEndTheSession: ; 0x9f4a3
	writetext Text_CancelYourBattleRoomChallenge
	yesorno
	iffalse Script_ContinueAndBattleNextOpponent
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
	loadmovesprites
	special FadeBlackBGMap
	warpfacing $1, BATTLE_TOWER_1F, $7, $7
	loadfont
	jump UnknownScript_0x9e4b0

UnknownScript_0x9f4c2:
	pause 60
	special Special_BattleTowerFade
	warpfacing $1, BATTLE_TOWER_1F, $7, $7
	writebyte $4
	special Function170687
	loadfont
	writetext Text_ThanksForVisiting
	closetext
	loadmovesprites
	end

Script_BeatenAllTrainers: ; 0x9f4d9
	pause 60
	special Special_BattleTowerFade
	warpfacing $1, BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4:
	loadfont
	writetext Text_CongratulationsYouveBeatenAllTheTrainers
	jump Script_GivePlayerHisPrize

UnknownScript_0x9f4eb:
	writebyte $4
	special Function170687
	loadfont
	writetext Text_TooMuchTimeElapsedNoRegister
	closetext
	loadmovesprites
	end

UnknownScript_0x9f4f7:
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
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
	person_event SPRITE_YOUNGSTER, 0 + 4, 4 + 4, $6, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	person_event SPRITE_RECEPTIONIST, 6 + 4, 1 + 4, $9, 0, 0, -1, -1, 0, 0, 0, ObjectEvent, -1
