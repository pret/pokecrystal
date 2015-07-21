BattleTowerElevator_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw UnknownScript_0x9f562, $0000
	dw UnknownScript_0x9f567, $0000

.MapCallbacks:
	db 0

UnknownScript_0x9f562:
	priorityjump UnknownScript_0x9f568
	dotrigger $1

UnknownScript_0x9f567:
	end

UnknownScript_0x9f568:
	follow $2, $0
	applymovement $2, MovementData_0x9f58f
	applymovement $0, MovementData_0x9f592
	writebyte $a
	special Function170687
	playsound SFX_ELEVATOR
	earthquake 60
	waitbutton
	follow $2, $0
	applymovement $2, MovementData_0x9e578
	stopfollow
	warpsound
	disappear $2
	applymovement $0, MovementData_0x9e578
	warpcheck
	end

MovementData_0x9f58f:
	step_right
	turn_head_down
	step_end

MovementData_0x9f592:
	turn_head_down
	step_end

BattleTowerElevator_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $1, 1, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY
	warp_def $3, $2, 1, GROUP_BATTLE_TOWER_HALLWAY, MAP_BATTLE_TOWER_HALLWAY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RECEPTIONIST, 6, 5, OW_LEFT | $1, $0, -1, -1, $0, 0, MovementData_0x9f58f, -1
