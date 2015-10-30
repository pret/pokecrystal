BattleTowerHallway_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x9f5bb, NONE
	dw UnknownScript_0x9f5c0, NONE

.MapCallbacks:
	db 0

UnknownScript_0x9f5bb:
	priorityjump UnknownScript_0x9f5c1
	dotrigger $1
UnknownScript_0x9f5c0:
	end

UnknownScript_0x9f5c1:
	follow $2, PLAYER
	callasm Function_0x9f5cb
	jump Script_WalkToChosenBattleRoom


Function_0x9f5cb:
	ld a, [rSVBK]
	push af

	ld a, 3
	ld [rSVBK], a
	ld a, [wBTChoiceOfLvlGroup]
	ld [ScriptVar], a

	pop af
	ld [rSVBK], a
	ret


; enter different rooms for different levels to battle against
; at least it should look like that
; because all warps lead to the same room
Script_WalkToChosenBattleRoom: ; 0x9f5dc
	if_equal 3, Script_WalkToBattleRoomL30L40
	if_equal 4, Script_WalkToBattleRoomL30L40
	if_equal 5, Script_WalkToBattleRoomL50L60
	if_equal 6, Script_WalkToBattleRoomL50L60
	if_equal 7, Script_WalkToBattleRoomL70L80
	if_equal 8, Script_WalkToBattleRoomL70L80
	if_equal 9, Script_WalkToBattleRoomL90L100
	if_equal 10, Script_WalkToBattleRoomL90L100
	applymovement $2, MovementData_0x9e57a
	jump Script_PlayerEntersBattleRoom

Script_WalkToBattleRoomL30L40: ; 0x9f603
	applymovement $2, MovementData_0x9e57c
	jump Script_PlayerEntersBattleRoom

Script_WalkToBattleRoomL50L60: ; 0x9f60a
	applymovement $2, MovementData_0x9e586
	jump Script_PlayerEntersBattleRoom

Script_WalkToBattleRoomL70L80: ; 0x9f611
	applymovement $2, MovementData_0x9e584
	jump Script_PlayerEntersBattleRoom

Script_WalkToBattleRoomL90L100: ; 0x9f618
	applymovement $2, MovementData_0x9e582
	jump Script_PlayerEntersBattleRoom

Script_PlayerEntersBattleRoom: ; 0x9f61f
	faceperson PLAYER, $2
	loadfont
	writetext Text_PleaseStepThisWay
	closetext
	loadmovesprites
	stopfollow
	applymovement PLAYER, MovementData_0x9e576
	warpcheck
	end

BattleTowerHallway_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 6
	warp_def $1, $b, 1, BATTLE_TOWER_ELEVATOR
	warp_def $0, $5, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $7, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $9, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $d, 1, BATTLE_TOWER_BATTLE_ROOM
	warp_def $0, $f, 1, BATTLE_TOWER_BATTLE_ROOM

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RECEPTIONIST, 2, 11, SPRITEMOVEFN_06, 0, 0, -1, -1, 0, 0, 0, BattleTowerHallway_MapEventHeader, -1
