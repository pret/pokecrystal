BattleTowerElevator_MapScriptHeader:
.MapTriggers:
	db 2

	; triggers
	dw .Trigger0, 0
	dw .Trigger1, 0

.MapCallbacks:
	db 0

.Trigger0:
	priorityjump .RideElevator
	dotrigger $1

.Trigger1:
	end

.RideElevator:
	follow $2, PLAYER
	applymovement $2, MovementData_BattleTowerElevatorReceptionistWalksIn
	applymovement PLAYER, MovementData_BattleTowerElevatorPlayerWalksIn
	writebyte BATTLETOWERACTION_0A
	special BattleTowerAction
	playsound SFX_ELEVATOR
	earthquake 60
	waitsfx
	follow $2, PLAYER
	applymovement $2, MovementData_BattleTowerElevatorExitElevator
	stopfollow
	warpsound
	disappear $2
	applymovement PLAYER, MovementData_BattleTowerElevatorExitElevator
	warpcheck
	end

MovementData_BattleTowerElevatorReceptionistWalksIn:
	step_right
	turn_head_down
	step_end

MovementData_BattleTowerElevatorPlayerWalksIn:
	turn_head_down
	step_end

BattleTowerElevator_MapEventHeader:
	; filler
	db 0, 0

.Warps:
	db 2
	warp_def $3, $1, 1, BATTLE_TOWER_HALLWAY
	warp_def $3, $2, 1, BATTLE_TOWER_HALLWAY

.XYTriggers:
	db 0

.Signposts:
	db 0

.PersonEvents:
	db 1
	person_event SPRITE_RECEPTIONIST, 2, 1, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, PERSONTYPE_SCRIPT, 0, MovementData_BattleTowerElevatorReceptionistWalksIn, -1
