BattleTowerBattleRoom_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x9f419, $0000
	dw UnknownScript_0x9f420, $0000

.MapCallbacks:
	db 0

UnknownScript_0x9f419:
	disappear $2
	priorityjump UnknownScript_0x9f421
	dotrigger $1

UnknownScript_0x9f420:
	end

UnknownScript_0x9f421:
	applymovement $0, MovementData_0x9e58c
UnknownScript_0x9f425:
	writebyte $2
	special Function170b44
	appear $2
	warpsound
	waitbutton
	applymovement $2, MovementData_0x9e592
	loadfont
	storetext 1
	keeptextopen
	loadmovesprites
	special Function170215
	special FadeBlackBGMap
	reloadmap
	if_not_equal $0, UnknownScript_0x9f4c2
	copybytetovar wcf64
	if_equal $7, UnknownScript_0x9f4d9
	applymovement $2, MovementData_0x9e597
	warpsound
	disappear $2
	applymovement $3, MovementData_0x9e59c
	applymovement $0, MovementData_0x9e5a7
	loadfont
	writetext UnknownText_0x9ee92
	closetext
	loadmovesprites
	playmusic MUSIC_HEAL
	special FadeBlackBGMap
	special LoadMapPalettes
	pause 60
	special FadeInBGMap
	special RestartMapMusic
	loadfont
	writetext UnknownText_0x9eebc
	yesorno
	iffalse UnknownScript_0x9f483
UnknownScript_0x9f477:
	loadmovesprites
	applymovement $0, MovementData_0x9e5a9
	applymovement $3, MovementData_0x9e5a1
	jump UnknownScript_0x9f425

UnknownScript_0x9f483:
	writetext UnknownText_0x9ef5e
	yesorno
	iffalse UnknownScript_0x9f4a3
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
UnknownScript_0x9f4a3:
	writetext UnknownText_0x9efbf
	yesorno
	iffalse UnknownScript_0x9f477
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
	loadmovesprites
	special FadeBlackBGMap
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	loadfont
	jump UnknownScript_0x9e4b0

UnknownScript_0x9f4c2:
	pause 60
	special Special_BattleTowerFade
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
	writebyte $4
	special Function170687
	loadfont
	writetext UnknownText_0x9ea49
	closetext
	loadmovesprites
	end

UnknownScript_0x9f4d9:
	pause 60
	special Special_BattleTowerFade
	warpfacing $1, GROUP_BATTLE_TOWER_1F, MAP_BATTLE_TOWER_1F, $7, $7
BattleTowerBattleRoomScript_0x9f4e4:
	loadfont
	writetext UnknownText_0x9eaef
	jump UnknownScript_0x9e47a

UnknownScript_0x9f4eb:
	writebyte $4
	special Function170687
	loadfont
	writetext UnknownText_0x9f0c1
	closetext
	loadmovesprites
	end

UnknownScript_0x9f4f7:
	writebyte $4
	special Function170687
	writebyte $6
	special Function170687
	loadfont
	writetext UnknownText_0x9ea49
	writetext UnknownText_0x9ec09
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
	warp_def $7, $3, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $7, $4, 4, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 2
	person_event SPRITE_YOUNGSTER, 4, 8, OW_UP | $2, $0, -1, -1, $0, 0, ObjectEvent, EVENT_BATTLE_TOWER_BATTLE_ROOM_YOUNGSTER
	person_event SPRITE_RECEPTIONIST, 10, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, ObjectEvent, -1
